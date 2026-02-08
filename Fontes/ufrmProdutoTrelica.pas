unit ufrmProdutoTrelica;

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
  TfrmProdutoTrelica = class(TfrmBaseGrade)
    qryATIVO: TStringField;
    qryID: TIntegerField;
    qryNOME_FANTASIA: TStringField;
    qryPRECO_CUSTO: TCurrencyField;
    qryPERCA: TCurrencyField;
    qryCUSTO_LIQUIDO: TCurrencyField;
    qryKGS_METRO: TCurrencyField;
    procedure FormCreate(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
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
  loForm : TfrmProdutoTrelica;

  procedure executa(departamento_id: integer);
implementation

uses ufrmProdutosTrelicaE, uBiblioteca;

procedure executa(departamento_id: integer);
begin

  if loForm = nil then
    loForm := TfrmProdutoTrelica.Create(Application);
  loform.departamento_id := departamento_id;
  loForm.Show;

end;

{$R *.dfm}

procedure TfrmProdutoTrelica.actAlterarExecute(Sender: TObject);
begin
  ufrmProdutosTrelicaE.Alterar(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutoTrelica.actExcluirExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
  begin
    ufrmProdutosTrelicaE.Excluir(qry.fieldbyname('ID').AsInteger);
    uBiblioteca.AtualizaQuery(qry);
  end;
  inherited;

end;

procedure TfrmProdutoTrelica.actIncluirExecute(Sender: TObject);
begin
  ufrmProdutosTrelicaE.Incluir(departamento_id);
  uBiblioteca.AtualizaQuery(qry);
  inherited;

end;

procedure TfrmProdutoTrelica.ASql;
begin

  {Como são poucos registros, ja abre a tabela mostrando todos}
  sSql := ' select ' +
          '    P.ID, P.NOME_FANTASIA, P.PRECO_CUSTO, P.PERCA, P.CUSTO_LIQUIDO, T.KGS_METRO, P.ATIVO  ' +
          ' from ' +
          '    PRODUTOS P, PRODUTOS_TRELICA T ' +
          ' where ' +
          '    P.ID = T.PRODUTO_ID ';

  qry.close;
  qry.SQL.Clear;
  qry.SQL.Add(sSql);

end;

procedure TfrmProdutoTrelica.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if not qry.IsEmpty then
    btnAlterar.Click;
end;

procedure TfrmProdutoTrelica.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  FreeAndNil(loForm);

end;

procedure TfrmProdutoTrelica.FormCreate(Sender: TObject);
begin
  // property tabela no form BaseGrade
  self.Tabela := 'PRODUTOS';
  ASql();

  inherited;
end;


end.
