unit uMenuGerarIndicadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFMenuGerarIndicadores= class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GridPanel1: TGridPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuGerarIndicadores: TFMenuGerarIndicadores;

implementation

{$R *.dfm}

uses uFGerarIndicador;


procedure TFMenuGerarIndicadores.SpeedButton1Click(Sender: TObject);
begin
 FGerarIndicador:=TFGerarIndicador.Create(Self,1);
 FGerarIndicador.ShowModal;
 FGerarIndicador.Free;
end;

procedure TFMenuGerarIndicadores.SpeedButton2Click(Sender: TObject);
begin
 FGerarIndicador:=TFGerarIndicador.Create(Self,4);
 FGerarIndicador.ShowModal;
 FGerarIndicador.Free;
end;

procedure TFMenuGerarIndicadores.SpeedButton3Click(Sender: TObject);
begin
 FGerarIndicador:=TFGerarIndicador.Create(Self,5);
 FGerarIndicador.ShowModal;
 FGerarIndicador.Free;
end;

end.
