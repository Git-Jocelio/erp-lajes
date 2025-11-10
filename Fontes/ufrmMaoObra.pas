unit ufrmMaoObra;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, uBiblioteca, ufrmMaoObraE;

type
  TfrmMaoObra = class(TfrmBaseGrade)

    procedure FormCreate(Sender: TObject);

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);

  private
    procedure prc_sql;
    { Private declarations }
  public
    { Public declarations }
  end;

procedure prc_executa;

implementation

procedure prc_executa;
var
 loForm : TfrmMaoObra;
begin
  try
    loForm := TfrmMaoObra.Create(application);
    loform.ShowModal;
  finally
    freeandnil(loForm);
  end;
end;


{$R *.dfm}

procedure TfrmMaoObra.prc_sql;
begin
  qry.SQL.Clear;
  qry.SQL.Add('select ID, CADASTRADO_EM, ALTERADO_EM, DESCRICAO, VALOR, UNIDADE, ATIVO from ' + tabela );
  sSql := qry.SQL.Text;

  qry.Open;
end;


procedure TfrmMaoObra.actAlterarExecute(Sender: TObject);
var
  id : integer;
begin
  inherited;
  id := qry.fieldbyname('ID').AsInteger;
  ufrmMaoObraE.prc_alterar(id);
  uBiblioteca.AtualizaQuery(qry);

  qry.Locate('ID', id, []);

end;

procedure TfrmMaoObra.actExcluirExecute(Sender: TObject);
begin
  inherited;
  ufrmMaoObraE.prc_excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmMaoObra.actIncluirExecute(Sender: TObject);
begin
  inherited;
  ufrmMaoObraE.prc_incluir;
  uBiblioteca.AtualizaQuery(qry);

end;

procedure TfrmMaoObra.FormCreate(Sender: TObject);
begin
  inherited;
  self.Tabela := 'MAO_OBRA';
  self.Titulo := 'CADASTRO DE MÃO-DE-OBRA' + '[' + self.Tabela + ']';
  Caption := Titulo;
  prc_sql;

  btnLocalizar.Click;

end;



end.
