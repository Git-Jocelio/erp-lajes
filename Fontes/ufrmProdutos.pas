unit ufrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmProdutos = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryNOME_FANTASIA: TStringField;
    qryUNIDADE: TStringField;
    qryPRECO_CUSTO: TCurrencyField;
    qryPRECO_VENDEDOR: TCurrencyField;
    qryPRECO_VENDA: TCurrencyField;
    qryESTOQUE_FISICO: TCurrencyField;
    qryPEDIDO_ABERTO: TCurrencyField;
    qryESTOQUE_DISPONIVEL: TCurrencyField;
    qryPEDIDO_AGUARDANDO: TCurrencyField;
    qryESTOQUE_LIQUIDO: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure ASql();
  public
    { Public declarations }
  end;
var
  loForm : TfrmProdutos;

procedure executa;

implementation

uses uBiblioteca, ufrmProdutosE, ufrmProdutosTrelicaE, unit_principal;

procedure executa;

begin

  if loForm = nil then
  begin
    loForm := TfrmProdutos.Create(Application);
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

procedure TfrmProdutos.actAlterarExecute(Sender: TObject);
var
  id: integer;
begin
  id := qry.fieldbyname('ID').AsInteger;

  ufrmProdutosE.Alterar(id);
  uBiblioteca.AtualizaQuery(qry);

  {volta pro registro}
  QRY.Locate('ID',id,[]);

  inherited;

end;

procedure TfrmProdutos.actExcluirExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
  begin
    ufrmProdutosE.Excluir(qry.fieldbyname('ID').AsInteger);
    uBiblioteca.AtualizaQuery(qry);
  end;
  inherited;

end;

procedure TfrmProdutos.actIncluirExecute(Sender: TObject);
begin
  ufrmProdutosE.Incluir;
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutos.ASql;
begin

  sSql := ' select ' +
          '    ID, NOME_FANTASIA, UNIDADE, ' +
          '    PRECO_CUSTO, PRECO_VENDEDOR, PRECO_VENDA, ' +
          '    ESTOQUE_FISICO, PEDIDO_ABERTO, ESTOQUE_DISPONIVEL, PEDIDO_AGUARDANDO, ESTOQUE_LIQUIDO ' +
          ' from ' +
          '    PRODUTOS ' +
          ' where ' +
          '    REVENDA = ' + QuotedStr('S');

  QRY.SQL.Clear;
  qry.sql.add(sSql);

end;

procedure TfrmProdutos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btnAlterar.Click;
end;

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  inherited;

  form_principal.prc_controla_menu(true);
  FreeAndNil(loForm);

end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin

  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS';

  ASql();

  inherited;
end;


end.
