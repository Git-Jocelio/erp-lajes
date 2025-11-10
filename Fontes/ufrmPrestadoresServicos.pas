unit ufrmPrestadoresServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls;

type
  TfrmPrestadoresServicos = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryNOME: TStringField;
    qryCPF_CNPJ: TStringField;
    qryCONTATO: TStringField;
    qryCELULAR: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actIncluirExecute(Sender: TObject);
  private
    procedure prc_sql;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrestadoresServicos: TfrmPrestadoresServicos;

implementation

{$R *.dfm}

uses uBiblioteca, udmConn, ufrmPrestadoresServicosE;

procedure TfrmPrestadoresServicos.actAlterarExecute(Sender: TObject);
var
  id : integer;
begin

  id := qry.fieldbyname('ID').AsInteger;
  ufrmPrestadoresServicosE.prc_alterar(id);
  uBiblioteca.AtualizaQuery(qry);

  qry.Locate('ID', id, []);

  inherited;

end;

procedure TfrmPrestadoresServicos.actExcluirExecute(Sender: TObject);
begin
  ufrmPrestadoresServicosE.prc_excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

  inherited;
end;

procedure TfrmPrestadoresServicos.actIncluirExecute(Sender: TObject);
begin
  ufrmPrestadoresServicosE.prc_incluir;
  uBiblioteca.AtualizaQuery(qry);

  inherited;
end;

procedure TfrmPrestadoresServicos.FormCreate(Sender: TObject);
begin
  tabela := 'PRESTADORES_SERVICOS';
  prc_sql;
  inherited;
end;

procedure TfrmPrestadoresServicos.prc_sql;
begin
  qry.SQL.Clear;
  sSql :=  ' select ' +
           '   P.ID, P.NOME, P.CPF_CNPJ, S.CONTATO, S.CELULAR ' +
           ' from  ' +
           '   PESSOAS P, PRESTADORES_SERVICOS S ' +
           ' where ' +
           '   P.ID = S.PESSOA_ID ';

  QRY.SQL.Clear;
  qry.sql.add(sSql);

end;


end.
