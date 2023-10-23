unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, YMOFXReader, DB, DBClient, Grids, Wwdbigrd, Wwdbgrid, Mask, DBCtrls, rxToolEdit, rxCurrEdit, TeEngine, Series, ExtCtrls, TeeProcs, Chart, DBChart;

type
  TForm1 = class(TForm)
    YMOFXReader1: TYMOFXReader;
    lst1: TListBox;
    btn1: TBitBtn;
    Cds_Lancamento: TClientDataSet;
    Cds_LancamentoData: TDateField;
    Cds_LancamentoValor: TCurrencyField;
    Cds_LancamentoHistorico: TStringField;
    Cds_LancamentoRegistro: TStringField;
    Cds_LancamentoDebito_Credito: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    wwDBGrid1: TwwDBGrid;
    Cds_LancamentoTotal: TAggregateField;
    DBEdit6: TDBEdit;
    Label6: TLabel;
    CurrencyEdit1: TCurrencyEdit;
    CurrencyEdit2: TCurrencyEdit;
    Label7: TLabel;
    Label8: TLabel;
    Chart1: TChart;
    psrsSeries1: TPieSeries;
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
var
  i:integer;
  var_Total_Credito,var_Total_Debito : Currency;
begin
  YMOFXReader1.OFXFile := 'D:\Componentes 2010\OFx\Extrato18406273872.ofx'; //extrato.ofx';
  YMOFXReader1.Process;
  lst1.Clear;

  var_Total_Credito := 0;
  var_Total_Debito  := 0;

  for i := 0 to YMOFXReader1.Count-1 do
  begin
    with Cds_Lancamento do
      begin
        Insert;
        Cds_LancamentoData.AsDateTime         := YMOFXReader1.Get(i).MovDate;
        Cds_LancamentoValor.AsFloat           := YMOFXReader1.Get(i).Value;
        Cds_LancamentoHistorico.AsString      := YMOFXReader1.Get(i).Desc;
        Cds_LancamentoRegistro.AsString       := YMOFXReader1.Get(i).ID;
        Cds_LancamentoDebito_Credito.AsString := YMOFXReader1.Get(i).MovType;

        if Cds_LancamentoDebito_Credito.AsString = 'DEBIT' then
           var_Total_Debito  := var_Total_Debito + Cds_LancamentoValor.AsFloat
        else
           var_Total_Credito := var_Total_Credito + Cds_LancamentoValor.AsFloat;


        Post;
      end;

    lst1.Items.Add(YMOFXReader1.Get(i).Desc + ' ' +
                       FloatToStr(YMOFXReader1.Get(i).Value) + ' ' +
                       YMOFXReader1.Get(i).MovType + ' ' +
                       dateToStr(YMOFXReader1.Get(i).MovDate) + ' ' +
                       YMOFXReader1.Get(i).ID + ' ' +
                       YMOFXReader1.Get(i).Document + ' '  );
  end;

  CurrencyEdit1.Value  := var_Total_Debito;
  CurrencyEdit2.Value  := var_Total_Credito;

With Chart1.Series[0] do
   Begin
          Clear ;
          Add( CurrencyEdit2.Value, 'Credito' , clBlue    ) ;
          Add( CurrencyEdit1.Value, 'Debito', clRed     ) ;
   end;


end;

end.
