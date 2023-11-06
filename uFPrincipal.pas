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
 if Application.MessageBox('Você deseja sair do sistema ?','Atenção',MB_ICONQUESTION + MB_YESNO + MB_DEFBUTTON2) = IDYES then
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
