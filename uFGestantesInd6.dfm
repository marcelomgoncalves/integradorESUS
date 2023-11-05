object FGestantesInd6: TFGestantesInd6
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
      'INDICADOR 6 - Percentual de pessoas hipertensas com press'#227'o arte' +
      'rial aferida em cada semestre'
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
    Height = 360
    Align = alClient
    Color = clInactiveBorder
    ParentBackground = False
    TabOrder = 2
    ExplicitHeight = 401
    object RzPageControl1: TRzPageControl
      Left = 1
      Top = 68
      Width = 1085
      Height = 291
      Hint = ''
      ActivePage = TabSheet2
      Align = alClient
      TabIndex = 1
      TabOrder = 0
      ExplicitHeight = 332
      FixedDimension = 19
      object TabSheet1: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Indicador 6 - Dentro do Indicador'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 0
          Width = 1081
          Height = 240
          Align = alClient
          BorderStyle = bsNone
          DataSource = DataSource1
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
              FieldName = 'idade'
              Title.Caption = 'Idade'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nocidadaopath'
              Title.Caption = 'Nome do Cidad'#227'o'
              Width = 391
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cnspath'
              Title.Caption = 'CNS'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dtultimoatendpath_1'
              Title.Caption = 'Ult. Medi'#231#227'o'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telcontato'
              Title.Caption = 'Telefone'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'no_unidade_saude'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 373
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nu_micro_area'
              Title.Caption = 'MA'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total1'
              Title.Caption = 'Total 1'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total2'
              Title.Caption = 'Total 2'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'st_cidadao_consistente'
              Title.Caption = 'Cid. Consistente ?'
              Visible = True
            end>
        end
        object Panel4: TPanel
          Left = 0
          Top = 240
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
          object Gauge1: TGauge
            Left = 563
            Top = 4
            Width = 511
            Height = 21
            Progress = 0
          end
        end
      end
      object TabSheet2: TRzTabSheet
        Color = clInactiveBorder
        Caption = 'Indicador 6 - Fora do Indicador'
        ExplicitHeight = 309
        object DBGrid2: TDBGrid
          Left = 0
          Top = 0
          Width = 1081
          Height = 240
          Align = alClient
          BorderStyle = bsNone
          DataSource = DataSource2
          FixedColor = clRed
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
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
              FieldName = 'idade'
              Title.Caption = 'Idade'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nocidadaopath'
              Title.Caption = 'Nome do Cidad'#227'o'
              Width = 391
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'cnspath'
              Title.Caption = 'CNS'
              Width = 118
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'dtultimoatendpath_1'
              Title.Caption = 'Ult. Medi'#231#227'o'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'telcontato'
              Title.Caption = 'Telefone'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'no_unidade_saude'
              Title.Caption = 'Unidade de Sa'#250'de'
              Width = 373
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nu_micro_area'
              Title.Caption = 'MA'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total1'
              Title.Caption = 'Sem. Anterior'
              Width = 106
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'total2'
              Title.Caption = 'Sem. Atual'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'st_cidadao_consistente'
              Title.Caption = 'Cid. Consistente ?'
              Visible = True
            end>
        end
        object Panel6: TPanel
          Left = 0
          Top = 240
          Width = 1081
          Height = 28
          Align = alBottom
          Color = clInactiveBorder
          ParentBackground = False
          TabOrder = 1
          ExplicitTop = 281
          object lblRegFora: TLabel
            Left = 1
            Top = 1
            Width = 159
            Height = 26
            Align = alLeft
            Caption = 'Total de Registros Selecionados: '
            Layout = tlCenter
            ExplicitHeight = 13
          end
          object Gauge2: TGauge
            Left = 563
            Top = 4
            Width = 511
            Height = 21
            Progress = 0
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
        DesignSize = (
          747
          59)
        object lblNumerador: TLabel
          Left = 0
          Top = 1
          Width = 358
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object lblDenominador: TLabel
          Left = 384
          Top = 1
          Width = 361
          Height = 22
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object lblDenom_estimado: TLabel
          Left = 386
          Top = 32
          Width = 361
          Height = 20
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight, akBottom]
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
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
      Top = 53
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
      Height = 24
      Caption = '&Pesquisar'
      TabOrder = 1
      OnClick = RzBitBtn1Click
    end
    object edTermo: TEdit
      Left = 484
      Top = 72
      Width = 462
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
      Width = 458
      Height = 21
      TabOrder = 4
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        'FA')
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
  end
  object Panel10: TPanel
    Left = 0
    Top = 505
    Width = 1087
    Height = 41
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 506
    DesignSize = (
      1087
      41)
    object SpeedButton1: TSpeedButton
      Left = 521
      Top = 2
      Width = 44
      Height = 38
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
  object qryUnidade: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      
        'select nu_cnes, no_unidade_saude from tb_dim_unidade_saude order' +
        ' by co_seq_dim_unidade_saude')
    Left = 880
    Top = 321
    object qryUnidadenu_cnes: TStringField
      FieldName = 'nu_cnes'
    end
    object qryUnidadeno_unidade_saude: TStringField
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
    Connection = DM.conexaoEsus
    SQL.Strings = (
      'WITH hipertensos AS ('
      
        #9'select coSeqCidadaoPath, co_seq_fat_cidadao_pec,no_unidade_saud' +
        'e, noCidadaoPath,   '
      
        #9'cnsPath, cpfPath, coalesce(telCelularPath, telContatoPath ) as ' +
        'telcontato, '
      #9'date_part('#39'year'#39', age(dataNascPath))||'#39' Anos'#39' AS idadeatual,'
      
        #9'dtUltimoAtendQueryPath.dtUltimoAtendPath::date, nu_micro_area, ' +
        'st_cidadao_consistente'
      
        #9'from (select cidadao.CO_SEQ_CIDADAO as coSeqCidadaoPath, no_uni' +
        'dade_saude,co_seq_fat_cidadao_pec,'
      
        '   cidadao.NO_CIDADAO as noCidadaoPath, cidadao.NO_SOCIAL as noS' +
        'ocialPath, '
      
        #9#9'  cidadao.DT_NASCIMENTO as dataNascPath, cidadao.NU_CNS as cns' +
        'Path,'
      
        #9#9'  cidadao.NU_CPF as cpfPath, cidadao.NU_TELEFONE_RESIDENCIAL a' +
        's telResidencialPath, '
      
        #9#9'  cidadao.NU_TELEFONE_CELULAR as telCelularPath, cidadao.NU_TE' +
        'LEFONE_CONTATO as telContatoPath, '
      
        #9#9'  cidadao.DS_LOGRADOURO as logradouroPath, cidadao.NU_NUMERO a' +
        's numeroPath, '
      
        #9#9'  cidadao.DS_COMPLEMENTO as complementoPath, cidadao.NO_BAIRRO' +
        ' as bairroPath, cidadao.DS_CEP as cepPath, '
      
        #9#9'  cidadao.CO_UF as ufPath, cidadao.CO_LOCALIDADE_ENDERECO as l' +
        'ocalidadePath, '
      #9#9'  cidadao.TP_LOGRADOURO as tipoLogradouroPath,'
      
        #9#9'  tb_fat_cidadao_territorio.nu_micro_area, st_cidadao_consiste' +
        'nte'
      #9'from TB_CIDADAO cidadao'
      #9'inner join TB_CIDADAO_VINCULACAO_EQUIPE cidadaoVinculacaoEquipe'
      #9'on cidadaoVinculacaoEquipe.CO_CIDADAO = cidadao.CO_SEQ_CIDADAO'
      '    inner join tb_fat_cidadao_pec on'
      '    tb_fat_cidadao_pec.co_cidadao = cidadao.co_seq_cidadao'
      '    left join tb_dim_unidade_saude on'
      #9'tb_dim_unidade_saude.nu_cnes = cidadaoVinculacaoEquipe.nu_cnes'#9
      #9'left join tb_fat_cidadao_territorio on'
      
        #9'tb_fat_cidadao_territorio.co_fat_cidadao_pec = tb_fat_cidadao_p' +
        'ec.co_seq_fat_cidadao_pec and'
      
        #9'tb_fat_cidadao_territorio.co_dim_unidade_saude = tb_dim_unidade' +
        '_saude.co_seq_dim_unidade_sAude'#9'  '
      #9'where exists (select 1 as col_1'
      
        #9'from ((select prontuario.CO_CIDADAO as idCidadaoSubqueryPath, g' +
        'rupoCondicaoCiapCid.CO_GRUPO_CONDICAO as idGrupoSubqueryPath'
      #9'from TB_PROBLEMA problema'
      #9'inner join TB_PROBLEMA_EVOLUCAO problemaEvolucao'
      
        #9'on problemaEvolucao.CO_SEQ_PROBLEMA_EVOLUCAO = problema.CO_ULTI' +
        'MO_PROBLEMA_EVOLUCAO'
      #9'inner join TB_PRONTUARIO prontuario'
      #9'on prontuario.CO_SEQ_PRONTUARIO = problema.CO_PRONTUARIO'
      #9'left join RL_GRUPO_CONDICAO_CIAP_CID grupoCondicaoCiapCid'
      
        #9'on (grupoCondicaoCiapCid.CO_CIAP = problema.CO_CIAP or grupoCon' +
        'dicaoCiapCid.CO_CID10 = problema.CO_CID10)'
      #9#9'   and grupoCondicaoCiapCid.CO_GRUPO_CONDICAO = 10'
      #9'where problemaEvolucao.CO_SITUACAO_PROBLEMA = 0'
      
        #9'group by prontuario.CO_CIDADAO, grupoCondicaoCiapCid.CO_GRUPO_C' +
        'ONDICAO)'
      #9'union'
      
        #9'(select prontuario.CO_CIDADAO as idCidadaoSubqueryPath, grupoCo' +
        'ndicaoCiapCid.CO_GRUPO_CONDICAO as idGrupoSubqueryPath'
      #9'from TB_PRONTUARIO prontuario'
      #9'inner join TB_PRONTUARIO qProntuario'
      
        #9'on qProntuario.CO_PRONTUARIO_GRUPO = prontuario.CO_SEQ_PRONTUAR' +
        'IO'
      #9'inner join TB_ATEND atendimento'
      #9'on atendimento.CO_PRONTUARIO = qProntuario.CO_SEQ_PRONTUARIO'
      #9'inner join TB_ATEND_PROF atendimentoProfissional'
      #9'on atendimentoProfissional.CO_ATEND = atendimento.CO_SEQ_ATEND'
      
        #9'inner join RL_EVOLUCAO_AVALIACAO_CIAP_CID evolucaoAvaliacaoCiap' +
        'Cid'
      
        #9'on evolucaoAvaliacaoCiapCid.CO_ATEND_PROF = atendimentoProfissi' +
        'onal.CO_SEQ_ATEND_PROF'
      #9'left join RL_GRUPO_CONDICAO_CIAP_CID grupoCondicaoCiapCid'
      
        #9'on (grupoCondicaoCiapCid.CO_CIAP = evolucaoAvaliacaoCiapCid.CO_' +
        'CIAP'
      
        #9#9'or grupoCondicaoCiapCid.CO_CID10 = evolucaoAvaliacaoCiapCid.CO' +
        '_CID10) '
      #9' and grupoCondicaoCiapCid.CO_GRUPO_CONDICAO = 10'
      
        #9'group by prontuario.CO_CIDADAO, grupoCondicaoCiapCid.CO_GRUPO_C' +
        'ONDICAO)'
      #9'union'
      #9'(select fatoCidadaoPec.CO_CIDADAO as idCidadaoSubqueryPath,'
      #9' grupoCondicaoCiapCid.CO_GRUPO_CONDICAO as idGrupoSubqueryPath'
      #9'from TB_FAT_ATD_IND_PROBLEMAS fatoAtendIndProblema'
      #9'join TB_FAT_CIDADAO_PEC fatoCidadaoPec'
      
        #9'on fatoCidadaoPec.CO_SEQ_FAT_CIDADAO_PEC = fatoAtendIndProblema' +
        '.CO_FAT_CIDADAO_PEC'
      #9'left join TB_DIM_CIAP dimCiap'
      
        #9'on dimCiap.CO_SEQ_DIM_CIAP = fatoAtendIndProblema.CO_DIM_CIAP a' +
        'nd fatoAtendIndProblema.CO_DIM_CIAP != 1'
      #9'left join TB_DIM_CID dimCid'
      
        #9'on dimCid.CO_SEQ_DIM_CID = fatoAtendIndProblema.CO_DIM_CID and ' +
        'fatoAtendIndProblema.CO_DIM_CID != 1'
      #9'left join TB_CIAP ciap'
      #9'on ciap.CO_CIAP = dimCiap.NU_CIAP'
      #9'left join TB_CID10 cid10'
      #9'on cid10.NU_CID10 = dimCid.NU_CID'
      #9'left join RL_GRUPO_CONDICAO_CIAP_CID grupoCondicaoCiapCid'
      
        #9'on (grupoCondicaoCiapCid.CO_CIAP = ciap.CO_SEQ_CIAP or grupoCon' +
        'dicaoCiapCid.CO_CID10 = cid10.CO_CID10) '
      #9' and grupoCondicaoCiapCid.CO_GRUPO_CONDICAO = 10'
      
        #9'group by fatoCidadaoPec.CO_CIDADAO, grupoCondicaoCiapCid.CO_GRU' +
        'PO_CONDICAO)) as unionPath'
      #9'where idCidadaoSubqueryPath = cidadao.CO_SEQ_CIDADAO'
      
        #9'having count(distinct idGrupoSubqueryPath) = 1) and cidadaoVinc' +
        'ulacaoEquipe.NU_CNES = :unidade_saude )'
      #9'as resultQueryPath'
      
        #9'left join (select unionDatePath.cidadaoIdPath as idCidadaoDataP' +
        'ath, max(unionDatePath.dataUltimoAtendimentoPath)'
      #9#9#9'   as dtUltimoAtendPath'
      
        #9'from ((select fatoCidadaoPec.CO_CIDADAO as cidadaoIdPath, fatoA' +
        'tendimentoIndividual.DT_FINAL_ATENDIMENTO '
      #9#9'   as dataUltimoAtendimentoPath'
      #9'from TB_CIDADAO_VINCULACAO_EQUIPE cidadaoVinculacaoEquipe'
      #9'join TB_FAT_CIDADAO_PEC fatoCidadaoPec'
      
        #9'on fatoCidadaoPec.CO_CIDADAO = cidadaoVinculacaoEquipe.CO_CIDAD' +
        'AO'
      #9'join TB_FAT_ATENDIMENTO_INDIVIDUAL fatoAtendimentoIndividual'
      
        #9'on fatoCidadaoPec.CO_SEQ_FAT_CIDADAO_PEC = fatoAtendimentoIndiv' +
        'idual.CO_FAT_CIDADAO_PEC'
      #9'where cidadaoVinculacaoEquipe.NU_CNES = :unidade_saude )'
      #9'union'
      
        #9'(select pront.CO_CIDADAO as cidadaoIdPath, atendimentoProfissio' +
        'nal.DT_FIM as dataUltimoAtendimentoPath'
      #9'from TB_CIDADAO_VINCULACAO_EQUIPE cidadaoVinculacaoEquipe'
      #9'join TB_PRONTUARIO pront'
      #9'on pront.CO_CIDADAO = cidadaoVinculacaoEquipe.CO_CIDADAO'
      #9'join TB_PRONTUARIO prontuario'
      #9'on prontuario.CO_PRONTUARIO_GRUPO = pront.CO_SEQ_PRONTUARIO'
      #9'join TB_ATEND atendimento'
      #9'on atendimento.CO_PRONTUARIO = prontuario.CO_SEQ_PRONTUARIO'
      #9'join TB_ATEND_PROF atendimentoProfissional'
      #9'on atendimentoProfissional.CO_ATEND = atendimento.CO_SEQ_ATEND'
      
        #9'where cidadaoVinculacaoEquipe.NU_CNES =   :unidade_saude )) as ' +
        'unionDatePath'
      #9'group by unionDatePath.cidadaoIdPath) as dtUltimoAtendQueryPath'
      #9'on coSeqCidadaoPath = dtUltimoAtendQueryPath.idCidadaoDataPath'
      #9
      ') '
      'select '
      'idadeatual::varchar(20) as idade,'
      'noCidadaoPath, '
      'st_cidadao_consistente, '
      'dtUltimoAtendPath, '
      'cnsPath, '
      'dtUltimoAtendPath::date,'
      'telcontato, '
      'no_unidade_saude, '
      'nu_micro_area, '
      'total1, '
      'total2 '
      'from hipertensos'
      'left join ('
      
        '    select count(*)::int as total1, co_fat_cidadao_pec from tb_f' +
        'at_proced_atend'
      '    where '
      
        #9'dt_inicial_atendimento::date between (:dia_final::date - INTERV' +
        'AL'#39'1 year'#39') and (:dia_final::date - INTERVAL'#39'6 months'#39')'
      
        #9'and  (ds_filtro_procedimento like '#39'%0301100039%'#39' or ds_filtro_p' +
        'rocedimento like '#39'%ABPG033%'#39')'
      '    Group By co_fat_cidadao_pec) as atendimentos1 '
      'on'
      
        #9'hipertensos.co_seq_fat_cidadao_pec = atendimentos1.co_fat_cidad' +
        'ao_pec'
      'left join ('
      
        '    select count(*)::int as total2, co_fat_cidadao_pec from tb_f' +
        'at_proced_atend'
      '    where '
      
        #9'dt_inicial_atendimento::date between (:dia_final::date - INTERV' +
        'AL'#39'6 months'#39') and :dia_final::date '
      
        #9'and  (ds_filtro_procedimento like '#39'%0301100039%'#39' or ds_filtro_p' +
        'rocedimento like '#39'%ABPG033%'#39')'
      '    Group By co_fat_cidadao_pec) as atendimentos2 '
      'on'
      
        #9'hipertensos.co_seq_fat_cidadao_pec = atendimentos2.co_fat_cidad' +
        'ao_pec'
      ''
      
        'where st_cidadao_consistente = 1  and total1::int >= 1 and total' +
        '2::int >= 1 '
      'order by nocidadaopath')
    Left = 466
    Top = 337
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'unidade_saude'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'dia_final'
        Value = nil
      end>
    object UniQuery1idade: TStringField
      FieldName = 'idade'
      ReadOnly = True
    end
    object UniQuery1nocidadaopath: TStringField
      FieldName = 'nocidadaopath'
      ReadOnly = True
      Size = 500
    end
    object UniQuery1st_cidadao_consistente: TIntegerField
      FieldName = 'st_cidadao_consistente'
      ReadOnly = True
      OnGetText = UniQuery1st_cidadao_consistenteGetText
    end
    object UniQuery1dtultimoatendpath: TDateField
      FieldName = 'dtultimoatendpath'
      ReadOnly = True
    end
    object UniQuery1cnspath: TStringField
      FieldName = 'cnspath'
      ReadOnly = True
      Size = 16
    end
    object UniQuery1dtultimoatendpath_1: TDateField
      FieldName = 'dtultimoatendpath_1'
      ReadOnly = True
    end
    object UniQuery1telcontato: TStringField
      FieldName = 'telcontato'
      ReadOnly = True
      Size = 255
    end
    object UniQuery1no_unidade_saude: TStringField
      FieldName = 'no_unidade_saude'
      ReadOnly = True
      Size = 500
    end
    object UniQuery1nu_micro_area: TStringField
      FieldName = 'nu_micro_area'
      ReadOnly = True
      Size = 3
    end
    object UniQuery1total1: TIntegerField
      FieldName = 'total1'
      ReadOnly = True
    end
    object UniQuery1total2: TIntegerField
      FieldName = 'total2'
      ReadOnly = True
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = UniQuery1
    Left = 458
    Top = 393
  end
  object UniQuery2: TUniQuery
    Connection = DM.conexaoEsus
    SQL.Strings = (
      'WITH hipertensos AS ('
      
        #9'select coSeqCidadaoPath, co_seq_fat_cidadao_pec,no_unidade_saud' +
        'e, noCidadaoPath,   '
      
        #9'cnsPath, cpfPath, coalesce(telCelularPath, telContatoPath ) as ' +
        'telcontato, '
      #9'date_part('#39'year'#39', age(dataNascPath))||'#39' Anos'#39' AS idadeatual,'
      
        #9'dtUltimoAtendQueryPath.dtUltimoAtendPath::date, nu_micro_area, ' +
        'st_cidadao_consistente'
      
        #9'from (select cidadao.CO_SEQ_CIDADAO as coSeqCidadaoPath, no_uni' +
        'dade_saude,co_seq_fat_cidadao_pec,'
      
        '   cidadao.NO_CIDADAO as noCidadaoPath, cidadao.NO_SOCIAL as noS' +
        'ocialPath, '
      
        #9#9'  cidadao.DT_NASCIMENTO as dataNascPath, cidadao.NU_CNS as cns' +
        'Path,'
      
        #9#9'  cidadao.NU_CPF as cpfPath, cidadao.NU_TELEFONE_RESIDENCIAL a' +
        's telResidencialPath, '
      
        #9#9'  cidadao.NU_TELEFONE_CELULAR as telCelularPath, cidadao.NU_TE' +
        'LEFONE_CONTATO as telContatoPath, '
      
        #9#9'  cidadao.DS_LOGRADOURO as logradouroPath, cidadao.NU_NUMERO a' +
        's numeroPath, '
      
        #9#9'  cidadao.DS_COMPLEMENTO as complementoPath, cidadao.NO_BAIRRO' +
        ' as bairroPath, cidadao.DS_CEP as cepPath, '
      
        #9#9'  cidadao.CO_UF as ufPath, cidadao.CO_LOCALIDADE_ENDERECO as l' +
        'ocalidadePath, '
      #9#9'  cidadao.TP_LOGRADOURO as tipoLogradouroPath,'
      
        #9#9'  tb_fat_cidadao_territorio.nu_micro_area, st_cidadao_consiste' +
        'nte'
      #9'from TB_CIDADAO cidadao'
      #9'inner join TB_CIDADAO_VINCULACAO_EQUIPE cidadaoVinculacaoEquipe'
      #9'on cidadaoVinculacaoEquipe.CO_CIDADAO = cidadao.CO_SEQ_CIDADAO'
      '    inner join tb_fat_cidadao_pec on'
      '    tb_fat_cidadao_pec.co_cidadao = cidadao.co_seq_cidadao'
      '    left join tb_dim_unidade_saude on'
      #9'tb_dim_unidade_saude.nu_cnes = cidadaoVinculacaoEquipe.nu_cnes'#9
      #9'left join tb_fat_cidadao_territorio on'
      
        #9'tb_fat_cidadao_territorio.co_fat_cidadao_pec = tb_fat_cidadao_p' +
        'ec.co_seq_fat_cidadao_pec and'
      
        #9'tb_fat_cidadao_territorio.co_dim_unidade_saude = tb_dim_unidade' +
        '_saude.co_seq_dim_unidade_sAude'#9'  '
      #9'where exists (select 1 as col_1'
      
        #9'from ((select prontuario.CO_CIDADAO as idCidadaoSubqueryPath, g' +
        'rupoCondicaoCiapCid.CO_GRUPO_CONDICAO as idGrupoSubqueryPath'
      #9'from TB_PROBLEMA problema'
      #9'inner join TB_PROBLEMA_EVOLUCAO problemaEvolucao'
      
        #9'on problemaEvolucao.CO_SEQ_PROBLEMA_EVOLUCAO = problema.CO_ULTI' +
        'MO_PROBLEMA_EVOLUCAO'
      #9'inner join TB_PRONTUARIO prontuario'
      #9'on prontuario.CO_SEQ_PRONTUARIO = problema.CO_PRONTUARIO'
      #9'left join RL_GRUPO_CONDICAO_CIAP_CID grupoCondicaoCiapCid'
      
        #9'on (grupoCondicaoCiapCid.CO_CIAP = problema.CO_CIAP or grupoCon' +
        'dicaoCiapCid.CO_CID10 = problema.CO_CID10)'
      #9#9'   and grupoCondicaoCiapCid.CO_GRUPO_CONDICAO = 10'
      #9'where problemaEvolucao.CO_SITUACAO_PROBLEMA = 0'
      
        #9'group by prontuario.CO_CIDADAO, grupoCondicaoCiapCid.CO_GRUPO_C' +
        'ONDICAO)'
      #9'union'
      
        #9'(select prontuario.CO_CIDADAO as idCidadaoSubqueryPath, grupoCo' +
        'ndicaoCiapCid.CO_GRUPO_CONDICAO as idGrupoSubqueryPath'
      #9'from TB_PRONTUARIO prontuario'
      #9'inner join TB_PRONTUARIO qProntuario'
      
        #9'on qProntuario.CO_PRONTUARIO_GRUPO = prontuario.CO_SEQ_PRONTUAR' +
        'IO'
      #9'inner join TB_ATEND atendimento'
      #9'on atendimento.CO_PRONTUARIO = qProntuario.CO_SEQ_PRONTUARIO'
      #9'inner join TB_ATEND_PROF atendimentoProfissional'
      #9'on atendimentoProfissional.CO_ATEND = atendimento.CO_SEQ_ATEND'
      
        #9'inner join RL_EVOLUCAO_AVALIACAO_CIAP_CID evolucaoAvaliacaoCiap' +
        'Cid'
      
        #9'on evolucaoAvaliacaoCiapCid.CO_ATEND_PROF = atendimentoProfissi' +
        'onal.CO_SEQ_ATEND_PROF'
      #9'left join RL_GRUPO_CONDICAO_CIAP_CID grupoCondicaoCiapCid'
      
        #9'on (grupoCondicaoCiapCid.CO_CIAP = evolucaoAvaliacaoCiapCid.CO_' +
        'CIAP'
      
        #9#9'or grupoCondicaoCiapCid.CO_CID10 = evolucaoAvaliacaoCiapCid.CO' +
        '_CID10) '
      #9' and grupoCondicaoCiapCid.CO_GRUPO_CONDICAO = 10'
      
        #9'group by prontuario.CO_CIDADAO, grupoCondicaoCiapCid.CO_GRUPO_C' +
        'ONDICAO)'
      #9'union'
      #9'(select fatoCidadaoPec.CO_CIDADAO as idCidadaoSubqueryPath,'
      #9' grupoCondicaoCiapCid.CO_GRUPO_CONDICAO as idGrupoSubqueryPath'
      #9'from TB_FAT_ATD_IND_PROBLEMAS fatoAtendIndProblema'
      #9'join TB_FAT_CIDADAO_PEC fatoCidadaoPec'
      
        #9'on fatoCidadaoPec.CO_SEQ_FAT_CIDADAO_PEC = fatoAtendIndProblema' +
        '.CO_FAT_CIDADAO_PEC'
      #9'left join TB_DIM_CIAP dimCiap'
      
        #9'on dimCiap.CO_SEQ_DIM_CIAP = fatoAtendIndProblema.CO_DIM_CIAP a' +
        'nd fatoAtendIndProblema.CO_DIM_CIAP != 1'
      #9'left join TB_DIM_CID dimCid'
      
        #9'on dimCid.CO_SEQ_DIM_CID = fatoAtendIndProblema.CO_DIM_CID and ' +
        'fatoAtendIndProblema.CO_DIM_CID != 1'
      #9'left join TB_CIAP ciap'
      #9'on ciap.CO_CIAP = dimCiap.NU_CIAP'
      #9'left join TB_CID10 cid10'
      #9'on cid10.NU_CID10 = dimCid.NU_CID'
      #9'left join RL_GRUPO_CONDICAO_CIAP_CID grupoCondicaoCiapCid'
      
        #9'on (grupoCondicaoCiapCid.CO_CIAP = ciap.CO_SEQ_CIAP or grupoCon' +
        'dicaoCiapCid.CO_CID10 = cid10.CO_CID10) '
      #9' and grupoCondicaoCiapCid.CO_GRUPO_CONDICAO = 10'
      
        #9'group by fatoCidadaoPec.CO_CIDADAO, grupoCondicaoCiapCid.CO_GRU' +
        'PO_CONDICAO)) as unionPath'
      #9'where idCidadaoSubqueryPath = cidadao.CO_SEQ_CIDADAO'
      
        #9'having count(distinct idGrupoSubqueryPath) = 1) and cidadaoVinc' +
        'ulacaoEquipe.NU_CNES = :unidade_saude )'
      #9'as resultQueryPath'
      
        #9'left join (select unionDatePath.cidadaoIdPath as idCidadaoDataP' +
        'ath, max(unionDatePath.dataUltimoAtendimentoPath)'
      #9#9#9'   as dtUltimoAtendPath'
      
        #9'from ((select fatoCidadaoPec.CO_CIDADAO as cidadaoIdPath, fatoA' +
        'tendimentoIndividual.DT_FINAL_ATENDIMENTO '
      #9#9'   as dataUltimoAtendimentoPath'
      #9'from TB_CIDADAO_VINCULACAO_EQUIPE cidadaoVinculacaoEquipe'
      #9'join TB_FAT_CIDADAO_PEC fatoCidadaoPec'
      
        #9'on fatoCidadaoPec.CO_CIDADAO = cidadaoVinculacaoEquipe.CO_CIDAD' +
        'AO'
      #9'join TB_FAT_ATENDIMENTO_INDIVIDUAL fatoAtendimentoIndividual'
      
        #9'on fatoCidadaoPec.CO_SEQ_FAT_CIDADAO_PEC = fatoAtendimentoIndiv' +
        'idual.CO_FAT_CIDADAO_PEC'
      #9'where cidadaoVinculacaoEquipe.NU_CNES = :unidade_saude )'
      #9'union'
      
        #9'(select pront.CO_CIDADAO as cidadaoIdPath, atendimentoProfissio' +
        'nal.DT_FIM as dataUltimoAtendimentoPath'
      #9'from TB_CIDADAO_VINCULACAO_EQUIPE cidadaoVinculacaoEquipe'
      #9'join TB_PRONTUARIO pront'
      #9'on pront.CO_CIDADAO = cidadaoVinculacaoEquipe.CO_CIDADAO'
      #9'join TB_PRONTUARIO prontuario'
      #9'on prontuario.CO_PRONTUARIO_GRUPO = pront.CO_SEQ_PRONTUARIO'
      #9'join TB_ATEND atendimento'
      #9'on atendimento.CO_PRONTUARIO = prontuario.CO_SEQ_PRONTUARIO'
      #9'join TB_ATEND_PROF atendimentoProfissional'
      #9'on atendimentoProfissional.CO_ATEND = atendimento.CO_SEQ_ATEND'
      
        #9'where cidadaoVinculacaoEquipe.NU_CNES =   :unidade_saude )) as ' +
        'unionDatePath'
      #9'group by unionDatePath.cidadaoIdPath) as dtUltimoAtendQueryPath'
      #9'on coSeqCidadaoPath = dtUltimoAtendQueryPath.idCidadaoDataPath'
      #9
      ') select idadeatual::varchar(20) as idade,dtUltimoAtendPath,'
      
        #9'noCidadaoPath, st_cidadao_consistente , cnsPath, dtUltimoAtendP' +
        'ath::date,'
      
        #9'telcontato, no_unidade_saude, nu_micro_area, COALESCE(total1, 0' +
        ') as total1 , COALESCE(total2, 0) as total2  from hipertensos'
      #9'left join ('
      
        #9#9#9'select count(*)::int as total1, co_fat_cidadao_pec from tb_fa' +
        't_proced_atend'
      #9#9#9'where '
      
        #9#9#9'dt_inicial_atendimento::date between (:dia_final::date - INTE' +
        'RVAL'#39'1 year'#39') and (:dia_final::date - INTERVAL'#39'6 months'#39')'
      
        #9'        and  (ds_filtro_procedimento like '#39'%0301100039%'#39' or ds_' +
        'filtro_procedimento like '#39'%ABPG033%'#39')'
      #9'        Group By co_fat_cidadao_pec'
      #9') as atendimentos1 on'
      
        #9'hipertensos.co_seq_fat_cidadao_pec = atendimentos1.co_fat_cidad' +
        'ao_pec'
      #9'left join ('
      
        #9#9#9'select count(*)::int as total2, co_fat_cidadao_pec from tb_fa' +
        't_proced_atend'
      #9#9#9'where '
      
        #9#9#9'dt_inicial_atendimento::date between (:dia_final::date - INTE' +
        'RVAL'#39'6 months'#39') and :dia_final::date '
      
        #9'        and  (ds_filtro_procedimento like '#39'%0301100039%'#39' or ds_' +
        'filtro_procedimento like '#39'%ABPG033%'#39')'
      #9'        Group By co_fat_cidadao_pec'
      #9') as atendimentos2 on'
      
        #9'hipertensos.co_seq_fat_cidadao_pec = atendimentos2.co_fat_cidad' +
        'ao_pec'
      
        #9'where   total1 is null or total2 is null or total1::int < 1 or ' +
        'total2::int < 1  or st_cidadao_consistente = 0'
      #9'order by nocidadaopath')
    Left = 570
    Top = 329
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'unidade_saude'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'dia_final'
        Value = nil
      end>
    object UniQuery2idade: TStringField
      FieldName = 'idade'
      ReadOnly = True
    end
    object UniQuery2dtultimoatendpath: TDateField
      FieldName = 'dtultimoatendpath'
      ReadOnly = True
    end
    object UniQuery2nocidadaopath: TStringField
      FieldName = 'nocidadaopath'
      ReadOnly = True
      Size = 500
    end
    object UniQuery2st_cidadao_consistente: TIntegerField
      FieldName = 'st_cidadao_consistente'
      ReadOnly = True
      OnGetText = UniQuery2st_cidadao_consistenteGetText
    end
    object UniQuery2cnspath: TStringField
      FieldName = 'cnspath'
      ReadOnly = True
      Size = 16
    end
    object UniQuery2dtultimoatendpath_1: TDateField
      FieldName = 'dtultimoatendpath_1'
      ReadOnly = True
    end
    object UniQuery2telcontato: TStringField
      FieldName = 'telcontato'
      ReadOnly = True
      Size = 255
    end
    object UniQuery2no_unidade_saude: TStringField
      FieldName = 'no_unidade_saude'
      ReadOnly = True
      Size = 500
    end
    object UniQuery2nu_micro_area: TStringField
      FieldName = 'nu_micro_area'
      ReadOnly = True
      Size = 3
    end
    object UniQuery2total1: TIntegerField
      FieldName = 'total1'
      ReadOnly = True
    end
    object UniQuery2total2: TIntegerField
      FieldName = 'total2'
      ReadOnly = True
    end
  end
  object DataSource2: TDataSource
    AutoEdit = False
    DataSet = UniQuery2
    Left = 562
    Top = 385
  end
end
