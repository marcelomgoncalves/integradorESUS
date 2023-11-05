object FGestantesInd99: TFGestantesInd99
  Left = 0
  Top = 0
  Caption = 'Consulta de Indicadores 1, 2 e 3 de Gestantes - Previne Brasil '
  ClientHeight = 625
  ClientWidth = 1172
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
    Width = 1172
    Height = 41
    Align = alTop
    Caption = 'GESTANTES - INDICADORES 1, 2 E 3 - PREVINE BRASIL'
    Color = clInactiveBorder
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 145
    Width = 1172
    Height = 480
    Align = alClient
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 2
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 68
      Width = 1170
      Height = 157
      Hint = ''
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Listagem de Dados dos Indicadores'
        object Panel4: TPanel
          Left = 0
          Top = 106
          Width = 1166
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 0
          object lblRegDentro: TLabel
            Left = 1
            Top = 1
            Width = 1164
            Height = 26
            Align = alClient
            AutoSize = False
            Caption = 'Total de Registros Selecionados: '
            Layout = tlCenter
            ExplicitLeft = 81
            ExplicitTop = 6
            ExplicitWidth = 1079
          end
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1166
          Height = 106
          Align = alClient
          DataSource = dsTmpGestantes
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clBlue
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = [fsBold]
          OnDrawColumnCell = DBGrid1DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'SEQUENCIA'
              Title.Caption = 'ID'
              Width = 61
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CNS'
              Width = 130
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADAO_NOME'
              Title.Caption = 'Nome do Cidad'#227'(o)'
              Width = 375
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Caption = 'Telefone'
              Width = 91
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'INDICADOR1'
              Title.Caption = 'Indicador 1'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'INDICADOR2'
              Title.Caption = 'Indicador 2'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'INDICADOR3'
              Title.Caption = 'Indicador 3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'G_CO_DIM_TEMPO_DUM'
              Title.Caption = 'D.U.M.'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_DDP'
              Title.Caption = 'D.D.P.'
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_FIMPUERP'
              Title.Caption = 'Dt. Lim. Puerp'#233'rio'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CALC_20S'
              Title.Caption = 'Dt. 20Semana'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DT_1A_CONSULTA'
              Title.Caption = 'Dt. 1'#170' Consulta'
              Width = 93
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_NRCONSULTAS'
              Title.Caption = 'N'#186' Consultas'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_ULT_CONSULTA'
              Title.Caption = 'Dt. '#218'lt. Consulta'
              Width = 98
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_FINALIZADA'
              Title.Caption = 'Gest. Finalizada ?'
              Width = 94
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIND_GESTANTE_I1_DT_FINALIZACAO'
              Title.Caption = 'Dt. T'#233'rmino'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_UNIDADE'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 238
              Visible = True
            end>
        end
      end
      object TabSheet3: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Inconsist'#234'ncia nos dados das gestantes'
        object Panel7: TPanel
          Left = 0
          Top = 106
          Width = 1166
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
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 1170
      Height = 67
      Align = alTop
      Color = clInactiveBorder
      ParentBackground = False
      TabOrder = 1
      object Panel8: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 547
        Height = 59
        Align = alClient
        Color = clInactiveBorder
        ParentBackground = False
        TabOrder = 0
        object lblDenominador: TLabel
          Left = 1
          Top = 37
          Width = 545
          Height = 21
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
          ExplicitLeft = 2
          ExplicitTop = 36
        end
        object Label29: TLabel
          Left = 1
          Top = 19
          Width = 545
          Height = 18
          Align = alBottom
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
          ExplicitLeft = 2
          ExplicitTop = 18
        end
        object Label30: TLabel
          Left = 1
          Top = 1
          Width = 545
          Height = 24
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
          ExplicitLeft = 2
          ExplicitTop = 0
        end
      end
      object Panel9: TPanel
        AlignWithMargins = True
        Left = 557
        Top = 4
        Width = 609
        Height = 59
        Align = alRight
        TabOrder = 1
        object Panel11: TPanel
          Left = 1
          Top = 1
          Width = 203
          Height = 57
          Align = alLeft
          TabOrder = 0
          object lblIndice1: TLabel
            Left = 1
            Top = 20
            Width = 201
            Height = 36
            Align = alClient
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 7
            ExplicitHeight = 25
          end
          object Panel14: TPanel
            Left = 1
            Top = 1
            Width = 201
            Height = 19
            Align = alTop
            Caption = 'INDICADOR 1'
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
        object Panel12: TPanel
          Left = 204
          Top = 1
          Width = 203
          Height = 57
          Align = alLeft
          TabOrder = 1
          object lblIndice2: TLabel
            Left = 1
            Top = 20
            Width = 201
            Height = 36
            Align = alClient
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 7
            ExplicitHeight = 25
          end
          object Panel15: TPanel
            Left = 1
            Top = 1
            Width = 201
            Height = 19
            Align = alTop
            Caption = 'INDICADOR 2'
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
        object Panel13: TPanel
          Left = 407
          Top = 1
          Width = 203
          Height = 57
          Align = alLeft
          TabOrder = 2
          object lblIndice3: TLabel
            Left = 1
            Top = 20
            Width = 201
            Height = 36
            Align = alClient
            Alignment = taCenter
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitWidth = 7
            ExplicitHeight = 25
          end
          object Panel16: TPanel
            Left = 1
            Top = 1
            Width = 201
            Height = 19
            Align = alTop
            Caption = 'INDICADOR 3'
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
    object Panel10: TPanel
      Left = 1
      Top = 225
      Width = 1170
      Height = 254
      Align = alBottom
      BevelOuter = bvNone
      Ctl3D = True
      ParentCtl3D = False
      TabOrder = 2
      object RzPageControl2: TRzPageControl
        Left = 0
        Top = 0
        Width = 1170
        Height = 254
        Hint = ''
        ActivePage = TabSheet7
        Align = alClient
        TabIndex = 3
        TabOrder = 0
        FixedDimension = 19
        object TabSheet4: TRzTabSheet
          Caption = 'Detalhamento dos dados'
          object GridPanel1: TGridPanel
            Left = 0
            Top = 0
            Width = 1166
            Height = 231
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
                Control = Panel6
                Row = 0
              end>
            RowCollection = <
              item
                Value = 100.000000000000000000
              end>
            TabOrder = 0
            object Panel6: TPanel
              Left = 1
              Top = 1
              Width = 977
              Height = 229
              Align = alClient
              TabOrder = 0
              object Label4: TLabel
                Left = 429
                Top = 89
                Width = 125
                Height = 13
                Caption = 'Consultas Odont. 1'#186' Trim.'
                FocusControl = DBEdit1
              end
              object Label8: TLabel
                Left = 569
                Top = 88
                Width = 125
                Height = 13
                Caption = 'Consultas Odont. 2'#186' Trim.'
                FocusControl = DBEdit2
              end
              object Label9: TLabel
                Left = 709
                Top = 88
                Width = 125
                Height = 13
                Caption = 'Consultas Odont. 3'#186' Trim.'
                FocusControl = DBEdit3
              end
              object Label10: TLabel
                Left = 6
                Top = 4
                Width = 65
                Height = 13
                Caption = 'Nome da M'#227'e'
                FocusControl = DBEdit4
              end
              object Label11: TLabel
                Left = 764
                Top = 3
                Width = 87
                Height = 13
                Caption = 'Cidad'#227'o Faleceu ?'
                FocusControl = DBEdit5
              end
              object Label12: TLabel
                Left = 6
                Top = 44
                Width = 24
                Height = 13
                Caption = 'Sexo'
                FocusControl = DBEdit6
              end
              object Label13: TLabel
                Left = 859
                Top = 4
                Width = 52
                Height = 13
                Caption = 'Data '#211'bito'
                FocusControl = DBEdit7
              end
              object Label14: TLabel
                Left = 594
                Top = 44
                Width = 49
                Height = 13
                Caption = 'Gestante?'
                FocusControl = DBEdit8
              end
              object Label15: TLabel
                Left = 663
                Top = 44
                Width = 57
                Height = 13
                Caption = 'Hipertenso?'
                FocusControl = DBEdit9
              end
              object Label16: TLabel
                Left = 726
                Top = 44
                Width = 49
                Height = 13
                Caption = 'Diab'#233'tico?'
                FocusControl = DBEdit10
              end
              object Label17: TLabel
                Left = 243
                Top = 44
                Width = 84
                Height = 13
                Caption = 'CNS Respons'#225'vel'
                FocusControl = DBEdit11
              end
              object Label18: TLabel
                Left = 441
                Top = 44
                Width = 98
                Height = 13
                Caption = 'CPF do Respons'#225'vel'
                FocusControl = DBEdit12
              end
              object Label19: TLabel
                Left = 146
                Top = 88
                Width = 121
                Height = 13
                Caption = 'Idade Gestacional (Sem.)'
                FocusControl = DBEdit13
              end
              object Label20: TLabel
                Left = 286
                Top = 88
                Width = 127
                Height = 13
                Caption = 'Idade Gestacional (Meses)'
                FocusControl = DBEdit14
              end
              object Label21: TLabel
                Left = 6
                Top = 88
                Width = 117
                Height = 13
                Caption = 'Idade Gestacional (Dias)'
                FocusControl = DBEdit15
              end
              object Label22: TLabel
                Left = 795
                Top = 44
                Width = 67
                Height = 13
                Caption = 'Cidad'#227'o Ativo'
                FocusControl = DBEdit16
              end
              object Label23: TLabel
                Left = 872
                Top = 44
                Width = 83
                Height = 13
                Caption = 'Cad. Ind. Inativo'
                FocusControl = DBEdit17
              end
              object Label24: TLabel
                Left = 130
                Top = 44
                Width = 59
                Height = 13
                Caption = 'Data Nascto'
                FocusControl = DBEdit18
              end
              object Label25: TLabel
                Left = 6
                Top = 132
                Width = 151
                Height = 13
                Caption = 'Motivo do T'#233'rmino da Gesta'#231#227'o'
                FocusControl = DBEdit19
              end
              object Label26: TLabel
                Left = 895
                Top = 89
                Width = 48
                Height = 13
                Caption = 'Micro'#193'rea'
                FocusControl = DBEdit20
              end
              object Label27: TLabel
                Left = 709
                Top = 131
                Width = 109
                Height = 13
                Caption = 'Cids T'#233'rmino Gesta'#231#227'o'
                FocusControl = DBEdit21
              end
              object Label28: TLabel
                Left = 439
                Top = 130
                Width = 130
                Height = 13
                Caption = 'Ciaps T'#233'rmino da Gesta'#231#227'o'
                FocusControl = DBEdit22
              end
              object DBEdit1: TDBEdit
                Left = 429
                Top = 104
                Width = 134
                Height = 21
                DataField = 'NCO1TRIM'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 0
              end
              object DBEdit2: TDBEdit
                Left = 569
                Top = 104
                Width = 134
                Height = 21
                DataField = 'NCO2TRIM'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 1
              end
              object DBEdit3: TDBEdit
                Left = 709
                Top = 104
                Width = 134
                Height = 21
                DataField = 'NCO3TRIM'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 2
              end
              object DBEdit4: TDBEdit
                Left = 6
                Top = 17
                Width = 753
                Height = 21
                DataField = 'CIDADAO_MAE'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 3
              end
              object DBEdit5: TDBEdit
                Left = 765
                Top = 18
                Width = 88
                Height = 21
                DataField = 'CIDADAO_FALECEU'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 4
              end
              object DBEdit6: TDBEdit
                Left = 6
                Top = 60
                Width = 117
                Height = 21
                DataField = 'CIDADAO_SEXO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 5
              end
              object DBEdit7: TDBEdit
                Left = 859
                Top = 18
                Width = 107
                Height = 21
                DataField = 'DATA_FALECIMENTO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 6
              end
              object DBEdit8: TDBEdit
                Left = 594
                Top = 60
                Width = 63
                Height = 21
                DataField = 'CIND_GESTANTE'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 7
              end
              object DBEdit9: TDBEdit
                Left = 663
                Top = 60
                Width = 57
                Height = 21
                DataField = 'CIND_HIPERTENSO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 8
              end
              object DBEdit10: TDBEdit
                Left = 726
                Top = 60
                Width = 63
                Height = 21
                DataField = 'CIND_DIABETICO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 9
              end
              object DBEdit11: TDBEdit
                Left = 243
                Top = 60
                Width = 192
                Height = 21
                DataField = 'CNS_RESP'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 10
              end
              object DBEdit12: TDBEdit
                Left = 441
                Top = 60
                Width = 147
                Height = 21
                DataField = 'CPF_RESP'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 11
              end
              object DBEdit13: TDBEdit
                Left = 146
                Top = 104
                Width = 134
                Height = 21
                DataField = 'CALC_IG_SEMANAS'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 12
              end
              object DBEdit14: TDBEdit
                Left = 286
                Top = 104
                Width = 134
                Height = 21
                DataField = 'CALC_IG_MESES'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 13
              end
              object DBEdit15: TDBEdit
                Left = 6
                Top = 104
                Width = 134
                Height = 21
                DataField = 'CALC_IG_DIAS'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 14
              end
              object DBEdit16: TDBEdit
                Left = 795
                Top = 60
                Width = 71
                Height = 21
                DataField = 'CIDADAO_ATIVO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 15
              end
              object DBEdit17: TDBEdit
                Left = 872
                Top = 60
                Width = 94
                Height = 21
                DataField = 'CIND_INATIVO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 16
              end
              object DBEdit18: TDBEdit
                Left = 130
                Top = 60
                Width = 107
                Height = 21
                DataField = 'DATA_NASCIMENTO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 17
              end
              object DBEdit19: TDBEdit
                Left = 6
                Top = 146
                Width = 427
                Height = 21
                DataField = 'CIND_GESTANTE_I1_DSCFINALIZACAO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 18
              end
              object DBEdit20: TDBEdit
                Left = 897
                Top = 104
                Width = 69
                Height = 21
                DataField = 'CIND_MICRO_AREA'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 19
              end
              object DBEdit21: TDBEdit
                Left = 709
                Top = 146
                Width = 257
                Height = 21
                DataField = 'CIND_GESTANTE_CID_FINALIZACAO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 20
              end
              object DBEdit22: TDBEdit
                Left = 439
                Top = 146
                Width = 264
                Height = 21
                DataField = 'CIND_GESTANTE_CIAP_FINALIZACAO'
                DataSource = dsTmpGestantes
                Enabled = False
                TabOrder = 21
              end
            end
          end
        end
        object TabSheet5: TRzTabSheet
          Caption = 'Detalhes das Consultas (Pr'#233'-Natal)'
          object DBGrid2: TDBGrid
            Left = 0
            Top = 0
            Width = 1166
            Height = 231
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
        object TabSheet6: TRzTabSheet
          Caption = 'Detalhes Procedimentos- Hiv/S'#237'filis'
          object DBGrid3: TDBGrid
            Left = 0
            Top = 0
            Width = 1166
            Height = 231
            Align = alClient
            DataSource = dsDetProcedimentos
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
                Width = 84
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNS'
                Width = 105
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CO_DIM_TEMPO'
                Title.Caption = 'Data'
                Width = 74
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCEDIMENTO1'
                Title.Caption = 'Proc. Avaliado'
                Width = 107
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCEDIMENTO2'
                Title.Caption = 'Proc. Solicitado'
                Width = 106
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO_EXAME'
                Title.Caption = 'Exame'
                Width = 44
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NU_INE'
                Title.Caption = 'INE'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NU_CBO'
                Title.Caption = 'CBO'
                Width = 54
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_CBO'
                Title.Caption = 'Descri'#231#227'o CBO'
                Width = 293
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNS_PROFISSIONAL'
                Title.Caption = 'CNS Profissional'
                Width = 100
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_PROFISSIONAL'
                Title.Caption = 'Nome do Profissional'
                Width = 202
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_EQUIPE'
                Title.Caption = 'Nome da Equipe'
                Width = 197
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_CNES'
                Title.Caption = 'CNES Unidade'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_UNIDADE_SAUDE'
                Title.Caption = 'Unidade de Sa'#250'de'
                Width = 251
                Visible = True
              end>
          end
        end
        object TabSheet7: TRzTabSheet
          Caption = 'Detalhes Consultas Odontol'#243'gicas'
          object DBGrid4: TDBGrid
            Left = 0
            Top = 0
            Width = 1166
            Height = 231
            Align = alClient
            DataSource = dsDetConsultaOdonto
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
                Width = 93
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNS'
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ODONTO_ST_GESTANTE'
                Title.Caption = 'Gestante ?'
                Width = 62
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CO_DIM_TEMPO'
                Title.Caption = 'Data'
                Width = 72
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NU_CBO'
                Title.Caption = 'CBO'
                Width = 71
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_CBO'
                Title.Caption = 'Descri'#231#227'o CBO '
                Width = 297
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CNS_PROFISSIONAL'
                Title.Caption = 'CNS Profissional'
                Width = 92
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_PROFISSIONAL'
                Title.Caption = 'Nome Profissional'
                Width = 257
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ODONTO_PROCEDIMENTO'
                Title.Caption = 'Procedimento'
                Width = 306
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NU_INE'
                Title.Caption = 'INE'
                Width = 70
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_EQUIPE'
                Title.Caption = 'Nome da Equipe'
                Width = 188
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_CNES'
                Title.Caption = 'CNES Unidade'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NO_UNIDADE_SAUDE'
                Title.Caption = 'Unidade de Sa'#250'de'
                Width = 339
                Visible = True
              end>
          end
        end
      end
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 41
    Width = 1172
    Height = 104
    Align = alTop
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 11
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
      Left = 175
      Top = 11
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
      Left = 304
      Top = 11
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
      Left = 191
      Top = 55
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
      Left = 431
      Top = 13
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
      Top = 55
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
    object Label31: TLabel
      Left = 683
      Top = 57
      Width = 130
      Height = 13
      Caption = 'Status dos Indicadores'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object cbBuscarpor: TRzComboBox
      Left = 16
      Top = 26
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
      Left = 952
      Top = 24
      Width = 121
      Height = 70
      Caption = '&Pesquisar'
      TabOrder = 1
      OnClick = RzBitBtn1Click
    end
    object edTermo: TEdit
      Left = 191
      Top = 72
      Width = 486
      Height = 21
      TabOrder = 2
    end
    object cbUnidade: TRzComboBox
      Left = 431
      Top = 26
      Width = 515
      Height = 21
      TabOrder = 3
    end
    object cbMA: TRzComboBox
      Left = 16
      Top = 72
      Width = 169
      Height = 21
      TabOrder = 4
    end
    object edDataInicial: TRzDateTimeEdit
      Left = 175
      Top = 26
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 5
    end
    object edDataFinal: TRzDateTimeEdit
      Left = 304
      Top = 26
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 6
    end
    object cbSTIndicadores: TRzComboBox
      Left = 683
      Top = 72
      Width = 263
      Height = 21
      Style = csDropDownList
      TabOrder = 7
      Text = '** TODOS **'
      Items.Strings = (
        '** TODOS **'
        'INDICADOR 1 - DENTRO'
        'INDICADOR 1 - FORA'
        'INDICADOR 2 - DENTRO'
        'INDICADOR 2 - FORA'
        'INDICADOR 3 - DENTRO'
        'INDICADOR 3 - FORA')
      ItemIndex = 0
      Values.Strings = (
        '0'
        '1'
        '2'
        '3'
        '4'
        '5'
        '6')
    end
  end
  object qryUnidade: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      
        'select co_seq_dim_unidade_saude, no_unidade_saude from tb_dim_un' +
        'idade_saude order by co_seq_dim_unidade_saude')
    Left = 808
    Top = 273
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
      'with microarea as ('
      
        '--select distinct(lpad(nu_micro_area,2,'#39'0'#39')) as nu_micro_area, l' +
        'pad(nu_micro_area,2,'#39'0'#39') as dsMicroArea from tb_fat_cad_domicili' +
        'ar group by nu_micro_area'
      '--union'
      
        'select lpad(nu_micro_area,2,'#39'0'#39') as nu_micro_area, lpad(nu_micro' +
        '_area,2,'#39'0'#39') as dsMicroArea from tb_fat_cad_individual group by ' +
        'nu_micro_area'
      '--union '
      
        '--select lpad(nu_micro_area,2,'#39'0'#39') as nu_micro_area, lpad(nu_mic' +
        'ro_area,2,'#39'0'#39') as dsMicroArea from tb_cds_cad_individual group b' +
        'y nu_micro_area '
      'order by 1 desc '
      ')'
      ''
      'select distinct(nu_micro_area), '
      'dsMicroArea'
      'from microarea'
      'union'
      
        'select '#39'999999'#39' as nu_micro_area,'#39'*TODAS AS AREAS*'#39' as dsMicroAr' +
        'ea from tb_fat_cad_individual'
      ''
      'order by 1 ')
    Left = 880
    Top = 273
    object qryMAnu_micro_area: TStringField
      FieldName = 'nu_micro_area'
      ReadOnly = True
    end
    object qryMAdsmicroarea: TStringField
      FieldName = 'dsmicroarea'
      ReadOnly = True
    end
  end
  object dsUnidade: TDataSource
    AutoEdit = False
    DataSet = qryUnidade
    Left = 808
    Top = 321
  end
  object dsMA: TDataSource
    AutoEdit = False
    DataSet = qryMA
    Left = 880
    Top = 321
  end
  object qryTmpGestantes: TUniQuery
    SQLRefresh.Strings = (
      
        'SELECT SEQUENCIA, CNS, CPF, CNS_ALTERNATIVO, CPF_ALTERNATIVO, DA' +
        'TA_NASCIMENTO, G_CO_DIM_TEMPO_DUM, G_CO_DIM_TEMPO, CIDADAO_ATIVO' +
        ', DATA_FALECIMENTO, CIDADAO_NOME, CIDADAO_MAE, CIDADAO_FALECEU, ' +
        'CIDADAO_SEXO, CIND_GESTANTE, CIND_HIPERTENSO, CIND_DIABETICO, CI' +
        'ND_SEXO, CIND_MICRO_AREA, CNS_RESP, CPF_RESP, CIND_INATIVO, CNES' +
        ', CO_SEQ_DIM_UNIDADE_SAUDE, NOME_UNIDADE, INE, NOME_EQUIPE, CALC' +
        '_DDP, CALC_20S, CALC_FIMPUERP, NU_UUID_FICHA, NU_UUID_FICHA_ORIG' +
        'EM, NU_UUID_DADO_TRANSP, CIND_GESTANTE_I1_NRCONSULTAS, CIND_GEST' +
        'ANTE_I1_ULT_CONSULTA, CIND_GESTANTE_I1_DT_FINALIZACAO, CIND_GEST' +
        'ANTE_I1_DTLIMITE_FIM, TELEFONE, CIND_GESTANTE_I1_REGRA1, CIND_GE' +
        'STANTE_I1_REGRA2, CIND_GESTANTE_I1_DT_1A_CONSULTA, CIND_GESTANTE' +
        '_CIAP_FINALIZACAO, CIND_GESTANTE_CID_FINALIZACAO, CIND_GESTANTE_' +
        'I1_FINALIZADA, CIND_GESTANTE_I1_DSCFINALIZACAO, CALC_IG_DIAS, CA' +
        'LC_IG_SEMANAS, CALC_IG_MESES FROM TMP_GESTANTES'
      'WHERE'
      '  SEQUENCIA = :SEQUENCIA')
    SQLRecCount.Strings = (
      'SELECT COUNT(*) FROM ('
      'SELECT 1 AS C  FROM TMP_GESTANTES'
      ''
      ') q')
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
      
        'order by sequencia, cidadao_nome                                ' +
        '   ')
    SpecificOptions.Strings = (
      'InterBase.FetchAll=True')
    AutoCalcFields = False
    Left = 418
    Top = 273
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'data_inicial'
        Value = nil
      end
      item
        DataType = ftDateTime
        Name = 'data_final'
        Value = nil
      end>
    object qryTmpGestantesSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryTmpGestantesCNS: TStringField
      FieldName = 'CNS'
      Size = 15
    end
    object qryTmpGestantesCPF: TStringField
      FieldName = 'CPF'
      Size = 11
    end
    object qryTmpGestantesCNS_ALTERNATIVO: TStringField
      FieldName = 'CNS_ALTERNATIVO'
      Size = 15
    end
    object qryTmpGestantesCPF_ALTERNATIVO: TStringField
      FieldName = 'CPF_ALTERNATIVO'
      Size = 11
    end
    object qryTmpGestantesDATA_NASCIMENTO: TDateField
      FieldName = 'DATA_NASCIMENTO'
    end
    object qryTmpGestantesG_CO_DIM_TEMPO_DUM: TDateField
      FieldName = 'G_CO_DIM_TEMPO_DUM'
    end
    object qryTmpGestantesG_CO_DIM_TEMPO: TDateField
      FieldName = 'G_CO_DIM_TEMPO'
    end
    object qryTmpGestantesCIDADAO_ATIVO: TIntegerField
      FieldName = 'CIDADAO_ATIVO'
      OnGetText = qryTmpGestantesCIDADAO_ATIVOGetText
    end
    object qryTmpGestantesDATA_FALECIMENTO: TDateField
      FieldName = 'DATA_FALECIMENTO'
    end
    object qryTmpGestantesCIDADAO_NOME: TStringField
      FieldName = 'CIDADAO_NOME'
      Size = 500
    end
    object qryTmpGestantesCIDADAO_MAE: TStringField
      FieldName = 'CIDADAO_MAE'
      Size = 500
    end
    object qryTmpGestantesCIDADAO_FALECEU: TIntegerField
      FieldName = 'CIDADAO_FALECEU'
      OnGetText = qryTmpGestantesCIDADAO_FALECEUGetText
    end
    object qryTmpGestantesCIDADAO_SEXO: TStringField
      FieldName = 'CIDADAO_SEXO'
      Size = 24
    end
    object qryTmpGestantesCIND_GESTANTE: TIntegerField
      FieldName = 'CIND_GESTANTE'
      OnGetText = qryTmpGestantesCIND_GESTANTEGetText
    end
    object qryTmpGestantesCIND_HIPERTENSO: TIntegerField
      FieldName = 'CIND_HIPERTENSO'
      OnGetText = qryTmpGestantesCIND_HIPERTENSOGetText
    end
    object qryTmpGestantesCIND_DIABETICO: TIntegerField
      FieldName = 'CIND_DIABETICO'
      OnGetText = qryTmpGestantesCIND_DIABETICOGetText
    end
    object qryTmpGestantesCIND_SEXO: TStringField
      FieldName = 'CIND_SEXO'
      Size = 24
    end
    object qryTmpGestantesCIND_MICRO_AREA: TStringField
      FieldName = 'CIND_MICRO_AREA'
      Size = 5
    end
    object qryTmpGestantesCNS_RESP: TStringField
      FieldName = 'CNS_RESP'
      Size = 15
    end
    object qryTmpGestantesCPF_RESP: TStringField
      FieldName = 'CPF_RESP'
      Size = 11
    end
    object qryTmpGestantesCIND_INATIVO: TIntegerField
      FieldName = 'CIND_INATIVO'
      OnGetText = qryTmpGestantesCIND_INATIVOGetText
    end
    object qryTmpGestantesCNES: TStringField
      FieldName = 'CNES'
    end
    object qryTmpGestantesNOME_UNIDADE: TStringField
      FieldName = 'NOME_UNIDADE'
      Size = 500
    end
    object qryTmpGestantesINE: TStringField
      FieldName = 'INE'
    end
    object qryTmpGestantesNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 255
    end
    object qryTmpGestantesCALC_DDP: TDateField
      FieldName = 'CALC_DDP'
    end
    object qryTmpGestantesCALC_20S: TDateField
      FieldName = 'CALC_20S'
    end
    object qryTmpGestantesCALC_FIMPUERP: TDateField
      FieldName = 'CALC_FIMPUERP'
    end
    object qryTmpGestantesNU_UUID_FICHA: TStringField
      FieldName = 'NU_UUID_FICHA'
      Size = 92
    end
    object qryTmpGestantesNU_UUID_FICHA_ORIGEM: TStringField
      FieldName = 'NU_UUID_FICHA_ORIGEM'
      Size = 92
    end
    object qryTmpGestantesNU_UUID_DADO_TRANSP: TStringField
      FieldName = 'NU_UUID_DADO_TRANSP'
      Size = 92
    end
    object qryTmpGestantesCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_NRCONSULTAS'
    end
    object qryTmpGestantesCIND_GESTANTE_I1_ULT_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_ULT_CONSULTA'
    end
    object qryTmpGestantesCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_FINALIZACAO'
    end
    object qryTmpGestantesCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField
      FieldName = 'CIND_GESTANTE_I1_DTLIMITE_FIM'
    end
    object qryTmpGestantesTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Size = 33
    end
    object qryTmpGestantesCIND_GESTANTE_I1_REGRA1: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA1'
      OnGetText = qryTmpGestantesCIND_GESTANTE_I1_REGRA1GetText
    end
    object qryTmpGestantesCIND_GESTANTE_I1_REGRA2: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_REGRA2'
      OnGetText = qryTmpGestantesCIND_GESTANTE_I1_REGRA2GetText
    end
    object qryTmpGestantesCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField
      FieldName = 'CIND_GESTANTE_I1_DT_1A_CONSULTA'
    end
    object qryTmpGestantesCIND_GESTANTE_CIAP_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CIAP_FINALIZACAO'
      Size = 50
    end
    object qryTmpGestantesCIND_GESTANTE_CID_FINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_CID_FINALIZACAO'
      Size = 50
    end
    object qryTmpGestantesCIND_GESTANTE_I1_FINALIZADA: TIntegerField
      FieldName = 'CIND_GESTANTE_I1_FINALIZADA'
      OnGetText = qryTmpGestantesCIND_GESTANTE_I1_FINALIZADAGetText
    end
    object qryTmpGestantesCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField
      FieldName = 'CIND_GESTANTE_I1_DSCFINALIZACAO'
      Size = 200
    end
    object qryTmpGestantesCALC_IG_DIAS: TIntegerField
      FieldName = 'CALC_IG_DIAS'
    end
    object qryTmpGestantesCALC_IG_SEMANAS: TIntegerField
      FieldName = 'CALC_IG_SEMANAS'
    end
    object qryTmpGestantesCALC_IG_MESES: TIntegerField
      FieldName = 'CALC_IG_MESES'
    end
    object qryTmpGestantesCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField
      FieldName = 'CO_SEQ_DIM_UNIDADE_SAUDE'
    end
    object qryTmpGestantesINDICADOR1: TSmallintField
      FieldName = 'INDICADOR1'
      OnGetText = qryTmpGestantesINDICADOR1GetText
    end
    object qryTmpGestantesINDICADOR2: TSmallintField
      FieldName = 'INDICADOR2'
      OnGetText = qryTmpGestantesINDICADOR2GetText
    end
    object qryTmpGestantesINDICADOR3: TSmallintField
      FieldName = 'INDICADOR3'
      OnGetText = qryTmpGestantesINDICADOR3GetText
    end
    object qryTmpGestantesNCO1TRIM: TIntegerField
      FieldName = 'NCO1TRIM'
    end
    object qryTmpGestantesNCO2TRIM: TIntegerField
      FieldName = 'NCO2TRIM'
    end
    object qryTmpGestantesNCO3TRIM: TIntegerField
      FieldName = 'NCO3TRIM'
    end
  end
  object dsTmpGestantes: TDataSource
    AutoEdit = False
    DataSet = qryTmpGestantes
    OnDataChange = dsTmpGestantesDataChange
    Left = 418
    Top = 321
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
    Left = 514
    Top = 271
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
    Left = 514
    Top = 311
  end
  object qryDetProcedimentos: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'SELECT * '
      'FROM TMP_DETALHES_GESTANTES'
      'WHERE '
      'SEQUENCIA = :SEQUENCIA'
      'AND'
      'TIPO = '#39'I2'#39
      'order by Tipo_Exame')
    Left = 594
    Top = 271
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SEQUENCIA'
        Value = nil
      end>
    object qryDetProcedimentosID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryDetProcedimentosSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryDetProcedimentosCPF: TStringField
      FieldName = 'CPF'
    end
    object qryDetProcedimentosCNS: TStringField
      FieldName = 'CNS'
    end
    object qryDetProcedimentosNU_CBO: TStringField
      FieldName = 'NU_CBO'
    end
    object qryDetProcedimentosNO_CBO: TStringField
      FieldName = 'NO_CBO'
      Size = 255
    end
    object qryDetProcedimentosNO_CNES: TStringField
      FieldName = 'NO_CNES'
      Size = 255
    end
    object qryDetProcedimentosNO_UNIDADE_SAUDE: TStringField
      FieldName = 'NO_UNIDADE_SAUDE'
      Size = 255
    end
    object qryDetProcedimentosNU_INE: TStringField
      FieldName = 'NU_INE'
      Size = 10
    end
    object qryDetProcedimentosNO_EQUIPE: TStringField
      FieldName = 'NO_EQUIPE'
      Size = 255
    end
    object qryDetProcedimentosCO_DIM_TEMPO: TDateField
      FieldName = 'CO_DIM_TEMPO'
    end
    object qryDetProcedimentosNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 255
    end
    object qryDetProcedimentosCNS_PROFISSIONAL: TStringField
      FieldName = 'CNS_PROFISSIONAL'
    end
    object qryDetProcedimentosNO_PROFISSIONAL: TStringField
      FieldName = 'NO_PROFISSIONAL'
      Size = 255
    end
    object qryDetProcedimentosPROCEDIMENTO1: TStringField
      FieldName = 'PROCEDIMENTO1'
      Size = 255
    end
    object qryDetProcedimentosPROCEDIMENTO2: TStringField
      FieldName = 'PROCEDIMENTO2'
      Size = 255
    end
    object qryDetProcedimentosTIPO_EXAME: TStringField
      FieldName = 'TIPO_EXAME'
      Size = 10
    end
    object qryDetProcedimentosORIGEMDADOS: TStringField
      FieldName = 'ORIGEMDADOS'
      Size = 255
    end
  end
  object dsDetProcedimentos: TDataSource
    AutoEdit = False
    DataSet = qryDetProcedimentos
    Left = 594
    Top = 319
  end
  object qryDetConsultaOdonto: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'SELECT * '
      'FROM TMP_DETALHES_GESTANTES'
      'WHERE '
      'SEQUENCIA = :SEQUENCIA'
      'AND'
      'TIPO = '#39'I3'#39
      'order by co_dim_tempo desc')
    Left = 690
    Top = 271
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'SEQUENCIA'
        Value = nil
      end>
    object qryDetConsultaOdontoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qryDetConsultaOdontoSEQUENCIA: TIntegerField
      FieldName = 'SEQUENCIA'
      Required = True
    end
    object qryDetConsultaOdontoCPF: TStringField
      FieldName = 'CPF'
    end
    object qryDetConsultaOdontoCNS: TStringField
      FieldName = 'CNS'
    end
    object qryDetConsultaOdontoNU_CBO: TStringField
      FieldName = 'NU_CBO'
    end
    object qryDetConsultaOdontoNU_CBO1: TStringField
      FieldName = 'NU_CBO1'
    end
    object qryDetConsultaOdontoNO_CBO: TStringField
      FieldName = 'NO_CBO'
      Size = 255
    end
    object qryDetConsultaOdontoNO_CBO1: TStringField
      FieldName = 'NO_CBO1'
      Size = 255
    end
    object qryDetConsultaOdontoNO_CNES: TStringField
      FieldName = 'NO_CNES'
      Size = 255
    end
    object qryDetConsultaOdontoCOD_UNIDADE_SAUDE: TIntegerField
      FieldName = 'COD_UNIDADE_SAUDE'
    end
    object qryDetConsultaOdontoNO_UNIDADE_SAUDE: TStringField
      FieldName = 'NO_UNIDADE_SAUDE'
      Size = 255
    end
    object qryDetConsultaOdontoNU_INE: TStringField
      FieldName = 'NU_INE'
      Size = 10
    end
    object qryDetConsultaOdontoNO_EQUIPE: TStringField
      FieldName = 'NO_EQUIPE'
      Size = 255
    end
    object qryDetConsultaOdontoCO_DIM_TEMPO: TDateField
      FieldName = 'CO_DIM_TEMPO'
    end
    object qryDetConsultaOdontoNOME_EQUIPE: TStringField
      FieldName = 'NOME_EQUIPE'
      Size = 255
    end
    object qryDetConsultaOdontoCIAPS: TStringField
      FieldName = 'CIAPS'
      Size = 255
    end
    object qryDetConsultaOdontoCIDS: TStringField
      FieldName = 'CIDS'
      Size = 255
    end
    object qryDetConsultaOdontoCNS_PROFISSIONAL: TStringField
      FieldName = 'CNS_PROFISSIONAL'
    end
    object qryDetConsultaOdontoNO_PROFISSIONAL: TStringField
      FieldName = 'NO_PROFISSIONAL'
      Size = 255
    end
    object qryDetConsultaOdontoCO_FAT_CIDADAO_PEC: TIntegerField
      FieldName = 'CO_FAT_CIDADAO_PEC'
    end
    object qryDetConsultaOdontoPROCEDIMENTO1: TStringField
      FieldName = 'PROCEDIMENTO1'
      Size = 255
    end
    object qryDetConsultaOdontoPROCEDIMENTO2: TStringField
      FieldName = 'PROCEDIMENTO2'
      Size = 255
    end
    object qryDetConsultaOdontoTIPO_EXAME: TStringField
      FieldName = 'TIPO_EXAME'
      Size = 10
    end
    object qryDetConsultaOdontoORIGEMDADOS: TStringField
      FieldName = 'ORIGEMDADOS'
      Size = 255
    end
    object qryDetConsultaOdontoODONTO_ST_GESTANTE: TIntegerField
      FieldName = 'ODONTO_ST_GESTANTE'
      OnGetText = qryDetConsultaOdontoODONTO_ST_GESTANTEGetText
    end
    object qryDetConsultaOdontoODONTO_PROCEDIMENTO: TStringField
      FieldName = 'ODONTO_PROCEDIMENTO'
      Size = 255
    end
    object qryDetConsultaOdontoTIPO: TStringField
      FieldName = 'TIPO'
      FixedChar = True
      Size = 2
    end
  end
  object dsDetConsultaOdonto: TDataSource
    AutoEdit = False
    DataSet = qryDetConsultaOdonto
    Left = 690
    Top = 311
  end
  object qryTotalizador: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'Select '
      
        '(select count(*) as total_ind_1 from tmp_gestantes where indicad' +
        'or1=1) as total_ind_1,'
      
        '(select count(*) as total_ind_2 from tmp_gestantes where indicad' +
        'or2=1) as total_ind_2,'
      
        '(select count(*) as total_ind_3 from tmp_gestantes where indicad' +
        'or3=1) as total_ind_3,'
      '(select count(*) as total_reg from tmp_gestantes) as total_reg'
      'from '
      'tmp_gestantes '
      
        'order by sequencia, cidadao_nome                                ' +
        '   ')
    Left = 314
    Top = 273
  end
end
