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
    FDepartamento_id: integer;
    procedure ASql();
  public
    property departamento_id: integer read FDepartamento_id write FDepartamento_id;
  end;
var
  loForm : TfrmProdutos;

procedure executa(departamento_id: integer);

implementation

uses uBiblioteca, ufrmProdutosE, ufrmProdutosTrelicaE;

procedure executa(departamento_id: integer);

begin

  if loForm = nil then
    loForm := TfrmProdutos.Create(Application);
  loForm.departamento_id := departamento_id;
  loform.top := 90;
  loform.Left:= 185;

  loform.Height := 600;
  loform.Width := 1000;
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
  ufrmProdutosE.Incluir(departamento_id);
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
