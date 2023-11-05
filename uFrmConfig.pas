unit uFrmConfig;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, RzLabel, Vcl.ExtCtrls,
  RzPanel, RzButton, Vcl.Buttons, FileCtrl, RzTabs, Vcl.WinXCtrls;

type
  TfrmConfig = class(TForm)
    RzPanel1: TRzPanel;
    RzLabel1: TRzLabel;
    Panel1: TPanel;
    RzPanel8: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    RzPageControl1: TRzPageControl;
    TabSheet1: TRzTabSheet;
    TabSheet3: TRzTabSheet;
    RzPanel9: TRzPanel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    RzPanel10: TRzPanel;
    RzLabel5: TRzLabel;
    edtDatabase: TEdit;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    edtServidor: TEdit;
    edtPortaServidor: TEdit;
    RzPanel6: TRzPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    RzPanel7: TRzPanel;
    RzLabel4: TRzLabel;
    edtContaEmail: TEdit;
    edtServidorSMTP: TEdit;
    chkUsarTLS: TCheckBox;
    edtPorta: TEdit;
    edtSenhaEmail: TEdit;
    edtContaEmailContador: TEdit;
    edtNomeEmpresa: TEdit;
    edtAssunto: TEdit;
    TabSheet2: TRzTabSheet;
    RzPanel2: TRzPanel;
    Label1: TLabel;
    RzPanel3: TRzPanel;
    RzLabel2: TRzLabel;
    edtImunobiologicos: TEdit;
    Panel2: TPanel;
    RzPanel4: TRzPanel;
    RzPanel5: TRzPanel;
    RzLabel3: TRzLabel;
    edtDenominador01: TEdit;
    edtDenominador02: TEdit;
    edtDenominador03: TEdit;
    edtDenominador04: TEdit;
    edtDenominador05: TEdit;
    edtDenominador06: TEdit;
    edtDenominador07: TEdit;
    edtDenominador08: TEdit;
    Label24: TLabel;
    edtDenominador09: TEdit;
    Label25: TLabel;
    edtDenominador10: TEdit;
    Label26: TLabel;
    edtDenominador11: TEdit;
    Label27: TLabel;
    edtDenominador12: TEdit;
    Label28: TLabel;
    edtDenominador13: TEdit;
    Label29: TLabel;
    edtDenominador14: TEdit;
    Label30: TLabel;
    edtDenominador15: TEdit;
    Label31: TLabel;
    edtDenominador16: TEdit;
    Label32: TLabel;
    edtDenominador17: TEdit;
    Label33: TLabel;
    edtDenominador18: TEdit;
    Label34: TLabel;
    edtDenominador19: TEdit;
    Label35: TLabel;
    edtDenominador20: TEdit;
    Label36: TLabel;
    edtDenominador21: TEdit;
    Label37: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    RzPanel11: TRzPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    RzPanel12: TRzPanel;
    RzLabel6: TRzLabel;
    edtDataBaseLocal: TEdit;
    edtUsuarioLocal: TEdit;
    edtSenhaLocal: TEdit;
    edtServidorLocal: TEdit;
    edtPortaDBLocal: TEdit;
    RzPanel13: TRzPanel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    RzPanel14: TRzPanel;
    RzLabel7: TRzLabel;
    edtCodIBGE: TEdit;
    edtPopulacao: TEdit;
    tsPandemia: TToggleSwitch;
    procedure RzBitBtn1Click(Sender: TObject);
    procedure SalvarInformacoes;
    procedure FormCreate(Sender: TObject);
    procedure Reconfigura;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmConfig: TfrmConfig;

implementation

{$R *.dfm}

uses uDM, uFuncoes;

procedure TfrmConfig.FormCreate(Sender: TObject);
begin
 try
   edtDatabase.text     :=LeIni(ArqConfig,'Configuracao','Database');
   edtUsuario.text      :=LeIni(ArqConfig,'Configuracao','Usuario_DB');
   edtSenha.text        :=LeIni(ArqConfig,'Configuracao','Senha_DB');
   edtServidor.text     :=LeIni(ArqConfig,'Configuracao','Servidor_DB');
   edtPortaServidor.text:=LeIni(ArqConfig,'Configuracao','Porta_DB','0');

   edtDatabaseLocal.text     :=LeIni(ArqConfig,'Configuracao','Database_local');
   edtUsuarioLocal.text      :=LeIni(ArqConfig,'Configuracao','Usuario_DB_local');
   edtSenhaLocal.text        :=LeIni(ArqConfig,'Configuracao','Senha_DB_local');
   edtServidorLocal.text     :=LeIni(ArqConfig,'Configuracao','Servidor_DB_local');
   edtPortaDBLocal.text      :=LeIni(ArqConfig,'Configuracao','Porta_DB_local','0');

   edtContaEmail.text      :=LeIni(ArqConfig,'Configuracao','ContaEmailEnvio');
   edtSenhaEmail.text      :=LeIni(ArqConfig,'Configuracao','SenhaContaEmail');
   edtServidorSMTP.text    :=LeIni(ArqConfig,'Configuracao','ServidorSMTP','smtp.gmail.com');
   edtNomeEmpresa.text     :=LeIni(ArqConfig,'Configuracao','NomeEmpresa');
   edtAssunto.text         :=LeIni(ArqConfig,'Configuracao','Assunto');
   edtCodIBGE.text         :=LeIni(ArqConfig,'Configuracao','CodigoIBGEMunicipio','3303005');
   edtPopulacao.text       :=LeIni(ArqConfig,'Configuracao','PopulacaoIBGE','0');

   if LeIni(ArqConfig,'Configuracao','Periodo_de_Pandemia','0') = '1' then
     tsPandemia.State := tssON
   else
     tsPandemia.State := tssOFF;

   edtDenominador01.text   :=LeIni(ArqConfig,'Denominadores','D_E_01','10');
   edtDenominador02.text   :=LeIni(ArqConfig,'Denominadores','D_E_02','10');
   edtDenominador03.text   :=LeIni(ArqConfig,'Denominadores','D_E_03','10');
   edtDenominador04.text   :=LeIni(ArqConfig,'Denominadores','D_E_04','10');
   edtDenominador05.text   :=LeIni(ArqConfig,'Denominadores','D_E_05','10');
   edtDenominador06.text   :=LeIni(ArqConfig,'Denominadores','D_E_06','10');
   edtDenominador07.text   :=LeIni(ArqConfig,'Denominadores','D_E_07','10');
   edtDenominador08.text   :=LeIni(ArqConfig,'Denominadores','D_E_08','10');
   edtDenominador09.text   :=LeIni(ArqConfig,'Denominadores','D_E_09','10');
   edtDenominador10.text   :=LeIni(ArqConfig,'Denominadores','D_E_10','10');
   edtDenominador11.text   :=LeIni(ArqConfig,'Denominadores','D_E_11','10');
   edtDenominador12.text   :=LeIni(ArqConfig,'Denominadores','D_E_12','10');
   edtDenominador13.text   :=LeIni(ArqConfig,'Denominadores','D_E_13','10');
   edtDenominador14.text   :=LeIni(ArqConfig,'Denominadores','D_E_14','10');
   edtDenominador15.text   :=LeIni(ArqConfig,'Denominadores','D_E_15','10');
   edtDenominador16.text   :=LeIni(ArqConfig,'Denominadores','D_E_16','10');
   edtDenominador17.text   :=LeIni(ArqConfig,'Denominadores','D_E_17','10');
   edtDenominador18.text   :=LeIni(ArqConfig,'Denominadores','D_E_18','10');
   edtDenominador19.text   :=LeIni(ArqConfig,'Denominadores','D_E_19','10');
   edtDenominador20.text   :=LeIni(ArqConfig,'Denominadores','D_E_20','10');
   edtDenominador21.text   :=LeIni(ArqConfig,'Denominadores','D_E_21','10');
   edtImunobiologicos.Text :=LeIni(ArqConfig,'Configuracao','Imunobiologicos','22,42');

   if LeIni(ArqConfig,'Configuracao','UsarTLS','S') = 'S' then
    chkUsarTLS.Checked:=true
   else
     chkUsarTLS.Checked:=false;

   edtPorta.text:=LeIni(ArqConfig,'Configuracao','PortaSMTP','587');
   edtContaEmailContador.text:=LeIni(ArqConfig,'Configuracao','EmailContador');
 except on ex:Exception do
  begin
    Application.MessageBox('Houve um erro ao Ler o Arquivo de configurações do aplicativo!','Aviso',MB_ICONINFORMATION + MB_OK);
    exit;
  end;
 end;

end;

procedure TfrmConfig.FormShow(Sender: TObject);
begin
  rzPageControl1.ActivePageIndex:=0;
end;

procedure TfrmConfig.Reconfigura;
begin
 try
  objConfiguracao.DBEsus:= LeIni(ArqConfig,'Configuracao','Database');
  objConfiguracao.UsuarioDBEsus:= LeIni(ArqConfig,'Configuracao','Usuario_DB');
  objConfiguracao.SenhaDBEsus:= LeIni(ArqConfig,'Configuracao','Senha_DB');
  objConfiguracao.ServidorDBEsus:= LeIni(ArqConfig,'Configuracao','Servidor_DB');
  objConfiguracao.PortaDBEsus:= StrToInt(LeIni(ArqConfig,'Configuracao','Porta_DB','0'));

  objConfiguracao.DBLocal:= LeIni(ArqConfig,'Configuracao','Database_Local');
  objConfiguracao.UsuarioDBLocal:= LeIni(ArqConfig,'Configuracao','Usuario_DB_local');
  objConfiguracao.SenhaDBLocal:= LeIni(ArqConfig,'Configuracao','Senha_DB_local');
  objConfiguracao.ServidorDBLocal:= LeIni(ArqConfig,'Configuracao','Servidor_DB_local');
  objConfiguracao.PortaDBLocal:= StrToInt(LeIni(ArqConfig,'Configuracao','Porta_DB_local','0'));

  objConfiguracao.smtpServer:= LeIni(ArqConfig,'Configuracao','ServidorSMTP','smtp.gmail.com');
  objConfiguracao.userName := LeIni(ArqConfig,'Configuracao','ContaEmailEnvio');
  objConfiguracao.password:= LeIni(ArqConfig,'Configuracao','SenhaContaEmail');
  objConfiguracao.smtpPorta:=StrToInt(LeIni(ArqConfig,'Configuracao','PortaSMTP','587'));
  objConfiguracao.UsarTLS:= LeIni(ArqConfig,'Configuracao','UsarTLS','S');
  objConfiguracao.emailContador:= LeIni(ArqConfig,'Configuracao','EmailContador');
  objConfiguracao.nomeEmpresa:= LeIni(ArqConfig,'Configuracao','NomeEmpresa');
  objConfiguracao.Assunto:= LeIni(ArqConfig,'Configuracao','Assunto');
  objConfiguracao.CodIBGE:=LeIni(ArqConfig,'Configuracao','CodigoIBGEMunicipio','3303005');
  objConfiguracao.PopulacaoIBGE:=StrToInt(LeIni(ArqConfig,'Configuracao','PopulacaoIBGE','0'));
  objConfiguracao.PeriodoPandemia:=StrToInt(LeIni(ArqConfig,'Configuracao','Periodo_de_Pandemia','0'));
  // carrega denominadores estimados
  objConfiguracao.dn_estimado01:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_01','10'));
  objConfiguracao.dn_estimado02:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_02','10'));
  objConfiguracao.dn_estimado03:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_03','10'));
  objConfiguracao.dn_estimado04:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_04','10'));
  objConfiguracao.dn_estimado05:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_05','10'));
  objConfiguracao.dn_estimado06:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_06','10'));
  objConfiguracao.dn_estimado07:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_07','10'));
  objConfiguracao.dn_estimado08:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_08','10'));
  objConfiguracao.dn_estimado09:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_09','10'));
  objConfiguracao.dn_estimado10:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_10','10'));
  objConfiguracao.dn_estimado11:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_11','10'));
  objConfiguracao.dn_estimado12:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_12','10'));
  objConfiguracao.dn_estimado13:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_13','10'));
  objConfiguracao.dn_estimado14:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_14','10'));
  objConfiguracao.dn_estimado15:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_15','10'));
  objConfiguracao.dn_estimado16:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_16','10'));
  objConfiguracao.dn_estimado17:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_17','10'));
  objConfiguracao.dn_estimado18:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_18','10'));
  objConfiguracao.dn_estimado19:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_19','10'));
  objConfiguracao.dn_estimado20:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_20','10'));
  objConfiguracao.dn_estimado21:=StrToInt(LeIni(ArqConfig,'Denominadores','D_E_21','10'));
  objConfiguracao.Imunobiologicos:=LeIni(ArqConfig,'Configuracao','Imunobiologicos','22,42');
  conectadb();
 except on e:Exception do
   showmessage(e.message);
 end;
end;

procedure TfrmConfig.RzBitBtn1Click(Sender: TObject);
begin
 SalvarInformacoes;
end;


procedure TfrmConfig.SalvarInformacoes;
begin
 {todo}

 try
   GravaIni(ArqConfig,'Configuracao','Database',trim(edtDatabase.text));
   GravaIni(ArqConfig,'Configuracao','Usuario_DB',trim(edtUsuario.text));
   GravaIni(ArqConfig,'Configuracao','Senha_DB',trim(edtSenha.text));
   GravaIni(ArqConfig,'Configuracao','Servidor_DB',trim(edtServidor.text));
   GravaIni(ArqConfig,'Configuracao','Porta_DB',trim(edtPortaServidor.text));

   GravaIni(ArqConfig,'Configuracao','Database_local',trim(edtDatabaseLocal.text));
   GravaIni(ArqConfig,'Configuracao','Usuario_DB_local',trim(edtUsuariolocal.text));
   GravaIni(ArqConfig,'Configuracao','Senha_DB_local',trim(edtSenhaLocal.text));
   GravaIni(ArqConfig,'Configuracao','Servidor_DB_local',trim(edtServidorLocal.text));
   GravaIni(ArqConfig,'Configuracao','Porta_DB_local',trim(edtPortaDBLocal.text));

   GravaIni(ArqConfig,'Configuracao','ContaEmailEnvio',trim(edtContaEmail.text));
   GravaIni(ArqConfig,'Configuracao','SenhaContaEmail',trim(edtSenhaEmail.text));
   GravaIni(ArqConfig,'Configuracao','ServidorSMTP',trim(edtServidorSMTP.text));

   if chkUsarTLS.checked then
    GravaIni(ArqConfig,'Configuracao','UsarTLS','S')
   else
     GravaIni(ArqConfig,'Configuracao','UsarTLS','N');

   GravaIni(ArqConfig,'Configuracao','PortaSMTP',trim(edtPorta.text));
   GravaIni(ArqConfig,'Configuracao','EmailContador',trim(edtContaEmailContador.text));
   GravaIni(ArqConfig,'Configuracao','NomeEmpresa',trim(edtNomeEmpresa.text));
   GravaIni(ArqConfig,'Configuracao','Assunto',trim(edtAssunto.text));
   GravaIni(ArqConfig,'Configuracao','CodigoIBGEMunicipio',trim(edtCodIBGE.text));
   GravaIni(ArqConfig,'Configuracao','PopulacaoIBGE',trim(edtPopulacao.text));
   if tsPandemia.State = tssOFF then
    GravaIni(ArqConfig,'Configuracao','Periodo_de_Pandemia','0')
   else
    GravaIni(ArqConfig,'Configuracao','Periodo_de_Pandemia','1');

    // gravando denominadores estimados
   GravaIni(ArqConfig,'Denominadores','D_E_01',trim(edtDenominador01.text));
   GravaIni(ArqConfig,'Denominadores','D_E_02',trim(edtDenominador02.text));
   GravaIni(ArqConfig,'Denominadores','D_E_03',trim(edtDenominador03.text));
   GravaIni(ArqConfig,'Denominadores','D_E_04',trim(edtDenominador04.text));
   GravaIni(ArqConfig,'Denominadores','D_E_05',trim(edtDenominador05.text));
   GravaIni(ArqConfig,'Denominadores','D_E_06',trim(edtDenominador06.text));
   GravaIni(ArqConfig,'Denominadores','D_E_07',trim(edtDenominador07.text));
   GravaIni(ArqConfig,'Denominadores','D_E_08',trim(edtDenominador08.text));
   GravaIni(ArqConfig,'Denominadores','D_E_09',trim(edtDenominador09.text));
   GravaIni(ArqConfig,'Denominadores','D_E_10',trim(edtDenominador10.text));
   GravaIni(ArqConfig,'Denominadores','D_E_11',trim(edtDenominador11.text));
   GravaIni(ArqConfig,'Denominadores','D_E_12',trim(edtDenominador12.text));
   GravaIni(ArqConfig,'Denominadores','D_E_13',trim(edtDenominador13.text));
   GravaIni(ArqConfig,'Denominadores','D_E_14',trim(edtDenominador14.text));
   GravaIni(ArqConfig,'Denominadores','D_E_15',trim(edtDenominador15.text));
   GravaIni(ArqConfig,'Denominadores','D_E_16',trim(edtDenominador16.text));
   GravaIni(ArqConfig,'Denominadores','D_E_17',trim(edtDenominador17.text));
   GravaIni(ArqConfig,'Denominadores','D_E_18',trim(edtDenominador18.text));
   GravaIni(ArqConfig,'Denominadores','D_E_19',trim(edtDenominador19.text));
   GravaIni(ArqConfig,'Denominadores','D_E_20',trim(edtDenominador20.text));
   GravaIni(ArqConfig,'Denominadores','D_E_21',trim(edtDenominador21.text));

   GravaIni(ArqConfig,'Configuracao','Imunobiologicos',trim(edtImunobiologicos.text));

 except on ex:Exception do
  begin
    Application.MessageBox('Houve um erro ao gravar as configurações do aplicativo!','Aviso',MB_ICONINFORMATION + MB_OK);
    exit;
  end;
 end;
 //-----------
 Reconfigura;
 //-----------
 Application.MessageBox('Arquivo de Configuração gravado com sucesso!','Aviso',MB_ICONINFORMATION + MB_OK);
 close;
end;

end.
