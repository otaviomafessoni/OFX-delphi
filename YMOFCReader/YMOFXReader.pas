unit YMOFXReader;

interface

uses classes, SysUtils, Controls;

type
  TOFXItem = class
    MovType  : String;
    MovDate  : TDate;
    Value    : Double;
    ID       : String;
    Document : String;
    Desc     : String;
  end;

  TYMOFXReader = class(TComponent)
  public
    BankID         : Integer;
    AccountID      : String;
    AccountType    : String;
    InitialBalance : Double;
    FinalBalance   : Double;
    constructor Create( AOwner: TComponent ); override;
    destructor Destroy; override;
    function Process: Boolean;
    function Get(iIndex: Integer): TOFXItem;
    function Count: Integer;
  private
    FOFXFile   : String;
    FListItems : TList;
    procedure Clear;
    procedure Delete( iIndex: integer );
    function Add: TOFXItem;
    function PrepareFloat( sString : String ) : String;
    function InfLine ( sLine : String ): String;
    function FindString ( sSubString, sString : String ): Boolean;
    function ReplaceString(sString: String; sOld: String; sNew: String; bInsensitive : Boolean = True): String;
  protected
  published
    property OFXFile: String read FOFXFile write FOFXFile;
  end;

procedure Register;

implementation

constructor TYMOFXReader.Create( AOwner: TComponent );
begin
  inherited Create(AOwner);
  FListItems := TList.Create;
end;

destructor TYMOFXReader.Destroy;
begin
  FListItems.Free;
  inherited Destroy;
end;

procedure TYMOFXReader.Delete( iIndex: integer );
begin
  TOFXItem(FListItems.Items[iIndex]).Free;
  FListItems.Delete( iIndex );
end;

procedure TYMOFXReader.Clear;
begin
  while FListItems.Count > 0 do
    Delete(0);
  FListItems.Clear;
end;

function TYMOFXReader.Count: integer;
begin
  Result := FListItems.Count;
end;

function TYMOFXReader.Get(iIndex: integer): TOFXItem;
begin
  Result := TOFXItem(FListItems.Items[iIndex]);
end;

function TYMOFXReader.Process: boolean;
var
  oFile    : TStringList;
  i        : Integer;
  bOFX     : Boolean;
  oItem    : TOFXItem;
  sLine    : String;
  dBalance : Double;
begin
  Result := False;
  Clear;
  bOFX := false;
  if not FileExists(FOFXFile) then
    exit;
  oFile := TStringList.Create;
  oFile.LoadFromFile(FOFXFile);
  dBalance := 0;
  i := 0;
  while i < oFile.Count do
  begin
    sLine := oFile.Strings[i];
//    if FindString('', sLine) then
//      bOFX := true;
//    if bOFX then
//    begin
      // -----------------------------------------------------------------------
      // BankID
      if FindString('FID', sLine) then
        BankID := StrToIntDef(InfLine(sLine), 0);
      // -----------------------------------------------------------------------
      // AccountID
      if FindString('ACCTID', sLine) then
        AccountID := InfLine(sLine);
      // -----------------------------------------------------------------------
      // AccountType
      if FindString('', sLine) then
        AccountType := InfLine(sLine);
      // -----------------------------------------------------------------------
      // FinalBalance
      if FindString('', sLine) then
        FinalBalance := StrToFloat(PrepareFloat(InfLine(sLine)));
      // -----------------------------------------------------------------------
      // Moviment
      if FindString('', sLine) then
      begin
        oItem := Add;
        Inc(i);
        sLine := oFile.Strings[i];
        if FindString('',  sLine) then
          oItem.MovType := InfLine(sLine);
        Inc(i);
        sLine := oFile.Strings[i];
        if FindString('', sLine) then
          oItem.MovDate := EncodeDate(StrToIntDef(copy(InfLine(sLine),1,4), 0),
                                      StrToIntDef(copy(InfLine(sLine),5,2), 0),
                                      StrToIntDef(copy(InfLine(sLine),7,2), 0));
        Inc(i);
        sLine := oFile.Strings[i];
        if FindString('',sLine) then
        begin
          oItem.Value := StrToFloat(PrepareFloat(InfLine(sLine)));
          dBalance := dBalance - oItem.Value;
        end;
        Inc(i);
        sLine := oFile.Strings[i];
        if FindString('',sLine) then
          oItem.ID := InfLine(sLine);
        Inc(i);
        sLine := oFile.Strings[i];
        if FindString('',sLine) then
          oItem.Document := InfLine(sLine);
        Inc(i);
        sLine := oFile.Strings[i];
        if FindString('',sLine) then // santanter tem isto...
        begin
          Inc(i);
          sLine := oFile.Strings[i];
        end;
        if FindString('',     sLine) then
          oItem.Desc := InfLine(sLine);
//        end;
//      end;
      // -----------------------------------------------------------------------
    end;
    Inc(i);
  end;
  InitialBalance := FinalBalance + dBalance;
  Result := bOFX;
end;

function TYMOFXReader.PrepareFloat( sString : string ) : string;
begin
  Result := sString;
  Result := ReplaceString(Result, '.', FormatSettings.DecimalSeparator);
  Result := ReplaceString(Result, ',', FormatSettings.DecimalSeparator);
end;

function TYMOFXReader.ReplaceString(sString: string; sOld: string; sNew: string; bInsensitive : boolean = true): string;
var
   iPosition : Integer ;
   sTempNew  : String ;
begin
   iPosition := 1;
   sTempNew := '';
   while (iPosition > 0) do
   begin
      if bInsensitive then
        iPosition := AnsiPos(UpperCase(sOld),UpperCase(sString))
      else
        iPosition := AnsiPos(sOld,sString);
      if (iPosition > 0) then
      begin
         sTempNew := sTempNew + copy(sString, 1, iPosition - 1) + sNew;
         sString := copy(sString, iPosition + Length(sOld), Length(sString) );
      end;
   end;
   sTempNew := sTempNew + sString;
   Result := (sTempNew);
end;

function TYMOFXReader.InfLine ( sLine : string ): string;
var
  iTemp  : Integer;
  iTemp2 : Integer;
  tam    : Integer;
begin
  Result := '';
  sLine := Trim(sLine);
  tam   := Length(sLine);
  if FindString('>', sLine) then
  begin
    sLine := Trim(sLine);
    iTemp := Pos('>', sLine);
  end;
  if FindString('<', Result) then
    Result := Copy(Result, 1, Pos('<', Result) - 1);
end;

function TYMOFXReader.Add: TOFXItem;
var
  oItem : TOFXItem;
begin
  oItem := TOFXItem.Create;
  FListItems.Add(oItem);
  Result := oItem;
end;

function TYMOFXReader.FindString ( sSubString, sString : string ): boolean;
begin
  Result := Pos(UpperCase(sSubString), UpperCase(sString)) > 0;
end;

procedure Register;
begin
  RegisterComponents('Infiniti', [TYMOFXReader]);
end;

end.
