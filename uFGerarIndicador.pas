unit uFGerarIndicador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask,
  RzEdit, RzButton, uni, System.StrUtils, Vcl.ComCtrls, System.Types;

type

  TMyObject = class
    TipoDocCNS: string;
    ValorCNS  : string;
    TipoDocCPF: string;
    ValorCPF  : string;
  end;


  TFGerarIndicador = class(TForm)
    Panel1: TPanel;
    Panel5: TPanel;
    Panel4: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel6: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    edDataInicial: TRzDateTimeEdit;
    edDataFinal: TRzDateTimeEdit;
    Panel7: TPanel;
    lblGerados: TLabel;
    Panel8: TPanel;
    RzBitBtn1: TRzBitBtn;
    edIdadeInicial: TEdit;
    edIdadeFinal: TEdit;
    lblIdadeInicial: TLabel;
    lblIdadeFinal: TLabel;
    pb1: TProgressBar;
    lblStatus: TLabel;
    constructor Create(Sender:TComponent; nIndicador:integer); reintroduce;
    procedure FormShow(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
    function GerarIndicador123: boolean;
    function GerarIndicador4: boolean;
    function GerarIndicador5: boolean;

  public
    { Public declarations }
  end;

var
  FGerarIndicador: TFGerarIndicador;
  nrIndicador:integer;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

{ TFGerarIndicador }

constructor TFGerarIndicador.Create(Sender: TComponent; nIndicador: integer);
var
 str:String;
begin
 inherited Create(Sender);
 nrIndicador:=nIndicador;
 str:='GERAÇÃO DE DADOS';
 case nIndicador of
  1: str:=str+' DE GESTANTES - INDICADORES 1/2/3 - PREVINE BRASIL ';
  4: str:=str+' DE MULHERES - INDICADOR 4 - PREVINE BRASIL ';
  5: str:=str+' DE COBERTURA VACINAL PÓLIOMIELITE INATIVADA E PENTAVALENTE - INDICADOR 5 - PREVINE BRASIL ';
  6: str:=str+' DE HIPERTENSOS COM PRESSÃO AFERIDA A CADA SEMESTRE - INDICADOR 6 - PREVINE BRASIL ';
  7: str:=str+' DE DIABÉTICOS COM SOLICITAÇÃO DE HEMOGLOBINA GLICADA - INDICADOR 7 - PREVINE BRASIL ';
 end;
 panel2.caption:=str;
 if nrIndicador = 4 then
 begin
   lblIdadeInicial.visible:=true;
   lblIdadeFinal.Visible:=true;
   edIdadeInicial.visible:=true;
   edIdadeFinal.visible:=true;
 end
 else
 begin
   lblIdadeInicial.visible:=false;
   lblIdadeFinal.Visible:=false;
   edIdadeInicial.visible:=false;
   edIdadeFinal.visible:=false;
 end

end;

procedure TFGerarIndicador.FormShow(Sender: TObject);
begin
  edDataInicial.date:=StrToDate('01/05/2021');
  edDataFinal.date:=StrToDate('31/08/2021');
end;

function TFGerarIndicador.GerarIndicador123: boolean;
var
 qryAux1,qryAux2,qryAux3,qryAux4,qryAux5,qryTmp,qryTmpGestantes, qryTmpDetGestantes:TUniquery;

 filtro:String;
 nIndice:double;
 nTotalGestantes:integer;
 res,x,i,p, conta_duplicados: integer;
 strSQL:string;
 data_inicial, data_final, dInicial, dFinal:TDateTime;

 /////
 CNS,CPF,CNSA,CPFA,campo_busca,campo_ordem,cidadao_cpf,
 cidadao_cns,cidadao_nome,cidadao_mae,cidadao_cns_res,
 cidadao_cpf_res,cidadao_ma,cidadao_sexo,
 cind_cpf, cind_cns, cind_cns_res, cind_cpf_res,
 cind_micro_area, cnes, ine, nome_equipe, nome_sexo,nome_unidade,
 nu_uuid_ficha, nu_uuid_ficha_origem, nu_uuid_dado_transp,
 StrCMDSQL,cidadao_obito,cind_obito,campo_busca_res,
 nu_celular, ciap_final_gestacao, cid_final_gestacao,cod_unidade_saude :string;
 busca_cns, busca_cpf, busca, duplicado, TemErro : boolean;
 cidadao_nascimento, calc_20s,
 calc_ddp,calc_fimpuerp,data_nascimento, dt_primeira_consulta,
 dt_finalizacao_gestacao, calc_dlfg : TDateTime;
 cidadao_ativo,cidadao_faleceu, cind_gestante, cind_hipertenso,
 cind_diabetico, cind_inativo, num_cind, nrConsultas,
 I1_r1, I1_r2, gestacao_finalizada,ig_dias,ig_semanas,ig_meses :integer;

 rCNS,rCPF,rCNSA,rCPFA, data_falecimento,tex, dsc_fim_gestacao :string;

 MotherList, ChildList: TList;
 obj1 : TMyObject;

 controle_cbo,procedimentos_s,procedimentos_h, procedimentos : string;

 data_L1Trim, data_L2Trim, data_L3Trim: TDateTime; // variaveis de controle de data de trimestres
 NCO1Trim, NCO2trim, NCO3trim, exame_avaliado, exame_solicitado: integer;        // variaveis de controle de consultas odontologicas
begin                                          // por trimestre
 try
   TemErro:=false;                              // Variaveis de verificação de erros na geração

   qryAux1:=TUniquery.create(self);
   qryAux1.Connection:=Dm.ConexaoEsus;
   qryAux1.FetchingAll;
   qryAux2:=TUniquery.create(self);
   qryAux2.Connection:=Dm.ConexaoEsus;
   qryAux2.FetchingAll;
   qryAux3:=TUniquery.create(self);
   qryAux3.Connection:=Dm.ConexaoEsus;          // criando querys auxiliares e temporárias
   qryAux4:=TUniquery.create(self);
   qryAux4.Connection:=Dm.ConexaoEsus;
   qryAux5:=TUniquery.create(self);
   qryAux5.Connection:=Dm.ConexaoEsus;
   qryTmp :=TUniquery.create(self);
   qryTmp.Connection:=Dm.ConexaoLocal;
   qryTmpGestantes :=TUniquery.create(self);
   qryTmpGestantes.Connection:=Dm.ConexaoLocal;
   qryTmpDetGestantes :=TUniquery.create(self);
   qryTmpDetGestantes.Connection:=Dm.ConexaoLocal;


   ///////////////////////////////////////////////////////////// CÓDIGO IMPORTADO
   MotherList:=TList.Create;
   //ChildList := TList.create;
   //MotherList.Add(ChildList);
   obj1:= TMyObject.Create;

   qryTmp:=TUniquery.create(self);
   qryTmp.Connection:=dm.ConexaoLocal;

   // Limpar a tabela temporária
   strCMDSQL:='DELETE FROM tmp_gestantes';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

   strCMDSQL:= 'SET GENERATOR GEN_TMP_GESTANTES_ID TO 0 ';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

    // Limpar a tabela temporária
   strCMDSQL:='DELETE FROM tmp_detalhes_gestantes';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

   strCMDSQL:= 'SET GENERATOR GEN_TMP_DETALHES_GESTANTES_ID TO 0 ';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

   qryTmpGestantes.close;
   qryTmpGestantes.Sql.Text:='SELECT * FROM TMP_GESTANTES order by sequencia';

   qryTmpDetGestantes.close;
   qryTmpDetGestantes.Sql.Text:='SELECT * FROM TMP_DETALHES_GESTANTES order by id';


   // CONSULTA INICIAL
     strSQL:='SELECT '+#13+#10+
  't1.*, '+#13+#10+
  '      fat_cidadao_pec.nu_telefone_celular as telefone_celular '+#13+#10+
  'FROM '+#13+#10+
  '( '+#13+#10+
  'SELECT DISTINCT ON (nu_cns, nu_cpf_cidadao) '+#13+#10+
  '	CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
  '		ELSE TRIM(FROM nu_cns) END '+#13+#10+
  '		nu_cns, '+#13+#10+
  '	CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
  '		ELSE TRIM(FROM nu_cpf_cidadao) END '+#13+#10+
  '		nu_cpf_cidadao, '+#13+#10+
  '	CASE WHEN co_dim_cbo_1 = 1 THEN co_dim_cbo_2 '+#13+#10+
  '		ELSE co_dim_cbo_1 END '+#13+#10+
  '		co_dim_cbo, '+#13+#10+
  '	CASE WHEN co_dim_unidade_saude_1 = 1 THEN co_dim_unidade_saude_2 '+#13+#10+
  '		ELSE co_dim_unidade_saude_1 END '+#13+#10+
  '		co_dim_unidade_saude, '+#13+#10+
  '	CASE WHEN co_dim_equipe_1 = 1 THEN co_dim_equipe_2 '+#13+#10+
  '		ELSE co_dim_equipe_1 END '+#13+#10+
  '		co_dim_equipe, '+#13+#10+
  '	dt_nascimento, '+#13+#10+
  '	TO_CHAR(TO_DATE(co_dim_tempo_dum::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo_dum, '+#13+#10+
  '	TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
  '	co_dim_tempo_dum as dtdum, '+#13+#10+
  ' co_fat_cidadao_pec '+#13+#10+
  'FROM '+#13+#10+
  '	tb_fat_atendimento_individual '+#13+#10+
  'WHERE '+#13+#10+
  ' TO_CHAR(TO_DATE(co_dim_tempo_dum::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= :data_inicial AND '+#13+#10+
  '	TO_CHAR(TO_DATE(co_dim_tempo_dum::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date < :data_final '+#13+#10+
  '	AND ( '+#13+#10+
  '		ds_filtro_ciaps LIKE ANY ( '+#13+#10+
  '			array[ '+#13+#10+
  '				''%|W03|%'', '+#13+#10+
  '				''%|W05|%'', '+#13+#10+
  '				''%|W29|%'', '+#13+#10+
  '				''%|W71|%'', '+#13+#10+
  '				''%|W78|%'', '+#13+#10+
  '				''%|W79|%'', '+#13+#10+
  '				''%|W80|%'', '+#13+#10+
  '				''%|W81|%'', '+#13+#10+
  '				''%|W84|%'', '+#13+#10+
  '				''%|W85|%'', '+#13+#10+
  '				--''%|W72|%'', '+#13+#10+
  '				--''%|W73|%'', '+#13+#10+
  '				--''%|W75|%'', '+#13+#10+
  '				--''%|W76|%'', '+#13+#10+
  '				''%|ABP001|%'' '+#13+#10+
  '			] '+#13+#10+
  '		) OR '+#13+#10+
  '		ds_filtro_cids LIKE ANY ( '+#13+#10+
  '			array[ '+#13+#10+
  '				''%|O11|%'', '+#13+#10+
  '				''%|O120|%'', '+#13+#10+
  '				''%|O121|%'', '+#13+#10+
  '				''%|O122|%'', '+#13+#10+
  '				''%|O13|%'', '+#13+#10+
  '				''%|O140|%'', '+#13+#10+
  '				''%|O141|%'', '+#13+#10+
  '				''%|O149|%'', '+#13+#10+
  '				''%|O150|%'', '+#13+#10+
  '				''%|O151|%'', '+#13+#10+
  '				''%|O159|%'', '+#13+#10+
  '				''%|O16|%'', '+#13+#10+
  '				''%|O200|%'', '+#13+#10+
  '				''%|O208|%'', '+#13+#10+
  '				''%|O209|%'', '+#13+#10+
  '				''%|O210|%'', '+#13+#10+
  '				''%|O211|%'', '+#13+#10+
  '				''%|O212|%'', '+#13+#10+
  '				''%|O218|%'', '+#13+#10+
  '				''%|O219|%'', '+#13+#10+
  '				''%|O220|%'', '+#13+#10+
  '				''%|O221|%'', '+#13+#10+
  '				''%|O222|%'', '+#13+#10+
  '				''%|O223|%'', '+#13+#10+
  '				''%|O224|%'', '+#13+#10+
  '				''%|O225|%'', '+#13+#10+
  '				''%|O228|%'', '+#13+#10+
  '				''%|O229|%'', '+#13+#10+
  '				''%|O230|%'', '+#13+#10+
  '				''%|O231|%'', '+#13+#10+
  '				''%|O232|%'', '+#13+#10+
  '				''%|O233|%'', '+#13+#10+
  '				''%|O234|%'', '+#13+#10+
  '				''%|O235|%'', '+#13+#10+
  '				''%|O239|%'', '+#13+#10+
  '				''%|O299|%'', '+#13+#10+
  '				''%|O300|%'', '+#13+#10+
  '				''%|O301|%'', '+#13+#10+
  '				''%|O302|%'', '+#13+#10+
  '				''%|O308|%'', '+#13+#10+
  '				''%|O309|%'', '+#13+#10+
  '				''%|O311|%'', '+#13+#10+
  '				''%|O312|%'', '+#13+#10+
  '				''%|O318|%'', '+#13+#10+
  '				''%|O320|%'', '+#13+#10+
  '				''%|O321|%'', '+#13+#10+
  '				''%|O322|%'', '+#13+#10+
  '				''%|O323|%'', '+#13+#10+
  '				''%|O324|%'', '+#13+#10+
  '				''%|O325|%'', '+#13+#10+
  '				''%|O326|%'', '+#13+#10+
  '				''%|O328|%'', '+#13+#10+
  '				''%|O329|%'', '+#13+#10+
  '				''%|O330|%'', '+#13+#10+
  '				''%|O331|%'', '+#13+#10+
  '				''%|O332|%'', '+#13+#10+
  '				''%|O333|%'', '+#13+#10+
  '				''%|O334|%'', '+#13+#10+
  '				''%|O335|%'', '+#13+#10+
  '				''%|O336|%'', '+#13+#10+
  '				''%|O337|%'', '+#13+#10+
  '				''%|O338|%'', '+#13+#10+
  '				''%|O752|%'', '+#13+#10+
  '				''%|O753|%'', '+#13+#10+
  '				''%|O990|%'', '+#13+#10+
  '				''%|O991|%'', '+#13+#10+
  '				''%|O992|%'', '+#13+#10+
  '				''%|O993|%'', '+#13+#10+
  '				''%|O994|%'', '+#13+#10+
  '				''%|O240|%'', '+#13+#10+
  '				''%|O241|%'', '+#13+#10+
  '				''%|O242|%'', '+#13+#10+
  '				''%|O243|%'', '+#13+#10+
  '				''%|O244|%'', '+#13+#10+
  '				''%|O249|%'', '+#13+#10+
  '				''%|O25|%'', '+#13+#10+
  '				''%|O260|%'', '+#13+#10+
  '				''%|O261|%'', '+#13+#10+
  '				''%|O263|%'', '+#13+#10+
  '				''%|O264|%'', '+#13+#10+
  '				''%|O265|%'', '+#13+#10+
  '				''%|O268|%'', '+#13+#10+
  '				''%|O269|%'', '+#13+#10+
  '				''%|O280|%'', '+#13+#10+
  '				''%|O281|%'', '+#13+#10+
  '				''%|O282|%'', '+#13+#10+
  '				''%|O283|%'', '+#13+#10+
  '				''%|O284|%'', '+#13+#10+
  '				''%|O285|%'', '+#13+#10+
  '				''%|O288|%'', '+#13+#10+
  '				''%|O289|%'', '+#13+#10+
  '				''%|O290|%'', '+#13+#10+
  '				''%|O291|%'', '+#13+#10+
  '				''%|O292|%'', '+#13+#10+
  '				''%|O293|%'', '+#13+#10+
  '				''%|O294|%'', '+#13+#10+
  '				''%|O295|%'', '+#13+#10+
  '				''%|O296|%'', '+#13+#10+
  '				''%|O298|%'', '+#13+#10+
  '				''%|O009|%'', '+#13+#10+
  '				''%|O339|%'', '+#13+#10+
  '				''%|O340|%'', '+#13+#10+
  '				''%|O341|%'', '+#13+#10+
  '				''%|O342|%'', '+#13+#10+
  '				''%|O343|%'', '+#13+#10+
  '				''%|O344|%'', '+#13+#10+
  '				''%|O345|%'', '+#13+#10+
  '				''%|O346|%'', '+#13+#10+
  '				''%|O347|%'', '+#13+#10+
  '				''%|O348|%'', '+#13+#10+
  '				''%|O349|%'', '+#13+#10+
  '				''%|O350|%'', '+#13+#10+
  '				''%|O351|%'', '+#13+#10+
  '				''%|O352|%'', '+#13+#10+
  '				''%|O353|%'', '+#13+#10+
  '				''%|O354|%'', '+#13+#10+
  '				''%|O355|%'', '+#13+#10+
  '				''%|O356|%'', '+#13+#10+
  '				''%|O357|%'', '+#13+#10+
  '				''%|O358|%'', '+#13+#10+
  '				''%|O359|%'', '+#13+#10+
  '				''%|O360|%'', '+#13+#10+
  '				''%|O361|%'', '+#13+#10+
  '				''%|O362|%'', '+#13+#10+
  '				''%|O363|%'', '+#13+#10+
  '				''%|O365|%'', '+#13+#10+
  '				''%|O366|%'', '+#13+#10+
  '				''%|O367|%'', '+#13+#10+
  '				''%|O368|%'', '+#13+#10+
  '				''%|O369|%'', '+#13+#10+
  '				''%|O40|%'', '+#13+#10+
  '				''%|O410|%'', '+#13+#10+
  '				''%|O411|%'', '+#13+#10+
  '				''%|O418|%'', '+#13+#10+
  '				''%|O419|%'', '+#13+#10+
  '				''%|O430|%'', '+#13+#10+
  '				''%|O431|%'', '+#13+#10+
  '				''%|O438|%'', '+#13+#10+
  '				''%|O439|%'', '+#13+#10+
  '				''%|O440|%'', '+#13+#10+
  '				''%|O441|%'', '+#13+#10+
  '				''%|O460|%'', '+#13+#10+
  '				''%|O468|%'', '+#13+#10+
  '				''%|O469|%'', '+#13+#10+
  '				''%|O470|%'', '+#13+#10+
  '				''%|O471|%'', '+#13+#10+
  '				''%|O479|%'', '+#13+#10+
  '				''%|O48|%'', '+#13+#10+
  '				''%|O995|%'', '+#13+#10+
  '				''%|O996|%'', '+#13+#10+
  '				''%|O997|%'', '+#13+#10+
  '				''%|Z640|%'', '+#13+#10+
  '				''%|O00|%'', '+#13+#10+
  '				''%|O10|%'', '+#13+#10+
  '				''%|O12|%'', '+#13+#10+
  '				''%|O14|%'', '+#13+#10+
  '				''%|O15|%'', '+#13+#10+
  '				''%|O20|%'', '+#13+#10+
  '				''%|O21|%'', '+#13+#10+
  '				''%|O22|%'', '+#13+#10+
  '				''%|O23|%'', '+#13+#10+
  '				''%|O24|%'', '+#13+#10+
  '				''%|O26|%'', '+#13+#10+
  '				''%|O28|%'', '+#13+#10+
  '				''%|O29|%'', '+#13+#10+
  '				''%|O30|%'', '+#13+#10+
  '				''%|O31|%'', '+#13+#10+
  '				''%|O32|%'', '+#13+#10+
  '				''%|O33|%'', '+#13+#10+
  '				''%|O34|%'', '+#13+#10+
  '				''%|O35|%'', '+#13+#10+
  '				''%|O36|%'', '+#13+#10+
  '				''%|O41|%'', '+#13+#10+
  '				''%|O43|%'', '+#13+#10+
  '				''%|O44|%'', '+#13+#10+
  '				''%|O46|%'', '+#13+#10+
  '				''%|O47|%'', '+#13+#10+
  '				''%|O98|%'', '+#13+#10+
  '				''%|Z34|%'', '+#13+#10+
  '				''%|Z35|%'', '+#13+#10+
  '				''%|Z36|%'', '+#13+#10+
  '				''%|Z321|%'', '+#13+#10+
  '				''%|Z33|%'', '+#13+#10+
  '				''%|Z340|%'', '+#13+#10+
  '				''%|Z340|%'', '+#13+#10+
  '				''%|Z348|%'', '+#13+#10+
  '				''%|Z349|%'', '+#13+#10+
  '				''%|Z350|%'', '+#13+#10+
  '				''%|Z351|%'', '+#13+#10+
  '				''%|Z352|%'', '+#13+#10+
  '				''%|Z353|%'', '+#13+#10+
  '				''%|Z354|%'', '+#13+#10+
  '				''%|Z357|%'', '+#13+#10+
  '				''%|Z358|%'', '+#13+#10+
  '				--''%|Z356|%'', '+#13+#10+
  '				''%|Z359|%'''+#13+#10+
  '			] '+#13+#10+
  '		) '+#13+#10+
  '	) '+#13+#10+
  'ORDER BY nu_cns, nu_cpf_cidadao '+#13+#10+
  ') AS t1 '+#13+#10+
  'left join tb_fat_cidadao_pec fat_cidadao_pec on (t1.co_fat_cidadao_pec = fat_cidadao_pec.co_seq_fat_cidadao_pec) '+#13+#10+
  'ORDER BY co_dim_tempo_dum ';


   data_inicial:=edDataInicial.date - 280;
   data_final  :=edDataFinal.date - 279;
   dInicial:=edDataInicial.date;
   dFinal:=edDataFinal.date;
   qryAux1.close;
   qryAux1.sql.clear;
   qryAux1.sql.text:=strSQL;
   qryAux1.ParamByName('data_inicial').asDateTime:=data_inicial;
   qryAux1.ParamByName('data_final').asDateTime:=data_final;

   //qryTmpGestantes.DisableControls;
   try


     qryAux1.open;

     if (qryAux1.recordCount > 0) then
     begin
         while not qryAux1.eof do
         begin
            CNS := '0';
            CPF := '0';
            CNSA := '0';
            CPFA := '0';
            campo_busca := '';
            campo_ordem := '';
            busca_cns := false;
            busca_cpf := false;
            busca := false;
            CNS := trim(qryAux1.FieldByName('nu_cns').asString);
            CPF := trim(qryAux1.FieldByName('nu_cpf_cidadao').asString);

            if (length(trim(qryAux1.FieldByName('nu_cns').asString)) = 15) then
            begin
              busca_cns := true;
              CNS := trim(qryAux1.FieldByName('nu_cns').asString);
            end;

            if (length(trim(qryAux1.FieldByName('nu_cpf_cidadao').asString)) = 11) then
            begin
              busca_cpf := true;
              CPF := trim(qryAux1.FieldByName('nu_cpf_cidadao').asString);
            end;

            if ((busca_cns) and (busca_cpf)) then
            begin
              campo_busca := '(nu_cns = ''' + CNS + ''' OR nu_cpf = ''' +CPF+ ''')';
              campo_ordem := 'nu_cns, nu_cpf';
              busca := true;
            end
            else
            if (busca_cns) then
            begin
              campo_busca := 'nu_cns = '''+CNS+'''';
              campo_ordem := 'nu_cpf DESC';
              busca := true;
            end
            else
            if (busca_cpf) then
            begin
              campo_busca := 'nu_cpf = '''+CPF+'''';
              campo_ordem := 'nu_cns DESC';
              busca := true;
            end;

            if (busca) then
            begin
              nu_celular:=qryAux1.FieldByName('telefone_celular').asString;
              // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
              // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
              //   TB_CIDADAO
              // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
              // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

              qryAux2.close;
              qryAux2.Sql.clear;
              strSQL:='SELECT '+#13+#10+
                'st_ativo, '+#13+#10+
                'CASE WHEN nu_cns IS NULL THEN ''0'''+#13+#10+
                ' ELSE TRIM(FROM nu_cns) END nu_cns, '+#13+#10+
                'CASE WHEN nu_cpf IS NULL THEN ''0''' +#13+#10+
                ' ELSE TRIM(FROM nu_cpf) END nu_cpf, '+#13+#10+
                'no_cidadao, '+#13+#10+
                'dt_nascimento, '+#13+#10+
                'no_mae, '+#13+#10+
                'dt_obito, '+#13+#10+
                'st_faleceu, '+#13+#10+
                'nu_micro_area, '+#13+#10+
                'st_fora_area, '+#13+#10+
                'CASE WHEN nu_cns_responsavel IS NULL THEN ''0''' +#13+#10+
                ' ELSE TRIM(FROM nu_cns_responsavel) END nu_cns_responsavel, '+#13+#10+
                'CASE WHEN nu_cpf_responsavel IS NULL THEN ''0''' +#13+#10+
                ' ELSE TRIM(FROM nu_cpf_responsavel) END nu_cpf_responsavel, '+#13+#10+
                'no_sexo  '+#13+#10+
              'FROM '+#13+#10+
              '  tb_cidadao '+#13+#10+
              'WHERE '+#13+#10+
              '  st_ativo = 1 AND  '+#13+#10+
              campo_busca +' '+#13+#10+
              'ORDER BY '+ campo_ordem +' '+#13+#10+
              'LIMIT 1  ';

              cidadao_ativo := 1;
              cidadao_cpf := '0';
              cidadao_cns := '0';
              cidadao_nome := '# GESTANTE NÃO ENCONTRADA NO CADASTRO DE CIDADÃOS #';
              cidadao_mae := '** NOME DA MAE FALTANDO OU NÃO CADASTRADO **';
              cidadao_nascimento := qryAux1.FieldByName('dt_nascimento').asDateTime;
              cidadao_obito := '';
              cidadao_faleceu := 0;
              cidadao_cns_res := '0';
              cidadao_cpf_res := '0';
              cidadao_ma := '00';
              cidadao_sexo := 'FEMININO';

              qryAux2.sql.text:=strSQL;
              try
                qryAux2.open;
              except on ex4:Exception do
                begin
                  showMessage(strSql);
                  showMessage(ex4.message);
                end;
              end;
              //qryAux2.open;                   //abrindo a query auxiliar 2

              if (qryAux2.recordcount > 0) then
              begin
                cidadao_ativo := qryAux2.FieldByName('st_ativo').asInteger;
                cidadao_cpf   := trim(qryAux2.FieldByName('nu_cpf').asString);
                cidadao_cns   := trim(qryAux2.FieldByName('nu_cns').asString);
                cidadao_nome  := trim(qryAux2.FieldByName('no_cidadao').asString);
                if (length(trim(qryAux2.FieldByName('no_mae').asString)) > 0) then
                  cidadao_mae := trim(qryAux2.FieldByName('no_mae').asString);

                cidadao_nascimento := qryAux2.FieldByName('dt_nascimento').asDateTime;
                cidadao_obito      := qryAux2.FieldByName('dt_obito').asString;
                cidadao_faleceu    := qryAux2.FieldByName('st_faleceu').asInteger;
                cidadao_cns_res    := trim(qryAux2.FieldByName('nu_cns_responsavel').asString);
                cidadao_cpf_res    := trim(qryAux2.FieldByName('nu_cpf_responsavel').asString);
                cidadao_ma         := qryAux2.FieldByName('nu_micro_area').asString;

                if ((Length(cidadao_ma) = 0) or (cidadao_ma = '0') or (cidadao_ma = '')) then
                  cidadao_ma := '00';

                if (length(cidadao_ma) = 1 ) then
                  cidadao_ma := '0' + cidadao_ma;

                cidadao_sexo := qryAux2.FieldByName('no_sexo').asString;
                if not (busca_cns) then
                  if (length(cidadao_cns) = 15) then
                  begin
                    CNS := cidadao_cns;
                    busca_cns := true;
                  end;
                if not(busca_cpf) then
                  if (length(cidadao_cpf) = 11) then
                  begin
                    CPF := cidadao_cpf;
                    busca_cpf := true;
                  end;

              end;
                if ((busca_cns) and (busca_cpf)) then
                  campo_busca := '(nu_cns = ''' + CNS + ''' OR nu_cpf_cidadao = ''' + CPF + ''')'
                else

                  if (busca_cns) then
                    campo_busca := 'nu_cns = ''' + CNS + ''''
                  else
                    if (busca_cpf) then
                      campo_busca := 'nu_cpf_cidadao = ''' + CPF + '''';




                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                //   TB_FAT_CAD_INDIVIDUAL
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                strSQL := 'SELECT '+#13+#10+
                  'TRIM(FROM t3.nu_cns) as nu_cns, '+#13+#10+
                  'TRIM(FROM t3.nu_cpf_cidadao) as nu_cpf_cidadao, '+#13+#10+
                  't3.dt_obito, '+#13+#10+
                  't3.nu_micro_area, '+#13+#10+
                  't3.nu_cns_responsavel, '+#13+#10+
                  't3.nu_cpf_responsavel, '+#13+#10+
                  't3.st_ficha_inativa, '+#13+#10+
                  't3.nu_ine, '+#13+#10+
                  't3.no_equipe, '+#13+#10+
                  't3.co_seq_dim_unidade_saude, '+#13+#10+
                  't3.nu_cnes, '+#13+#10+
                  't3.no_unidade_saude, '+#13+#10+
                  't3.st_gestante, '+#13+#10+
                  't3.st_hipertensao_arterial, '+#13+#10+
                  't3.st_diabete, '+#13+#10+
                  't3.nu_uuid_ficha, '+#13+#10+
                  't3.nu_uuid_ficha_origem, '+#13+#10+
                  't3.nu_uuid_dado_transp, '+#13+#10+
                  't3.nu_celular, '+#13+#10+
                  'upper(tb_dim_sexo.ds_sexo) AS ds_sexo, '+#13+#10+
                  'int ''0'' as teste1,  '+#13+#10+
                  'text ''0'' as teste2 '+#13+#10+
                'FROM '+#13+#10+
                '( '+#13+#10+
                '	SELECT '+#13+#10+
                '		t2.*, '+#13+#10+
                '		tb_dim_unidade_saude.co_seq_dim_unidade_saude, '+#13+#10+
                '		tb_dim_unidade_saude.nu_cnes, '+#13+#10+
                '		tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
                '	FROM '+#13+#10+
                '	( '+#13+#10+
                '		SELECT '+#13+#10+
                '			t1.*, '+#13+#10+
                '			tb_dim_equipe.nu_ine, '+#13+#10+
                '			tb_dim_equipe.no_equipe '+#13+#10+
                '		FROM '+#13+#10+
                '		( '+#13+#10+
                '			SELECT '+#13+#10+
                '				CASE WHEN nu_cns IS NULL THEN ''0'''+#13+#10+
                '					ELSE nu_cns END '+#13+#10+
                '					nu_cns, '+#13+#10+
                '				CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'''+#13+#10+
                '					ELSE nu_cpf_cidadao END '+#13+#10+
                '					nu_cpf_cidadao, '+#13+#10+
                '				co_dim_unidade_saude, '+#13+#10+
                '				co_dim_equipe, '+#13+#10+
                '				co_dim_sexo, '+#13+#10+
                '				dt_obito, '+#13+#10+
                '				nu_uuid_ficha, '+#13+#10+
                '				nu_uuid_ficha_origem, '+#13+#10+
                '				nu_uuid_dado_transp, '+#13+#10+
                '       nu_celular, '+#13+#10+
                '				CASE WHEN nu_cns_responsavel IS NULL THEN ''0'''+#13+#10+
                '					ELSE TRIM(FROM nu_cns_responsavel) END '+#13+#10+
                '					nu_cns_responsavel, '+#13+#10+
                '				CASE WHEN nu_cpf_responsavel IS NULL THEN ''0'''+#13+#10+
                '					ELSE TRIM(FROM nu_cpf_responsavel) END '+#13+#10+
                '					nu_cpf_responsavel, '+#13+#10+
                '				CASE WHEN nu_micro_area IS NULL THEN ''00'''+#13+#10+
                '					ELSE nu_micro_area END '+#13+#10+
                '					nu_micro_area, '+#13+#10+
                '				st_ficha_inativa, '+#13+#10+
                '				CASE WHEN st_gestante IS NULL THEN ''0'''+#13+#10+
                '					ELSE st_gestante END '+#13+#10+
                '					st_gestante, '+#13+#10+
                '				CASE WHEN st_hipertensao_arterial IS NULL THEN ''0'''+#13+#10+
                '					ELSE st_hipertensao_arterial END '+#13+#10+
                '					st_hipertensao_arterial, '+#13+#10+
                '				CASE WHEN st_diabete IS NULL THEN ''0'''+#13+#10+
                '					ELSE st_diabete END '+#13+#10+
                '					st_diabete '+#13+#10+
                '			FROM '+#13+#10+
                '				tb_fat_cad_individual '+#13+#10+
                '			WHERE ' + campo_busca +  ''+#13+#10+
                '			ORDER BY co_dim_tempo DESC '+#13+#10+
                '			LIMIT 1 '+#13+#10+
                '		) AS t1 '+#13+#10+
                '		LEFT JOIN '+#13+#10+
                '			tb_dim_equipe '+#13+#10+
                '		ON tb_dim_equipe.co_seq_dim_equipe = t1.co_dim_equipe '+#13+#10+
                '	) AS t2 '+#13+#10+
                '	LEFT JOIN '+#13+#10+
                '		tb_dim_unidade_saude '+#13+#10+
                '	ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
                ') AS t3 '+#13+#10+
                'LEFT JOIN '+#13+#10+
                '	tb_dim_sexo '+#13+#10+
                'ON tb_dim_sexo.co_seq_dim_sexo = t3.co_dim_sexo ';

                cind_cpf := '0';
                cind_cns := '0';
                cind_gestante := 0;
                cind_hipertenso := 0;
                cind_diabetico := 0;
                cind_obito := '';
                cind_cns_res := '0';
                cind_cpf_res := '0';
                cind_micro_area := '00';
                cind_inativo := 0;
                cnes := '0000000';
                nome_unidade := 'SEM UNIDADE SAUDE';
                cod_unidade_saude:='00000000';
                ine := '0000000000';
                nome_equipe := 'SEM EQUIPE';
                nome_sexo := 'FEMININO';
                num_cind := 0;
                nu_uuid_ficha := '';
                nu_uuid_ficha_origem := '';
                nu_uuid_dado_transp := '';
                //nu_celular:='00000000000';

                qryAux3.close;
                qryAux3.sql.clear;
                qryAux3.sql.text:=strSQL;
                try
                  qryAux3.open;
                except on ex4:Exception do
                begin
                  showMessage(strSql);
                  showMessage(ex4.message);
                end;

                end;

                if (qryAux3.recordCount> 0)then
                begin
                  cind_cpf := trim(qryAux3.FieldByName('nu_cpf_cidadao').asString);
                  cind_cns := trim(qryAux3.FieldByName('nu_cns').asString);
                  cind_gestante := qryAux3.FieldByName('st_gestante').asInteger;
                  cind_hipertenso := qryAux3.FieldByName('st_hipertensao_arterial').asInteger;
                  cind_diabetico := qryAux3.FieldByName('st_diabete').asInteger;
                  nu_uuid_ficha := qryAux3.FieldByName('nu_uuid_ficha').asString;
                  nu_uuid_ficha_origem := qryAux3.FieldByName('nu_uuid_ficha_origem').asString;
                  nu_uuid_dado_transp := qryAux3.FieldByName('nu_uuid_dado_transp').asString;
                  cind_obito := qryAux3.FieldByName('dt_obito').asString;
                  cind_cns_res := qryAux3.FieldByName('nu_cns_responsavel').asString;
                  cind_cpf_res :=qryAux3.FieldByName('nu_cpf_responsavel').asString;
                  cind_micro_area := qryAux3.FieldByName('nu_micro_area').asString;

                  if ((length(cind_micro_area) = 0) or (cind_micro_area = '0') or (cind_micro_area = '')) then
                    cind_micro_area := '00';

                  if (length(cind_micro_area) = 1) then cind_micro_area := '0' + cind_micro_area;

                  if (cind_micro_area = '00') then 	cind_micro_area := cidadao_ma;

                  if ((cind_micro_area = 'FA') and (cidadao_ma <> '00')) then
                    cind_micro_area := cind_micro_area+' '+cidadao_ma;

                  cind_inativo := qryAux3.FieldByName('st_ficha_inativa').asInteger;
                  cnes := qryAux3.FieldByName('nu_cnes').asString;
                  cod_unidade_saude:=qryAux3.FieldByName('co_seq_dim_unidade_saude').asString;
                  nome_unidade := qryAux3.FieldByName('no_unidade_saude').asString;
                  ine := qryAux3.FieldByName('nu_ine').asString;
                  nome_equipe := qryAux3.FieldByName('no_equipe').asString;
                  nome_sexo := qryAux3.FieldByName('ds_sexo').asString;

                  if not (busca_cns) then
                    if (length(cind_cns) = 15) then
                    begin
                      CNS := trim(cind_cns);
                      busca_cns := true;
                    end;
                  if not(busca_cpf) then
                    if (length(cind_cpf) = 11) then
                    begin
                      CPF := cind_cpf;
                      busca_cpf := true;
                    end;
                end;  //fim recordcount qryAux3

                if (length(cind_cns_res) < 15) then cind_cns_res := cidadao_cns_res;

                if (length(cind_cpf_res) < 11) then cind_cpf_res := cidadao_cpf_res;

                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                //   Duplicados
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                if MotherList.Count>0 then
                begin
                  duplicado := false;
                  if (length(CNS) = 15) then
                    for i := 0 to MotherList.Count-1 do
                    begin
                      if (TMyObject(TList(MotherList.Items[i])).ValorCNS = CNS) then
                      begin
                        duplicado :=true;
                        if (length(CPF) = 11) then
                          if (length(TMyObject(TList(MotherList.Items[i])).ValorCPF)<>11) then
                           TMyObject(TList(MotherList.Items[i])).ValorCPF:=CPF;
                      end;
                    end;

                  if (length(CPF) = 11) then
                   for I := 0 to MotherList.Count-1 do
                   begin
                     if (TMyObject(TList(MotherList.Items[i])).ValorCPF = CPF) then
                      begin
                        duplicado :=true;
                        if (length(TMyObject(TList(MotherList.Items[i])).ValorCNS)<>15) then
                          if (length(TMyObject(TList(MotherList.Items[i])).ValorCns)<>15) then
                           TMyObject(TList(MotherList.Items[i])).ValorCns:=CNS;
                      end;
                   end
                  else
                   duplicado:=false;
                end;

                if not (duplicado) then
                begin
                 obj1.TipoDocCNS:='CNS';
                 obj1.ValorCNS:=CNS;
                 obj1.TipoDocCPF:='CPF';
                 obj1.ValorCPF:=CPF;
                 MotherList.add(obj1);
                end;

               if not (duplicado) then
               begin
                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  //   Completa CNS ou CPF
                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  strSQL := 'SELECT '+#13+#10+
                  '		nu_cns, '+#13+#10+
                  '		nu_cpf '+ #13+#10+
                  '	FROM '+#13+#10+
                  '		tb_cidadao '+#13+#10+
                  '	WHERE '+#13+#10+
                  '		no_cidadao = '+quotedStr(cidadao_nome)+' AND '+#13+#10+
                  '		dt_nascimento = '+quotedStr(formatDateTime('yyyy-mm-dd',cidadao_nascimento))+' AND '+#13+#10+
                  '		no_mae = '+quotedStr(cidadao_mae);

                  qryaux4.close;
                  qryaux4.sql.clear;
                  qryaux4.sql.text:=strSQL;
                  qryAux4.open;

                  if (qryAux4.recordcount > 0) then
                  begin
                    qryAux4.first;
                    while not qryAux4.eof do
                    begin
                      if (length(qryAux4.FieldByName('nu_cns').asString) = 15) then
                      begin
                        if (length(CNS) <> 15) then
                          CNS := trim(qryAux4.FieldByName('nu_cns').asString)
                        else
                          if (CNS <> qryAux4.FieldByName('nu_cns').asString) then
                           CNSA := trim(qryAux4.FieldByName('nu_cns').asString);
                      end;

                      if (length(qryAux4.FieldByName('nu_cpf').asString) = 11) then
                      begin
                        if (length(CPF) <> 11) then
                          CPF := trim(qryAux4.FieldByName('nu_cpf').asString)
                        else
                        if (CPF <> qryAux4.FieldByName('nu_cpf').asString) then
                          CPFA := trim(qryAux4.FieldByName('nu_cpf').asString);
                      end;

                      qryaux4.next;
                    end; // fim while qryaux4
                  end;  //  recordcount qryaux4

                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  //   Tratamento dos dados
                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                  calc_20s         := qryAux1.FieldByName('co_dim_tempo_dum').asDateTime + 140;
                  calc_ddp         := qryAux1.FieldByName('co_dim_tempo_dum').asDateTime + 280;
                  calc_fimpuerp    := qryAux1.FieldByName('co_dim_tempo_dum').asDateTime + 336;
                  calc_dlfg        := qryAux1.FieldByName('co_dim_tempo_dum').asDateTime + 294;
                  data_nascimento  := qryAux1.FieldByName('dt_nascimento').asDateTime;

                  data_falecimento := 'null';

                  if (Length(Trim(cidadao_obito)) > 5) then
                    data_falecimento := cidadao_obito
                   else
                    if (length(trim(cind_obito)) > 5) then
                      data_falecimento := cind_obito;


                  cidadao_nome := cidadao_nome;
                  cidadao_mae := cidadao_mae;
                  if ((cind_micro_area = '-') or (cind_micro_area = '--') or
                      (cind_micro_area = '0-')) then
                    cind_micro_area := '00';

                  if (ine = '-') then ine := '0000000000';

                  StrCMDSQL := ' INSERT INTO tmp_gestantes('+#13+#10+
                    'cns, '+#13+#10+
                    'cpf,'+#13+#10+
                    'cns_alternativo, '+#13+#10+
                    'cpf_alternativo, '+#13+#10+
                    'data_nascimento, '+#13+#10+
                    'g_co_dim_tempo_dum, '+#13+#10+
                    'g_co_dim_tempo, '+#13+#10+
                    'cidadao_ativo, '+#13+#10+
                    'data_falecimento, '+#13+#10+
                    'cidadao_nome, '+#13+#10+
                    'cidadao_mae, '+#13+#10+
                    'cidadao_faleceu, '+#13+#10+
                    'cidadao_sexo, '+#13+#10+
                    'cind_gestante, '+#13+#10+
                    'cind_hipertenso, '+#13+#10+
                    'cind_diabetico, '+#13+#10+
                    'cind_sexo, '+#13+#10+
                    'cind_micro_area, '+#13+#10+
                    'cns_resp, '+#13+#10+
                    'cpf_resp, '+#13+#10+
                    'cind_inativo, '+#13+#10+
                    'cnes, '+#13+#10+
                    'nome_unidade, '+#13+#10+
                    'ine, '+#13+#10+
                    'nome_equipe, '+#13+#10+
                    'calc_ddp, '+#13+#10+
                    'calc_20s, '+#13+#10+
                    'calc_fimpuerp, '+#13+#10+
                    'nu_uuid_ficha, '+#13+#10+
                    'nu_uuid_ficha_origem, '+#13+#10+
                    'nu_uuid_dado_transp, '+#13+#10+
                    'telefone, '+#13+#10+
                    'CIND_GESTANTE_I1_DTLIMITE_FIM,'+#13+#10+
                    'CO_SEQ_DIM_UNIDADE_SAUDE,'+#13+#10+
                    'NRPROC_HIV_AVALIADO,'+#13+#10+
                    'NRPROC_HIV_SOLICITADO,'+#13+#10+
                    'NRPROC_SIFILIS_AVALIADO,'+#13+#10+
                    'NRPROC_SIFILIS_SOLICITADO'+#13+#10+
                    ') VALUES ('+#13+#10+
                    quotedStr(CNS)+','+#13+#10+
                    quotedStr(CPF)+','+#13+#10+
                    quotedStr(CNSA)+','+#13+#10+
                    quotedStr(CPFA)+','+#13+#10+
                    quotedStr(formatDateTime('yyyy-mm-dd',data_nascimento))+','+#13+#10+
                    quotedStr(formatDateTime('yyyy-mm-dd',qryAux1.FieldByName('co_dim_tempo_dum').asDateTime))+','+#13+#10+
                    quotedStr(formatDateTime('yyyy-mm-dd',qryAux1.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
                    cidadao_ativo.toString+','+#13+#10;

                    if (data_falecimento<>'null') then
                      strCMDSQL:=strCMDSQL + quotedStr(formatDateTime('yyyy-mm-dd',StrToDateTime(data_falecimento)))+','+#13+#10
                    else
                      strCMDSQL:=strCMDSQL + data_falecimento + ','#13+#10;

                    strCMDSQL:=strCMDSQL +
                    quotedStr(cidadao_nome)+','+#13+#10+
                    quotedStr(cidadao_mae)+','+#13+#10+
                    IntToStr(cidadao_faleceu)+','+#13+#10+
                    quotedStr(cidadao_sexo)+','+#13+#10+
                    IntToStr(cind_gestante)+','+#13+#10+
                    IntToStr(cind_hipertenso)+','+#13+#10+
                    IntToStr(cind_diabetico)+','+#13+#10+
                    quotedStr(nome_sexo)+','+#13+#10+
                    quotedStr(cind_micro_area)+','+#13+#10+
                    quotedStr(cind_cns_res)+','+#13+#10+
                    quotedStr(cind_cpf_res)+','+#13+#10+
                    InttoStr(cind_inativo)+','+#13+#10+
                    quotedStr(cnes)+','+#13+#10+
                    quotedStr(nome_unidade)+','+#13+#10+
                    quotedStr(ine)+','+#13+#10+
                    quotedStr(nome_equipe)+','+#13+#10+
                    quotedStr(formatDateTime('yyyy-mm-dd',calc_ddp))+','+#13+#10+
                    quotedStr(formatDateTime('yyyy-mm-dd',calc_20s))+','+#13+#10+
                    quotedStr(formatDateTime('yyyy-mm-dd',calc_fimpuerp))+','+#13+#10+
                    quotedStr(nu_uuid_ficha)+','+#13+#10+
                    quotedStr(nu_uuid_ficha_origem)+','+#13+#10+
                    quotedStr(nu_uuid_dado_transp)+','+#13+#10+
                    quotedStr(nu_celular)+','+#13+#10+
                    quotedStr(formatDateTime('yyyy-mm-dd',calc_dlfg))+','+#13+#10+
                    cod_unidade_saude+','+#13+#10+
                    quotedStr('0')+','+#13+#10+
                    quotedStr('0')+','+#13+#10+
                    quotedStr('0')+','+#13+#10+
                    quotedStr('0')+')';

                    qryTmp.close;
                    qryTmp.sql.Clear;
                    qryTmp.sql.text:=StrCMDSQL;

                    try
                      qryTmp.ExecSql;
                    except on ex2:exception do
                     showmessage(ex2.message);
                    end;

               end;

              //end;  //fim recordcount qryAux2

           END;

            qryAux1.next;  //proximo registro




         end; //fim while


       ///////////////////////////////////////////////////////////////////
       ///  Segunda Parte                                             ///
       //////////////////////////////////////////////////////////////////
        qrytmpGestantes.close;
        qrytmpGestantes.open;
        qryTmpGestantes.first;

        while not (qryTmpGestantes.eof) do
        begin
          rCNS := trim(qryTmpGestantes.FieldByName('cns').asString);
          rCPF := trim(qryTmpGestantes.FieldByName('cpf').asString);
          rCNSA := trim(qryTmpGestantes.FieldByName('cns_alternativo').asString);
          rCPFA := trim(qryTmpGestantes.FieldByName('cpf_alternativo').asString);

          if MotherList.Count>0 then
          begin
            duplicado := false;
            if (length(rCNS) <> 15) then
            begin
              for i := 0 to MotherList.Count-1 do
              begin
                if (TMyObject(TList(MotherList.Items[i])).ValorCPF = CPF) then
                    if (length(TMyObject(TList(MotherList.Items[i])).ValorCPF)<>11) then
                     TMyObject(TList(MotherList.Items[i])).ValorCPF:=CPF;
              end;
            end;

            if (length(CPF) <> 11) then
             for I := 0 to MotherList.Count-1 do
             begin
               if   (TMyObject(TList(MotherList.Items[i])).ValorCNS = CNS) then
                begin
                   if (length(TMyObject(TList(MotherList.Items[i])).ValorCNS)<>15) then
                    if (length(TMyObject(TList(MotherList.Items[i])).ValorCNS)<>15) then
                     TMyObject(TList(MotherList.Items[i])).ValorCNS:=CNS;
                end;
             end;
           end;

          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          //   Arruma campo BUSCA
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          {
          campo_busca := 'nu_cns = ''000000000000000''';
          campo_busca_res := 'nu_cns_responsavel = ''000000000000000''';
          if ((length(rCNS) = 15) and (length(rCPF) = 11)) then
          begin
            campo_busca_res := '(nu_cns_responsavel = '''+rCNS+''' OR nu_cpf_responsavel = '''+rCPF+''')';
            campo_busca := '(nu_cns = '''+rCNS+''' OR nu_cpf_cidadao = '''+rCPF+'''';
            if (length(rCNSA) = 15) then
              campo_busca := campo_busca + ' OR nu_cns = '''+rCNSA+'''';

            if (length(rCPFA) = 11) then
              campo_busca := campo_busca + ' OR nu_cpf = '''+rCPFA+'''';

            campo_busca := campo_busca + ')';
          end
          else if (length(rCNS) = 15) then
          begin
              campo_busca := 'nu_cns = '''+rCNS+'''';
              campo_busca_res := 'nu_cns_responsavel = '''+rCNS+'''';
              if (length(rCNSA) = 15) then
                campo_busca := '(nu_cns = '''+rCNS+''' OR nu_cns = '''+rCNSA+''')';
          end;
          if (length(rCPF) = 11) then
          begin
            campo_busca := 'nu_cpf_cidadao = '''+rCPF+'''';
            campo_busca_res := 'nu_cpf_responsavel = '''+rCPF+'''';
            if (length(rCPFA) = 11) then
              campo_busca := '(nu_cpf_cidadao = '''+rCPF+''' OR nu_cpf_cidadao = '''+rCPFA+''')';

          end;
          }
          campo_busca := '(nu_cns = '''+rCNS+''' OR nu_cpf_cidadao = '''+rCPF+''')';

          strSQL:='SELECT * FROM '+#13+#10+
          '( '+
          '	------------------------------------------------------- '+#13+#10+
          '	SELECT '+#13+#10+
          '   TO_CHAR(TO_DATE(t5.co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
          '   TO_CHAR(TO_DATE(t5.co_dim_tempo_dum::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo_dum, '+#13+#10+
          '		t5.nu_ine, '+#13+#10+
          '		t5.no_equipe, '+#13+#10+
          '		t5.nu_cnes, '+#13+#10+
          '   t5.co_dim_unidade_saude, '+#13+#10+
          '		t5.no_unidade_saude, '+#13+#10+
          '		t5.ds_filtro_ciaps, '+#13+#10+
          '		t5.ds_filtro_cids, '+#13+#10+
          '		t5.nu_cbo, '+#13+#10+
          '		t5.no_cbo, '+#13+#10+
          '		t5.nu_uuid_ficha, '+#13+#10+
          '		t5.nu_uuid_dado_transp, '+#13+#10+
          '		tb_dim_profissional.nu_cns AS cns_prof, '+#13+#10+
          '		tb_dim_profissional.no_profissional '+#13+#10+
          '	FROM '+#13+#10+
          '	( '+#13+#10+
          '		SELECT '+#13+#10+
          '			t3.*, '+#13+#10+
          '			tb_dim_cbo.nu_cbo, '+#13+#10+
          '			tb_dim_cbo.no_cbo '+#13+#10+
          '		FROM '+#13+#10+
          '		( '+#13+#10+
          '			SELECT '+#13+#10+
          '				t2.*, '+#13+#10+
          '				tb_dim_unidade_saude.nu_cnes, '+#13+#10+
          '				tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
          '			FROM '+#13+#10+
          '			( '+#13+#10+
          '				SELECT '+#13+#10+
          '					t1.*, '+#13+#10+
          '					tb_dim_equipe.nu_ine, '+#13+#10+
          '					tb_dim_equipe.no_equipe '+#13+#10+
          '				FROM '+#13+#10+
          '				( '+#13+#10+
          '					SELECT '+#13+#10+
          '						co_dim_tempo, '+#13+#10+
          '						co_dim_tempo_dum, '+#13+#10+
          '						CASE WHEN co_dim_cbo_1 = 1 THEN co_dim_cbo_2 '+#13+#10+
          '							ELSE co_dim_cbo_1 END '+#13+#10+
          '							co_dim_cbo, '+#13+#10+
          '						CASE WHEN co_dim_unidade_saude_1 = 1 THEN co_dim_unidade_saude_2 '+#13+#10+
          '							ELSE co_dim_unidade_saude_1 END '+#13+#10+
          '							co_dim_unidade_saude, '+#13+#10+
          '						CASE WHEN co_dim_equipe_1 = 1 THEN co_dim_equipe_2 '+#13+#10+
          '							ELSE co_dim_equipe_1 END '+#13+#10+
          '							co_dim_equipe, '+#13+#10+
          '						CASE WHEN co_dim_profissional_1 = 1 THEN co_dim_profissional_2 '+#13+#10+
          '							ELSE co_dim_profissional_1 END '+#13+#10+
          '							co_dim_profissional, '+#13+#10+
          '						ds_filtro_ciaps, '+#13+#10+
          '						ds_filtro_cids, '+#13+#10+
          '						nu_uuid_ficha, '+#13+#10+
          '						nu_uuid_dado_transp '+#13+#10+
          '					FROM '+#13+#10+
          '						tb_fat_atendimento_individual '+#13+#10+
          '					WHERE '+#13+#10+
          '						' + campo_busca + ' AND '+#13+#10+
          '           (TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(qryTmpGestantes.fieldByName('g_co_dim_tempo_dum').asDateTime))+' AND '+#13+#10+
          '            TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date < '+quotedStr(dateToStr(qryTmpGestantes.fieldByName('CALC_FIMPUERP').asDateTime))+') '+#13+#10+
          '						AND ( '+#13+#10+
          '							ds_filtro_ciaps LIKE ANY ( '+#13+#10+
          '								array[ '+#13+#10+
          '									''%|W03|%'', '+#13+#10+
          '									''%|W05|%'', '+#13+#10+
          '									''%|W29|%'', '+#13+#10+
          '									''%|W71|%'', '+#13+#10+
          '									''%|W78|%'', '+#13+#10+
          '									''%|W79|%'', '+#13+#10+
          '									''%|W80|%'', '+#13+#10+
          '									''%|W81|%'', '+#13+#10+
          '									''%|W84|%'', '+#13+#10+
          '									''%|W85|%'', '+#13+#10+
          '									--''%|W72|%'', '+#13+#10+
          '									--''%|W73|%'', '+#13+#10+
          '									--''%|W75|%'', '+#13+#10+
          '									--''%|W76|%'', '+#13+#10+
          '									''%|ABP001|%'' '+#13+#10+
          '								] '+#13+#10+
          '							) OR '+#13+#10+
          '							ds_filtro_cids LIKE ANY ( '+#13+#10+
          '								array[ '+#13+#10+
          '									''%|O11|%'', '+#13+#10+
          '									''%|O120|%'', '+#13+#10+
          '									''%|O121|%'', '+#13+#10+
          '									''%|O122|%'', '+#13+#10+
          '									''%|O13|%'',  '+#13+#10+
          '									''%|O140|%'', '+#13+#10+
          '									''%|O141|%'', '+#13+#10+
          '									''%|O149|%'', '+#13+#10+
          '									''%|O150|%'', '+#13+#10+
          '									''%|O151|%'', '+#13+#10+
          '									''%|O159|%'', '+#13+#10+
          '									''%|O16|%'',  '+#13+#10+
          '									''%|O200|%'', '+#13+#10+
          '									''%|O208|%'', '+#13+#10+
          '									''%|O209|%'', '+#13+#10+
          '									''%|O210|%'', '+#13+#10+
          '									''%|O211|%'', '+#13+#10+
          '									''%|O212|%'', '+#13+#10+
          '									''%|O218|%'', '+#13+#10+
          '									''%|O219|%'', '+#13+#10+
          '									''%|O220|%'', '+#13+#10+
          '									''%|O221|%'', '+#13+#10+
          '									''%|O222|%'', '+#13+#10+
          '									''%|O223|%'', '+#13+#10+
          '									''%|O224|%'', '+#13+#10+
          '									''%|O225|%'', '+#13+#10+
          '									''%|O228|%'', '+#13+#10+
          '									''%|O229|%'', '+#13+#10+
          '									''%|O230|%'', '+#13+#10+
          '									''%|O231|%'', '+#13+#10+
          '									''%|O232|%'', '+#13+#10+
          '									''%|O233|%'', '+#13+#10+
          '									''%|O234|%'', '+#13+#10+
          '									''%|O235|%'', '+#13+#10+
          '									''%|O239|%'', '+#13+#10+
          '									''%|O299|%'', '+#13+#10+
          '									''%|O300|%'', '+#13+#10+
          '									''%|O301|%'', '+#13+#10+
          '									''%|O302|%'', '+#13+#10+
          '									''%|O308|%'', '+#13+#10+
          '									''%|O309|%'', '+#13+#10+
          '									''%|O311|%'', '+#13+#10+
          '									''%|O312|%'', '+#13+#10+
          '									''%|O318|%'', '+#13+#10+
          '									''%|O320|%'', '+#13+#10+
          '									''%|O321|%'', '+#13+#10+
          '									''%|O322|%'', '+#13+#10+
          '									''%|O323|%'', '+#13+#10+
          '									''%|O324|%'', '+#13+#10+
          '									''%|O325|%'', '+#13+#10+
          '									''%|O326|%'', '+#13+#10+
          '									''%|O328|%'', '+#13+#10+
          '									''%|O329|%'', '+#13+#10+
          '									''%|O330|%'', '+#13+#10+
          '									''%|O331|%'', '+#13+#10+
          '									''%|O332|%'', '+#13+#10+
          '									''%|O333|%'', '+#13+#10+
          '									''%|O334|%'', '+#13+#10+
          '									''%|O335|%'', '+#13+#10+
          '									''%|O336|%'', '+#13+#10+
          '									''%|O337|%'', '+#13+#10+
          '									''%|O338|%'', '+#13+#10+
          '									''%|O752|%'', '+#13+#10+
          '									''%|O753|%'', '+#13+#10+
          '									''%|O990|%'', '+#13+#10+
          '									''%|O991|%'', '+#13+#10+
          '									''%|O992|%'', '+#13+#10+
          '									''%|O993|%'', '+#13+#10+
          '									''%|O994|%'', '+#13+#10+
          '									''%|O240|%'', '+#13+#10+
          '									''%|O241|%'', '+#13+#10+
          '									''%|O242|%'', '+#13+#10+
          '									''%|O243|%'', '+#13+#10+
          '									''%|O244|%'', '+#13+#10+
          '									''%|O249|%'', '+#13+#10+
          '									''%|O25|%'',  '+#13+#10+
          '									''%|O260|%'', '+#13+#10+
          '									''%|O261|%'', '+#13+#10+
          '									''%|O263|%'', '+#13+#10+
          '									''%|O264|%'', '+#13+#10+
          '									''%|O265|%'', '+#13+#10+
          '									''%|O268|%'', '+#13+#10+
          '									''%|O269|%'', '+#13+#10+
          '									''%|O280|%'', '+#13+#10+
          '									''%|O281|%'', '+#13+#10+
          '									''%|O282|%'', '+#13+#10+
          '									''%|O283|%'', '+#13+#10+
          '									''%|O284|%'', '+#13+#10+
          '									''%|O285|%'', '+#13+#10+
          '									''%|O288|%'', '+#13+#10+
          '									''%|O289|%'', '+#13+#10+
          '									''%|O290|%'', '+#13+#10+
          '									''%|O291|%'', '+#13+#10+
          '									''%|O292|%'', '+#13+#10+
          '									''%|O293|%'', '+#13+#10+
          '									''%|O294|%'', '+#13+#10+
          '									''%|O295|%'', '+#13+#10+
          '									''%|O296|%'', '+#13+#10+
          '									''%|O298|%'', '+#13+#10+
          '									''%|O009|%'', '+#13+#10+
          '									''%|O339|%'', '+#13+#10+
          '									''%|O340|%'', '+#13+#10+
          '									''%|O341|%'', '+#13+#10+
          '									''%|O342|%'', '+#13+#10+
          '									''%|O343|%'', '+#13+#10+
          '									''%|O344|%'', '+#13+#10+
          '									''%|O345|%'', '+#13+#10+
          '									''%|O346|%'', '+#13+#10+
          '									''%|O347|%'', '+#13+#10+
          '									''%|O348|%'', '+#13+#10+
          '									''%|O349|%'', '+#13+#10+
          '									''%|O350|%'', '+#13+#10+
          '									''%|O351|%'', '+#13+#10+
          '									''%|O352|%'', '+#13+#10+
          '									''%|O353|%'', '+#13+#10+
          '									''%|O354|%'', '+#13+#10+
          '									''%|O355|%'', '+#13+#10+
          '									''%|O356|%'', '+#13+#10+
          '									''%|O357|%'', '+#13+#10+
          '									''%|O358|%'', '+#13+#10+
          '									''%|O359|%'', '+#13+#10+
          '									''%|O360|%'', '+#13+#10+
          '									''%|O361|%'', '+#13+#10+
          '									''%|O362|%'', '+#13+#10+
          '									''%|O363|%'', '+#13+#10+
          '									''%|O365|%'', '+#13+#10+
          '									''%|O366|%'', '+#13+#10+
          '									''%|O367|%'', '+#13+#10+
          '									''%|O368|%'', '+#13+#10+
          '									''%|O369|%'', '+#13+#10+
          '									''%|O40|%'',  '+#13+#10+
          '									''%|O410|%'', '+#13+#10+
          '									''%|O411|%'', '+#13+#10+
          '									''%|O418|%'', '+#13+#10+
          '									''%|O419|%'', '+#13+#10+
          '									''%|O430|%'', '+#13+#10+
          '									''%|O431|%'', '+#13+#10+
          '									''%|O438|%'', '+#13+#10+
          '									''%|O439|%'', '+#13+#10+
          '									''%|O440|%'', '+#13+#10+
          '									''%|O441|%'', '+#13+#10+
          '									''%|O460|%'', '+#13+#10+
          '									''%|O468|%'', '+#13+#10+
          '									''%|O469|%'', '+#13+#10+
          '									''%|O470|%'', '+#13+#10+
          '									''%|O471|%'', '+#13+#10+
          '									''%|O479|%'', '+#13+#10+
          '									''%|O48|%'',  '+#13+#10+
          '									''%|O995|%'', '+#13+#10+
          '									''%|O996|%'', '+#13+#10+
          '									''%|O997|%'', '+#13+#10+
          '									''%|Z640|%'', '+#13+#10+
          '									''%|O00|%'',  '+#13+#10+
          '									''%|O10|%'',  '+#13+#10+
          '									''%|O12|%'',  '+#13+#10+
          '									''%|O14|%'',  '+#13+#10+
          '									''%|O15|%'',  '+#13+#10+
          '									''%|O20|%'',  '+#13+#10+
          '									''%|O21|%'',  '+#13+#10+
          '									''%|O22|%'',  '+#13+#10+
          '									''%|O23|%'',  '+#13+#10+
          '									''%|O24|%'',  '+#13+#10+
          '									''%|O26|%'',  '+#13+#10+
          '									''%|O28|%'',  '+#13+#10+
          '									''%|O29|%'',  '+#13+#10+
          '									''%|O30|%'',  '+#13+#10+
          '									''%|O31|%'',  '+#13+#10+
          '									''%|O32|%'',  '+#13+#10+
          '									''%|O33|%'',  '+#13+#10+
          '									''%|O34|%'',  '+#13+#10+
          '									''%|O35|%'',  '+#13+#10+
          '									''%|O36|%'',  '+#13+#10+
          '									''%|O41|%'',  '+#13+#10+
          '									''%|O43|%'',  '+#13+#10+
          '									''%|O44|%'',  '+#13+#10+
          '									''%|O46|%'',  '+#13+#10+
          '									''%|O47|%'',  '+#13+#10+
          '									''%|O98|%'',  '+#13+#10+
          '									''%|Z34|%'',  '+#13+#10+
          '									''%|Z35|%'',  '+#13+#10+
          '									''%|Z36|%'',  '+#13+#10+
          '									''%|Z321|%'', '+#13+#10+
          '									''%|Z33|%'',  '+#13+#10+
          '									''%|Z340|%'', '+#13+#10+
          '									''%|Z340|%'', '+#13+#10+
          '									''%|Z348|%'', '+#13+#10+
          '									''%|Z349|%'', '+#13+#10+
          '									''%|Z350|%'', '+#13+#10+
          '									''%|Z351|%'', '+#13+#10+
          '									''%|Z352|%'', '+#13+#10+
          '									''%|Z353|%'', '+#13+#10+
          '									''%|Z354|%'', '+#13+#10+
          '									''%|Z357|%'', '+#13+#10+
          '									''%|Z358|%'', '+#13+#10+
          '									--''%|Z356|%'', '+#13+#10+
          '									''%|Z359|%'' '+#13+#10+
          '								] '+#13+#10+
          '							) '+#13+#10+
          '						) '+#13+#10+
          '				) AS t1 '+#13+#10+
          '				LEFT JOIN '+#13+#10+
          '					tb_dim_equipe '+#13+#10+
          '				ON tb_dim_equipe.co_seq_dim_equipe = t1.co_dim_equipe '+#13+#10+
          '			) AS t2 '+#13+#10+
          '			LEFT JOIN '+#13+#10+
          '				tb_dim_unidade_saude '+#13+#10+
          '			ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
          '		) AS t3 '+#13+#10+
          '		LEFT JOIN '+#13+#10+
          '			tb_dim_cbo '+#13+#10+
          '		ON tb_dim_cbo.co_seq_dim_cbo = t3.co_dim_cbo '+#13+#10+
          '	) AS t5 '+#13+#10+
          '	LEFT JOIN '+#13+#10+
          '		tb_dim_profissional '+#13+#10+
          '	ON tb_dim_profissional.co_seq_dim_profissional = t5.co_dim_profissional '+#13+#10+
          '	------------------------------------------------------- '+#13+#10+
          ') AS t4 '+#13+#10+
          'WHERE '+#13+#10+
          '	nu_cbo LIKE ANY (array[''2251%'',''2252%'',''2253%'',''2231%'',''2235%'']) '+#13+#10+
          'ORDER BY co_dim_tempo';

          I1_r1:=0;
          I1_r2:=0;
          dt_primeira_consulta:=strToDate('31/12/1899');

          //-----------------------
          qryAux5.close;
          qryAux5.sql.clear;
          qryAux5.sql.text:=strSQL;

          try
            qryAux5.open;
          except on ex4:Exception do
            begin
              showMessage(strSql);
              showMessage(ex4.message);
            end;
          end;

          // Numero de Consultas igual ao Número de REgistros Encontrados
          nrConsultas:=qryAux5.RecordCount;

          if nrConsultas >= 6 then // indicador 1 - Regra 1 - Nr de Consultas >=6
            I1_r1:=1;

          while not (qryAux5.eof) do
          begin
            if (dt_primeira_consulta = StrToDate('31/12/1899')) then
            begin
              dt_primeira_consulta := qryAux5.FieldByName('co_dim_tempo').asDateTime;
              // Indicador 1 - Regra 2 - Data da Primeira Consulta Até a 20a. Semana de Gestação
              if (dt_primeira_consulta <= qryTmpGestantes.fieldbyName('calc_20s').asDateTime) then
                I1_r2 := 1;
            end;
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          //   Prepara o inserir
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

          StrCMDSQL := ' INSERT INTO tmp_detalhes_gestantes('+#13+#10+
            'cns, '+#13+#10+
            'cpf,'+#13+#10+
            'co_dim_tempo, '+#13+#10+
            'no_cnes, '+#13+#10+
            'no_unidade_saude, '+#13+#10+
            'nu_ine, '+#13+#10+
            'ciaps, '+#13+#10+
            'cids, '+#13+#10+
            'cns_profissional, '+#13+#10+
            'no_profissional, '+#13+#10+
            'nu_cbo, '+#13+#10+
            'no_cbo, '+#13+#10+
            'no_equipe, '+#13+#10+
            'cod_unidade_saude, '+#13+#10+
            'tipo, '+#13+#10+
            'sequencia '+#13+#10+
            ') VALUES ('+#13+#10+
            quotedStr(qryTmpGestantes.FieldByName('CNS').asString)+','+#13+#10+
            quotedStr(qryTmpGestantes.FieldByName('CPF').asString)+','+#13+#10+
            quotedStr(formatDateTime('yyyy-mm-dd',qryAux5.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
            quotedStr(qryAux5.FieldByName('nu_cnes').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('no_unidade_saude').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('nu_ine').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('ds_filtro_ciaps').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('ds_filtro_cids').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('cns_prof').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('no_profissional').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('nu_cbo').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('no_cbo').asString)+','+#13+#10+
            quotedStr(qryAux5.FieldByName('no_equipe').asString)+','+#13+#10+
            qryAux5.FieldByName('co_dim_unidade_saude').asString+','+#13+#10+
            quotedStr('I1')+','+#13+#10+
            qryTmpGestantes.FieldByName('sequencia').asString+')';

            qryTmp.close;
            qryTmp.Sql.Clear;
            qryTmp.sql.text:=StrCMDSQL;

            try
              qryTmp.ExecSql;
            except on ex2:exception do
             showmessage(ex2.message);
            end;

            qryAux5.Next;
          end;

          if (nrConsultas > 0 ) then
          begin
            qryTmpGestantes.edit;
            qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_REGRA1').asInteger:=I1_r1;
            qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_REGRA2').asInteger:=I1_r2;
            qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_NRCONSULTAS').asInteger:=nrConsultas;
            qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_DT_1A_CONSULTA').asDateTime:=dt_primeira_consulta;
            qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_ULT_CONSULTA').asDateTime:=qryAux5.FieldByName('co_dim_tempo').asDateTime;
            qryTmpGestantes.post;
          end;

          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          //   INTERRUPCOES
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
           strSQL := 'SELECT	* FROM '+#13+#10+
           '	( '+#13+#10+
           '		SELECT '+#13+#10+
           '      TO_CHAR(TO_DATE(t3.co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
           '      TO_CHAR(TO_DATE(t3.co_dim_tempo_dum::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo_dum, '+#13+#10+
           '			t3.nu_ine, '+#13+#10+
           '			t3.no_equipe, '+#13+#10+
           '			t3.nu_cnes, '+#13+#10+
           '			t3.no_unidade_saude, '+#13+#10+
           '			t3.ds_filtro_cids, '+#13+#10+
           '			t3.ds_filtro_ciaps, '+#13+#10+
           '			tb_dim_cbo.nu_cbo, '+#13+#10+
           '			tb_dim_cbo.no_cbo '+#13+#10+
           '		FROM '+#13+#10+
           '		( '+#13+#10+
           '			SELECT '+#13+#10+
           '				t2.*, '+#13+#10+
           '				tb_dim_unidade_saude.nu_cnes, '+#13+#10+
           '				tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
           '			FROM '+#13+#10+
           '			( '+#13+#10+
           '				SELECT '+#13+#10+
           '					t1.*, '+#13+#10+
           '					tb_dim_equipe.nu_ine, '+#13+#10+
           '					tb_dim_equipe.no_equipe '+#13+#10+
           '				FROM '+#13+#10+
           '				( '+#13+#10+
           '					SELECT '+#13+#10+
           '						co_dim_tempo, '+#13+#10+
           '						co_dim_tempo_dum, '+#13+#10+
           '						CASE WHEN co_dim_cbo_1 = 1 THEN co_dim_cbo_2 '+#13+#10+
           '							ELSE co_dim_cbo_1 END '+#13+#10+
           '							co_dim_cbo, '+#13+#10+
           '						CASE WHEN co_dim_unidade_saude_1 = 1 THEN co_dim_unidade_saude_2 '+#13+#10+
           '							ELSE co_dim_unidade_saude_1 END '+#13+#10+
           '							co_dim_unidade_saude, '+#13+#10+
           '						CASE WHEN co_dim_equipe_1 = 1 THEN co_dim_equipe_2 '+#13+#10+
           '							ELSE co_dim_equipe_1 END '+#13+#10+
           '							co_dim_equipe, '+#13+#10+
           '						ds_filtro_cids, '+#13+#10+
           '						ds_filtro_ciaps '+#13+#10+
           '					FROM '+#13+#10+
           '						tb_fat_atendimento_individual '+#13+#10+
           '					WHERE '+#13+#10+
           '						' + campo_busca + ' AND '+#13+#10+
           '            (TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(qryTmpGestantes.fieldByName('g_co_dim_tempo_dum').asDateTime))+' AND '+#13+#10+
           '            TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date < '+quotedStr(dateToStr(qryTmpGestantes.fieldByName('CALC_FIMPUERP').asDateTime))+') '+#13+#10+
           '						AND ( '+#13+#10+
           '							ds_filtro_ciaps LIKE ANY ( '+#13+#10+
           '								array[ '+#13+#10+
           '									''%|W82|%'', '+#13+#10+
           '									''%|W83|%'', '+#13+#10+
           '									''%|W91|%'', '+#13+#10+
           '									''%|W92|%'', '+#13+#10+
           '									''%|W93|%'', '+#13+#10+
           '									''%|W90|%'' '+#13+#10+
           '								] '+#13+#10+
           '							) OR '+#13+#10+
           '							ds_filtro_cids LIKE ANY ( '+#13+#10+
           '								array[ '+#13+#10+
           '									''%|Z371|%'', '+#13+#10+
           '									''%|Z373|%'', '+#13+#10+
           '									''%|Z374|%'', '+#13+#10+
           '									''%|Z376|%'', '+#13+#10+
           '									''%|Z377|%'', '+#13+#10+
           '									''%|O04|%'', '+#13+#10+
           '									''%|Z303|%'', '+#13+#10+
           '									''%|O02|%'', '+#13+#10+
           '									''%|O03|%'', '+#13+#10+
           '									''%|O05|%'', '+#13+#10+
           '									''%|O06|%'', '+#13+#10+
           '									''%|O42|%'', '+#13+#10+
           '									''%|O45|%'', '+#13+#10+
           '									''%|O60|%'', '+#13+#10+
           '									''%|O61|%'', '+#13+#10+
           '									''%|O62|%'', '+#13+#10+
           '									''%|O63|%'', '+#13+#10+
           '									''%|O64|%'', '+#13+#10+
           '									''%|O65|%'', '+#13+#10+
           '									''%|O66|%'', '+#13+#10+
           '									''%|O67|%'', '+#13+#10+
           '									''%|O68|%'', '+#13+#10+
           '									''%|O69|%'', '+#13+#10+
           '									''%|O70|%'', '+#13+#10+
           '									''%|O71|%'', '+#13+#10+
           '									''%|O73|%'', '+#13+#10+
           '									''%|O750|%'', '+#13+#10+
           '									''%|O751|%'', '+#13+#10+
           '									''%|O754|%'', '+#13+#10+
           '									''%|O755|%'', '+#13+#10+
           '									''%|O756|%'', '+#13+#10+
           '									''%|O757|%'', '+#13+#10+
           '									''%|O758|%'', '+#13+#10+
           '									''%|O759|%'', '+#13+#10+
           '									''%|O81|%'', '+#13+#10+
           '									''%|O82|%'', '+#13+#10+
           '									''%|O83|%'', '+#13+#10+
           '									''%|O84|%'', '+#13+#10+
           '									''%|Z372|%'', '+#13+#10+
           '									''%|Z375|%'', '+#13+#10+
           '									''%|Z379|%'', '+#13+#10+
           '									''%|Z38|%'', '+#13+#10+
           '									''%|Z39|%'', '+#13+#10+
           '									''%|O80|%'', '+#13+#10+
           '									''%|Z370|%'' '+#13+#10+
           '								] '+#13+#10+
           '							) '+#13+#10+
           '						) '+#13+#10+
           '					ORDER BY co_dim_tempo DESC '+#13+#10+
           '					LIMIT 1 '+#13+#10+
           '				) AS t1 '+#13+#10+
           '				LEFT JOIN '+#13+#10+
           '					tb_dim_equipe '+#13+#10+
           '				ON tb_dim_equipe.co_seq_dim_equipe = t1.co_dim_equipe '+#13+#10+
           '			) AS t2 '+#13+#10+
           '			LEFT JOIN '+#13+#10+
           '				tb_dim_unidade_saude '+#13+#10+
           '			ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
           '		) AS t3 '+#13+#10+
           '		LEFT JOIN '+#13+#10+
           '			tb_dim_cbo '+#13+#10+
           '		ON tb_dim_cbo.co_seq_dim_cbo = t3.co_dim_cbo '+#13+#10+
           '	) AS t4 '+#13+#10+
           '	WHERE '+#13+#10+
           '		nu_cbo LIKE ANY (array[''2251%'',''2252%'',''2253%'',''2231%'',''2235%''])';

           gestacao_finalizada:=0;
           dsc_fim_gestacao:='';
           ciap_final_gestacao:='';
           cid_final_gestacao:='';
           dt_finalizacao_gestacao:=0.0;

           qryAux5.close;
           qryAux5.sql.clear;
           qryAux5.sql.text:=strSQL;
           try
             qryAux5.open;
           except on ex4:Exception do
             begin
               showMessage(strSql);
               showMessage(ex4.message);
             end;
           end;

           qryTmpGestantes.edit;       // editando o registro
           if qryAux5.recordcount > 0 then
           begin
             ciap_final_gestacao:=Trim(qryAux5.fieldByName('ds_filtro_ciaps').asString);
             cid_final_gestacao :=Trim(qryAux5.fieldByName('ds_filtro_cids').asString);
             dt_finalizacao_gestacao:=qryAux5.fieldByName('co_dim_tempo').asDateTime;

             // checando como e se a gestação foi finalizada..
             if ciap_final_gestacao<>'||' then
             begin
               gestacao_finalizada:=ChecaCiapFimGestacao(ExplodeString(Trim(qryAux5.fieldByName('ds_filtro_ciaps').asString)));
               dsc_fim_gestacao:=DescricaoCiapFimGestacao(gestacao_finalizada);
             end
             else
             begin
               gestacao_finalizada:=ChecaCidsFimGestacao(ExplodeString(Trim(qryAux5.fieldByName('ds_filtro_cids').asString)));
               dsc_fim_gestacao:=DescricaoCidFimGestacao(gestacao_finalizada);
             end;

             qryTmpGestantes.edit;  // editando a tabela de gestantes

             qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_FINALIZADA').asInteger:=gestacao_finalizada;
             qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_DSCFINALIZACAO').asString:=dsc_fim_gestacao;
             qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_DT_FINALIZACAO').asDateTime:=qryAux5.fieldByName('co_dim_tempo').asDateTime;
             qryTmpGestantes.FieldByName('CIND_GESTANTE_CIAP_FINALIZACAO').asString:=Trim(qryAux5.fieldByName('ds_filtro_ciaps').asString);
             qryTmpGestantes.FieldByName('CIND_GESTANTE_CID_FINALIZACAO').asString:=Trim(qryAux5.fieldByName('ds_filtro_cids').asString);

           end;

           // preeenchendo campos
           if ((qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_DTLIMITE_FIM').asDateTime >=dInicial) and(qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_DTLIMITE_FIM').asDateTime<=dFinal)) then
               qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_REGRA3').asInteger:=1;

           if gestacao_finalizada<>0 then
           begin
             qryTmpGestantes.FieldByName('CALC_IG_DIAS').AsExtended:=(qryAux5.fieldByName('co_dim_tempo').asDateTime - qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime);
             qryTmpGestantes.FieldByName('CALC_IG_SEMANAS').AsExtended:=(qryAux5.fieldByName('co_dim_tempo').asDateTime - qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime)/7;
             qryTmpGestantes.FieldByName('CALC_IG_MESES').AsExtended:=((qryAux5.fieldByName('co_dim_tempo').asDateTime - qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime)/365)*12 ;
           end
           else
           begin
            if (date >qryTmpGestantes.fieldByName('CALC_DDP').asDateTime)  then
            begin
             qryTmpGestantes.FieldByName('CALC_IG_DIAS').AsExtended:=(qryTmpGestantes.fieldByName('CALC_DDP').asDateTime - qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime);
             qryTmpGestantes.FieldByName('CALC_IG_SEMANAS').AsExtended:=(qryTmpGestantes.fieldByName('CALC_DDP').asDateTime - qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime)/7;
             qryTmpGestantes.FieldByName('CALC_IG_MESES').AsExtended:=((qryTmpGestantes.fieldByName('CALC_DDP').asDateTime - (qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime))/365) * 12;
            end
            else
            begin
             qryTmpGestantes.FieldByName('CALC_IG_DIAS').AsExtended:=(date - qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime);
             qryTmpGestantes.FieldByName('CALC_IG_SEMANAS').AsExtended:=(date - qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime)/7;
             qryTmpGestantes.FieldByName('CALC_IG_MESES').AsExtended:=((date - (qryTmpGestantes.fieldByName('G_CO_DIM_TEMPO_DUM').asDateTime))/365) * 12;

            end;
           end;
           qryTmpGestantes.post;   //salvando o registro

           // PROCEDIMENTOS - INDICADOR 2 - EXAMES HIV, SIFILIS SOLICITADOS / AVALIADOS

          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          //   PROCEDIMENTOS
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          controle_cbo    := '''2251%'',''2252%'',''2253%'',''2231%'',''2235%'',''3222%''';
          procedimentos_s := '''0214010082'',''0214010074'',''0202031110'',''0202031179'',''ABPG026'',''ABEX019''';
          procedimentos_h := '''0214010058'',''0214010040'',''0202030300'',''ABPG024'',''ABEX018''';
          // -------------------------------------------------------------
          // -------------------------------------------------------------
          exame_avaliado:=0;
          exame_solicitado:=0;
          for x:=0 to 1 do      //(x:=; x<2)
          begin
            exame_avaliado:=0;
            exame_solicitado:=0;
            procedimentos := procedimentos_s;
            tex := 'SIFILIS';
            if (x = 1) then
            begin
              procedimentos := procedimentos_h;
              tex := 'HIV';
            end;
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //   (BUSCA) tabela 1
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            strSQL :='SELECT '+#13+#10+
            '     TO_CHAR(TO_DATE(t6.co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
            ' 		t6.nu_cbo, '+#13+#10+
            '     t6.no_cbo, '+#13+#10+
            ' 		t6.nu_cnes, '+#13+#10+
            ' 		t6.nu_ine, '+#13+#10+
            '     t6.no_unidade_saude, '+#13+#10+
            '     t6.co_dim_unidade_saude, '+#13+#10+
            ' 		t6.avaliado, '+#13+#10+
            ' 		t6.solicitado, '+#13+#10+
            ' 		t6.cns_prof, '+#13+#10+
            ' 		t6.no_profissional, '+#13+#10+
            ' 		t6.no_equipe, '+#13+#10+
            ' 		cast(''tb_fat_atd_ind_procedimentos'' as varchar(255)) as tabela'+#13+#10+
            ' 	FROM '+#13+#10+
            ' 	( '+#13+#10+
            ' 		SELECT '+#13+#10+
            ' 			t7.*, '+#13+#10+
            ' 			tb_dim_profissional.nu_cns AS cns_prof, '+#13+#10+
            ' 			tb_dim_profissional.no_profissional '+#13+#10+
            ' 		FROM '+#13+#10+
            ' 		( '+#13+#10+
            ' 			SELECT '+#13+#10+
            ' 				t5.*, '+#13+#10+
            ' 				tb_dim_procedimento.co_proced AS solicitado '+#13+#10+
            ' 			FROM '+#13+#10+
            ' 			( '+#13+#10+
            ' 				SELECT '+#13+#10+
            ' 					t4.*, '+#13+#10+
            ' 					tb_dim_procedimento.co_proced AS avaliado '+#13+#10+
            ' 				FROM '+#13+#10+
            ' 				( '+#13+#10+
            ' 					SELECT '+#13+#10+
            ' 						t3.*, '+#13+#10+
            ' 						tb_dim_equipe.nu_ine, '+#13+#10+
            ' 						tb_dim_equipe.no_equipe '+#13+#10+
						' '+#13+#10+
            ' 					FROM '+#13+#10+
            ' 					( '+#13+#10+
            ' 						SELECT '+#13+#10+
            ' 							t2.*, '+#13+#10+
            ' 							tb_dim_unidade_saude.nu_cnes, '+#13+#10+
						'	   		    tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
            ' 						FROM '+#13+#10+
            ' 						( '+#13+#10+
            ' 							SELECT '+#13+#10+
            ' 								t1.*, '+#13+#10+
            ' 								tb_dim_cbo.nu_cbo, '+#13+#10+
						'				    tb_dim_cbo.no_cbo '+#13+#10+
            ' 							FROM '+#13+#10+
            ' 							( '+#13+#10+
            ' 								SELECT '+#13+#10+
            ' 									CASE WHEN co_dim_cbo_1 = 1 THEN co_dim_cbo_2 '+#13+#10+
            ' 									ELSE co_dim_cbo_1 END '+#13+#10+
            ' 									co_dim_cbo, '+#13+#10+
            ' 									CASE WHEN co_dim_unidade_saude_1 = 1 THEN co_dim_unidade_saude_2 '+#13+#10+
            ' 									ELSE co_dim_unidade_saude_1 END '+#13+#10+
            ' 									co_dim_unidade_saude, '+#13+#10+
            ' 									CASE WHEN co_dim_equipe_1 = 1 THEN co_dim_equipe_2 '+#13+#10+
            ' 									ELSE co_dim_equipe_1 END '+#13+#10+
            ' 									co_dim_equipe, '+#13+#10+
            ' 									co_dim_tempo, '+#13+#10+
            ' 									co_dim_procedimento_avaliado, '+#13+#10+
            ' 									co_dim_procedimento_solicitado, '+#13+#10+
            ' 									CASE WHEN co_dim_profissional_1 = 1 THEN co_dim_profissional_2 '+#13+#10+
            ' 										ELSE co_dim_profissional_1 END '+#13+#10+
            ' 										co_dim_profissional, '+#13+#10+
            ' 									nu_uuid_ficha, '+#13+#10+
            ' 									nu_uuid_dado_transp '+#13+#10+
            ' 								FROM '+#13+#10+
            ' 									tb_fat_atd_ind_procedimentos '+#13+#10+
            ' 								WHERE '+#13+#10+
            ' 									' + campo_busca + ' AND '+#13+#10+
            '                  (TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(qryTmpGestantes.fieldByName('g_co_dim_tempo_dum').asDateTime))+' AND '+#13+#10+
            '                   TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date < '+quotedStr(dateToStr(qryTmpGestantes.fieldByName('CALC_FIMPUERP').asDateTime))+') AND '+#13+#10+
            ' 									( '+#13+#10+
            ' 										co_dim_procedimento_avaliado IN '+#13+#10+
            ' 										( '+#13+#10+
            ' 											SELECT '+#13+#10+
            ' 												co_seq_dim_procedimento '+#13+#10+
            ' 											FROM '+#13+#10+
            ' 												tb_dim_procedimento '+#13+#10+
            ' 											WHERE '+#13+#10+
            ' 												co_proced IN ('+procedimentos+')'+#13+#10+
            ' 										) '+#13+#10+
            ' 										OR '+#13+#10+
            ' 										co_dim_procedimento_solicitado IN '+#13+#10+
            ' 										( '+#13+#10+
            ' 											SELECT '+#13+#10+
            ' 												co_seq_dim_procedimento '+#13+#10+
            ' 											FROM '+#13+#10+
            ' 												tb_dim_procedimento '+#13+#10+
            ' 											WHERE '+#13+#10+
            ' 												co_proced IN ('+procedimentos+') '+#13+#10+
            ' 										) '+#13+#10+
            ' 									) '+#13+#10+
            ' 							) AS t1 '+#13+#10+
            ' 							LEFT JOIN '+#13+#10+
            ' 								tb_dim_cbo '+#13+#10+
            ' 							ON tb_dim_cbo.co_seq_dim_cbo = t1.co_dim_cbo '+#13+#10+
            ' 						) AS t2 '+#13+#10+
            ' 						LEFT JOIN '+#13+#10+
            ' 							tb_dim_unidade_saude '+#13+#10+
            ' 						ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
            ' 					) AS t3 '+#13+#10+
            ' 					LEFT JOIN '+#13+#10+
            ' 						tb_dim_equipe '+#13+#10+
            ' 					ON tb_dim_equipe.co_seq_dim_equipe = t3.co_dim_equipe '+#13+#10+
            ' 				) AS t4 '+#13+#10+
            ' 				LEFT JOIN '+#13+#10+
            ' 					tb_dim_procedimento '+#13+#10+
            ' 				ON tb_dim_procedimento.co_seq_dim_procedimento = t4.co_dim_procedimento_avaliado '+#13+#10+
            ' 			) AS t5 '+#13+#10+
            ' 			LEFT JOIN '+#13+#10+
            ' 				tb_dim_procedimento '+#13+#10+
            ' 			ON tb_dim_procedimento.co_seq_dim_procedimento = t5.co_dim_procedimento_solicitado '+#13+#10+
            ' 		) AS t7 '+#13+#10+
            ' 		LEFT JOIN '+#13+#10+
            ' 			tb_dim_profissional '+#13+#10+
            ' 		ON tb_dim_profissional.co_seq_dim_profissional = t7.co_dim_profissional '+#13+#10+
            ' 	) AS t6 '+#13+#10+
            ' 	WHERE '+#13+#10+
            ' 		nu_cbo LIKE ANY (array['+controle_cbo+'])';
             //-----------------------
             //showmessage(strSql);
             qryAux5.close;
             qryAux5.sql.clear;
             qryAux5.sql.text:=strSQL;
             try
               qryAux5.open;
             except on ex4:Exception do
               begin
                 showMessage(strSql);
                 showMessage(ex4.message);
               end;
             end;

             if qryAux5.Recordcount>0 then
             begin
               while not (qryAux5.eof) do
               begin

                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                //   Prepara o inserir
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                StrCMDSQL := ' INSERT INTO tmp_detalhes_gestantes('+#13+#10+
                  'cns, '+#13+#10+
                  'cpf,'+#13+#10+
                  'co_dim_tempo, '+#13+#10+
                  'no_cnes, '+#13+#10+
                  'no_unidade_saude, '+#13+#10+
                  'nu_ine, '+#13+#10+
                  'procedimento1, '+#13+#10+
                  'procedimento2, '+#13+#10+
                  'cns_profissional, '+#13+#10+
                  'no_profissional, '+#13+#10+
                  'nu_cbo, '+#13+#10+
                  'no_cbo, '+#13+#10+
                  'no_equipe, '+#13+#10+
                  'cod_unidade_saude, '+#13+#10+
                  'tipo, '+#13+#10+
                  'origemdados, '+#13+#10+
                  'tipo_exame, '+#13+#10+
                  'sequencia '+#13+#10+
                  ') VALUES ('+#13+#10+
                  quotedStr(qryTmpGestantes.FieldByName('CNS').asString)+','+#13+#10+
                  quotedStr(qryTmpGestantes.FieldByName('CPF').asString)+','+#13+#10+
                  quotedStr(formatDateTime('yyyy-mm-dd',qryAux5.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('nu_cnes').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('nu_ine').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('avaliado').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('solicitado').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('cns_prof').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('no_profissional').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('nu_cbo').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('no_cbo').asString)+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('no_equipe').asString)+','+#13+#10+
                  qryAux5.FieldByName('co_dim_unidade_saude').asString+','+#13+#10+
                  quotedStr('I2')+','+#13+#10+
                  quotedStr(qryAux5.FieldByName('tabela').asString)+','+#13+#10+
                  quotedStr(tex)+','+#13+#10+          // tipo do exame hiv ou sifilis
                  qryTmpGestantes.FieldByName('sequencia').asString+')';

                  qryTmp.close;
                  qryTmp.Sql.Clear;
                  qryTmp.sql.text:=StrCMDSQL;

                  try
                    qryTmp.ExecSql;
                  except on ex2:exception do
                   showmessage('aqui98:'+ex2.message);
                  end;

                  if qryAux5.FieldByName('avaliado').asString<>'-' then
                    inc(exame_avaliado);
                  if qryAux5.FieldByName('solicitado').asString<>'-' then
                    inc(exame_solicitado);

                  qryAux5.next;
               end;

               if  (tex = 'SIFILIS') then
               begin
                  if exame_avaliado>0 then
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA1').asInteger:=1;
                    qryTmpGestantes.FieldByName('NRPROC_SIFILIS_AVALIADO').asInteger:=exame_avaliado;
                    qryTmpGestantes.post;
                  end
                  else
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA1').asInteger:=0;
                    qryTmpGestantes.FieldByName('NRPROC_SIFILIS_AVALIADO').asInteger:=0;
                    qryTmpGestantes.post;
                  end;
                  if exame_solicitado>0 then
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('NRPROC_SIFILIS_SOLICITADO').asInteger:=exame_solicitado;
                    qryTmpGestantes.post;
                  end
                  else
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('NRPROC_SIFILIS_SOLICITADO').asInteger:=0;
                    qryTmpGestantes.post;
                  end;
               end
               else
               begin
                 if exame_avaliado>0 then
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA2').asInteger:=1;
                   qryTmpGestantes.FieldByName('NRPROC_HIV_AVALIADO').asInteger:=exame_avaliado;
                   qryTmpGestantes.post;
                 end
                 else
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA2').asInteger:=0;
                   qryTmpGestantes.FieldByName('NRPROC_HIV_AVALIADO').asInteger:=0;
                   qryTmpGestantes.post;
                 end;
                 if exame_solicitado>0 then
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('NRPROC_HIV_SOLICITADO').asInteger:=exame_solicitado;
                   qryTmpGestantes.post;
                 end
                 else
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('NRPROC_HIV_SOLICITADO').asInteger:=0;
                   qryTmpGestantes.post;
                 end;
               end;

               {
               if  (tex = 'SIFILIS') then
               begin
                 if exame_avaliado>0 then
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA1').asInteger:=1;
                   qryTmpGestantes.post;
                 end;
                 if exame_solicitado>0 then
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA2').asInteger:=1;
                   qryTmpGestantes.post;
                 end ;
               end
               else
               begin
                 if exame_avaliado>0 then
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA1').asInteger:=1;
                   qryTmpGestantes.post;
                 end;
                 if exame_solicitado>0 then
                 begin
                   qryTmpGestantes.edit;
                   qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA2').asInteger:=1;
                   qryTmpGestantes.post;
                 end ;
               end;
               }

              end;

              strSQL:='	SELECT '+#13+#10+
              '   TO_CHAR(TO_DATE(t6.co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
              '   t6.co_dim_unidade_saude, '+#13+#10+
              '   t6.no_unidade_saude, '+#13+#10+
              '   t6.nu_cbo, '+#13+#10+
              '   t6.no_cbo, '+#13+#10+
              '   t6.nu_cnes, '+#13+#10+
              '   t6.nu_ine, '+#13+#10+
              '   t6.procedimento, '+#13+#10+
              '   t6.cns_prof, '+#13+#10+
              '   t6.no_profissional, '+#13+#10+
              '   t6.no_equipe, '+#13+#10+
              '   t6.nu_uuid_ficha, '+#13+#10+
              '   t6.nu_uuid_dado_transp, '+#13+#10+
              '   cast(''tb_fat_proced_atend_proced'' as varchar(255)) as tabela '+#13+#10+
              ' FROM '+#13+#10+
              ' ( '+#13+#10+
              '   --------------------------------------------------------- '+#13+#10+
              '   SELECT '+#13+#10+
              '     t7.*, '+#13+#10+
              '     tb_dim_profissional.nu_cns AS cns_prof, '+#13+#10+
              '     tb_dim_profissional.no_profissional '+#13+#10+
              '   FROM '+#13+#10+
              '   ( '+#13+#10+
              '     SELECT '+#13+#10+
              '       t4.*, '+#13+#10+
              '       tb_dim_procedimento.co_proced AS procedimento '+#13+#10+
              '     FROM '+#13+#10+
              '     ( '+#13+#10+
              '       SELECT '+#13+#10+
              '         t3.*, '+#13+#10+
              '         tb_dim_equipe.nu_ine, '+#13+#10+
              ' 		    tb_dim_equipe.no_equipe '+#13+#10+
              '       FROM '+#13+#10+
              '       ( '+#13+#10+
              '         SELECT '+#13+#10+
              '           t2.*, '+#13+#10+
              '           tb_dim_unidade_saude.nu_cnes, '+#13+#10+
              '	   		   tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
              '         FROM '+#13+#10+
              '         ( '+#13+#10+
              '           SELECT '+#13+#10+
              '             t1.*, '+#13+#10+
              '             tb_dim_cbo.nu_cbo, '+#13+#10+
              '             tb_dim_cbo.no_cbo '+#13+#10+
              '           FROM '+#13+#10+
              '           ( '+#13+#10+
              '             SELECT '+#13+#10+
              '               co_dim_cbo, '+#13+#10+
              '               co_dim_unidade_saude, '+#13+#10+
              '               co_dim_equipe, '+#13+#10+
              '               co_dim_tempo, '+#13+#10+
              '               co_dim_procedimento, '+#13+#10+
              '               co_dim_profissional, '+#13+#10+
              '               nu_uuid_ficha, '+#13+#10+
              '               nu_uuid_dado_transp '+#13+#10+
              '             FROM '+#13+#10+
              '               tb_fat_proced_atend_proced '+#13+#10+
              '             WHERE '+#13+#10+
              '               '+campo_busca+' AND '+#13+#10+
              '               (TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(qryTmpGestantes.fieldByName('g_co_dim_tempo_dum').asDateTime))+' AND '+#13+#10+
              '                TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date < '+quotedStr(dateToStr(qryTmpGestantes.fieldByName('CALC_FIMPUERP').asDateTime))+') AND '+#13+#10+
              '               ( '+#13+#10+
              '                 co_dim_procedimento IN '+#13+#10+
              '                 ( '+#13+#10+
              '                   SELECT '+#13+#10+
              '                     co_seq_dim_procedimento '+#13+#10+
              '                   FROM '+#13+#10+
              '                     tb_dim_procedimento '+#13+#10+
              '                   WHERE '+#13+#10+
              '                     co_proced IN ('+procedimentos+') '+#13+#10+
              '                 ) '+#13+#10+
              '               ) '+#13+#10+
              '           ) AS t1 '+#13+#10+
              '           LEFT JOIN '+#13+#10+
              '             tb_dim_cbo '+#13+#10+
              '           ON tb_dim_cbo.co_seq_dim_cbo = t1.co_dim_cbo '+#13+#10+
              '         ) AS t2 '+#13+#10+
              '         LEFT JOIN '+#13+#10+
              '           tb_dim_unidade_saude '+#13+#10+
              '         ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
              '       ) AS t3 '+#13+#10+
              '       LEFT JOIN '+#13+#10+
              '         tb_dim_equipe '+#13+#10+
              '       ON tb_dim_equipe.co_seq_dim_equipe = t3.co_dim_equipe '+#13+#10+
              '     ) AS t4 '+#13+#10+
              '     LEFT JOIN '+#13+#10+
              '       tb_dim_procedimento '+#13+#10+
              '     ON tb_dim_procedimento.co_seq_dim_procedimento = t4.co_dim_procedimento '+#13+#10+
              '   ) AS t7 '+#13+#10+
              '   LEFT JOIN '+#13+#10+
              '     tb_dim_profissional '+#13+#10+
              '   ON tb_dim_profissional.co_seq_dim_profissional = t7.co_dim_profissional '+#13+#10+
              '   --------------------------------------------------------- '+#13+#10+
              ' ) AS t6 '+#13+#10+
              ' WHERE '+#13+#10+
              '   nu_cbo LIKE ANY (array['+controle_cbo+']) ';


              qryAux5.close;
              qryAux5.sql.clear;
              qryAux5.sql.text:=strSQL;
              try
                qryAux5.open;
              except on ex4:Exception do
                begin
                  showMessage(strSql);
                  showMessage(ex4.message);
                end;
              end;

              if qryAux5.Recordcount>0 then
              begin
                while not (qryAux5.eof) do
                begin

                 // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                 // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                 //   Prepara o inserir
                 // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                 // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

                 StrCMDSQL := ' INSERT INTO tmp_detalhes_gestantes('+#13+#10+
                   'cns, '+#13+#10+
                   'cpf,'+#13+#10+
                   'co_dim_tempo, '+#13+#10+
                   'no_cnes, '+#13+#10+
                   'no_unidade_saude, '+#13+#10+
                   'nu_ine, '+#13+#10+
                   'procedimento1, '+#13+#10+
                   'procedimento2, '+#13+#10+
                   'cns_profissional, '+#13+#10+
                   'no_profissional, '+#13+#10+
                   'nu_cbo, '+#13+#10+
                   'no_cbo, '+#13+#10+
                   'no_equipe, '+#13+#10+
                   'cod_unidade_saude, '+#13+#10+
                   'tipo, '+#13+#10+
                   'origemdados, '+#13+#10+
                   'tipo_exame, '+#13+#10+
                   'sequencia '+#13+#10+
                   ') VALUES ('+#13+#10+
                   quotedStr(qryTmpGestantes.FieldByName('CNS').asString)+','+#13+#10+
                   quotedStr(qryTmpGestantes.FieldByName('CPF').asString)+','+#13+#10+
                   quotedStr(formatDateTime('yyyy-mm-dd',qryAux5.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('nu_cnes').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('nu_ine').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('procedimento').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('procedimento').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('cns_prof').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('no_profissional').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('nu_cbo').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('no_cbo').asString)+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('no_equipe').asString)+','+#13+#10+
                   qryAux5.FieldByName('co_dim_unidade_saude').asString+','+#13+#10+
                   quotedStr('I2')+','+#13+#10+
                   quotedStr(qryAux5.FieldByName('tabela').asString)+','+#13+#10+
                   quotedStr(tex)+','+#13+#10+ // tipo exame hiv ou sifilis
                   qryTmpGestantes.FieldByName('sequencia').asString + ')';

                   qryTmp.close;
                   qryTmp.Sql.Clear;
                   qryTmp.sql.text:=StrCMDSQL;

                   try
                     qryTmp.ExecSql;
                   except on ex2:exception do
                    showmessage('aqui99'+ex2.message);
                   end;

                   if qryAux5.FieldByName('procedimento').asString<>'-' then
                     inc(exame_avaliado);
                   if qryAux5.FieldByName('procedimento').asString<>'-' then
                     inc(exame_solicitado);

                   qryAux5.next;
                end;
                if  (tex = 'SIFILIS') then
                begin
                   if exame_avaliado>0 then
                   begin
                     qryTmpGestantes.edit;
                     qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA1').asInteger:=1;
                     qryTmpGestantes.FieldByName('NRPROC_SIFILIS_AVALIADO').asInteger:=exame_avaliado;
                     qryTmpGestantes.post;
                   end
                   else
                   begin
                     qryTmpGestantes.edit;
                     qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA1').asInteger:=0;
                     qryTmpGestantes.FieldByName('NRPROC_SIFILIS_AVALIADO').asInteger:=0;
                     qryTmpGestantes.post;
                   end;

                   if exame_solicitado>0 then
                   begin
                     qryTmpGestantes.edit;
                     qryTmpGestantes.FieldByName('NRPROC_SIFILIS_SOLICITADO').asInteger:=exame_solicitado;
                     qryTmpGestantes.post;
                   end
                   else
                   begin
                     qryTmpGestantes.edit;
                     qryTmpGestantes.FieldByName('NRPROC_SIFILIS_SOLICITADO').asInteger:=0;
                     qryTmpGestantes.post;
                   end;
                end
                else
                begin
                  if exame_avaliado>0 then
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA2').asInteger:=1;
                    qryTmpGestantes.FieldByName('NRPROC_HIV_AVALIADO').asInteger:=exame_avaliado;
                    qryTmpGestantes.post;
                  end
                  else
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA2').asInteger:=0;
                    qryTmpGestantes.FieldByName('NRPROC_HIV_AVALIADO').asInteger:=0;
                    qryTmpGestantes.post;
                  end;
                  if exame_solicitado>0 then
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('NRPROC_HIV_SOLICITADO').asInteger:=exame_solicitado;
                    qryTmpGestantes.post;
                  end
                  else
                  begin
                    qryTmpGestantes.edit;
                    qryTmpGestantes.FieldByName('NRPROC_HIV_SOLICITADO').asInteger:=0;
                    qryTmpGestantes.post;
                  end;
                end;

              end;

             // FIM PROCEDIMENTOS
          end; // fim do for


          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          //   ODONTOLOGIA (CONSULTAS)
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          strSQL :='SELECT '+#13+#10+
          '    * '+#13+#10+
          '  FROM '+#13+#10+
          '  ( '+#13+#10+
          '    SELECT '+#13+#10+
          '      t4.st_gestante, '+#13+#10+
          '      TO_CHAR(TO_DATE(t4.co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
          '      t4.ds_filtro_procedimentos, '+#13+#10+
          '      t4.nu_ine, '+#13+#10+
          '      t4.no_equipe, '+#13+#10+
          '      t4.nu_cnes, '+#13+#10+
          '      t4.no_unidade_saude, '+#13+#10+
          '      t4.nu_cbo_1, '+#13+#10+
          '      t4.cns_prof_1, '+#13+#10+
          '      t4.co_dim_profissional_1, '+#13+#10+
          '      t4.no_profissional_1, '+#13+#10+
          '      t4.cns_prof_2, '+#13+#10+
          '      t4.co_dim_profissional_2, '+#13+#10+
          '      t4.no_profissional_2, '+#13+#10+
          '      tb_dim_cbo.nu_cbo AS nu_cbo_2, '+#13+#10+
          '      t4.co_seq_dim_unidade_saude, '+#13+#10+
          '      Cast(''DENTISTA'' as varchar(100)) as no_cbo '+#13+#10+
				  ' '+#13+#10+
          '    FROM '+#13+#10+
          '    ( '+#13+#10+
          '      SELECT '+#13+#10+
          '        t3.*, '+#13+#10+
          '        tb_dim_cbo.nu_cbo AS nu_cbo_1 '+#13+#10+
          '      FROM '+#13+#10+
          '      ( '+#13+#10+
          '        SELECT '+#13+#10+
          '          t2.*, '+#13+#10+
          '          tb_dim_unidade_saude.nu_cnes, '+#13+#10+
          '          tb_dim_unidade_saude.no_unidade_saude, '+#13+#10+
          '            tb_dim_unidade_saude.co_seq_dim_unidade_saude '+#13+#10+
          '        FROM '+#13+#10+
          '        ( '+#13+#10+
          '          SELECT '+#13+#10+
          '             t0.*, '+#13+#10+
          '             tb_dim_profissional.nu_cns AS cns_prof_1, '+#13+#10+
          '             tb_dim_profissional.no_profissional as no_profissional_1 '+#13+#10+
          '          FROM '+#13+#10+
          '          ( '+#13+#10+
          '            SELECT '+#13+#10+
          '              t9.*, '+#13+#10+
          '              tb_dim_profissional.nu_cns AS cns_prof_2, '+#13+#10+
          '              tb_dim_profissional.no_profissional as no_profissional_2 '+#13+#10+
          '            FROM '+#13+#10+
          '            ( '+#13+#10+
          '              SELECT '+#13+#10+
          '                t1.*, '+#13+#10+
          '                tb_dim_equipe.nu_ine, '+#13+#10+
          '                tb_dim_equipe.no_equipe '+#13+#10+
          '              FROM '+#13+#10+
          '              ( '+#13+#10+
          '                SELECT '+#13+#10+
          '                  CASE WHEN st_gestante IS NULL THEN ''0'' '+#13+#10+
          '                    ELSE st_gestante END '+#13+#10+
          '                    st_gestante, '+#13+#10+
          '                  CASE WHEN co_dim_unidade_saude_1 = 1 THEN co_dim_unidade_saude_2 '+#13+#10+
          '                    ELSE co_dim_unidade_saude_1 END '+#13+#10+
          '                    co_dim_unidade_saude, '+#13+#10+
          '                  CASE WHEN co_dim_equipe_1 = 1 THEN co_dim_equipe_2 '+#13+#10+
          '                    ELSE co_dim_equipe_1 END '+#13+#10+
          '                    co_dim_equipe, '+#13+#10+
          '                  co_dim_cbo_1, '+#13+#10+
          '                  co_dim_cbo_2, '+#13+#10+
          '                  co_dim_tempo, '+#13+#10+
          '                  ds_filtro_procedimentos, '+#13+#10+
          '                  co_dim_profissional_1, '+#13+#10+
          '                  co_dim_profissional_2 '+#13+#10+
          '                FROM '+#13+#10+
          '                  tb_fat_atendimento_odonto '+#13+#10+
          '                WHERE '+#13+#10+
          '                '+campo_busca+' AND '+#13+#10+
          '                 (TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(qryTmpGestantes.fieldByName('g_co_dim_tempo_dum').asDateTime))+' AND '+#13+#10+
          '                  TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date < '+quotedStr(dateToStr(qryTmpGestantes.fieldByName('CALC_FIMPUERP').asDateTime))+')'+#13+#10+
          '                 ORDER BY co_dim_tempo DESC '+#13+#10+
          '              ) AS t1 '+#13+#10+
          '              LEFT JOIN '+#13+#10+
          '                tb_dim_equipe '+#13+#10+
          '              ON tb_dim_equipe.co_seq_dim_equipe = t1.co_dim_equipe '+#13+#10+
          '            ) AS t9 '+#13+#10+
          '            LEFT JOIN tb_dim_profissional '+#13+#10+
          '            ON tb_dim_profissional.co_seq_dim_profissional = t9.co_dim_profissional_2 '+#13+#10+
          '          ) AS t0 '+#13+#10+
          '          LEFT JOIN tb_dim_profissional '+#13+#10+
          '          ON tb_dim_profissional.co_seq_dim_profissional = t0.co_dim_profissional_1 '+#13+#10+
          '        ) AS t2 '+#13+#10+
          '        LEFT JOIN '+#13+#10+
          '          tb_dim_unidade_saude '+#13+#10+
          '        ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
          '      ) AS t3 '+#13+#10+
          '      LEFT JOIN '+#13+#10+
          '        tb_dim_cbo '+#13+#10+
          '      ON tb_dim_cbo.co_seq_dim_cbo = t3.co_dim_cbo_1 '+#13+#10+
          '    ) AS t4 '+#13+#10+
          '    LEFT JOIN '+#13+#10+
          '      tb_dim_cbo '+#13+#10+
          '    ON tb_dim_cbo.co_seq_dim_cbo = t4.co_dim_cbo_2 '+#13+#10+
          '  ) AS t5 '+#13+#10+
          '  WHERE '+#13+#10+
          '    nu_cbo_1 LIKE ''2232%'' OR nu_cbo_2 LIKE ''2232%''' ;
          ///--------------------------
          qryAux5.close;
          qryAux5.sql.clear;
          qryAux5.sql.text:=strSQL;
          try
            qryAux5.open;
          except on ex4:Exception do
            begin
              showMessage(strSql);
              showMessage(ex4.message);
            end;
          end;

          NCO1Trim:=0; //Zerando as variaveis de numero de consultas odontologicas
          NCO2Trim:=0; //Por Trimestres
          NCO3Trim:=0;
          data_L1Trim:=qryTmpGestantes.FieldByName('g_co_dim_tempo_dum').asDateTime + 93;
          data_L2Trim:=data_L1Trim + 93;    // 3 trimestres
          data_L3Trim:=data_L2Trim + 94;

          if qryAux5.Recordcount>0 then
          begin

            if objConfiguracao.periodoPandemia = 1 then
            begin
             qryTmpGestantes.edit;
             qryTmpGestantes.FieldByName('CIND_GESTANTE_I3_REGRA1').asInteger:=1;
             qryTmpGestantes.post;
            end;
            /////////////////

            while not (qryAux5.eof) do
            begin

             // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
             // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
             //   Prepara o inserir
             // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
             // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

             StrCMDSQL := ' INSERT INTO tmp_detalhes_gestantes('+#13+#10+
               'cns, '+#13+#10+
               'cpf,'+#13+#10+
               'co_dim_tempo, '+#13+#10+
               'no_cnes, '+#13+#10+
               'no_unidade_saude, '+#13+#10+
               'nu_ine, '+#13+#10+
               'odonto_st_gestante, '+#13+#10+
               'odonto_procedimento, '+#13+#10+
               'cns_profissional, '+#13+#10+
               'no_profissional, '+#13+#10+
               'nu_cbo, '+#13+#10+
               'no_cbo, '+#13+#10+
               'no_equipe, '+#13+#10+
               'cod_unidade_saude, '+#13+#10+
               'tipo, '+#13+#10+
               'sequencia '+#13+#10+
               ') VALUES ('+#13+#10+
               quotedStr(qryTmpGestantes.FieldByName('CNS').asString)+','+#13+#10+
               quotedStr(qryTmpGestantes.FieldByName('CPF').asString)+','+#13+#10+
               quotedStr(formatDateTime('yyyy-mm-dd',qryAux5.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
               quotedStr(qryAux5.FieldByName('nu_cnes').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('no_unidade_saude').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('nu_ine').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('st_gestante').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('ds_filtro_procedimentos').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('cns_prof_1').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('no_profissional_1').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('nu_cbo_1').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('no_cbo').asString)+','+#13+#10+
               quotedStr(qryAux5.FieldByName('no_equipe').asString)+','+#13+#10+
               qryAux5.FieldByName('co_seq_dim_unidade_saude').asString+','+#13+#10+
               quotedStr('I3')+','+#13+#10+
               qryTmpGestantes.FieldByName('sequencia').asString+')';

               qryTmp.close;
               qryTmp.Sql.Clear;
               qryTmp.sql.text:=StrCMDSQL;

               try
                 qryTmp.ExecSql;
               except on ex2:exception do
                showmessage(ex2.message);
               end;

//               if (objConfiguracao.periodoPandemia = 0) then
//               begin
//                   showmessage('dum:'+qrytmpgestantes.fieldbyname('g_co_dim_tempo_dum').asString+' L->'+qryAux5.FieldByName('co_dim_tempo').asString+'->L1'+dateToStr(data_l1trim)+'->L2'+dateToStr(data_l2trim)+'->L3'+dateToStr(data_l3trim));
                   if (qryAux5.FieldByName('co_dim_tempo').asDateTime <= data_L1Trim) then
                   begin
                      NCO1Trim:=NCO1Trim + 1;
                   end else
                   if ((qryAux5.FieldByName('co_dim_tempo').asDateTime > Data_L1Trim)
                       and (qryAux5.FieldByName('co_dim_tempo').asDateTime<= data_L2Trim)) then
                   begin
                      NCO2Trim:=NCO2Trim + 1;
                   end else
                   if ((qryAux5.FieldByName('co_dim_tempo').asDateTime > Data_L2Trim)
                       and (qryAux5.FieldByName('co_dim_tempo').asDateTime <= calc_ddp)) then
                   begin
                      NCO3Trim:=NCO3Trim + 1;
                   end;

 //              end;
               qryAux5.next;
            end;

          end;

          qryTmpGestantes.edit;
          qryTmpGestantes.FieldByName('INDICADOR1').asInteger := 0;
          qryTmpGestantes.FieldByName('INDICADOR2').asInteger := 0;
          qryTmpGestantes.FieldByName('INDICADOR3').asInteger := 0;

          if ((qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_REGRA1').asInteger = 1) AND
              (qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_REGRA2').asInteger = 1) AND
              (qryTmpGestantes.FieldByName('CIND_GESTANTE_I1_REGRA3').asInteger = 1)) then
          begin
            qryTmpGestantes.FieldByName('INDICADOR1').asInteger := 1;
          end;
          if ((qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA1').asInteger = 1) AND
              (qryTmpGestantes.FieldByName('CIND_GESTANTE_I2_REGRA2').asInteger = 1)) THEN
          begin
            qryTmpGestantes.FieldByName('INDICADOR2').asInteger := 1;
          end;

          qryTmpGestantes.FieldByName('NCO1TRIM').asInteger := NCO1trim;
          qryTmpGestantes.FieldByName('NCO2TRIM').asInteger := NCO2trim;
          qryTmpGestantes.FieldByName('NCO3TRIM').asInteger := NCO3trim;
          qryTmpGestantes.FieldByName('CIND_GESTANTE_I3_NRCONSULTAS').asInteger:=(NCO1Trim+NCO2Trim+NCO2Trim);
          // -----------------
          if (objConfiguracao.periodoPandemia = 0) then
          begin
            if ((NCO1Trim > 0) and (NCO2Trim > 0) and (NCO3Trim > 0)) then
            begin
              qryTmpGestantes.FieldByName('CIND_GESTANTE_I3_REGRA1').asInteger:=1;
              qryTmpGestantes.FieldByName('INDICADOR3').asInteger := 1;
            end
            else
            begin
              qryTmpGestantes.FieldByName('INDICADOR3').asInteger := 0;
              qryTmpGestantes.FieldByName('CIND_GESTANTE_I3_REGRA1').asInteger:=0;
            end;
          end
          else if (qryTmpGestantes.FieldByName('CIND_GESTANTE_I3_REGRA1').asInteger = 1) then
          begin
           qryTmpGestantes.FieldByName('INDICADOR3').asInteger := 1;
          end
          else
          begin
           qryTmpGestantes.FieldByName('INDICADOR3').asInteger := 0;
          end;

          qryTmpGestantes.Post;




          qryTmpGestantes.next;

        end;
     end;
   except on ex:Exception do
    begin
     //showmessage(ex.Message)
     TemErro:=true;
    end;
   end;

  //////////////////////////////////////////////////////////////////////////////

 finally
   qryAux1.free;
   qryAux2.free;
   qryAux3.free;
   qryAux4.free;
   qryAux5.free;
   qryTmp.free;
   qryTmpGestantes.free;
   qryTmpDetGestantes.free;
 end;

 result:=TemErro;

end;


function TFGerarIndicador.GerarIndicador4: boolean;
var
 qryTmp, qryTmpMulheres, qryTmpDetMulheres, qryAux1,qryAux2,qryAux3: TUniquery;
 TemErro, duplicado, gravar : boolean;
 strCMDSQL, strSQL:string;
 data_inicial, data_final, dhoje, dt_final: TDateTime;
 nIdadeInicial, nIdadeFinal,i: integer;
 ano, mes, dia : word;

 /////
 CNS,CPF,CNSA,CPFA,campo_busca,campo_ordem,cidadao_cpf,
 cidadao_cns,cidadao_nome,cidadao_mae,cidadao_cns_res,
 cidadao_cpf_res,cidadao_ma,cidadao_sexo,
 cind_cpf, cind_cns, cind_cns_res, cind_cpf_res,
 cind_micro_area, cnes, ine, nome_equipe, nome_sexo,nome_unidade,
 nu_uuid_ficha, nu_uuid_ficha_origem, nu_uuid_dado_transp,
 cidadao_obito,cind_obito,campo_busca_res,
 nu_celular, ciap_final_gestacao, cid_final_gestacao,
 cod_unidade_saude,micro_area, micro_area_c,
 rCNS,rCPF,rCNSA,rCPFA :string;
 busca_cns, busca_cpf, busca : boolean;
 cidadao_nascimento, data_nascimento, dt3ultanos : TDateTime;
 cidadao_ativo,cidadao_faleceu, cind_gestante, cind_hipertenso,
 cind_diabetico, cind_inativo, num_cind, nContador :integer;

 CNS_resp,CPF_resp, data_falecimento,tex, dsc_fim_gestacao :string;
 controle_cbo, procedimentos1, procedimentos2 : string;


 MotherList, ChildList: TList;
 obj1 : TMyObject;

begin
 try

   TemErro:=false;      // VARIAVEL DE CONTROLE DE ERROS

   qryTmp:=TUniquery.create(self);
   qryTmp.Connection:=dm.ConexaoLocal;
   qryTmpMulheres :=TUniquery.create(self);
   qryTmpMulheres.Connection:=Dm.ConexaoLocal;
   qryTmpDetMulheres :=TUniquery.create(self);
   qryTmpDetMulheres.Connection:=Dm.ConexaoLocal;

   qryAux1:=TUniquery.create(self);
   qryAux1.Connection:=Dm.ConexaoEsus;
   qryAux2:=TUniquery.create(self);
   qryAux2.Connection:=Dm.ConexaoEsus;
   // busca por duplicidades...
   qryAux3:=TUniquery.create(self);
   qryAux3.Connection:=Dm.ConexaoLocal;

   MotherList:=TList.Create;

   // Limpar a tabela temporária
   strCMDSQL:='DELETE FROM tmp_mulheres';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

   strCMDSQL:= 'SET GENERATOR GEN_TMP_MULHERES_ID TO 0 ';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

    // Limpar a tabela temporária
   strCMDSQL:='DELETE FROM tmp_detalhes_mulheres';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

   strCMDSQL:= 'SET GENERATOR GEN_TMP_DETALHES_MULHERES_ID TO 0 ';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;


   qryTmpMulheres.close;
   qryTmpMulheres.sql.Clear;
   qryTmpMulheres.Sql.Text:='SELECT * FROM TMP_MULHERES order by sequencia';


   qryTmpDetMulheres.close;
   qryTmpDetMulheres.Sql.Text:='SELECT * FROM TMP_DETALHES_MULHERES order by sequencia';
   qryTmpDetMulheres.open;

   //CONSULTA INICIAL
   dHoje:=date;
   nIdadeInicial:=StrToInt(edIdadeInicial.text);
   nIdadeFinal  :=StrToInt(edIdadeFinal.text);
   DecodeDate(edDataInicial.date, ano, mes, dia);
   ano:=ano - nIdadeFinal;
   data_inicial:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

   DecodeDate(edDataFinal.date, ano, mes, dia);
   ano:=ano - nIdadeInicial;
   data_Final:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

   // variavel dos procedimentos dos ultimos 3 anos.
   DecodeDate(edDataFinal.date, ano, mes, dia);
   ano := ano - 3;
   dt3ultanos := StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);
   dt_final:=edDataFinal.date;

   //------
   StrSQL:=' SELECT '+#13+#10+
   '   * '+#13+#10+
   ' FROM '+#13+#10+
   ' ( '+#13+#10+
   '   SELECT '+#13+#10+
   '     TRIM(FROM t4.nu_cns) as nu_cns, '+#13+#10+
   '     TRIM(FROM t4.nu_cpf_cidadao) as nu_cpf_cidadao, '+#13+#10+
   '     CASE WHEN t5.nu_cns IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM t5.nu_cns) END '+#13+#10+
   '     nu_cns_ci, '+#13+#10+
   '     CASE WHEN t5.nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM t5.nu_cpf_cidadao) END '+#13+#10+
   '     nu_cpf_cidadao_ci, '+#13+#10+
   '     t4.dt_nascimento, '+#13+#10+
   '     t4.idadeatual, '+#13+#10+
   '     t4.no_sexo, '+#13+#10+
   '     t4.st_faleceu, '+#13+#10+
   '     t4.no_cidadao, '+#13+#10+
   '     t4.no_mae, '+#13+#10+
   '     t4.dt_obito, '+#13+#10+
   '     t4.nu_cns_responsavel_c, '+#13+#10+
   '     t4.nu_cpf_responsavel_c, '+#13+#10+
   '     t5.nu_cns_responsavel, '+#13+#10+
   '     t5.nu_cpf_responsavel, '+#13+#10+
   '     t4.st_ativo, '+#13+#10+
   '     t5.dt_obito AS dt_obito_ci, '+#13+#10+
   '     CASE WHEN t5.st_ficha_inativa IS NULL THEN ''0'' '+#13+#10+
   '       ELSE t5.st_ficha_inativa END '+#13+#10+
   '     st_ficha_inativa, '+#13+#10+
   '     t4.nu_micro_area_c, '+#13+#10+
   '     CASE WHEN t5.nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '       ELSE t5.nu_micro_area END '+#13+#10+
   '     nu_micro_area, '+#13+#10+
   '     CASE WHEN t5.nu_ine IS NULL THEN ''0000000000'' '+#13+#10+
   '       ELSE t5.nu_ine END '+#13+#10+
   '     nu_ine, '+#13+#10+
   '     CASE WHEN t5.no_equipe IS NULL THEN cast(''SEM EQUIPE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(t5.no_equipe as varchar(500)) END '+#13+#10+
   '     no_equipe, '+#13+#10+
   '     CASE WHEN t5.nu_cnes IS NULL THEN ''0000000'' '+#13+#10+
   '       ELSE t5.nu_cnes END '+#13+#10+
   '     nu_cnes, '+#13+#10+
   '     CASE WHEN t5.no_unidade_saude IS NULL THEN cast(''SEM UNIDADE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(t5.no_unidade_saude as varchar(500)) END '+#13+#10+
   '     no_unidade_saude, '+#13+#10+
   '     CASE WHEN t5.st_gestante IS NULL THEN 0 '+#13+#10+
   '       ELSE t5.st_gestante END '+#13+#10+
   '     st_gestante, '+#13+#10+
   '     CASE WHEN t5.st_hipertensao_arterial IS NULL THEN 0 '+#13+#10+
   '       ELSE t5.st_hipertensao_arterial END '+#13+#10+
   '     st_hipertensao_arterial, '+#13+#10+
   '     CASE WHEN t5.st_diabete IS NULL THEN 0 '+#13+#10+
   '       ELSE t5.st_diabete END '+#13+#10+
   '     st_diabete, '+#13+#10+
   '     CASE WHEN t5.ds_sexo IS NULL THEN ''FEMININO'' '+#13+#10+
   '       ELSE t5.ds_sexo END '+#13+#10+
   '     ds_sexo, '+#13+#10+
   '     int ''0'' as teste1, '+#13+#10+
   '     text ''0'' as teste2, '+#13+#10+
   '     t5.co_dim_unidade_saude, '+#13+#10+
   ' 		 t4.nu_telefone_celular as nu_celular '+#13+#10+
   '   FROM '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT DISTINCT ON (no_cidadao, no_mae, dt_nascimento) '+#13+#10+
   '       CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cns) END '+#13+#10+
   '       nu_cns, '+#13+#10+
   '       CASE WHEN nu_cpf IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cpf) END '+#13+#10+
   '       nu_cpf_cidadao, '+#13+#10+
   '       dt_nascimento, '+#13+#10+
   '       date_part(''year'', age(dt_nascimento)) AS idadeatual, '+#13+#10+
   '       no_sexo, '+#13+#10+
   '       CASE WHEN st_faleceu IS NULL THEN ''0'' '+#13+#10+
   '         ELSE st_faleceu END '+#13+#10+
   '       st_faleceu, '+#13+#10+
   '       no_cidadao, '+#13+#10+
   '       no_mae, '+#13+#10+
   '       dt_obito, '+#13+#10+
   '       CASE WHEN nu_cns_responsavel IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cns_responsavel) END '+#13+#10+
   '       nu_cns_responsavel_c, '+#13+#10+
   '       CASE WHEN nu_cpf_responsavel IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cpf_responsavel) END '+#13+#10+
   '       nu_cpf_responsavel_c, '+#13+#10+
   '       st_ativo, '+#13+#10+
   '       CASE WHEN nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '         ELSE nu_micro_area END '+#13+#10+
   '       nu_micro_area_c, '+#13+#10+
   '       nu_telefone_celular '+#13+#10+
   '     FROM '+#13+#10+
   '       tb_cidadao '+#13+#10+
   '     WHERE '+#13+#10+
   '       no_sexo = ''FEMININO'' AND '+#13+#10+
   '       (dt_nascimento >= :data_inicial AND dt_nascimento <= :data_final) '+#13+#10+
   '     ORDER BY no_cidadao, no_mae, dt_nascimento, dt_atualizado DESC '+#13+#10+
   '   ) AS t4 '+#13+#10+
   '   LEFT JOIN '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT '+#13+#10+
   '       t3.nu_cns, '+#13+#10+
   '       t3.nu_cpf_cidadao, '+#13+#10+
   '       t3.dt_obito, '+#13+#10+
   '       t3.nu_micro_area, '+#13+#10+
   '       t3.st_ficha_inativa, '+#13+#10+
   '       t3.nu_ine, '+#13+#10+
   '       t3.no_equipe, '+#13+#10+
   '       t3.nu_cnes, '+#13+#10+
   '       t3.no_unidade_saude, '+#13+#10+
   '       t3.st_gestante, '+#13+#10+
   '       t3.st_hipertensao_arterial, '+#13+#10+
   '       t3.st_diabete, '+#13+#10+
   '       upper(tb_dim_sexo.ds_sexo) AS ds_sexo, '+#13+#10+
   '       t3.nu_cns_responsavel, '+#13+#10+
   '       t3.nu_cpf_responsavel, '+#13+#10+
   '       t3.co_dim_unidade_saude, '+#13+#10+
	 '   	   t3.nu_celular '+#13+#10+
   '     FROM '+#13+#10+
   '     ( '+#13+#10+
   '       SELECT '+#13+#10+
   '         t2.*, '+#13+#10+
   '         tb_dim_unidade_saude.nu_cnes, '+#13+#10+
   '         tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
   '       FROM '+#13+#10+
   '       ( '+#13+#10+
   '         SELECT '+#13+#10+
   '           t1.*, '+#13+#10+
   '           tb_dim_equipe.nu_ine, '+#13+#10+
   '           tb_dim_equipe.no_equipe '+#13+#10+
   '         FROM '+#13+#10+
   '         ( '+#13+#10+
   '           SELECT DISTINCT ON (nu_cns, nu_cpf_cidadao) '+#13+#10+
   '             CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cns) END '+#13+#10+
   '             nu_cns, '+#13+#10+
   '             CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cpf_cidadao) END '+#13+#10+
   '             nu_cpf_cidadao, '+#13+#10+
   '             co_dim_unidade_saude, '+#13+#10+
   '             co_dim_equipe, '+#13+#10+
   '             co_dim_sexo, '+#13+#10+
   '             CASE WHEN nu_cns_responsavel IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cns_responsavel) END '+#13+#10+
   '             nu_cns_responsavel, '+#13+#10+
   '             CASE WHEN nu_cpf_responsavel IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cpf_responsavel) END '+#13+#10+
   '             nu_cpf_responsavel, '+#13+#10+
   '             dt_obito, '+#13+#10+
   '             CASE WHEN nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '               ELSE nu_micro_area END '+#13+#10+
   '               nu_micro_area, '+#13+#10+
   '             st_ficha_inativa, '+#13+#10+
   '             CASE WHEN st_gestante IS NULL THEN ''0'' '+#13+#10+
   '               ELSE st_gestante END '+#13+#10+
   '               st_gestante, '+#13+#10+
   '             CASE WHEN st_hipertensao_arterial IS NULL THEN ''0'' '+#13+#10+
   '               ELSE st_hipertensao_arterial END '+#13+#10+
   '               st_hipertensao_arterial, '+#13+#10+
   '             CASE WHEN st_diabete IS NULL THEN ''0'' '+#13+#10+
   '               ELSE st_diabete END '+#13+#10+
   '               st_diabete, '+#13+#10+
   '               nu_celular '+#13+#10+
   '           FROM '+#13+#10+
   '             tb_fat_cad_individual '+#13+#10+
   '           ORDER BY nu_cns, nu_cpf_cidadao, co_dim_tempo DESC '+#13+#10+
   '         ) AS t1 '+#13+#10+
   '         LEFT JOIN '+#13+#10+
   '           tb_dim_equipe '+#13+#10+
   '         ON tb_dim_equipe.co_seq_dim_equipe = t1.co_dim_equipe '+#13+#10+
   '       ) AS t2 '+#13+#10+
   '       LEFT JOIN '+#13+#10+
   '         tb_dim_unidade_saude '+#13+#10+
   '       ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
   '     ) AS t3 '+#13+#10+
   '     LEFT JOIN '+#13+#10+
   '       tb_dim_sexo '+#13+#10+
   '     ON tb_dim_sexo.co_seq_dim_sexo = t3.co_dim_sexo '+#13+#10+
   '   ) AS t5 '+#13+#10+
   '   ON '+#13+#10+
   '   CASE WHEN length(t5.nu_cns) = 15 THEN t5.nu_cns = t4.nu_cns ELSE CASE WHEN length(t5.nu_cpf_cidadao) = 11 THEN t5.nu_cpf_cidadao = t4.nu_cpf_cidadao ELSE false END END '+#13+#10+
   '   ORDER BY nu_cns, nu_cpf_cidadao, no_cidadao '+#13+#10+
   ' ) AS tf1 '+#13+#10+
   ' UNION ALL '+#13+#10+
   ' SELECT '+#13+#10+
   '   * '+#13+#10+
   ' FROM '+#13+#10+
   ' ( '+#13+#10+
   '   SELECT '+#13+#10+
   '     CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cns) END '+#13+#10+
   '     nu_cns, '+#13+#10+
   '     CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cpf_cidadao) END '+#13+#10+
   '     nu_cpf_cidadao, '+#13+#10+
   '     CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cns) END '+#13+#10+
   '     nu_cns_ci, '+#13+#10+
   '     CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cpf_cidadao) END '+#13+#10+
   '     nu_cpf_cidadao_ci, '+#13+#10+
   '     dt_nascimento, '+#13+#10+
   '     date_part(''year'', age(dt_nascimento)) AS idadeatual, '+#13+#10+
   '     text ''FEMININO'' as no_sexo, '+#13+#10+
   '     int ''0'' as st_faleceu, '+#13+#10+
   '     cast(''# MULHER NÃO ENCONTRADA #'' as varchar(500)) as no_cidadao, '+#13+#10+
   '     cast(''# SEM NOME DA MAE #'' as varchar(500)) as no_mae, '+#13+#10+
   '     dt_obito, '+#13+#10+
   '     text ''00'' as nu_cns_responsavel_c, '+#13+#10+
   '     text ''00'' as nu_cpf_responsavel_c, '+#13+#10+
   '     CASE WHEN nu_cns_responsavel IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cns_responsavel) END '+#13+#10+
   '     nu_cns_responsavel, '+#13+#10+
   '     CASE WHEN nu_cpf_responsavel IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cpf_responsavel) END '+#13+#10+
   '     nu_cpf_responsavel, '+#13+#10+
   '     int ''1'' as st_ativo, '+#13+#10+
   '     dt_obito as dt_obito_ci, '+#13+#10+
   '     CASE WHEN st_ficha_inativa IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_ficha_inativa END '+#13+#10+
   '     st_ficha_inativa, '+#13+#10+
   '     text ''00'' as nu_micro_area_c, '+#13+#10+
   '     CASE WHEN nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '       ELSE nu_micro_area END '+#13+#10+
   '     nu_micro_area, '+#13+#10+
   '     CASE WHEN nu_ine IS NULL THEN ''0000000000'' '+#13+#10+
   '       ELSE nu_ine END '+#13+#10+
   '     nu_ine, '+#13+#10+
   '     CASE WHEN no_equipe IS NULL THEN cast(''SEM EQUIPE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(no_equipe as varchar(500)) END '+#13+#10+
   '     no_equipe, '+#13+#10+
   '     CASE WHEN nu_cnes IS NULL THEN ''0000000'' '+#13+#10+
   '       ELSE nu_cnes END '+#13+#10+
   '     nu_cnes, '+#13+#10+
   '     CASE WHEN no_unidade_saude IS NULL THEN cast(''SEM UNIDADE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(no_unidade_saude as varchar(500)) END '+#13+#10+
   '     no_unidade_saude, '+#13+#10+
   '     CASE WHEN st_gestante IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_gestante END '+#13+#10+
   '     st_gestante, '+#13+#10+
   '     CASE WHEN st_hipertensao_arterial IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_hipertensao_arterial END '+#13+#10+
   '     st_hipertensao_arterial, '+#13+#10+
   '     CASE WHEN st_diabete IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_diabete END '+#13+#10+
   '     st_diabete, '+#13+#10+
   '     ds_sexo, '+#13+#10+
   '     int ''0'' as teste1, '+#13+#10+
   '     text ''0'' as teste2, '+#13+#10+
   '  	 co_dim_unidade_saude, '+#13+#10+
   '     nu_celular '+#13+#10+

   '   FROM '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT '+#13+#10+
   '       * '+#13+#10+
   '     FROM '+#13+#10+
   '     ( '+#13+#10+
   '       SELECT '+#13+#10+
   '         * '+#13+#10+
   '       FROM '+#13+#10+
   '       ( '+#13+#10+
   '         SELECT '+#13+#10+
   '           * '+#13+#10+
   '         FROM '+#13+#10+
   '         ( '+#13+#10+
   '           SELECT '+#13+#10+
   '             t1.*, '+#13+#10+
   '             upper(tb_dim_sexo.ds_sexo) AS ds_sexo '+#13+#10+
   '           FROM '+#13+#10+
   '           ( '+#13+#10+
   '             SELECT DISTINCT ON (nu_cns, nu_cpf_cidadao) '+#13+#10+
   '               * '+#13+#10+
   '             FROM '+#13+#10+
   '               tb_fat_cad_individual '+#13+#10+
   '             WHERE '+#13+#10+
   '               (dt_nascimento >= :data_inicial AND dt_nascimento <= :data_final) '+#13+#10+
   '             ORDER BY nu_cns, nu_cpf_cidadao, co_dim_tempo DESC '+#13+#10+
   '           ) AS t1 '+#13+#10+
   '           LEFT JOIN '+#13+#10+
   '             tb_dim_sexo '+#13+#10+
   '           ON tb_dim_sexo.co_seq_dim_sexo = t1.co_dim_sexo '+#13+#10+
   '         ) AS t2 '+#13+#10+
   '         WHERE '+#13+#10+
   '           ds_sexo = ''FEMININO'' '+#13+#10+
   '       ) AS t4 '+#13+#10+
   '       LEFT JOIN '+#13+#10+
   '         tb_dim_equipe '+#13+#10+
   '       ON tb_dim_equipe.co_seq_dim_equipe = t4.co_dim_equipe '+#13+#10+
   '     ) AS t5 '+#13+#10+
   '     LEFT JOIN '+#13+#10+
   '       tb_dim_unidade_saude '+#13+#10+
   '     ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t5.co_dim_unidade_saude '+#13+#10+
   '   ) AS t3 '+#13+#10+
   '   WHERE NOT EXISTS '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT '+#13+#10+
   '       nu_cns, nu_cpf '+#13+#10+
   '     FROM '+#13+#10+
   '       tb_cidadao '+#13+#10+
   '     WHERE '+#13+#10+
   '       CASE WHEN length(t3.nu_cns) = 15 THEN t3.nu_cns = tb_cidadao.nu_cns ELSE CASE WHEN length(t3.nu_cpf_cidadao) = 11 THEN t3.nu_cpf_cidadao = tb_cidadao.nu_cpf ELSE false END END '+#13+#10+
   '   ) '+#13+#10+
   '   ORDER BY nu_cns, nu_cpf_cidadao, no_cidadao '+#13+#10+
   ' ) AS tf2 ';

   lblStatus.visible:=true;
   lblStatus.Caption:='Buscando registros...';

   qryAux1.close;
   qryAux1.sql.clear;
   qryAux1.sql.Text:=StrSQL;
   qryAux1.ParamByName('data_inicial').asDateTime:=data_inicial;
   qryAux1.ParamByName('data_final').asDateTime:=data_final;
   try
    qryAux1.open;

    if qryAux1.recordCount > 0 then
    begin

       pb1.visible:=true;
       nContador:=1;
       pb1.Max:=qryAux1.recordcount;
       pb1.Position:=1;
       pb1.Step:=1;

       qryAux1.first;
       while not (qryAux1.eof) do
       begin
          obj1:= TMyObject.Create;
          application.processmessages;
          lblStatus.Caption:='Percorrendo registros selecionados...';
          CNS := '0';
          CPF := '0';
          CNSA := '0';
          CPFA := '0';
          duplicado:=false;

          if length(trim(qryAux1.FieldByName('nu_cns').asString)) = 15 then
           CNS := trim(qryAux1.FieldByName('nu_cns').asString)
          else
            if length(trim(qryAux1.FieldByName('nu_cns_ci').asString)) = 15 then
              CNS := trim(qryAux1.FieldByName('nu_cns_ci').asString);

          if (length(trim(qryAux1.FieldByName('nu_cpf_cidadao').asString)) = 11) then
            CPF := trim(qryAux1.FieldByName('nu_cpf_cidadao').asString)
          else
           if (length(trim(qryAux1.FieldByName('nu_cpf_cidadao_ci').asString)) = 11) then
              CPF := trim(qryAux1.FieldByName('nu_cpf_cidadao_ci').asString);

          {

          if MotherList.Count > 0 then
          begin
            duplicado := false;

            for i := 0 to MotherList.Count-1 do
            begin
              if (length(CNS) = 15) then
              begin
                if (TMyObject(TList(MotherList.Items[i])).ValorCNS = CNS) then
                 begin
                   duplicado :=true;
                   break;
                 end;
              end;
              if (length(CPF) = 11) then
              begin
                if (TMyObject(TList(MotherList.Items[i])).ValorCPF = CPF) then
                 begin
                   duplicado :=true;
                   break;
                 end;
              end;
            end;
          end;
          }

          if (length(CNS)=15) then
          begin
            qryAux3.Close;
            qryAux3.SQL.Clear;
            qryAux3.SQL.Text:='SELECT CNS, CPF FROM TMP_MULHERES WHERE (CNS = :CNS)';
            qryAux3.ParamByName('CNS').AsString:=CNS;
            qryAux3.Open;

            if qryAux3.RecordCount > 0 then
              duplicado:=true;
          end;

          if (length(CPF)=11) then
          begin
            qryAux3.Close;
            qryAux3.SQL.Clear;
            qryAux3.SQL.Text:='SELECT CNS, CPF FROM TMP_MULHERES WHERE (CPF = :CPF)';
            qryAux3.ParamByName('CPF').AsString:=CPF;
            qryAux3.Open;

            if qryAux3.RecordCount > 0 then
              duplicado:=true;
          end;

          if not (duplicado) then
          begin

          //
          ine := qryAux1.FieldByName('nu_ine').asString;
          if (ine = '-') then
            ine := '0000000000';

          if (qryAux1.FieldByName('co_dim_unidade_saude').asString<>'') then
            cod_unidade_saude:=qryAux1.FieldByName('co_dim_unidade_saude').asString
          else
            cod_unidade_saude:='0';

          //
            StrSql := 'SELECT '+#13+#10+
            '  nu_cns, '+#13+#10+
            '  nu_cpf, '+#13+#10+
            '  no_cidadao, '+#13+#10+
            '  tb_cidadao_vinculacao_equipe.nu_ine, '+#13+#10+
            '  tb_dim_equipe.no_equipe, '+#13+#10+
            '  tb_dim_unidade_saude.co_seq_dim_unidade_saude, '+#13+#10+
            '  tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
            'FROM '+#13+#10+
            '  tb_cidadao '+#13+#10+
            ' left join tb_cidadao_vinculacao_equipe '+#13+#10+
            ' on (tb_cidadao.co_seq_cidadao = tb_cidadao_vinculacao_equipe.co_cidadao) '+#13+#10+
            ' left join tb_dim_equipe '+#13+#10+
            ' on (tb_cidadao_vinculacao_equipe.nu_ine = tb_dim_equipe.nu_ine) '+#13+#10+
            ' left join tb_dim_unidade_saude '+#13+#10+
            ' on (tb_cidadao_vinculacao_equipe.nu_cnes = tb_dim_unidade_saude.nu_cnes) '+#13+#10+
            'WHERE '+#13+#10+
            ' nu_cns = '+quotedStr(CNS)+ ' or '+
            ' nu_cpf = '+quotedStr(CPF);


            qryAux2.close;
            qryAux2.sql.clear;
            qryAux2.sql.text:=strSQL;

            try
              qryAux2.open;
            except on ex1:Exception do
              showmessage(ex1.message);
            end;

            if qryAux2.RecordCount>0 then
            begin

              qryAux2.first;
              while not (qryAux2.eof) do
              begin

                if (length(trim(qryAux2.FieldByName('nu_cns').asString)) = 15) then
                begin
                  if (length(CNS) <> 15) then
                    CNS := trim(qryAux2.FieldByName('nu_cns').asString)
                  else if (CNS <> qryAux2.FieldByName('nu_cns').asString) then
                  begin
                      if (Copy(qryAux2.FieldByName('nu_cns').asString,1,1)='7') then
                        CNS:=qryAux2.FieldByName('nu_cns').asString;
                  end
                  else
                    CNSA := trim(qryAux2.FieldByName('nu_cns').asString);
                end;

                if (length(trim(qryAux2.FieldByName('nu_cpf').asString)) = 11) then
                begin
                 if (length(CPF) <> 11) then
                   CPF := trim(qryAux2.FieldByName('nu_cpf').asString)
                 else
                   if (CPF <> qryAux2.FieldByName('nu_cpf').asString) then
                     CPFA := trim(qryAux2.FieldByName('nu_cpf').asString);
                end;

                if ine='-' then
                 ine:=qryAux2.FieldByName('nu_ine').asString;

                if (ine = '-') then
                 ine := '0000000000';

                if (qryAux2.FieldByName('co_seq_dim_unidade_saude').asString<>'') then
                 cod_unidade_saude:=qryAux2.FieldByName('co_seq_dim_unidade_saude').asString
                else
                 cod_unidade_saude:='0';


                qryAux2.next;
              end;

              if (length(trim(qryAux2.FieldByName('no_cidadao').asString)) > 0) then
                cidadao_nome := trim(qryAux1.FieldByName('no_cidadao').asString);

            end;

            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //   Tratamento dos dados
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            data_nascimento := qryAux1.FieldByName('dt_nascimento').asDateTime;
            data_falecimento := 'null';

            if (Length(Trim(qryAux1.FieldByName('dt_obito').asString)) > 5) then
              data_falecimento := qryAux1.FieldByName('dt_obito').asString
             else
              if (length(trim(qryAux1.FieldByName('dt_obito_ci').asString)) > 5) then
                data_falecimento := qryAux1.FieldByName('dt_obito').asString;

            micro_area := qryAux1.FieldByName('nu_micro_area').asString;
            if (length(micro_area) = 1) then
              micro_area := '0'+micro_area;

            if (length(micro_area) = 0) then
              micro_area := '00';

            micro_area_c := qryAux1.FieldByName('nu_micro_area_c').asString;
            if (length(micro_area_c) = 1) then
              micro_area_c := '0'+micro_area_c;

            if (length(micro_area_c) = 0) then
              micro_area_c := '00';

            cns_resp := '0';
            cpf_resp := '0';
            if (length(qryAux1.FieldByName('nu_cns_responsavel').asstring) = 15) then
              cns_resp := qryAux1.FieldByName('nu_cns_responsavel').asString
            else
              cns_resp := qryAux1.FieldByName('nu_cns_responsavel_c').asString;

            if (length(qryAux1.FieldByName('nu_cpf_responsavel').asString) = 11) then
              cpf_resp := qryAux1.FieldByName('nu_cpf_responsavel').asString
            else
              cpf_resp := qryAux1.FieldByName('nu_cpf_responsavel_c').asString;

            cidadao_nome := '# MULHER NÃO ENCONTRADA #';
            cidadao_mae := '# SEM NOME DA MAE #';


            if (length(trim(qryAux1.FieldByName('no_cidadao').asString)) > 0) then
              cidadao_nome := trim(qryAux1.FieldByName('no_cidadao').asString);

            if (length(trim(qryAux1.FieldByName('no_mae').asString)) > 0) then
              cidadao_mae := trim(qryAux1.FieldByName('no_mae').asString);

            if ((micro_area = '-') or (micro_area = '--') or (micro_area = '0-')) then
              micro_area := '00';

            if ((micro_area_c = '-') or (micro_area_c = '--') or (micro_area_c = '0-')) then
              micro_area_c := '00';

            if (micro_area = '00') then
              if (micro_area_c <> '00') then
                micro_area := micro_area_c;

            {
            ine := qryAux1.FieldByName('nu_ine').asString;
            if (ine = '-') then
              ine := '0000000000';

            if (qryAux1.FieldByName('co_dim_unidade_saude').asString<>'') then
             cod_unidade_saude:=qryAux1.FieldByName('co_dim_unidade_saude').asString
            else
             cod_unidade_saude:='0';
            }

            gravar:=true;

            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            {if ((Trim(qryAux1.FieldByName('no_equipe').asString)='SEM EQUIPE') or
               (qryAux1.FieldByName('no_equipe').IsNull)) then
             gravar :=false;
            }
            if (qryAux1.FieldByName('st_faleceu').asInteger <> 0) then
              gravar := false;

            if (qryAux1.FieldByName('st_ficha_inativa').asInteger <> 0) then
              gravar := false;

            if (qryAux1.FieldByName('st_ativo').asInteger <> 1) then
              gravar := false;

            if ((CNS = '0') and (CPF = '0') or ((cns='') and (cpf=''))) then
              gravar := false;


            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //   Prepara o inserir
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            if gravar then
            begin

              {// salvando dados no objeto para busca por duplicados

              obj1.TipoDocCNS:='CNS';
              obj1.ValorCNS:=CNS;
              obj1.TipoDocCPF:='CPF';
              obj1.ValorCPF:=CPF;
              MotherList.add(obj1);

             ////////////////////////////////
             }
              strCMDSQL := 'INSERT INTO tmp_mulheres( '+#13+#10+
                'cns,'+#13+#10+
                'cpf,'+#13+#10+
                'cns_alternativo,'+#13+#10+
                'cpf_alternativo,'+#13+#10+
                'data_nascimento,'+#13+#10+
                'cidadao_ativo,'+#13+#10+
                'data_falecimento,'+#13+#10+
                'cidadao_nome,'+#13+#10+
                'cidadao_mae,'+#13+#10+
                'cidadao_faleceu,'+#13+#10+
                'cidadao_sexo,'+#13+#10+
                'cns_resp,'+#13+#10+
                'cpf_resp,'+#13+#10+
                'cind_gestante,'+#13+#10+
                'cind_hipertenso,'+#13+#10+
                'cind_diabetico,'+#13+#10+
                'cind_sexo,'+#13+#10+
                'cind_micro_area,'+#13+#10+
                'cind_inativo,'+#13+#10+
                'cnes,'+#13+#10+
                'nome_unidade,'+#13+#10+
                'ine,'+#13+#10+
                'nome_equipe,'+#13+#10+
                'idadeatual,'+#13+#10+
                'co_seq_dim_unidade_saude,'+#13+#10+
                'telefone'+#13+#10+
                ') VALUES ('+#13+#10+
                quotedStr(CNS)+','+#13+#10+
                quotedStr(CPF)+','+#13+#10+
                quotedStr(CNSA)+','+#13+#10+
                quotedStr(CPFA)+','+#13+#10+
                quotedStr(formatDateTime('yyyy-mm-dd',data_nascimento))+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_ativo').asString)+','+#13+#10;

                if (data_falecimento<>'null') then
                  strCMDSQL:=strCMDSQL + quotedStr(formatDateTime('yyyy-mm-dd',StrToDateTime(data_falecimento)))+','+#13+#10
                else
                  strCMDSQL:=strCMDSQL + data_falecimento + ','#13+#10;

                strCMDSQL:=strCMDSQL +
                quotedStr(cidadao_nome)+','+#13+#10+
                quotedStr(cidadao_mae)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_faleceu').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('no_sexo').asString)+','+#13+#10+
                quotedStr(cns_resp)+','+#13+#10+
                quotedStr(cpf_resp)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_gestante').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_hipertensao_arterial').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_diabete').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('ds_sexo').asString)+','+#13+#10+
                quotedStr(micro_area)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_ficha_inativa').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('nu_cnes').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                quotedStr(ine)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('no_equipe').asString)+','+#13+#10+
                qryAux1.FieldByName('idadeatual').asString+','+#13+#10+
                cod_unidade_saude+','+#13+#10+
                quotedStr(qryAux1.FieldByName('nu_celular').asString) + ')';

                qryTmp.close;
                qryTmp.sql.Clear;
                qryTmp.sql.text:=StrCMDSQL;

                try
                  qryTmp.ExecSql;
                except on ex2:exception do
                 ShowMessage(ex2.message);
                end;

            end; //fim if gravar


          end;  // fim if duplicado
          inc(nContador);
          pb1.Position:=nContador;
          qryAux1.next;
          obj1.Free;
       end;   // fim while qryaux1


//      pb1.visible:=false;
//      lblStatus.visible:=false;
       pb1.position:=0;
       pb1.max:=0;
       pb1.step:=1 ;
       nContador:=1;
       lblStatus.caption:='Obtendo dados da Tabela Temporária de Mulheres...';

       ///// segunda parte
       ///
       qryTmpMulheres.Close;
       qryTmpMulheres.Sql.clear;
       qryTmpMulheres.Sql.text:='SELECT * FROM TMP_MULHERES ORDER BY SEQUENCIA';
       qryTmpMulheres.FetchingAll;
       qryTmpMulheres.Open;
       qryTmpMulheres.Last;
       pb1.max:=qryTmpMulheres.recordcount;
       qryTmpMulheres.First;

       if qryTmpMulheres.recordCount>0 then
       begin
         lblStatus.caption:='Percorrendo tabela temporária de mulheres e buscando procedimentos do indicador...';

         controle_cbo    := '''2251%'',''2252%'',''2253%'',''2231%'',''2235%''';
         procedimentos1   := '''ABPG010'',''0201020033''';
         procedimentos2   := '''%ABPG010%'',''%0201020033%''';

         while not (qryTmpMulheres.eof) do
         begin
           application.processMessages;
           rCNS  := trim(qryTmpMulheres.fieldByName('cns').asString);
           rCPF  := trim(qryTmpMulheres.fieldByName('cpf').asString);
           rCNSA := trim(qryTmpMulheres.fieldByName('cns_alternativo').asString);
           rCPFA := trim(qryTmpMulheres.fieldByName('cpf_alternativo').asString);

           campo_busca := '(nu_cns = '+quotedStr(rCNS)+' OR nu_cpf_cidadao = '+quotedStr(rCPF)+')';

           // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
           //   (BUSCA) tabela 1
           // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
           strSQL:='SELECT '+#13+#10+
           '   TO_CHAR(TO_DATE(t6.co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
           '   t6.nu_cbo, '+#13+#10+
           '   t6.no_cbo, '+#13+#10+
           '   t6.nu_cnes, '+#13+#10+
           '   t6.nu_ine, '+#13+#10+
           '   t6.no_equipe, '+#13+#10+
           '   t6.procedimento, '+#13+#10+
           '   t6.ds_proced, '+#13+#10+
           '   t6.cns_prof, '+#13+#10+
           '   t6.no_profissional, '+#13+#10+
           '   t6.co_seq_dim_unidade_saude, '+#13+#10+
           '   t6.no_unidade_saude, '+#13+#10+
           '   t6.co_fat_cidadao_pec, '+#13+#10+
           '   cast(''tb_fat_proced_atend_proced'' as varchar(255)) as tabela '+#13+#10+
           ' FROM '+#13+#10+
           ' ( '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           '   SELECT '+#13+#10+
           '     t7.*, '+#13+#10+
           '     tb_dim_profissional.nu_cns AS cns_prof, '+#13+#10+
           '     tb_dim_profissional.no_profissional '+#13+#10+
           '   FROM '+#13+#10+
           '   ( '+#13+#10+
           '     SELECT '+#13+#10+
           '       t4.*, '+#13+#10+
           '       tb_dim_procedimento.co_proced AS procedimento, '+#13+#10+
           '       tb_dim_procedimento.ds_proced '+#13+#10+
           '     FROM '+#13+#10+
           '     ( '+#13+#10+
           '       SELECT '+#13+#10+
           '         t3.*, '+#13+#10+
           '         tb_dim_equipe.nu_ine, '+#13+#10+
           '         tb_dim_equipe.no_equipe '+#13+#10+
           '       FROM '+#13+#10+
           '       ( '+#13+#10+
           '         SELECT '+#13+#10+
           '           t2.*, '+#13+#10+
           '           tb_dim_unidade_saude.co_seq_dim_unidade_saude, '+#13+#10+
           '           tb_dim_unidade_saude.no_unidade_saude, '+#13+#10+
           '           tb_dim_unidade_saude.nu_cnes '+#13+#10+
           '         FROM '+#13+#10+
           '         ( '+#13+#10+
           '           SELECT '+#13+#10+
           '             t1.*, '+#13+#10+
           '             tb_dim_cbo.nu_cbo, '+#13+#10+
           '             tb_dim_cbo.no_cbo '+#13+#10+
           '           FROM '+#13+#10+
           '           ( '+#13+#10+
           '             SELECT '+#13+#10+
           '               co_dim_cbo, '+#13+#10+
           '               co_dim_unidade_saude, '+#13+#10+
           '               co_dim_equipe, '+#13+#10+
           '               co_dim_tempo, '+#13+#10+
           '               co_dim_procedimento, '+#13+#10+
           '               co_dim_profissional, '+#13+#10+
           '               co_fat_cidadao_pec ' +#13+#10+
           '             FROM '+#13+#10+
           '               tb_fat_proced_atend_proced '+#13+#10+
           '             WHERE '+#13+#10+
           '               '+campo_busca+' AND '+#13+#10+
           '               (TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(dt3ultanos))+' AND '+#13+#10+
           '                TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date <= '+quotedStr(DateToStr(dt_final))+') AND '+#13+#10+
           '               ( '+#13+#10+
           '                 co_dim_procedimento IN '+#13+#10+
           '                 ( '+#13+#10+
           '                   SELECT '+#13+#10+
           '                     co_seq_dim_procedimento '+#13+#10+
           '                   FROM '+#13+#10+
           '                     tb_dim_procedimento '+#13+#10+
           '                   WHERE '+#13+#10+
           '                     co_proced in ('+procedimentos1+')'+#13+#10+
           '                 ) '+#13+#10+
           '               ) '+#13+#10+
           '           ) AS t1 '+#13+#10+
           '           LEFT JOIN '+#13+#10+
           '             tb_dim_cbo '+#13+#10+
           '           ON tb_dim_cbo.co_seq_dim_cbo = t1.co_dim_cbo '+#13+#10+
           '         ) AS t2 '+#13+#10+
           '         LEFT JOIN '+#13+#10+
           '           tb_dim_unidade_saude '+#13+#10+
           '         ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
           '       ) AS t3 '+#13+#10+
           '       LEFT JOIN '+#13+#10+
           '         tb_dim_equipe '+#13+#10+
           '       ON tb_dim_equipe.co_seq_dim_equipe = t3.co_dim_equipe '+#13+#10+
           '     ) AS t4 '+#13+#10+
           '     LEFT JOIN '+#13+#10+
           '       tb_dim_procedimento '+#13+#10+
           '     ON tb_dim_procedimento.co_seq_dim_procedimento = t4.co_dim_procedimento '+#13+#10+
           '   ) AS t7 '+#13+#10+
           '   LEFT JOIN '+#13+#10+
           '     tb_dim_profissional '+#13+#10+
           '   ON tb_dim_profissional.co_seq_dim_profissional = t7.co_dim_profissional '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           ' ) AS t6 ' +#13+#10+
           ' WHERE '+#13+#10+
           '   nu_cbo LIKE ANY (array['+controle_cbo+']) '+#13+#10+
           ' ORDER BY CO_DIM_TEMPO DESC ';

           qryAux1.close;
           qryAux1.sql.clear;
           qryAux1.sql.text:=strSQL;

           try
             qryAux1.open;
             //qryAux1.last;
             if qryAux1.recordCount>0 then
             begin
               qryAux1.first;
               self.caption:='ENTROU BUSCA 1';
               while not (qryAux1.eof) do
               begin
                 lblStatus.caption:='Percorrendo tabela temporária de procedimentos...';

                 if (qryAux1.FieldByName('procedimento').asString<>'') then
                 begin
                   if ((qryTmpMulheres.FieldByName('ind_i4_regra1').asInteger<>1) and
                       (qryTmpMulheres.FieldByName('indicador4').asInteger<>1)) then
                   begin
                     qryTmpMulheres.Edit;
                     qryTmpMulheres.FieldByName('ind_i4_regra1').asInteger:=1;
                     qryTmpMulheres.FieldByName('indicador4').asInteger:=1;
                     qryTmpMulheres.FieldByName('procedimentos').asString:=qryAux1.FieldByName('procedimento').asString;
                     qryTmpMulheres.FieldByName('dt_ult_exame').asDateTime:=qryAux1.FieldByName('co_dim_tempo').asDateTime;
                     qryTmpMulheres.FieldByName('dt_proximo_exame').asDateTime:=(qryAux1.FieldByName('co_dim_tempo').asDateTime + 365);
                     qryTmpMulheres.FieldByName('dsc_procedimento').asString:=qryAux1.FieldByName('ds_proced').asString;
                     qryTmpMulheres.Post;
                   end;


                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                   //   Prepara o inserir
                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    StrCMDSQL := ' INSERT INTO tmp_detalhes_mulheres('+#13+#10+
                     'cns, '+#13+#10+
                     'cpf,'+#13+#10+
                     'co_dim_tempo, '+#13+#10+
                     'no_cnes, '+#13+#10+
                     'no_unidade_saude, '+#13+#10+
                     'nu_ine, '+#13+#10+
                     'procedimento, '+#13+#10+
                     'cns_profissional, '+#13+#10+
                     'no_profissional, '+#13+#10+
                     'nu_cbo, '+#13+#10+
                     'no_cbo, '+#13+#10+
                     'no_equipe, '+#13+#10+
                     'cod_unidade_saude, '+#13+#10+
                     'co_fat_cidadao_pec, '+#13+#10+
                     'tipo, '+#13+#10+
                     'origemdados, '+#13+#10+
                     'sequencia '+#13+#10+
                     ') VALUES ('+#13+#10+
                     quotedStr(qryTmpMulheres.FieldByName('CNS').asString)+','+#13+#10+
                     quotedStr(qryTmpMulheres.FieldByName('CPF').asString)+','+#13+#10+
                     quotedStr(formatDateTime('yyyy-mm-dd',qryAux1.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('nu_cnes').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('nu_ine').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('procedimento').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('cns_prof').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('no_profissional').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('nu_cbo').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('no_cbo').asString)+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('no_equipe').asString)+','+#13+#10+
                     qryAux1.FieldByName('co_seq_dim_unidade_saude').asString+','+#13+#10+
                     qryAux1.FieldByName('co_fat_cidadao_pec').asString+','+#13+#10+
                     quotedStr('I4')+','+#13+#10+
                     quotedStr(qryAux1.FieldByName('tabela').asString)+','+#13+#10+
                     qryTmpMulheres.FieldByName('sequencia').asString+')';

                     qryTmp.close;
                     qryTmp.Sql.Clear;
                     qryTmp.sql.text:=StrCMDSQL;

                     try
                       qryTmp.ExecSql;
                     except on ex2:exception do
                      showmessage(ex2.message);
                     end;

                     qryTmpMulheres.edit;
                     qryTmpMulheres.FieldByName('qtde_exames').asInteger:=qryTmpMulheres.FieldByName('qtde_exames').asInteger+1;
                     qryTmpMulheres.Post;
                 end;
                 Application.ProcessMessages;
                 qryAux1.Next;
               end;
               lblStatus.caption:='Percorrendo tabela temporária de mulheres e buscando procedimentos do indicador...';

             end;
           except on ex:exception do
            showmessage(ex.message);
           end;

           ////////////////
           // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
           //   (BUSCA) tabela 2
           // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
           strSQL:='SELECT '+#13+#10+
           '   TO_CHAR(TO_DATE(t6.co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
           '   t6.nu_cbo, '+#13+#10+
           '   t6.no_cbo, '+#13+#10+
           '   t6.nu_cnes, '+#13+#10+
           '   t6.nu_ine, '+#13+#10+
           '   t6.no_equipe, '+#13+#10+
           '   t6.ds_filtro_proced_avaliados, '+#13+#10+
           '   t6.cns_prof, '+#13+#10+
           '   t6.no_profissional, '+#13+#10+
           '   t6.co_seq_dim_unidade_saude, '+#13+#10+
           '   t6.no_unidade_saude, '+#13+#10+
           '   t6.co_fat_cidadao_pec, '+#13+#10+
           '   cast(''tb_fat_atendimento_individual'' as varchar(255)) as tabela '+#13+#10+
           ' FROM '+#13+#10+
           ' ( '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           '   SELECT '+#13+#10+
           '     t4.*, '+#13+#10+
           '     tb_dim_profissional.nu_cns AS cns_prof, '+#13+#10+
           '     tb_dim_profissional.no_profissional '+#13+#10+
           '   FROM '+#13+#10+
           '   ( '+#13+#10+
           '       SELECT '+#13+#10+
           '         t3.*, '+#13+#10+
           '         tb_dim_equipe.nu_ine, '+#13+#10+
           '         tb_dim_equipe.no_equipe '+#13+#10+
           '       FROM '+#13+#10+
           '       ( '+#13+#10+
           '         SELECT '+#13+#10+
           '           t2.*, '+#13+#10+
           '           tb_dim_unidade_saude.co_seq_dim_unidade_saude, '+#13+#10+
           '           tb_dim_unidade_saude.no_unidade_saude, '+#13+#10+
           '           tb_dim_unidade_saude.nu_cnes '+#13+#10+
           '         FROM '+#13+#10+
           '         ( '+#13+#10+
           '           SELECT '+#13+#10+
           '             t1.*, '+#13+#10+
           '             tb_dim_cbo.nu_cbo, '+#13+#10+
           '             tb_dim_cbo.no_cbo '+#13+#10+
           '           FROM '+#13+#10+
           '           ( '+#13+#10+
           '             SELECT '+#13+#10+
           '               co_dim_cbo_1, '+#13+#10+
           '               co_dim_unidade_saude_1, '+#13+#10+
           '               co_dim_equipe_1, '+#13+#10+
           '               co_dim_tempo, '+#13+#10+
           '               ds_filtro_proced_avaliados, '+#13+#10+
           '               co_dim_profissional_1, '+#13+#10+
           '               co_fat_cidadao_pec ' +#13+#10+
           '             FROM '+#13+#10+
           '               tb_fat_atendimento_individual '+#13+#10+
           '             WHERE '+#13+#10+
           '               '+campo_busca+' AND '+#13+#10+
           '               (TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(dt3ultanos))+' AND '+#13+#10+
           '                TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date <= '+quotedStr(DateToStr(dt_final))+') AND '+#13+#10+
           '                 ds_filtro_proced_avaliados LIKE ANY (array['+procedimentos2+'])'+#13+#10+
           '           ) AS t1 '+#13+#10+
           '           LEFT JOIN '+#13+#10+
           '             tb_dim_cbo '+#13+#10+
           '           ON tb_dim_cbo.co_seq_dim_cbo = t1.co_dim_cbo_1 '+#13+#10+
           '         ) AS t2 '+#13+#10+
           '         LEFT JOIN '+#13+#10+
           '           tb_dim_unidade_saude '+#13+#10+
           '         ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude_1 '+#13+#10+
           '       ) AS t3 '+#13+#10+
           '       LEFT JOIN '+#13+#10+
           '         tb_dim_equipe '+#13+#10+
           '       ON tb_dim_equipe.co_seq_dim_equipe = t3.co_dim_equipe_1 '+#13+#10+
           '     ) AS t4 '+#13+#10+
           '   LEFT JOIN '+#13+#10+
           '     tb_dim_profissional '+#13+#10+
           '   ON tb_dim_profissional.co_seq_dim_profissional = t4.co_dim_profissional_1 '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           '   --------------------------------------------------------- '+#13+#10+
           ' ) AS t6 ' +#13+#10+
           ' WHERE '+#13+#10+
           '   nu_cbo LIKE ANY (array['+controle_cbo+']) '+#13+#10+
           ' ORDER BY CO_DIM_TEMPO DESC ';

           qryAux2.close;
           qryAux2.sql.clear;
           qryAux2.sql.text:=strSQL;

           try
             qryAux2.open;
             //qryAux1.last;
             if qryAux2.recordCount>0 then
             begin
               qryAux2.first;
               self.caption:='ENTROU BUSCA 2';

               while not (qryAux2.eof) do
               begin
                 lblStatus.caption:='Percorrendo tabela temporária de procedimentos...';

                 if (qryAux2.FieldByName('ds_filtro_proced_avaliados').asString<>'') then
                 begin
                   if ((qryTmpMulheres.FieldByName('ind_i4_regra1').asInteger<>1) and
                       (qryTmpMulheres.FieldByName('indicador4').asInteger<>1)) then
                   begin
                     qryTmpMulheres.Edit;
                     qryTmpMulheres.FieldByName('ind_i4_regra1').asInteger:=1;
                     qryTmpMulheres.FieldByName('indicador4').asInteger:=1;
                     qryTmpMulheres.FieldByName('procedimentos').asString:=qryAux2.FieldByName('ds_filtro_proced_avaliados').asString;
                     qryTmpMulheres.FieldByName('dt_ult_exame').asDateTime:=qryAux2.FieldByName('co_dim_tempo').asDateTime;
                     qryTmpMulheres.FieldByName('dt_proximo_exame').asDateTime:=(qryAux2.FieldByName('co_dim_tempo').asDateTime + 365);
                     qryTmpMulheres.FieldByName('dsc_procedimento').asString:=qryAux2.FieldByName('ds_filtro_proced_avaliados').asString;
                     qryTmpMulheres.Post;
                   end;


                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                   //   Prepara o inserir
                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                   // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                    StrCMDSQL := ' INSERT INTO tmp_detalhes_mulheres('+#13+#10+
                     'cns, '+#13+#10+
                     'cpf,'+#13+#10+
                     'co_dim_tempo, '+#13+#10+
                     'no_cnes, '+#13+#10+
                     'no_unidade_saude, '+#13+#10+
                     'nu_ine, '+#13+#10+
                     'procedimento, '+#13+#10+
                     'cns_profissional, '+#13+#10+
                     'no_profissional, '+#13+#10+
                     'nu_cbo, '+#13+#10+
                     'no_cbo, '+#13+#10+
                     'no_equipe, '+#13+#10+
                     'cod_unidade_saude, '+#13+#10+
                     'co_fat_cidadao_pec, '+#13+#10+
                     'tipo, '+#13+#10+
                     'origemdados, '+#13+#10+
                     'sequencia '+#13+#10+
                     ') VALUES ('+#13+#10+
                     quotedStr(qryTmpMulheres.FieldByName('CNS').asString)+','+#13+#10+
                     quotedStr(qryTmpMulheres.FieldByName('CPF').asString)+','+#13+#10+
                     quotedStr(formatDateTime('yyyy-mm-dd',qryAux1.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('nu_cnes').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('nu_ine').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('ds_filtro_proced_avaliados').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('cns_prof').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('no_profissional').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('nu_cbo').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('no_cbo').asString)+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('no_equipe').asString)+','+#13+#10+
                     qryAux2.FieldByName('co_seq_dim_unidade_saude').asString+','+#13+#10+
                     qryAux2.FieldByName('co_fat_cidadao_pec').asString+','+#13+#10+
                     quotedStr('I4')+','+#13+#10+
                     quotedStr(qryAux2.FieldByName('tabela').asString)+','+#13+#10+
                     qryTmpMulheres.FieldByName('sequencia').asString+')';

                     qryTmp.close;
                     qryTmp.Sql.Clear;
                     qryTmp.sql.text:=StrCMDSQL;

                     try
                       qryTmp.ExecSql;
                     except on ex2:exception do
                      showmessage(ex2.message);
                     end;

                     qryTmpMulheres.edit;
                     qryTmpMulheres.FieldByName('qtde_exames').asInteger:=qryTmpMulheres.FieldByName('qtde_exames').asInteger+1;
                     qryTmpMulheres.Post;

                 end;
                 Application.ProcessMessages;

                 qryAux2.Next;
               end;
               lblStatus.caption:='Percorrendo tabela temporária de mulheres e buscando procedimentos do indicador...';

             end;
           except on ex:exception do
            showmessage(ex.message);
           end;


           pb1.position:=nContador;
           inc(nContador);
           Application.ProcessMessages;
           qryTmpMulheres.next;
         end;
       end;
       ///// segunda parte

    end;
   Except on ex:Exception do
    showmessage(ex.message);
   end;

 finally
    qryTmpDetMulheres.free;
    qryTmpMulheres.free;
    qryTmp.free;
    qryAux3.free;
    qryAux2.free;
    qryAux1.free;
 end;
 result:=TemErro;
end;

function TFGerarIndicador.GerarIndicador5: boolean;
var
 qryTmp, qryTmpCriancas, qryTmpDetCriancas, qryAux1,qryAux2,qryAux3: TUniquery;
 TemErro, duplicado, gravar : boolean;
 strCMDSQL, strSQL:string;
 data_inicial, data_final, dhoje, dt_final: TDateTime;
 nIdadeInicial, nIdadeFinal,i, cod_cidadao: integer;
 ano, mes, dia : word;

 /////
 CNS,CPF,CNSA,CPFA,campo_busca,campo_ordem,cidadao_cpf,
 cidadao_cns,cidadao_nome,cidadao_mae,cidadao_cns_res,
 cidadao_cpf_res,cidadao_ma,cidadao_sexo,
 cind_cpf, cind_cns, cind_cns_res, cind_cpf_res,
 cind_micro_area, cnes, ine, nome_equipe, nome_sexo,nome_unidade,
 nu_uuid_ficha, nu_uuid_ficha_origem, nu_uuid_dado_transp,
 cidadao_obito,cind_obito,campo_busca_res,
 nu_celular, ciap_final_gestacao, cid_final_gestacao,
 cod_unidade_saude,micro_area, micro_area_c,
 rCNS,rCPF,rCNSA,rCPFA :string;
 busca_cns, busca_cpf, busca : boolean;
 cidadao_nascimento, data_nascimento, dt3ultanos : TDateTime;
 cidadao_ativo,cidadao_faleceu, cind_gestante, cind_hipertenso,
 cind_diabetico, cind_inativo, num_cind, nContador :integer;

 CNS_resp,CPF_resp, data_falecimento,tex, dsc_fim_gestacao :string;
 controle_cbo, imunobiologicos : string;


 MotherList, ChildList: TList;
 obj1 : TMyObject;

 ArrImuno, ArrDose, ArrLote, ArrFabricante, tmpArrImuno:TStringDynArray;
  x: Integer;

begin
 try

   TemErro:=false;      // VARIAVEL DE CONTROLE DE ERROS

   qryTmp:=TUniquery.create(self);
   qryTmp.Connection:=dm.ConexaoLocal;
   qryTmpCriancas :=TUniquery.create(self);
   qryTmpCriancas.Connection:=Dm.ConexaoLocal;
   qryTmpDetCriancas :=TUniquery.create(self);
   qryTmpDetCriancas.Connection:=Dm.ConexaoLocal;

   qryAux1:=TUniquery.create(self);
   qryAux1.Connection:=Dm.ConexaoEsus;
   qryAux2:=TUniquery.create(self);
   qryAux2.Connection:=Dm.ConexaoEsus;
   // busca por duplicidades...
   qryAux3:=TUniquery.create(self);
   qryAux3.Connection:=Dm.ConexaoLocal;

   MotherList:=TList.Create;

   // Limpar a tabela temporária
   strCMDSQL:='DELETE FROM tmp_criancas';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

   strCMDSQL:= 'SET GENERATOR GEN_TMP_CRIANCAS_ID TO 0 ';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

    // Limpar a tabela temporária
   strCMDSQL:='DELETE FROM tmp_detalhes_criancas';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;

   strCMDSQL:= 'SET GENERATOR GEN_TMP_DETALHES_CRIANCAS_ID TO 0 ';
   qryTmp.close;
   qryTmp.Sql.Clear;
   qryTmp.sql.text:=StrCMDSQL;
   qryTmp.ExecSQL;


   qryTmpCriancas.close;
   qryTmpCriancas.sql.Clear;
   qryTmpCriancas.Sql.Text:='SELECT * FROM TMP_CRIANCAS order by sequencia';


   qryTmpDetCriancas.close;
   qryTmpDetCriancas.Sql.Text:='SELECT * FROM TMP_DETALHES_CRIANCAS order by sequencia';
   qryTmpDetCriancas.open;

   //CONSULTA INICIAL
   dHoje:=date;
   nIdadeInicial:=0; //StrToInt(edIdadeInicial.text);
   nIdadeFinal  :=1; //StrToInt(edIdadeFinal.text);
   DecodeDate(edDataInicial.date, ano, mes, dia);
   ano := ano - nIdadeFinal;
   data_inicial:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

   DecodeDate(edDataFinal.date, ano, mes, dia);
   ano:=ano - nIdadeInicial;
   data_Final:=StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);

   // variavel dos procedimentos dos ultimos 3 anos.
   DecodeDate(edDataFinal.date, ano, mes, dia);
   ano := ano - 3;
   dt3ultanos := StrToDate(dia.toString+'/'+mes.toString+'/'+ano.toString);
   dt_final:=edDataFinal.date;

   //------
   StrSQL:=' SELECT '+#13+#10+
   '   * '+#13+#10+
   ' FROM '+#13+#10+
   ' ( '+#13+#10+
   '   SELECT '+#13+#10+
   '     TRIM(FROM t4.nu_cns) as nu_cns, '+#13+#10+
   '     TRIM(FROM t4.nu_cpf_cidadao) as nu_cpf_cidadao, '+#13+#10+
   '     CASE WHEN t5.nu_cns IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM t5.nu_cns) END '+#13+#10+
   '     nu_cns_ci, '+#13+#10+
   '     CASE WHEN t5.nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM t5.nu_cpf_cidadao) END '+#13+#10+
   '     nu_cpf_cidadao_ci, '+#13+#10+
   '     t4.dt_nascimento, '+#13+#10+
   '     t4.idadeatual, '+#13+#10+
   '     t4.no_sexo, '+#13+#10+
   '     t4.st_faleceu, '+#13+#10+
   '     t4.no_cidadao, '+#13+#10+
   '     t4.no_mae, '+#13+#10+
   '     t4.dt_obito, '+#13+#10+
   '     t4.nu_cns_responsavel_c, '+#13+#10+
   '     t4.nu_cpf_responsavel_c, '+#13+#10+
   '     t5.nu_cns_responsavel, '+#13+#10+
   '     t5.nu_cpf_responsavel, '+#13+#10+
   '     t4.st_ativo, '+#13+#10+
   '     t4.co_seq_cidadao, '+#13+#10+
   '     t5.dt_obito AS dt_obito_ci, '+#13+#10+
   '     CASE WHEN t5.st_ficha_inativa IS NULL THEN ''0'' '+#13+#10+
   '       ELSE t5.st_ficha_inativa END '+#13+#10+
   '     st_ficha_inativa, '+#13+#10+
   '     t4.nu_micro_area_c, '+#13+#10+
   '     CASE WHEN t5.nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '       ELSE t5.nu_micro_area END '+#13+#10+
   '     nu_micro_area, '+#13+#10+
   '     CASE WHEN t5.nu_ine IS NULL THEN ''0000000000'' '+#13+#10+
   '       ELSE t5.nu_ine END '+#13+#10+
   '     nu_ine, '+#13+#10+
   '     CASE WHEN t5.no_equipe IS NULL THEN cast(''SEM EQUIPE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(t5.no_equipe as varchar(500)) END '+#13+#10+
   '     no_equipe, '+#13+#10+
   '     CASE WHEN t5.nu_cnes IS NULL THEN ''0000000'' '+#13+#10+
   '       ELSE t5.nu_cnes END '+#13+#10+
   '     nu_cnes, '+#13+#10+
   '     CASE WHEN t5.no_unidade_saude IS NULL THEN cast(''SEM UNIDADE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(t5.no_unidade_saude as varchar(500)) END '+#13+#10+
   '     no_unidade_saude, '+#13+#10+
   '     CASE WHEN t5.st_gestante IS NULL THEN 0 '+#13+#10+
   '       ELSE t5.st_gestante END '+#13+#10+
   '     st_gestante, '+#13+#10+
   '     CASE WHEN t5.st_hipertensao_arterial IS NULL THEN 0 '+#13+#10+
   '       ELSE t5.st_hipertensao_arterial END '+#13+#10+
   '     st_hipertensao_arterial, '+#13+#10+
   '     CASE WHEN t5.st_diabete IS NULL THEN 0 '+#13+#10+
   '       ELSE t5.st_diabete END '+#13+#10+
   '     st_diabete, '+#13+#10+
   '     CASE WHEN t5.ds_sexo IS NULL THEN ''FEMININO'' '+#13+#10+
   '       ELSE t5.ds_sexo END '+#13+#10+
   '     ds_sexo, '+#13+#10+
   '     int ''0'' as teste1, '+#13+#10+
   '     text ''0'' as teste2, '+#13+#10+
   '     t5.co_dim_unidade_saude, '+#13+#10+
   ' 		 t4.nu_telefone_celular as nu_celular '+#13+#10+
   '   FROM '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT DISTINCT ON (no_cidadao, no_mae, dt_nascimento) '+#13+#10+
   '       CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cns) END '+#13+#10+
   '       nu_cns, '+#13+#10+
   '       CASE WHEN nu_cpf IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cpf) END '+#13+#10+
   '       nu_cpf_cidadao, '+#13+#10+
   '       dt_nascimento, '+#13+#10+
   '       date_part(''year'', age(dt_nascimento)) AS idadeatual, '+#13+#10+
   '       no_sexo, '+#13+#10+
   '       CASE WHEN st_faleceu IS NULL THEN ''0'' '+#13+#10+
   '         ELSE st_faleceu END '+#13+#10+
   '       st_faleceu, '+#13+#10+
   '       no_cidadao, '+#13+#10+
   '       no_mae, '+#13+#10+
   '       dt_obito, '+#13+#10+
   '       co_seq_cidadao, '+#13+#10+
   '       CASE WHEN nu_cns_responsavel IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cns_responsavel) END '+#13+#10+
   '       nu_cns_responsavel_c, '+#13+#10+
   '       CASE WHEN nu_cpf_responsavel IS NULL THEN ''0'' '+#13+#10+
   '         ELSE TRIM(nu_cpf_responsavel) END '+#13+#10+
   '       nu_cpf_responsavel_c, '+#13+#10+
   '       st_ativo, '+#13+#10+
   '       CASE WHEN nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '         ELSE nu_micro_area END '+#13+#10+
   '       nu_micro_area_c, '+#13+#10+
   '       nu_telefone_celular '+#13+#10+
   '     FROM '+#13+#10+
   '       tb_cidadao '+#13+#10+
   '     WHERE '+#13+#10+
   '       (dt_nascimento >= :data_inicial AND dt_nascimento <= :data_final) '+#13+#10+
   '     ORDER BY no_cidadao, no_mae, dt_nascimento, dt_atualizado DESC '+#13+#10+
   '   ) AS t4 '+#13+#10+
   '   LEFT JOIN '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT '+#13+#10+
   '       t3.nu_cns, '+#13+#10+
   '       t3.nu_cpf_cidadao, '+#13+#10+
   '       t3.dt_obito, '+#13+#10+
   '       t3.nu_micro_area, '+#13+#10+
   '       t3.st_ficha_inativa, '+#13+#10+
   '       t3.nu_ine, '+#13+#10+
   '       t3.no_equipe, '+#13+#10+
   '       t3.nu_cnes, '+#13+#10+
   '       t3.no_unidade_saude, '+#13+#10+
   '       t3.st_gestante, '+#13+#10+
   '       t3.st_hipertensao_arterial, '+#13+#10+
   '       t3.st_diabete, '+#13+#10+
   '       upper(tb_dim_sexo.ds_sexo) AS ds_sexo, '+#13+#10+
   '       t3.nu_cns_responsavel, '+#13+#10+
   '       t3.nu_cpf_responsavel, '+#13+#10+
   '       t3.co_dim_unidade_saude, '+#13+#10+
	 '   	   t3.nu_celular '+#13+#10+
   '     FROM '+#13+#10+
   '     ( '+#13+#10+
   '       SELECT '+#13+#10+
   '         t2.*, '+#13+#10+
   '         tb_dim_unidade_saude.nu_cnes, '+#13+#10+
   '         tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
   '       FROM '+#13+#10+
   '       ( '+#13+#10+
   '         SELECT '+#13+#10+
   '           t1.*, '+#13+#10+
   '           tb_dim_equipe.nu_ine, '+#13+#10+
   '           tb_dim_equipe.no_equipe '+#13+#10+
   '         FROM '+#13+#10+
   '         ( '+#13+#10+
   '           SELECT DISTINCT ON (nu_cns, nu_cpf_cidadao) '+#13+#10+
   '             CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cns) END '+#13+#10+
   '             nu_cns, '+#13+#10+
   '             CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cpf_cidadao) END '+#13+#10+
   '             nu_cpf_cidadao, '+#13+#10+
   '             co_dim_unidade_saude, '+#13+#10+
   '             co_dim_equipe, '+#13+#10+
   '             co_dim_sexo, '+#13+#10+
   '             CASE WHEN nu_cns_responsavel IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cns_responsavel) END '+#13+#10+
   '             nu_cns_responsavel, '+#13+#10+
   '             CASE WHEN nu_cpf_responsavel IS NULL THEN ''0'' '+#13+#10+
   '               ELSE TRIM(FROM nu_cpf_responsavel) END '+#13+#10+
   '             nu_cpf_responsavel, '+#13+#10+
   '             dt_obito, '+#13+#10+
   '             CASE WHEN nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '               ELSE nu_micro_area END '+#13+#10+
   '               nu_micro_area, '+#13+#10+
   '             st_ficha_inativa, '+#13+#10+
   '             CASE WHEN st_gestante IS NULL THEN ''0'' '+#13+#10+
   '               ELSE st_gestante END '+#13+#10+
   '               st_gestante, '+#13+#10+
   '             CASE WHEN st_hipertensao_arterial IS NULL THEN ''0'' '+#13+#10+
   '               ELSE st_hipertensao_arterial END '+#13+#10+
   '               st_hipertensao_arterial, '+#13+#10+
   '             CASE WHEN st_diabete IS NULL THEN ''0'' '+#13+#10+
   '               ELSE st_diabete END '+#13+#10+
   '               st_diabete, '+#13+#10+
   '               nu_celular '+#13+#10+
   '           FROM '+#13+#10+
   '             tb_fat_cad_individual '+#13+#10+
   '           ORDER BY nu_cns, nu_cpf_cidadao, co_dim_tempo DESC '+#13+#10+
   '         ) AS t1 '+#13+#10+
   '         LEFT JOIN '+#13+#10+
   '           tb_dim_equipe '+#13+#10+
   '         ON tb_dim_equipe.co_seq_dim_equipe = t1.co_dim_equipe '+#13+#10+
   '       ) AS t2 '+#13+#10+
   '       LEFT JOIN '+#13+#10+
   '         tb_dim_unidade_saude '+#13+#10+
   '       ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
   '     ) AS t3 '+#13+#10+
   '     LEFT JOIN '+#13+#10+
   '       tb_dim_sexo '+#13+#10+
   '     ON tb_dim_sexo.co_seq_dim_sexo = t3.co_dim_sexo '+#13+#10+
   '   ) AS t5 '+#13+#10+
   '   ON '+#13+#10+
   '   CASE WHEN length(t5.nu_cns) = 15 THEN t5.nu_cns = t4.nu_cns ELSE CASE WHEN length(t5.nu_cpf_cidadao) = 11 THEN t5.nu_cpf_cidadao = t4.nu_cpf_cidadao ELSE false END END '+#13+#10+
   '   ORDER BY nu_cns, nu_cpf_cidadao, no_cidadao '+#13+#10+
   ' ) AS tf1 '+#13+#10+
   ' UNION ALL '+#13+#10+
   ' SELECT '+#13+#10+
   '   * '+#13+#10+
   ' FROM '+#13+#10+
   ' ( '+#13+#10+
   '   SELECT '+#13+#10+
   '     CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cns) END '+#13+#10+
   '     nu_cns, '+#13+#10+
   '     CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cpf_cidadao) END '+#13+#10+
   '     nu_cpf_cidadao, '+#13+#10+
   '     CASE WHEN nu_cns IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cns) END '+#13+#10+
   '     nu_cns_ci, '+#13+#10+
   '     CASE WHEN nu_cpf_cidadao IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cpf_cidadao) END '+#13+#10+
   '     nu_cpf_cidadao_ci, '+#13+#10+
   '     dt_nascimento, '+#13+#10+
   '     date_part(''year'', age(dt_nascimento)) AS idadeatual, '+#13+#10+
   '     text '''' as no_sexo, '+#13+#10+
   '     int ''0'' as st_faleceu, '+#13+#10+
   '     cast(''# CRIANÇA NÃO ENCONTRADA #'' as varchar(500)) as no_cidadao, '+#13+#10+
   '     cast(''# SEM NOME DA MAE #'' as varchar(500)) as no_mae, '+#13+#10+
   '     dt_obito, '+#13+#10+
   '     text ''00'' as nu_cns_responsavel_c, '+#13+#10+
   '     text ''00'' as nu_cpf_responsavel_c, '+#13+#10+
   '     CASE WHEN nu_cns_responsavel IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cns_responsavel) END '+#13+#10+
   '     nu_cns_responsavel, '+#13+#10+
   '     CASE WHEN nu_cpf_responsavel IS NULL THEN ''0'' '+#13+#10+
   '       ELSE TRIM(FROM nu_cpf_responsavel) END '+#13+#10+
   '     nu_cpf_responsavel, '+#13+#10+
   '     int ''1'' as st_ativo, '+#13+#10+
   '     int ''0'' as co_seq_cidadao, '+#13+#10+
   '     dt_obito as dt_obito_ci, '+#13+#10+
   '     CASE WHEN st_ficha_inativa IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_ficha_inativa END '+#13+#10+
   '     st_ficha_inativa, '+#13+#10+
   '     text ''00'' as nu_micro_area_c, '+#13+#10+
   '     CASE WHEN nu_micro_area IS NULL THEN ''00'' '+#13+#10+
   '       ELSE nu_micro_area END '+#13+#10+
   '     nu_micro_area, '+#13+#10+
   '     CASE WHEN nu_ine IS NULL THEN ''0000000000'' '+#13+#10+
   '       ELSE nu_ine END '+#13+#10+
   '     nu_ine, '+#13+#10+
   '     CASE WHEN no_equipe IS NULL THEN cast(''SEM EQUIPE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(no_equipe as varchar(500)) END '+#13+#10+
   '     no_equipe, '+#13+#10+
   '     CASE WHEN nu_cnes IS NULL THEN ''0000000'' '+#13+#10+
   '       ELSE nu_cnes END '+#13+#10+
   '     nu_cnes, '+#13+#10+
   '     CASE WHEN no_unidade_saude IS NULL THEN cast(''SEM UNIDADE'' as varchar(500)) '+#13+#10+
   '       ELSE cast(no_unidade_saude as varchar(500)) END '+#13+#10+
   '     no_unidade_saude, '+#13+#10+
   '     CASE WHEN st_gestante IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_gestante END '+#13+#10+
   '     st_gestante, '+#13+#10+
   '     CASE WHEN st_hipertensao_arterial IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_hipertensao_arterial END '+#13+#10+
   '     st_hipertensao_arterial, '+#13+#10+
   '     CASE WHEN st_diabete IS NULL THEN ''0'' '+#13+#10+
   '       ELSE st_diabete END '+#13+#10+
   '     st_diabete, '+#13+#10+
   '     ds_sexo, '+#13+#10+
   '     int ''0'' as teste1, '+#13+#10+
   '     text ''0'' as teste2, '+#13+#10+
   '     int ''0'' as co_dim_unidade_saude, '+#13+#10+
   '     nu_celular '+#13+#10+
   '   FROM '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT '+#13+#10+
   '       * '+#13+#10+
   '     FROM '+#13+#10+
   '     ( '+#13+#10+
   '       SELECT '+#13+#10+
   '         * '+#13+#10+
   '       FROM '+#13+#10+
   '       ( '+#13+#10+
   '         SELECT '+#13+#10+
   '           * '+#13+#10+
   '         FROM '+#13+#10+
   '         ( '+#13+#10+
   '           SELECT '+#13+#10+
   '             t1.*, '+#13+#10+
   '             upper(tb_dim_sexo.ds_sexo) AS ds_sexo '+#13+#10+
   '           FROM '+#13+#10+
   '           ( '+#13+#10+
   '             SELECT DISTINCT ON (nu_cns, nu_cpf_cidadao) '+#13+#10+
   '               * '+#13+#10+
   '             FROM '+#13+#10+
   '               tb_fat_cad_individual '+#13+#10+
   '             WHERE '+#13+#10+
   '               (dt_nascimento >= :data_inicial AND dt_nascimento <= :data_final) '+#13+#10+
   '             ORDER BY nu_cns, nu_cpf_cidadao, co_dim_tempo DESC '+#13+#10+
   '           ) AS t1 '+#13+#10+
   '           LEFT JOIN '+#13+#10+
   '             tb_dim_sexo '+#13+#10+
   '           ON tb_dim_sexo.co_seq_dim_sexo = t1.co_dim_sexo '+#13+#10+
   '         ) AS t2 '+#13+#10+
   '         WHERE '+#13+#10+
   '           1=1 '+#13+#10+
   '       ) AS t4 '+#13+#10+
   '       LEFT JOIN '+#13+#10+
   '         tb_dim_equipe '+#13+#10+
   '       ON tb_dim_equipe.co_seq_dim_equipe = t4.co_dim_equipe '+#13+#10+
   '     ) AS t5 '+#13+#10+
   '     LEFT JOIN '+#13+#10+
   '       tb_dim_unidade_saude '+#13+#10+
   '     ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t5.co_dim_unidade_saude '+#13+#10+
   '   ) AS t3 '+#13+#10+
   '   WHERE NOT EXISTS '+#13+#10+
   '   ( '+#13+#10+
   '     SELECT '+#13+#10+
   '       nu_cns, nu_cpf '+#13+#10+
   '     FROM '+#13+#10+
   '       tb_cidadao '+#13+#10+
   '     WHERE '+#13+#10+
   '       CASE WHEN length(t3.nu_cns) = 15 THEN t3.nu_cns = tb_cidadao.nu_cns ELSE CASE WHEN length(t3.nu_cpf_cidadao) = 11 THEN t3.nu_cpf_cidadao = tb_cidadao.nu_cpf ELSE false END END '+#13+#10+
   '   ) '+#13+#10+
   '   ORDER BY nu_cns, nu_cpf_cidadao, no_cidadao '+#13+#10+
   ' ) AS tf2 ';

   lblStatus.visible:=true;
   lblStatus.Caption:='Buscando registros...';

   qryAux1.close;
   qryAux1.sql.clear;
   qryAux1.sql.Text:=StrSQL;
   qryAux1.ParamByName('data_inicial').asDateTime:=data_inicial;
   qryAux1.ParamByName('data_final').asDateTime:=data_final;
   try
    qryAux1.open;

    if qryAux1.recordCount > 0 then
    begin

       pb1.visible:=true;
       nContador:=1;
       pb1.Max:=qryAux1.recordcount;
       pb1.Position:=1;
       pb1.Step:=1;

       qryAux1.first;
       while not (qryAux1.eof) do
       begin
          obj1:= TMyObject.Create;
          application.processmessages;
          lblStatus.Caption:='Percorrendo registros selecionados...';
          CNS := '0';
          CPF := '0';
          CNSA := '0';
          CPFA := '0';
          duplicado:=false;

          if length(trim(qryAux1.FieldByName('nu_cns').asString)) = 15 then
           CNS := trim(qryAux1.FieldByName('nu_cns').asString)
          else
            if length(trim(qryAux1.FieldByName('nu_cns_ci').asString)) = 15 then
              CNS := trim(qryAux1.FieldByName('nu_cns_ci').asString);

          if (length(trim(qryAux1.FieldByName('nu_cpf_cidadao').asString)) = 11) then
            CPF := trim(qryAux1.FieldByName('nu_cpf_cidadao').asString)
          else
           if (length(trim(qryAux1.FieldByName('nu_cpf_cidadao_ci').asString)) = 11) then
              CPF := trim(qryAux1.FieldByName('nu_cpf_cidadao_ci').asString);

          {

          if MotherList.Count > 0 then
          begin
            duplicado := false;

            for i := 0 to MotherList.Count-1 do
            begin
              if (length(CNS) = 15) then
              begin
                if (TMyObject(TList(MotherList.Items[i])).ValorCNS = CNS) then
                 begin
                   duplicado :=true;
                   break;
                 end;
              end;
              if (length(CPF) = 11) then
              begin
                if (TMyObject(TList(MotherList.Items[i])).ValorCPF = CPF) then
                 begin
                   duplicado :=true;
                   break;
                 end;
              end;
            end;
          end;
          }

          if (length(CNS)=15) then
          begin
            qryAux3.Close;
            qryAux3.SQL.Clear;
            qryAux3.SQL.Text:='SELECT CNS, CPF FROM TMP_CRIANCAS WHERE (CNS = :CNS)';
            qryAux3.ParamByName('CNS').AsString:=CNS;
            qryAux3.Open;

            if qryAux3.RecordCount > 0 then
              duplicado:=true;
          end;

          if (length(CPF)=11) then
          begin
            qryAux3.Close;
            qryAux3.SQL.Clear;
            qryAux3.SQL.Text:='SELECT CNS, CPF FROM TMP_CRIANCAS WHERE (CPF = :CPF)';
            qryAux3.ParamByName('CPF').AsString:=CPF;
            qryAux3.Open;

            if qryAux3.RecordCount > 0 then
              duplicado:=true;
          end;

          if not (duplicado) then
          begin

          //
          ine := qryAux1.FieldByName('nu_ine').asString;
          if (ine = '-') then
            ine := '0000000000';

          if (qryAux1.FieldByName('co_dim_unidade_saude').asString<>'') then
            cod_unidade_saude:=qryAux1.FieldByName('co_dim_unidade_saude').asString
          else
            cod_unidade_saude:='0';

          //
            StrSql := 'SELECT '+#13+#10+
            '  nu_cns, '+#13+#10+
            '  nu_cpf, '+#13+#10+
            '  co_seq_cidadao, '+#13+#10+
            '  no_cidadao, '+#13+#10+
            '  tb_cidadao_vinculacao_equipe.nu_ine, '+#13+#10+
            '  tb_dim_equipe.no_equipe, '+#13+#10+
            '  tb_dim_unidade_saude.co_seq_dim_unidade_saude, '+#13+#10+
            '  tb_dim_unidade_saude.no_unidade_saude '+#13+#10+
            'FROM '+#13+#10+
            '  tb_cidadao '+#13+#10+
            ' left join tb_cidadao_vinculacao_equipe '+#13+#10+
            ' on (tb_cidadao.co_seq_cidadao = tb_cidadao_vinculacao_equipe.co_cidadao) '+#13+#10+
            ' left join tb_dim_equipe '+#13+#10+
            ' on (tb_cidadao_vinculacao_equipe.nu_ine = tb_dim_equipe.nu_ine) '+#13+#10+
            ' left join tb_dim_unidade_saude '+#13+#10+
            ' on (tb_cidadao_vinculacao_equipe.nu_cnes = tb_dim_unidade_saude.nu_cnes) '+#13+#10+
            'WHERE '+#13+#10+
            ' nu_cns = '+quotedStr(CNS)+ ' or '+
            ' nu_cpf = '+quotedStr(CPF);


            qryAux2.close;
            qryAux2.sql.clear;
            qryAux2.sql.text:=strSQL;

            try
              qryAux2.open;
            except on ex1:Exception do
              showmessage(ex1.message);
            end;

            if qryAux2.RecordCount>0 then
            begin

              qryAux2.first;
              while not (qryAux2.eof) do
              begin

                if (length(trim(qryAux2.FieldByName('nu_cns').asString)) = 15) then
                begin
                  if (length(CNS) <> 15) then
                    CNS := trim(qryAux2.FieldByName('nu_cns').asString)
                  else if (CNS <> qryAux2.FieldByName('nu_cns').asString) then
                  begin
                      if (Copy(qryAux2.FieldByName('nu_cns').asString,1,1)='7') then
                        CNS:=qryAux2.FieldByName('nu_cns').asString;
                  end
                  else
                    CNSA := trim(qryAux2.FieldByName('nu_cns').asString);
                end;

                if (length(trim(qryAux2.FieldByName('nu_cpf').asString)) = 11) then
                begin
                 if (length(CPF) <> 11) then
                   CPF := trim(qryAux2.FieldByName('nu_cpf').asString)
                 else
                   if (CPF <> qryAux2.FieldByName('nu_cpf').asString) then
                     CPFA := trim(qryAux2.FieldByName('nu_cpf').asString);
                end;

                if ine='-' then
                 ine:=qryAux2.FieldByName('nu_ine').asString;

                if (ine = '-') then
                 ine := '0000000000';

                if (qryAux2.FieldByName('co_seq_dim_unidade_saude').asString<>'') then
                 cod_unidade_saude:=qryAux2.FieldByName('co_seq_dim_unidade_saude').asString
                else
                 cod_unidade_saude:='0';

                 cod_cidadao:= qryAux2.FieldByName('co_seq_cidadao').AsInteger;

                qryAux2.next;
              end;

              if (length(trim(qryAux2.FieldByName('no_cidadao').asString)) > 0) then
                cidadao_nome := trim(qryAux1.FieldByName('no_cidadao').asString);

            end;

            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //   Tratamento dos dados
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            data_nascimento := qryAux1.FieldByName('dt_nascimento').asDateTime;
            data_falecimento := 'null';

            if (Length(Trim(qryAux1.FieldByName('dt_obito').asString)) > 5) then
              data_falecimento := qryAux1.FieldByName('dt_obito').asString
             else
              if (length(trim(qryAux1.FieldByName('dt_obito_ci').asString)) > 5) then
                data_falecimento := qryAux1.FieldByName('dt_obito').asString;

            micro_area := qryAux1.FieldByName('nu_micro_area').asString;
            if (length(micro_area) = 1) then
              micro_area := '0'+micro_area;

            if (length(micro_area) = 0) then
              micro_area := '00';

            micro_area_c := qryAux1.FieldByName('nu_micro_area_c').asString;
            if (length(micro_area_c) = 1) then
              micro_area_c := '0'+micro_area_c;

            if (length(micro_area_c) = 0) then
              micro_area_c := '00';

            cns_resp := '0';
            cpf_resp := '0';
            if (length(qryAux1.FieldByName('nu_cns_responsavel').asstring) = 15) then
              cns_resp := qryAux1.FieldByName('nu_cns_responsavel').asString
            else
              cns_resp := qryAux1.FieldByName('nu_cns_responsavel_c').asString;

            if (length(qryAux1.FieldByName('nu_cpf_responsavel').asString) = 11) then
              cpf_resp := qryAux1.FieldByName('nu_cpf_responsavel').asString
            else
              cpf_resp := qryAux1.FieldByName('nu_cpf_responsavel_c').asString;

            cidadao_nome := '# CRIANÇA NÃO ENCONTRADA #';
            cidadao_mae := '# SEM NOME DA MAE #';


            if (length(trim(qryAux1.FieldByName('no_cidadao').asString)) > 0) then
              cidadao_nome := trim(qryAux1.FieldByName('no_cidadao').asString);

            if (length(trim(qryAux1.FieldByName('no_mae').asString)) > 0) then
              cidadao_mae := trim(qryAux1.FieldByName('no_mae').asString);

            if ((micro_area = '-') or (micro_area = '--') or (micro_area = '0-')) then
              micro_area := '00';

            if ((micro_area_c = '-') or (micro_area_c = '--') or (micro_area_c = '0-')) then
              micro_area_c := '00';

            if (micro_area = '00') then
              if (micro_area_c <> '00') then
                micro_area := micro_area_c;

            {
            ine := qryAux1.FieldByName('nu_ine').asString;
            if (ine = '-') then
              ine := '0000000000';

            if (qryAux1.FieldByName('co_dim_unidade_saude').asString<>'') then
             cod_unidade_saude:=qryAux1.FieldByName('co_dim_unidade_saude').asString
            else
             cod_unidade_saude:='0';
            }
            cod_cidadao:=qryAux1.FieldByName('co_seq_cidadao').asInteger;
            gravar:=true;

            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            {if ((Trim(qryAux1.FieldByName('no_equipe').asString)='SEM EQUIPE') or
               (qryAux1.FieldByName('no_equipe').IsNull)) then
             gravar :=false;
            }
            if (qryAux1.FieldByName('st_faleceu').asInteger <> 0) then
              gravar := false;

            if (qryAux1.FieldByName('st_ficha_inativa').asInteger <> 0) then
              gravar := false;

            if (qryAux1.FieldByName('st_ativo').asInteger <> 1) then
              gravar := false;

            if ((CNS = '0') and (CPF = '0') or ((cns='') and (cpf=''))) then
              gravar := false;


            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            //   Prepara o inserir
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
            // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

            if gravar then
            begin

              {// salvando dados no objeto para busca por duplicados

              obj1.TipoDocCNS:='CNS';
              obj1.ValorCNS:=CNS;
              obj1.TipoDocCPF:='CPF';
              obj1.ValorCPF:=CPF;
              MotherList.add(obj1);

             ////////////////////////////////
             }
              strCMDSQL := 'INSERT INTO tmp_criancas( '+#13+#10+
                'cns,'+#13+#10+
                'cpf,'+#13+#10+
                'cns_alternativo,'+#13+#10+
                'cpf_alternativo,'+#13+#10+
                'data_nascimento,'+#13+#10+
                'cidadao_ativo,'+#13+#10+
                'data_falecimento,'+#13+#10+
                'cidadao_nome,'+#13+#10+
                'cidadao_mae,'+#13+#10+
                'cidadao_faleceu,'+#13+#10+
                'cidadao_sexo,'+#13+#10+
                'cns_resp,'+#13+#10+
                'cpf_resp,'+#13+#10+
                'cind_gestante,'+#13+#10+
                'cind_hipertenso,'+#13+#10+
                'cind_diabetico,'+#13+#10+
                'cind_sexo,'+#13+#10+
                'cind_micro_area,'+#13+#10+
                'cind_inativo,'+#13+#10+
                'cnes,'+#13+#10+
                'nome_unidade,'+#13+#10+
                'ine,'+#13+#10+
                'nome_equipe,'+#13+#10+
                'idadeatual,'+#13+#10+
                'co_seq_dim_unidade_saude,'+#13+#10+
                'co_seq_cidadao, '+#13+#10+
                'telefone'+#13+#10+
                ') VALUES ('+#13+#10+
                quotedStr(CNS)+','+#13+#10+
                quotedStr(CPF)+','+#13+#10+
                quotedStr(CNSA)+','+#13+#10+
                quotedStr(CPFA)+','+#13+#10+
                quotedStr(formatDateTime('yyyy-mm-dd',data_nascimento))+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_ativo').asString)+','+#13+#10;

                if (data_falecimento<>'null') then
                  strCMDSQL:=strCMDSQL + quotedStr(formatDateTime('yyyy-mm-dd',StrToDateTime(data_falecimento)))+','+#13+#10
                else
                  strCMDSQL:=strCMDSQL + data_falecimento + ','#13+#10;

                strCMDSQL:=strCMDSQL +
                quotedStr(cidadao_nome)+','+#13+#10+
                quotedStr(cidadao_mae)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_faleceu').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('no_sexo').asString)+','+#13+#10+
                quotedStr(cns_resp)+','+#13+#10+
                quotedStr(cpf_resp)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_gestante').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_hipertensao_arterial').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_diabete').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('ds_sexo').asString)+','+#13+#10+
                quotedStr(micro_area)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('st_ficha_inativa').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('nu_cnes').asString)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                quotedStr(ine)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('no_equipe').asString)+','+#13+#10+
                qryAux1.FieldByName('idadeatual').asString+','+#13+#10+
                cod_unidade_saude+','+#13+#10+
                IntToStr(cod_cidadao)+','+#13+#10+
                quotedStr(qryAux1.FieldByName('nu_celular').asString) + ')';

                qryTmp.close;
                qryTmp.sql.Clear;
                qryTmp.sql.text:=StrCMDSQL;

                try
                  qryTmp.ExecSql;
                except on ex2:exception do
                 ShowMessage(ex2.message);
                end;

            end; //fim if gravar


          end;  // fim if duplicado
          inc(nContador);
          pb1.Position:=nContador;
          qryAux1.next;
          obj1.Free;
       end;   // fim while qryaux1



//      pb1.visible:=false;
//      lblStatus.visible:=false;
       pb1.position:=0;
       pb1.max:=0;
       pb1.step:=1 ;
       nContador:=1;
       lblStatus.caption:='Obtendo dados da Tabela Temporária de Crianças...';

       ///// segunda parte
       ///
       qryTmpCriancas.Close;
       qryTmpCriancas.Sql.clear;
       qryTmpCriancas.Sql.text:='SELECT * FROM TMP_CRIANCAS ORDER BY SEQUENCIA';
       qryTmpCriancas.FetchingAll;
       qryTmpCriancas.Open;
       qryTmpCriancas.Last;
       pb1.max:=qryTmpCriancas.recordcount;
       qryTmpCriancas.First;

       if qryTmpCriancas.recordCount>0 then
       begin
         lblStatus.caption:='Percorrendo tabela temporária de Crianças e buscando vacinas do indicador...';

         controle_cbo    := '''2251%'',''2252%'',''2253%'',''2231%'',''2235%'',''3222%''';
         //imunobiologicos := '''%|22|%'',''%|42|%''';
         //-------------
         imunobiologicos:='';
         tmpArrImuno:=ExplodeString(objConfiguracao.Imunobiologicos,',');
         for x := 0 to Length(tmpArrImuno)-1 do
         begin
          imunobiologicos:=imunobiologicos + '''%|'+trim(tmpArrImuno[x])+'|%''';
          if x <> Length(tmpArrImuno)-1 then
           imunobiologicos:=imunobiologicos + ',';
         end;
         //-------
         while not (qryTmpCriancas.eof) do
         begin
           application.processMessages;
           rCNS  := trim(qryTmpCriancas.fieldByName('cns').asString);
           rCPF  := trim(qryTmpCriancas.fieldByName('cpf').asString);
           rCNSA := trim(qryTmpCriancas.fieldByName('cns_alternativo').asString);
           rCPFA := trim(qryTmpCriancas.fieldByName('cpf_alternativo').asString);

           campo_busca := '(nu_cns = '+quotedStr(rCNS)+' OR nu_cpf_cidadao = '+quotedStr(rCPF)+')';

           // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
           //   (BUSCA) tabela 1
           // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

           strSQL:='SELECT '+#13+#10+
           '   t5.co_seq_fat_vacinacao, '+#13+#10+
           '   t5.ds_filtro_dose_imunobiologico AS dose, '+#13+#10+
           '   t5.ds_filtro_imunobiologico AS imuno, '+#13+#10+
           '   t5.ds_filtro_lote AS lote, '+#13+#10+
           '   t5.ds_filtro_fabricante AS fabricante, '+#13+#10+
           '   t5.co_dim_tempo, '+#13+#10+
           '   t5.nu_cbo, '+#13+#10+
           '   t5.nu_cnes, '+#13+#10+
           '   t5.nu_ine, '+#13+#10+
           '   t5.nu_cns, '+#13+#10+
           '   t5.no_profissional, '+#13+#10+
           '   t5.cns_prof, '+#13+#10+
           '   t5.co_seq_dim_unidade_saude, '+#13+#10+
           '   t5.no_unidade_saude, '+#13+#10+
           '   t5.co_fat_cidadao_pec, '+#13+#10+
           '   cast(''tb_fat_vacinacao'' as varchar(255)) as tabela '+#13+#10+
           ' FROM '+#13+#10+
           ' ( '+#13+#10+
           '   SELECT '+#13+#10+
           '     t4.*, '+#13+#10+
           '     tb_dim_profissional.nu_cns as cns_prof, '+#13+#10+
           '     tb_dim_profissional.no_profissional '+#13+#10+
           '   FROM '+#13+#10+
           '   ( '+#13+#10+
           '     SELECT '+#13+#10+
           '       t3.*, '+#13+#10+
           '       tb_dim_equipe.nu_ine, '+#13+#10+
           '       tb_dim_equipe.no_equipe '+#13+#10+
           '     FROM '+#13+#10+
           '     ( '+#13+#10+
           '       SELECT '+#13+#10+
           '         t2.*, '+#13+#10+
           '         tb_dim_unidade_saude.co_seq_dim_unidade_saude, '+#13+#10+
           '         tb_dim_unidade_saude.no_unidade_saude, '+#13+#10+
           '         tb_dim_unidade_saude.nu_cnes '+#13+#10+
           '       FROM '+#13+#10+
           '       ( '+#13+#10+
           '         SELECT '+#13+#10+
           '           t1.*, '+#13+#10+
           '           tb_dim_cbo.nu_cbo, '+#13+#10+
           '           tb_dim_cbo.no_cbo '+#13+#10+
           '         FROM '+#13+#10+
           '         ( '+#13+#10+
           '           SELECT '+#13+#10+
           '             co_seq_fat_vacinacao, '+#13+#10+
           '             ds_filtro_dose_imunobiologico, '+#13+#10+
           '             ds_filtro_imunobiologico, '+#13+#10+
           '             co_dim_unidade_saude, '+#13+#10+
           '             co_dim_equipe, '+#13+#10+
           '             co_dim_profissional, '+#13+#10+
           '             co_dim_cbo, '+#13+#10+
           '             TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date as co_dim_tempo, '+#13+#10+
           '             ds_filtro_lote, '+#13+#10+
           '             ds_filtro_fabricante, '+#13+#10+
           '             nu_cns, '+#13+#10+
           '             co_fat_cidadao_pec ' +#13+#10+
           '           FROM '+#13+#10+
           '             tb_fat_vacinacao '+#13+#10+
           '           WHERE '+#13+#10+
           '             '+campo_busca+ ' AND '+#13+#10+
           '             tb_fat_vacinacao.ds_filtro_imunobiologico LIKE ANY (array['+imunobiologicos+']) '+#13+#10+
           '             -- AND '+#13+#10+
           '             --( '+#13+#10+
           '              --TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date >= '+quotedStr(DateToStr(edDataInicial.DATE))+' AND '+#13+#10+
           '              --TO_CHAR(TO_DATE(co_dim_tempo::varchar,''YYYYMMDD''), ''DD/MM/YYYY'' )::date <= '+quotedStr(DateToStr(edDatafinal.date))+#13+#10+
           '             --) ' +#13+#10+
           '         ) AS t1 '+#13+#10+
           '         LEFT JOIN '+#13+#10+
           '           tb_dim_cbo '+#13+#10+
           '         ON tb_dim_cbo.co_seq_dim_cbo = t1.co_dim_cbo '+#13+#10+
           '       ) AS t2 '+#13+#10+
           '       LEFT JOIN '+#13+#10+
           '         tb_dim_unidade_saude '+#13+#10+
           '       ON tb_dim_unidade_saude.co_seq_dim_unidade_saude = t2.co_dim_unidade_saude '+#13+#10+
           '     ) AS t3 '+#13+#10+
           '     LEFT JOIN '+#13+#10+
           '       tb_dim_equipe '+#13+#10+
           '     ON tb_dim_equipe.co_seq_dim_equipe = t3.co_dim_equipe '+#13+#10+
           '   ) AS t4 '+#13+#10+
           '   LEFT JOIN '+#13+#10+
           '     tb_dim_profissional '+#13+#10+
           '   ON tb_dim_profissional.co_seq_dim_profissional = t4.co_dim_profissional '+#13+#10+
           ' ) AS t5 '+#13+#10+
           ' WHERE '+#13+#10+
           '   nu_cbo LIKE ANY (array['+controle_cbo+']) '+#13+#10+
           ' ORDER BY co_dim_tempo DESC';

           qryAux1.close;
           qryAux1.sql.clear;
           qryAux1.sql.text:=strSQL;

           try
             qryAux1.open;
             qryAux1.First;
             if qryAux1.recordCount>0 then
             begin
               qryAux1.first;
               self.caption:='ENTROU BUSCA 1';
               while not (qryAux1.eof) do
               begin
                 ArrImuno:=explodeString(qryAux1.FieldByName('imuno').AsString);
                 ArrDose :=explodeString(qryAux1.FieldByName('dose').AsString);

                 for I := 0 to Length(ArrImuno) - 1 do
                 begin

                   lblStatus.caption:='Percorrendo tabela de procedimentos (tb_fat_vacinacao)...';
                     self.Caption:=qryAux1.FieldByName('imuno').asString;
                       qryTmpCriancas.Edit;

                       // ACHA VACINAS PENTAVALENTE
                       if arrImuno[I] = '42' then
                       begin
                        if arrDose[I].ToInteger = 1 then
                        begin
                         qryTmpCriancas.FieldByName('Penta_1_Dose').asInteger:=1;
                         qryTmpCriancas.FieldByName('DT_Penta_1D').asDateTime:=qryaux1.FieldByName('co_dim_tempo').AsDateTime;
                        end;
                       end;

                       if arrImuno[I] = '42' then
                       begin

                        if arrDose[I].ToInteger = 2 then
                        begin
                         qryTmpCriancas.FieldByName('Penta_2_Dose').asInteger:=1;
                         qryTmpCriancas.FieldByName('DT_Penta_2D').asDateTime:=qryaux1.FieldByName('co_dim_tempo').AsDateTime;
                        end;
                       end;

                       if arrImuno[I] = '42' then
                       begin
                        if arrDose[I].ToInteger = 3 then
                        begin
                         qryTmpCriancas.FieldByName('Penta_3_Dose').asInteger:=1;
                         qryTmpCriancas.FieldByName('DT_Penta_3D').asDateTime:=qryaux1.FieldByName('co_dim_tempo').AsDateTime;
                        end;
                       end;

                       // ACHA VACINAS POLIOMIELITE

                       if arrImuno[I] = '22' then
                       begin
                        if arrDose[I].ToInteger = 1 then
                        begin
                         qryTmpCriancas.FieldByName('Polio_1_Dose').asInteger:=1;
                         qryTmpCriancas.FieldByName('DT_Polio_1D').asDateTime:=qryaux1.FieldByName('co_dim_tempo').AsDateTime;
                        end;
                       end;

                       if arrImuno[I] = '22' then
                       begin
                         if arrDose[I].ToInteger = 2 then
                         begin
                           qryTmpCriancas.FieldByName('Polio_2_Dose').asInteger:=1;
                           qryTmpCriancas.FieldByName('DT_Polio_2D').asDateTime:=qryaux1.FieldByName('co_dim_tempo').AsDateTime;
                         end;
                       end;

                       if arrImuno[I] = '22' then
                       begin
                        if arrDose[I].ToInteger = 3 then
                        begin
                         qryTmpCriancas.FieldByName('Polio_3_Dose').asInteger:=1;
                         qryTmpCriancas.FieldByName('DT_Polio_3D').asDateTime:=qryaux1.FieldByName('co_dim_tempo').AsDateTime;
                        end;
                       end;
                       qryTmpCriancas.Post;

                       if ((qryTmpCriancas.FieldByName('Penta_1_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Penta_2_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Penta_3_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Polio_1_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Polio_2_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Polio_3_Dose').AsInteger = 1))  then
                       begin
                         qryTmpCriancas.Edit;
                         qryTmpCriancas.FieldByName('ind_i5_regra1').asInteger:=1;
                         qryTmpCriancas.FieldByName('indicador5').asInteger:=1;
                         qryTmpCriancas.Post;
                       end;


                      {
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     //   Prepara o inserir
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     {
                      StrCMDSQL := ' INSERT INTO tmp_detalhes_criancas('+#13+#10+
                       'cns, '+#13+#10+
                       'cpf,'+#13+#10+
                       'co_dim_tempo, '+#13+#10+
                       'no_cnes, '+#13+#10+
                       'no_unidade_saude, '+#13+#10+
                       'nu_ine, '+#13+#10+
                       'procedimento, '+#13+#10+
                       'cns_profissional, '+#13+#10+
                       'no_profissional, '+#13+#10+
                       'nu_cbo, '+#13+#10+
                       'no_cbo, '+#13+#10+
                       'no_equipe, '+#13+#10+
                       'cod_unidade_saude, '+#13+#10+
                       'co_fat_cidadao_pec, '+#13+#10+
                       'tipo, '+#13+#10+
                       'origemdados, '+#13+#10+
                       'sequencia '+#13+#10+
                       ') VALUES ('+#13+#10+
                       quotedStr(qryTmpCriancas.FieldByName('CNS').asString)+','+#13+#10+
                       quotedStr(qryTmpCriancas.FieldByName('CPF').asString)+','+#13+#10+
                       quotedStr(formatDateTime('yyyy-mm-dd',qryAux1.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('nu_cnes').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('nu_ine').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('procedimento').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('cns_prof').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('no_profissional').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('nu_cbo').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('no_cbo').asString)+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('no_equipe').asString)+','+#13+#10+
                       qryAux1.FieldByName('co_seq_dim_unidade_saude').asString+','+#13+#10+
                       qryAux1.FieldByName('co_fat_cidadao_pec').asString+','+#13+#10+
                       quotedStr('I5')+','+#13+#10+
                       quotedStr(qryAux1.FieldByName('tabela').asString)+','+#13+#10+
                       qryTmpCriancas.FieldByName('sequencia').asString+')';

                       qryTmp.close;
                       qryTmp.Sql.Clear;
                       qryTmp.sql.text:=StrCMDSQL;

                       try
                         qryTmp.ExecSql;
                       except on ex2:exception do
                        showmessage(ex2.message);
                       end;

                       qryTmpMulheres.edit;
                       qryTmpMulheres.FieldByName('qtde_exames').asInteger:=qryTmpMulheres.FieldByName('qtde_exames').asInteger+1;
                       qryTmpMulheres.Post;
                       }

                 end;
                 Application.ProcessMessages;
                 qryAux1.Next;
               end;
               lblStatus.caption:='Percorrendo tabela temporária de Crianças e buscando vacinas do indicador...';
             end;
           except on ex:exception do
            showmessage(ex.message);
           end;

          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          //   (BUSCA) tabela 2
          // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
          if (qryTmpCriancas.FieldByName('co_seq_cidadao').asInteger > 0) then
          begin
            strSQL := '  SELECT '+#13+#10+
            '    t12.*, '+#13+#10+
            '    tb_cbo.co_cbo_2002, '+#13+#10+
            '    tb_cbo.no_cbo '+#13+#10+
            '  FROM '+#13+#10+
            '  ( '+#13+#10+
            '    SELECT '+#13+#10+
            '      t11.*, '+#13+#10+
            '      tb_equipe.nu_ine, '+#13+#10+
            '      tb_equipe.no_equipe '+#13+#10+
            '    FROM '+#13+#10+
            '    ( '+#13+#10+
            '      SELECT '+#13+#10+
            '        t10.*, '+#13+#10+
            '        tb_unidade_saude.nu_cnes, '+#13+#10+
            '        tb_unidade_saude.no_unidade_saude '+#13+#10+
            '      FROM '+#13+#10+
            '      ( '+#13+#10+
            '        SELECT '+#13+#10+
            '          t9.*, '+#13+#10+
            '          tb_atend.co_unidade_saude, '+#13+#10+
            '          tb_atend.co_equipe '+#13+#10+
            '        FROM '+#13+#10+
            '        ( '+#13+#10+
            '          SELECT '+#13+#10+
            '            t8.*, '+#13+#10+
            '            tb_prof.nu_cpf, '+#13+#10+
            '            tb_prof.nu_cns, '+#13+#10+
            '            tb_prof.no_profissional '+#13+#10+
            '          FROM '+#13+#10+
            '          ( '+#13+#10+
            '            SELECT '+#13+#10+
            '              t7.*, '+#13+#10+
            '              tb_lotacao.co_prof, '+#13+#10+
            '              tb_lotacao.co_cbo '+#13+#10+
            '            FROM '+#13+#10+
            '            ( '+#13+#10+
            '              SELECT '+#13+#10+
            '                t6.*, '+#13+#10+
            '                tb_atend_prof.co_atend, '+#13+#10+
            '                tb_atend_prof.co_lotacao, '+#13+#10+
            '                tb_atend_prof.co_seq_atend_prof '+#13+#10+
            '              FROM '+#13+#10+
            '              ( '+#13+#10+
            '                SELECT '+#13+#10+
            '                  t5.*, '+#13+#10+
            '                  tb_imunobiologico_fabricante.no_fabricante '+#13+#10+
            '                FROM '+#13+#10+
            '                ( '+#13+#10+
            '                  SELECT '+#13+#10+
            '                    t4.*, '+#13+#10+
            '                    tb_imunobiologico_lote.ds_lote, '+#13+#10+
            '                    tb_imunobiologico_lote.co_imunobiologico_fabricante '+#13+#10+
            '                  FROM '+#13+#10+
            '                  ( '+#13+#10+
            '                    SELECT '+#13+#10+
            '                      t3.*, '+#13+#10+
            '                      tb_imunobiologico.sg_imunobiologico, '+#13+#10+
            '                      tb_imunobiologico.no_imunobiologico '+#13+#10+
            '                    FROM '+#13+#10+
            '                    ( '+#13+#10+
            '                      -- ********************************************************** '+#13+#10+
            '                      SELECT '+#13+#10+
            '                        * '+#13+#10+
            '                      FROM '+#13+#10+
            '                      ( '+#13+#10+
            '                        SELECT '+#13+#10+
            '                          * '+#13+#10+
            '                        FROM '+#13+#10+
            '                          tb_registro_vacinacao '+#13+#10+
            '                        WHERE '+#13+#10+
            '                          co_imunobiologico IN ('+StringReplace(StringReplace(imunobiologicos, '|', '', [rfReplaceAll]),'%','',[rfReplaceAll])+') '+#13+#10+
            '                          --co_imunobiologico IN (85,86,87,88) '+#13+#10+
            '                      ) AS t1 '+#13+#10+
            '                      INNER JOIN '+#13+#10+
            '                      ( '+#13+#10+
            '                        SELECT '+#13+#10+
            '                          co_seq_vacinacao, '+#13+#10+
            '                          co_atend_prof '+#13+#10+
            '                        FROM '+#13+#10+
            '                          tb_vacinacao '+#13+#10+
            '                        WHERE '+#13+#10+
            '                          co_prontuario = ( '+#13+#10+
            '                            SELECT '+#13+#10+
            '                              co_seq_prontuario '+#13+#10+
            '                            FROM '+#13+#10+
            '                              tb_prontuario '+#13+#10+
            '                            WHERE '+#13+#10+
            '                              co_cidadao = '+qryTmpCriancas.FieldByName('co_seq_cidadao').asString+#13+#10+
            '                              --co_cidadao = 4015 '+#13+#10+
            '                            LIMIT 1 '+#13+#10+
            '                          ) '+#13+#10+
            '                      ) AS t2 '+#13+#10+
            '                      ON t1.co_vacinacao = t2.co_seq_vacinacao '+#13+#10+
            '                      -- ********************************************************** '+#13+#10+
            '                    ) AS t3 '+#13+#10+
            '                    LEFT JOIN '+#13+#10+
            '                      tb_imunobiologico '+#13+#10+
            '                    ON tb_imunobiologico.co_imunobiologico = t3.co_imunobiologico '+#13+#10+
            '                  ) t4 '+#13+#10+
            '                  LEFT JOIN '+#13+#10+
            '                    tb_imunobiologico_lote '+#13+#10+
            '                  ON tb_imunobiologico_lote.co_seq_imunobiologico_lote = t4.co_imunobiologico_lote '+#13+#10+
            '                ) AS t5 '+#13+#10+
            '                LEFT JOIN '+#13+#10+
            '                  tb_imunobiologico_fabricante '+#13+#10+
            '                ON tb_imunobiologico_fabricante.co_seq_imunobiologico_fabrcnt = t5.co_imunobiologico_fabricante '+#13+#10+
            '              ) AS t6 '+#13+#10+
            '              LEFT JOIN '+#13+#10+
            '                tb_atend_prof '+#13+#10+
            '              ON tb_atend_prof.co_seq_atend_prof = t6.co_atend_prof '+#13+#10+
            '            ) AS t7 '+#13+#10+
            '            LEFT JOIN '+#13+#10+
            '              tb_lotacao '+#13+#10+
            '            ON tb_lotacao.co_ator_papel = t7.co_lotacao '+#13+#10+
            '          ) AS t8 '+#13+#10+
            '          LEFT JOIN '+#13+#10+
            '            tb_prof '+#13+#10+
            '          ON tb_prof.co_seq_prof = t8.co_prof '+#13+#10+
            '        ) AS t9 '+#13+#10+
            '        LEFT JOIN '+#13+#10+
            '          tb_atend '+#13+#10+
            '        ON tb_atend.co_seq_atend = t9.co_atend '+#13+#10+
            '      ) AS t10 '+#13+#10+
            '      LEFT JOIN '+#13+#10+
            '        tb_unidade_saude '+#13+#10+
            '      ON tb_unidade_saude.co_seq_unidade_saude = t10.co_unidade_saude '+#13+#10+
            '    ) AS t11 '+#13+#10+
            '    LEFT JOIN '+#13+#10+
            '      tb_equipe '+#13+#10+
            '    ON tb_equipe.co_seq_equipe = t11.co_equipe '+#13+#10+
            '  ) AS t12 '+#13+#10+
            '  LEFT JOIN '+#13+#10+
            '    tb_cbo '+#13+#10+
            '  ON tb_cbo.co_cbo = t12.co_cbo ';

             qryAux2.close;
             qryAux2.sql.clear;
             qryAux2.sql.text:=strSQL;

             try
               qryAux2.open;
               qryAux1.first;
               if qryAux2.recordCount>0 then
               begin
                 qryAux2.first;
                 self.caption:='ENTROU BUSCA 2';

                 while not (qryAux2.eof) do
                 begin
                   lblStatus.caption:='Percorrendo tabela de vacinação (tb_registro_vacincas)...';

                   if not (qryAux2.FieldByName('dt_aplicacao').isNull) then
                   begin
                   //  if ((qryTmpCriancas.FieldByName('ind_i5_regra1').asInteger<>1) and
                   //      (qryTmpCriancas.FieldByName('indicador5').asInteger<>1)) then
                   //  begin
                       qryTmpCriancas.Edit;
                       //qryTmpCriancas.FieldByName('ind_i5_regra1').asInteger:=1;
                       //qryTmpCriancas.FieldByName('indicador5').asInteger:=1;

                       if (qryAux2.FieldByName('co_imunobiologico').asString = '22') then
                       begin
                         if (qryAux2.FieldByName('co_dose_imunobiologico').AsInteger = 1) then
                         begin
                           qryTmpCriancas.FieldByName('Polio_1_Dose').asInteger:=1;
                           qryTmpCriancas.FieldByName('DT_Polio_1D').asDateTime:=qryaux2.FieldByName('dt_aplicacao').AsDateTime;
                         end;
                         if (qryAux2.FieldByName('co_dose_imunobiologico').AsInteger = 2) then
                         begin
                          qryTmpCriancas.FieldByName('Polio_2_Dose').asInteger:=1;
                          qryTmpCriancas.FieldByName('DT_Polio_2D').asDateTime:=qryaux2.FieldByName('dt_aplicacao').AsDateTime;
                         end;
                         if (qryAux2.FieldByName('co_dose_imunobiologico').AsInteger = 3) then
                         begin
                          qryTmpCriancas.FieldByName('Polio_3_Dose').asInteger:=1;
                          qryTmpCriancas.FieldByName('DT_Polio_3D').asDateTime:=qryaux2.FieldByName('dt_aplicacao').AsDateTime;
                         end;
                       end;

                       if (qryAux2.FieldByName('co_imunobiologico').asString = '42') then
                       begin
                         if (qryAux2.FieldByName('co_dose_imunobiologico').AsInteger = 1) then
                         begin
                          qryTmpCriancas.FieldByName('Penta_1_Dose').asInteger:=1;
                          qryTmpCriancas.FieldByName('DT_Penta_1D').asDateTime:=qryaux2.FieldByName('dt_aplicacao').AsDateTime;
                         end;

                         if (qryAux2.FieldByName('co_dose_imunobiologico').AsInteger = 2) then
                         begin
                          qryTmpCriancas.FieldByName('Penta_2_Dose').asInteger:=1;
                          qryTmpCriancas.FieldByName('DT_Penta_2D').asDateTime:=qryaux2.FieldByName('dt_aplicacao').AsDateTime;
                         end;

                         if (qryAux2.FieldByName('co_dose_imunobiologico').AsInteger = 3) then
                         begin
                          qryTmpCriancas.FieldByName('Penta_3_Dose').asInteger:=1;
                          qryTmpCriancas.FieldByName('DT_Penta_3D').asDateTime:=qryaux2.FieldByName('dt_aplicacao').AsDateTime;
                         end;
                        end;
                        qryTmpCriancas.Post;

                       if ((qryTmpCriancas.FieldByName('Penta_1_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Penta_2_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Penta_3_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Polio_1_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Polio_2_Dose').AsInteger = 1) and
                           (qryTmpCriancas.FieldByName('Polio_3_Dose').AsInteger = 1))  then
                       begin
                         qryTmpCriancas.Edit;
                         qryTmpCriancas.FieldByName('ind_i5_regra1').asInteger:=1;
                         qryTmpCriancas.FieldByName('indicador5').asInteger:=1;
                         qryTmpCriancas.Post;
                       end;
                     //end;

                     {
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     //   Prepara o inserir
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                     // +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
                      StrCMDSQL := ' INSERT INTO tmp_detalhes_mulheres('+#13+#10+
                       'cns, '+#13+#10+
                       'cpf,'+#13+#10+
                       'co_dim_tempo, '+#13+#10+
                       'no_cnes, '+#13+#10+
                       'no_unidade_saude, '+#13+#10+
                       'nu_ine, '+#13+#10+
                       'procedimento, '+#13+#10+
                       'cns_profissional, '+#13+#10+
                       'no_profissional, '+#13+#10+
                       'nu_cbo, '+#13+#10+
                       'no_cbo, '+#13+#10+
                       'no_equipe, '+#13+#10+
                       'cod_unidade_saude, '+#13+#10+
                       'co_fat_cidadao_pec, '+#13+#10+
                       'tipo, '+#13+#10+
                       'origemdados, '+#13+#10+
                       'sequencia '+#13+#10+
                       ') VALUES ('+#13+#10+
                       quotedStr(qryTmpMulheres.FieldByName('CNS').asString)+','+#13+#10+
                       quotedStr(qryTmpMulheres.FieldByName('CPF').asString)+','+#13+#10+
                       quotedStr(formatDateTime('yyyy-mm-dd',qryAux1.FieldByName('co_dim_tempo').asDateTime))+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('nu_cnes').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('no_unidade_saude').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('nu_ine').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('ds_filtro_proced_avaliados').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('cns_prof').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('no_profissional').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('nu_cbo').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('no_cbo').asString)+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('no_equipe').asString)+','+#13+#10+
                       qryAux2.FieldByName('co_seq_dim_unidade_saude').asString+','+#13+#10+
                       qryAux2.FieldByName('co_fat_cidadao_pec').asString+','+#13+#10+
                       quotedStr('I4')+','+#13+#10+
                       quotedStr(qryAux2.FieldByName('tabela').asString)+','+#13+#10+
                       qryTmpMulheres.FieldByName('sequencia').asString+')';

                       qryTmp.close;
                       qryTmp.Sql.Clear;
                       qryTmp.sql.text:=StrCMDSQL;

                       try
                         qryTmp.ExecSql;
                       except on ex2:exception do
                        showmessage(ex2.message);
                       end;

                       qryTmpMulheres.edit;
                       qryTmpMulheres.FieldByName('qtde_exames').asInteger:=qryTmpMulheres.FieldByName('qtde_exames').asInteger+1;
                       qryTmpMulheres.Post;
                       }
                   end;
                   Application.ProcessMessages;

                   qryAux2.Next;
                 end;
                 lblStatus.caption:='Percorrendo tabela temporária de mulheres e buscando procedimentos do indicador...';


               end;
             except on ex:exception do
              showmessage(ex.message);
             end;
          end;


           pb1.position:=nContador;
           inc(nContador);
           Application.ProcessMessages;
           qryTmpCriancas.next;
         end;
       end;
       ///// segunda parte

    end;
   Except on ex:Exception do
    showmessage(ex.message);
   end;

 finally
    qryTmpDetCriancas.free;
    qryTmpCriancas.free;
    qryTmp.free;
    qryAux3.free;
    qryAux2.free;
    qryAux1.free;
 end;
 result:=TemErro;

end;



procedure TFGerarIndicador.RzBitBtn1Click(Sender: TObject);
var
 TemErro:boolean;
begin
 case nrIndicador of
 1,2,3:
   begin
     TemErro:=GerarIndicador123();
     if TemErro then
      Application.MessageBox('Houve um erro na geração dos indicadores 1/2/3', 'Atenção', MB_ICONEXCLAMATION + MB_OK)
     else
      Application.MessageBox('INDICADORES 1,2 e 3 GERADOS COM SUCESSO!', 'Atenção', MB_ICONINFORMATION + MB_OK);
   end;
 4:
   begin
     TemErro:=GerarIndicador4();
     if TemErro then
      Application.MessageBox('Houve um erro na geração dos dados do indicador 4', 'Atenção', MB_ICONEXCLAMATION + MB_OK)
     else
      Application.MessageBox('INDICADOR 4 GERADO COM SUCESSO!', 'Atenção', MB_ICONINFORMATION + MB_OK);
   end;
 5:
   begin
     TemErro:=GerarIndicador5();
     if TemErro then
      Application.MessageBox('Houve um erro na geração dos dados do indicador 5', 'Atenção', MB_ICONEXCLAMATION + MB_OK)
     else
      Application.MessageBox('INDICADOR 5 GERADO COM SUCESSO!', 'Atenção', MB_ICONINFORMATION + MB_OK);
   end;
 end;
 pb1.visible:=false;
 lblGerados.visible:=false;
 close;
end;

end.
