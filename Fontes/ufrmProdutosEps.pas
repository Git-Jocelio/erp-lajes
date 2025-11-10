unit ufrmProdutosEps;

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
  TfrmProdutosEps = class(TfrmBaseGrade)
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
    procedure ASql();
  public
    { Public declarations }
  end;

var
  loForm: TfrmProdutosEps;

  procedure executa;

implementation

uses ufrmProdutosEpsE, uBiblioteca, unit_principal;

procedure executa;
begin

  if loForm = nil then
  begin

    loForm := TfrmProdutosEps.Create(Application);
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

{ TfrmProdutosEps }

procedure TfrmProdutosEps.actAlterarExecute(Sender: TObject);
begin
  ufrmProdutosEpsE.Alterar(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;
end;

procedure TfrmProdutosEps.actExcluirExecute(Sender: TObject);
begin
  ufrmProdutosEpsE.Excluir(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosEps.actIncluirExecute(Sender: TObject);
begin
  ufrmProdutosEpsE.Incluir;
  uBiblioteca.AtualizaQuery(qry);
  inherited;
end;

procedure TfrmProdutosEps.ASql;
begin

   sSql := ' select ' +
          '    P.ID, P.NOME_FANTASIA, P.UNIDADE, ' +
          '    P.PRECO_CUSTO, P.PRECO_VENDEDOR, P.PRECO_VENDA, ' +
          '    P.ESTOQUE_FISICO, P.PEDIDO_ABERTO, P.ESTOQUE_DISPONIVEL, P.PEDIDO_AGUARDANDO, P.ESTOQUE_LIQUIDO ' +
          ' from ' +
          '    PRODUTOS P, PRODUTOS_EPS E' +
          ' where ' +
          '   P.ID = E.PRODUTO_ID AND REVENDA = ' + QuotedStr('S');

  qry.SQL.Clear;
  qry.SQL.Text := sSql;

end;

procedure TfrmProdutosEps.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not qry.IsEmpty then
    btnAlterar.Click;

end;

procedure TfrmProdutosEps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  form_principal.prc_controla_menu(true);
  FreeAndNil(loForm);

end;

procedure TfrmProdutosEps.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS_EPS';
  ASql();

  inherited;

end;

procedure TfrmProdutosEps.FormShow(Sender: TObject);
begin
  inherited;
  btnLocalizar.Click;
end;


end.
