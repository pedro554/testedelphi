object Form_Cadastro: TForm_Cadastro
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 400
  ClientWidth = 800
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 794
    Height = 81
    Align = alTop
    Caption = 'Informa'#231#245'es Principais'
    TabOrder = 0
    ExplicitLeft = 8
    object Label1: TLabel
      Left = 85
      Top = 19
      Width = 31
      Height = 13
      Caption = 'Nome:'
    end
    object Label2: TLabel
      Left = 420
      Top = 19
      Width = 23
      Height = 13
      Caption = 'CPF:'
    end
    object Label3: TLabel
      Left = 565
      Top = 19
      Width = 18
      Height = 13
      Caption = 'RG:'
    end
    object Label11: TLabel
      Left = 16
      Top = 19
      Width = 37
      Height = 13
      Caption = 'C'#243'digo:'
    end
    object edtNome: TEdit
      Left = 85
      Top = 38
      Width = 329
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
    object edtCPF: TMaskEdit
      Left = 420
      Top = 38
      Width = 138
      Height = 21
      EditMask = '###.###.###-##;1;_'
      MaxLength = 14
      TabOrder = 2
      Text = '   .   .   -  '
    end
    object edtRG: TEdit
      Left = 564
      Top = 38
      Width = 105
      Height = 21
      MaxLength = 50
      NumbersOnly = True
      TabOrder = 3
    end
    object edtCodigo: TEdit
      Left = 16
      Top = 38
      Width = 63
      Height = 21
      MaxLength = 50
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 350
    Width = 800
    Height = 50
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 3
    object btnSair: TButton
      Left = 599
      Top = 1
      Width = 100
      Height = 48
      Align = alRight
      Caption = 'Sair (ESC)'
      TabOrder = 0
      OnClick = btnSairClick
    end
    object btnGravar: TButton
      Left = 699
      Top = 1
      Width = 100
      Height = 48
      Align = alRight
      Caption = 'Gravar (F1)'
      TabOrder = 1
      OnClick = btnGravarClick
    end
  end
  object GroupBox2: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 90
    Width = 794
    Height = 120
    Align = alTop
    Caption = 'Informa'#231#245'es do endere'#231'o'
    TabOrder = 1
    object Label6: TLabel
      Left = 271
      Top = 63
      Width = 23
      Height = 13
      Caption = 'CEP:'
    end
    object Label7: TLabel
      Left = 16
      Top = 65
      Width = 41
      Height = 13
      Caption = 'Numero:'
    end
    object Label8: TLabel
      Left = 16
      Top = 19
      Width = 37
      Height = 13
      Caption = 'Cidade:'
    end
    object Label9: TLabel
      Left = 127
      Top = 65
      Width = 37
      Height = 13
      Caption = 'Estado:'
    end
    object Label10: TLabel
      Left = 351
      Top = 19
      Width = 49
      Height = 13
      Caption = 'Endere'#231'o:'
    end
    object edtNumero: TEdit
      Left = 16
      Top = 82
      Width = 105
      Height = 21
      MaxLength = 50
      NumbersOnly = True
      TabOrder = 2
    end
    object edtCidade: TEdit
      Left = 16
      Top = 36
      Width = 329
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
    object edtCEP: TMaskEdit
      Left = 271
      Top = 82
      Width = 138
      Height = 21
      EditMask = '#####-###'
      MaxLength = 9
      TabOrder = 4
      Text = '     -   '
    end
    object cbEstado: TComboBox
      Left = 127
      Top = 82
      Width = 138
      Height = 21
      ItemIndex = 0
      MaxLength = 2
      TabOrder = 3
      Text = 'RO'
      Items.Strings = (
        'RO'
        'AC'
        'AM'
        'RR'
        'PA'
        'AP'
        'TO'
        'MA'#9
        'PI'
        'CE'
        'RN'
        'PB'
        'PE'
        'AL'
        'SE'
        'BA'
        'MG'
        'ES'
        'RJ'
        'SP'
        'PR'
        'SC'
        'RS'
        'MS'
        'MT'
        'GO'
        'DF')
    end
    object edtEndereco: TEdit
      Left = 351
      Top = 36
      Width = 329
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
  end
  object GroupBox3: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 216
    Width = 794
    Height = 80
    Align = alTop
    Caption = 'Informa'#231#245'es adicionais'
    TabOrder = 2
    object Label4: TLabel
      Left = 351
      Top = 19
      Width = 69
      Height = 13
      Caption = 'Nome da m'#227'e:'
    end
    object Label5: TLabel
      Left = 16
      Top = 19
      Width = 63
      Height = 13
      Caption = 'Nome da pai:'
    end
    object edtNomeMae: TEdit
      Left = 351
      Top = 38
      Width = 329
      Height = 21
      MaxLength = 50
      TabOrder = 1
    end
    object edtNomePai: TEdit
      Left = 16
      Top = 38
      Width = 329
      Height = 21
      MaxLength = 50
      TabOrder = 0
    end
  end
end
