unit uFGraficosIndicadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, VclTee.TeeGDIPlus,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs, VCLTee.Chart;

type
  TFGraficosIndicadores = class(TForm)
    GridPanel1: TGridPanel;
    Panel1: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    Chart1: TChart;
    Series1: TBarSeries;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FGraficosIndicadores: TFGraficosIndicadores;

implementation

{$R *.dfm}

end.
