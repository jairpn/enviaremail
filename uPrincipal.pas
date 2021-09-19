unit uPrincipal;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
    Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
    IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
    IdSMTPBase, IdSMTP, Vcl.StdCtrls, IdMessage, Data.DB, Data.Win.ADODB,
    Vcl.Grids, Vcl.DBGrids, DBAccess, Uni, MemDS, UniProvider, MySQLUniProvider,
    Vcl.ComCtrls;

type
    TfrmPrincipal = class(TForm)
        btnEnviar: TButton;
        IdSMTP1: TIdSMTP;
        IdMessage1: TIdMessage;
        edtMax: TEdit;
        ProgressBar1: TProgressBar;
        edtDe: TEdit;
        Label1: TLabel;
        Label2: TLabel;
        edtPara: TEdit;
        Label3: TLabel;
        Edit1: TEdit;
        Label4: TLabel;
        procedure btnEnviarClick(Sender: TObject);
        private
            { Private declarations }
        public
            { Public declarations }

    end;

var
      frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
var
      I, contagem, enviados, contProgressBar: integer;
begin
    Application.ProcessMessages;
    Screen.Cursor := -11;
    contagem := StrToInt(edtMax.Text);
    enviados := 0;
    contProgressBar := 0;
    ProgressBar1.Position := 0;
    Application.ProcessMessages;
    ProgressBar1.Min := 0;
    ProgressBar1.Max := contagem;

    for I := 0 to contagem - 1 do
        begin
            Application.ProcessMessages;
            frmPrincipal.Caption := IntToStr(enviados);
            frmPrincipal.Refresh;
            Application.ProcessMessages;

            inc(contProgressBar);
            ProgressBar1.Position := contProgressBar;

            Application.ProcessMessages;
            IdMessage1.Body.Clear;
            IdMessage1.ContentType := 'text/html';
            IdMessage1.CharSet := 'UTF-8';

            IdMessage1.Body.Add('<HTML><BODY>');

            IdMessage1.From.Address := edtDe.Text;

            IdMessage1.Recipients.EMailAddresses := edtPara.Text;

            IdMessage1.From.Name := 'Toma Emails';
            IdMessage1.Subject := '(Tenha um Cara que arrebenta sua Caixa de e-mail sem encargos)';

            IdMessage1.Body.Add('<br />');

            IdMessage1.Body.Add('Olá! Tudo bem por aí');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('Tenha um vendedor a mais de maneira simples, me falaram q vocês  gostariam de' +
                  ' receber muitos emails. Na realidade milhares de emails.');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('Procede? Também mandamos emails para encher a paciência de qualquer um.');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('Integra automaticamente seu sistema, quantas vezes for necessário, ida e retorno.Ok?');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('Zé do emails');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('Amigos, já pedi para não mandarem emails para mim. Vocês vem ignorando.');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('Vamos fazer o seguinte: No momento vão 100 emails para encher sua caixa postal.');
            IdMessage1.Body.Add('<br />');
            IdMessage1.Body.Add('Se não enviarem um comprovante de que me tiraram dessa lista vou aumentar para 1.000 emails e depois 2.000 e vou aumentando, ok?.');

            Application.ProcessMessages;
            IdSMTP1.Connect;
            Application.ProcessMessages;
            try
                IdSMTP1.Send(IdMessage1);
            finally
                IdSMTP1.Disconnect;
            end;
            Application.ProcessMessages;
            inc(enviados);

        end;

    Screen.Cursor := 0;
    frmPrincipal.Caption := 'Enviados ' + IntToStr(contagem) + ' emails';

end;

end.
