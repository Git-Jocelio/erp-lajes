unit ufrmProdutosBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, uBiblioteca, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TfrmProdutosBomba = class(TfrmBaseGrade)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDepartamento_id: integer;

    procedure ASql();
  public
    property departamento_id: integer read FDepartamento_id write FDepartamento_id ;
  end;
var
  loForm : TfrmProdutosBomba;

procedure executa(departamento_id: integer);

implementation

uses ufrmProdutosBombaE;

procedure executa(departamento_id: integer);
begin

  if loForm = nil then
    loForm := TfrmProdutosBomba.Create(Application);

  loform.departamento_id := departamento_id;
  loForm.Show;

end;

{$R *.dfm}

procedure TfrmProdutosBomba.actAlterarExecute(Sender: TObject);
begin
  inherited;
  ufrmProdutosBombaE.Alterar(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmProdutosBomba.actExcluirExecute(Sender: TObject);
begin
  ufrmProdutosBombaE.Excluir(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosBomba.actIncluirExecute(Sender: TObject);
begin
  ufrmProdutosBombaE.Incluir(departamento_id);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosBomba.ASql;
begin
//  qry.Open('select * from ' + Self.Tabela + ' P, PRODUTOS_BOMBA B where P.ID = B.PRODUTO_ID and P.ID = -1');

  sSql :=  ' select                 ' +
           '   P.ID,                ' +
           '   P.NOME_FANTASIA,     ' +
           '   P.UNIDADE,           ' +
           '   P.PRECO_CUSTO,       ' +
           '   P.PRECO_VENDEDOR,    ' +
           '   P.CUSTO_LIQUIDO,     ' +
           '   P.PRECO_VENDA        ' +
           ' from ' +
           '   PRODUTOS P, PRODUTOS_BOMBA B ' +
           ' where ' +
           '    P.ID = B.PRODUTO_ID';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);



end;

procedure TfrmProdutosBomba.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin

  inherited;
  // LIBERA O FORMULARIO DA MEMORIA
  FreeAndNil(loForm);

end;

procedure TfrmProdutosBomba.FormCreate(Sender: TObject);
begin

  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS';
  ASql();

  inherited;

end;

procedure TfrmProdutosBomba.FormShow(Sender: TObject);
begin
  inherited;
  btnLocalizar.Click;
end;


end.
