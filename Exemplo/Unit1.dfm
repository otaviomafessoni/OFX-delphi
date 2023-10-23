object Form1: TForm1
  Left = 123
  Top = 5
  Caption = 'Form1'
  ClientHeight = 671
  ClientWidth = 1086
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 57
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 56
    Top = 31
    Width = 24
    Height = 13
    Caption = 'Valor'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 39
    Top = 54
    Width = 41
    Height = 13
    Caption = 'Historico'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 40
    Top = 77
    Width = 40
    Height = 13
    Caption = 'Registro'
    FocusControl = DBEdit4
  end
  object Label5: TLabel
    Left = 8
    Top = 101
    Width = 72
    Height = 13
    Caption = 'Debito_Credito'
    FocusControl = DBEdit5
  end
  object Label6: TLabel
    Left = 15
    Top = 128
    Width = 65
    Height = 33
    Caption = 'Saldo'
    FocusControl = DBEdit5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 5
    Top = 174
    Width = 77
    Height = 33
    Caption = 'D'#233'bito'
    FocusControl = DBEdit5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 303
    Top = 174
    Width = 85
    Height = 33
    Caption = 'Cr'#233'dito'
    FocusControl = DBEdit5
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object lst1: TListBox
    Left = 1000
    Top = 309
    Width = 65
    Height = 65
    ItemHeight = 13
    TabOrder = 0
  end
  object btn1: TBitBtn
    Left = 301
    Top = 125
    Width = 65
    Height = 40
    Caption = 'btn1'
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
    OnClick = btn1Click
  end
  object DBEdit1: TDBEdit
    Left = 86
    Top = 5
    Width = 134
    Height = 21
    DataField = 'Data'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 86
    Top = 28
    Width = 134
    Height = 21
    DataField = 'Valor'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 86
    Top = 51
    Width = 264
    Height = 21
    DataField = 'Historico'
    DataSource = DataSource1
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 86
    Top = 74
    Width = 264
    Height = 21
    DataField = 'Registro'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit5: TDBEdit
    Left = 86
    Top = 98
    Width = 264
    Height = 21
    DataField = 'Debito_Credito'
    DataSource = DataSource1
    TabOrder = 6
  end
  object wwDBGrid1: TwwDBGrid
    Left = 0
    Top = 217
    Width = 1086
    Height = 454
    Selected.Strings = (
      'Data'#9'10'#9'Data'
      'Valor'#9'10'#9'Valor'
      'Historico'#9'20'#9'Historico'
      'Registro'#9'20'#9'Registro'
      'Debito_Credito'#9'20'#9'Cr'#233'dito/Debito')
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alBottom
    DataSource = DataSource1
    TabOrder = 7
    TitleAlignment = taLeftJustify
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
  end
  object DBEdit6: TDBEdit
    Left = 86
    Top = 125
    Width = 209
    Height = 41
    DataField = 'Total'
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object CurrencyEdit1: TCurrencyEdit
    Left = 86
    Top = 170
    Width = 209
    Height = 41
    Margins.Left = 1
    Margins.Top = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object CurrencyEdit2: TCurrencyEdit
    Left = 392
    Top = 170
    Width = 209
    Height = 41
    Margins.Left = 1
    Margins.Top = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
  end
  object Chart1: TChart
    Left = 607
    Top = 5
    Width = 410
    Height = 206
    Title.Text.Strings = (
      'TChart')
    View3DOptions.Elevation = 315
    View3DOptions.Orthogonal = False
    View3DOptions.Perspective = 0
    View3DOptions.Rotation = 360
    TabOrder = 11
    ColorPaletteIndex = 10
    object psrsSeries1: TPieSeries
      Marks.Arrow.Visible = True
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Arrow.Visible = True
      Marks.Visible = True
      Gradient.Direction = gdRadial
      OtherSlice.Legend.Visible = False
      PiePen.Color = 42495
      PieValues.Name = 'Pie'
      PieValues.Order = loNone
    end
  end
  object YMOFXReader1: TYMOFXReader
    Left = 584
    Top = 376
  end
  object Cds_Lancamento: TClientDataSet
    Active = True
    Aggregates = <>
    AggregatesActive = True
    Params = <>
    Left = 520
    Top = 96
    Data = {
      A70000009619E0BD010000001800000005000000000003000000A70004446174
      6104000600000000000556616C6F720800040000000100075355425459504502
      00490006004D6F6E65790009486973746F7269636F0100490000000100055749
      44544802000200140008526567697374726F0100490000000100055749445448
      0200020014000E44656269746F5F4372656469746F0100490000000100055749
      4454480200020014000000}
    object Cds_LancamentoData: TDateField
      DisplayWidth = 10
      FieldName = 'Data'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object Cds_LancamentoValor: TCurrencyField
      DisplayWidth = 10
      FieldName = 'Valor'
      DisplayFormat = '#,#0.00'
    end
    object Cds_LancamentoHistorico: TStringField
      DisplayWidth = 20
      FieldName = 'Historico'
    end
    object Cds_LancamentoRegistro: TStringField
      DisplayWidth = 20
      FieldName = 'Registro'
    end
    object Cds_LancamentoDebito_Credito: TStringField
      DisplayLabel = 'Cr'#233'dito/Debito'
      DisplayWidth = 20
      FieldName = 'Debito_Credito'
    end
    object Cds_LancamentoTotal: TAggregateField
      Alignment = taRightJustify
      FieldName = 'Total'
      Active = True
      DisplayFormat = '#,#0.00'
      Expression = 'SUM(VALOR)'
    end
  end
  object DataSource1: TDataSource
    DataSet = Cds_Lancamento
    Left = 528
    Top = 40
  end
end
