unit uMenuCovid19;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFMenuCovid19 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GridPanel1: TGridPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Panel4: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuCovid19: TFMenuCovid19;

implementation

{$R *.dfm}

uses uFImportacaoCSV, uFVacinacaoCovid;


procedure TFMenuCovid19.SpeedButton1Click(Sender: TObject);
begin
 FrmImportacaoCSV:=TFrmImportacaoCSV.Create(self);
 FrmImportacaoCSV.Showmodal;
 FrmImportacaoCSV.free;
end;

procedure TFMenuCovid19.SpeedButton2Click(Sender: TObject);
begin
 FVacinacaoCovid:=TFVacinacaoCovid.Create(self);
 FVacinacaoCovid.Showmodal;
 FVacinacaoCovid.Free;
end;

end.
