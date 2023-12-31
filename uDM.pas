//---------------------------------------------------------------------------//
// Projeto: integraEsus
// Sistema de integrador com ESUS para gest�o de dados do programa PrevineBrasil
//
// Direitos Autorais Reservados (c) 2023 Marcelo M. Gon�alves
//
// Voc� pode obter a �ltima vers�o desse arquivo no GitHub
// URL: https://github.com/marcelomgoncalves/integradorESUS
//
// Este sistema � software livre; voc� pode redistribu�-la e/ou modific�-la
// sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela
// Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio)
// qualquer vers�o posterior.
//
// Este sistema � distribu�da na expectativa de que seja �til, por�m, SEM
// NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU
// ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral
// Menor do GNU para mais detalhes.
//
// Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto
// com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,
// no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.
// Voc� tamb�m pode obter uma copia da licen�a em:
// http://www.opensource.org/licenses/lgpl-license.php
//
// Marcelo M. Gon�alves - marcelomgoncalves@gmail.com
//---------------------------------------------------------------------------//
unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, DBAccess, Uni, UniProvider,
  MySQLUniProvider, vcl.Forms, WinAPI.Windows, PostgreSQLUniProvider,
  InterBaseUniProvider;

type

  TDM = class(TDataModule)
    conexaoEsus: TUniConnection;
    PGSQLProvider: TPostgreSQLUniProvider;
    ConexaoLocal: TUniConnection;
    InterBaseUniProvider1: TInterBaseUniProvider;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

  type
    TConfiguracao = class
    DbEsus:string;
    usuarioDBEsus: string;
    senhaDBEsus: string;
    ServidorDBEsus:string;
    PortaDBEsus:integer;
    DbLocal:string;
    usuarioDBLocal: string;
    senhaDBLocal: string;
    ServidorDBLocal:string;
    PortaDBLocal:integer;
    smtpPorta: integer;
    SmtpServer: string;
    userName: string;
    Password: string;
    emailContador:string;
    UsarTLS:String;
    nomeEmpresa:String;
    Assunto:String;
    CodIBGE:String;
    PopulacaoIBGE:Integer;
    dn_estimado01:integer;
    dn_estimado02:integer;
    dn_estimado03:integer;
    dn_estimado04:integer;
    dn_estimado05:integer;
    dn_estimado06:integer;
    dn_estimado07:integer;
    dn_estimado08:integer;
    dn_estimado09:integer;
    dn_estimado10:integer;
    dn_estimado11:integer;
    dn_estimado12:integer;
    dn_estimado13:integer;
    dn_estimado14:integer;
    dn_estimado15:integer;
    dn_estimado16:integer;
    dn_estimado17:integer;
    dn_estimado18:integer;
    dn_estimado19:integer;
    dn_estimado20:integer;
    dn_estimado21:integer;
    periodoPandemia: integer;
    Imunobiologicos: String;
  end;

Const
 arqConfig = 'CONFIG.INI';

var
  DM: TDM;
  objConfiguracao:TConfiguracao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses uFrmConfig, uFuncoes, uFPrincipal;

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 conexaoEsus.Connected:=false;
 ConectaDB();

 //conexaolocal.Connected:=true;

{
 objConfiguracao:=TConfiguracao.create; // Cria o Objeto de Configura��o

  if not Fileexists(ArqConfig) then
  begin
   Application.MessageBox('O Arquivo de Configura��o n�o foi encontrado!'+#13+#10+' Primeiramente configure o Sistema para o correto funcionamento!','Aten��o',MB_ICONEXCLAMATION+MB_OK);
   try
     frmConfig:=TFrmConfig.Create(Self);
     frmConfig.ShowModal;
   finally
     FreeAndNil(frmConfig);
   end;
  end;

  if not Fileexists(ArqConfig) then Application.Terminate;

  objConfiguracao.DBEsus:= LeIni(ArqConfig,'Configuracao','Database');
  objConfiguracao.UsuarioDBEsus:= LeIni(ArqConfig,'Configuracao','Usuario_DB');
  objConfiguracao.SenhaDBEsus:= LeIni(ArqConfig,'Configuracao','Senha_DB');
  objConfiguracao.ServidorDBEsus:= LeIni(ArqConfig,'Configuracao','Servidor_DB');
  objConfiguracao.PortaDBEsus:= StrToInt(LeIni(ArqConfig,'Configuracao','Porta_DB','0'));

  objConfiguracao.smtpServer:=LeIni(ArqConfig,'Configuracao','ServidorSMTP');
  objConfiguracao.userName :=LeIni(ArqConfig,'Configuracao','ContaEmailEnvio');
  objConfiguracao.password:=LeIni(ArqConfig,'Configuracao','SenhaContaEmail');
  objConfiguracao.smtpPorta:=StrToInt(LeIni(ArqConfig,'Configuracao','PortaSMTP'));
  objConfiguracao.UsarTLS:=LeIni(ArqConfig,'Configuracao','UsarTLS');
  objConfiguracao.emailContador:=LeIni(ArqConfig,'Configuracao','EmailContador');
  objConfiguracao.nomeEmpresa:=LeIni(ArqConfig,'Configuracao','NomeEmpresa');
  objConfiguracao.Assunto:=LeIni(ArqConfig,'Configuracao','Assunto');

  //------ Conex�o Banco de dados do Sistema Emissor
  try
    conexaoEsus.connected:=false;
    conexaoEsus.Server   :=objConfiguracao.ServidorDBEsus;
    conexaoEsus.Database :=objConfiguracao.DBEsus;
    conexaoEsus.userName :=objConfiguracao.UsuarioDBEsus;
    conexaoEsus.Password :=objConfiguracao.SenhaDBEsus;
    if objConfiguracao.PortaDBEsus>0 then
      conexaoEsus.Port     :=objConfiguracao.PortaDBEsus;

    conexaoEsus.connected:=true;
  except on ex:Exception do
    begin
     Application.MessageBox('N�o foi poss�vel conectar ao banco de dados do sistema emissor!'+#13+#10+' Verifique suas configura��es e tente novamente!','Aten��o',MB_ICONEXCLAMATION+MB_OK);
    end;
  end;
  }
end;

end.
