unit ufrmCartaoVendas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.DBCtrls, Vcl.ToolWin, Vcl.StdCtrls, Vcl.Buttons, ufrmCartaoVendasE,
  udmConn, uTipos;

type
  TfrmCartaoVendas = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryCADASTRADO_EM: TDateField;
    qryALTERADO_EM: TDateField;
    qryDATA_VENDA: TDateField;
    qryCARTAO_OPERADORA_ID: TIntegerField;
    qryCARTAO_MAQUINA_ID: TIntegerField;
    qryCARTAO_BANDEIRA_ID: TIntegerField;
    qryCARTAO_FORMA_PAGTO_ID: TIntegerField;
    qryTAXA: TCurrencyField;
    qryVALOR_VENDA: TFMTBCDField;
    qryVALOR_LIQUIDO: TFMTBCDField;
    qryCV: TStringField;
    qryNM_OPERADORA: TStringField;
    qryNM_BANDEIRA: TStringField;
    procedure FormCreate(Sender: TObject);

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure prc_sql;
    function  fnc_validar_pesquisa: boolean;
    procedure prc_pesquisar;
    procedure prc_componenetes;

  public
    { Public declarations }
  end;

procedure prc_executa;

implementation

uses uBiblioteca;

procedure prc_executa;
var
  loForm : TfrmCartaoVendas;
begin
  try
    loForm :=  TfrmCartaoVendas.Create(Application);
    loForm.ShowModal;
  finally
    FreeAndNil(loform);
  end;
end;


{$R *.dfm}

procedure TfrmCartaoVendas.actAlterarExecute(Sender: TObject);
begin
  try
    frmCartaoVendasE := TfrmCartaoVendasE.Create(application);
    frmCartaoVendasE.Codigo   := qry.fieldbyname('ID').AsInteger;
    frmCartaoVendasE.Operacao := opAlterar;
    frmCartaoVendasE.ShowModal;
  finally
    uBiblioteca.AtualizaQuery(qry);
    freeandnil(frmCartaoVendasE);
  end;
end;

procedure TfrmCartaoVendas.actExcluirExecute(Sender: TObject);
begin
  try
    frmCartaoVendasE := TfrmCartaoVendasE.Create(application);
    frmCartaoVendasE.Codigo   := qry.fieldbyname('ID').AsInteger;
    frmCartaoVendasE.Operacao := opExcluir;
    frmCartaoVendasE.ShowModal;
  finally
    uBiblioteca.AtualizaQuery(qry);
    freeandnil(frmCartaoVendasE);
  end;
end;

procedure TfrmCartaoVendas.actIncluirExecute(Sender: TObject);
begin
  inherited;

  try
    frmCartaoVendasE := TfrmCartaoVendasE.Create(application);
    frmCartaoVendasE.Operacao := opincluir;
    frmCartaoVendasE.ShowModal;
  finally
    uBiblioteca.AtualizaQuery(qry);
    freeandnil(frmCartaoVendasE);
  end;

end;

function TfrmCartaoVendas.fnc_validar_pesquisa: boolean;
begin
  result := false;

  result := true;
end;

procedure TfrmCartaoVendas.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CARTAO_VENDAS';
  Titulo := 'VENDAS COM CARTÃO DE CRÉDITO' + '[' + Tabela + ']';
  Caption := Titulo;
  prc_sql;

  btnLocalizar.Click;

end;

procedure TfrmCartaoVendas.FormShow(Sender: TObject);
begin
  inherited;
  prc_componenetes;
end;

procedure TfrmCartaoVendas.prc_componenetes;
begin
  DBGrid1.Columns[0].Visible := false;//id
  DBGrid1.Columns[2].Visible := false;//alterado_em
  DBGrid1.Columns[4].Visible := false;//operadora_id
  DBGrid1.Columns[6].Visible := false;//MAQ_id
  DBGrid1.Columns[7].Visible := false;//BAND_id
  DBGrid1.Columns[9].Visible := false;//FORMPAGTO_id
  //DBGrid1.Columns[14].Visible := false;//VEND_id

end;


procedure TfrmCartaoVendas.prc_pesquisar;
begin
   qry.close;
   qry.open;

end;

procedure TfrmCartaoVendas.prc_sql;
begin
  qry.SQL.Clear;
  qry.sql.add('select                                   ');
  qry.sql.add('  V.ID,                                  ');
  qry.sql.add('  V.CADASTRADO_EM,                       ');
  qry.sql.add('  V.ALTERADO_EM,                         ');
  qry.sql.add('  V.DATA_VENDA,                          ');
  qry.sql.add('  V.CARTAO_OPERADORA_ID,                 ');
  qry.sql.add('  P.NOME AS NM_OPERADORA,                ');
  qry.sql.add('  V.CARTAO_MAQUINA_ID,                   ');
  qry.sql.add('  V.CARTAO_BANDEIRA_ID,                  ');
  qry.sql.add('  B.DESCRICAO AS NM_BANDEIRA,            ');
  qry.sql.add('  V.CARTAO_FORMA_PAGTO_ID,               ');
  qry.sql.add('  V.TAXA,                                ');
  qry.sql.add('  V.VALOR_VENDA,                         ');
  qry.sql.add('  V.VALOR_LIQUIDO,                       ');
  qry.sql.add('  V.CV                                   ');
  qry.sql.add('from                                     ');
  qry.sql.add('  CARTAO_VENDAS V,                       ');
  qry.sql.add('  CARTAO_OPERADORAS O,                   ');
  qry.sql.add('  CARTAO_BANDEIRAS B,                    ');
  qry.sql.add('  PESSOAS P                              ');
  qry.sql.add('where                                    ');
  qry.sql.add('  V.CARTAO_OPERADORA_ID = O.PESSOA_ID AND');
  qry.sql.add('  V.CARTAO_BANDEIRA_ID =  B.ID AND       ');
  qry.sql.add('  P.ID =  O.PESSOA_ID                    ');

  sSql := qry.SQL.Text;
  qry.Open;



end;


end.
