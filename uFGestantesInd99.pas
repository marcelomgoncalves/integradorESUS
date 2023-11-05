unit uFGestantesInd99;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls, RzCmboBx, RzButton,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzTabs, Math, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, dxDateRanges, cxDBData,
  cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, Datasnap.DBClient;

type

  TFGestantesInd99 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    cbBuscarpor: TRzComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RzBitBtn1: TRzBitBtn;
    edTermo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qryUnidade: TUniQuery;
    qryMA: TUniQuery;
    dsUnidade: TDataSource;
    dsMA: TDataSource;
    qryUnidadeco_seq_dim_unidade_saude: TLargeintField;
    qryUnidadeno_unidade_saude: TStringField;
    cbUnidade: TRzComboBox;
    cbMA: TRzComboBox;
    edDataInicial: TRzDateTimeEdit;
    edDataFinal: TRzDateTimeEdit;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    Panel4: TPanel;
    lblRegDentro: TLabel;
    Panel7: TPanel;
    lblRegInco: TLabel;
    Panel8: TPanel;
    lblDenominador: TLabel;
    DBGrid1: TDBGrid;
    qryTmpGestantes: TUniQuery;
    qryTmpGestantesSEQUENCIA: TIntegerField;
    qryTmpGestantesCNS: TStringField;
    qryTmpGestantesCPF: TStringField;
    qryTmpGestantesCNS_ALTERNATIVO: TStringField;
    qryTmpGestantesCPF_ALTERNATIVO: TStringField;
    qryTmpGestantesDATA_NASCIMENTO: TDateField;
    qryTmpGestantesG_CO_DIM_TEMPO_DUM: TDateField;
    qryTmpGestantesG_CO_DIM_TEMPO: TDateField;
    qryTmpGestantesCIDADAO_ATIVO: TIntegerField;
    qryTmpGestantesDATA_FALECIMENTO: TDateField;
    qryTmpGestantesCIDADAO_NOME: TStringField;
    qryTmpGestantesCIDADAO_MAE: TStringField;
    qryTmpGestantesCIDADAO_FALECEU: TIntegerField;
    qryTmpGestantesCIDADAO_SEXO: TStringField;
    qryTmpGestantesCIND_GESTANTE: TIntegerField;
    qryTmpGestantesCIND_HIPERTENSO: TIntegerField;
    qryTmpGestantesCIND_DIABETICO: TIntegerField;
    qryTmpGestantesCIND_SEXO: TStringField;
    qryTmpGestantesCIND_MICRO_AREA: TStringField;
    qryTmpGestantesCNS_RESP: TStringField;
    qryTmpGestantesCPF_RESP: TStringField;
    qryTmpGestantesCIND_INATIVO: TIntegerField;
    qryTmpGestantesCNES: TStringField;
    qryTmpGestantesNOME_UNIDADE: TStringField;
    qryTmpGestantesINE: TStringField;
    qryTmpGestantesNOME_EQUIPE: TStringField;
    qryTmpGestantesCALC_DDP: TDateField;
    qryTmpGestantesCALC_20S: TDateField;
    qryTmpGestantesCALC_FIMPUERP: TDateField;
    qryTmpGestantesNU_UUID_FICHA: TStringField;
    qryTmpGestantesNU_UUID_FICHA_ORIGEM: TStringField;
    qryTmpGestantesNU_UUID_DADO_TRANSP: TStringField;
    qryTmpGestantesCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField;
    qryTmpGestantesCIND_GESTANTE_I1_ULT_CONSULTA: TDateField;
    qryTmpGestantesCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField;
    qryTmpGestantesCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField;
    qryTmpGestantesTELEFONE: TStringField;
    qryTmpGestantesCIND_GESTANTE_I1_REGRA1: TIntegerField;
    qryTmpGestantesCIND_GESTANTE_I1_REGRA2: TIntegerField;
    qryTmpGestantesCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField;
    qryTmpGestantesCIND_GESTANTE_CIAP_FINALIZACAO: TStringField;
    qryTmpGestantesCIND_GESTANTE_CID_FINALIZACAO: TStringField;
    qryTmpGestantesCIND_GESTANTE_I1_FINALIZADA: TIntegerField;
    qryTmpGestantesCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField;
    qryTmpGestantesCALC_IG_DIAS: TIntegerField;
    qryTmpGestantesCALC_IG_SEMANAS: TIntegerField;
    qryTmpGestantesCALC_IG_MESES: TIntegerField;
    dsTmpGestantes: TDataSource;
    qryTmpGestantesCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryMAnu_micro_area: TStringField;
    qryMAdsmicroarea: TStringField;
    Panel10: TPanel;
    RzPageControl2: TRzPageControl;
    TabSheet4: TRzTabSheet;
    TabSheet5: TRzTabSheet;
    TabSheet6: TRzTabSheet;
    TabSheet7: TRzTabSheet;
    DBGrid2: TDBGrid;
    DBGrid3: TDBGrid;
    DBGrid4: TDBGrid;
    qryDetConsultas: TUniQuery;
    dsDetConsultas: TDataSource;
    qryDetConsultasID: TIntegerField;
    qryDetConsultasCPF: TStringField;
    qryDetConsultasCNS: TStringField;
    qryDetConsultasNU_CBO: TStringField;
    qryDetConsultasNO_CBO: TStringField;
    qryDetConsultasNO_CNES: TStringField;
    qryDetConsultasNO_UNIDADE_SAUDE: TStringField;
    qryDetConsultasNU_INE: TStringField;
    qryDetConsultasNO_EQUIPE: TStringField;
    qryDetConsultasCO_DIM_TEMPO: TDateField;
    qryDetConsultasNOME_EQUIPE: TStringField;
    qryDetConsultasCIAPS: TStringField;
    qryDetConsultasCIDS: TStringField;
    qryDetConsultasCNS_PROFISSIONAL: TStringField;
    qryDetConsultasNO_PROFISSIONAL: TStringField;
    qryDetProcedimentos: TUniQuery;
    dsDetProcedimentos: TDataSource;
    qryDetProcedimentosID: TIntegerField;
    qryDetProcedimentosSEQUENCIA: TIntegerField;
    qryDetProcedimentosCPF: TStringField;
    qryDetProcedimentosCNS: TStringField;
    qryDetProcedimentosNU_CBO: TStringField;
    qryDetProcedimentosNO_CBO: TStringField;
    qryDetProcedimentosNO_CNES: TStringField;
    qryDetProcedimentosNO_UNIDADE_SAUDE: TStringField;
    qryDetProcedimentosNU_INE: TStringField;
    qryDetProcedimentosNO_EQUIPE: TStringField;
    qryDetProcedimentosCO_DIM_TEMPO: TDateField;
    qryDetProcedimentosNOME_EQUIPE: TStringField;
    qryDetProcedimentosCNS_PROFISSIONAL: TStringField;
    qryDetProcedimentosNO_PROFISSIONAL: TStringField;
    qryDetProcedimentosPROCEDIMENTO1: TStringField;
    qryDetProcedimentosPROCEDIMENTO2: TStringField;
    qryDetProcedimentosTIPO_EXAME: TStringField;
    qryDetProcedimentosORIGEMDADOS: TStringField;
    qryDetConsultaOdonto: TUniQuery;
    dsDetConsultaOdonto: TDataSource;
    qryDetConsultaOdontoID: TIntegerField;
    qryDetConsultaOdontoSEQUENCIA: TIntegerField;
    qryDetConsultaOdontoCPF: TStringField;
    qryDetConsultaOdontoCNS: TStringField;
    qryDetConsultaOdontoNU_CBO: TStringField;
    qryDetConsultaOdontoNU_CBO1: TStringField;
    qryDetConsultaOdontoNO_CBO: TStringField;
    qryDetConsultaOdontoNO_CBO1: TStringField;
    qryDetConsultaOdontoNO_CNES: TStringField;
    qryDetConsultaOdontoCOD_UNIDADE_SAUDE: TIntegerField;
    qryDetConsultaOdontoNO_UNIDADE_SAUDE: TStringField;
    qryDetConsultaOdontoNU_INE: TStringField;
    qryDetConsultaOdontoNO_EQUIPE: TStringField;
    qryDetConsultaOdontoCO_DIM_TEMPO: TDateField;
    qryDetConsultaOdontoNOME_EQUIPE: TStringField;
    qryDetConsultaOdontoCIAPS: TStringField;
    qryDetConsultaOdontoCIDS: TStringField;
    qryDetConsultaOdontoCNS_PROFISSIONAL: TStringField;
    qryDetConsultaOdontoNO_PROFISSIONAL: TStringField;
    qryDetConsultaOdontoCO_FAT_CIDADAO_PEC: TIntegerField;
    qryDetConsultaOdontoPROCEDIMENTO1: TStringField;
    qryDetConsultaOdontoPROCEDIMENTO2: TStringField;
    qryDetConsultaOdontoTIPO_EXAME: TStringField;
    qryDetConsultaOdontoORIGEMDADOS: TStringField;
    qryDetConsultaOdontoODONTO_ST_GESTANTE: TIntegerField;
    qryDetConsultaOdontoODONTO_PROCEDIMENTO: TStringField;
    qryDetConsultaOdontoTIPO: TStringField;
    qryTmpGestantesINDICADOR1: TSmallintField;
    qryTmpGestantesINDICADOR2: TSmallintField;
    qryTmpGestantesINDICADOR3: TSmallintField;
    qryTmpGestantesNCO1TRIM: TIntegerField;
    qryTmpGestantesNCO2TRIM: TIntegerField;
    qryTmpGestantesNCO3TRIM: TIntegerField;
    Label29: TLabel;
    Panel9: TPanel;
    Label30: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    lblIndice1: TLabel;
    lblIndice2: TLabel;
    lblIndice3: TLabel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    cbSTIndicadores: TRzComboBox;
    Label31: TLabel;
    qryTotalizador: TUniQuery;
    GridPanel1: TGridPanel;
    Panel6: TPanel;
    Label4: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure LimparGrid;
    procedure qryTmpGestantesCIND_GESTANTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIDADAO_ATIVOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIND_HIPERTENSOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIND_DIABETICOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIND_INATIVOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIND_GESTANTE_I1_REGRA1GetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIND_GESTANTE_I1_REGRA2GetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIDADAO_FALECEUGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesCIND_GESTANTE_I1_FINALIZADAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure dsTmpGestantesDataChange(Sender: TObject; Field: TField);
    procedure qryDetConsultaOdontoODONTO_ST_GESTANTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryTmpGestantesINDICADOR1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryTmpGestantesINDICADOR2GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure qryTmpGestantesINDICADOR3GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
 crlf = #13+#10;
 i_where = 25;

var
  FGestantesInd99: TFGestantesInd99;
  SQLPADRAO:String;


implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TFGestantesInd99.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DataCol = 5) then
  begin
    if qryTmpGestantes.FieldByName('INDICADOR1').asInteger=1 then
    begin
//     DBGrid1.Canvas.Brush.Color := clGreen;
     DBGrid1.Canvas.Font.Color  := clGreen;
     DBGrid1.Canvas.Font.Style  := [fsBold];
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
    else
    begin
//     DBGrid1.Canvas.Brush.Color := clRed;
     DBGrid1.Canvas.Font.Color  := clRed;
     DBGrid1.Canvas.Font.Style  := [fsBold];
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;
  end;
  if (DataCol = 6) then
  begin
    if qryTmpGestantes.FieldByName('INDICADOR2').asInteger=1 then
    begin
//     DBGrid1.Canvas.Brush.Color := clGreen;
     DBGrid1.Canvas.Font.Color  := clGreen;
     DBGrid1.Canvas.Font.Style  := [fsBold];
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
    else
    begin
//     DBGrid1.Canvas.Brush.Color := clRed;
     DBGrid1.Canvas.Font.Color  := clRed;
     DBGrid1.Canvas.Font.Style  := [fsBold];
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  end;
  if (DataCol = 7) then
  begin
    if qryTmpGestantes.FieldByName('INDICADOR3').asInteger=1 then
    begin
//     DBGrid1.Canvas.Brush.Color := clGreen;
     DBGrid1.Canvas.Font.Color  := clGreen;
     DBGrid1.Canvas.Font.Style  := [fsBold];
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end
    else
    begin
//     DBGrid1.Canvas.Brush.Color := clRed;
     DBGrid1.Canvas.Font.Color  := clRed;
     DBGrid1.Canvas.Font.Style  := [fsBold];
     DBGrid1.Canvas.FillRect(Rect);
     DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

  end;

end;

procedure TFGestantesInd99.dsTmpGestantesDataChange(Sender: TObject;
  Field: TField);
begin
  qryDetConsultas.close;
  qryDetConsultas.ParamByName('sequencia').asInteger:=qryTmpGestantes.FieldByName('sequencia').asInteger;
  qryDetConsultas.Open;
  qryDetProcedimentos.close;
  qryDetProcedimentos.ParamByName('sequencia').asInteger:=qryTmpGestantes.FieldByName('sequencia').asInteger;
  qryDetProcedimentos.Open;
  qryDetConsultaOdonto.close;
  qryDetConsultaOdonto.ParamByName('sequencia').asInteger:=qryTmpGestantes.FieldByName('sequencia').asInteger;
  qryDetConsultaOdonto.Open;
end;

procedure TFGestantesInd99.FormCreate(Sender: TObject);
begin
 //qryIndicador1.open;

  qryUnidade.open;
  qryMA.open;

  carregaComboBox(qryUnidade, cbUnidade);
  carregaComboBox(qryMA, cbMA);

  rzpagecontrol1.ActivePageIndex:=0;
  edDataInicial.date:=StrToDate('01/05/2021');
  edDataFinal.date:=StrToDate('31/08/2021');
  cbMA.Value:='999999';
end;

procedure TFGestantesInd99.LimparGrid;
var
 filtro:String;
begin
  {todo:}
  //qryIndicador1Dentro.close;
  //qryIndicador1Fora.close;
  //qryInconsistencia.close;
  //dbgrid1.datasource:=nil;
  //dbgrid2.datasource:=nil;
  //dbgrid3.datasource:=nil;
  sleep(1000);
end;

procedure TFGestantesInd99.qryDetConsultaOdontoODONTO_ST_GESTANTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIDADAO_ATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIDADAO_FALECEUGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIND_DIABETICOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIND_GESTANTEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIND_GESTANTE_I1_FINALIZADAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
 if sender.asInteger>0 then
  Text:='SIM'
 else
  Text:='NÃO';

end;

procedure TFGestantesInd99.qryTmpGestantesCIND_GESTANTE_I1_REGRA1GetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIND_GESTANTE_I1_REGRA2GetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIND_HIPERTENSOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesCIND_INATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesINDICADOR1GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesINDICADOR2GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.qryTmpGestantesINDICADOR3GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd99.RzBitBtn1Click(Sender: TObject);
var
 filtro:String;
 nIndice1, nIndice2, nIndice3:double;
 nTotalGestantes:integer;
 res,x,i,p, conta_duplicados: integer;
 strSQL:string;
 data_inicial, data_final:TDateTime;
 strAux:String;

begin
 limparGrid;

// qryIndicador1Dentro.close;
// qryIndicador1Fora.close;
// qryInconsistencia.close;

 data_inicial:=edDataInicial.date - 280;
 data_final:=edDataFinal.date - 280;

 if edDataInicial.text<>'' then                // Criando Filtro para Idades
 begin
    qryTmpGestantes.ParamByName('data_inicial').asDateTime:=Data_inicial;
//  qryIndicador1Dentro.ParamByName('dia_inicial').asDateTime:=edDataInicial.date;
//  qryIndicador1Fora.ParamByName('dia_inicial').asDateTime:=edDataInicial.date;
//  qryInconsistencia.ParamByName('dia_inicial').asDateTime:=edDataInicial.date;
 end;

 if edDataFinal.text<>'' then
 begin
     qryTmpGestantes.ParamByName('data_final').asDateTime:=Data_final;
 //  qryIndicador1Dentro.ParamByName('dia_final').asDateTime:=edDataFinal.date;
 //  qryIndicador1Fora.ParamByName('dia_final').asDateTime:=edDataFinal.date;
 //  qryInconsistencia.ParamByName('dia_final').asDateTime:=edDataFinal.date;
 end;

 if cbUnidade.Value<>'1' then
 begin
     qryTmpGestantes.sql[6]:='co_seq_dim_unidade_saude = :cod_unidade_saude';
     qryTmpGestantes.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
 end
 else
 begin
   qryTmpGestantes.sql[6]:='1=1';
 end;

 if Trim(cbMA.text)<>'*TODAS AS AREAS*' then
 begin
      qryTmpGestantes.sql[8]:='cind_micro_area = '+quotedStr(cbMA.text);

 end
 else
 begin
  qryTmpGestantes.sql[8]:='1=1';

 end;

 if Trim(cbSTIndicadores.value)<>'0' then
 begin
    case StrToInt(cbSTIndicadores.value) of
    1: qryTmpGestantes.sql[10]:='indicador1 = 1';
    2: qryTmpGestantes.sql[10]:='indicador1 = 0';
    3: qryTmpGestantes.sql[10]:='indicador2 = 1';
    4: qryTmpGestantes.sql[10]:='indicador2 = 0';
    5: qryTmpGestantes.sql[10]:='indicador3 = 1';
    6: qryTmpGestantes.sql[10]:='indicador3 = 0';
    end;
 end
 else
  qryTmpGestantes.sql[10]:='1=1';


 qryTmpGestantes.open;
 lblregDentro.caption:='Registros Encontrados:'+IntToStr(qryTmpGestantes.RecordCount);

 qryTmpGestantes.first;


 {{
 if edTermo.text<>'' then
 begin
   case StrToInt(cbbuscarpor.value) of
    0: filtro:=filtro+' and no_cidadao like '+quotedStr(Trim(UpperCase(edTermo.text))+'%');      // Nome do Cidadão
    1: filtro:=filtro+' and nu_cpf_cidadao = '+QuotedStr(Trim(edTermo.text));  // CPF do Cidadão
    2: filtro:=filtro+' and nu_cns = '+QuotedStr(Trim(edTermo.text));          // CNS do Cidadão
    else
       filtro:=filtro+' and no_cidadao like '+quotedStr(Trim(UpperCase(edTermo.text))+'%');      // Nome do Cidadão
   end;
 end;

 qryIndicador1.sql.add(filtro);
 }

 //showmessage(qryCidadao.sql.text);
 {
 dbgrid1.datasource:=dsIndicador1Dentro ;
 dbgrid2.datasource:=dsIndicador1Fora ;
 dbgrid3.datasource:=dsInconsistencia ;
 nIndice:=0.0;
 nTotalGestantes:=1;

 qryIndicador1Dentro.open;
 qryIndicador1Fora.open;
 qryInconsistencia.open;


 if ((qryIndicador1Dentro.recordCount<=0) and (qryIndicador1fora.recordCount<=0)) then
 begin
//-   Application.MessageBox('Não há dados com os parâmetros informados na consulta!','Atenção', MB_ICONINFORMATION + MB_OK);
    abort;
 end;

 lblRegDentro.Caption:='Registros Selecionados:'+IntToStr(qryIndicador1Dentro.RecordCount);
 lblRegFora.Caption:='Registros Selecionados:'+IntToStr(qryIndicador1Fora.RecordCount);
 lblRegFora.Caption:='Registros Selecionados:'+IntToStr(qryIndicador1Fora.RecordCount);
 lblRegInco.Caption:='Registros Selecionados:'+IntToStr(qryInconsistencia.RecordCount);

 nTotalGestantes := qryIndicador1Dentro.RecordCount + qryIndicador1Fora.RecordCount;
 nIndice:=(qryIndicador1Dentro.Recordcount /  nTotalGestantes) * 100;
 lblNumerador.caption:='NUMERADOR:'+LeftPad(qryIndicador1Dentro.RecordCount.ToString,2,'0');
 lblDenominador.caption:='DENOMINADOR:'+LeftPad(nTotalGestantes.toString(),2,'0');
 lblDenom_Estimado.caption:='DENOM. ESTIMADO:'+LeftPad(objConfiguracao.dn_estimado01.toString(),2,'0');
 lblIndice.caption:=FormatFloat('##.##',nIndice)+'%';

 if nIndice <24 then
  lblIndice.Font.Color:=clRed
 else
  if ((nIndice>=24) and (nIndice<42)) then
    lblIndice.Font.Color:=rgb(255,128,0)
  else
   if ((nIndice>=42) and (nIndice<60)) then
    lblIndice.Font.color:=clgreen
   else
    if (nIndice>=60) then
      lblIndice.Font.Color:=clblue;

  }
//  qryTmpGestantes.EnableControls;
 qryTotalizador.open;
 nTotalGestantes := qryTotalizador.FieldByName('total_reg').asInteger;

 lblDenominador.caption:=FormatFloat('#####',nTotalGestantes);
 strAux:='INDICADOR 1:['+intToStr(qryTotalizador.FieldByName('total_ind_1').asInteger)+']';
 strAux:=strAux+'    ';
 strAux:=strAux+'INDICADOR 2:['+intToStr(qryTotalizador.FieldByName('total_ind_2').asInteger)+']';
 strAux:=strAux+'    ';
 strAux:=strAux+'INDICADOR 3:['+intToStr(qryTotalizador.FieldByName('total_ind_3').asInteger)+']';
 label30.caption:=strAux;

 nIndice1:= (qryTotalizador.FieldByName('total_ind_1').asInteger / nTotalGestantes) * 100;
 nIndice2:= (qryTotalizador.FieldByName('total_ind_2').asInteger / nTotalGestantes) * 100;
 nIndice3:= (qryTotalizador.FieldByName('total_ind_3').asInteger / nTotalGestantes) * 100;
 lblIndice1.Caption:=FormatFloat('##.##',nIndice1)+'%';
 lblIndice2.Caption:=FormatFloat('##.##',nIndice2)+'%';
 lblIndice3.Caption:=FormatFloat('##.##',nIndice3)+'%';

 if nIndice1 <24 then
  lblIndice1.Font.Color:=clRed
 else
  if ((nIndice1>=24) and (nIndice1<42)) then
    lblIndice1.Font.Color:=rgb(255,128,0)
  else
   if ((nIndice1>=42) and (nIndice1<60)) then
    lblIndice1.Font.color:=clgreen
   else
    if (nIndice1>=60) then
      lblIndice1.Font.Color:=clblue;

 if nIndice2 <24 then
  lblIndice2.Font.Color:=clRed
 else
  if ((nIndice2>=24) and (nIndice2<42)) then
    lblIndice2.Font.Color:=rgb(255,128,0)
  else
   if ((nIndice2>=42) and (nIndice2<60)) then
    lblIndice2.Font.color:=clgreen
   else
    if (nIndice2>=60) then
      lblIndice2.Font.Color:=clblue;

 if nIndice3 <24 then
  lblIndice3.Font.Color:=clRed
 else
  if ((nIndice3>=24) and (nIndice3<42)) then
    lblIndice3.Font.Color:=rgb(255,128,0)
  else
   if ((nIndice3>=42) and (nIndice3<60)) then
    lblIndice3.Font.color:=clgreen
   else
    if (nIndice3>=60) then
      lblIndice3.Font.Color:=clblue;


end;


end.
