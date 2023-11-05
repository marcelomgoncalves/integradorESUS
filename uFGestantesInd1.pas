unit uFGestantesInd1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, MemDS, DBAccess, Uni, Vcl.StdCtrls, RzCmboBx, RzButton,
  Vcl.DBCtrls, RzDBCmbo, Vcl.Mask, RzEdit, RzTabs, Math, Vcl.Buttons;

type
  TFGestantesInd1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    qryIndicador1Dentro: TUniQuery;
    dsIndicador1Dentro: TDataSource;
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
    TabSheet2: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Panel4: TPanel;
    lblRegDentro: TLabel;
    Panel6: TPanel;
    lblRegFora: TLabel;
    Panel7: TPanel;
    lblRegInco: TLabel;
    qryIndicador1Fora: TUniQuery;
    dsIndicador1Fora: TDataSource;
    qryInconsistencia: TUniQuery;
    dsInconsistencia: TDataSource;
    Panel8: TPanel;
    Panel9: TPanel;
    lblDenom_Estimado: TLabel;
    Panel10: TPanel;
    qryIndicador1DentroSEQUENCIA: TIntegerField;
    qryIndicador1DentroCNS: TStringField;
    qryIndicador1DentroCPF: TStringField;
    qryIndicador1DentroCNS_ALTERNATIVO: TStringField;
    qryIndicador1DentroCPF_ALTERNATIVO: TStringField;
    qryIndicador1DentroDATA_NASCIMENTO: TDateField;
    qryIndicador1DentroG_CO_DIM_TEMPO_DUM: TDateField;
    qryIndicador1DentroG_CO_DIM_TEMPO: TDateField;
    qryIndicador1DentroCIDADAO_ATIVO: TIntegerField;
    qryIndicador1DentroDATA_FALECIMENTO: TDateField;
    qryIndicador1DentroCIDADAO_NOME: TStringField;
    qryIndicador1DentroCIDADAO_MAE: TStringField;
    qryIndicador1DentroCIDADAO_FALECEU: TIntegerField;
    qryIndicador1DentroCIDADAO_SEXO: TStringField;
    qryIndicador1DentroCIND_GESTANTE: TIntegerField;
    qryIndicador1DentroCIND_HIPERTENSO: TIntegerField;
    qryIndicador1DentroCIND_DIABETICO: TIntegerField;
    qryIndicador1DentroCIND_SEXO: TStringField;
    qryIndicador1DentroCIND_MICRO_AREA: TStringField;
    qryIndicador1DentroCNS_RESP: TStringField;
    qryIndicador1DentroCPF_RESP: TStringField;
    qryIndicador1DentroCIND_INATIVO: TIntegerField;
    qryIndicador1DentroCNES: TStringField;
    qryIndicador1DentroCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryIndicador1DentroNOME_UNIDADE: TStringField;
    qryIndicador1DentroINE: TStringField;
    qryIndicador1DentroNOME_EQUIPE: TStringField;
    qryIndicador1DentroCALC_DDP: TDateField;
    qryIndicador1DentroCALC_20S: TDateField;
    qryIndicador1DentroCALC_FIMPUERP: TDateField;
    qryIndicador1DentroNU_UUID_FICHA: TStringField;
    qryIndicador1DentroNU_UUID_FICHA_ORIGEM: TStringField;
    qryIndicador1DentroNU_UUID_DADO_TRANSP: TStringField;
    qryIndicador1DentroCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I1_ULT_CONSULTA: TDateField;
    qryIndicador1DentroCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField;
    qryIndicador1DentroCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField;
    qryIndicador1DentroTELEFONE: TStringField;
    qryIndicador1DentroCIND_GESTANTE_I1_REGRA1: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I1_REGRA2: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I1_REGRA3: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField;
    qryIndicador1DentroCIND_GESTANTE_CIAP_FINALIZACAO: TStringField;
    qryIndicador1DentroCIND_GESTANTE_CID_FINALIZACAO: TStringField;
    qryIndicador1DentroCIND_GESTANTE_I1_FINALIZADA: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField;
    qryIndicador1DentroCALC_IG_DIAS: TIntegerField;
    qryIndicador1DentroCALC_IG_SEMANAS: TIntegerField;
    qryIndicador1DentroCALC_IG_MESES: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I2_REGRA1: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I2_REGRA2: TIntegerField;
    qryIndicador1DentroCIND_GESTANTE_I3_REGRA1: TIntegerField;
    qryIndicador1DentroINDICADOR1: TSmallintField;
    qryIndicador1DentroINDICADOR2: TSmallintField;
    qryIndicador1DentroINDICADOR3: TSmallintField;
    qryIndicador1DentroNCO1TRIM: TIntegerField;
    qryIndicador1DentroNCO2TRIM: TIntegerField;
    qryIndicador1DentroNCO3TRIM: TIntegerField;
    qryIndicador1ForaSEQUENCIA: TIntegerField;
    qryIndicador1ForaCNS: TStringField;
    qryIndicador1ForaCPF: TStringField;
    qryIndicador1ForaCNS_ALTERNATIVO: TStringField;
    qryIndicador1ForaCPF_ALTERNATIVO: TStringField;
    qryIndicador1ForaDATA_NASCIMENTO: TDateField;
    qryIndicador1ForaG_CO_DIM_TEMPO_DUM: TDateField;
    qryIndicador1ForaG_CO_DIM_TEMPO: TDateField;
    qryIndicador1ForaCIDADAO_ATIVO: TIntegerField;
    qryIndicador1ForaDATA_FALECIMENTO: TDateField;
    qryIndicador1ForaCIDADAO_NOME: TStringField;
    qryIndicador1ForaCIDADAO_MAE: TStringField;
    qryIndicador1ForaCIDADAO_FALECEU: TIntegerField;
    qryIndicador1ForaCIDADAO_SEXO: TStringField;
    qryIndicador1ForaCIND_GESTANTE: TIntegerField;
    qryIndicador1ForaCIND_HIPERTENSO: TIntegerField;
    qryIndicador1ForaCIND_DIABETICO: TIntegerField;
    qryIndicador1ForaCIND_SEXO: TStringField;
    qryIndicador1ForaCIND_MICRO_AREA: TStringField;
    qryIndicador1ForaCNS_RESP: TStringField;
    qryIndicador1ForaCPF_RESP: TStringField;
    qryIndicador1ForaCIND_INATIVO: TIntegerField;
    qryIndicador1ForaCNES: TStringField;
    qryIndicador1ForaCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryIndicador1ForaNOME_UNIDADE: TStringField;
    qryIndicador1ForaINE: TStringField;
    qryIndicador1ForaNOME_EQUIPE: TStringField;
    qryIndicador1ForaCALC_DDP: TDateField;
    qryIndicador1ForaCALC_20S: TDateField;
    qryIndicador1ForaCALC_FIMPUERP: TDateField;
    qryIndicador1ForaNU_UUID_FICHA: TStringField;
    qryIndicador1ForaNU_UUID_FICHA_ORIGEM: TStringField;
    qryIndicador1ForaNU_UUID_DADO_TRANSP: TStringField;
    qryIndicador1ForaCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I1_ULT_CONSULTA: TDateField;
    qryIndicador1ForaCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField;
    qryIndicador1ForaCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField;
    qryIndicador1ForaTELEFONE: TStringField;
    qryIndicador1ForaCIND_GESTANTE_I1_REGRA1: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I1_REGRA2: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I1_REGRA3: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField;
    qryIndicador1ForaCIND_GESTANTE_CIAP_FINALIZACAO: TStringField;
    qryIndicador1ForaCIND_GESTANTE_CID_FINALIZACAO: TStringField;
    qryIndicador1ForaCIND_GESTANTE_I1_FINALIZADA: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField;
    qryIndicador1ForaCALC_IG_DIAS: TIntegerField;
    qryIndicador1ForaCALC_IG_SEMANAS: TIntegerField;
    qryIndicador1ForaCALC_IG_MESES: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I2_REGRA1: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I2_REGRA2: TIntegerField;
    qryIndicador1ForaCIND_GESTANTE_I3_REGRA1: TIntegerField;
    qryIndicador1ForaINDICADOR1: TSmallintField;
    qryIndicador1ForaINDICADOR2: TSmallintField;
    qryIndicador1ForaINDICADOR3: TSmallintField;
    qryIndicador1ForaNCO1TRIM: TIntegerField;
    qryIndicador1ForaNCO2TRIM: TIntegerField;
    qryIndicador1ForaNCO3TRIM: TIntegerField;
    RzPageControl2: TRzPageControl;
    TabSheet4: TRzTabSheet;
    GridPanel1: TGridPanel;
    Panel11: TPanel;
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
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    TabSheet6: TRzTabSheet;
    SpeedButton1: TSpeedButton;
    Panel14: TPanel;
    Panel12: TPanel;
    lblIndice: TLabel;
    Panel13: TPanel;
    Panel15: TPanel;
    lblNumerador: TLabel;
    Label29: TLabel;
    lblDenominador: TLabel;
    qryInconsistenciaSEQUENCIA: TIntegerField;
    qryInconsistenciaCNS: TStringField;
    qryInconsistenciaCPF: TStringField;
    qryInconsistenciaCNS_ALTERNATIVO: TStringField;
    qryInconsistenciaCPF_ALTERNATIVO: TStringField;
    qryInconsistenciaDATA_NASCIMENTO: TDateField;
    qryInconsistenciaG_CO_DIM_TEMPO_DUM: TDateField;
    qryInconsistenciaG_CO_DIM_TEMPO: TDateField;
    qryInconsistenciaCIDADAO_ATIVO: TIntegerField;
    qryInconsistenciaDATA_FALECIMENTO: TDateField;
    qryInconsistenciaCIDADAO_NOME: TStringField;
    qryInconsistenciaCIDADAO_MAE: TStringField;
    qryInconsistenciaCIDADAO_FALECEU: TIntegerField;
    qryInconsistenciaCIDADAO_SEXO: TStringField;
    qryInconsistenciaCIND_GESTANTE: TIntegerField;
    qryInconsistenciaCIND_HIPERTENSO: TIntegerField;
    qryInconsistenciaCIND_DIABETICO: TIntegerField;
    qryInconsistenciaCIND_SEXO: TStringField;
    qryInconsistenciaCIND_MICRO_AREA: TStringField;
    qryInconsistenciaCNS_RESP: TStringField;
    qryInconsistenciaCPF_RESP: TStringField;
    qryInconsistenciaCIND_INATIVO: TIntegerField;
    qryInconsistenciaCNES: TStringField;
    qryInconsistenciaCO_SEQ_DIM_UNIDADE_SAUDE: TIntegerField;
    qryInconsistenciaNOME_UNIDADE: TStringField;
    qryInconsistenciaINE: TStringField;
    qryInconsistenciaNOME_EQUIPE: TStringField;
    qryInconsistenciaCALC_DDP: TDateField;
    qryInconsistenciaCALC_20S: TDateField;
    qryInconsistenciaCALC_FIMPUERP: TDateField;
    qryInconsistenciaNU_UUID_FICHA: TStringField;
    qryInconsistenciaNU_UUID_FICHA_ORIGEM: TStringField;
    qryInconsistenciaNU_UUID_DADO_TRANSP: TStringField;
    qryInconsistenciaCIND_GESTANTE_I1_NRCONSULTAS: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I1_ULT_CONSULTA: TDateField;
    qryInconsistenciaCIND_GESTANTE_I1_DT_FINALIZACAO: TDateField;
    qryInconsistenciaCIND_GESTANTE_I1_DTLIMITE_FIM: TDateField;
    qryInconsistenciaTELEFONE: TStringField;
    qryInconsistenciaCIND_GESTANTE_I1_REGRA1: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I1_REGRA2: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I1_REGRA3: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I1_DT_1A_CONSULTA: TDateField;
    qryInconsistenciaCIND_GESTANTE_CIAP_FINALIZACAO: TStringField;
    qryInconsistenciaCIND_GESTANTE_CID_FINALIZACAO: TStringField;
    qryInconsistenciaCIND_GESTANTE_I1_FINALIZADA: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I1_DSCFINALIZACAO: TStringField;
    qryInconsistenciaCALC_IG_DIAS: TIntegerField;
    qryInconsistenciaCALC_IG_SEMANAS: TIntegerField;
    qryInconsistenciaCALC_IG_MESES: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I2_REGRA1: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I2_REGRA2: TIntegerField;
    qryInconsistenciaCIND_GESTANTE_I3_REGRA1: TIntegerField;
    qryInconsistenciaINDICADOR1: TSmallintField;
    qryInconsistenciaINDICADOR2: TSmallintField;
    qryInconsistenciaINDICADOR3: TSmallintField;
    qryInconsistenciaNCO1TRIM: TIntegerField;
    qryInconsistenciaNCO2TRIM: TIntegerField;
    qryInconsistenciaNCO3TRIM: TIntegerField;
    DBGrid4: TDBGrid;
    qryDetConsultas: TUniQuery;
    qryDetConsultasID: TIntegerField;
    qryDetConsultasCPF: TStringField;
    qryDetConsultasCNS: TStringField;
    qryDetConsultasNU_CBO: TStringField;
    qryDetConsultasNO_CBO: TStringField;
    qryDetConsultasCO_DIM_TEMPO: TDateField;
    qryDetConsultasCIAPS: TStringField;
    qryDetConsultasCIDS: TStringField;
    qryDetConsultasCNS_PROFISSIONAL: TStringField;
    qryDetConsultasNO_PROFISSIONAL: TStringField;
    qryDetConsultasNU_INE: TStringField;
    qryDetConsultasNO_EQUIPE: TStringField;
    qryDetConsultasNOME_EQUIPE: TStringField;
    qryDetConsultasNO_CNES: TStringField;
    qryDetConsultasNO_UNIDADE_SAUDE: TStringField;
    dsDetConsultas: TDataSource;
    edNomeMae: TEdit;
    edSexo: TEdit;
    edDtNascto: TEdit;
    edCNSResp: TEdit;
    edCPFResp: TEdit;
    edCidFaleceu: TEdit;
    edDtObito: TEdit;
    edHipertenso: TEdit;
    edDiabetico: TEdit;
    edCidAtivo: TEdit;
    edCIndInativo: TEdit;
    edGestante: TEdit;
    edIGSemanas: TEdit;
    edIGMeses: TEdit;
    edNCO1Trim: TEdit;
    edNCO2Trim: TEdit;
    edNCO3Trim: TEdit;
    edCiapsTermino: TEdit;
    edCidsTermino: TEdit;
    edMotivoTermino: TEdit;
    edTelefone: TEdit;
    Label21: TLabel;
    edCNS: TEdit;
    Label26: TLabel;
    edCPF: TEdit;
    Label30: TLabel;
    Label31: TLabel;
    Panel16: TPanel;
    Panel17: TPanel;
    DBGrid3: TDBGrid;
    Panel18: TPanel;
    DBListBox1: TDBListBox;
    procedure FormCreate(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure LimparGrid;
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dsIndicador1DentroDataChange(Sender: TObject; Field: TField);
    procedure dsIndicador1ForaDataChange(Sender: TObject; Field: TField);
    procedure RzPageControl1Change(Sender: TObject);
    procedure qryIndicador1DentroCIDADAO_ATIVOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1DentroCIND_GESTANTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1DentroCIND_HIPERTENSOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1DentroCIND_DIABETICOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1DentroCIND_INATIVOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1DentroCIND_GESTANTE_I1_FINALIZADAGetText(
      Sender: TField; var Text: string; DisplayText: Boolean);
    procedure qryIndicador1DentroINDICADOR1GetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaCIDADAO_ATIVOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaCIDADAO_FALECEUGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaCIND_GESTANTEGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaCIND_HIPERTENSOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaCIND_DIABETICOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaCIND_INATIVOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaINDICADOR1GetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure qryIndicador1ForaCIND_GESTANTE_I1_FINALIZADAGetText(
      Sender: TField; var Text: string; DisplayText: Boolean);
    procedure edTermoChange(Sender: TObject);

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
  FGestantesInd1: TFGestantesInd1;
  SQLPADRAO:String;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TFGestantesInd1.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DataCol = 2) then
  begin
   DBGrid1.Canvas.Font.Color  := clGreen;
   DBGrid1.Canvas.Font.Style  := [fsBold];
  end;
  if (DataCol = 3) then
  begin
   DBGrid1.Canvas.Font.Color  := clRed;
   DBGrid1.Canvas.Font.Style  := [fsBold];
  end;
 if gdSelected in State then
  begin
    dbgrid1.Canvas.Font.Color := clHighlightText; //Fundo
    dbgrid1.Canvas.Brush.Color:= clHighlight; //Fonte
  end
  else
  begin
  end;

  //dbgrid1.Canvas.FillRect(Rect);
  //dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);
  dbgrid1.Canvas.FillRect(Rect);
  dbgrid1.DefaultDrawDataCell(Rect,Column.Field, State);
end;

procedure TFGestantesInd1.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if (DataCol = 2) then
  begin
   DBGrid2.Canvas.Font.Color  := clGreen;
   DBGrid2.Canvas.Font.Style  := [fsBold];
  end;
  if (DataCol = 3) then
  begin
   DBGrid2.Canvas.Font.Color  := clRed;
   DBGrid2.Canvas.Font.Style  := [fsBold];
  end;
 if gdSelected in State then
  begin
    dbgrid2.Canvas.Font.Color := clHighlightText; //Fundo
    dbgrid2.Canvas.Brush.Color:= clHighlight; //Fonte
  end
  else
  begin

  end;

  dbgrid2.Canvas.FillRect(Rect);
  dbgrid2.DefaultDrawDataCell(Rect,Column.Field, State);

//  dbgrid1.Canvas.FillRect(Rect);
//  dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);
end;

procedure TFGestantesInd1.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if gdSelected in State then
  begin
    dbgrid3.Canvas.Font.Color := clHighlightText; //Fundo
    dbgrid3.Canvas.Brush.Color:= clHighlight; //Fonte
  end
  else
  begin
    If odd(qryInconsistencia.RecNo) then
    begin
      dbgrid3.Canvas.Font.Color := clBlack;
      dbgrid3.Canvas.Brush.Color:= $00F2FFFF;
    end
    else
    begin
      dbgrid3.Canvas.Font.Color := clBlack;
      dbgrid3.Canvas.Brush.Color:= $00FFF9EA;
    end;
  end;

//  dbgrid1.Canvas.FillRect(Rect);
//  dbgrid1.Canvas.TextOut(Rect.Left + 2,Rect.Top, Column.Field.AsString);
  dbgrid3.Canvas.FillRect(Rect);
  dbgrid3.DefaultDrawDataCell(Rect,Column.Field, State);
end;

procedure TFGestantesInd1.dsIndicador1DentroDataChange(Sender: TObject;
  Field: TField);
begin
  qryDetConsultas.close;
  qryDetConsultas.ParamByName('sequencia').asInteger:=qryIndicador1Dentro.FieldByName('sequencia').asInteger;
  qryDetConsultas.Open;
  if rzPageControl1.ActivePageIndex = 0 then
   getInformacoes(qryIndicador1Dentro);

end;

procedure TFGestantesInd1.dsIndicador1ForaDataChange(Sender: TObject;
  Field: TField);
begin
  qryDetConsultas.close;
  qryDetConsultas.ParamByName('sequencia').asInteger:=qryIndicador1Fora.FieldByName('sequencia').asInteger;
  qryDetConsultas.Open;
  if rzPageControl1.ActivePageIndex = 1 then
   getInformacoes(qryIndicador1Fora);
end;

procedure TFGestantesInd1.edTermoChange(Sender: TObject);
var
 filtro:string;
begin
   filtro:='';
   if rzPageControl1.activePageIndex = 0 then
   begin
      if ((qryIndicador1Fora.Active) and (qryIndicador1Fora.RecordCount>0))then
      begin
        if edTermo.text<>'' then
        begin
           case StrToInt(cbbuscarpor.value) of
            0: filtro:='CIDADAO_NOME LIKE '+quotedStr(Trim(UpperCase(edTermo.text))+'%');      // Nome do Cidadão
            1: filtro:='CPF LIKE '+QuotedStr(Trim(edTermo.text)+'%');  // CPF do Cidadão
            2: filtro:='CNS LIKE '+QuotedStr(Trim(edTermo.text)+'%');   // CNS do Cidadão
            else
               filtro:='CIDADAO_NOME LIKE '+quotedStr(Trim(UpperCase(edTermo.text))+'%');      // Nome do Cidadão
           end;
           qryIndicador1Dentro.Filtered:=false;
           qryIndicador1Dentro.Filter:=filtro;  //'CIDADAO_NOME LIKE '+QuotedStr('%'+Trim(edTermo.text)+'%');
           qryIndicador1Dentro.Filtered:=true;
        end;
      end;
      qryIndicador1Dentro.Filtered:=false;
      qryIndicador1Dentro.Filter:=filtro;  //'CIDADAO_NOME LIKE '+QuotedStr('%'+Trim(edTermo.text)+'%');
      qryIndicador1Dentro.Filtered:=true;
   end
   else if rzPageControl1.activePageIndex = 1 then
   begin
      filtro:='';
      if ((qryIndicador1Fora.Active) and (qryIndicador1Fora.RecordCount>0))then
      begin
        if edTermo.text<>'' then
        begin
           case StrToInt(cbbuscarpor.value) of
            0: filtro:='CIDADAO_NOME LIKE '+quotedStr(Trim(UpperCase(edTermo.text))+'%');      // Nome do Cidadão
            1: filtro:='CPF LIKE '+QuotedStr(Trim(edTermo.text)+'%');  // CPF do Cidadão
            2: filtro:='CNS LIKE '+QuotedStr(Trim(edTermo.text)+'%');          // CNS do Cidadão
            else
               filtro:='CIDADAO_NOME LIKE '+quotedStr(Trim(UpperCase(edTermo.text))+'%');      // Nome do Cidadão
            end;
        end;
      end;
      qryIndicador1Fora.Filtered:=false;
      qryIndicador1Fora.Filter:=filtro;  //'CIDADAO_NOME LIKE '+QuotedStr('%'+Trim(edTermo.text)+'%');
      qryIndicador1Fora.Filtered:=true;
   end;

end;

procedure TFGestantesInd1.FormCreate(Sender: TObject);
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

procedure TFGestantesInd1.LimparGrid;
var
 filtro:String;
begin
  {todo:}
  qryIndicador1Dentro.close;
  qryIndicador1Fora.close;
  qryInconsistencia.close;
  dbgrid1.datasource:=nil;
  dbgrid2.datasource:=nil;
  dbgrid3.datasource:=nil;
  sleep(1000);
end;

procedure TFGestantesInd1.qryIndicador1DentroCIDADAO_ATIVOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1DentroCIND_DIABETICOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';

end;

procedure TFGestantesInd1.qryIndicador1DentroCIND_GESTANTEGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';

end;

procedure TFGestantesInd1.qryIndicador1DentroCIND_GESTANTE_I1_FINALIZADAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger <> 0 then
    text:='SIM'
  else
    text:='NÃO';

end;

procedure TFGestantesInd1.qryIndicador1DentroCIND_HIPERTENSOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';

end;

procedure TFGestantesInd1.qryIndicador1DentroCIND_INATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';

end;

procedure TFGestantesInd1.qryIndicador1DentroINDICADOR1GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';

end;

procedure TFGestantesInd1.qryIndicador1ForaCIDADAO_ATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1ForaCIDADAO_FALECEUGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1ForaCIND_DIABETICOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1ForaCIND_GESTANTEGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1ForaCIND_GESTANTE_I1_FINALIZADAGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger <> 0 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1ForaCIND_HIPERTENSOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1ForaCIND_INATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.qryIndicador1ForaINDICADOR1GetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if sender.AsString<>'' then
   if sender.asInteger = 1 then
    text:='SIM'
  else
    text:='NÃO';
end;

procedure TFGestantesInd1.RzBitBtn1Click(Sender: TObject);
var
 filtro:String;
 nIndice:double;
 nTotalGestantes:integer;
 res:integer;
 data_inicial,data_final:TDateTime;
begin
 limparGrid;
 qryIndicador1Dentro.close;
 qryIndicador1Fora.close;
 qryInconsistencia.close;

 data_inicial:=edDataInicial.date - 280;
 data_final:=edDataFinal.date - 280;

 if edDataInicial.text<>'' then                // Criando Filtro para Idades
 begin
  qryIndicador1Dentro.ParamByName('data_inicial').asDateTime:=Data_inicial;
  qryIndicador1Fora.ParamByName('data_inicial').asDateTime:=Data_inicial;
  qryInconsistencia.ParamByName('data_inicial').asDateTime:=Data_inicial;
 end;

 if edDataFinal.text<>'' then
 begin

   qryIndicador1Dentro.ParamByName('data_final').asDateTime:=Data_Final;
   qryIndicador1Fora.ParamByName('data_final').asDateTime:=Data_Final;
   qryInconsistencia.ParamByName('data_final').asDateTime:=Data_Final;
 end;

 if cbUnidade.Value<>'1' then
 begin
   qryIndicador1Dentro.sql[6]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador1Dentro.sql[6]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador1Fora.sql[6]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryIndicador1Fora.sql[6]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryInconsistencia.sql[6]:='';       //ParamByName('unidade_saude').asString:=cbUnidade.Value;
   qryInconsistencia.sql[6]:=' co_seq_dim_unidade_saude = :cod_unidade_saude '; //ParamByName('unidade_saude').asString:=cbUnidade.Value;

   qryIndicador1Dentro.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
   qryIndicador1Fora.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
   qryInconsistencia.ParamByName('cod_unidade_saude').asString:=cbUnidade.Value;
 end
 else
 begin
   qryIndicador1Dentro.sql[6]:=' 1=1 ';
   qryIndicador1Fora.sql[6]:=' 1=1 ';
   qryInconsistencia.sql[6]:=' 1=1 ';

 end;

 if cbMA.Value<>'999999' then
 begin
   qryIndicador1Dentro.sql[8]:=' cind_micro_area = '+quotedStr(cbMA.text);
   qryIndicador1Fora.sql[8]:=' cind_micro_area = '+quotedStr(cbMA.text);
   qryInconsistencia.sql[8]:=' cind_micro_area = '+quotedStr(cbMA.text);;

 end
 else
 begin
   qryIndicador1Dentro.sql[8]:=' 1=1';
   qryIndicador1Fora.sql[8]:=' 1=1';
   qryInconsistencia.sql[8]:=' 1=1';
 end;

 {
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


 dbgrid1.datasource:=dsIndicador1Dentro ;
 dbgrid2.datasource:=dsIndicador1Fora ;
 dbgrid3.datasource:=dsInconsistencia ;
 nIndice:=0.0;
 nTotalGestantes:=1;

 qryIndicador1Fora.open;
 qryInconsistencia.open;
 qryIndicador1Dentro.open;


 if ((qryIndicador1Dentro.recordCount<=0) and (qryIndicador1fora.recordCount<=0)) then
 begin
//-   Application.MessageBox('Não há dados com os parâmetros informados na consulta!','Atenção', MB_ICONINFORMATION + MB_OK);
    abort;
 end;

 lblRegDentro.Caption:='Registros Selecionados:'+IntToStr(qryIndicador1Dentro.RecordCount);
 lblRegFora.Caption:='Registros Selecionados:'+IntToStr(qryIndicador1Fora.RecordCount);
 lblRegInco.Caption:='Registros Selecionados:'+IntToStr(qryInconsistencia.RecordCount);

 nTotalGestantes := qryIndicador1Dentro.RecordCount + qryIndicador1Fora.RecordCount;
 if qryIndicador1Dentro.Recordcount = 0 then
  nIndice:=0.0
 else
  nIndice:=(qryIndicador1Dentro.Recordcount /  nTotalGestantes) * 100;
 lblNumerador.caption:='NUMERADOR:'+LeftPad(qryIndicador1Dentro.RecordCount.ToString,2,'0');
 lblDenominador.caption:='DENOMINADOR:'+LeftPad(nTotalGestantes.toString(),2,'0');
 if cbUnidade.Value<>'1' then
  lblDenom_Estimado.caption:=FormatFloat('#####',objConfiguracao.dn_estimado01)
 else
  lblDenom_Estimado.caption:=FormatFloat('#####',objConfiguracao.dn_estimado01)+' - '+ FormatFloat('0.##',(nTotalGestantes/ objConfiguracao.dn_estimado01)*100)+' %' ;
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


end;


procedure TFGestantesInd1.RzPageControl1Change(Sender: TObject);
begin
  if rzPageControl1.ActivePageIndex = 1 then
  begin
   qryIndicador1Dentro.close;
   qryIndicador1Fora.open;
   getInformacoes(qryIndicador1Fora);
  end;

  if rzPageControl1.ActivePageIndex = 0 then
  begin
   qryIndicador1Dentro.open;
   qryIndicador1Fora.close;
   getInformacoes(qryIndicador1Dentro);
  end;
end;

procedure TFGestantesInd1.SpeedButton1Click(Sender: TObject);
var
 pathFile1:String;
 pathFile2:String;
 pathApp:string;
begin

if (qryIndicador1Dentro.recordCount>0) and (qryIndicador1Fora.recordCount>0) then
begin

  pathAPP := extractfilePath(Application.exeName);

  if not DirectoryExists(pathAPP + 'Arquivos') then
    ForceDirectories(pathAPP + 'Arquivos');

  pathFile1:=PathAPP+'Arquivos\Ind1'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_dentro.xls';
  ExpXLS(qryIndicador1Dentro, pathFile1);
  pathFile2:=PathAPP+'Arquivos\Ind1'+StringReplace(cbUnidade.text,' ','_',[rfReplaceAll, rfIgnoreCase])+'_fora.xls';
  ExpXLS(qryIndicador1Fora, pathFile2);

  ShowFolder(PathAPP + 'Arquivos');
end;

end;

procedure TFGestantesInd1.getInformacoes(ds:TDataset);
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

 if ((ds.FieldByName('CIND_HIPERTENSO').asString<>'') and (ds.FieldByName('CIND_HIPERTENSO').asString = '1')) then
  edHipertenso.text:='SIM'
 else
  edHipertenso.text:='NÃO';

 if ((ds.FieldByName('CIND_DIABETICO').asString<>'') and (ds.FieldByName('CIND_DIABETICO').asString = '1')) then
  edDiabetico.text:='SIM'
 else
  edDiabetico.text:='NÃO';

 if ((ds.FieldByName('CIND_GESTANTE').asString<>'') and (ds.FieldByName('CIND_GESTANTE').asString = '1')) then
  edGestante.text:='SIM'
 else
  edGestante.text:='NÃO';

 edIGSemanas.text:=ds.FieldByName('CALC_IG_SEMANAS').asString;
 edIGMeses.text:=ds.FieldByName('CALC_IG_MESES').asString;
 edNCO1Trim.text:=ds.FieldByName('NCO1TRIM').asString;
 edNCO2Trim.text:=ds.FieldByName('NCO2TRIM').asString;
 edNCO3Trim.text:=ds.FieldByName('NCO3TRIM').asString;
 edCiapsTermino.text:=ds.FieldByName('CIND_GESTANTE_CIAP_FINALIZACAO').asString;
 edCidsTermino.text:=ds.FieldByName('CIND_GESTANTE_CID_FINALIZACAO').asString;
 edMotivoTermino.text:=ds.FieldByName('CIND_GESTANTE_I1_DSCFINALIZACAO').asString;
end;

end.
