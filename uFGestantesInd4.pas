unit uFGestantesInd4;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls, RzCmboBx, RzButton,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzTabs, Math, Datasnap.DBClient,
  Vcl.Samples.Gauges, Vcl.Buttons, DASQLMonitor, UniSQLMonitor;

type
  TFGestantesInd4 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
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
    cbUnidade: TRzComboBox;
    cbMA: TRzComboBox;
    edDataInicial: TRzDateTimeEdit;
    edDataFinal: TRzDateTimeEdit;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    lblRegDentro: TLabel;
    qryIndicador4Dentro: TUniQuery;
    dsIndicador4Dentro: TDataSource;
    TabSheet2: TRzTabSheet;
    DBGrid2: TDBGrid;
    qryIndicador4Fora: TUniQuery;
    dsIndicador4Fora: TDataSource;
    Panel6: TPanel;
    lblregFora: TLabel;
    Label4: TLabel;
    edIdadeInicial: TEdit;
    edIdadeFinal: TEdit;
    Label8: TLabel;
    qryIndicador4DentroSEQUENCIA: TIntegerField;
    qryIndicador4DentroCNS: TStringField;
    qryIndicador4DentroCPF: TStringField;
    qryIndicador4DentroCNS_ALTERNATIVO: TStringField;
    qryIndicador4DentroCPF_ALTERNATIVO: TStringField;
    qryIndicador4DentroDATA_NASCIMENTO: TDateField;
    qryIndicador4DentroCIDADAO_ATIVO: TIntegerField;
    qryIndicador4DentroDATA_FALECIMENTO: TDateField;
    qryIndicador4DentroCIDADAO_NOME: TStringField;
    qryIndicador4DentroCIDADAO_MAE: TStringField;
    qryIndicador4DentroCIDADAO_FALECEU: TIntegerField;
    qryIndicador4DentroCIDADAO_SEXO: TStringField;
    qryIndicador4DentroCIND_GESTANTE: TIntegerField;
    qryIndicador4DentroCIND_HIPERTENSO: TIntegerField;
    qryIndicador4DentroCIND_DIABETICO: TIntegerField;
    qryIndicador4DentroCIND_SEXO: TStringField;
    qryIndicador4DentroCIND_MICRO_AREA: TStringField;
    qryIndicador4DentroCNS_RESP: TStringField;
    qryIndicador4DentroCPF_RESP: TStringField;
    qryIndicador4DentroCIND_INATIVO: TIntegerField;
    qryIndicador4DentroCNES: TStringField;
    qryIndicador4DentroCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryIndicador4DentroNOME_UNIDADE: TStringField;
    qryIndicador4DentroINE: TStringField;
    qryIndicador4DentroNOME_EQUIPE: TStringField;
    qryIndicador4DentroTELEFONE: TStringField;
    qryIndicador4DentroIDADEATUAL: TIntegerField;
    qryIndicador4DentroIND_I4_REGRA1: TIntegerField;
    qryIndicador4DentroINDICADOR4: TIntegerField;
    qryIndicador4ForaSEQUENCIA: TIntegerField;
    qryIndicador4ForaCNS: TStringField;
    qryIndicador4ForaCPF: TStringField;
    qryIndicador4ForaCNS_ALTERNATIVO: TStringField;
    qryIndicador4ForaCPF_ALTERNATIVO: TStringField;
    qryIndicador4ForaDATA_NASCIMENTO: TDateField;
    qryIndicador4ForaCIDADAO_ATIVO: TIntegerField;
    qryIndicador4ForaDATA_FALECIMENTO: TDateField;
    qryIndicador4ForaCIDADAO_NOME: TStringField;
    qryIndicador4ForaCIDADAO_MAE: TStringField;
    qryIndicador4ForaCIDADAO_FALECEU: TIntegerField;
    qryIndicador4ForaCIDADAO_SEXO: TStringField;
    qryIndicador4ForaCIND_GESTANTE: TIntegerField;
    qryIndicador4ForaCIND_HIPERTENSO: TIntegerField;
    qryIndicador4ForaCIND_DIABETICO: TIntegerField;
    qryIndicador4ForaCIND_SEXO: TStringField;
    qryIndicador4ForaCIND_MICRO_AREA: TStringField;
    qryIndicador4ForaCNS_RESP: TStringField;
    qryIndicador4ForaCPF_RESP: TStringField;
    qryIndicador4ForaCIND_INATIVO: TIntegerField;
    qryIndicador4ForaCNES: TStringField;
    qryIndicador4ForaCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryIndicador4ForaNOME_UNIDADE: TStringField;
    qryIndicador4ForaINE: TStringField;
    qryIndicador4ForaNOME_EQUIPE: TStringField;
    qryIndicador4ForaTELEFONE: TStringField;
    qryIndicador4ForaIDADEATUAL: TIntegerField;
    qryIndicador4ForaIND_I4_REGRA1: TIntegerField;
    qryIndicador4ForaINDICADOR4: TIntegerField;
    TabSheet3: TRzTabSheet;
    DBGrid3: TDBGrid;
    qryIndicador4DentroQuad: TUniQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    DateField1: TDateField;
    IntegerField2: TIntegerField;
    DateField2: TDateField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField3: TIntegerField;
    StringField7: TStringField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    IntegerField7: TIntegerField;
    StringField12: TStringField;
    IntegerField8: TIntegerField;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    IntegerField9: TIntegerField;
    IntegerField10: TIntegerField;
    IntegerField11: TIntegerField;
    dsIndicador4DentroQuad: TDataSource;
    Panel7: TPanel;
    RzPageControl2: TRzPageControl;
    TabSheet4: TRzTabSheet;
    GridPanel1: TGridPanel;
    Panel11: TPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    edNomeMae: TEdit;
    edSexo: TEdit;
    edDtNascto: TEdit;
    edCNSResp: TEdit;
    edCPFResp: TEdit;
    edCidFaleceu: TEdit;
    edDtObito: TEdit;
    edCidAtivo: TEdit;
    edCIndInativo: TEdit;
    edTelefone: TEdit;
    edCNS: TEdit;
    edCPF: TEdit;
    TabSheet6: TRzTabSheet;
    DBGrid4: TDBGrid;
    SpeedButton1: TSpeedButton;
    qryDetExamesRealizados: TUniQuery;
    qryDetExamesRealizadosID: TIntegerField;
    qryDetExamesRealizadosCPF: TStringField;
    qryDetExamesRealizadosCNS: TStringField;
    qryDetExamesRealizadosNU_CBO: TStringField;
    qryDetExamesRealizadosNO_CBO: TStringField;
    qryDetExamesRealizadosCO_DIM_TEMPO: TDateField;
    qryDetExamesRealizadosCIAPS: TStringField;
    qryDetExamesRealizadosCIDS: TStringField;
    qryDetExamesRealizadosCNS_PROFISSIONAL: TStringField;
    qryDetExamesRealizadosNO_PROFISSIONAL: TStringField;
    qryDetExamesRealizadosNU_INE: TStringField;
    qryDetExamesRealizadosNO_EQUIPE: TStringField;
    qryDetExamesRealizadosNO_CNES: TStringField;
    qryDetExamesRealizadosNO_UNIDADE_SAUDE: TStringField;
    dsDetExamesRealizados: TDataSource;
    qryDetExamesRealizadosPROCEDIMENTO: TStringField;
    Panel3: TPanel;
    Panel8: TPanel;
    Panel12: TPanel;
    lblIndice: TLabel;
    Panel13: TPanel;
    Panel15: TPanel;
    lblNumerador: TLabel;
    Label32: TLabel;
    lblDenominador: TLabel;
    Panel9: TPanel;
    lblDenom_Estimado: TLabel;
    Panel14: TPanel;
    edProcedimentos: TEdit;
    Label9: TLabel;
    qryIndicador4ForaPROCEDIMENTOS: TStringField;
    qryIndicador4DentroPROCEDIMENTOS: TStringField;
    Panel10: TPanel;
    lblRegQuad: TLabel;
    qryIndicador4DentroDT_ULT_EXAME: TDateField;
    qryIndicador4DentroDT_PROXIMO_EXAME: TDateField;
    qryIndicador4ForaDT_ULT_EXAME: TDateField;
    qryIndicador4ForaDT_PROXIMO_EXAME: TDateField;
    qryIndicador4DentroQuadPROCEDIMENTOS: TStringField;
    qryIndicador4DentroQuadDT_ULT_EXAME: TDateField;
    qryIndicador4DentroQuadDT_PROXIMO_EXAME: TDateField;
    qryIndicador4DentroQTDE_EXAMES: TIntegerField;
    qryIndicador4DentroQuadQTDE_EXAMES: TIntegerField;
    edDscExame: TEdit;
    Label10: TLabel;
    qryIndicador4DentroDSC_PROCEDIMENTO: TStringField;
    qryIndicador4ForaDSC_PROCEDIMENTO: TStringField;
    qryIndicador4DentroQuadDSC_PROCEDIMENTO: TStringField;
    qryTotaliza_exames: TUniQuery;
    lblnroexames: TLabel;
    qryDetExamesRealizadosORIGEMDADOS: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure LimparGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IntegerField1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure dsIndicador4ForaDataChange(Sender: TObject; Field: TField);
    procedure dsIndicador4DentroDataChange(Sender: TObject; Field: TField);

  private
    { Private declarations }
    procedure getInformacoes(ds:TDataset);
  public
    { Public declarations }
  end;
const
 crlf = #13+#10;
 i_where = 25;

var
  FGestantesInd4: TFGestantesInd4;
  SQLPADRAO:String;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TFGestantesInd4.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if gdSelected in State then
  begin
    dbgrid1.Canvas.Font.Color := clHighlightText; //Fundo
    dbgrid1.Canvas.Brush.Color:= clHighlight; //Fonte
  end
  else
  begin
    {
    If odd(qryIndicador1Dentro.RecNo) then
    begin
      dbgrid1.Canvas.Font.Color := clBlack;
      dbgrid1.Canvas.Brush.Color:= $00F2FFFF;
    end
    else
    begin
      dbgrid1.Canvas.Font.Color := clBlack;
      dbgrid1.Canvas.Brush.Color:= $00FFF9EA;
    end;
    }
    {
    if (qryIndicador4Dentro.FieldbyName('idadeGestacional').asInteger>42) then
    begin
      dbgrid1.Canvas.Font.Color := clRed;
      dbgrid1.Canvas.Brush.Color:= clWhite;
    end;
    }
  end;

  //dbgrid1.Canvas.FillRect(Rect);
  //dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);
  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawDataCell(Rect,Column.Field, State);
end;

procedure TFGestantesInd4.dsIndicador4DentroDataChange(Sender: TObject;
  Field: TField);
begin
  qryDetExamesRealizados.close;
  qryDetExamesRealizados.ParamByName('sequencia').asInteger:=qryIndicador4Dentro.FieldByName('sequencia').asInteger;
  qryDetExamesRealizados.Open;

  if rzPageControl1.ActivePageIndex = 0 then
   getInformacoes(qryIndicador4Dentro);

end;

procedure TFGestantesInd4.dsIndicador4ForaDataChange(Sender: TObject;
  Field: TField);
begin
  qryDetExamesRealizados.close;
  qryDetExamesRealizados.ParamByName('sequencia').asInteger:=qryIndicador4Fora.FieldByName('sequencia').asInteger;
  qryDetExamesRealizados.Open;

  if rzPageControl1.ActivePageIndex = 1 then
   getInformacoes(qryIndicador4Fora);
end;

procedure TFGestantesInd4.FormCreate(Sender: TObject);
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

procedure TFGestantesInd4.IntegerField1GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 0 then
   Text:='NÃO'
  else
   Text:='SIM'

end;

procedure TFGestantesInd4.LimparGrid;
var
 filtro:String;
begin
  {todo:}
  qryIndicador4Dentro.close;
  qryIndicador4Fora.close;
  dbgrid1.datasource:=nil;
  dbgrid2.datasource:=nil;
  dbgrid3.datasource:=nil;
  sleep(1000);
end;

procedure TFGestantesInd4.RzBitBtn1Click(Sender: TObject);
var
 filtro:String;
 nIndice:double;
 nTotalMulheres:integer;
 res, nIdadeInicial, nIdadeFinal:integer;
 data_inicial, data_final:TDateTime;
 ano,mes,dia: word;
begin
   limparGrid;
   qryTotaliza_exames.Close;
   qryIndicador4Dentro.close;
   qryIndicador4Fora.close;

   nIdadeInicial:=StrToInt(edIdadeInicial.text);
   nIdadeFinal  :=StrToInt(edIdadeFinal.text);

   DecodeDate(edDataInicial.date, ano, mes, dia);
   ano:=ano - nIdadeFinal;
   data_inicial:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

   DecodeDate(edDataFinal.date, ano, mes, dia);
   ano:=ano - nIdadeInicial;
   data_Final:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

 if edDataInicial.text<>'' then                // Criando Filtro para Idades
 begin
  qryIndicador4Dentro.ParamByName('data_inicial').asDateTime:=Data_inicial;
  qryIndicador4Fora.ParamByName('data_inicial').asDateTime:=Data_inicial;
  qryIndicador4DentroQuad.ParamByName('data_inicial').asDateTime:=edDataInicial.date;
 end;

 if edDataFinal.text<>'' then
 begin
   qryIndicador4Dentro.ParamByName('data_final').asDateTime:=Data_Final;
   qryIndicador4Fora.ParamByName('data_final').asDateTime:=Data_Final;
   qryIndicador4DentroQuad.ParamByName('data_final').asDateTime:=edDataFinal.date;

 end;

 if edIdadeInicial.text<>'' then                // Criando Filtro para Idades
 begin
  qryIndicador4Dentro.ParamByName('idade_inicial').asInteger:=nIdadeInicial;
  qryIndicador4Fora.ParamByName('idade_inicial').asInteger:=nIdadeInicial;
  qryIndicador4DentroQuad.ParamByName('idade_inicial').asInteger:=nIdadeInicial;
  qryTotaliza_Exames.ParamByName('idade_inicial').asInteger:=nIdadeInicial;

 end;

 if edIdadeFinal.text<>'' then
 begin
   qryIndicador4Dentro.ParamByName('idade_final').asInteger:=nIdadeFinal;
   qryIndicador4Fora.ParamByName('idade_final').asInteger:=nIdadeFinal;
   qryIndicador4DentroQuad.ParamByName('idade_final').asInteger:=nIdadeFinal;
   qryTotaliza_Exames.ParamByName('idade_final').asInteger:=nIdadeFinal;

 end;

 if cbUnidade.Value<>'1' then
 begin
   qryIndicador4Dentro.sql[6]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador4Dentro.sql[6]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador4Fora.sql[6]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador4Fora.sql[6]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador4DentroQuad.sql[9]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador4DentroQuad.sql[9]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;

   qryIndicador4Dentro.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
   qryIndicador4Fora.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
   qryIndicador4DentroQuad.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
 end
 else
 begin
   qryIndicador4Dentro.sql[6]:=' 1=1 ';
   qryIndicador4Fora.sql[6]:=' 1=1 ';
   qryIndicador4DentroQuad.sql[9]:=' 1=1 ';

 end;

 if cbMA.Value<>'999999' then
 begin
   qryIndicador4Dentro.sql[8]:=' cind_micro_area = '+quotedStr(cbMA.text);
   qryIndicador4Fora.sql[8]:=' cind_micro_area = '+quotedStr(cbMA.text);
   qryIndicador4DentroQuad.sql[11]:=' cind_micro_area = '+quotedStr(cbMA.text);

 end
 else
 begin
   qryIndicador4Dentro.sql[8]:=' 1=1';
   qryIndicador4Fora.sql[8]:=' 1=1';
   qryIndicador4DentroQuad.sql[11]:=' 1=1';
 end;


 dbgrid1.datasource:=dsIndicador4Dentro ;
 dbgrid2.datasource:=dsIndicador4Fora ;
 dbgrid3.datasource:=dsIndicador4DentroQuad ;
 nIndice:=0.0;

 nTotalMulheres:=1;
 qryTotaliza_Exames.Open;
 qryIndicador4DentroQuad.open;
 qryIndicador4Fora.open;
 qryIndicador4Dentro.open;

 if ((qryIndicador4Dentro.recordCount<=0) and (qryIndicador4fora.recordCount<=0)) then
 begin
//-   Application.MessageBox('Não há dados com os parâmetros informados na consulta!','Atenção', MB_ICONINFORMATION + MB_OK);
    abort;
 end;

 lblRegDentro.Caption:='Registros Selecionados:'+IntToStr(qryIndicador4Dentro.RecordCount);
 lblRegFora.Caption:='Registros Selecionados:'+IntToStr(qryIndicador4Fora.RecordCount);

 nTotalMulheres := qryIndicador4Dentro.RecordCount + qryIndicador4Fora.RecordCount;
 if qryIndicador4Dentro.Recordcount = 0 then
  nIndice:=0.0
 else
  nIndice:=(qryIndicador4Dentro.Recordcount /  nTotalMulheres) * 100;
 lblNumerador.caption:='NUMERADOR:'+LeftPad(qryIndicador4Dentro.RecordCount.ToString,2,'0');
 lblDenominador.caption:='DENOMINADOR:'+LeftPad(nTotalMulheres.toString(),2,'0');
 if cbUnidade.Value<>'1' then
  lblDenom_Estimado.caption:=FormatFloat('#####',objConfiguracao.dn_estimado04)
 else
  lblDenom_Estimado.caption:=FormatFloat('#####',objConfiguracao.dn_estimado04)+' - '+ FormatFloat('0.##',(nTotalMulheres/ objConfiguracao.dn_estimado04)*100)+' %' ;
 lblIndice.caption:=FormatFloat('0.##',nIndice) + '%';

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

 lblRegDentro.caption:='Total de Registros Selecionados:'+qryIndicador4Dentro.RECORDCOUNT.TOSTRING;
 lblRegFora.caption:='Total de Registros Selecionados:'+qryIndicador4Fora.RECORDCOUNT.TOSTRING;
 lblRegQuad.Caption:='Total de Registros Selecionados:'+qryIndicador4DentroQuad.RECORDCOUNT.TOSTRING;
 lblNroExames.Caption:='Total de Exames Citopatógicos Realizados:   '+FormatFloat('#####',qryTotaliza_Exames.FieldByName('total_exames').AsInteger);
end;


procedure TFGestantesInd4.RzPageControl1Change(Sender: TObject);
begin
  if rzPageControl1.ActivePageIndex = 1 then
  begin
   qryIndicador4Dentro.close;
   qryIndicador4Fora.open;
   getInformacoes(qryIndicador4Fora);
  end;

  if rzPageControl1.ActivePageIndex = 0 then
  begin
   qryIndicador4Dentro.open;
   qryIndicador4Fora.close;
   getInformacoes(qryIndicador4Dentro);
  end;
end;

procedure TFGestantesInd4.SpeedButton1Click(Sender: TObject);
var
 pathFile1:String;
 pathFile2:String;
 pathApp:string;
begin

if (qryIndicador4Dentro.recordCount>0) and (qryIndicador4Fora.recordCount>0) then
begin

  pathAPP := extractfilePath(Application.exeName);

  if not DirectoryExists(pathAPP + 'Arquivos') then
    ForceDirectories(pathAPP + 'Arquivos');

  pathFile1:=PathAPP+'Arquivos\Ind4'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_dentro.xls';
  ExpXLS(qryIndicador4Dentro, pathFile1);
  pathFile2:=PathAPP+'Arquivos\Ind4'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_fora.xls';
  ExpXLS(qryIndicador4Fora, pathFile2);

  ShowFolder(PathAPP + 'Arquivos');
end;

end;


procedure TFGestantesInd4.getInformacoes(ds:TDataset);
begin
 edCNS.text:=ds.FieldByName('CNS').asString;
 edCPF.text:=ds.FieldByName('CPF').asString;
 edTelefone.text:=ds.FieldByName('TELEFONE').asString;
 edNomeMae.text:=ds.FieldByName('CIDADAO_MAE').asString;
 edSexo.text:=ds.FieldByName('CIDADAO_SEXO').asString;
 edDtNascto.text:=ds.FieldByName('DATA_NASCIMENTO').asString;
 edCNSResp.text:=ds.FieldByName('CNS_RESP').asString;
 edCPFResp.text:=ds.FieldByName('CPF_RESP').asString;
 edDtObito.text:=ds.FieldByName('DATA_FALECIMENTO').asString;

 if ((ds.FieldByName('CIDADAO_FALECEU').asString<>'') and (ds.FieldByName('CIDADAO_FALECEU').asString = '1')) then
  edCidFaleceu.text:='SIM'
 else
  edCidFaleceu.text:='NÃO';

 if ((ds.FieldByName('CIDADAO_ATIVO').asString<>'') and (ds.FieldByName('CIDADAO_ATIVO').asString = '1')) then
  edCidAtivo.text:='SIM'
 else
  edCidAtivo.text:='NÃO';

 if ((ds.FieldByName('CIND_INATIVO').asString<>'') and (ds.FieldByName('CIND_INATIVO').asString = '1')) then
  edCindInativo.text:='SIM'
 else
  edCindInativo.text:='NÃO';

 edProcedimentos.text:=ds.FieldByName('PROCEDIMENTOS').asString;
 edDscExame.text:=ds.FieldByName('DSC_PROCEDIMENTO').asString;
end;


end.
