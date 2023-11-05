object frmConfig: TfrmConfig
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Configura'#231#245'es'
  ClientHeight = 510
  ClientWidth = 1068
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzPanel1: TRzPanel
    Left = 0
    Top = 0
    Width = 1068
    Height = 25
    Align = alTop
    BorderOuter = fsNone
    Color = clMoneyGreen
    TabOrder = 0
    VisualStyle = vsGradient
    object RzLabel1: TRzLabel
      Left = 0
      Top = 0
      Width = 1068
      Height = 25
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'CONFIGURA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -19
      Font.Name = 'Fixedsys'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 952
      ExplicitHeight = 26
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 25
    Width = 1068
    Height = 17
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
  end
  object RzPanel8: TRzPanel
    Left = 0
    Top = 452
    Width = 1068
    Height = 58
    Align = alBottom
    BorderOuter = fsNone
    TabOrder = 2
    DesignSize = (
      1068
      58)
    object RzBitBtn1: TRzBitBtn
      Left = 472
      Top = 6
      Width = 179
      Height = 43
      Anchors = [akLeft, akTop, akRight]
      Caption = '&Salvar'
      TabOrder = 0
      OnClick = RzBitBtn1Click
    end
  end
  object RzPageControl1: TRzPageControl
    Left = 0
    Top = 42
    Width = 1068
    Height = 410
    Hint = ''
    ActivePage = TabSheet2
    Align = alClient
    TabIndex = 2
    TabOrder = 3
    FixedDimension = 19
    object TabSheet1: TRzTabSheet
      Caption = 'Configura'#231#245'es de Banco de Dados do Sistema'
      object RzPanel9: TRzPanel
        Left = 0
        Top = 0
        Width = 1064
        Height = 138
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 0
        object Label12: TLabel
          Left = 8
          Top = 31
          Width = 140
          Height = 13
          Caption = 'Nome do Banco de dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 8
          Top = 70
          Width = 46
          Height = 13
          Caption = 'Usu'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 359
          Top = 70
          Width = 38
          Height = 13
          Caption = 'Senha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 639
          Top = 70
          Width = 51
          Height = 13
          Caption = 'Servidor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 919
          Top = 70
          Width = 34
          Height = 13
          Caption = 'Porta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzPanel10: TRzPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 25
          Align = alTop
          BorderOuter = fsNone
          Color = clWhite
          TabOrder = 0
          VisualStyle = vsGradient
          object RzLabel5: TRzLabel
            Left = 0
            Top = 0
            Width = 1064
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'CONFIGURA'#199#213'ES DO BANCO DE DADOS DO ESUS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Fixedsys'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = -2
            ExplicitTop = 4
            ExplicitWidth = 948
          end
        end
        object edtDatabase: TEdit
          Left = 8
          Top = 46
          Width = 1043
          Height = 21
          TabOrder = 1
        end
        object edtUsuario: TEdit
          Left = 8
          Top = 85
          Width = 345
          Height = 21
          TabOrder = 2
        end
        object edtSenha: TEdit
          Left = 359
          Top = 86
          Width = 274
          Height = 21
          TabOrder = 3
        end
        object edtServidor: TEdit
          Left = 639
          Top = 86
          Width = 274
          Height = 21
          TabOrder = 4
        end
        object edtPortaServidor: TEdit
          Left = 919
          Top = 85
          Width = 132
          Height = 21
          TabOrder = 5
        end
      end
      object RzPanel11: TRzPanel
        Left = 0
        Top = 138
        Width = 1064
        Height = 113
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 1
        object Label3: TLabel
          Left = 8
          Top = 31
          Width = 140
          Height = 13
          Caption = 'Nome do Banco de dados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 8
          Top = 70
          Width = 46
          Height = 13
          Caption = 'Usu'#225'rio:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label38: TLabel
          Left = 359
          Top = 70
          Width = 38
          Height = 13
          Caption = 'Senha:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label39: TLabel
          Left = 639
          Top = 70
          Width = 51
          Height = 13
          Caption = 'Servidor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label40: TLabel
          Left = 919
          Top = 70
          Width = 34
          Height = 13
          Caption = 'Porta:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzPanel12: TRzPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 25
          Align = alTop
          BorderOuter = fsNone
          Color = clWhite
          TabOrder = 0
          VisualStyle = vsGradient
          object RzLabel6: TRzLabel
            Left = 0
            Top = 0
            Width = 1064
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'CONFIGURA'#199#213'ES DO BANCO DE DADOS LOCAL INTEGRADORESUS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Fixedsys'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = -2
            ExplicitTop = 4
            ExplicitWidth = 948
          end
        end
        object edtDataBaseLocal: TEdit
          Left = 8
          Top = 46
          Width = 1043
          Height = 21
          TabOrder = 1
        end
        object edtUsuarioLocal: TEdit
          Left = 8
          Top = 89
          Width = 345
          Height = 21
          TabOrder = 2
        end
        object edtSenhaLocal: TEdit
          Left = 359
          Top = 89
          Width = 274
          Height = 21
          TabOrder = 3
        end
        object edtServidorLocal: TEdit
          Left = 639
          Top = 89
          Width = 274
          Height = 21
          TabOrder = 4
        end
        object edtPortaDBLocal: TEdit
          Left = 919
          Top = 89
          Width = 132
          Height = 21
          TabOrder = 5
        end
      end
    end
    object TabSheet3: TRzTabSheet
      Caption = 'Configura'#231#245'es de Servidor SMTP para envio'
      object RzPanel6: TRzPanel
        Left = 0
        Top = 0
        Width = 1064
        Height = 387
        Align = alClient
        BorderOuter = fsNone
        TabOrder = 0
        object Label5: TLabel
          Left = 16
          Top = 38
          Width = 160
          Height = 13
          Caption = 'Usu'#225'rio (endere'#231'o de email)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 16
          Top = 81
          Width = 82
          Height = 13
          Caption = 'Servidor SMTP'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 441
          Top = 81
          Width = 31
          Height = 13
          Caption = 'Porta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 754
          Top = 38
          Width = 85
          Height = 13
          Caption = 'Senha do Email'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 521
          Top = 80
          Width = 264
          Height = 13
          Caption = 'Email do Contador / Escrit'#243'rio de Contabilidade'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 16
          Top = 121
          Width = 101
          Height = 13
          Caption = 'Nome da Empresa'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 521
          Top = 121
          Width = 46
          Height = 13
          Caption = 'Assunto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzPanel7: TRzPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 25
          Align = alTop
          BorderOuter = fsNone
          Color = clWhite
          TabOrder = 0
          VisualStyle = vsGradient
          object RzLabel4: TRzLabel
            Left = 0
            Top = 0
            Width = 1064
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'Dados Servidor SMTP para envio de emails de notifica'#231#227'o'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Fixedsys'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = -2
            ExplicitTop = 4
            ExplicitWidth = 948
          end
        end
        object edtContaEmail: TEdit
          Left = 16
          Top = 53
          Width = 732
          Height = 21
          TabOrder = 1
        end
        object edtServidorSMTP: TEdit
          Left = 16
          Top = 94
          Width = 337
          Height = 21
          TabOrder = 2
        end
        object chkUsarTLS: TCheckBox
          Left = 364
          Top = 96
          Width = 74
          Height = 17
          Caption = 'Usar TLS'
          TabOrder = 3
        end
        object edtPorta: TEdit
          Left = 441
          Top = 94
          Width = 74
          Height = 21
          TabOrder = 4
        end
        object edtSenhaEmail: TEdit
          Left = 754
          Top = 53
          Width = 297
          Height = 21
          PasswordChar = '*'
          TabOrder = 5
        end
        object edtContaEmailContador: TEdit
          Left = 521
          Top = 94
          Width = 530
          Height = 21
          TabOrder = 6
        end
        object edtNomeEmpresa: TEdit
          Left = 16
          Top = 137
          Width = 499
          Height = 21
          TabOrder = 7
        end
        object edtAssunto: TEdit
          Left = 521
          Top = 137
          Width = 530
          Height = 21
          TabOrder = 8
        end
      end
    end
    object TabSheet2: TRzTabSheet
      Caption = 'Outras Configura'#231#245'es'
      object RzPanel2: TRzPanel
        Left = 0
        Top = 298
        Width = 1064
        Height = 89
        Align = alBottom
        BorderOuter = fsNone
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 31
          Width = 362
          Height = 13
          Caption = 'Lista de Imunobiol'#243'gicos - Indicador 5 -  Separe-os com v'#237'rgulas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzPanel3: TRzPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 25
          Align = alTop
          BorderOuter = fsNone
          Color = clWhite
          TabOrder = 0
          VisualStyle = vsGradient
          object RzLabel2: TRzLabel
            Left = 0
            Top = 0
            Width = 1064
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'IMUNOBIOL'#211'GICOS'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Fixedsys'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = -2
            ExplicitTop = 4
            ExplicitWidth = 948
          end
        end
        object edtImunobiologicos: TEdit
          Left = 8
          Top = 46
          Width = 489
          Height = 21
          TabOrder = 1
        end
      end
      object Panel2: TPanel
        Left = 0
        Top = 89
        Width = 1064
        Height = 184
        Align = alTop
        TabOrder = 1
        object Label24: TLabel
          Left = 8
          Top = 83
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 08'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label25: TLabel
          Left = 137
          Top = 83
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 09'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label26: TLabel
          Left = 267
          Top = 83
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 10'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label27: TLabel
          Left = 397
          Top = 83
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 11'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label28: TLabel
          Left = 526
          Top = 83
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 12'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label29: TLabel
          Left = 656
          Top = 83
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 13'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label30: TLabel
          Left = 786
          Top = 83
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 14'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label31: TLabel
          Left = 8
          Top = 132
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 15'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label32: TLabel
          Left = 137
          Top = 132
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 16'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label33: TLabel
          Left = 267
          Top = 132
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 17'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label34: TLabel
          Left = 397
          Top = 132
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 18'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label35: TLabel
          Left = 526
          Top = 132
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 19'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label36: TLabel
          Left = 656
          Top = 132
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 20'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label37: TLabel
          Left = 786
          Top = 132
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 21'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 8
          Top = 35
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 01'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 137
          Top = 35
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 02'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label19: TLabel
          Left = 267
          Top = 35
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 03'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 397
          Top = 35
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 04'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label21: TLabel
          Left = 526
          Top = 35
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 05'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label22: TLabel
          Left = 656
          Top = 35
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 06'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label23: TLabel
          Left = 786
          Top = 35
          Width = 100
          Height = 13
          Caption = 'DENOMINADOR 07'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzPanel4: TRzPanel
          Left = 1
          Top = 1
          Width = 1062
          Height = 32
          Align = alTop
          BorderOuter = fsNone
          TabOrder = 0
          object RzPanel5: TRzPanel
            Left = 0
            Top = 0
            Width = 1062
            Height = 25
            Align = alTop
            BorderOuter = fsNone
            Color = clWhite
            TabOrder = 0
            VisualStyle = vsGradient
            object RzLabel3: TRzLabel
              Left = 0
              Top = 0
              Width = 1062
              Height = 25
              Align = alClient
              Alignment = taCenter
              AutoSize = False
              Caption = 'DENOMINADORES ESTIMADOS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -19
              Font.Name = 'Fixedsys'
              Font.Style = []
              ParentFont = False
              Layout = tlCenter
              ExplicitLeft = 56
              ExplicitTop = 17
            end
          end
        end
        object edtDenominador01: TEdit
          Left = 8
          Top = 49
          Width = 100
          Height = 21
          TabOrder = 1
        end
        object edtDenominador02: TEdit
          Left = 137
          Top = 49
          Width = 100
          Height = 21
          TabOrder = 2
        end
        object edtDenominador03: TEdit
          Left = 267
          Top = 49
          Width = 100
          Height = 21
          TabOrder = 3
        end
        object edtDenominador04: TEdit
          Left = 397
          Top = 49
          Width = 100
          Height = 21
          TabOrder = 4
        end
        object edtDenominador05: TEdit
          Left = 526
          Top = 49
          Width = 100
          Height = 21
          TabOrder = 5
        end
        object edtDenominador06: TEdit
          Left = 656
          Top = 49
          Width = 100
          Height = 21
          TabOrder = 6
        end
        object edtDenominador07: TEdit
          Left = 786
          Top = 49
          Width = 100
          Height = 21
          TabOrder = 7
        end
        object edtDenominador08: TEdit
          Left = 8
          Top = 99
          Width = 100
          Height = 21
          TabOrder = 8
        end
        object edtDenominador09: TEdit
          Left = 137
          Top = 99
          Width = 100
          Height = 21
          TabOrder = 9
        end
        object edtDenominador10: TEdit
          Left = 267
          Top = 102
          Width = 100
          Height = 21
          TabOrder = 10
        end
        object edtDenominador11: TEdit
          Left = 397
          Top = 99
          Width = 100
          Height = 21
          TabOrder = 11
        end
        object edtDenominador12: TEdit
          Left = 526
          Top = 102
          Width = 100
          Height = 21
          TabOrder = 12
        end
        object edtDenominador13: TEdit
          Left = 656
          Top = 99
          Width = 100
          Height = 21
          TabOrder = 13
        end
        object edtDenominador14: TEdit
          Left = 786
          Top = 102
          Width = 100
          Height = 21
          TabOrder = 14
        end
        object edtDenominador15: TEdit
          Left = 8
          Top = 147
          Width = 100
          Height = 21
          TabOrder = 15
        end
        object edtDenominador16: TEdit
          Left = 137
          Top = 147
          Width = 100
          Height = 21
          TabOrder = 16
        end
        object edtDenominador17: TEdit
          Left = 267
          Top = 147
          Width = 100
          Height = 21
          TabOrder = 17
        end
        object edtDenominador18: TEdit
          Left = 397
          Top = 147
          Width = 100
          Height = 21
          TabOrder = 18
        end
        object edtDenominador19: TEdit
          Left = 526
          Top = 147
          Width = 100
          Height = 21
          TabOrder = 19
        end
        object edtDenominador20: TEdit
          Left = 656
          Top = 147
          Width = 100
          Height = 21
          TabOrder = 20
        end
        object edtDenominador21: TEdit
          Left = 786
          Top = 147
          Width = 100
          Height = 21
          TabOrder = 21
        end
      end
      object RzPanel13: TRzPanel
        Left = 0
        Top = 0
        Width = 1064
        Height = 89
        Align = alTop
        BorderOuter = fsNone
        TabOrder = 2
        object Label42: TLabel
          Left = 8
          Top = 31
          Width = 140
          Height = 13
          Caption = 'C'#243'digo IBGE do Munic'#237'pio'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label43: TLabel
          Left = 184
          Top = 31
          Width = 87
          Height = 13
          Caption = 'Popula'#231#227'o IBGE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label44: TLabel
          Left = 360
          Top = 31
          Width = 128
          Height = 13
          Caption = 'Per'#237'odo de P'#226'ndemia ?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RzPanel14: TRzPanel
          Left = 0
          Top = 0
          Width = 1064
          Height = 25
          Align = alTop
          BorderOuter = fsNone
          Color = clWhite
          TabOrder = 0
          VisualStyle = vsGradient
          object RzLabel7: TRzLabel
            Left = 0
            Top = 0
            Width = 1064
            Height = 25
            Align = alClient
            Alignment = taCenter
            AutoSize = False
            Caption = 'PAR'#194'METROS DE CONSULTA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -19
            Font.Name = 'Fixedsys'
            Font.Style = []
            ParentFont = False
            Layout = tlCenter
            ExplicitLeft = -2
            ExplicitTop = 4
            ExplicitWidth = 948
          end
        end
        object edtCodIBGE: TEdit
          Left = 8
          Top = 46
          Width = 140
          Height = 21
          TabOrder = 1
        end
        object edtPopulacao: TEdit
          Left = 184
          Top = 46
          Width = 140
          Height = 21
          TabOrder = 2
        end
        object tsPandemia: TToggleSwitch
          Left = 360
          Top = 47
          Width = 102
          Height = 20
          StateCaptions.CaptionOn = 'Ligado'
          StateCaptions.CaptionOff = 'Desligado'
          TabOrder = 3
        end
      end
    end
  end
end
