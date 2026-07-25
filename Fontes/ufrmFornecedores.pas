//***************************************************************************//
// Cadastro de Fornecedores (base ufrmPlanoContas)
// desenvolvida por Jocelio G Silva
// inicio : 22/02/2024  Deus seja louvado.
// fim :
//***************************************************************************//

unit ufrmFornecedores;

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
  ufrmFornecedoresE, unit_principal, frxClass, frxDBSet, udmConn,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmFornecedores = class(TfrmBaseGrade)
    frxReport: TfrxReport;
    frxDBFornecedores: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    qryID: TIntegerField;
    qryNOME: TStringField;
    qryCPF_CNPJ: TStringField;
    qryRG_IE: TStringField;
    qryENDERECO: TStringField;
    qryNUMERO: TStringField;
    qryCOMPLEMENTO: TStringField;
    qryBAIRRO: TStringField;
    qryCIDADE: TStringField;
    qryUF: TStringField;
    qryCEP: TStringField;
    qryTELEFONE: TStringField;
    qryCELULAR: TStringField;
    qryDATA_CAD: TDateField;
    qryEMAIL: TStringField;
    qryFIS_JUR: TStringField;
    qryATIVO: TStringField;
    qryDATA_ALT: TDateField;
    qryID_1: TIntegerField;
    qryPESSOA_ID: TIntegerField;
    qryCONTATOS: TStringField;
    qryTELEFONES_CONTATO: TStringField;
    qryPRODUTOS: TStringField;
    qryRAMO_ATIVIDADE: TStringField;
    qryATIVO_1: TStringField;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);

  private
    Ffornecedor_id: integer;
    procedure prc_sql;

  public
    { Public declarations }
    property fornecedor_id : integer read Ffornecedor_id write Ffornecedor_id;
  end;
var
 frmFornecedores : TfrmFornecedores;


implementation

uses unit_funcoes;


{$R *.dfm}



procedure TfrmFornecedores.actAlterarExecute(Sender: TObject);
var
  id : integer;
begin

  id := qry.fieldbyname('ID').AsInteger;
  ufrmFornecedoresE.prc_alterar(id);
  uBiblioteca.AtualizaQuery(qry);

  qry.Locate('ID', id, []);

  inherited;

end;

procedure TfrmFornecedores.actExcluirExecute(Sender: TObject);
begin
  ufrmFornecedoresE.prc_excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

  inherited;

end;

procedure TfrmFornecedores.actImprimirExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
    frxReport.ShowReport;

end;

procedure TfrmFornecedores.actIncluirExecute(Sender: TObject);
begin
  ufrmFornecedoresE.prc_incluir;
  uBiblioteca.AtualizaQuery(qry);

  inherited;
end;

procedure TfrmFornecedores.btn_fecharClick(Sender: TObject);
begin

  if not qry.IsEmpty then fornecedor_id := qry.FieldByName('ID').AsInteger;
  inherited;

end;

procedure TfrmFornecedores.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  //se o botao incluir estiver desabilitado
  //é pq foi a tela de compras que chamou
  if btnIncluir.Visible = false then
   if not qry.IsEmpty then
   begin
    fornecedor_id := qry.FieldByName('ID').AsInteger;
    close;
   end;
end;

procedure TfrmFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  // fornecedor selecionado

end;

procedure TfrmFornecedores.FormCreate(Sender: TObject);
begin

  self.Tabela := 'FORNECEDORES';
  prc_sql;
  inherited;

end;


procedure TfrmFornecedores.prc_sql;
begin
  qry.SQL.Clear;
  sSql :=  ' select ' +
           '   P.*, ' +
           '   F.* ' +
           ' from  ' +
           '   PESSOAS P, FORNECEDORES F ' +
           ' where ' +
           '   P.ID = F.PESSOA_ID ';

  QRY.SQL.Clear;
  qry.sql.add(sSql);

end;

end.
