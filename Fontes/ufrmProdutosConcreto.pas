unit ufrmProdutosConcreto;

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
  TfrmProdutosConcreto = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryNOME_FANTASIA: TStringField;
    qryUNIDADE: TStringField;
    qryPRECO_CUSTO: TCurrencyField;
    qryPRECO_VENDEDOR: TCurrencyField;
    qryCUSTO_LIQUIDO: TCurrencyField;
    qryPRECO_VENDA: TCurrencyField;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

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
  loForm :TfrmProdutosConcreto;

  procedure execute;

implementation

uses uBiblioteca, ufrmProdutosConcretoE, unit_principal;

procedure execute;

begin

  if loForm = nil then
  begin

    loForm := TfrmProdutosConcreto.Create(Application);
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

procedure TfrmProdutosConcreto.actAlterarExecute(Sender: TObject);
begin
  ufrmProdutosconcretoE.Alterar(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosConcreto.actExcluirExecute(Sender: TObject);
begin
  ufrmProdutosconcretoE.Excluir(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosConcreto.actIncluirExecute(Sender: TObject);
begin

  ufrmProdutosConcretoE.Incluir;
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosConcreto.ASql;
begin

  sSql :=  ' select                 ' +
           '   P.ID,                ' +
           '   P.NOME_FANTASIA,     ' +
           '   P.UNIDADE,           ' +
           '   P.PRECO_CUSTO,       ' +
           '   P.PRECO_VENDEDOR,    ' +
           '   P.CUSTO_LIQUIDO,     ' +
           '   P.PRECO_VENDA        ' +
           ' from ' +
               Self.Tabela + ' P, PRODUTOS_CONCRETO C ' +
           ' where ' +
           '    P.ID = C.PRODUTO_ID';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);

end;

procedure TfrmProdutosConcreto.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not qry.IsEmpty then
    btnAlterar.Click;
end;

procedure TfrmProdutosConcreto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  // LIBERA O FORMULARIO DA MEMORIA
  form_principal.prc_controla_menu(true);
  FreeAndNil(loForm);

end;

procedure TfrmProdutosConcreto.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS';
  ASql();

  inherited;

end;

procedure TfrmProdutosConcreto.FormShow(Sender: TObject);
begin
  inherited;
  btnLocalizar.Click;
end;


end.
