unit ufrmContasBancarias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, ufrmContasBancariasE,
  udmConn, udmPrincipal;

type
  TfrmContasBancarias = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryCADASTRADO_EM: TDateField;
    qryCOD_BANCO: TStringField;
    qryNOME: TStringField;
    qryATIVO: TStringField;
    qryALTERADO_EM: TDateField;
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

uses uBiblioteca;

procedure prc_executa;
var
  loForm : TfrmContasBancarias;
begin
  try
    loForm :=  TfrmContasBancarias.Create(Application);
    loForm.ShowModal;
  finally
    FreeAndNil(loform);
  end;
end;

{$R *.dfm}

procedure TfrmContasBancarias.actAlterarExecute(Sender: TObject);
begin
  inherited;
  ufrmContasBancariasE.prc_alterar(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmContasBancarias.actExcluirExecute(Sender: TObject);
begin
  inherited;
  ufrmContasBancariasE.prc_excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmContasBancarias.actIncluirExecute(Sender: TObject);
begin
  inherited;
  ufrmContasBancariasE.prc_incluir;
  uBiblioteca.AtualizaQuery(qry);

end;

function TfrmContasBancarias.fnc_validar_pesquisa: boolean;
begin
  result := false;

  result := true;

end;

procedure TfrmContasBancarias.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CONTAS_BANCARIAS';
  Titulo := 'CONTAS_BANCARIAS' + '[' + Tabela + ']';
  Caption := Titulo;
  prc_sql;

  btnLocalizar.Click;

end;

procedure TfrmContasBancarias.prc_pesquisar;
begin
   qry.close;
   qry.open;
end;

procedure TfrmContasBancarias.prc_sql;
begin
  qry.SQL.Clear;
  qry.SQL.Add('select                  ');
  qry.SQL.Add('  c.id,                 ');
  qry.SQL.Add('  c.cadastrado_em,      ');
  qry.SQL.Add('  c.alterado_em,        ');
  qry.SQL.Add('  b.cod_banco,          ');
  qry.SQL.Add('  p.nome,               ');
  qry.SQL.Add('  c.ativo               ');
  qry.SQL.Add('from                    ');
  qry.SQL.Add('  contas_bancarias c,   ');
  qry.SQL.Add('  bancos b,             ');
  qry.SQL.Add('  pessoas p             ');
  qry.SQL.Add('where                   ');
  qry.SQL.Add('  c.banco_id = b.id and ');
  qry.SQL.Add('  p.id = b.pessoa_id    ');
  qry.Open;
  sSql := qry.SQL.Text;

end;

end.
