unit ufrmPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls;

type
  TfrmPessoas = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryNOME: TStringField;
    qryCPF_CNPJ: TStringField;
    qryTELEFONE: TStringField;
    qryCELULAR: TStringField;
    qryATIVO: TStringField;

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure ASql();


  public
  end;

  //procedure executa();
  var
//    frmPessoas : TfrmPessoas;
  loForm : TfrmPessoas;

procedure prc_executa;

implementation

{$R *.dfm}

uses uBiblioteca, ufrmPessoasE, udmConn, unit_principal;

procedure prc_executa;
//var
//  loForm: TfrmPessoas;
begin
(*  try
    loForm := TfrmPessoas.Create(Application);
    loForm.ShowModal;
  finally
    freeandnil(loForm);
  end;

*)


  if loForm = nil then
  begin

    loForm := TfrmPessoas.Create(Application);
    form_principal.prc_controla_menu(false);

    // se abrir dentro no painel principal não funciona os edites :(
    //frmProdutosVigas.Parent := form_principal.pnl_principal;

    loForm.top    :=  form_principal.pnl_Principal.Top;
    loForm.Left   := form_principal.pnl_menulateral.Width;

    loForm.Width  := form_principal.pnl_principal.Width;
    loForm.Height := form_principal.pnl_principal.Height;

  end;

  loForm.Show;



end;



procedure TfrmPessoas.actAlterarExecute(Sender: TObject);
var
 id : integer;
begin
  id := qry.fieldbyname('ID').AsInteger;
  ufrmPessoasE.Alterar( id );
  uBiblioteca.AtualizaQuery(qry);

  qry.Locate('ID', id, []);

  inherited;

end;

procedure TfrmPessoas.actExcluirExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
  begin
    ufrmPessoasE.Excluir(qry.fieldbyname('ID').AsInteger);
    uBiblioteca.AtualizaQuery(qry);
  end;
  inherited;

end;

procedure TfrmPessoas.actIncluirExecute(Sender: TObject);
begin
  ufrmPessoasE.Incluir;
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmPessoas.ASql;
begin
  sSql :=
          '  select    ' +
          '  ID,       ' +
          '  NOME,     ' +
          '  CPF_CNPJ, ' +
          '  TELEFONE, ' +
          '  CELULAR,  ' +
          '  ATIVO     ' +
          'from        ' +
          '  PESSOAS   ' ;

  QRY.SQL.Clear;
  qry.sql.add(sSql);


end;

procedure TfrmPessoas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  form_principal.prc_controla_menu(true);
  FreeAndNil(loForm);

end;

procedure TfrmPessoas.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'PESSOAS';
  ASql();

  inherited;

end;


end.
