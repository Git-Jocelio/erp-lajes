//***************************************************************************//
// Cadastro de usuário
// desenvolvida por Jocelio G Silva
// inicio : 23/02/2022
// fim :
//***************************************************************************//

unit ufrmUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, uBiblioteca,
  ufrmUsuariosE, unit_principal;

type
  TfrmUsuarios = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryNOME: TStringField;
    qryCPF_CNPJ: TStringField;
    qryTELEFONE: TStringField;
    qryCELULAR: TStringField;
    qryATIVO: TStringField;
    qryLOGIN: TStringField;
    qrySENHA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);

  private
    procedure prc_sql;

  public
    { Public declarations }
  end;

procedure prc_executa;
var
  loForm :  TfrmUsuarios;

implementation

procedure prc_executa;

begin
  try
    if loForm = nil then
    begin

      loForm := TfrmUsuarios.Create(Application);
      form_principal.prc_controla_menu(false);

      // se abrir dentro no painel principal não funciona os edites :(
      //loform.Parent := form_principal.pnl_principal;

      loform.top    :=  form_principal.pnl_Principal.Top;
      loform.Left   := form_principal.pnl_menulateral.Width;

      loForm.Width  := form_principal.pnl_principal.Width;
      loForm.Height := form_principal.pnl_principal.Height;
    end;
    loForm.Showmodal;
  finally
    freeandnil(loform);
  end;
end;

{$R *.dfm}



procedure TfrmUsuarios.prc_sql;
begin

  self.ssql := ' select ' +
                  'P.ID, P.NOME, P.CPF_CNPJ, P.TELEFONE, P.CELULAR, X.ATIVO,X.LOGIN, X.SENHA ' +
               ' from ' +
                   Self.Tabela + ' X, PESSOAS P ' +
               ' where P.ID = X.PESSOA_ID';

  QRY.SQL.Clear;
  qry.sql.add(sSql);

end;

procedure TfrmUsuarios.actAlterarExecute(Sender: TObject);
begin
  //ShowMessage(qry.SQL.Text);
  ufrmUsuariosE.prc_alterar(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmUsuarios.actExcluirExecute(Sender: TObject);
begin
  ufrmUsuariosE.prc_excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmUsuarios.actIncluirExecute(Sender: TObject);
begin
  ufrmUsuariosE.prc_incluir;
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  form_principal.prc_controla_menu(true);
//  FreeAndNil(loForm);

end;

procedure TfrmUsuarios.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'USUARIOS';
  prc_sql;

  inherited;

end;

end.

