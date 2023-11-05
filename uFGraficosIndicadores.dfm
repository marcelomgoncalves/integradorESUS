object FGraficosIndicadores: TFGraficosIndicadores
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'FGraficosIndicadores'
  ClientHeight = 586
  ClientWidth = 1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object GridPanel1: TGridPanel
    Left = 0
    Top = 0
    Width = 1072
    Height = 586
    Align = alClient
    ColumnCollection = <
      item
        Value = 14.342675170000960000
      end
      item
        Value = 14.296963808144710000
      end
      item
        Value = 14.269211804796300000
      end
      item
        Value = 14.186365559748310000
      end
      item
        Value = 14.285796068368840000
      end
      item
        Value = 14.282956980009970000
      end
      item
        Value = 14.336030608930900000
      end>
    ControlCollection = <
      item
        Column = 0
        ColumnSpan = 7
        Control = Panel1
        Row = 0
      end
      item
        Column = 0
        Control = Panel2
        Row = 1
      end>
    RowCollection = <
      item
        Value = 14.548076709520780000
      end
      item
        Value = 28.283733185012840000
      end
      item
        Value = 28.429673700246400000
      end
      item
        Value = 28.738516405219990000
      end>
    TabOrder = 0
    ExplicitLeft = 160
    ExplicitTop = 72
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 1070
      Height = 84
      Align = alClient
      TabOrder = 0
      ExplicitHeight = 112
      object Panel5: TPanel
        Left = 1
        Top = 1
        Width = 1068
        Height = 48
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Integrador e-SUS - Vers'#227'o 1.0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 10053171
        Font.Height = -21
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel4: TPanel
        Left = 1
        Top = 45
        Width = 1068
        Height = 38
        Align = alBottom
        BevelOuter = bvNone
        Caption = 'Gr'#225'ficos de Indicadores do Programa Previne Brasil'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        ExplicitTop = 39
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 85
      Width = 153
      Height = 165
      Align = alClient
      TabOrder = 1
      ExplicitLeft = 80
      ExplicitTop = 120
      ExplicitWidth = 185
      ExplicitHeight = 41
      object Chart1: TChart
        Left = 1
        Top = 1
        Width = 151
        Height = 163
        Title.Text.Strings = (
          'Indicador 1 - Gestantes')
        Align = alClient
        TabOrder = 0
        ExplicitLeft = 33
        ExplicitTop = 0
        DefaultCanvas = 'TGDIPlusCanvas'
        ColorPaletteIndex = 13
        object Series1: TBarSeries
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
          Data = {
            0606000000000000000040504000000020FF1300000044656E74726F20646F20
            496E64696361646F720000000000A0614000000020FF04000000466F72610000
            000000000000FFFFFF1FFF00000000000000000000000000000020FF00000000
            000000000000000000000020FF00000000000000000000000000000020FF0000
            0000}
        end
      end
    end
  end
end
