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
unit uFVacinacaoCovid;

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
  TFVacinacaoCovid = class(TForm)
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
    qryUnidade: TUniQuery;
    qryMA: TUniQuery;
    dsUnidade: TDataSource;
    dsMA: TDataSource;
    qryUnidadeco_seq_dim_unidade_saude: TLargeintField;
    qryUnidadeno_unidade_saude: TStringField;
    cbUnidade: TRzComboBox;
    edDataInicial: TRzDateTimeEdit;
    edDataFinal: TRzDateTimeEdit;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    Panel4: TPanel;
    lblRegDentro: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    lblIndice: TLabel;
    UniQuery1: TUniQuery;
    DataSource1: TDataSource;
    UniQuery1NU_CPF: TStringField;
    UniQuery1NU_CNS: TStringField;
    UniQuery1DATA_NASCTO: TDateField;
    UniQuery1NO_UNIDADE_SAUDE: TStringField;
    UniQuery1NO_IMUNIZANTE: TStringField;
    UniQuery1NO_CIDADAO: TStringField;
    DBGrid1: TDBGrid;
    UniQuery1DOSE_APLICADA: TStringField;
    UniQuery1DATA_APLICACAO_DOSE: TDateTimeField;
    UniQuery1LOTE_VACINA_DOSE: TStringField;
    UniQuery1D2_APLICADA: TStringField;
    UniQuery1DATA_APLICACAO_D2: TDateTimeField;
    UniQuery1LOTE_VACINA_D2: TStringField;
    Label4: TLabel;
    qryTotalVacinados: TUniQuery;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure LimparGrid;

  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
 crlf = #13+#10;
 i_where = 25;

var
  FVacinacaoCovid: TFVacinacaoCovid;
  SQLPADRAO:String;
  Total_Vacinados: double;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TFVacinacaoCovid.FormCreate(Sender: TObject);
begin
 //qryIndicador1.open;

  qryUnidade.open;
  qryMA.open;

  carregaComboBox(qryUnidade, cbUnidade);

  rzpagecontrol1.ActivePageIndex:=0;
  edDataInicial.date:=StrToDate('01/05/2021');
  edDataFinal.date:=StrToDate('31/08/2021');

  qryTotalVacinados.open;
  qryTotalVAcinados.last;

  Total_Vacinados:=(qryTotalVacinados.FieldByName('total').asInteger / objConfiguracao.PopulacaoIBGE) * 100;
  lblIndice.caption:=FormatFloat('###.##',Total_Vacinados)+'%';

  qrytotalVacinados.close;
end;

procedure TFVacinacaoCovid.LimparGrid;
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

procedure TFVacinacaoCovid.RzBitBtn1Click(Sender: TObject);
var
 filtro:String;
 nIndice:double;
 nTotalGestantes:integer;
 res:integer;
begin
uniquery1.open;
lblregDentro.caption:=IntToStr(uniquery1.recordCount);

 limparGrid;
 Uniquery1.close;

 if edDataInicial.text<>'' then                // Criando Filtro para Idades
 begin
  uniquery1.ParamByName('dia_inicial').asDateTime:=edDataInicial.date;
 end;

 if edDataFinal.text<>'' then
 begin
   uniquery1.ParamByName('dia_final').asDateTime:=edDataFinal.date;
 end;

 if cbUnidade.value<>'1' then
 begin
   uniquery1.sql[15]:='';    //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   uniquery1.sql[15]:=' and NO_UNIDADE_SAUDE = :unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   uniquery1.ParamByName('unidade_saude').asString:=UpperCase(cbUnidade.Text);
 end
 else
 begin
   uniquery1.sql[15]:=' and 1=1 ';
 end;

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

  uniquery1.open;

end;


end.
