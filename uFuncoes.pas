unit uFuncoes;

interface

uses IdSMTP, IdSSLOpenSSL, IdMessage, IdText, IdAttachmentFile, vcl.Dialogs,
IdExplicitTLSClientServerBase,StrUtils, SysUtils, System.Classes, iniFiles,
vcl.Forms, windows, DB, RzCmboBx, dbWeb, ComObj, XMLDoc, XMLIntf,
Variants, messages, ShellAPI, System.Types;


function EnviaEmailSSL(nome_remetente, email_destinatario, assunto,
  mensagem: string; anexos: TstringList; exibe_mensagens: Boolean = False)
  : Boolean; overload;
function EnviaEmailSSL(nome_remetente, email_destinatario, assunto, mensagem,
  anexo: string; exibe_mensagens: Boolean = False): Boolean; overload;

function QuebraStringEmStringList(texto_continuo: string;
  caracter_quebra: string): TstringList;

procedure GravaIni(sArqIni : string; sSecao : string; sVariavel : string; sValor : string);
Function LeIni(sArqIni : string; sSecao : string; sVariavel : string; default:string='') : string;
function FormataDataBR(sData:String): String;
function ConectaDB(): boolean;
function CarregaComboBox(ds:TDataset; cb:TRzComboBox) : boolean;
function LeftPad(PadString : string ; HowMany : integer ; PadValue : string): string;
procedure ExpHTML(DataSet: TDataSet; Arq: string);
procedure ExpTXT(DataSet: TDataSet; Arq: string);
procedure ExpXLS(DataSet: TDataSet; Arq: string);
procedure ExpDOC(DataSet: TDataSet; Arq: string);
procedure ExpXML(DataSet: TDataSet; Arq: string);
procedure ShowFolder(strFolder: string);
function ExplodeString(paramString: String; cChar:String='|'): TStringDynArray;
function ChecaCiapFimGestacao(param1:TStringDynArray): integer;
function DescricaoCiapFimGestacao(param1:integer): String;
function ChecaCidsFimGestacao(param1:TStringDynArray): integer;
function DescricaoCidFimGestacao(param1:integer): String;


function listaArray(param1: Array of String): string;





implementation

//FUNCÕES PARA ENVIO DE EMAIL


uses uDM, uFrmConfig;

function EnviaEmailSSL(nome_remetente, email_destinatario, assunto, mensagem,
  anexo: string; exibe_mensagens: Boolean = False): Boolean;
var
  anexos: TstringList;
begin
  anexos := TstringList.Create;
  anexos.Add(anexo);
  result := EnviaEmailSSL(nome_remetente, email_destinatario, assunto, mensagem,
    anexos, exibe_mensagens);
  anexos.Free;
end;

function EnviaEmailSSL(nome_remetente, email_destinatario, assunto,
  mensagem: string; anexos: TstringList;
  exibe_mensagens: Boolean = False): Boolean;
var
  // variáveis e objetos necessários para o envio
  IdSSLIOHandlerSocket: TIdSSLIOHandlerSocketOpenSSL;
  IdSMTP: TIdSMTP;
  IdMessage: TIdMessage;
  IdText: TIdText;
  i: Integer;
  destinatarios: TstringList;
begin
  result := true;

  destinatarios := QuebraStringEmStringList(email_destinatario, ',');

  // instanciação dos objetos
  IdSSLIOHandlerSocket := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  IdSMTP := TIdSMTP.Create(nil);
  IdMessage := TIdMessage.Create(nil);

  try
    // Configuração do protocolo SSL (TIdSSLIOHandlerSocketOpenSSL)
    IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
    IdSSLIOHandlerSocket.SSLOptions.Mode := sslmClient;

    // Configuração do servidor SMTP (TIdSMTP)
    IdSMTP.IOHandler := IdSSLIOHandlerSocket;
    if objConfiguracao.smtpPorta = 587 then
      IdSMTP.UseTLS := utUseExplicitTLS
    else
      IdSMTP.UseTLS := utUseImplicitTLS;

    IdSMTP.AuthType := satDefault; // satDefault
    IdSMTP.Port := objConfiguracao.smtpPorta;
    IdSMTP.Host := objConfiguracao.smtpServer;
    IdSMTP.Username := objConfiguracao.userName;
    IdSMTP.Password := objConfiguracao.password;

    // Configuração da mensagem (TIdMessage)
    IdMessage.From.Address := objConfiguracao.userName;
    IdMessage.From.Name := objConfiguracao.nomeEmpresa;
    IdMessage.ReplyTo.EMailAddresses := IdMessage.From.Address;

    IdMessage.Subject := objConfiguracao.Assunto;
    IdMessage.Encoding := meMIME;

    // Configuração do corpo do email (TIdText)
    IdText := TIdText.Create(IdMessage.MessageParts);
    IdText.Body.Add(mensagem);
    IdText.ContentType := 'text/plain; charset=iso-8859-1';

    // Adiciona os destinatários
    for i := 0 to destinatarios.Count - 1 do
    begin
      IdMessage.Recipients.Add.Text := destinatarios[i];
    end;

    // Opcional - Anexo da mensagem (TIdAttachmentFile)
    for i := 0 to anexos.Count - 1 do
      if fileexists(anexos[i]) then
        TIdAttachmentFile.Create(IdMessage.MessageParts, anexos[i]);

    { if FileExists(caminho_anexo) then
      begin
      TIdAttachmentFile.Create(IdMessage.MessageParts, caminho_anexo);
      end; }

    // Conexão e autenticação
    try
      IdSMTP.Connect;
      IdSMTP.Authenticate;
    except
      on E: Exception do
      begin
        if exibe_mensagens then
          MessageDlg('Erro na conexão ou autenticação: ' + E.Message, mtWarning,
            [mbOK], 0);
        result := False;
        Exit;
      end;
    end;

    // Envio da mensagem
    try
      IdSMTP.Send(IdMessage);
      if exibe_mensagens then
        MessageDlg('Mensagem enviada com sucesso!', mtInformation, [mbOK], 0);
    except
      On E: Exception do
      begin
        if exibe_mensagens then
          MessageDlg('Erro ao enviar a mensagem: ' + E.Message, mtWarning,
            [mbOK], 0);
        result := False;
      end;
    end;
  finally
    // desconecta do servidor
    IdSMTP.Disconnect;
    // liberação da DLL
    UnLoadOpenSSLLibrary;
    // liberação dos objetos da memória
    FreeAndNil(IdMessage);
    FreeAndNil(IdSSLIOHandlerSocket);
    FreeAndNil(IdSMTP);
  end;
end;

function QuebraStringEmStringList(texto_continuo: string;
  caracter_quebra: string): TstringList;
// Função parecida com a função explode do php
var
  lista: TstringList;
  str_aux: string;
begin
  lista := TstringList.Create;

  while pos(caracter_quebra, texto_continuo) > 0 do
  begin
    str_aux := trim(copy(texto_continuo, 1, pos(caracter_quebra,
      texto_continuo) - 1));
    if length(str_aux) > 0 then
      lista.Add(str_aux);
    texto_continuo := trim(copy(texto_continuo, pos(caracter_quebra,
      texto_continuo) + 1, length(texto_continuo)));
  end;
  // adiciona a ultima parte da string (ou se não encontrar caracter de quebra, adiciona toda a string)
  if length(trim(texto_continuo)) > 0 then
    lista.Add(texto_continuo);

  result := lista;
end;


procedure GravaIni(sArqIni : string; sSecao : string; sVariavel : string; sValor : string);
var ArqIni  : tIniFile;
begin
   ArqIni:= TIniFile.Create((ExtractFilePath(Application.exeName)) + '\' + sArqini);
   try
     arqini.WriteString(sSecao, sVariavel, sValor);
   finally
     ArqIni.Free;
   end;
end;


Function LeIni(sArqIni : string; sSecao : string; sVariavel : string; default:string='') : string;
var ArqIni  : tIniFile;
    sString : string;
begin
   ArqIni := tIniFile.Create((ExtractFilePath(Application.exeName)) + '\' + sArqIni);
   Try
      result:= ArqIni.ReadString(sSecao, sVariavel, default)
   Finally
     ArqIni.Free;
   end;
end;
(*************************************************************************************************************************)

function FormataDataBR(sData:String): String;
var
 strAux:String;
begin
  strAux:='';
  if sData<>'' then
    strAux:=Copy(sdata,9,2)+'/'+copy(sdata,6,2)+'/'+copy(sdata,1,4)+copy(sdata,11,8) ;
  result:=straux;
end;



function ConectaDB(): boolean;
begin
 if not Assigned(objConfiguracao) then
  objConfiguracao:=TConfiguracao.create; // Cria o Objeto de Configuração

  if not Fileexists(ArqConfig) then
  begin
   Application.MessageBox('O Arquivo de Configuração não foi encontrado!'+#13+#10+' Primeiramente configure o Sistema para o correto funcionamento!','Atenção',MB_ICONEXCLAMATION+MB_OK);
   try
     frmConfig:=TFrmConfig.Create(nil);
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

  objConfiguracao.DBLocal:= LeIni(ArqConfig,'Configuracao','Database_Local');
  objConfiguracao.UsuarioDBLocal:= LeIni(ArqConfig,'Configuracao','Usuario_DB_local');
  objConfiguracao.SenhaDBLocal:= LeIni(ArqConfig,'Configuracao','Senha_DB_local');
  objConfiguracao.ServidorDBLocal:= LeIni(ArqConfig,'Configuracao','Servidor_DB_local');
  objConfiguracao.PortaDBLocal:= StrToInt(LeIni(ArqConfig,'Configuracao','Porta_DB_local','0'));

  objConfiguracao.smtpServer:=LeIni(ArqConfig,'Configuracao','ServidorSMTP');
  objConfiguracao.userName :=LeIni(ArqConfig,'Configuracao','ContaEmailEnvio');
  objConfiguracao.password:=LeIni(ArqConfig,'Configuracao','SenhaContaEmail');
  objConfiguracao.smtpPorta:=StrToInt(LeIni(ArqConfig,'Configuracao','PortaSMTP'));
  objConfiguracao.UsarTLS:=LeIni(ArqConfig,'Configuracao','UsarTLS');
  objConfiguracao.emailContador:=LeIni(ArqConfig,'Configuracao','EmailContador');
  objConfiguracao.nomeEmpresa:=LeIni(ArqConfig,'Configuracao','NomeEmpresa');
  objConfiguracao.Assunto:=LeIni(ArqConfig,'Configuracao','Assunto');
  objConfiguracao.CodIBGE:=LeIni(ArqConfig,'Configuracao','CodigoIBGEMunicipio','3303005');
  objConfiguracao.PopulacaoIBGE:=StrToInt(LeIni(ArqConfig,'Configuracao','PopulacaoIBGE','1'));
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

  //------ Conexão Banco de dados do Sistema Emissor
  result:=true;
  try
    dm.conexaoEsus.connected:=false;
    dm.conexaoEsus.Server   :=objConfiguracao.ServidorDBEsus;
    dm.conexaoEsus.Database :=objConfiguracao.DBEsus;
    dm.conexaoEsus.userName :=objConfiguracao.UsuarioDBEsus;
    dm.conexaoEsus.Password :=objConfiguracao.SenhaDBEsus;
    if objConfiguracao.PortaDBEsus>0 then
      dm.conexaoEsus.Port     :=objConfiguracao.PortaDBEsus;

    dm.conexaoEsus.connected:=true;

  except on ex:Exception do
    begin
     Application.MessageBox('Não foi possível conectar ao banco de dados do sistema emissor!'+#13+#10+' Verifique suas configurações e tente novamente!','Atenção',MB_ICONEXCLAMATION+MB_OK);
     result:=false;
    end;
  end;

  try
    dm.conexaoLocal.connected:=false;
    dm.conexaoLocal.Server   :=objConfiguracao.ServidorDBLocal ;
    dm.conexaoLocal.Database :=objConfiguracao.DBLocal;
    dm.conexaoLocal.userName :=objConfiguracao.UsuarioDBLocal;
    dm.conexaoLocal.Password :=objConfiguracao.SenhaDBLocal;
    if objConfiguracao.PortaDBLocal>0 then
      dm.conexaoLocal.Port     :=objConfiguracao.PortaDBLocal;

    dm.conexaoLocal.connected:=true;

  except on ex:Exception do
    begin
     Application.MessageBox('Não foi possível conectar ao banco de dados do sistema emissor!'+#13+#10+' Verifique suas configurações e tente novamente!','Atenção',MB_ICONEXCLAMATION+MB_OK);
     result:=false;
    end;
  end;
end;

function carregaComboBox(ds:TDataset; cb:TRzComboBox): boolean;
begin
  try
  result:=true;
  ds.first;
  while not (ds.eof) do
  begin
    cb.Items.add(ds.Fields[1].AsString);
    cb.Values.add(ds.Fields[0].AsString);
    ds.Next;
  end;
  cb.ItemIndex:=0;
  except
    result:=false;
  end;
end;

function LeftPad(PadString : string ; HowMany : integer ; PadValue : string): string;
var
   Counter : integer;
   x : integer;
   NewString : string;
begin
   Counter := HowMany - Length(PadString);
   for x := 1 to Counter do
   begin
      NewString := NewString + PadValue;
   end;
   Result := NewString + PadString;
end ;

procedure ExpHTML(DataSet: TDataSet; Arq: string);
var
  sl: TStringList;
  dp: TDataSetTableProducer;
begin
  sl := TStringList.Create;
  try
    dp := TDataSetTableProducer.Create(nil);
    try
      DataSet.First;
      dp.DataSet := DataSet;
      dp.TableAttributes.Border := 1;
      sl.Text := dp.Content;
      sl.SaveToFile(Arq);
    finally
      dp.free;
    end;
  finally
    sl.free;
  end;
end;

procedure ExpTXT(DataSet: TDataSet; Arq: string);
var
  i: integer;
  sl: TStringList;
  st: string;
begin
  DataSet.First;
  sl := TStringList.Create;
  try
    st := '';
    for i := 0 to DataSet.Fields.Count - 1 do
      st := st + DataSet.Fields[i].DisplayLabel + ';';
    sl.Add(st);
    DataSet.First;
    while not DataSet.Eof do
    begin
      st := '';
      for i := 0 to DataSet.Fields.Count - 1 do
        st := st + DataSet.Fields[i].DisplayText + ';';
      sl.Add(st);
      DataSet.Next;
    end;
    sl.SaveToFile(Arq);
  finally
     sl.free;
  end;
end;

procedure ExpXLS(DataSet: TDataSet; Arq: string);
var
  ExcApp: OleVariant;
  i,l,p: integer;
begin
    ExcApp := CreateOleObject('Excel.Application');
    ExcApp.Caption := 'Exportacao';
    ExcApp.Visible := False;
    ExcApp.WorkBooks.Add;
    DataSet.First;
    l := 1;
    DataSet.First;
    for p :=0 to dataset.Fields.Count - 1 do
    begin
        ExcApp.WorkBooks[1].Sheets[1].Cells[l, p + 1] :=
          DataSet.fields[p].DisplayName;
    end;
    inc(l);
    while not DataSet.EOF do
    begin
      for i := 0 to DataSet.Fields.Count - 1 do
        ExcApp.WorkBooks[1].Sheets[1].Cells[l, i + 1] :=
          DataSet.Fields[i].DisplayText;
      DataSet.Next;
      l := l + 1;
    end;
    ExcApp.WorkBooks[1].SaveAs(Arq);
    ExcApp.Quit;
end;

procedure ExpDOC(DataSet: TDataSet; Arq: string);
var
  WordApp,WordDoc,WordTable,WordRange: Variant;
  Row,Column: integer;
begin
  WordApp := CreateOleobject('Word.basic');
  WordApp.Appshow;
  WordDoc := CreateOleobject('Word.Document');
  WordRange := WordDoc.Range;
  WordTable := WordDoc.tables.Add(
    WordDoc.Range,1,DataSet.FieldCount);
  for Column:=0 to DataSet.FieldCount-1 do
    WordTable.cell(1,Column+1).range.text:=
      DataSet.Fields.Fields[Column].FieldName;
  Row := 2;
  DataSet.First;
  while not DataSet.Eof do
  begin
     WordTable.Rows.Add;
     for Column:=0 to DataSet.FieldCount-1 do
       WordTable.cell(Row,Column+1).range.text :=
         DataSet.Fields.Fields[Column].DisplayText;
     DataSet.next;
     Row := Row+1;
  end;
  WordDoc.SaveAs(Arq);
  WordDoc := unAssigned;
end;


procedure ExpXML(DataSet : TDataSet; Arq : string);
var
  i: integer;
  xml: TXMLDocument;
  reg, campo: IXMLNode;
begin
  xml := TXMLDocument.Create(nil);
  try
    xml.Active := True;
    DataSet.First;
    xml.DocumentElement :=
      xml.CreateElement('DataSet','');
    DataSet.First;
    while not DataSet.Eof do
    begin
      reg := xml.DocumentElement.AddChild('row');
      for i := 0 to DataSet.Fields.Count - 1 do
      begin
        campo := reg.AddChild(
          DataSet.Fields[i].DisplayLabel);
        campo.Text := DataSet.Fields[i].DisplayText;
      end;
      DataSet.Next;
    end;
    xml.SaveToFile(Arq);
  finally
    xml.free;
  end;
end;

// strFolder is the folder you want to open
procedure ShowFolder(strFolder: string);
begin
  ShellExecute(Application.Handle,
    PChar('explore'),
    PChar(strFolder),
    nil,
    nil,
    SW_SHOWNORMAL);
end;

function ExplodeString(paramString: String; cChar:String='|'): TStringDynArray;
var
 returnString:TStringDynArray;
begin
  returnString:=SplitString(paramString,cChar);
  result:=returnString;
end;


function ChecaCiapFimGestacao(param1:TStringDynArray): integer;
var
 lista_Ciaps_Aborto: Array of String;
 lista_Ciaps_PSC_NV: Array of String;
 Lista_Ciaps_PSC_NM: Array of String;
 Lista_Ciaps_PCC_NV: Array of String;
 Lista_Ciaps_PCC_NM: Array of String;

// lista_Cids_Aborto : Array of String;
 I,x, ret: Integer;

begin
  ret:=0;
  if ((length(param1) = 0) or (param1[0]='||'))then
  begin
   result:=ret;
   exit;
  end;

  // Inicializa Arrays e os Preenche
  setLength(lista_Ciaps_Aborto,2);
  lista_Ciaps_Aborto[0]:='W82';
  lista_Ciaps_Aborto[1]:='W83';
  SetLength(lista_Ciaps_PSC_NV,1);
  lista_Ciaps_PSC_NV[0]:='W90';
  SetLength(lista_Ciaps_PSC_NM,1);
  lista_Ciaps_PSC_NM[0]:='W91';
  SetLength(lista_Ciaps_PCC_NV,1);
  lista_Ciaps_PCC_NV[0]:='W92';
  SetLength(lista_Ciaps_PCC_NM,1);
  lista_Ciaps_PSC_NM[0]:='W93';

  for I :=0 to Length(param1)-1 do
  begin
   for x := 0 to length(lista_Ciaps_Aborto)-1 do
   begin
     if (param1[i] = lista_Ciaps_Aborto[x]) then
     begin
      ret:=1;
      break;
     end;
   end;
   for x := 0 to length(lista_Ciaps_PSC_NV)-1 do
   begin
     if (param1[i]=lista_Ciaps_PSC_NV[x]) then
     begin
      ret:=2;
      break;
     end;
   end;
   for x := 0 to length(lista_Ciaps_PSC_NM)-1 do
   begin
     if (param1[i]=lista_Ciaps_PSC_NM[x]) then
     begin
      ret:=3;
      break;
     end;
   end;
   for x := 0 to length(lista_Ciaps_PCC_NV)-1 do
   begin
     if (param1[i]=lista_Ciaps_PCC_NV[x]) then
     begin
      ret:=4;
      break;
     end;
   end;
   for x := 0 to length(lista_Ciaps_PSC_NM)-1 do
   begin
     if (param1[i]=lista_Ciaps_PSC_NM[x]) then
     begin
      ret:=5;
      break;
     end;
   end;
  end;
  result:=ret;
end;

function DescricaoCiapFimGestacao(param1:integer): String;
var
 str:String;
begin
  if param1 = 0 then
    str:='Gestação Não Finalizada.'
  else
  if param1 = 1 then
    str:='Gestação Finalizada com Aborto.'
  else
  if param1 = 2 then
    str:='Parto sem Complicações Nascido Vivo.'
  else
  if param1 = 3 then
    str:='Parto sem Complicações Natimorto.'
  else
  if param1 = 4 then
    str:='Parto Com Complicações Nascido Vivo.'
  else
  if param1 = 5 then
    str:='Parto Com Complicações Natimorto.';

  result:=str;
end;


function ChecaCidsFimGestacao(param1:TStringDynArray): integer;
var
 lista_Cids_Aborto: Array of String;
 lista_Cids_PSC_NV: Array of String;
 Lista_Cids_PSC_NM: Array of String;
 Lista_Cids_PCC_NV: Array of String;
 Lista_Cids_PCC_NM: Array of String;

// lista_Cids_Aborto : Array of String;
 I,x, ret: Integer;

begin
  ret:=0;
  if ((length(param1) = 0) or (param1[0]='||'))then
  begin
   result:=ret;
   exit;
  end;

  // Inicializa Arrays e os Preenche
  setLength(lista_Cids_Aborto,6);
  lista_cids_aborto:=['O02', 'O03', 'O05', 'O06','O04', 'Z30.3'];
  SetLength(lista_Cids_PSC_NV,5);
  lista_Cids_PSC_NV:=['O80', 'Z37.0', 'Z37.9', 'Z38', 'Z39'];
  SetLength(lista_Cids_PSC_NM,5);
  lista_Cids_PSC_NM:=['O80', 'Z37.0', 'Z37.9', 'Z38', 'Z39'];
  SetLength(lista_Cids_PCC_NV,32);
  lista_Cids_PCC_NV:=['O42', 'O45', 'O60', 'O61', 'O62', 'O63', 'O64', 'O65', 'O66', 'O67', 'O68', 'O69',
                      'O70', 'O71', 'O73', 'O75.0', 'O75.1', 'O75.4', 'O75.5', 'O75.6', 'O75.7','O75.8',
                      'O75.9', 'O81', 'O82', 'O83', 'O84', 'Z37.2', 'Z37.5', 'Z37.9', 'Z38', 'Z39'];
  SetLength(lista_Cids_PCC_NM,33);
  lista_Cids_PSC_NM:=['O42', 'O45', 'O60', 'O61', 'O62', 'O63', 'O64', 'O65', 'O66', 'O67', 'O68', 'O69',
                      'O70', 'O71', 'O73', 'O75.0', 'O75.1', 'O75.4', 'O75.5', 'O75.6', 'O75.7','O75.8',
                      'O75.9', 'O81', 'O82', 'O83', 'O84', 'Z37.1', 'Z37.3', 'Z37.4', 'Z37.6','Z37.7',
                      'Z37.9'];

  for I :=0 to Length(param1)-1 do
  begin
   for x := 0 to length(lista_Cids_Aborto)-1 do
   begin
     if (param1[i] = lista_Cids_Aborto[x]) then
     begin
      ret:=1;
      break;
     end;
   end;
   for x := 0 to length(lista_Cids_PSC_NV)-1 do
   begin
     if (param1[i]=lista_Cids_PSC_NV[x]) then
     begin
      ret:=2;
      break;
     end;
   end;
   for x := 0 to length(lista_Cids_PSC_NM)-1 do
   begin
     if (param1[i]=lista_Cids_PSC_NM[x]) then
     begin
      ret:=3;
      break;
     end;
   end;
   for x := 0 to length(lista_Cids_PCC_NV)-1 do
   begin
     if (param1[i]=lista_Cids_PCC_NV[x]) then
     begin
      ret:=4;
      break;
     end;
   end;
   for x := 0 to length(lista_Cids_PSC_NM)-1 do
   begin
     if (param1[i]=lista_Cids_PSC_NM[x]) then
     begin
      ret:=5;
      break;
     end;
   end;
  end;
  result:=ret;
end;

function DescricaoCidFimGestacao(param1:integer): String;
var
 str:String;
begin
  if param1 = 0 then
    str:='Gestação Não Finalizada.'
  else
  if param1 = 1 then
    str:='Gestação Finalizada com Aborto.'
  else
  if param1 = 2 then
    str:='Parto sem Complicações Nascido Vivo.'
  else
  if param1 = 3 then
    str:='Parto sem Complicações Natimorto.'
  else
  if param1 = 4 then
    str:='Parto Com Complicações Nascido Vivo.'
  else
  if param1 = 5 then
    str:='Parto Com Complicações Natimorto.';

  result:=str;
end;



function listaArray(param1: Array of String): string;
var
 x,i:integer;
 str:String;
begin
  //str:='[';
  x:=0;
  for I := 0 to length(param1)-1 do
  begin
     str:=str + '''' + param1[I] +'''';
     if (i < length(param1)-1) then
       str:=str+',';


  end;
  //str:=str+']';
  result:=str;
end;
end.
