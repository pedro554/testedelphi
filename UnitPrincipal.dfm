object Form_Principal: TForm_Principal
  Left = 0
  Top = 0
  Caption = 'Form_Principal'
  ClientHeight = 691
  ClientWidth = 841
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 841
    Height = 57
    Align = alTop
    Caption = 'Panel1'
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 5
      Width = 88
      Height = 13
      Caption = 'Pesquisar (Nome):'
    end
    object edtPesquisar: TEdit
      Left = 16
      Top = 24
      Width = 257
      Height = 21
      TabOrder = 0
    end
    object btnPesquisar: TButton
      Left = 279
      Top = 20
      Width = 75
      Height = 25
      Caption = 'Pesquisar'
      TabOrder = 1
      OnClick = btnPesquisarClick
    end
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 835
    Height = 571
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel2: TPanel
    Left = 0
    Top = 634
    Width = 841
    Height = 57
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 2
    object btnExcluir: TButton
      Left = 765
      Top = 1
      Width = 75
      Height = 55
      Align = alRight
      Caption = 'Exclu'#237'r (F4)'
      TabOrder = 0
      OnClick = btnExcluirClick
    end
    object btnSair: TButton
      Left = 540
      Top = 1
      Width = 75
      Height = 55
      Align = alRight
      Caption = 'Sair (ESC)'
      TabOrder = 1
    end
    object btnCadastro: TButton
      Left = 615
      Top = 1
      Width = 75
      Height = 55
      Align = alRight
      Caption = 'Cadastrar (F1)'
      TabOrder = 2
      OnClick = btnCadastroClick
    end
    object btnEditar: TButton
      Left = 690
      Top = 1
      Width = 75
      Height = 55
      Align = alRight
      Caption = 'Editar (F2)'
      TabOrder = 3
      OnClick = btnEditarClick
    end
  end
  object DataSource1: TDataSource
    Left = 416
    Top = 352
  end
  object MainMenu1: TMainMenu
    Left = 288
    Top = 240
    object Relatrios1: TMenuItem
      Caption = 'Relat'#243'rios'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
    end
  end
  object relCliente: TfrxReport
    Version = '6.9.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44792.699591979200000000
    ReportOptions.LastChange = 44792.719845347200000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 232
    Top = 352
    Datasets = <
      item
        DataSet = dsCliente
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 3.000000000000000000
      RightMargin = 3.000000000000000000
      TopMargin = 3.000000000000000000
      BottomMargin = 3.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 771.024120000000000000
        object Memo1: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Width = 771.024120000000000000
          Height = 37.795300000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio de clientes')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        Height = 60.472480000000000000
        ParentFont = False
        Top = 117.165430000000000000
        Width = 771.024120000000000000
        DataSet = dsCliente
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Top = 7.559060000000000000
          Width = 771.024120000000000000
          Height = 49.133890000000000000
          Frame.Typ = []
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 260.787570000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome: [frxDBDataset1."nome"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF: [frxDBDataset1."cpf"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 275.905690000000000000
          Top = 18.897650000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RG: [frxDBDataset1."rg"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 468.661720000000000000
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'M'#227'e: [frxDBDataset1."mae"]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 18.897650000000000000
          Width = 143.622140000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pai: [frxDBDataset1."pai"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 612.283860000000000000
          Top = 37.795300000000000000
          Width = 151.181200000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP: [frxDBDataset1."cep"]')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 222.992270000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o: [frxDBDataset1."endereco"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 37.795300000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero: [frxDBDataset1."numero"]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 328.819110000000000000
          Top = 37.795300000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade: [frxDBDataset1."cidade"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 521.575140000000000000
          Top = 37.795300000000000000
          Width = 83.149660000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Estado: [frxDBDataset1."estado"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 763.465060000000000000
          Height = 15.118120000000000000
          DataSet = dsCliente
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Fill.BackColor = cl3DLight
          Memo.UTF8W = (
            'C'#243'd: [frxDBDataset1."id"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 45.354360000000000000
        Top = 200.315090000000000000
        Width = 771.024120000000000000
        object Memo2: TfrxMemoView
          Align = baWidth
          AllowVectorExport = True
          Top = 26.456710000000000000
          Width = 771.024120000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total de clientes cadastrados: [COUNT(MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object dsCliente: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    BCDToCurrency = False
    Left = 224
    Top = 416
  end
end
