//---------------------------------------------------------------------------//
// Projeto: integraEsus
// Sistema de integrador com ESUS para gest�o de dados do programa PrevineBrasil
//
// Direitos Autorais Reservados (c) 2023 Marcelo M. Gon�alves
//
// Voc� pode obter a �ltima vers�o desse arquivo no GitHub
// URL: https://github.com/marcelomgoncalves/integradorESUS
//
// Este sistema � software livre; voc� pode redistribu�-la e/ou modific�-la
// sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela
// Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio)
// qualquer vers�o posterior.
//
// Este sistema � distribu�da na expectativa de que seja �til, por�m, SEM
// NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU
// ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral
// Menor do GNU para mais detalhes.
//
// Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto
// com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,
// no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.
// Voc� tamb�m pode obter uma copia da licen�a em:
// http://www.opensource.org/licenses/lgpl-license.php
//
// Marcelo M. Gon�alves - marcelomgoncalves@gmail.com
//---------------------------------------------------------------------------//
unit uFPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.ImageList, Vcl.ImgList,
  cxImageList, cxGraphics, Vcl.ComCtrls, Vcl.ToolWin, Vcl.ExtCtrls, Vcl.Buttons;

type
  TFPrincipal = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton3: TToolButton;
    cxImageList1: TcxImageList;
    StatusBar1: TStatusBar;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    GridPanel1: TGridPanel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton4Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
 arqConfig = 'CONFIG.INI';

var
  FPrincipal: TFPrincipal;

implementation

{$R *.dfm}

uses ABOUT, uFrmConfig, uDM, uFCidadao, uFGestantesInd1, uMenuIndicadores,
  uMenuCovid19, uMenuGerarIndicadores;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Assigned(objConfiguracao) then
   freeAndNil(objConfiguracao);
end;

procedure TFPrincipal.SpeedButton1Click(Sender: TObject);
begin
{ FGestantesInd1:=TFGestantesInd1.Create(self);
 FGestantesInd1.Showmodal;
 FGestantesInd1.free;
 }
 FMenuIndicadores:=TFMenuIndicadores.Create(self);
 FMenuIndicadores.ShowModal;
 FMenuIndicadores.free;
end;

procedure TFPrincipal.SpeedButton2Click(Sender: TObject);
begin
 FCidadao:=TFCidadao.Create(self);
 FCidadao.Showmodal;
 FCidadao.free;
end;

procedure TFPrincipal.SpeedButton3Click(Sender: TObject);
begin
 FMenuCovid19:=TFMenuCovid19.Create(self);
 FMenuCovid19.ShowModal;
 FMenuCovid19.free;
end;

procedure TFPrincipal.SpeedButton4Click(Sender: TObject);
begin
 FMenuGerarIndicadores:=TFMenuGerarIndicadores.Create(self);
 FMenuGerarIndicadores.ShowModal;
 FMenuGerarIndicadores.free;
end;

procedure TFPrincipal.ToolButton1Click(Sender: TObject);
begin
  try
    frmConfig:=TFrmConfig.create(self);
    frmConfig.ShowModal;
  finally
    FreeAndNil(frmConfig);
  end;
end;

procedure TFPrincipal.ToolButton3Click(Sender: TObject);
begin
 if Application.MessageBox('Voc� deseja sair do sistema ?','Aten��o',MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
  close;
end;

procedure TFPrincipal.ToolButton4Click(Sender: TObject);
begin
  try
  frmaboutbox:=TFrmAboutBox.Create(self);
  frmaboutbox.showModal;
 finally
   FreeAndNil(frmAboutBox);
 end;
end;

end.
