unit ufrmCartaoFormasPagto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, uBiblioteca,
  ufrmCartaoFormasPagtoE, udmConn;

type
  TfrmCartaoFormasPagto = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryDESCRICAO: TStringField;
    qryDEBITO: TStringField;
    qryCREDITO: TStringField;
    qryQTDE_PARCELAS: TIntegerField;
    qryATIVO: TStringField;

    procedure FormCreate(Sender: TObject);

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private

    procedure prc_sql;
    function  fnc_validar_pesquisa: boolean;
    procedure prc_pesquisar;

  public
    { Public declarations }
  end;

procedure prc_executa;

implementation

procedure prc_executa;
var
  loForm :  TfrmCartaoFormasPagto;
begin
  try
    loForm :=  TfrmCartaoFormasPagto.Create(Application);
    loForm.ShowModal;
  finally
    FreeAndNil(loform);
  end;
end;


{$R *.dfm}

procedure TfrmCartaoFormasPagto.actAlterarExecute(Sender: TObject);
begin
  inherited;
  ufrmCartaoFormasPagtoE.prc_alterar(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmCartaoFormasPagto.actExcluirExecute(Sender: TObject);
begin
  inherited;
  ufrmCartaoFormasPagtoE.prc_excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);
end;

procedure TfrmCartaoFormasPagto.actIncluirExecute(Sender: TObject);
begin
  inherited;
  ufrmCartaoFormasPagtoE.prc_incluir;
  uBiblioteca.AtualizaQuery(qry);

end;

function TfrmCartaoFormasPagto.fnc_validar_pesquisa: boolean;
begin
  result := false;

  result := true;

end;

procedure TfrmCartaoFormasPagto.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CARTAO_FORMAS_PAGTO';
  Titulo := 'CONFIGURAÇÃO DE FORMA DE PAGTO DE CARTÃO DE CRÉDITO' + '[' + Tabela + ']';
  Caption := Titulo;
  prc_sql;

  btnLocalizar.Click;

end;

procedure TfrmCartaoFormasPagto.prc_pesquisar;
begin
  qry.close;

  qry.Open;

end;

procedure TfrmCartaoFormasPagto.prc_sql;
begin

  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select                ');
  qry.SQL.Add('  ID,                 ');
  qry.SQL.Add('  DESCRICAO,          ');
  qry.SQL.Add('  DEBITO,             ');
  qry.SQL.Add('  CREDITO,            ');
  qry.SQL.Add('  QTDE_PARCELAS,      ');
  qry.SQL.Add('  ATIVO               ');
  qry.SQL.Add('from                  ');
  qry.SQL.Add('  CARTAO_FORMAS_PAGTO ');
  QRY.Open;

  sSql := qry.SQL.Text;

end;

end.
