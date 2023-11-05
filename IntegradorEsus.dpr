program IntegradorEsus;

uses
  midaslib,
  Vcl.Forms,
  uFPrincipal in 'uFPrincipal.pas' {FPrincipal},
  ABOUT in 'ABOUT.pas' {frmAboutbox},
  uFrmConfig in 'uFrmConfig.pas' {frmConfig},
  uDM in 'uDM.pas' {DM: TDataModule},
  uFuncoes in 'uFuncoes.pas',
  uFCidadao in 'uFCidadao.pas' {FCidadao},
  uFGestantesInd99 in 'uFGestantesInd99.pas' {FGestantesInd99},
  uMenuIndicadores in 'uMenuIndicadores.pas' {FMenuIndicadores},
  uFGestantesInd2 in 'uFGestantesInd2.pas' {FGestantesInd2},
  uFGestantesInd3 in 'uFGestantesInd3.pas' {FGestantesInd3},
  uFGestantesInd4 in 'uFGestantesInd4.pas' {FGestantesInd4},
  uFGestantesInd5 in 'uFGestantesInd5.pas' {FGestantesInd5},
  uFGestantesInd1 in 'uFGestantesInd1.pas' {FGestantesInd1},
  uFGestantesInd6 in 'uFGestantesInd6.pas' {FGestantesInd6},
  uFGestantesInd7 in 'uFGestantesInd7.pas' {FGestantesInd7},
  uMenuCovid19 in 'uMenuCovid19.pas' {FMenuCovid19},
  uFImportacaoCSV in 'uFImportacaoCSV.pas' {frmImportacaoCSV},
  uFVacinacaoCovid in 'uFVacinacaoCovid.pas' {FVacinacaoCovid},
  uMenuGerarIndicadores in 'uMenuGerarIndicadores.pas' {FMenuGerarIndicadores},
  uFGerarIndicador in 'uFGerarIndicador.pas' {FGerarIndicador},
  uFGraficosIndicadores in 'uFGraficosIndicadores.pas' {FGraficosIndicadores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TDM, DM);
  FPrincipal.Caption:='IntegraEsus - Versão 1.0';
  Application.Run;
end.
