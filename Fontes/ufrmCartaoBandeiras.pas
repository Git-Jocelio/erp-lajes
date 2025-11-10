unit ufrmCartaoBandeiras;

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
  ufrmCartaoBandeirasE, udmConn;

type
  TfrmCartaoBandeiras = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryDESCRICAO: TStringField;
    qryATIVO: TStringField;
    GroupBox1: TGroupBox;
    Label1: TLabel;

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
  loForm :  TfrmCartaoBandeiras;
begin
  try
    loForm :=  TfrmCartaoBandeiras.Create(Application);
    loForm.ShowModal;
  finally
    FreeAndNil(loform);
  end;
end;

{$R *.dfm}

procedure TfrmCartaoBandeiras.actAlterarExecute(Sender: TObject);
begin
  inherited;
  ufrmCartaoBandeirasE.prc_alterar(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmCartaoBandeiras.actExcluirExecute(Sender: TObject);
begin
  inherited;
  ufrmCartaoBandeirasE.prc_excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmCartaoBandeiras.actIncluirExecute(Sender: TObject);
begin
  inherited;
  ufrmCartaoBandeirasE.prc_incluir;
  uBiblioteca.AtualizaQuery(qry);

end;

function TfrmCartaoBandeiras.fnc_validar_pesquisa: boolean;
begin
  result := false;

  result := true;

end;

procedure TfrmCartaoBandeiras.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CARTAO_BANDEIRAS';
  Titulo := 'BANDEIRAS DE CARTÃO DE CRÉDITO' + '[' + Tabela + ']';
  Caption := Titulo;
  prc_sql;

  btnLocalizar.Click;

end;

procedure TfrmCartaoBandeiras.prc_pesquisar;
begin
  qry.close;

  qry.Open;

end;

procedure TfrmCartaoBandeiras.prc_sql;
begin

  qry.Open('select * from ' + Tabela );
  sSql := qry.SQL.Text;

end;

end.
