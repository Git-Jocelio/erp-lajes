unit ufrmLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage,
  udmConn, uSession, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TfrmLogin = class(TForm)
    pnlFundo: TPanel;
    pnlLateral: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    img_logo: TImage;
    Label6: TLabel;
    Panel1: TPanel;
    Label5: TLabel;
    edtLogin: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Label7: TLabel;
    edtSenha: TEdit;
    Panel4: TPanel;
    Panel5: TPanel;
    btnConfirmar: TSpeedButton;
    btnFechar: TSpeedButton;
    FDQuery1: TFDQuery;
    procedure btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.FormActivate(Sender: TObject);
begin
  pnlFundo.Left := Round((frmLogin.Width - pnlFundo.Width) / 2);
  pnlFundo.Top := Round((frmLogin.Height - pnlFundo.Height) / 2);
end;

procedure TfrmLogin.btnConfirmarClick(Sender: TObject);
var
  qry : TFDQuery;
begin

  if Trim(edtLogin.Text) = '' then
  begin
    ShowMessage('Informe o usuário.');
    edtLogin.SetFocus;
    exit;
  end;

  if Trim(edtSenha.Text) = '' then
  begin
    ShowMessage('Informe a senha.');
    edtSenha.SetFocus;
    exit;
  end;

  qry := TFDQuery.Create(nil);
  try
    qry.Connection :=  dmConn.FDConnection;

    qry.SQL.Text :=
      'select u.id, u.pessoa_id, u.login, p.nome ' +
      'from usuarios u ' +
      'inner join pessoas p on p.id = u.pessoa_id ' +
      'where u.login =:login ' +
      'and u.senha = :senha ' +
      'and u.ativo = ''S''';
    qry.ParamByName('login').AsString := Trim(edtLogin.Text);
    qry.ParamByName('senha').AsString := Trim(edtSenha.Text);

    qry.Open;

    if not qry.IsEmpty then
    begin
      // salvar na session
      UsuarioLogado.ID := qry.FieldByName('id').AsInteger;
      UsuarioLogado.PessoaId := qry.FieldByName('pessoa_id').AsInteger;
      UsuarioLogado.Login := qry.FieldByName('login').AsString;
      UsuarioLogado.Nome := qry.FieldByName('Nome').AsString;

      ModalResult := 1;

    end
    else
    begin
      ShowMessage('Usuário ou senha inválidos!');
      edtSenha.Clear;
      edtLogin.Clear;
    end;

  finally
    qry.Free;
  end;


end;

procedure TfrmLogin.btnFecharClick(Sender: TObject);
begin

  application.Terminate;
end;

end.
