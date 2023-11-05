unit uFGestantesInd5;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls, RzCmboBx, RzButton,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzTabs, Math, Datasnap.DBClient,
  Vcl.Samples.Gauges, Vcl.Buttons, DASQLMonitor, UniSQLMonitor;

type
  TFGestantesInd5 = class(TForm)
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
    qryIndicador5Dentro: TUniQuery;
    dsIndicador5Dentro: TDataSource;
    TabSheet2: TRzTabSheet;
    DBGrid2: TDBGrid;
    qryIndicador5Fora: TUniQuery;
    dsIndicador5Fora: TDataSource;
    Panel6: TPanel;
    lblregFora: TLabel;
    qryIndicador5DentroSEQUENCIA: TIntegerField;
    qryIndicador5DentroCNS: TStringField;
    qryIndicador5DentroCPF: TStringField;
    qryIndicador5DentroCNS_ALTERNATIVO: TStringField;
    qryIndicador5DentroCPF_ALTERNATIVO: TStringField;
    qryIndicador5DentroDATA_NASCIMENTO: TDateField;
    qryIndicador5DentroCIDADAO_ATIVO: TIntegerField;
    qryIndicador5DentroDATA_FALECIMENTO: TDateField;
    qryIndicador5DentroCIDADAO_NOME: TStringField;
    qryIndicador5DentroCIDADAO_MAE: TStringField;
    qryIndicador5DentroCIDADAO_FALECEU: TIntegerField;
    qryIndicador5DentroCIDADAO_SEXO: TStringField;
    qryIndicador5DentroCIND_GESTANTE: TIntegerField;
    qryIndicador5DentroCIND_HIPERTENSO: TIntegerField;
    qryIndicador5DentroCIND_DIABETICO: TIntegerField;
    qryIndicador5DentroCIND_SEXO: TStringField;
    qryIndicador5DentroCIND_MICRO_AREA: TStringField;
    qryIndicador5DentroCNS_RESP: TStringField;
    qryIndicador5DentroCPF_RESP: TStringField;
    qryIndicador5DentroCIND_INATIVO: TIntegerField;
    qryIndicador5DentroCNES: TStringField;
    qryIndicador5DentroCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryIndicador5DentroNOME_UNIDADE: TStringField;
    qryIndicador5DentroINE: TStringField;
    qryIndicador5DentroNOME_EQUIPE: TStringField;
    qryIndicador5DentroTELEFONE: TStringField;
    qryIndicador5DentroIDADEATUAL: TIntegerField;
    qryIndicador5ForaSEQUENCIA: TIntegerField;
    qryIndicador5ForaCNS: TStringField;
    qryIndicador5ForaCPF: TStringField;
    qryIndicador5ForaCNS_ALTERNATIVO: TStringField;
    qryIndicador5ForaCPF_ALTERNATIVO: TStringField;
    qryIndicador5ForaDATA_NASCIMENTO: TDateField;
    qryIndicador5ForaCIDADAO_ATIVO: TIntegerField;
    qryIndicador5ForaDATA_FALECIMENTO: TDateField;
    qryIndicador5ForaCIDADAO_NOME: TStringField;
    qryIndicador5ForaCIDADAO_MAE: TStringField;
    qryIndicador5ForaCIDADAO_FALECEU: TIntegerField;
    qryIndicador5ForaCIDADAO_SEXO: TStringField;
    qryIndicador5ForaCIND_GESTANTE: TIntegerField;
    qryIndicador5ForaCIND_HIPERTENSO: TIntegerField;
    qryIndicador5ForaCIND_DIABETICO: TIntegerField;
    qryIndicador5ForaCIND_SEXO: TStringField;
    qryIndicador5ForaCIND_MICRO_AREA: TStringField;
    qryIndicador5ForaCNS_RESP: TStringField;
    qryIndicador5ForaCPF_RESP: TStringField;
    qryIndicador5ForaCIND_INATIVO: TIntegerField;
    qryIndicador5ForaCNES: TStringField;
    qryIndicador5ForaCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryIndicador5ForaNOME_UNIDADE: TStringField;
    qryIndicador5ForaINE: TStringField;
    qryIndicador5ForaNOME_EQUIPE: TStringField;
    qryIndicador5ForaTELEFONE: TStringField;
    qryIndicador5ForaIDADEATUAL: TIntegerField;
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
    qryTotaliza_exames: TUniQuery;
    lblnroexames: TLabel;
    qryDetExamesRealizadosORIGEMDADOS: TStringField;
    qryIndicador5DentroIND_I5_REGRA1: TIntegerField;
    qryIndicador5DentroINDICADOR5: TIntegerField;
    qryIndicador5DentroSEM_EQUIP_VINCULADA: TSmallintField;
    qryIndicador5DentroPENTA_1_DOSE: TSmallintField;
    qryIndicador5DentroDT_PENTA_1D: TDateField;
    qryIndicador5DentroPENTA_2_DOSE: TSmallintField;
    qryIndicador5DentroDT_PENTA_2D: TDateField;
    qryIndicador5DentroPENTA_3_DOSE: TSmallintField;
    qryIndicador5DentroDT_PENTA_3D: TDateField;
    qryIndicador5DentroPOLIO_1_DOSE: TSmallintField;
    qryIndicador5DentroDT_POLIO_1D: TDateField;
    qryIndicador5DentroPOLIO_2_DOSE: TSmallintField;
    qryIndicador5DentroDT_POLIO_2D: TDateField;
    qryIndicador5DentroPOLIO_3_DOSE: TSmallintField;
    qryIndicador5DentroDT_POLIO_3D: TDateField;
    qryIndicador5DentroCO_SEQ_CIDADAO: TIntegerField;
    qryIndicador5ForaIND_I5_REGRA1: TIntegerField;
    qryIndicador5ForaINDICADOR5: TIntegerField;
    qryIndicador5ForaSEM_EQUIP_VINCULADA: TSmallintField;
    qryIndicador5ForaPENTA_1_DOSE: TSmallintField;
    qryIndicador5ForaDT_PENTA_1D: TDateField;
    qryIndicador5ForaPENTA_2_DOSE: TSmallintField;
    qryIndicador5ForaDT_PENTA_2D: TDateField;
    qryIndicador5ForaPENTA_3_DOSE: TSmallintField;
    qryIndicador5ForaDT_PENTA_3D: TDateField;
    qryIndicador5ForaPOLIO_1_DOSE: TSmallintField;
    qryIndicador5ForaDT_POLIO_1D: TDateField;
    qryIndicador5ForaPOLIO_2_DOSE: TSmallintField;
    qryIndicador5ForaDT_POLIO_2D: TDateField;
    qryIndicador5ForaPOLIO_3_DOSE: TSmallintField;
    qryIndicador5ForaDT_POLIO_3D: TDateField;
    qryIndicador5ForaCO_SEQ_CIDADAO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure LimparGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IntegerField1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure RzPageControl1Change(Sender: TObject);
    procedure dsIndicador5ForaDataChange(Sender: TObject; Field: TField);
    procedure dsIndicador5DentroDataChange(Sender: TObject; Field: TField);

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
  FGestantesInd5: TFGestantesInd5;
  SQLPADRAO:String;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TFGestantesInd5.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFGestantesInd5.dsIndicador5DentroDataChange(Sender: TObject;
  Field: TField);
begin
  //qryDetExamesRealizados.close;
  //qryDetExamesRealizados.ParamByName('sequencia').asInteger:=qryIndicador5Dentro.FieldByName('sequencia').asInteger;
  //qryDetExamesRealizados.Open;

  if rzPageControl1.ActivePageIndex = 0 then
   getInformacoes(qryIndicador5Dentro);

end;

procedure TFGestantesInd5.dsIndicador5ForaDataChange(Sender: TObject;
  Field: TField);
begin
//  qryDetExamesRealizados.close;
//  qryDetExamesRealizados.ParamByName('sequencia').asInteger:=qryIndicador5Fora.FieldByName('sequencia').asInteger;
//  qryDetExamesRealizados.Open;

  if rzPageControl1.ActivePageIndex = 1 then
   getInformacoes(qryIndicador5Fora);
end;

procedure TFGestantesInd5.FormCreate(Sender: TObject);
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

procedure TFGestantesInd5.IntegerField1GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 0 then
   Text:='NÃO'
  else
   Text:='SIM'

end;

procedure TFGestantesInd5.LimparGrid;
var
 filtro:String;
begin
  {todo:}
  qryIndicador5Dentro.close;
  qryIndicador5Fora.close;
  dbgrid1.datasource:=nil;
  dbgrid2.datasource:=nil;
  sleep(1000);
end;

procedure TFGestantesInd5.RzBitBtn1Click(Sender: TObject);
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
   qryIndicador5Dentro.close;
   qryIndicador5Fora.close;

   nIdadeInicial:=0;
   nIdadeFinal  :=1;

   DecodeDate(edDataInicial.date, ano, mes, dia);
   ano:=ano - nIdadeFinal;
   data_inicial:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

   DecodeDate(edDataFinal.date, ano, mes, dia);
   ano:=ano - nIdadeInicial;
   data_Final:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

 if edDataInicial.text<>'' then                // Criando Filtro para Idades
 begin
  qryIndicador5Dentro.ParamByName('data_inicial').asDateTime:=Data_inicial;
  qryIndicador5Fora.ParamByName('data_inicial').asDateTime:=Data_inicial;
 end;

 if edDataFinal.text<>'' then
 begin
   qryIndicador5Dentro.ParamByName('data_final').asDateTime:=Data_Final;
   qryIndicador5Fora.ParamByName('data_final').asDateTime:=Data_Final;

 end;
{
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
 }
 if cbUnidade.Value<>'1' then
 begin
   qryIndicador5Dentro.sql[6]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador5Dentro.sql[6]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador5Fora.sql[6]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador5Fora.sql[6]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;

   qryIndicador5Dentro.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
   qryIndicador5Fora.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
 end
 else
 begin
   qryIndicador5Dentro.sql[6]:=' 1=1 ';
   qryIndicador5Fora.sql[6]:=' 1=1 ';

 end;

 if cbMA.Value<>'999999' then
 begin
   qryIndicador5Dentro.sql[8]:=' cind_micro_area = '+quotedStr(cbMA.text);
   qryIndicador5Fora.sql[8]:=' cind_micro_area = '+quotedStr(cbMA.text);

 end
 else
 begin
   qryIndicador5Dentro.sql[8]:=' 1=1';
   qryIndicador5Fora.sql[8]:=' 1=1';
 end;


 dbgrid1.datasource:=dsIndicador5Dentro ;
 dbgrid2.datasource:=dsIndicador5Fora ;
 nIndice:=0.0;

 nTotalMulheres:=1;
 //qryTotaliza_Exames.Open;
 qryIndicador5Fora.open;
 qryIndicador5Dentro.open;

 if ((qryIndicador5Dentro.recordCount<=0) and (qryIndicador5fora.recordCount<=0)) then
 begin
//-   Application.MessageBox('Não há dados com os parâmetros informados na consulta!','Atenção', MB_ICONINFORMATION + MB_OK);
    abort;
 end;

 lblRegDentro.Caption:='Registros Selecionados:'+IntToStr(qryIndicador5Dentro.RecordCount);
 lblRegFora.Caption:='Registros Selecionados:'+IntToStr(qryIndicador5Fora.RecordCount);

 nTotalMulheres := qryIndicador5Dentro.RecordCount + qryIndicador5Fora.RecordCount;
 if qryIndicador5Dentro.Recordcount = 0 then
  nIndice:=0.0
 else
  nIndice:=(qryIndicador5Dentro.Recordcount /  nTotalMulheres) * 100;
 lblNumerador.caption:='NUMERADOR:'+LeftPad(qryIndicador5Dentro.RecordCount.ToString,2,'0');
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

 lblRegDentro.caption:='Total de Registros Selecionados:'+qryIndicador5Dentro.RECORDCOUNT.TOSTRING;
 lblRegFora.caption:='Total de Registros Selecionados:'+qryIndicador5Fora.RECORDCOUNT.TOSTRING;
// lblNroExames.Caption:='Total de Exames Citopatógicos Realizados:   '+FormatFloat('#####',qryTotaliza_Exames.FieldByName('total_exames').AsInteger);
end;


procedure TFGestantesInd5.RzPageControl1Change(Sender: TObject);
begin
  if rzPageControl1.ActivePageIndex = 1 then
  begin
   qryIndicador5Dentro.close;
   qryIndicador5Fora.open;
   getInformacoes(qryIndicador5Fora);
  end;

  if rzPageControl1.ActivePageIndex = 0 then
  begin
   qryIndicador5Dentro.open;
   qryIndicador5Fora.close;
   getInformacoes(qryIndicador5Dentro);
  end;
end;

procedure TFGestantesInd5.SpeedButton1Click(Sender: TObject);
var
 pathFile1:String;
 pathFile2:String;
 pathApp:string;
begin

if (qryIndicador5Dentro.recordCount>0) and (qryIndicador5Fora.recordCount>0) then
begin

  pathAPP := extractfilePath(Application.exeName);

  if not DirectoryExists(pathAPP + 'Arquivos') then
    ForceDirectories(pathAPP + 'Arquivos');

  pathFile1:=PathAPP+'Arquivos\Ind5'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_dentro.xls';
  ExpXLS(qryIndicador5Dentro, pathFile1);
  pathFile2:=PathAPP+'Arquivos\Ind5'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_fora.xls';
  ExpXLS(qryIndicador5Fora, pathFile2);

  ShowFolder(PathAPP + 'Arquivos');
end;

end;


procedure TFGestantesInd5.getInformacoes(ds:TDataset);
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

end;


end.
