object FGestantesInd1: TFGestantesInd1
  Left = 0
  Top = 0
  Caption = 'Consulta - Gestantes  - Indicador 1 do Previne Brasil'
  ClientHeight = 587
  ClientWidth = 1008
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
    Width = 1008
    Height = 41
    Align = alTop
    Caption = 
      'CONSULTA AO INDICADOR 2 - GESTANTES COM 6 CONSULTAS DE PR'#201'-NATAL' +
      ' E A 1'#170' AT'#201' A 20'#170' SEMANA '
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 1008
    Height = 222
    Align = alClient
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 2
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 68
      Width = 1006
      Height = 153
      Hint = ''
      ActivePage = TabSheet3
      Align = alClient
      TabIndex = 2
      TabOrder = 0
      OnChange = RzPageControl1Change
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Indicador 1 - Dentro da Faixa'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object Label31: TLabel
          Left = 8
          Top = 32
          Width = 82
          Height = 13
          Caption = 'CIND_GESTANTE'
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1002
          Height = 102
          Align = alClient
          BorderStyle = bsNone
          Ctl3D = True
          DataSource = dsIndicador1Dentro
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentCtl3D = False
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
              FieldName = 'CIDADAO_NOME'
              Title.Caption = 'Nome do Cidad'#227'o'
              Width = 369
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'G_CO_DIM_TEMPO_DUM'
              Title.Caption = 'D.U.M.'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_DDP'
              Title.Caption = 'D.P.P.'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DTLIMITE_FIM'
              Title.Caption = 'DT.L.F.G.'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_FIMPUERP'
              Title.Caption = 'Dt. Puerp'#233'rio'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_20S'
              Title.Caption = 'Dt. 20 Sem'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DT_1A_CONSULTA'
              Title.Caption = '1'#170' Consulta'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_NRCONSULTAS'
              Title.Alignment = taCenter
              Title.Caption = 'N.C.'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_FINALIZADA'
              Title.Caption = 'ST G. Fin.'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DT_FINALIZACAO'
              Title.Caption = 'Dt. T'#233'rmino'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_IG_SEMANAS'
              Title.Caption = 'I.G.'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_EQUIPE'
              Title.Caption = 'Nome da Equipe'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_MICRO_AREA'
              Title.Caption = 'MA'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_UNIDADE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 491
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 102
          Width = 1002
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 1
          object lblRegDentro: TLabel
            Left = 1
            Top = 1
            Width = 159
            Height = 13
            Align = alLeft
            Caption = 'Total de Registros Selecionados: '
            Layout = tlCenter
          end
        end
      end
      object TabSheet2: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Indicador 1 - Fora da Faixa'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 1002
          Height = 102
          Align = alClient
          BorderStyle = bsNone
          DataSource = dsIndicador1Fora
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clNavy
          TitleFont.Height = -13
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid2DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'CIDADAO_NOME'
              Title.Caption = 'Nome do Cidad'#227'o'
              Width = 369
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'G_CO_DIM_TEMPO_DUM'
              Title.Caption = 'D.U.M.'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_DDP'
              Title.Caption = 'D.P.P.'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DTLIMITE_FIM'
              Title.Caption = 'DT.L.F.G.'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_FIMPUERP'
              Title.Caption = 'Dt. Puerp'#233'rio'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_20S'
              Title.Caption = 'Dt. 20 Sem'
              Width = 91
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DT_1A_CONSULTA'
              Title.Caption = '1'#170' Consulta'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_NRCONSULTAS'
              Title.Alignment = taCenter
              Title.Caption = 'N.C.'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_FINALIZADA'
              Title.Caption = 'ST G. Fin.'
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DT_FINALIZACAO'
              Title.Caption = 'Dt. T'#233'rmino'
              Width = 93
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_IG_SEMANAS'
              Title.Caption = 'I.G.'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_EQUIPE'
              Title.Caption = 'Nome da Equipe'
              Width = 223
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_MICRO_AREA'
              Title.Caption = 'MA'
              Width = 33
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_UNIDADE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 491
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 102
          Width = 1002
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 1
          object lblRegFora: TLabel
            Left = 1
            Top = 1
            Width = 159
            Height = 13
            Align = alLeft
            Caption = 'Total de Registros Selecionados: '
            Layout = tlCenter
          end
        end
      end
      object TabSheet3: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Inconsist'#234'ncia nos dados das gestantes'
        object Panel7: TPanel
          Left = 0
          Top = 102
          Width = 1002
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 0
          object lblRegInco: TLabel
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
        object Panel16: TPanel
          Left = 0
          Top = 0
          Width = 785
          Height = 102
          Align = alLeft
          Caption = 'Panel16'
          TabOrder = 1
          object DBGrid3: TDBGrid
            Left = 1
            Top = 1
            Width = 783
            Height = 100
            Align = alClient
            DataSource = dsInconsistencia
            Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnDrawColumnCell = DBGrid3DrawColumnCell
            Columns = <
              item
                Expanded = False
                FieldName = 'CNS'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CPF'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CIDADAO_NOME'
                Title.Caption = 'Nome do Cidad'#227'(o)'
                Width = 280
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TELEFONE'
                Title.Caption = 'Telefone'
                Width = 101
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOME_UNIDADE'
                Title.Caption = 'Unidade de Sa'#250'de'
                Visible = True
              end>
          end
        end
        object Panel17: TPanel
          Left = 785
          Top = 0
          Width = 217
          Height = 102
          Align = alClient
          TabOrder = 2
          object Panel18: TPanel
            Left = 1
            Top = 1
            Width = 215
            Height = 24
            Align = alTop
            Caption = 'LISTA DE INCONSIST'#202'NCIAS ENCONTRADAS'
            Color = clWhite
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBackground = False
            ParentFont = False
            TabOrder = 0
          end
          object DBListBox1: TDBListBox
            Left = 1
            Top = 25
            Width = 215
            Height = 76
            Align = alClient
            ItemHeight = 13
            TabOrder = 1
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1006
      Height = 67
      Align = alTop
      Color = clInactiveBorder
      ParentBackground = False
      TabOrder = 1
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 668
        Height = 59
        Align = alClient
        Color = clInactiveBorder
        ParentBackground = False
        TabOrder = 0
        object Panel12: TPanel
          Left = 452
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
            Caption = 'INDICADOR 1'
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
          Width = 451
          Height = 57
          Align = alClient
          TabOrder = 1
          object lblNumerador: TLabel
            Left = 1
            Top = 1
            Width = 449
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
          object Label29: TLabel
            Left = 1
            Top = 22
            Width = 449
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
            Width = 449
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
        Left = 678
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
    Width = 1008
    Height = 104
    Align = alTop
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 143
      Top = 56
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
      Left = 16
      Top = 14
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
      Left = 145
      Top = 14
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
      Left = 302
      Top = 56
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
      Left = 272
      Top = 14
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
      Top = 56
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
    object cbBuscarpor: TRzComboBox
      Left = 143
      Top = 72
      Width = 153
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
      Left = 770
      Top = 24
      Width = 121
      Height = 71
      Caption = '&Pesquisar'
      TabOrder = 1
      OnClick = RzBitBtn1Click
    end
    object edTermo: TEdit
      Left = 302
      Top = 72
      Width = 462
      Height = 21
      TabOrder = 2
      OnChange = edTermoChange
    end
    object cbUnidade: TRzComboBox
      Left = 272
      Top = 29
      Width = 492
      Height = 21
      Style = csDropDownList
      TabOrder = 3
    end
    object cbMA: TRzComboBox
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      Style = csDropDownList
      TabOrder = 4
    end
    object edDataInicial: TRzDateTimeEdit
      Left = 16
      Top = 29
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 5
    end
    object edDataFinal: TRzDateTimeEdit
      Left = 145
      Top = 29
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 6
    end
  end
  object Panel10: TPanel
    Left = 0
    Top = 367
    Width = 1008
    Height = 220
    Align = alBottom
    TabOrder = 3
    object RzPageControl2: TRzPageControl
      Left = 1
      Top = 1
      Width = 1006
      Height = 218
      Hint = ''
      ActivePage = TabSheet4
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      FixedDimension = 19
      object TabSheet4: TRzTabSheet
        Caption = 'Detalhamento dos dados'
        object GridPanel1: TGridPanel
          Left = 0
          Top = 0
          Width = 1002
          Height = 195
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
            1002
            195)
          object Panel11: TPanel
            Left = 1
            Top = 1
            Width = 840
            Height = 193
            Align = alClient
            TabOrder = 0
            object Label4: TLabel
              Left = 231
              Top = 88
              Width = 103
              Height = 13
              Caption = 'N'#186' Cons. Odont. 1'#186' T'
            end
            object Label8: TLabel
              Left = 340
              Top = 88
              Width = 103
              Height = 13
              Caption = 'N'#186' Cons. Odont. 2'#186' T'
            end
            object Label9: TLabel
              Left = 449
              Top = 88
              Width = 103
              Height = 13
              Caption = 'N'#186' Cons. Odont. 3'#186' T'
            end
            object Label10: TLabel
              Left = 403
              Top = 4
              Width = 65
              Height = 13
              Caption = 'Nome da M'#227'e'
            end
            object Label11: TLabel
              Left = 385
              Top = 45
              Width = 45
              Height = 13
              Caption = 'Faleceu ?'
            end
            object Label12: TLabel
              Left = 712
              Top = 89
              Width = 24
              Height = 13
              Caption = 'Sexo'
            end
            object Label13: TLabel
              Left = 444
              Top = 45
              Width = 52
              Height = 13
              Caption = 'Data '#211'bito'
            end
            object Label14: TLabel
              Left = 6
              Top = 88
              Width = 49
              Height = 13
              Caption = 'Gestante?'
            end
            object Label15: TLabel
              Left = 715
              Top = 45
              Width = 57
              Height = 13
              Caption = 'Hipertenso?'
            end
            object Label16: TLabel
              Left = 778
              Top = 45
              Width = 49
              Height = 13
              Caption = 'Diab'#233'tico?'
            end
            object Label17: TLabel
              Left = 101
              Top = 45
              Width = 84
              Height = 13
              Caption = 'CNS Respons'#225'vel'
            end
            object Label18: TLabel
              Left = 254
              Top = 45
              Width = 98
              Height = 13
              Caption = 'CPF do Respons'#225'vel'
            end
            object Label19: TLabel
              Left = 77
              Top = 88
              Width = 65
              Height = 13
              Caption = 'I.G. Semanas'
            end
            object Label20: TLabel
              Left = 153
              Top = 88
              Width = 52
              Height = 13
              Caption = 'I.G. Meses'
            end
            object Label22: TLabel
              Left = 550
              Top = 45
              Width = 67
              Height = 13
              Caption = 'Cidad'#227'o Ativo'
            end
            object Label23: TLabel
              Left = 623
              Top = 45
              Width = 83
              Height = 13
              Caption = 'Cad. Ind. Inativo'
            end
            object Label24: TLabel
              Left = 6
              Top = 48
              Width = 59
              Height = 13
              Caption = 'Data Nascto'
            end
            object Label25: TLabel
              Left = 499
              Top = 129
              Width = 151
              Height = 13
              Caption = 'Motivo do T'#233'rmino da Gesta'#231#227'o'
            end
            object Label27: TLabel
              Left = 246
              Top = 131
              Width = 109
              Height = 13
              Caption = 'Cids T'#233'rmino Gesta'#231#227'o'
            end
            object Label28: TLabel
              Left = 6
              Top = 130
              Width = 130
              Height = 13
              Caption = 'Ciaps T'#233'rmino da Gesta'#231#227'o'
            end
            object Label21: TLabel
              Left = 286
              Top = 4
              Width = 42
              Height = 13
              Caption = 'Telefone'
            end
            object Label26: TLabel
              Left = 6
              Top = 4
              Width = 20
              Height = 13
              Caption = 'CNS'
            end
            object Label30: TLabel
              Left = 152
              Top = 4
              Width = 19
              Height = 13
              Caption = 'CPF'
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
              Left = 712
              Top = 103
              Width = 115
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
              Width = 146
              Height = 21
              Enabled = False
              TabOrder = 3
            end
            object edCPFResp: TEdit
              Left = 254
              Top = 61
              Width = 126
              Height = 21
              Enabled = False
              TabOrder = 4
            end
            object edCidFaleceu: TEdit
              Left = 386
              Top = 61
              Width = 52
              Height = 21
              Enabled = False
              TabOrder = 5
            end
            object edDtObito: TEdit
              Left = 444
              Top = 61
              Width = 100
              Height = 21
              Enabled = False
              TabOrder = 6
            end
            object edHipertenso: TEdit
              Left = 715
              Top = 61
              Width = 57
              Height = 21
              Enabled = False
              TabOrder = 7
            end
            object edDiabetico: TEdit
              Left = 778
              Top = 61
              Width = 49
              Height = 21
              Enabled = False
              TabOrder = 8
            end
            object edCidAtivo: TEdit
              Left = 550
              Top = 61
              Width = 67
              Height = 21
              Enabled = False
              TabOrder = 9
            end
            object edCIndInativo: TEdit
              Left = 623
              Top = 61
              Width = 86
              Height = 21
              Enabled = False
              TabOrder = 10
            end
            object edGestante: TEdit
              Left = 6
              Top = 103
              Width = 65
              Height = 21
              Enabled = False
              TabOrder = 11
            end
            object edIGSemanas: TEdit
              Left = 77
              Top = 103
              Width = 70
              Height = 21
              Enabled = False
              TabOrder = 12
            end
            object edIGMeses: TEdit
              Left = 153
              Top = 103
              Width = 72
              Height = 21
              Enabled = False
              TabOrder = 13
            end
            object edNCO1Trim: TEdit
              Left = 231
              Top = 103
              Width = 103
              Height = 21
              Enabled = False
              TabOrder = 14
            end
            object edNCO2Trim: TEdit
              Left = 340
              Top = 103
              Width = 103
              Height = 21
              Enabled = False
              TabOrder = 15
            end
            object edNCO3Trim: TEdit
              Left = 449
              Top = 103
              Width = 103
              Height = 21
              Enabled = False
              TabOrder = 16
            end
            object edCiapsTermino: TEdit
              Left = 6
              Top = 146
              Width = 233
              Height = 21
              Enabled = False
              TabOrder = 17
            end
            object edCidsTermino: TEdit
              Left = 246
              Top = 146
              Width = 247
              Height = 21
              Enabled = False
              TabOrder = 18
            end
            object edMotivoTermino: TEdit
              Left = 499
              Top = 146
              Width = 328
              Height = 21
              Enabled = False
              TabOrder = 19
            end
            object edTelefone: TEdit
              Left = 286
              Top = 18
              Width = 111
              Height = 21
              Enabled = False
              TabOrder = 20
            end
            object edCNS: TEdit
              Left = 6
              Top = 18
              Width = 139
              Height = 21
              Enabled = False
              TabOrder = 21
            end
            object edCPF: TEdit
              Left = 153
              Top = 18
              Width = 127
              Height = 21
              Enabled = False
              TabOrder = 22
            end
          end
          object SpeedButton1: TSpeedButton
            Left = 895
            Top = 1
            Width = 51
            Height = 56
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
        Caption = 'Detalhes das Consultas (Pr'#233'-Natal)'
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitWidth = 0
        ExplicitHeight = 0
        object DBGrid4: TDBGrid
          Left = 0
          Top = 0
          Width = 1002
          Height = 195
          Align = alClient
          DataSource = dsDetConsultas
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 92
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNS'
              Width = 112
              Visible = True
            end
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
              FieldName = 'CIAPS'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDS'
              Width = 100
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
              FieldName = 'NO_CNES'
              Title.Caption = 'CNES Unidade'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NO_UNIDADE_SAUDE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 232
              Visible = True
            end>
        end
      end
    end
  end
  object qryIndicador1Dentro: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'Select *'
      'from '
      'tmp_gestantes'
      'where'
      'G_CO_DIM_TEMPO_DUM between :data_inicial and :data_final'
      'and '
      '1=1  --6'
      'and '
      '1=1  --8'
      'and'
      '1=1  -- 10'
      'and'
      'indicador1 = 1'
      
        'order by sequencia, cidadao_nome                                ' +
        '   ')
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 520
    Top = 305
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
      end>
    object qryIndicador1DentroSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryIndicador1DentroCNS: TStringField
      FieldName = 'CNS'
      Size = 15
    end
    object qryIndicador1DentroCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryIndicador1DentroCNS_ALTERNATIVO: TStringField
      FieldName = 'CNS_ALTERNATIVO'
      Size = 15
    end
    object qryIndicador1DentroCPF_ALTERNATIVO: TStringField
      FieldName = 'CPF_ALTERNATIVO'
      Size = 11
    end
    object qryIndicador1DentroDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryIndicador1DentroG_CO_DIM_TEMPO_DUM: TDateField
      FieldName = 'G_CO_DIM_TEMPO_DUM'
    end
    object qryIndicador1DentroG_CO_DIM_TEMPO: TDateField
      FieldName = 'G_CO_DIM_TEMPO'
    end
    object qryIndicador1DentroCIDADAO_ATIVO: TIntegerField
      FieldName = 'CIDADAO_ATIVO'
      OnGetText = qryIndicador1DentroCIDADAO_ATIVOGetText
    end
    object qryIndicador1DentroDATA_FALECIMENTO: TDateField
      FieldName = 'DATA_FALECIMENTO'
    end
    object qryIndicador1DentroCIDADAO_NOME: TStringField
      FieldName = 'CIDADAO_NOME'
      Size = 500
    end
    object qryIndicador1DentroCIDADAO_MAE: TStringField
      FieldName = 'CIDADAO_MAE'
      Size = 500
    end
    object qryIndicador1DentroCIDADAO_FALECEU: TIntegerField
      FieldName = 'CIDADAO_FALECEU'
    end
    object qryIndicador1DentroCIDADAO_SEXO: TStringField
      FieldName = 'CIDADAO_SEXO'
      Size = 24
    end
    object qryIndicador1DentroCIND_GESTANTE: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_GESTANTE'
      OnGetText = qryIndicador1DentroCIND_GESTANTEGetText
    end
    object qryIndicador1DentroCIND_HIPERTENSO: TIntegerField
      FieldName = 'CIND_HIPERTENSO'
      OnGetText = qryIndicador1DentroCIND_HIPERTENSOGetText
    end
    object qryIndicador1DentroCIND_DIABETICO: TIntegerField
      FieldName = 'CIND_DIABETICO'
      OnGetText = qryIndicador1DentroCIND_DIABETICOGetText
    end
    object qryIndicador1DentroCIND_SEXO: TStringField
      FieldName = 'CIND_SEXO'
      Size = 24
    end
    object qryIndicador1DentroCIND_MICRO_AREA: TStringField
      FieldName = 'CIND_MICRO_AREA'
      Size = 5
    end
    object qryIndicador1DentroCNS_RESP: TStringField
      FieldName = 'CNS_RESP'
      Size = 15
    end
    object qryIndicador1DentroCPF_RESP: TStringField
      FieldName = 'CPF_RESP'
      Size = 11
    end
    object qryIndicador1DentroCIND_INATIVO: TIntegerField
      FieldName = 'CIND_INATIVO'
      OnGetText = qryIndicador1DentroCIND_INATIVOGetText
    end
    object qryIndicador1DentroCNES: TStringField
      FieldName = 'CNES'
    end
    object qryIndicador1DentroCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField
      FieldName = 'CO_SEQ_DIM_UNIDADE_SAUDE'
    end
    object qryIndicador1DentroNOME_UNIDADE: TStringField
      FieldName = 'NOME_UNIDADE'
      Size = 500
    end
    object qryIndicador1DentroINE: TStringField
      FieldName = 'INE'
    end
    object qryIndicador1DentroNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 255
    end
    object qryIndicador1DentroCALC_DDP: TDateField
      FieldName = 'CALC_DDP'
    end
    object qryIndicador1DentroCALC_20S: TDateField
      FieldName = 'CALC_20S'
    end
    object qryIndicador1DentroCALC_FIMPUERP: TDateField
      FieldName = 'CALC_FIMPUERP'
    end
    object qryIndicador1DentroNU_UUID_FICHA: TStringField
      FieldName = 'NU_UUID_FICHA'
      Size = 92
    end
    object qryIndicador1DentroNU_UUID_FICHA_ORIGEM: TStringField
      FieldName = 'NU_UUID_FICHA_ORIGEM'
      Size = 92
    end
    object qryIndicador1DentroNU_UUID_DADO_TRANSP: TStringField
      FieldName = 'NU_UUID_DADO_TRANSP'
      Size = 92
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_GESTANTE_I1_NRCONSULTAS'
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_ULT_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_ULT_CONSULTA'
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_FINALIZACAO'
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField
      FieldName = 'CIND_GESTANTE_I1_DTLIMITE_FIM'
    end
    object qryIndicador1DentroTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 33
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA1'
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_REGRA2: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA2'
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_REGRA3: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA3'
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_1A_CONSULTA'
    end
    object qryIndicador1DentroCIND_GESTANTE_CIAP_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CIAP_FINALIZACAO'
      Size = 50
    end
    object qryIndicador1DentroCIND_GESTANTE_CID_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CID_FINALIZACAO'
      Size = 50
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_FINALIZADA: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_GESTANTE_I1_FINALIZADA'
      OnGetText = qryIndicador1DentroCIND_GESTANTE_I1_FINALIZADAGetText
    end
    object qryIndicador1DentroCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField
      Alignment = taCenter
      FieldName = 'CIND_GESTANTE_I1_DSCFINALIZACAO'
      Size = 200
    end
    object qryIndicador1DentroCALC_IG_DIAS: TIntegerField
      FieldName = 'CALC_IG_DIAS'
    end
    object qryIndicador1DentroCALC_IG_SEMANAS: TIntegerField
      Alignment = taCenter
      FieldName = 'CALC_IG_SEMANAS'
    end
    object qryIndicador1DentroCALC_IG_MESES: TIntegerField
      Alignment = taCenter
      FieldName = 'CALC_IG_MESES'
    end
    object qryIndicador1DentroCIND_GESTANTE_I2_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I2_REGRA1'
    end
    object qryIndicador1DentroCIND_GESTANTE_I2_REGRA2: TIntegerField
      FieldName = 'CIND_GESTANTE_I2_REGRA2'
    end
    object qryIndicador1DentroCIND_GESTANTE_I3_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I3_REGRA1'
    end
    object qryIndicador1DentroINDICADOR1: TSmallintField
      FieldName = 'INDICADOR1'
      OnGetText = qryIndicador1DentroINDICADOR1GetText
    end
    object qryIndicador1DentroINDICADOR2: TSmallintField
      FieldName = 'INDICADOR2'
    end
    object qryIndicador1DentroINDICADOR3: TSmallintField
      FieldName = 'INDICADOR3'
    end
    object qryIndicador1DentroNCO1TRIM: TIntegerField
      FieldName = 'NCO1TRIM'
    end
    object qryIndicador1DentroNCO2TRIM: TIntegerField
      FieldName = 'NCO2TRIM'
    end
    object qryIndicador1DentroNCO3TRIM: TIntegerField
      FieldName = 'NCO3TRIM'
    end
  end
  object dsIndicador1Dentro: TDataSource
    AutoEdit = False
    DataSet = qryIndicador1Dentro
    OnDataChange = dsIndicador1DentroDataChange
    Left = 520
    Top = 345
  end
  object qryUnidade: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      
        'select co_seq_dim_unidade_saude, no_unidade_saude from tb_dim_un' +
        'idade_saude order by co_seq_dim_unidade_saude')
    Left = 880
    Top = 321
    object qryUnidadeco_seq_dim_unidade_saude: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'co_seq_dim_unidade_saude'
      Required = True
    end
    object qryUnidadeno_unidade_saude: TStringField
      DisplayLabel = 'Nome da Unidade'
      FieldName = 'no_unidade_saude'
      Size = 500
    end
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
    Left = 1024
    Top = 401
  end
  object dsMA: TDataSource
    AutoEdit = False
    DataSet = qryMA
    Left = 1048
    Top = 465
  end
  object qryIndicador1Fora: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'Select *'
      'from '
      'tmp_gestantes'
      'where'
      'G_CO_DIM_TEMPO_DUM between :data_inicial and :data_final'
      'and '
      '1=1  --6'
      'and '
      '1=1  --8'
      'and'
      '1=1  -- 10'
      'and'
      'indicador1 <> 1'
      
        'order by sequencia, cidadao_nome                                ' +
        '   ')
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 392
    Top = 305
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
      end>
    object qryIndicador1ForaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryIndicador1ForaCNS: TStringField
      FieldName = 'CNS'
      Size = 15
    end
    object qryIndicador1ForaCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryIndicador1ForaCNS_ALTERNATIVO: TStringField
      FieldName = 'CNS_ALTERNATIVO'
      Size = 15
    end
    object qryIndicador1ForaCPF_ALTERNATIVO: TStringField
      FieldName = 'CPF_ALTERNATIVO'
      Size = 11
    end
    object qryIndicador1ForaDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryIndicador1ForaG_CO_DIM_TEMPO_DUM: TDateField
      FieldName = 'G_CO_DIM_TEMPO_DUM'
    end
    object qryIndicador1ForaG_CO_DIM_TEMPO: TDateField
      FieldName = 'G_CO_DIM_TEMPO'
    end
    object qryIndicador1ForaCIDADAO_ATIVO: TIntegerField
      Alignment = taCenter
      FieldName = 'CIDADAO_ATIVO'
      OnGetText = qryIndicador1ForaCIDADAO_ATIVOGetText
    end
    object qryIndicador1ForaDATA_FALECIMENTO: TDateField
      FieldName = 'DATA_FALECIMENTO'
    end
    object qryIndicador1ForaCIDADAO_NOME: TStringField
      FieldName = 'CIDADAO_NOME'
      Size = 500
    end
    object qryIndicador1ForaCIDADAO_MAE: TStringField
      FieldName = 'CIDADAO_MAE'
      Size = 500
    end
    object qryIndicador1ForaCIDADAO_FALECEU: TIntegerField
      Alignment = taCenter
      FieldName = 'CIDADAO_FALECEU'
      OnGetText = qryIndicador1ForaCIDADAO_FALECEUGetText
    end
    object qryIndicador1ForaCIDADAO_SEXO: TStringField
      FieldName = 'CIDADAO_SEXO'
      Size = 24
    end
    object qryIndicador1ForaCIND_GESTANTE: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_GESTANTE'
      OnGetText = qryIndicador1ForaCIND_GESTANTEGetText
    end
    object qryIndicador1ForaCIND_HIPERTENSO: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_HIPERTENSO'
      OnGetText = qryIndicador1ForaCIND_HIPERTENSOGetText
    end
    object qryIndicador1ForaCIND_DIABETICO: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_DIABETICO'
      OnGetText = qryIndicador1ForaCIND_DIABETICOGetText
    end
    object qryIndicador1ForaCIND_SEXO: TStringField
      FieldName = 'CIND_SEXO'
      Size = 24
    end
    object qryIndicador1ForaCIND_MICRO_AREA: TStringField
      FieldName = 'CIND_MICRO_AREA'
      Size = 5
    end
    object qryIndicador1ForaCNS_RESP: TStringField
      FieldName = 'CNS_RESP'
      Size = 15
    end
    object qryIndicador1ForaCPF_RESP: TStringField
      FieldName = 'CPF_RESP'
      Size = 11
    end
    object qryIndicador1ForaCIND_INATIVO: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_INATIVO'
      OnGetText = qryIndicador1ForaCIND_INATIVOGetText
    end
    object qryIndicador1ForaCNES: TStringField
      FieldName = 'CNES'
    end
    object qryIndicador1ForaCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField
      FieldName = 'CO_SEQ_DIM_UNIDADE_SAUDE'
    end
    object qryIndicador1ForaNOME_UNIDADE: TStringField
      FieldName = 'NOME_UNIDADE'
      Size = 500
    end
    object qryIndicador1ForaINE: TStringField
      FieldName = 'INE'
    end
    object qryIndicador1ForaNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 255
    end
    object qryIndicador1ForaCALC_DDP: TDateField
      FieldName = 'CALC_DDP'
    end
    object qryIndicador1ForaCALC_20S: TDateField
      FieldName = 'CALC_20S'
    end
    object qryIndicador1ForaCALC_FIMPUERP: TDateField
      FieldName = 'CALC_FIMPUERP'
    end
    object qryIndicador1ForaNU_UUID_FICHA: TStringField
      FieldName = 'NU_UUID_FICHA'
      Size = 92
    end
    object qryIndicador1ForaNU_UUID_FICHA_ORIGEM: TStringField
      FieldName = 'NU_UUID_FICHA_ORIGEM'
      Size = 92
    end
    object qryIndicador1ForaNU_UUID_DADO_TRANSP: TStringField
      FieldName = 'NU_UUID_DADO_TRANSP'
      Size = 92
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_GESTANTE_I1_NRCONSULTAS'
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_ULT_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_ULT_CONSULTA'
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_FINALIZACAO'
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField
      FieldName = 'CIND_GESTANTE_I1_DTLIMITE_FIM'
    end
    object qryIndicador1ForaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 33
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA1'
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_REGRA2: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA2'
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_REGRA3: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA3'
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_1A_CONSULTA'
    end
    object qryIndicador1ForaCIND_GESTANTE_CIAP_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CIAP_FINALIZACAO'
      Size = 50
    end
    object qryIndicador1ForaCIND_GESTANTE_CID_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CID_FINALIZACAO'
      Size = 50
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_FINALIZADA: TIntegerField
      Alignment = taCenter
      FieldName = 'CIND_GESTANTE_I1_FINALIZADA'
      OnGetText = qryIndicador1ForaCIND_GESTANTE_I1_FINALIZADAGetText
    end
    object qryIndicador1ForaCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_I1_DSCFINALIZACAO'
      Size = 200
    end
    object qryIndicador1ForaCALC_IG_DIAS: TIntegerField
      FieldName = 'CALC_IG_DIAS'
    end
    object qryIndicador1ForaCALC_IG_SEMANAS: TIntegerField
      FieldName = 'CALC_IG_SEMANAS'
    end
    object qryIndicador1ForaCALC_IG_MESES: TIntegerField
      FieldName = 'CALC_IG_MESES'
    end
    object qryIndicador1ForaCIND_GESTANTE_I2_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I2_REGRA1'
    end
    object qryIndicador1ForaCIND_GESTANTE_I2_REGRA2: TIntegerField
      FieldName = 'CIND_GESTANTE_I2_REGRA2'
    end
    object qryIndicador1ForaCIND_GESTANTE_I3_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I3_REGRA1'
    end
    object qryIndicador1ForaINDICADOR1: TSmallintField
      Alignment = taCenter
      FieldName = 'INDICADOR1'
      OnGetText = qryIndicador1ForaINDICADOR1GetText
    end
    object qryIndicador1ForaINDICADOR2: TSmallintField
      FieldName = 'INDICADOR2'
    end
    object qryIndicador1ForaINDICADOR3: TSmallintField
      FieldName = 'INDICADOR3'
    end
    object qryIndicador1ForaNCO1TRIM: TIntegerField
      FieldName = 'NCO1TRIM'
    end
    object qryIndicador1ForaNCO2TRIM: TIntegerField
      FieldName = 'NCO2TRIM'
    end
    object qryIndicador1ForaNCO3TRIM: TIntegerField
      FieldName = 'NCO3TRIM'
    end
  end
  object dsIndicador1Fora: TDataSource
    AutoEdit = False
    DataSet = qryIndicador1Fora
    OnDataChange = dsIndicador1ForaDataChange
    Left = 392
    Top = 337
  end
  object qryInconsistencia: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'Select *'
      'from '
      'tmp_gestantes'
      'where'
      'G_CO_DIM_TEMPO_DUM between :data_inicial and :data_final'
      'and '
      '1=1  --6'
      'and '
      '1=1  --8'
      'and'
      '1=1  -- 10'
      'and'
      '(cidadao_ativo = 0 or cind_inativo=1)'
      
        'order by sequencia, cidadao_nome                                ' +
        '   ')
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    Left = 272
    Top = 305
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
      end>
    object qryInconsistenciaSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryInconsistenciaCNS: TStringField
      FieldName = 'CNS'
      Size = 15
    end
    object qryInconsistenciaCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryInconsistenciaCNS_ALTERNATIVO: TStringField
      FieldName = 'CNS_ALTERNATIVO'
      Size = 15
    end
    object qryInconsistenciaCPF_ALTERNATIVO: TStringField
      FieldName = 'CPF_ALTERNATIVO'
      Size = 11
    end
    object qryInconsistenciaDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryInconsistenciaG_CO_DIM_TEMPO_DUM: TDateField
      FieldName = 'G_CO_DIM_TEMPO_DUM'
    end
    object qryInconsistenciaG_CO_DIM_TEMPO: TDateField
      FieldName = 'G_CO_DIM_TEMPO'
    end
    object qryInconsistenciaCIDADAO_ATIVO: TIntegerField
      FieldName = 'CIDADAO_ATIVO'
    end
    object qryInconsistenciaDATA_FALECIMENTO: TDateField
      FieldName = 'DATA_FALECIMENTO'
    end
    object qryInconsistenciaCIDADAO_NOME: TStringField
      FieldName = 'CIDADAO_NOME'
      Size = 500
    end
    object qryInconsistenciaCIDADAO_MAE: TStringField
      FieldName = 'CIDADAO_MAE'
      Size = 500
    end
    object qryInconsistenciaCIDADAO_FALECEU: TIntegerField
      FieldName = 'CIDADAO_FALECEU'
    end
    object qryInconsistenciaCIDADAO_SEXO: TStringField
      FieldName = 'CIDADAO_SEXO'
      Size = 24
    end
    object qryInconsistenciaCIND_GESTANTE: TIntegerField
      FieldName = 'CIND_GESTANTE'
    end
    object qryInconsistenciaCIND_HIPERTENSO: TIntegerField
      FieldName = 'CIND_HIPERTENSO'
    end
    object qryInconsistenciaCIND_DIABETICO: TIntegerField
      FieldName = 'CIND_DIABETICO'
    end
    object qryInconsistenciaCIND_SEXO: TStringField
      FieldName = 'CIND_SEXO'
      Size = 24
    end
    object qryInconsistenciaCIND_MICRO_AREA: TStringField
      FieldName = 'CIND_MICRO_AREA'
      Size = 5
    end
    object qryInconsistenciaCNS_RESP: TStringField
      FieldName = 'CNS_RESP'
      Size = 15
    end
    object qryInconsistenciaCPF_RESP: TStringField
      FieldName = 'CPF_RESP'
      Size = 11
    end
    object qryInconsistenciaCIND_INATIVO: TIntegerField
      FieldName = 'CIND_INATIVO'
    end
    object qryInconsistenciaCNES: TStringField
      FieldName = 'CNES'
    end
    object qryInconsistenciaCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField
      FieldName = 'CO_SEQ_DIM_UNIDADE_SAUDE'
    end
    object qryInconsistenciaNOME_UNIDADE: TStringField
      FieldName = 'NOME_UNIDADE'
      Size = 500
    end
    object qryInconsistenciaINE: TStringField
      FieldName = 'INE'
    end
    object qryInconsistenciaNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 255
    end
    object qryInconsistenciaCALC_DDP: TDateField
      FieldName = 'CALC_DDP'
    end
    object qryInconsistenciaCALC_20S: TDateField
      FieldName = 'CALC_20S'
    end
    object qryInconsistenciaCALC_FIMPUERP: TDateField
      FieldName = 'CALC_FIMPUERP'
    end
    object qryInconsistenciaNU_UUID_FICHA: TStringField
      FieldName = 'NU_UUID_FICHA'
      Size = 92
    end
    object qryInconsistenciaNU_UUID_FICHA_ORIGEM: TStringField
      FieldName = 'NU_UUID_FICHA_ORIGEM'
      Size = 92
    end
    object qryInconsistenciaNU_UUID_DADO_TRANSP: TStringField
      FieldName = 'NU_UUID_DADO_TRANSP'
      Size = 92
    end
    object qryInconsistenciaCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_NRCONSULTAS'
    end
    object qryInconsistenciaCIND_GESTANTE_I1_ULT_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_ULT_CONSULTA'
    end
    object qryInconsistenciaCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_FINALIZACAO'
    end
    object qryInconsistenciaCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField
      FieldName = 'CIND_GESTANTE_I1_DTLIMITE_FIM'
    end
    object qryInconsistenciaTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 33
    end
    object qryInconsistenciaCIND_GESTANTE_I1_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA1'
    end
    object qryInconsistenciaCIND_GESTANTE_I1_REGRA2: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA2'
    end
    object qryInconsistenciaCIND_GESTANTE_I1_REGRA3: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA3'
    end
    object qryInconsistenciaCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_1A_CONSULTA'
    end
    object qryInconsistenciaCIND_GESTANTE_CIAP_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CIAP_FINALIZACAO'
      Size = 50
    end
    object qryInconsistenciaCIND_GESTANTE_CID_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CID_FINALIZACAO'
      Size = 50
    end
    object qryInconsistenciaCIND_GESTANTE_I1_FINALIZADA: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_FINALIZADA'
    end
    object qryInconsistenciaCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_I1_DSCFINALIZACAO'
      Size = 200
    end
    object qryInconsistenciaCALC_IG_DIAS: TIntegerField
      FieldName = 'CALC_IG_DIAS'
    end
    object qryInconsistenciaCALC_IG_SEMANAS: TIntegerField
      FieldName = 'CALC_IG_SEMANAS'
    end
    object qryInconsistenciaCALC_IG_MESES: TIntegerField
      FieldName = 'CALC_IG_MESES'
    end
    object qryInconsistenciaCIND_GESTANTE_I2_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I2_REGRA1'
    end
    object qryInconsistenciaCIND_GESTANTE_I2_REGRA2: TIntegerField
      FieldName = 'CIND_GESTANTE_I2_REGRA2'
    end
    object qryInconsistenciaCIND_GESTANTE_I3_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I3_REGRA1'
    end
    object qryInconsistenciaINDICADOR1: TSmallintField
      FieldName = 'INDICADOR1'
    end
    object qryInconsistenciaINDICADOR2: TSmallintField
      FieldName = 'INDICADOR2'
    end
    object qryInconsistenciaINDICADOR3: TSmallintField
      FieldName = 'INDICADOR3'
    end
    object qryInconsistenciaNCO1TRIM: TIntegerField
      FieldName = 'NCO1TRIM'
    end
    object qryInconsistenciaNCO2TRIM: TIntegerField
      FieldName = 'NCO2TRIM'
    end
    object qryInconsistenciaNCO3TRIM: TIntegerField
      FieldName = 'NCO3TRIM'
    end
  end
  object dsInconsistencia: TDataSource
    AutoEdit = False
    DataSet = qryInconsistencia
    Left = 344
    Top = 265
  end
  object qryDetConsultas: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'SELECT * '
      'FROM TMP_DETALHES_GESTANTES'
      'WHERE '
      'SEQUENCIA = :SEQUENCIA'
      'AND'
      'TIPO = '#39'I1'#39)
    Left = 874
    Top = 447
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SEQUENCIA'
        Value = nil
      end>
    object qryDetConsultasID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryDetConsultasCPF: TStringField
      FieldName = 'CPF'
    end
    object qryDetConsultasCNS: TStringField
      FieldName = 'CNS'
    end
    object qryDetConsultasNU_CBO: TStringField
      FieldName = 'NU_CBO'
    end
    object qryDetConsultasNO_CBO: TStringField
      FieldName = 'NO_CBO'
      Size = 255
    end
    object qryDetConsultasCO_DIM_TEMPO: TDateField
      FieldName = 'CO_DIM_TEMPO'
    end
    object qryDetConsultasCIAPS: TStringField
      FieldName = 'CIAPS'
      Size = 255
    end
    object qryDetConsultasCIDS: TStringField
      FieldName = 'CIDS'
      Size = 255
    end
    object qryDetConsultasCNS_PROFISSIONAL: TStringField
      FieldName = 'CNS_PROFISSIONAL'
    end
    object qryDetConsultasNO_PROFISSIONAL: TStringField
      FieldName = 'NO_PROFISSIONAL'
      Size = 255
    end
    object qryDetConsultasNU_INE: TStringField
      FieldName = 'NU_INE'
      Size = 10
    end
    object qryDetConsultasNO_EQUIPE: TStringField
      FieldName = 'NO_EQUIPE'
      Size = 255
    end
    object qryDetConsultasNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 255
    end
    object qryDetConsultasNO_CNES: TStringField
      FieldName = 'NO_CNES'
      Size = 255
    end
    object qryDetConsultasNO_UNIDADE_SAUDE: TStringField
      FieldName = 'NO_UNIDADE_SAUDE'
      Size = 255
    end
  end
  object dsDetConsultas: TDataSource
    AutoEdit = False
    DataSet = qryDetConsultas
    Left = 738
    Top = 319
  end
end
