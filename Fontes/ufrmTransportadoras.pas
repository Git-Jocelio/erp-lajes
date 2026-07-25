unit ufrmTransportadoras;

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
  TfrmTransportadoras = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryCPF_CNPJ: TStringField;
    qryNOME: TStringField;
    qryTELEFONE: TStringField;
    qryCELULAR: TStringField;
    qryATIVO: TStringField;
    frxPDFExport1: TfrxPDFExport;
    frxReport: TfrxReport;
    frxDBFornecedores: TfrxDBDataset;
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
    procedure FormCreate(Sender: TObject);

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure actImprimirExecute(Sender: TObject);

  private
    procedure ASql();

  public
    { Public declarations }
  end;
var
  loForm: TfrmTransportadoras;
procedure executa;

implementation

{$R *.dfm}

uses uBiblioteca, ufrmTransportadorasE, unit_funcoes;

procedure executa;

begin

  if loForm = nil then
  begin

    loForm := TfrmTransportadoras.Create(Application);
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


procedure TfrmTransportadoras.actAlterarExecute(Sender: TObject);
begin
  ufrmTransportadorasE.Alterar(qry.fieldbyname('ID').AsInteger);
  uBiblioteca.AtualizaQuery(qry);

  inherited;
end;

procedure TfrmTransportadoras.actExcluirExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
  begin
    ufrmTransportadorasE.Excluir(qry.fieldbyname('ID').AsInteger);
    uBiblioteca.AtualizaQuery(qry);
  end;

  inherited;
end;

procedure TfrmTransportadoras.actImprimirExecute(Sender: TObject);
begin
  if not qry.IsEmpty then
    frxReport.ShowReport

end;

procedure TfrmTransportadoras.actIncluirExecute(Sender: TObject);
begin
  ufrmTransportadorasE.Incluir;
  uBiblioteca.AtualizaQuery(qry);

  inherited;

end;

procedure TfrmTransportadoras.ASql;
begin

  ssql := 'select P.* from ' + Self.Tabela + ' T, PESSOAS P where P.ID = T.PESSOA_ID ';

  QRY.SQL.Clear;
  qry.sql.add(sSql);


end;

procedure TfrmTransportadoras.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

  form_principal.prc_controla_menu(true);
  FreeAndNil(loForm);


end;

procedure TfrmTransportadoras.FormCreate(Sender: TObject);
begin

  // property tabela no form BaseGrade
  self.Tabela := 'TRANSPORTADORAS';

  ASql();

  inherited;

end;


end.
