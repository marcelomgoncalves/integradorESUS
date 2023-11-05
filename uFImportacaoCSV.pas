unit uFImportacaoCSV;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RzPanel, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, Vcl.Buttons, RzStatus, Data.DB, MemDS, DBAccess, Uni,
  Vcl.ComCtrls;

type
  TfrmImportacaoCSV = class(TForm)
    RzPanel9: TRzPanel;
    RzPanel10: TRzPanel;
    RzLabel5: TRzLabel;
    RzStatusBar1: TRzStatusBar;
    Edit1: TEdit;
    SpeedButton1: TSpeedButton;
    FODialog: TFileOpenDialog;
    BitBtn1: TBitBtn;
    UniQuery1: TUniQuery;
    lblAguarde: TLabel;
    ProgressBar1: TProgressBar;
    Label1: TLabel;
    QryAux: TUniQuery;
    qryBusca: TUniQuery;
    procedure SpeedButton1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    Function quantaslin ( nomeDoArquivo: String ):integer;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImportacaoCSV: TfrmImportacaoCSV;

implementation

{$R *.dfm}

uses uDM;

procedure TfrmImportacaoCSV.BitBtn1Click(Sender: TObject);
var
  //ex :Integer;
  ArquivoCSV :TextFile;
  Linha :String;
  // campos
  vCNS, VCPF, vNome, vSexo, vDataNasc, vDose, vDataAplicacao, vLote, vUnidade,
  vNomeAplicador, vLocalidade, vFabricante, vImunizante, strSQL, strAux :String;

  nLinhas, xContador: integer;

begin
  if edit1.text<>'' then
  begin
        progressBar1.Max:=quantaslin(edit1.text);

        AssignFile(ArquivoCSV, edit1.text);
        Reset(ArquivoCSV);
        //Cabeçalho
        Readln(ArquivoCSV, Linha);

        xContador:=1;

        try
            uniquery1.close;
            uniquery1.sql.clear;
            uniquery1.sql.text:='delete from tb_vacinacao';
            uniquery1.execSql;

            uniquery1.close;
            uniquery1.sql.clear;
            edit1.enabled:=false;
            bitbtn1.enabled:=false;
            speedbutton1.enabled:=false;
            progressbar1.visible:=true;
            lblAguarde.visible:=true;
            lblAguarde.Caption:='Passo 1 - Processando o Arquivo.. Aguarde!';
            xContador:=1;
            while not EOF(ArquivoCSV) do
            begin
              Application.ProcessMessages;
              Readln(ArquivoCSV, Linha);
              vCns  := Copy(Linha, 0, pos(';',Linha)-1);            //campo 1
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vNome := Copy(Linha, 0, pos(';',Linha)-1);            //campo 2
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vCPF  := Copy(Linha, 0, pos(';',Linha)-1);            //campo 3
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vSexo := Copy(Linha, 0, pos(';',Linha)-1);            // campo 4
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vDataNasc := Copy(Linha, 0, pos(';',Linha)-1);         //campo 10
              vDataNasc := copy(vDataNasc,7,4)+'-'+copy(vDataNasc,4,2)+'-'+copy(vDataNasc,1,2);
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vLocalidade := Copy(Linha, 0, pos(';',Linha)-1);        //campo 22
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vDataAplicacao := Copy(Linha, 0, pos(';',Linha)-1);              // campo 28
              vDataAplicacao :=copy(vDataAplicacao,1,10)+' '+copy(vDataAplicacao,12,8);
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vDose := Utf8Decode(Copy(Linha, 0, pos(';',Linha)-1));              // campo 29
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vFabricante := Utf8Decode(Copy(Linha, 0, pos(';',Linha)-1));        // campo 30
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vLote := Utf8Decode(Copy(Linha, 0, pos(';',Linha)-1));              // campo 33
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vImunizante := Utf8Decode(Copy(Linha, 0, pos(';',Linha)-1));        // campo 34
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vNomeAplicador := Copy(Linha, 0, pos(';',Linha)-1);     // campo 38
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              Linha := Copy(Linha, pos(';',Linha)+1, Length(Linha));
              vUnidade := Copy(Linha, 0, pos(';',Linha)-1);           // campo 40

              // Nâo gravar Exceções.
              {
              StrSql:=
                'CREATE GLOBAL TEMPORARY TABLE  temp_Vacinados '+
                '(NU_CPF               VARCHAR(15), '+
                'NU_CNS               VARCHAR(30), '+
                'NO_CIDADAO           VARCHAR(500), '+
                'DATA_NASCTO          DATE, '+
                'DOSE_APLICADA        VARCHAR(100), '+
                'DATA_APLICACAO_DOSE  TIMESTAMP, '+
                'LOTE_VACINA_DOSE     VARCHAR(100), '+
                'NO_UNIDADE_SAUDE     VARCHAR(200), '+
                'NO_NOMEAPLICADOR     VARCHAR(300), '+
                'LOCALIDADE           VARCHAR(300), '+
                'FABRICANTE_VACINA    VARCHAR(350), '+
                'NO_IMUNIZANTE        VARCHAR(250), '+
                'NO_SEXO              CHAR(1) '+
                ') '+
                'ON COMMIT PRESERVE ROWS; ';

              uniquery1.close;
              uniquery1.sql.clear;
              uniquery1.sql.add(strsql);
              uniquery1.execsql;
              }

              //showmessage(strsql);

              strSQL:='INSERT INTO TEMP_VACINADOS('+
              'ID, '+
              'NU_CPF, '+
              'NU_CNS, '+
              'NO_CIDADAO, '+
              'DATA_NASCTO, '+
              'DOSE_APLICADA, '+
              'DATA_APLICACAO_DOSE, '+
              'LOTE_VACINA_DOSE, '+
              'NO_UNIDADE_SAUDE, '+
              'NO_NOMEAPLICADOR, '+
              'LOCALIDADE, '+
              'FABRICANTE_VACINA, '+
              'NO_IMUNIZANTE, '+
              'NO_SEXO) '+
              'VALUES ('+
              IntToStr(xContador)+', '+
              quotedStr(vCPF)+', '+
              quotedStr(vCNS)+', '+
              quotedStr(vNome)+', '+
              quotedStr(vDataNasc)+', '+
              quotedStr(vDose)+', '+
              quotedStr(vDataAplicacao)+', '+
              quotedStr(vLote)+', '+
              quotedStr(vUnidade)+', '+
              quotedStr(vNomeAplicador)+', '+
              quotedStr(vLocalidade)+', '+
              quotedStr(vFabricante)+', '+
              quotedStr(vImunizante)+', '+
              quotedStr(vSexo)+')';

              uniquery1.close;
              uniquery1.sql.clear;
              uniquery1.sql.add(strsql);
              uniquery1.execsql;

              inc(nlinhas);
              inc(xContador);
              progressBar1.position:=nLinhas;

              Next;
            end;

            CloseFile ( arquivoCSV );
            progressBar1.position:=0;
            nLinhas:=0;

            lblAguarde.Caption:='Passo 2 - Processando o Arquivo.. Aguarde!' ;

            strSql:='Select '+
                    'distinct(nu_cns), '+
                    'ID, '+
                    'no_cidadao, '+
                    'nu_cpf, '+
                    'data_Nascto, '+
                    'dose_aplicada, '+
                    'data_aplicacao_dose, '+
                    'lote_vacina_dose, '+
                    'no_imunizante, '+
                    'no_unidade_saude, '+
                    'NO_NOMEAPLICADOR, '+
                    'LOCALIDADE, '+
                    'FABRICANTE_VACINA, '+
                    'NO_SEXO '+
                    'from temp_vacinados '+
                    'where dose_aplicada like ''%1%''' +
                    'order by id';

            uniquery1.close;
            uniquery1.sql.clear;
            uniquery1.sql.add(strsql);
            uniquery1.open;

            uniquery1.Last;
            progressBar1.Max:=uniquery1.recordcount;

            uniquery1.First;

            while not uniquery1.eof do
            begin
              vCPF:=uniquery1.fieldByName('nu_cpf').AsString;
              vCNS:=uniquery1.fieldByName('nu_cns').AsString;
              vNome:=uniquery1.fieldByName('NO_CIDADAO').AsString;
              vDataNasc:=uniquery1.fieldByName('DATA_NASCTO').AsString;
              vDataNasc:=copy(vDataNasc,7,4)+'-'+copy(vDataNasc,4,2)+'-'+copy(vDataNasc,1,2);
              vDose:=uniquery1.fieldByName('DOSE_APLICADA').AsString;
              vDataAplicacao:=uniquery1.fieldByName('DATA_APLICACAO_DOSE').AsString;
              vDataAplicacao:=copy(vDataAplicacao,7,4)+'-'+copy(vDataAplicacao,4,2)+'-'+copy(vDataAplicacao,1,2);

              vLote:=uniquery1.fieldByName('LOTE_VACINA_DOSE').AsString;
              vUnidade:=uniquery1.fieldByName('NO_UNIDADE_SAUDE').AsString;
              vNomeAplicador:=uniquery1.fieldByName('NO_NOMEAPLICADOR').AsString;
              vLocalidade:=uniquery1.fieldByName('LOCALIDADE').AsString;
              vFabricante:=uniquery1.fieldByName('FABRICANTE_VACINA').AsString;
              vImunizante:=uniquery1.fieldByName('NO_IMUNIZANTE').AsString;
              vSexo:=uniquery1.fieldByName('NO_SEXO').AsString;

              strAux:='INSERT INTO TB_VACINACAO('+
              'NU_CPF, '+
              'NU_CNS, '+
              'NO_CIDADAO, '+
              'DATA_NASCTO, '+
              'DOSE_APLICADA, '+
              'DATA_APLICACAO_DOSE, '+
              'LOTE_VACINA_DOSE, '+
              'NO_UNIDADE_SAUDE, '+
              'NO_NOMEAPLICADOR, '+
              'LOCALIDADE, '+
              'FABRICANTE_VACINA, '+
              'NO_IMUNIZANTE, '+
              'NO_SEXO) '+
              'VALUES ('+
              quotedStr(vCPF)+', '+
              quotedStr(vCNS)+', '+
              quotedStr(vNome)+', '+
              quotedStr(vDataNasc)+', '+
              quotedStr(vDose)+', '+
              quotedStr(vDataAplicacao)+', '+
              quotedStr(vLote)+', '+
              quotedStr(vUnidade)+', '+
              quotedStr(vNomeAplicador)+', '+
              quotedStr(vLocalidade)+', '+
              quotedStr(vFabricante)+', '+
              quotedStr(vImunizante)+', '+
              quotedStr(vSexo)+')';

              qryAux.close;
              qryAux.sql.clear;
              qryAux.sql.add(strAux);
              qryAux.execsql;

              inc(nLinhas);
              progressBar1.position:=nLinhas;
              uniquery1.next; //próximo registro
              Caption:=nLinhas.ToString()+'/'+Uniquery1.RecordCount.ToString();

            end;



            // PASSO 3
            progressBar1.position:=0;
            nLinhas:=0;

            lblAguarde.Caption:='Passo 3 - Processando o Arquivo.. Aguarde!' ;

            strSql:='Select '+
                    'distinct(nu_cns), '+
                    'ID, '+
                    'no_cidadao, '+
                    'nu_cpf, '+
                    'data_Nascto, '+
                    'dose_aplicada, '+
                    'data_aplicacao_dose, '+
                    'lote_vacina_dose, '+
                    'no_imunizante, '+
                    'no_unidade_saude, '+
                    'NO_NOMEAPLICADOR, '+
                    'LOCALIDADE, '+
                    'FABRICANTE_VACINA, '+
                    'NO_SEXO '+
                    'from temp_vacinados '+
                    'where dose_aplicada like ''%2%''' +
                    'order by id';

            uniquery1.close;
            uniquery1.sql.clear;
            uniquery1.sql.add(strsql);
            uniquery1.open;

            uniquery1.Last;
            progressBar1.Max:=uniquery1.recordcount;

            uniquery1.First;

            while not uniquery1.eof do
            begin
              vCPF:=uniquery1.fieldByName('nu_cpf').AsString;
              vCNS:=uniquery1.fieldByName('nu_cns').AsString;
              vNome:=uniquery1.fieldByName('NO_CIDADAO').AsString;
              vDataNasc:=uniquery1.fieldByName('DATA_NASCTO').AsString;
              vDataNasc:=copy(vDataNasc,7,4)+'-'+copy(vDataNasc,4,2)+'-'+copy(vDataNasc,1,2);
              vDose:=uniquery1.fieldByName('DOSE_APLICADA').AsString;
              vDataAplicacao:=uniquery1.fieldByName('DATA_APLICACAO_DOSE').AsString;
              vDataAplicacao:=copy(vDataAplicacao,7,4)+'-'+copy(vDataAplicacao,4,2)+'-'+copy(vDataAplicacao,1,2);

              vLote:=uniquery1.fieldByName('LOTE_VACINA_DOSE').AsString;
              vUnidade:=uniquery1.fieldByName('NO_UNIDADE_SAUDE').AsString;
              vNomeAplicador:=uniquery1.fieldByName('NO_NOMEAPLICADOR').AsString;
              vLocalidade:=uniquery1.fieldByName('LOCALIDADE').AsString;
              vFabricante:=uniquery1.fieldByName('FABRICANTE_VACINA').AsString;
              vImunizante:=uniquery1.fieldByName('NO_IMUNIZANTE').AsString;
              vSexo:=uniquery1.fieldByName('NO_SEXO').AsString;

              qryBusca.close;
              qryBusca.sql.clear;
              qryBusca.sql.add('SELECT first 1 1 as total from tb_vacinacao where NU_CNS = '+QuotedStr(vCNS));
              qryBusca.open;
              if (qryBusca.FieldByName('total').asInteger > 0) then      // achou o cns atualiza, senão, insere
              begin
                strAux:='UPDATE TB_VACINACAO SET DOSE_APLICADA2 = '+quotedStr(vDose)+', DATA_APLICACAO_D2='+quotedStr(vDataAplicacao)+', LOTE_VACINA_D2 = '+quotedStr(vLote)+' WHERE NU_CNS='+QuotedStr(vCNS);
                qryAux.close;
                qryAux.sql.clear;
                qryAux.sql.add(strAux);
                qryAux.execsql;
              end
              else
              begin
                strAux:='INSERT INTO TB_VACINACAO('+
                'NU_CPF, '+
                'NU_CNS, '+
                'NO_CIDADAO, '+
                'DATA_NASCTO, '+
                'DOSE_APLICADA, '+
                'DATA_APLICACAO_DOSE, '+
                'LOTE_VACINA_DOSE, '+
                'NO_UNIDADE_SAUDE, '+
                'NO_NOMEAPLICADOR, '+
                'LOCALIDADE, '+
                'FABRICANTE_VACINA, '+
                'NO_IMUNIZANTE, '+
                'NO_SEXO) '+
                'VALUES ('+
                quotedStr(vCPF)+', '+
                quotedStr(vCNS)+', '+
                quotedStr(vNome)+', '+
                quotedStr(vDataNasc)+', '+
                quotedStr(vDose)+', '+
                quotedStr(vDataAplicacao)+', '+
                quotedStr(vLote)+', '+
                quotedStr(vUnidade)+', '+
                quotedStr(vNomeAplicador)+', '+
                quotedStr(vLocalidade)+', '+
                quotedStr(vFabricante)+', '+
                quotedStr(vImunizante)+', '+
                quotedStr(vSexo)+')';

                qryAux.close;
                qryAux.sql.clear;
                qryAux.sql.add(strAux);
                qryAux.execsql;
              end;

              inc(nLinhas);
              progressBar1.position:=nLinhas;
              uniquery1.next; //próximo registro
              Caption:=nLinhas.ToString()+'/'+Uniquery1.RecordCount.ToString();

            end;




        finally
            progressbar1.visible:=false;
            lblAguarde.visible:=false;
            bitbtn1.enabled:=true;
            speedbutton1.enabled:=true;
            edit1.enabled:=true;
            //CloseFile ( arquivoCSV );
        end;

       Application.messageBox('Importação concluída com sucesso!!','Atenção', MB_ICONINFORMATION + MB_OK);
   end
   else
     Application.messageBox('Você deve selecionar o arquivo CSV para Importação!','Atenção', MB_ICONQUESTION + MB_OK);

end;

procedure TfrmImportacaoCSV.SpeedButton1Click(Sender: TObject);
begin
 if FODialog.execute then
   edit1.text:=FODialog.FileName;
end;

Function TfrmImportacaoCSV.quantaslin ( nomeDoArquivo: String ):integer;
var arq: TextFile;nr:integer;
linha: String;
begin
  nr:=0;
  AssignFile ( arq, nomeDoArquivo );
  Reset ( arq );
  ReadLn ( arq, linha );
  while not Eof ( arq ) do
  begin
    ReadLn ( arq, linha );
    nr:=nr+1;
    next;
  end;
  CloseFile ( arq );
  result:=nr;
end;


end.
