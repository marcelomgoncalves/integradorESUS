object FCidadao: TFCidadao
  Left = 0
  Top = 0
  Caption = 'Cidad'#227'os Cadastrados no e-SUS '
  ClientHeight = 534
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
    Caption = 'Consulta Cidad'#227'o'
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
    Height = 333
    Align = alClient
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 2
    object Panel4: TPanel
      Left = 1
      Top = 294
      Width = 1085
      Height = 38
      Align = alBottom
      Color = clInactiveBorder
      ParentBackground = False
      TabOrder = 0
      object lblRegistros: TLabel
        Left = 15
        Top = 14
        Width = 174
        Height = 13
        Caption = 'N'#186' Total de Registros Selecionados: '
      end
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 1085
      Height = 293
      Align = alClient
      BorderStyle = bsNone
      DataSource = dsCidadao
      FixedColor = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -13
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = [fsBold]
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'co_seq_cds_cad_individual'
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_cad_individual'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'no_cidadao'
          Width = 329
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nu_cpf_cidadao'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nu_cns'
          Width = 128
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'dt_nascimento'
          Width = 90
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'idade'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'raca_cor'
          Width = 114
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'sg_sexo'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'no_unidade_saude'
          Width = 223
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'no_equipe'
          Title.Caption = 'Equipe'
          Width = 280
          Visible = True
        end>
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 478
    Width = 1087
    Height = 56
    Align = alBottom
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 3
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
      Left = 199
      Top = 11
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
    object Label3: TLabel
      Left = 286
      Top = 11
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
    object Label4: TLabel
      Left = 373
      Top = 11
      Width = 44
      Height = 13
      Caption = 'G'#234'nero:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 484
      Top = 53
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
      Left = 484
      Top = 11
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
      Top = 53
      Width = 40
      Height = 13
      Caption = 'Equipe:'
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
      Width = 177
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
    object edIdadeInicial: TEdit
      Left = 199
      Top = 26
      Width = 81
      Height = 21
      TabOrder = 1
    end
    object edIdadeFinal: TEdit
      Left = 286
      Top = 26
      Width = 81
      Height = 21
      TabOrder = 2
    end
    object cbGenero: TRzComboBox
      Left = 373
      Top = 26
      Width = 105
      Height = 21
      Style = csDropDownList
      TabOrder = 3
      Text = 'Todos'
      Items.Strings = (
        'Masculino'
        'Feminino'
        'Todos')
      ItemIndex = 2
      Values.Strings = (
        'M'
        'F'
        'N')
    end
    object RzBitBtn1: TRzBitBtn
      Left = 952
      Top = 24
      Width = 121
      Height = 24
      Caption = '&Pesquisar'
      TabOrder = 4
      OnClick = RzBitBtn1Click
    end
    object edTermo: TEdit
      Left = 484
      Top = 68
      Width = 462
      Height = 21
      TabOrder = 5
    end
    object cbUnidade: TRzComboBox
      Left = 488
      Top = 24
      Width = 458
      Height = 21
      TabOrder = 6
    end
    object cbEquipe: TRzComboBox
      Left = 16
      Top = 72
      Width = 458
      Height = 21
      TabOrder = 7
    end
  end
  object QryCidadao: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      
        'select distinct on (tb_cds_cad_individual.co_seq_cds_cad_individ' +
        'ual)'
      'tb_cds_cad_individual.co_seq_cds_cad_individual,'
      'tb_cds_cad_individual.dt_cad_individual::date,'
      'tb_cds_cad_individual.no_cidadao , '
      'tb_cds_cad_individual.co_sexo,'
      'tb_fat_cad_individual.nu_cpf_cidadao ,                '
      'tb_fat_cad_individual.nu_cns ,                        '
      'tb_fat_cad_individual.dt_nascimento,  '
      
        '(extract(year from age(current_date,tb_fat_cad_individual.dt_nas' +
        'cimento))) as idade,'
      
        '(select no_municipio from tb_dim_municipio where co_seq_dim_muni' +
        'cipio = tb_fat_cad_individual.co_dim_municipio) as MUNIC_RESID,'
      'tb_dim_unidade_saude.no_unidade_saude,'
      'tb_dim_unidade_saude.co_seq_dim_unidade_saude,'
      'tb_dim_equipe.no_equipe,'
      'tb_dim_equipe.co_seq_dim_equipe,'
      'tb_dim_sexo.sg_sexo,'
      
        '(select nu_cns from tb_cds_prof where co_seq_cds_prof = tb_cds_c' +
        'ad_individual.co_cds_prof_cadastrante) as CNS_PROF,'
      'tb_dim_unidade_saude.nu_cnes as CNES,'
      
        '(select nu_ine from tb_dim_equipe where co_seq_dim_equipe = tb_f' +
        'at_cad_individual.co_dim_equipe) as INE,      '
      
        '--(select sg_sexo from tb_dim_sexo where co_seq_dim_sexo = tb_fa' +
        't_cad_individual.co_dim_sexo) as SEXO,'
      
        '(select ds_raca_cor from tb_dim_raca_cor where co_seq_dim_raca_c' +
        'or = tb_fat_cad_individual.co_dim_raca_cor) as RACA_COR,      '
      
        '(select ds_nacionalidade from tb_dim_nacionalidade where co_seq_' +
        'dim_nacionalidade = tb_fat_cad_individual.co_dim_nacionalidade) ' +
        'as nacionalidade'
      'from tb_cds_cad_individual      '
      
        'inner join tb_fat_cad_individual on tb_fat_cad_individual.nu_uui' +
        'd_ficha = tb_cds_cad_individual.co_unico_ficha      '
      
        '--inner join tb_cds_cidadao_resposta on co_cds_cad_individual = ' +
        'co_seq_cds_cad_individual      '
      
        'inner join tb_dim_unidade_saude on tb_dim_unidade_saude.co_seq_d' +
        'im_unidade_saude = tb_fat_cad_individual.co_dim_unidade_saude   ' +
        ' '
      
        'inner join tb_dim_equipe on tb_dim_equipe.co_seq_dim_equipe = tb' +
        '_fat_cad_individual.co_dim_equipe  '
      
        'inner join tb_dim_sexo on tb_dim_sexo.co_seq_dim_sexo = tb_fat_c' +
        'ad_individual.co_dim_sexo  '
      
        'where tb_cds_cad_individual.st_versao_atual = 1 and tb_cds_cad_i' +
        'ndividual.st_ficha_inativa = 0'
      'and tb_cds_cad_individual.dt_obito is null')
    Left = 688
    Top = 321
    object QryCidadaoco_seq_cds_cad_individual: TLargeintField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'co_seq_cds_cad_individual'
      ReadOnly = True
    end
    object QryCidadaodt_cad_individual: TDateField
      DisplayLabel = 'Data Cad.'
      FieldName = 'dt_cad_individual'
    end
    object QryCidadaono_cidadao: TStringField
      DisplayLabel = 'Nome do Cidad'#227'o'
      FieldName = 'no_cidadao'
      Size = 255
    end
    object QryCidadaoco_sexo: TLargeintField
      DisplayLabel = 'Cod. Sexo'
      FieldName = 'co_sexo'
    end
    object QryCidadaonu_cpf_cidadao: TStringField
      DisplayLabel = 'CPF'
      FieldName = 'nu_cpf_cidadao'
      ReadOnly = True
      Size = 11
    end
    object QryCidadaonu_cns: TStringField
      DisplayLabel = 'CNS'
      FieldName = 'nu_cns'
      ReadOnly = True
      FixedChar = True
      Size = 15
    end
    object QryCidadaodt_nascimento: TDateField
      DisplayLabel = 'Data Nascto'
      FieldName = 'dt_nascimento'
      ReadOnly = True
    end
    object QryCidadaoidade: TFloatField
      DisplayLabel = 'Idade'
      FieldName = 'idade'
      ReadOnly = True
    end
    object QryCidadaomunic_resid: TStringField
      DisplayLabel = 'Municipo Resid'#234'ncia'
      FieldName = 'munic_resid'
      ReadOnly = True
      Size = 500
    end
    object QryCidadaono_unidade_saude: TStringField
      DisplayLabel = 'Unidade'
      FieldName = 'no_unidade_saude'
      ReadOnly = True
      Size = 500
    end
    object QryCidadaocns_prof: TStringField
      DisplayLabel = 'CNS do Profissional'
      FieldName = 'cns_prof'
      ReadOnly = True
      Size = 16
    end
    object QryCidadaocnes: TStringField
      DisplayLabel = 'CNES'
      FieldName = 'cnes'
      ReadOnly = True
    end
    object QryCidadaoine: TStringField
      DisplayLabel = 'INE'
      FieldName = 'ine'
      ReadOnly = True
    end
    object QryCidadaoraca_cor: TStringField
      DisplayLabel = 'Ra'#231'a/Cor'
      FieldName = 'raca_cor'
      ReadOnly = True
      Size = 500
    end
    object QryCidadaonacionalidade: TStringField
      FieldName = 'nacionalidade'
      ReadOnly = True
      Size = 100
    end
    object QryCidadaono_equipe: TStringField
      FieldName = 'no_equipe'
      ReadOnly = True
      Size = 255
    end
    object QryCidadaosg_sexo: TStringField
      DisplayLabel = 'Sexo'
      FieldName = 'sg_sexo'
      ReadOnly = True
      Size = 100
    end
  end
  object dsCidadao: TDataSource
    AutoEdit = False
    DataSet = QryCidadao
    Left = 688
    Top = 377
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
  object qryEquipe: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      
        'select co_seq_dim_equipe, no_equipe from tb_dim_equipe order by ' +
        'co_seq_dim_equipe')
    Left = 968
    Top = 321
  end
  object dsUnidade: TDataSource
    AutoEdit = False
    DataSet = qryUnidade
    Left = 880
    Top = 385
  end
  object dsEquipe: TDataSource
    AutoEdit = False
    DataSet = qryEquipe
    Left = 968
    Top = 385
  end
end
