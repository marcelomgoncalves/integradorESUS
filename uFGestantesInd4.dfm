object FGestantesInd4: TFGestantesInd4
  Left = 0
  Top = 0
  Caption = 'Cidad'#227'os Cadastrados no e-SUS '
  ClientHeight = 546
  ClientWidth = 1087
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1087
    Height = 41
    Align = alTop
    Caption = 
      'EXAMES CITOPATOL'#211'GICOS REALIZADOS  EM MULHERES DE 25 A 64 ANOS N' +
      'OS '#218'LTIMOS 3 ANOS - INDICADOR 4'
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 1087
    Height = 223
    Align = alClient
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 2
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 68
      Width = 1085
      Height = 154
      Hint = ''
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      OnChange = RzPageControl1Change
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Indicador 4 - Dentro do Indicador'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1081
          Height = 103
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsIndicador4Dentro
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid1DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CNS'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADAO_NOME'
              Title.Caption = 'Nome do Cidad'#227'(o)'
              Width = 344
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASCIMENTO'
              Title.Caption = 'Data Nascto'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDADEATUAL'
              Title.Caption = 'Idade'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE_EXAMES'
              Title.Caption = 'Qtd. Exames'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_ULT_EXAME'
              Title.Caption = 'Dt. '#218'lt. Exame'
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PROXIMO_EXAME'
              Title.Caption = 'Dt. Pr'#243'x. Exame'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_MICRO_AREA'
              Title.Caption = 'MA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_EQUIPE'
              Title.Caption = 'Nome da Equipe'
              Width = 331
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_UNIDADE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 347
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 103
          Width = 1081
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 1
          object lblRegDentro: TLabel
            Left = 1
            Top = 1
            Width = 159
            Height = 26
            Align = alLeft
            Caption = 'Total de Registros Selecionados: '
            Layout = tlCenter
            ExplicitHeight = 13
          end
          object lblnroexames: TLabel
            Left = 711
            Top = 1
            Width = 369
            Height = 26
            Align = alRight
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Total de Exames Citopat'#243'gicos Realizados:0000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
          end
        end
      end
      object TabSheet2: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Indicador 4 - Fora do Indicador'
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 1081
          Height = 103
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsIndicador4Fora
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid1DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CNS'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADAO_NOME'
              Title.Caption = 'Nome do Cidad'#227'(o)'
              Width = 344
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASCIMENTO'
              Title.Caption = 'Data Nascto'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDADEATUAL'
              Title.Caption = 'Idade'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_MICRO_AREA'
              Title.Caption = 'MA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_EQUIPE'
              Title.Caption = 'Nome da Equipe'
              Width = 331
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_UNIDADE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 347
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 103
          Width = 1081
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 1
          object lblregFora: TLabel
            Left = 1
            Top = 1
            Width = 159
            Height = 26
            Align = alLeft
            Caption = 'Total de Registros Selecionados: '
            Layout = tlCenter
            ExplicitHeight = 13
          end
        end
      end
      object TabSheet3: TRzTabSheet
        Color = clInactiveBorder
        Caption = 
          'Indicador 4 - Mulheres com exames Realizados Dentro do Quadrimes' +
          'tre'
        object DBGrid3: TDBGrid
          Left = 0
          Top = 0
          Width = 1081
          Height = 103
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsIndicador4DentroQuad
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid1DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CNS'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADAO_NOME'
              Title.Caption = 'Nome do Cidad'#227'(o)'
              Width = 344
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASCIMENTO'
              Title.Caption = 'Data Nascto'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDADEATUAL'
              Title.Caption = 'Idade'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'QTDE_EXAMES'
              Title.Caption = 'Qtde. Exames'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_ULT_EXAME'
              Title.Caption = 'Dt. '#218'lt. Exame '
              Width = 101
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PROXIMO_EXAME'
              Title.Caption = 'Dt. Pr'#243'x. Exame'
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_MICRO_AREA'
              Title.Caption = 'MA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_EQUIPE'
              Title.Caption = 'Nome da Equipe'
              Width = 331
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_UNIDADE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 347
              Visible = True
            end>
        end
        object Panel10: TPanel
          Left = 0
          Top = 103
          Width = 1081
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 1
          object lblRegQuad: TLabel
            Left = 1
            Top = 1
            Width = 159
            Height = 26
            Align = alLeft
            Caption = 'Total de Registros Selecionados: '
            Layout = tlCenter
            ExplicitHeight = 13
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1085
      Height = 67
      Align = alTop
      Color = clInactiveBorder
      ParentBackground = False
      TabOrder = 1
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 747
        Height = 59
        Align = alClient
        Color = clInactiveBorder
        ParentBackground = False
        TabOrder = 0
        object Panel12: TPanel
          Left = 531
          Top = 1
          Width = 215
          Height = 57
          Align = alRight
          TabOrder = 0
          object lblIndice: TLabel
            Left = 1
            Top = 22
            Width = 213
            Height = 34
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -27
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Layout = tlCenter
            ExplicitTop = 24
            ExplicitWidth = 322
          end
          object Panel13: TPanel
            Left = 1
            Top = 1
            Width = 213
            Height = 19
            Align = alTop
            Caption = 'INDICADOR 4'
            Color = clActiveCaption
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object Panel15: TPanel
          Left = 1
          Top = 1
          Width = 530
          Height = 57
          Align = alClient
          TabOrder = 1
          object lblNumerador: TLabel
            Left = 1
            Top = 1
            Width = 528
            Height = 21
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 522
          end
          object Label32: TLabel
            Left = 1
            Top = 22
            Width = 528
            Height = 14
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Caption = 
              '----------------------------------------------------------------' +
              '-------------------------------------------------------------'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitTop = 23
            ExplicitWidth = 522
          end
          object lblDenominador: TLabel
            Left = 1
            Top = 30
            Width = 528
            Height = 26
            Align = alBottom
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitTop = 29
            ExplicitWidth = 522
          end
        end
      end
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 757
        Top = 4
        Width = 324
        Height = 59
        Align = alRight
        TabOrder = 1
        object lblDenom_Estimado: TLabel
          Left = 1
          Top = 24
          Width = 322
          Height = 34
          Align = alBottom
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object Panel14: TPanel
          Left = 1
          Top = 1
          Width = 322
          Height = 19
          Align = alTop
          Caption = 'DENOMINADOR ESTIMADO'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 41
    Width = 1087
    Height = 104
    Align = alTop
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 171
      Top = 57
      Width = 63
      Height = 13
      Caption = 'Buscar por:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 15
      Top = 9
      Width = 67
      Height = 13
      Caption = 'Data Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 144
      Top = 9
      Width = 59
      Height = 13
      Caption = 'Data Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 369
      Top = 57
      Width = 138
      Height = 13
      Caption = 'Termo a ser pesquisado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 449
      Top = 9
      Width = 49
      Height = 13
      Caption = 'Unidade:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 16
      Top = 57
      Width = 76
      Height = 13
      Caption = 'Micro Regi'#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 272
      Top = 9
      Width = 73
      Height = 13
      Caption = 'Idade Inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 360
      Top = 9
      Width = 65
      Height = 13
      Caption = 'Idade Final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbBuscarpor: TRzComboBox
      Left = 171
      Top = 72
      Width = 192
      Height = 21
      Style = csDropDownList
      TabOrder = 0
      Text = 'Nome do Cidad'#227'o'
      Items.Strings = (
        'Nome do Cidad'#227'o'
        'CPF'
        'CNS')
      ItemIndex = 0
      Values.Strings = (
        '0'
        '1'
        '2')
    end
    object RzBitBtn1: TRzBitBtn
      Left = 837
      Top = 25
      Width = 121
      Height = 73
      Caption = '&Pesquisar'
      TabOrder = 1
      OnClick = RzBitBtn1Click
    end
    object edTermo: TEdit
      Left = 369
      Top = 72
      Width = 462
      Height = 21
      TabOrder = 2
    end
    object cbUnidade: TRzComboBox
      Left = 449
      Top = 24
      Width = 382
      Height = 21
      TabOrder = 3
    end
    object cbMA: TRzComboBox
      Left = 16
      Top = 72
      Width = 149
      Height = 21
      TabOrder = 4
    end
    object edDataInicial: TRzDateTimeEdit
      Left = 16
      Top = 24
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 5
    end
    object edDataFinal: TRzDateTimeEdit
      Left = 144
      Top = 24
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 6
    end
    object edIdadeInicial: TEdit
      Left = 272
      Top = 24
      Width = 81
      Height = 21
      TabOrder = 7
      Text = '25'
    end
    object edIdadeFinal: TEdit
      Left = 360
      Top = 24
      Width = 81
      Height = 21
      TabOrder = 8
      Text = '64'
    end
  end
  object Panel7: TPanel
    Left = 0
    Top = 368
    Width = 1087
    Height = 178
    Align = alBottom
    TabOrder = 3
    object RzPageControl2: TRzPageControl
      Left = 1
      Top = 1
      Width = 1085
      Height = 176
      Hint = ''
      ActivePage = TabSheet6
      Align = alClient
      TabIndex = 1
      TabOrder = 0
      FixedDimension = 19
      object TabSheet4: TRzTabSheet
        Caption = 'Detalhamento dos dados'
        object GridPanel1: TGridPanel
          Left = 0
          Top = 0
          Width = 1081
          Height = 153
          Align = alClient
          ColumnCollection = <
            item
              Value = 84.004474353398790000
            end
            item
              Value = 15.995525646601210000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = Panel11
              Row = 0
            end
            item
              Column = 1
              Control = SpeedButton1
              Row = 0
            end>
          RowCollection = <
            item
              Value = 100.000000000000000000
            end>
          TabOrder = 0
          DesignSize = (
            1081
            153)
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 906
            Height = 151
            Align = alClient
            TabOrder = 0
            object Label12: TLabel
              Left = 403
              Top = 3
              Width = 65
              Height = 13
              Caption = 'Nome da M'#227'e'
            end
            object Label13: TLabel
              Left = 379
              Top = 45
              Width = 45
              Height = 13
              Caption = 'Faleceu ?'
            end
            object Label14: TLabel
              Left = 710
              Top = 45
              Width = 24
              Height = 13
              Caption = 'Sexo'
            end
            object Label15: TLabel
              Left = 438
              Top = 45
              Width = 52
              Height = 13
              Caption = 'Data '#211'bito'
            end
            object Label19: TLabel
              Left = 101
              Top = 45
              Width = 84
              Height = 13
              Caption = 'CNS Respons'#225'vel'
            end
            object Label20: TLabel
              Left = 248
              Top = 45
              Width = 98
              Height = 13
              Caption = 'CPF do Respons'#225'vel'
            end
            object Label23: TLabel
              Left = 544
              Top = 45
              Width = 67
              Height = 13
              Caption = 'Cidad'#227'o Ativo'
            end
            object Label24: TLabel
              Left = 617
              Top = 45
              Width = 83
              Height = 13
              Caption = 'Cad. Ind. Inativo'
            end
            object Label25: TLabel
              Left = 6
              Top = 45
              Width = 59
              Height = 13
              Caption = 'Data Nascto'
            end
            object Label29: TLabel
              Left = 286
              Top = 3
              Width = 42
              Height = 13
              Caption = 'Telefone'
            end
            object Label30: TLabel
              Left = 6
              Top = 3
              Width = 20
              Height = 13
              Caption = 'CNS'
            end
            object Label31: TLabel
              Left = 152
              Top = 3
              Width = 19
              Height = 13
              Caption = 'CPF'
            end
            object Label9: TLabel
              Left = 6
              Top = 90
              Width = 81
              Height = 13
              Caption = 'Exame Realizado'
            end
            object Label10: TLabel
              Left = 248
              Top = 90
              Width = 96
              Height = 13
              Caption = 'Descri'#231#227'o do Exame'
            end
            object edNomeMae: TEdit
              Left = 403
              Top = 18
              Width = 424
              Height = 21
              Enabled = False
              TabOrder = 0
            end
            object edSexo: TEdit
              Left = 710
              Top = 61
              Width = 117
              Height = 21
              Enabled = False
              TabOrder = 1
            end
            object edDtNascto: TEdit
              Left = 6
              Top = 61
              Width = 89
              Height = 21
              Enabled = False
              TabOrder = 2
            end
            object edCNSResp: TEdit
              Left = 101
              Top = 61
              Width = 141
              Height = 21
              Enabled = False
              TabOrder = 3
            end
            object edCPFResp: TEdit
              Left = 248
              Top = 61
              Width = 126
              Height = 21
              Enabled = False
              TabOrder = 4
            end
            object edCidFaleceu: TEdit
              Left = 380
              Top = 61
              Width = 52
              Height = 21
              Enabled = False
              TabOrder = 5
            end
            object edDtObito: TEdit
              Left = 438
              Top = 61
              Width = 100
              Height = 21
              Enabled = False
              TabOrder = 6
            end
            object edCidAtivo: TEdit
              Left = 544
              Top = 61
              Width = 67
              Height = 21
              Enabled = False
              TabOrder = 7
            end
            object edCIndInativo: TEdit
              Left = 617
              Top = 61
              Width = 86
              Height = 21
              Enabled = False
              TabOrder = 8
            end
            object edTelefone: TEdit
              Left = 286
              Top = 18
              Width = 111
              Height = 21
              Enabled = False
              TabOrder = 9
            end
            object edCNS: TEdit
              Left = 7
              Top = 18
              Width = 139
              Height = 21
              Enabled = False
              TabOrder = 10
            end
            object edCPF: TEdit
              Left = 153
              Top = 18
              Width = 127
              Height = 21
              Enabled = False
              TabOrder = 11
            end
            object edProcedimentos: TEdit
              Left = 6
              Top = 107
              Width = 236
              Height = 21
              Enabled = False
              TabOrder = 12
            end
            object edDscExame: TEdit
              Left = 248
              Top = 107
              Width = 579
              Height = 21
              Enabled = False
              TabOrder = 13
            end
          end
          object SpeedButton1: TSpeedButton
            Left = 929
            Top = 1
            Width = 129
            Height = 151
            Anchors = [akLeft, akTop, akRight]
            Flat = True
            Glyph.Data = {
              B6110000424DB611000000000000360000002800000020000000230000000100
              2000000000008011000000000000000000000000000000000000000000000000
              00000000000010101014868686A8888888AA888888AA888888AA888888AA8888
              88AA888888AA888888AA888888AA888888AA888888AA888888AA888888AA8888
              88AA888888AA888888AA888888AA888888AA888888AA888888AA888888AA8888
              88AA888888AA878787A91D1D1D24000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFF3C3C3C4B000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFF3E3E3E4D000000000000000000000000000000000000
              0000000000001818181ECACACAFCCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFF3D3D3D4C000000000000000000000000000000000000
              00000000000012121212D3CED3FDD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0
              D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0
              D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0D5FFD5D0
              D5FFD5D0D5FFD5D0D5FF3D373D3F0000000000000000000000001B3719632554
              239925532398366933B7679F64FE67A064FF67A064FF67A064FF67A064FF67A0
              64FF67A064FF67A064FF67A064FF67A064FF67A064FF67A064FF67A064FF67A0
              64FF67A064FF67A064FF67A064FF67A064FF67A064FF67A064FF67A064FF67A0
              64FF67A064FF67A065FF3B6E38BD255323982555229A1F401E72346D31C23D8E
              39FF3D8E39FF3B8D37FF348A30FF348A30FF348A30FF348A30FF348A30FF348A
              30FF348A30FF348A30FF348A30FF348A30FF348A30FF348A30FF348A30FF348A
              30FF348A30FF348A30FF348A30FF348A30FF348A30FF348A30FF348A30FF348A
              30FF348A30FF348A30FF3A8D36FF3D8E39FF3D8E39FF3A7D37DE30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3C8E38FF3C8E38FF3D8E39FF3D8E39FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF357433CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3C8E38FF348A2FFF388C
              34FF3E8F3BFF388C34FF338A2FFF3D8E39FF368B32FF348A2FFF348A30FF338A
              2FFF378C32FF3C8E38FF32892EFF378B32FF378A32FF32892EFF3B8D37FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF357433CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF378B33FF569952FFAFC1AEFF599A
              55FF2C8627FF589955FFAFC1AEFF549851FF85AE83FFADBFACFFAEBFADFFB4C2
              B3FF8CB18AFF33882EFF83AD81FFBAC5B9FFBAC4B9FF88AE85FF3B8C37FF3C8E
              38FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF357433CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3C8E38FF378A32FFADBFACFFBFC7
              BEFF398A35FFBDC6BCFFAEBFADFF31872CFFBAC5B9FFAEBFADFF71A470FF7CA9
              7BFF5D9C5AFF7EAA7CFFDED5DEFF73A570FF6BA269FFD1CFD1FF7EAA7BFF3289
              2EFF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF367533CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF388C34FF469142FFC4CA
              C4FFBEC5BDFFC4CAC4FF459141FF32892EFFB9C4B8FF87AE85FF268421FF3289
              2EFF31882CFF69A265FF5F9C5CFF2C8627FF499245FFC8CBC8FF92B48FFF3088
              2CFF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF377533CD30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3E8E3AFF2D8628FF79A8
              76FFEDDCEEFF7CA979FF2B8627FF388C34FFB8C4B7FF8CB08AFF31892DFF3D8E
              39FF3D8E39FF32882DFF78A775FFC6CAC5FFD6D1D6FFAEC0ADFF4A9345FF398C
              35FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF377533CE30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3B8D36FF398B34FFB1C1
              B1FFCDCECDFFB6C2B5FF3B8C37FF358A30FFB8C4B7FF8CB08AFF31892DFF3D8E
              39FF338A2FFF70A56DFFD7D1D7FF7CA879FF50964CFF559852FF459140FF3B8D
              37FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF367533CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF348A30FF94B493FFCCCD
              CCFF489244FFC5CBC5FF9AB798FF2E8629FFC1C8C0FF91B390FF31882CFF3D8E
              39FF348A30FF6FA36CFFD1CFD2FF679F65FF7EAA7CFFDBD4DBFF619D5DFF358A
              31FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF357433CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3A8D36FF459242FFA2BCA2FF68A0
              65FF2A8525FF639F5FFFA4BCA3FF459141FF84AD82FF6DA36BFF368B32FF3D8E
              39FF3C8E38FF398C35FF7EAA7BFFB5C2B4FFB2C2B1FF73A570FF378B33FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF357433CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF348A30FF368B
              32FF3E8F3AFF378B33FF348A2FFF3E8E3AFF34892FFF378B33FF3E8E3AFF3D8E
              39FF3D8E39FF3C8E38FF33892EFF358A31FF348A30FF348A30FF3D8E39FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF357433CF30662DB53D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E
              39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF3D8E39FF357433CF336D30C23D8E
              39FF3D8E39FF3B8D37FF33892FFF33892FFF33892FFF33892FFF33892FFF3389
              2FFF33892FFF33892FFF33892FFF33892FFF33892FFF33892FFF33892FFF3389
              2FFF33892FFF33892FFF33892FFF33892FFF33892FFF33892FFF33892FFF3389
              2FFF33892FFF33892FFF3A8D36FF3D8E39FF3D8E39FF397C37DE1833175C2150
              1E9421501F93326430B06CA169FE6CA269FF6CA269FF6CA269FF6CA269FF6CA2
              69FF6CA269FF6CA269FF6CA269FF6CA269FF6CA269FF6CA269FF6CA269FF6CA2
              69FF6CA269FF6CA269FF6CA269FF6CA269FF6CA269FF6CA269FF6CA269FF6CA2
              69FF6CA269FF6DA26AFF396B36B821501F9321501F941D3C1C6B000000000000
              00000000000010101010D3CFD4FCD6D1D7FFD6D1D7FFD6D1D6FFD8D3D9FFDDD7
              DDFFDCD7DCFFDCD7DCFFDCD7DCFFDCD7DCFFDCD7DCFFDCD7DCFFDCD7DCFFDCD7
              DCFFDCD7DCFFDCD7DDFFDCD7DCFFDCD7DCFFDDD7DDFFD9D3D9FFD6D1D6FFD6D1
              D7FFD6D1D7FFD6D1D7FF3D373D3F000000000000000000000000000000000000
              0000000000001818181ECACACAFCCCCCCCFFCCCCCCFFCECECEFFC2C2C2FFAAAA
              AAFFACACACFFACACACFFACACACFFACACACFFACACACFFACACACFFACACACFFACAC
              ACFFACACACFFACACACFFACACACFFACACACFFA9A9A9FFBFBFBFFFCFCFCFFFCCCC
              CCFFCCCCCCFFCCCCCCFF3D3D3D4C000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFD2D2D2FFB2B2B2FF7777
              77FF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D
              7DFF7D7D7DFF7D7D7DFF7D7D7DFF7D7D7DFF777777FFABABABFFD2D2D2FFCCCC
              CCFFCCCCCCFFCCCCCCFF3E3E3E4D000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCECECEFFD2D2
              D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
              D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFCECECEFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFF3E3E3E4D000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCECECEFFC1C1C1FFA9A9
              A9FFABABABFFABABABFFABABABFFABABABFFABABABFFABABABFFABABABFFABAB
              ABFFABABABFFABABABFFABABABFFABABABFFA8A8A8FFBFBFBFFFCECECEFFCCCC
              CCFFCCCCCCFFCCCCCCFF3E3E3E4D000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFD2D2D2FFB2B2B2FF7878
              78FF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E
              7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF777777FFACACACFFD2D2D2FFCCCC
              CCFFCCCCCCFFCCCCCCFF3E3E3E4D000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCECECEFFD2D2
              D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2D2FFD2D2
              D2FFD2D2D2FFCCCCCCFFCBCBCBFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFF3E3E3E4D000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCFCFCFFFC0C0C0FFA7A7
              A7FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9A9FFA9A9
              A9FFAAAAAAFFC8C8C8FFCECECEFFCDCDCDFFCDCDCDFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFF3E3E3E4D000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFD2D2D2FFB2B2B2FF7979
              79FF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7E7E7EFF7D7D
              7DFF7F7F7FFFC2C2C2FFCFCFCFFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFF42424252000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCDCD
              CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
              CDFFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFAFAFAFDB1616161B000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCDCD
              CDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCDCDFFCDCD
              CDFFCDCDCDFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFAEAEAEDA1515151A00000000000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFADAD
              ADD8141414190000000000000000000000000000000000000000000000000000
              0000000000001919191FCACACAFDCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFACACACD71313
              1318000000000000000000000000000000000000000000000000000000000000
              0000000000001717171DCACACAFCCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCC
              CCFFCCCCCCFFCCCCCCFFCCCCCCFFCCCCCCFFCBCBCBFE9E9E9EC5111111150000
              0000000000000000000000000000000000000000000000000000000000000000
              0000000000000808080A7C7C7C9B868686A7868686A7868686A7868686A78686
              86A7868686A7868686A7868686A7868686A7868686A7868686A7868686A78686
              86A7868686A7868686A7868686A7868686A77E7E7E9E12121217000000000000
              0000000000000000000000000000000000000000000000000000}
            OnClick = SpeedButton1Click
          end
        end
      end
      object TabSheet6: TRzTabSheet
        Caption = 'Detalhes dos Exames Citopatol'#243'gicos Realizados'
        object DBGrid4: TDBGrid
          Left = 0
          Top = 0
          Width = 1081
          Height = 153
          Align = alClient
          DataSource = dsDetExamesRealizados
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NU_CBO'
              Title.Caption = 'CBO'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NO_CBO'
              Title.Caption = 'Descri'#231#227'o CBO'
              Width = 298
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CO_DIM_TEMPO'
              Title.Caption = 'Data'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROCEDIMENTO'
              Title.Caption = 'C'#243'd. do Exame'
              Width = 149
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNS_PROFISSIONAL'
              Title.Caption = 'CNS Profissional'
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NO_PROFISSIONAL'
              Title.Caption = 'Nome do Profissional'
              Width = 232
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NU_INE'
              Title.Caption = 'INE'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NO_EQUIPE'
              Title.Caption = 'Nome da Equipe'
              Width = 221
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NO_UNIDADE_SAUDE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 312
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORIGEMDADOS'
              Title.Caption = 'Tabela de Origem'
              Visible = True
            end>
        end
      end
    end
  end
  object qryUnidade: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      
        'select co_seq_dim_unidade_saude, no_unidade_saude from tb_dim_un' +
        'idade_saude order by co_seq_dim_unidade_saude')
    Left = 880
    Top = 321
  end
  object qryMA: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      
        'select distinct(lpad(nu_micro_area,2,'#39'0'#39')) as nu_micro_area, lpa' +
        'd(nu_micro_area,2,'#39'0'#39') as dsMicroArea from tb_fat_cad_domiciliar' +
        ' group by nu_micro_area'
      'union'
      
        'select distinct(lpad(nu_micro_area,2,'#39'0'#39')) as nu_micro_area, lpa' +
        'd(nu_micro_area,2,'#39'0'#39') as dsMicroArea from tb_fat_cad_individual' +
        ' group by nu_micro_area'
      'union '
      
        'select distinct(lpad(nu_micro_area,2,'#39'0'#39')) as nu_micro_area, lpa' +
        'd(nu_micro_area,2,'#39'0'#39') as dsMicroArea from tb_cds_cad_individual' +
        ' group by nu_micro_area'
      'union'
      
        'select '#39'999999'#39' as nu_micro_area,'#39'TODAS'#39' as dsMicroArea from tb_' +
        'cds_cad_individual;')
    Left = 968
    Top = 321
  end
  object dsUnidade: TDataSource
    AutoEdit = False
    DataSet = qryUnidade
    Left = 880
    Top = 385
  end
  object dsMA: TDataSource
    AutoEdit = False
    DataSet = qryMA
    Left = 968
    Top = 385
  end
  object qryIndicador4Dentro: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'select * '
      'from '
      'tmp_mulheres'
      'where'
      '(data_nascimento between :data_inicial and :data_final)'
      'and'
      '1=1  '
      'and'
      '1=1 '
      'and'
      '(idadeatual >= :idade_inicial and idadeatual <= :idade_final)'
      'and'
      'indicador4 = 1'
      'order by'
      'sequencia;')
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 498
    Top = 441
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'data_final'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idade_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idade_final'
        Value = nil
      end>
    object qryIndicador4DentroSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryIndicador4DentroCNS: TStringField
      FieldName = 'CNS'
      Size = 15
    end
    object qryIndicador4DentroCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryIndicador4DentroCNS_ALTERNATIVO: TStringField
      FieldName = 'CNS_ALTERNATIVO'
      Size = 15
    end
    object qryIndicador4DentroCPF_ALTERNATIVO: TStringField
      FieldName = 'CPF_ALTERNATIVO'
      Size = 11
    end
    object qryIndicador4DentroDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryIndicador4DentroCIDADAO_ATIVO: TIntegerField
      FieldName = 'CIDADAO_ATIVO'
    end
    object qryIndicador4DentroDATA_FALECIMENTO: TDateField
      FieldName = 'DATA_FALECIMENTO'
    end
    object qryIndicador4DentroCIDADAO_NOME: TStringField
      FieldName = 'CIDADAO_NOME'
      Size = 500
    end
    object qryIndicador4DentroCIDADAO_MAE: TStringField
      FieldName = 'CIDADAO_MAE'
      Size = 500
    end
    object qryIndicador4DentroCIDADAO_FALECEU: TIntegerField
      FieldName = 'CIDADAO_FALECEU'
    end
    object qryIndicador4DentroCIDADAO_SEXO: TStringField
      FieldName = 'CIDADAO_SEXO'
      Size = 24
    end
    object qryIndicador4DentroCIND_GESTANTE: TIntegerField
      FieldName = 'CIND_GESTANTE'
    end
    object qryIndicador4DentroCIND_HIPERTENSO: TIntegerField
      FieldName = 'CIND_HIPERTENSO'
    end
    object qryIndicador4DentroCIND_DIABETICO: TIntegerField
      FieldName = 'CIND_DIABETICO'
    end
    object qryIndicador4DentroCIND_SEXO: TStringField
      FieldName = 'CIND_SEXO'
      Size = 24
    end
    object qryIndicador4DentroCIND_MICRO_AREA: TStringField
      Alignment = taCenter
      FieldName = 'CIND_MICRO_AREA'
      Size = 5
    end
    object qryIndicador4DentroCNS_RESP: TStringField
      FieldName = 'CNS_RESP'
      Size = 15
    end
    object qryIndicador4DentroCPF_RESP: TStringField
      FieldName = 'CPF_RESP'
      Size = 11
    end
    object qryIndicador4DentroCIND_INATIVO: TIntegerField
      FieldName = 'CIND_INATIVO'
    end
    object qryIndicador4DentroCNES: TStringField
      FieldName = 'CNES'
    end
    object qryIndicador4DentroCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField
      FieldName = 'CO_SEQ_DIM_UNIDADE_SAUDE'
    end
    object qryIndicador4DentroNOME_UNIDADE: TStringField
      FieldName = 'NOME_UNIDADE'
      Size = 500
    end
    object qryIndicador4DentroINE: TStringField
      FieldName = 'INE'
    end
    object qryIndicador4DentroNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 500
    end
    object qryIndicador4DentroTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 33
    end
    object qryIndicador4DentroIDADEATUAL: TIntegerField
      Alignment = taCenter
      FieldName = 'IDADEATUAL'
    end
    object qryIndicador4DentroIND_I4_REGRA1: TIntegerField
      FieldName = 'IND_I4_REGRA1'
    end
    object qryIndicador4DentroINDICADOR4: TIntegerField
      FieldName = 'INDICADOR4'
    end
    object qryIndicador4DentroPROCEDIMENTOS: TStringField
      FieldName = 'PROCEDIMENTOS'
      Size = 255
    end
    object qryIndicador4DentroDT_ULT_EXAME: TDateField
      FieldName = 'DT_ULT_EXAME'
    end
    object qryIndicador4DentroDT_PROXIMO_EXAME: TDateField
      FieldName = 'DT_PROXIMO_EXAME'
    end
    object qryIndicador4DentroQTDE_EXAMES: TIntegerField
      FieldName = 'QTDE_EXAMES'
    end
    object qryIndicador4DentroDSC_PROCEDIMENTO: TStringField
      FieldName = 'DSC_PROCEDIMENTO'
      Size = 500
    end
  end
  object dsIndicador4Dentro: TDataSource
    AutoEdit = False
    DataSet = qryIndicador4Dentro
    OnDataChange = dsIndicador4DentroDataChange
    Left = 498
    Top = 497
  end
  object qryIndicador4Fora: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'select * '
      'from '
      'tmp_mulheres'
      'where'
      'data_nascimento between :data_inicial and :data_final'
      'and'
      '1=1  --6'
      'and'
      '1=1  --8'
      'and'
      'idadeatual >= :idade_inicial and idadeatual<=:idade_final'
      'and'
      'indicador4 = 0'
      'order by'
      'sequencia;')
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 602
    Top = 441
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'data_final'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idade_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idade_final'
        Value = nil
      end>
    object qryIndicador4ForaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryIndicador4ForaCNS: TStringField
      FieldName = 'CNS'
      Size = 15
    end
    object qryIndicador4ForaCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryIndicador4ForaCNS_ALTERNATIVO: TStringField
      FieldName = 'CNS_ALTERNATIVO'
      Size = 15
    end
    object qryIndicador4ForaCPF_ALTERNATIVO: TStringField
      FieldName = 'CPF_ALTERNATIVO'
      Size = 11
    end
    object qryIndicador4ForaDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryIndicador4ForaCIDADAO_ATIVO: TIntegerField
      FieldName = 'CIDADAO_ATIVO'
    end
    object qryIndicador4ForaDATA_FALECIMENTO: TDateField
      FieldName = 'DATA_FALECIMENTO'
    end
    object qryIndicador4ForaCIDADAO_NOME: TStringField
      FieldName = 'CIDADAO_NOME'
      Size = 500
    end
    object qryIndicador4ForaCIDADAO_MAE: TStringField
      FieldName = 'CIDADAO_MAE'
      Size = 500
    end
    object qryIndicador4ForaCIDADAO_FALECEU: TIntegerField
      FieldName = 'CIDADAO_FALECEU'
    end
    object qryIndicador4ForaCIDADAO_SEXO: TStringField
      FieldName = 'CIDADAO_SEXO'
      Size = 24
    end
    object qryIndicador4ForaCIND_GESTANTE: TIntegerField
      FieldName = 'CIND_GESTANTE'
    end
    object qryIndicador4ForaCIND_HIPERTENSO: TIntegerField
      FieldName = 'CIND_HIPERTENSO'
    end
    object qryIndicador4ForaCIND_DIABETICO: TIntegerField
      FieldName = 'CIND_DIABETICO'
    end
    object qryIndicador4ForaCIND_SEXO: TStringField
      FieldName = 'CIND_SEXO'
      Size = 24
    end
    object qryIndicador4ForaCIND_MICRO_AREA: TStringField
      FieldName = 'CIND_MICRO_AREA'
      Size = 5
    end
    object qryIndicador4ForaCNS_RESP: TStringField
      FieldName = 'CNS_RESP'
      Size = 15
    end
    object qryIndicador4ForaCPF_RESP: TStringField
      FieldName = 'CPF_RESP'
      Size = 11
    end
    object qryIndicador4ForaCIND_INATIVO: TIntegerField
      FieldName = 'CIND_INATIVO'
    end
    object qryIndicador4ForaCNES: TStringField
      FieldName = 'CNES'
    end
    object qryIndicador4ForaCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField
      FieldName = 'CO_SEQ_DIM_UNIDADE_SAUDE'
    end
    object qryIndicador4ForaNOME_UNIDADE: TStringField
      FieldName = 'NOME_UNIDADE'
      Size = 500
    end
    object qryIndicador4ForaINE: TStringField
      FieldName = 'INE'
    end
    object qryIndicador4ForaNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 500
    end
    object qryIndicador4ForaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 33
    end
    object qryIndicador4ForaIDADEATUAL: TIntegerField
      FieldName = 'IDADEATUAL'
    end
    object qryIndicador4ForaIND_I4_REGRA1: TIntegerField
      FieldName = 'IND_I4_REGRA1'
    end
    object qryIndicador4ForaINDICADOR4: TIntegerField
      FieldName = 'INDICADOR4'
    end
    object qryIndicador4ForaPROCEDIMENTOS: TStringField
      FieldName = 'PROCEDIMENTOS'
      Size = 255
    end
    object qryIndicador4ForaDT_ULT_EXAME: TDateField
      FieldName = 'DT_ULT_EXAME'
    end
    object qryIndicador4ForaDT_PROXIMO_EXAME: TDateField
      FieldName = 'DT_PROXIMO_EXAME'
    end
    object qryIndicador4ForaDSC_PROCEDIMENTO: TStringField
      FieldName = 'DSC_PROCEDIMENTO'
      Size = 500
    end
  end
  object dsIndicador4Fora: TDataSource
    AutoEdit = False
    DataSet = qryIndicador4Fora
    OnDataChange = dsIndicador4ForaDataChange
    Left = 602
    Top = 497
  end
  object qryIndicador4DentroQuad: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'select '
      'tmp_mulheres.*'
      'from '
      'tmp_mulheres '
      'inner join tmp_detalhes_mulheres '
      'on (tmp_mulheres.sequencia = tmp_detalhes_mulheres.sequencia)'
      'where'
      
        '(tmp_detalhes_mulheres.co_dim_tempo between :data_inicial and :d' +
        'ata_final)'
      'and'
      '1=1  --9'
      'and'
      '1=1  --11'
      'and'
      '(idadeatual >= :idade_inicial and idadeatual <= :idade_final)'
      'and'
      'indicador4 = 1'
      'order by'
      'sequencia asc, tmp_detalhes_mulheres.co_dim_tempo desc;')
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 690
    Top = 441
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'data_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'data_final'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idade_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idade_final'
        Value = nil
      end>
    object IntegerField1: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object StringField1: TStringField
      FieldName = 'CNS'
      Size = 15
    end
    object StringField2: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object StringField3: TStringField
      FieldName = 'CNS_ALTERNATIVO'
      Size = 15
    end
    object StringField4: TStringField
      FieldName = 'CPF_ALTERNATIVO'
      Size = 11
    end
    object DateField1: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object IntegerField2: TIntegerField
      FieldName = 'CIDADAO_ATIVO'
    end
    object DateField2: TDateField
      FieldName = 'DATA_FALECIMENTO'
    end
    object StringField5: TStringField
      FieldName = 'CIDADAO_NOME'
      Size = 500
    end
    object StringField6: TStringField
      FieldName = 'CIDADAO_MAE'
      Size = 500
    end
    object IntegerField3: TIntegerField
      FieldName = 'CIDADAO_FALECEU'
    end
    object StringField7: TStringField
      FieldName = 'CIDADAO_SEXO'
      Size = 24
    end
    object IntegerField4: TIntegerField
      FieldName = 'CIND_GESTANTE'
    end
    object IntegerField5: TIntegerField
      FieldName = 'CIND_HIPERTENSO'
    end
    object IntegerField6: TIntegerField
      FieldName = 'CIND_DIABETICO'
    end
    object StringField8: TStringField
      FieldName = 'CIND_SEXO'
      Size = 24
    end
    object StringField9: TStringField
      FieldName = 'CIND_MICRO_AREA'
      Size = 5
    end
    object StringField10: TStringField
      FieldName = 'CNS_RESP'
      Size = 15
    end
    object StringField11: TStringField
      FieldName = 'CPF_RESP'
      Size = 11
    end
    object IntegerField7: TIntegerField
      FieldName = 'CIND_INATIVO'
    end
    object StringField12: TStringField
      FieldName = 'CNES'
    end
    object IntegerField8: TIntegerField
      FieldName = 'CO_SEQ_DIM_UNIDADE_SAUDE'
    end
    object StringField13: TStringField
      FieldName = 'NOME_UNIDADE'
      Size = 500
    end
    object StringField14: TStringField
      FieldName = 'INE'
    end
    object StringField15: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 500
    end
    object StringField16: TStringField
      FieldName = 'TELEFONE'
      Size = 33
    end
    object IntegerField9: TIntegerField
      FieldName = 'IDADEATUAL'
    end
    object IntegerField10: TIntegerField
      FieldName = 'IND_I4_REGRA1'
    end
    object IntegerField11: TIntegerField
      FieldName = 'INDICADOR4'
    end
    object qryIndicador4DentroQuadPROCEDIMENTOS: TStringField
      FieldName = 'PROCEDIMENTOS'
      Size = 255
    end
    object qryIndicador4DentroQuadDT_ULT_EXAME: TDateField
      FieldName = 'DT_ULT_EXAME'
    end
    object qryIndicador4DentroQuadDT_PROXIMO_EXAME: TDateField
      FieldName = 'DT_PROXIMO_EXAME'
    end
    object qryIndicador4DentroQuadQTDE_EXAMES: TIntegerField
      FieldName = 'QTDE_EXAMES'
    end
    object qryIndicador4DentroQuadDSC_PROCEDIMENTO: TStringField
      FieldName = 'DSC_PROCEDIMENTO'
      Size = 500
    end
  end
  object dsIndicador4DentroQuad: TDataSource
    AutoEdit = False
    DataSet = qryIndicador4DentroQuad
    Left = 690
    Top = 489
  end
  object qryDetExamesRealizados: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'SELECT * '
      'FROM TMP_DETALHES_MULHERES'
      'WHERE '
      'SEQUENCIA = :SEQUENCIA'
      'AND'
      'TIPO = '#39'I4'#39)
    Left = 882
    Top = 439
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SEQUENCIA'
        Value = nil
      end>
    object qryDetExamesRealizadosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryDetExamesRealizadosCPF: TStringField
      FieldName = 'CPF'
    end
    object qryDetExamesRealizadosCNS: TStringField
      FieldName = 'CNS'
    end
    object qryDetExamesRealizadosNU_CBO: TStringField
      FieldName = 'NU_CBO'
    end
    object qryDetExamesRealizadosNO_CBO: TStringField
      FieldName = 'NO_CBO'
      Size = 255
    end
    object qryDetExamesRealizadosCO_DIM_TEMPO: TDateField
      FieldName = 'CO_DIM_TEMPO'
    end
    object qryDetExamesRealizadosCIAPS: TStringField
      FieldName = 'CIAPS'
      Size = 255
    end
    object qryDetExamesRealizadosCIDS: TStringField
      FieldName = 'CIDS'
      Size = 255
    end
    object qryDetExamesRealizadosCNS_PROFISSIONAL: TStringField
      FieldName = 'CNS_PROFISSIONAL'
    end
    object qryDetExamesRealizadosNO_PROFISSIONAL: TStringField
      FieldName = 'NO_PROFISSIONAL'
      Size = 255
    end
    object qryDetExamesRealizadosNU_INE: TStringField
      FieldName = 'NU_INE'
      Size = 10
    end
    object qryDetExamesRealizadosNO_EQUIPE: TStringField
      FieldName = 'NO_EQUIPE'
      Size = 255
    end
    object qryDetExamesRealizadosNO_CNES: TStringField
      FieldName = 'NO_CNES'
      Size = 255
    end
    object qryDetExamesRealizadosNO_UNIDADE_SAUDE: TStringField
      FieldName = 'NO_UNIDADE_SAUDE'
      Size = 255
    end
    object qryDetExamesRealizadosPROCEDIMENTO: TStringField
      FieldName = 'PROCEDIMENTO'
      Size = 255
    end
    object qryDetExamesRealizadosORIGEMDADOS: TStringField
      FieldName = 'ORIGEMDADOS'
      Size = 255
    end
  end
  object dsDetExamesRealizados: TDataSource
    AutoEdit = False
    DataSet = qryDetExamesRealizados
    Left = 882
    Top = 487
  end
  object qryTotaliza_exames: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'select sum(qtde_exames) as total_exames'
      'from '
      'tmp_mulheres'
      'where'
      '(idadeatual >= :idade_inicial and idadeatual <= :idade_final)'
      'and'
      'indicador4 = 1')
    Left = 970
    Top = 265
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idade_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'idade_final'
        Value = nil
      end>
  end
end
