object FVacinacaoCovid: TFVacinacaoCovid
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
    Caption = 'VACINA'#199#195'O CONTRA A COVID-19'
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
    Width = 1087
    Height = 401
    Align = alClient
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 2
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 68
      Width = 1085
      Height = 332
      Hint = ''
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Dados dos Vacinados'
        object Panel4: TPanel
          Left = 0
          Top = 281
          Width = 1081
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 0
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
        end
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1081
          Height = 281
          Align = alClient
          DataSource = DataSource1
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'NO_CIDADAO'
              Title.Caption = 'Nome Cidad'#227'o'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NU_CPF'
              Title.Caption = 'CPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NU_CNS'
              Title.Caption = 'CNS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_NASCTO'
              Title.Caption = 'Data Nascto'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_APLICACAO_DOSE'
              Title.Caption = 'Data 1'#170' Dose'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE_VACINA_DOSE'
              Title.Caption = 'Lote 1'#170' Dose'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA_APLICACAO_D2'
              Title.Caption = 'Data 2'#170' Dose'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE_VACINA_D2'
              Title.Caption = 'Lote 2'#170' Dose'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NO_IMUNIZANTE'
              Title.Caption = 'Imunizante'
              Width = 395
              Visible = True
            end>
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
        object Label4: TLabel
          Left = 1
          Top = 1
          Width = 745
          Height = 57
          Align = alClient
          Alignment = taCenter
          Caption = #205'NDICE DE POPULA'#199#195'O VACINADA CONFORME DADOS DO IBGE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
          ExplicitWidth = 543
          ExplicitHeight = 23
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
        object lblIndice: TLabel
          Left = 1
          Top = 1
          Width = 322
          Height = 57
          Align = alClient
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
          ExplicitHeight = 62
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
      Left = 16
      Top = 58
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
      Top = 23
      Width = 121
      Height = 75
      Caption = '&Pesquisar'
      TabOrder = 1
      OnClick = RzBitBtn1Click
    end
    object edTermo: TEdit
      Left = 16
      Top = 77
      Width = 930
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
    object edDataInicial: TRzDateTimeEdit
      Left = 175
      Top = 26
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 4
    end
    object edDataFinal: TRzDateTimeEdit
      Left = 304
      Top = 26
      Width = 121
      Height = 21
      EditType = etDate
      TabOrder = 5
    end
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
      
        'select distinct(lpad(nu_micro_area,2,'#39'0'#39')), lpad(nu_micro_area,2' +
        ','#39'0'#39') as dsMicroArea from tb_fat_cad_domiciliar group by nu_micr' +
        'o_area'
      'union'
      
        'select distinct(lpad(nu_micro_area,2,'#39'0'#39')), lpad(nu_micro_area,2' +
        ','#39'0'#39') as dsMicroArea from tb_fat_cad_individual group by nu_micr' +
        'o_area'
      'union '
      
        'select distinct(lpad(nu_micro_area,2,'#39'0'#39')), lpad(nu_micro_area,2' +
        ','#39'0'#39') as dsMicroArea from tb_cds_cad_individual group by nu_micr' +
        'o_area'
      'union'
      
        'select '#39'TODAS'#39' as nu_micro_area,'#39'999999'#39' as dsMicroArea from tb_' +
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
  object UniQuery1: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'select'
      'distinct(vacinacao.nu_cns), '
      'vacinacao.no_cidadao,'
      'vacinacao.nu_cpf,'
      'vacinacao.data_Nascto,'
      'vacinacao.dose_aplicada,'
      'vacinacao.data_aplicacao_dose,'
      'vacinacao.lote_vacina_dose,'
      'vacinacao.dose_aplicada2 as d2_aplicada,'
      'vacinacao.data_aplicacao_d2 as data_aplicacao_d2,'
      'vacinacao.lote_vacina_d2 as lote_vacina_d2,'
      'vacinacao.no_imunizante,'
      'vacinacao.no_unidade_saude'
      'from tb_vacinacao as vacinacao'
      
        'where vacinacao.data_aplicacao_dose between :dia_inicial and :di' +
        'a_final'
      ''
      ''
      'order by vacinacao.no_cidadao;')
    Left = 498
    Top = 329
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'dia_inicial'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'dia_final'
        Value = nil
      end>
    object UniQuery1NO_CIDADAO: TStringField
      FieldName = 'NO_CIDADAO'
      Required = True
      Size = 500
    end
    object UniQuery1NU_CPF: TStringField
      FieldName = 'NU_CPF'
      Required = True
      Size = 15
    end
    object UniQuery1NU_CNS: TStringField
      FieldName = 'NU_CNS'
      Size = 30
    end
    object UniQuery1DATA_NASCTO: TDateField
      FieldName = 'DATA_NASCTO'
    end
    object UniQuery1NO_UNIDADE_SAUDE: TStringField
      FieldName = 'NO_UNIDADE_SAUDE'
      Size = 200
    end
    object UniQuery1NO_IMUNIZANTE: TStringField
      FieldName = 'NO_IMUNIZANTE'
      Size = 250
    end
    object UniQuery1DOSE_APLICADA: TStringField
      FieldName = 'DOSE_APLICADA'
      Size = 100
    end
    object UniQuery1DATA_APLICACAO_DOSE: TDateTimeField
      FieldName = 'DATA_APLICACAO_DOSE'
    end
    object UniQuery1LOTE_VACINA_DOSE: TStringField
      FieldName = 'LOTE_VACINA_DOSE'
      Size = 100
    end
    object UniQuery1D2_APLICADA: TStringField
      FieldName = 'D2_APLICADA'
      Size = 100
    end
    object UniQuery1DATA_APLICACAO_D2: TDateTimeField
      FieldName = 'DATA_APLICACAO_D2'
    end
    object UniQuery1LOTE_VACINA_D2: TStringField
      FieldName = 'LOTE_VACINA_D2'
      Size = 100
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = UniQuery1
    Left = 506
    Top = 409
  end
  object qryTotalVacinados: TUniQuery
    Connection = DM.ConexaoLocal
    SQL.Strings = (
      'select count(*) as total from tb_vacinacao;')
    Left = 634
    Top = 337
  end
end
