unit ufrmProdutosLajotas;

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
  TfrmProdutosLajotas = class(TfrmBaseGrade)
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
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDepartamento_id: integer;
    procedure ASql();
  public
    property departamento_id :integer read FDepartamento_id write FDepartamento_id;
  end;

var
  loForm : TfrmProdutosLajotas;

  procedure executa(departamento_id: integer);

implementation

uses uBiblioteca, ufrmProdutosLajotasE;

procedure executa(departamento_id: integer);
begin

  if loForm = nil then
    loForm := TfrmProdutosLajotas.Create(Application);
  loForm.departamento_id := departamento_id;
  loForm.Show;

end;

{$R *.dfm}

procedure TfrmProdutosLajotas.actAlterarExecute(Sender: TObject);
begin
  ufrmProdutosLajotasE.Alterar(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;
end;

procedure TfrmProdutosLajotas.actExcluirExecute(Sender: TObject);
begin
  ufrmProdutosLajotasE.Excluir(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;
end;

procedure TfrmProdutosLajotas.actIncluirExecute(Sender: TObject);
begin
  ufrmProdutosLajotasE.Incluir(departamento_id);
  uBiblioteca.AtualizaQuery(qry);
  inherited;
end;

procedure TfrmProdutosLajotas.ASql;
begin

   sSql := ' select ' +
          '    P.ID, P.NOME_FANTASIA, P.UNIDADE, ' +
          '    P.PRECO_CUSTO, P.PRECO_VENDEDOR, P.PRECO_VENDA, ' +
          '    P.ESTOQUE_FISICO, P.PEDIDO_ABERTO, P.ESTOQUE_DISPONIVEL, P.PEDIDO_AGUARDANDO, P.ESTOQUE_LIQUIDO ' +
          ' from ' +
          '    PRODUTOS P, PRODUTOS_LAJOTAS L' +
          ' where ' +
          '   P.ID = L.PRODUTO_ID AND REVENDA = ' + QuotedStr('S');

  qry.close;
  qry.SQL.Clear;
  qry.SQL.Text := sSql;

end;

procedure TfrmProdutosLajotas.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not qry.IsEmpty then
    btnAlterar.Click;

end;

procedure TfrmProdutosLajotas.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  FreeAndNil(loForm);

end;

procedure TfrmProdutosLajotas.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS';
  ASql();

  inherited;
end;

procedure TfrmProdutosLajotas.FormShow(Sender: TObject);
begin
  inherited;
  btnLocalizar.Click;
end;


end.
