//---------------------------------------------------------------------------//
// Projeto: integraEsus
// Sistema de integrador com ESUS para gestão de dados do programa PrevineBrasil
//
// Direitos Autorais Reservados (c) 2023 Marcelo M. Gonçalves
//
// Você pode obter a última versão desse arquivo no GitHub
// URL: https://github.com/marcelomgoncalves/integradorESUS
//
// Este sistema é software livre; você pode redistribuí-la e/ou modificá-la
// sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela
// Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério)
// qualquer versão posterior.
//
// Este sistema é distribuída na expectativa de que seja útil, porém, SEM
// NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU
// ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral
// Menor do GNU para mais detalhes.
//
// Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto
// com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,
// no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.
// Você também pode obter uma copia da licença em:
// http://www.opensource.org/licenses/lgpl-license.php
//
// Marcelo M. Gonçalves - marcelomgoncalves@gmail.com
//---------------------------------------------------------------------------//
unit uMenuIndicadores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFMenuIndicadores = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    GridPanel1: TGridPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    SpeedButton8: TSpeedButton;
    SpeedButton9: TSpeedButton;
    SpeedButton10: TSpeedButton;
    SpeedButton11: TSpeedButton;
    SpeedButton12: TSpeedButton;
    SpeedButton13: TSpeedButton;
    SpeedButton14: TSpeedButton;
    SpeedButton15: TSpeedButton;
    SpeedButton16: TSpeedButton;
    SpeedButton17: TSpeedButton;
    SpeedButton18: TSpeedButton;
    SpeedButton19: TSpeedButton;
    SpeedButton20: TSpeedButton;
    SpeedButton21: TSpeedButton;
    Panel5: TPanel;
    Panel4: TPanel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton21Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure SpeedButton7Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMenuIndicadores: TFMenuIndicadores;

implementation

{$R *.dfm}

uses uFGestantesInd1, uFGestantesInd2, uFGestantesInd3, uFGestantesInd4,
  uFGestantesInd5, uFGestantesInd99, uFGestantesInd6, uFGestantesInd7;

procedure TFMenuIndicadores.SpeedButton1Click(Sender: TObject);
begin
 FGestantesInd1:=TFGestantesInd1.Create(self);
 FGestantesInd1.Showmodal;
 FGestantesInd1.free;

end;

procedure TFMenuIndicadores.SpeedButton21Click(Sender: TObject);
begin
 FGestantesInd99:=TFGestantesInd99.Create(self);
 FGestantesInd99.Showmodal;
 FGestantesInd99.free;
end;

procedure TFMenuIndicadores.SpeedButton2Click(Sender: TObject);
begin
 FGestantesInd2:=TFGestantesInd2.Create(self);
 FGestantesInd2.Showmodal;
 FGestantesInd2.free;
end;

procedure TFMenuIndicadores.SpeedButton3Click(Sender: TObject);
begin
 FGestantesInd3:=TFGestantesInd3.Create(self);
 FGestantesInd3.Showmodal;
 FGestantesInd3.free;
end;

procedure TFMenuIndicadores.SpeedButton4Click(Sender: TObject);
begin
 FGestantesInd4:=TFGestantesInd4.Create(self);
 FGestantesInd4.Showmodal;
 FGestantesInd4.free;
end;

procedure TFMenuIndicadores.SpeedButton5Click(Sender: TObject);
begin
 FGestantesInd5:=TFGestantesInd5.Create(self);
 FGestantesInd5.Showmodal;
 FGestantesInd5.free;
end;

procedure TFMenuIndicadores.SpeedButton6Click(Sender: TObject);
begin
 FGestantesInd6:=TFGestantesInd6.Create(self);
 FGestantesInd6.Showmodal;
 FGestantesInd6.free;
end;

procedure TFMenuIndicadores.SpeedButton7Click(Sender: TObject);
begin
 FGestantesInd7:=TFGestantesInd7.Create(self);
 FGestantesInd7.Showmodal;
 FGestantesInd7.free;
end;

end.
