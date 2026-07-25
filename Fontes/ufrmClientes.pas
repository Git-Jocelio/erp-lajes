unit ufrmClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.DBCtrls, unit_principal,
  frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF;

type
  TfrmClientes = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryCPF_CNPJ: TStringField;
    qryNOME: TStringField;
    qryTELEFONE: TStringField;
    qryCELULAR: TStringField;
    qryATIVO: TStringField;
    qryRG_IE: TStringField;
    qryENDERECO: TStringField;
    qryNUMERO: TStringField;
    qryCOMPLEMENTO: TStringField;
    qryBAIRRO: TStringField;
    qryCIDADE: TStringField;
    qryUF: TStringField;
    qryCEP: TStringField;
    qryDATA_CAD: TDateField;
    qryEMAIL: TStringField;
    qryFIS_JUR: TStringField;
    qryDATA_ALT: TDateField;
    frxReport: TfrxReport;
    frxDBClientes: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actLocalizarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
  private
    procedure ASql();

  public

  end;

var
  loForm :  TfrmClientes;
  procedure executa;

implementation

uses ufrmClientesE, uBiblioteca, unit_funcoes;

procedure executa;

begin
  if loForm = nil then
  begin

    loForm := TfrmClientes.Create(Application);
    form_principal.prc_controla_menu(false);

    // se abrir dentro no painel principal não funciona os edites :(
    //loform.Parent := form_principal.pnl_principal;

    loform.top    :=  form_principal.pnl_Principal.Top;
    loform.Left   := form_principal.pnl_menulateral.Width;

    loForm.Width  := form_principal.pnl_principal.Width;
    loForm.Height := form_principal.pnl_principal.Height;
  end;
  loForm.Show;

end;

{$R *.dfm}

procedure TfrmClientes.actImprimirExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
    frxReport.ShowReport;

end;

procedure TfrmClientes.actIncluirExecute(Sender: TObject);
begin

  ufrmClientesE.Incluir;
  uBiblioteca.AtualizaQuery(qry);

  inherited;

end;


procedure TfrmClientes.actLocalizarExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
    frxReport.ShowReport;

end;

procedure TfrmClientes.actAlterarExecute(Sender: TObject);
var
  id : integer;
begin
  id := qry.fieldbyname('ID').AsInteger;
  ufrmClientesE.Alterar(id);
  uBiblioteca.AtualizaQuery(qry);

  qry.Locate('ID', id, []);

  inherited;

end;

procedure TfrmClientes.actExcluirExecute(Sender: TObject);
begin

  ufrmClientesE.Excluir(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

  inherited;

end;


procedure TfrmClientes.ASql;
begin

  sSql := 'select ' +
          '  P.* '+
          'from ' +
          '  CLIENTES C, PESSOAS P ' +
          'where P.ID = C.PESSOA_ID ';
  QRY.SQL.Clear;
  qry.sql.add(sSql);


end;

procedure TfrmClientes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  form_principal.prc_controla_menu(true);
  FreeAndNil(loForm);

end;

procedure TfrmClientes.FormCreate(Sender: TObject);
begin

  // property tabela no form BaseGrade
  self.Tabela := 'CLIENTES';
  //self.Titulo := 'Cadastro de Clientes' + '[' + self.Tabela + ']';
 // Caption := Titulo;
  ASql();

  inherited;

end;


end.
