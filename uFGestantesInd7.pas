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
unit uFGestantesInd7;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls, RzCmboBx, RzButton,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzTabs, Math, Datasnap.DBClient,
  Vcl.Samples.Gauges, Vcl.Buttons, Vcl.ExtDlgs;

type
  TFGestantesInd7 = class(TForm)
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
    cbUnidade: TRzComboBox;
    cbMA: TRzComboBox;
    edDataInicial: TRzDateTimeEdit;
    edDataFinal: TRzDateTimeEdit;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    lblRegDentro: TLabel;
    Panel8: TPanel;
    lblNumerador: TLabel;
    lblDenominador: TLabel;
    Panel9: TPanel;
    lblIndice: TLabel;
    lblDenom_estimado: TLabel;
    qryUnidadenu_cnes: TStringField;
    qryUnidadeno_unidade_saude: TStringField;
    UniQuery1: TUniQuery;
    DataSource1: TDataSource;
    TabSheet2: TRzTabSheet;
    DBGrid2: TDBGrid;
    UniQuery2: TUniQuery;
    Panel6: TPanel;
    lblRegFora: TLabel;
    Gauge2: TGauge;
    DataSource2: TDataSource;
    UniQuery1coseqcidadaopath: TLargeintField;
    UniQuery1co_seq_fat_cidadao_pec: TLargeintField;
    UniQuery1no_unidade_saude: TStringField;
    UniQuery1nocidadaopath: TStringField;
    UniQuery1cnspath: TStringField;
    UniQuery1cpfpath: TStringField;
    UniQuery1telcontato: TStringField;
    UniQuery1idade: TStringField;
    UniQuery1dtultimoatendpath: TDateField;
    UniQuery1nu_micro_area: TStringField;
    UniQuery1st_cidadao_consistente: TIntegerField;
    UniQuery1total: TIntegerField;
    UniQuery2coseqcidadaopath: TLargeintField;
    UniQuery2co_seq_fat_cidadao_pec: TLargeintField;
    UniQuery2no_unidade_saude: TStringField;
    UniQuery2nocidadaopath: TStringField;
    UniQuery2cnspath: TStringField;
    UniQuery2cpfpath: TStringField;
    UniQuery2telcontato: TStringField;
    UniQuery2idade: TStringField;
    UniQuery2dtultimoatendpath: TDateField;
    UniQuery2nu_micro_area: TStringField;
    UniQuery2st_cidadao_consistente: TIntegerField;
    UniQuery2total: TIntegerField;
    Panel10: TPanel;
    SpeedButton1: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure LimparGrid;
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure IntegerField1GetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure UniQuery1st_cidadao_consistenteGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure UniQuery2st_cidadao_consistenteGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
const
 crlf = #13+#10;
 i_where = 25;

var
  FGestantesInd7: TFGestantesInd7;
  SQLPADRAO:String;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TFGestantesInd7.DBGrid1DrawColumnCell(Sender: TObject;
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

procedure TFGestantesInd7.FormCreate(Sender: TObject);
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

procedure TFGestantesInd7.IntegerField1GetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
  if Sender.AsInteger = 0 then
   Text:='NÃO'
  else
   Text:='SIM'

end;

procedure TFGestantesInd7.LimparGrid;
var
 filtro:String;
begin
  {todo:}
  dbgrid1.datasource:=nil;
  sleep(1000);
end;

procedure TFGestantesInd7.RzBitBtn1Click(Sender: TObject);
var
 filtro:String;
 nIndice:double;
 nTotalMulheres:integer;
 res:integer;
begin

 uniquery1.close;
 Uniquery1.parambyName('dia_inicial').asDate:=eddataInicial.date;
 Uniquery1.parambyName('dia_final').asDate:=edDataFinal.date;
 Uniquery1.parambyName('unidade_saude').asString:=cbUnidade.Value;
 //Uniquery1.parambyName('co_ibge').asString:='3303005';
 uniquery1.open;
 uniquery2.close;
 Uniquery2.parambyName('dia_inicial').asDate:=eddataInicial.date;
 Uniquery2.parambyName('dia_final').asDate:=edDataFinal.date;
 Uniquery2.parambyName('unidade_saude').asString:=cbUnidade.Value;
 //Uniquery1.parambyName('co_ibge').asString:='3303005';
 uniquery2.open;
  lblregDentro.caption:='Total de Registros Selecionados:'+uniquery1.recordCount.toString();
  lblregFora.caption:='Total de Registros Selecionados:'+uniquery2.recordCount.toString();

end;


procedure TFGestantesInd7.SpeedButton1Click(Sender: TObject);
var
 pathFile1:String;
 pathFile2:String;
 pathApp:string;
begin

if (uniquery1.recordCount>0) and (uniquery2.recordCount>0) then
begin

  pathAPP := extractfilePath(Application.exeName);

  if not DirectoryExists(pathAPP + 'Arquivos') then
    ForceDirectories(pathAPP + 'Arquivos');


  pathFile1:=PathAPP+'Arquivos\Ind7'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_dentro.xls';
  ExpXLS(Uniquery1, pathFile1);
  pathFile2:=PathAPP+'Arquivos\Ind7'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_fora.xls';
  ExpXLS(Uniquery2, pathFile2);

  ShowFolder(PathAPP + 'Arquivos');
end;

end;

procedure TFGestantesInd7.UniQuery1st_cidadao_consistenteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 if sender.AsInteger = 1 then
   Text:='SIM'
 else
   Text:='NÃO';
end;

procedure TFGestantesInd7.UniQuery2st_cidadao_consistenteGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 if sender.AsInteger = 1 then
   Text:='SIM'
 else
   Text:='NÃO';
end;

end.
