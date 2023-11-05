unit uFCidadao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls, RzCmboBx, RzButton,
  Vcl.DBCtrls, RzDBCmbo;

type
  TFCidadao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    QryCidadao: TUniQuery;
    dsCidadao: TDataSource;
    Panel4: TPanel;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    QryCidadaoco_seq_cds_cad_individual: TLargeintField;
    QryCidadaodt_cad_individual: TDateField;
    QryCidadaono_cidadao: TStringField;
    QryCidadaoco_sexo: TLargeintField;
    QryCidadaonu_cpf_cidadao: TStringField;
    QryCidadaonu_cns: TStringField;
    QryCidadaodt_nascimento: TDateField;
    QryCidadaoidade: TFloatField;
    QryCidadaomunic_resid: TStringField;
    QryCidadaono_unidade_saude: TStringField;
    QryCidadaocns_prof: TStringField;
    QryCidadaocnes: TStringField;
    QryCidadaoine: TStringField;
    QryCidadaoraca_cor: TStringField;
    QryCidadaonacionalidade: TStringField;
    cbBuscarpor: TRzComboBox;
    edIdadeInicial: TEdit;
    edIdadeFinal: TEdit;
    cbGenero: TRzComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RzBitBtn1: TRzBitBtn;
    edTermo: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    qryUnidade: TUniQuery;
    qryEquipe: TUniQuery;
    dsUnidade: TDataSource;
    dsEquipe: TDataSource;
    qryUnidadeco_seq_dim_unidade_saude: TLargeintField;
    qryUnidadeno_unidade_saude: TStringField;
    cbUnidade: TRzComboBox;
    cbEquipe: TRzComboBox;
    QryCidadaono_equipe: TStringField;
    QryCidadaosg_sexo: TStringField;
    lblRegistros: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
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
  FCidadao: TFCidadao;
  SQLPADRAO:String;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TFCidadao.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if gdSelected in State then
  begin
    dbgrid1.Canvas.Font.Color := clHighlightText; //Fundo
    dbgrid1.Canvas.Brush.Color:= clHighlight; //Fonte
  end
  else
  begin
    If odd(qryCidadao.RecNo) then
    begin
      dbgrid1.Canvas.Font.Color := clBlack;
      dbgrid1.Canvas.Brush.Color:= $00F2FFFF;
    end
    else
    begin
      dbgrid1.Canvas.Font.Color := clBlack;
      dbgrid1.Canvas.Brush.Color:= $00FFF9EA;
    end;
  end;

  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);
end;

procedure TFCidadao.FormCreate(Sender: TObject);
var
 filtroInicial :string;
begin
  SQLPADRAO:='select distinct on (tb_cds_cad_individual.co_seq_cds_cad_individual) '+crlf+
  'tb_cds_cad_individual.co_seq_cds_cad_individual, '+crlf+
  'tb_cds_cad_individual.dt_cad_individual::date, '+crlf+
  'tb_cds_cad_individual.no_cidadao , '+crlf+
  'tb_cds_cad_individual.co_sexo, '+crlf+
  'tb_fat_cad_individual.nu_cpf_cidadao , '+crlf+
  'tb_fat_cad_individual.nu_cns , '+crlf+
  'tb_fat_cad_individual.dt_nascimento, '+crlf+
  '(extract(year from age(current_date,tb_fat_cad_individual.dt_nascimento))) as idade, '+crlf+
  '(select no_municipio from tb_dim_municipio where co_seq_dim_municipio = tb_fat_cad_individual.co_dim_municipio) as MUNIC_RESID, '+crlf+
  'tb_dim_unidade_saude.no_unidade_saude, '+crlf+
  'tb_dim_unidade_saude.co_seq_dim_unidade_saude, '+crlf+
  'tb_dim_equipe.no_equipe, '+crlf+
  'tb_dim_equipe.co_seq_dim_equipe, '+crlf+
  'tb_dim_sexo.sg_sexo, '+crlf+
  '(select nu_cns from tb_cds_prof where co_seq_cds_prof = tb_cds_cad_individual.co_cds_prof_cadastrante) as CNS_PROF, '+crlf+
  'tb_dim_unidade_saude.nu_cnes as CNES, '+crlf+
  '(select nu_ine from tb_dim_equipe where co_seq_dim_equipe = tb_fat_cad_individual.co_dim_equipe) as INE, '+crlf+
  '--(select sg_sexo from tb_dim_sexo where co_seq_dim_sexo = tb_fat_cad_individual.co_dim_sexo) as SEXO, '+crlf+
  '(select ds_raca_cor from tb_dim_raca_cor where co_seq_dim_raca_cor = tb_fat_cad_individual.co_dim_raca_cor) as RACA_COR, '+crlf+
  '(select ds_nacionalidade from tb_dim_nacionalidade where co_seq_dim_nacionalidade = tb_fat_cad_individual.co_dim_nacionalidade) as nacionalidade '+crlf+
  'from tb_cds_cad_individual '+crlf+
  'inner join tb_fat_cad_individual on tb_fat_cad_individual.nu_uuid_ficha = tb_cds_cad_individual.co_unico_ficha '+crlf+
  '--inner join tb_cds_cidadao_resposta on co_cds_cad_individual = co_seq_cds_cad_individual '+crlf+
  'inner join tb_dim_unidade_saude on tb_dim_unidade_saude.co_seq_dim_unidade_saude = tb_fat_cad_individual.co_dim_unidade_saude '+crlf+
  'inner join tb_dim_equipe on tb_dim_equipe.co_seq_dim_equipe = tb_fat_cad_individual.co_dim_equipe '+crlf+
  'inner join tb_dim_sexo on tb_dim_sexo.co_seq_dim_sexo = tb_fat_cad_individual.co_dim_sexo '+crlf+
  'where tb_cds_cad_individual.st_versao_atual = 1 and tb_cds_cad_individual.st_ficha_inativa = 0 '+crlf+
  'and tb_cds_cad_individual.dt_obito is null '+crlf;


  filtroInicial:=' and tb_cds_cad_individual.co_seq_cds_cad_individual = -1';


  qryCidadao.close;
  qryCidadao.sql.clear;
  qryCidadao.sql.text:=SQLPADRAO + filtroInicial;
  qryCidadao.open;

  qryUnidade.open;
  qryEquipe.open;

  carregaComboBox(qryUnidade, cbUnidade);
  carregaComboBox(qryEquipe, cbEquipe);


end;

procedure TFCidadao.LimparGrid;
var
 filtro:String;
begin
  {todo:}
  qryCidadao.close;
  dbgrid1.datasource:=nil;
  sleep(1000);
end;

procedure TFCidadao.RzBitBtn1Click(Sender: TObject);
var
 filtro:String;
begin
 limparGrid;
 qryCidadao.close;
 qryCidadao.sql.clear;
 qryCidadao.sql.text:='WITH cidadao as ('+SQLPADRAO+')'+crlf;

 filtro:='SELECT * from Cidadao WHERE 1=1 '+crlf;

{ if ((edTermo.text='') and (cbGenero.ItemIndex=2) and (edIdadeInicial.text='')
     and (edIdadeFinal.text='')) then
 begin

    qryCidadao.open;
 end;
}
 if edIdadeInicial.text<>'' then                // Criando Filtro para Idades
 begin
   filtro:=filtro+' and idade>='+trim(edIdadeInicial.text)+' ';
   if edIdadeFinal.text<>'' then
     filtro:=filtro+' and idade<='+trim(edIdadeFinal.text)+' ';
 end;

 if cbGenero.Value <>'N' then                  // Filtro Gênero
  filtro:=filtro+' and sg_sexo = '+QuotedStr(Trim(cbGenero.Value));


 if cbUnidade.Value<>'1' then
  filtro:=filtro+' and co_seq_dim_unidade_saude =  '+cbUnidade.Value;

 if cbEquipe.Value<>'1' then
  filtro:=filtro+' and co_seq_dim_equipe =  '+cbEquipe.Value;

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

 qryCidadao.sql.add(filtro);

 //showmessage(qryCidadao.sql.text);
 qryCidadao.open;
 dbgrid1.datasource:=dsCidadao ;
 lblRegistros.Caption:='Registros Selecionados:'+IntToStr(qryCidadao.RecordCount);
end;


end.
