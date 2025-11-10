unit ufrmEmpresa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, uClasse.Empresa, udmConn, ufrmEmpresaE,
  Vcl.ExtCtrls, Vcl.DBCtrls, unit_principal, uBiblioteca;

type
  TfrmEmpresa = class(TfrmBaseGrade)
    qryNOME_FANTASIA: TStringField;
    qryCPF_CNPJ: TStringField;
    qryENDERECO: TStringField;
    qryNUMERO: TStringField;
    qryBAIRRO: TStringField;
    qryCIDADE: TStringField;
    qryUF: TStringField;
    qryCEP: TStringField;
    qryPESSOA_ID: TIntegerField;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private
    FsqlPadrao: string;
    { Private declarations }
  public
    { Public declarations }
    property sqlPadrao: string read FsqlPadrao write FsqlPadrao;
  end;
var
  loForm :  TfrmEmpresa;
procedure executa;

implementation

uses unit_funcoes;

procedure executa;

begin

  if loForm = nil then
  begin

    loForm := TfrmEmpresa.Create(Application);
    form_principal.prc_controla_menu(false);

    // se abrir dentro no painel principal não funciona os edites :(
    //loform.Parent := form_principal.pnl_principal;

    loform.top    :=  form_principal.pnl_Principal.Top;
    loform.Left   := form_principal.pnl_menulateral.Width;

    loForm.Width  := form_principal.pnl_principal.Width;
    loForm.Height := form_principal.pnl_principal.Height;
  end;
  loForm.Show;

end;


{$R *.dfm}

procedure TfrmEmpresa.actAlterarExecute(Sender: TObject);
begin
  {Passo a pessoa}
 // ufrmEmpresaE.Alterar(DBGrid1.DataSource.DataSet.FieldByName('PESSOA_ID').AsInteger);
  ufrmEmpresaE.Alterar(QRY.FieldByName('PESSOA_ID').AsInteger);

  {consulta sem parametro}
 // ds.DataSet := dmConn.empresa.fnc_consulta(sqlPadrao,'');

  ubiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmEmpresa.actExcluirExecute(Sender: TObject);
begin

  ufrmEmpresaE.Excluir(QRY.FieldByName('PESSOA_ID').AsInteger);

  {consulta sem parametro}
  //ds.DataSet := dmConn.empresa.fnc_consulta(sqlPadrao,'');
  inherited;

end;

procedure TfrmEmpresa.actIncluirExecute(Sender: TObject);
begin
  if not ds.DataSet.IsEmpty then
  begin
    CriarMensagem('AVISO','Ja existe uma EMPRESA cadastrada para o sistema');
    exit;
  end;

  ufrmEmpresaE.Incluir;

  {consulta sem parametro}
//  ds.DataSet := dmConn.empresa.fnc_consulta(sqlPadrao,'');
  inherited;

end;

procedure TfrmEmpresa.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 // dmconn.empresa.Destroy;

  inherited;

  form_principal.prc_controla_menu(true);
  FreeAndNil(loForm);

end;

procedure TfrmEmpresa.FormCreate(Sender: TObject);
begin

  self.Tabela := 'EMPRESA';
  //self.Titulo := 'Cadastro da Empresa' + '[' + self.Tabela + ']';
  //Caption := Titulo;

  {cria a classe empresa declarada no puclic do dmConn}
//  dmconn.empresa := TEmpresa.create ( self.Conexao );

  {listar todas a empresas cadastradas}
//  sqlPadrao := 'select E.ID as EMPRESA_ID, P.ID as PESSOA_ID, P.CPF_CNPJ, E.NOME_FANTASIA, P.ENDERECO, P.NUMERO, P.BAIRRO, P.CIDADE, P.UF, P.CEP from EMPRESA E, PESSOAS P where P.ID = E.PESSOA_ID';
  sSql := 'select P.ID as PESSOA_ID, E.NOME_FANTASIA, P.CPF_CNPJ, P.ENDERECO, P.NUMERO, P.BAIRRO, P.CIDADE, P.UF, P.CEP from EMPRESA E, PESSOAS P where P.id = e.pessoa_id';
  {consulta sem parametro}
//  ds.DataSet := dmConn.empresa.fnc_consulta(sqlPadrao,'');

  QRY.SQL.Clear;
  qry.sql.add(sSql);


  inherited;
end;

end.
