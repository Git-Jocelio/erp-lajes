unit ufrmProdutosAdicional;

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
  TfrmProdutosAdicional = class(TfrmBaseGrade)
    qryATIVO: TStringField;
    qryID: TIntegerField;
    qryNOME_FANTASIA: TStringField;
    qryPRECO_CUSTO_12MT: TCurrencyField;
    qryPERCA: TCurrencyField;
    qryCUSTO_LIQUIDO: TCurrencyField;
    qryPRECO_VENDEDOR: TCurrencyField;
    qryPRECO_VENDA: TCurrencyField;
    qryCUSTO_METRO: TFMTBCDField;
    procedure FormCreate(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FDepartamento: integer;
    procedure ASql();
  public
    property departamento_id: integer read FDepartamento write FDepartamento;
  end;

  var
  loForm :TfrmProdutosAdicional;
  procedure executa(departamento_id: integer);

implementation

uses uBiblioteca, ufrmProdutosAdicionalE;

procedure executa(departamento_id: integer);
begin

  if loForm = nil then
    loForm := TfrmProdutosAdicional.Create(Application);

  departamento_id := loForm.departamento_id;
  loForm.Show;

end;

{$R *.dfm}

procedure TfrmProdutosAdicional.actAlterarExecute(Sender: TObject);
var
   id : integer;
begin

  id := qry.fieldbyname('ID').AsInteger;
  ufrmProdutosAdicionalE.Alterar(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

  qry.Locate('id',id,[]);
  inherited;
end;

procedure TfrmProdutosAdicional.actExcluirExecute(Sender: TObject);
begin
  ufrmProdutosAdicionalE.Excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosAdicional.actIncluirExecute(Sender: TObject);
begin
  ufrmProdutosAdicionalE.Incluir(departamento_id);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosAdicional.ASql;
begin

  sSql :=   ' select ' +
            '   P.ID, ' +
            '   P.NOME_FANTASIA, ' +
            '   A.PRECO_CUSTO_12MT,' +
            '   A.PRECO_CUSTO_12MT/12 AS CUSTO_METRO, ' +
            '   P.PERCA, ' +
            '   P.CUSTO_LIQUIDO, ' +
            '   P.PRECO_VENDEDOR, ' +
            '   P.PRECO_VENDA, ' +
            '   P.ATIVO ' +
            ' from ' +
            '   PRODUTOS P, ' +
            '   PRODUTOS_ADICIONAL A ' +
            ' where ' +
            '   P.ID = A.PRODUTO_ID ';

  qry.close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);

end;

procedure TfrmProdutosAdicional.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not qry.IsEmpty then
    btnAlterar.Click;
end;

procedure TfrmProdutosAdicional.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(loForm);

end;

procedure TfrmProdutosAdicional.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS';
  ASql();

  inherited;

end;

procedure TfrmProdutosAdicional.FormShow(Sender: TObject);
begin
  inherited;
  btnLocalizar.Click;
end;


end.
