//****************************************************************************//
// Cadastro de Lajes
// Programador: Jocelio G Silva
// Data : 05/02/2021
//****************************************************************************//
unit ufrmProdutosLajes;

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
  TfrmProdutosLajes = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryNOME_FANTASIA: TStringField;
    qryUNIDADE: TStringField;
    qryPRECO_CUSTO: TCurrencyField;
    qryPRECO_VENDEDOR: TCurrencyField;
    qryCUSTO_LIQUIDO: TCurrencyField;
    qryPRECO_VENDA: TCurrencyField;
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
    property departamento_id: integer read FDepartamento_id write FDepartamento_id;
  end;

var
 loForm : TfrmProdutosLajes;

  procedure executa(departamento_id: integer);

implementation

uses uBiblioteca, ufrmProdutosLajesE;

procedure executa(departamento_id: integer);
begin

  if loForm = nil then
    loForm := TfrmProdutosLajes.Create(Application);
  loform.departamento_id := departamento_id;
  loForm.Show;

end;

{$R *.dfm}

procedure TfrmProdutosLajes.actAlterarExecute(Sender: TObject);
var
  id: integer;
begin

  id := qry.fieldbyname('ID').AsInteger;

  ufrmProdutosLajesE.Alterar(id);
  uBiblioteca.AtualizaQuery(qry);

    {volta pro registro}
  QRY.Locate('ID',id,[]);

  inherited;
end;

procedure TfrmProdutosLajes.actExcluirExecute(Sender: TObject);
begin
  ufrmProdutosLajesE.Excluir(qry.FieldByName('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);


  inherited;

end;

procedure TfrmProdutosLajes.actIncluirExecute(Sender: TObject);
begin
  ufrmProdutosLajesE.Incluir(departamento_id);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutosLajes.ASql;
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
               Self.Tabela + ' P, PRODUTOS_LAJES L ' +
           ' where ' +
           '    P.ID = L.PRODUTO_ID';

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);

end;

procedure TfrmProdutosLajes.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not qry.IsEmpty then btnAlterar.Click;
end;

procedure TfrmProdutosLajes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  // LIBERA O FORMULARIO DA MEMORIA
  FreeAndNil(loForm);

end;

procedure TfrmProdutosLajes.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS';
  ASql();

  inherited;

end;

procedure TfrmProdutosLajes.FormShow(Sender: TObject);
begin
  inherited;
  btnLocalizar.Click;
end;


end.
