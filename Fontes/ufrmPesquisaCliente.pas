unit ufrmPesquisaCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBasePesquisa, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, uTipos,
   Vcl.Mask;

type
  TfrmPesquisaCliente = class(TfrmBasePesquisa)
    rgTipo: TRadioGroup;
    Label1: TLabel;
    pnl_cabecalho: TPanel;
    btn_fechar: TSpeedButton;
    lbl_titulo: TLabel;
    pnl_separa_topo: TPanel;
    btn_incluir_novo_cliente: TSpeedButton;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btn_incluir_novo_clienteClick(Sender: TObject);
    procedure btnConfirmaClick(Sender: TObject);

    procedure edLocalizarChange(Sender: TObject);
    procedure rgTipoClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure btn_fecharClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
  private
    FCodigo: integer;
    FConfirmado: boolean;

  public
    property Codigo : integer read FCodigo write FCodigo;
    property Confirmado : boolean read FConfirmado write FConfirmado;

  end;


function executa: integer;

var
 aSql : string;

implementation

uses uBiblioteca, unit_principal, ufrmClientesE, unit_funcoes;

function executa: integer;
var
  loform : TfrmPesquisaCliente;
begin
  try

    loForm := TfrmPesquisaCliente.Create(Application);
    loForm.Showmodal;
    Result := loForm.Codigo;

  finally
    FreeAndNil(loform) ;
  end;
end;


{$R *.dfm}


procedure TfrmPesquisaCliente.btnConfirmaClick(Sender: TObject);
begin
  inherited;
  confirmado := true;
  Codigo     := qry.FieldByName('ID').AsInteger;
  close;
end;

procedure TfrmPesquisaCliente.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btnConfirma.Enabled := not qry.IsEmpty;

end;

procedure TfrmPesquisaCliente.edLocalizarChange(Sender: TObject);
begin

  inherited;
  uBiblioteca.FilterCds(qry, uTipos.fsString,'%' + edLocalizar.Text + '%' );
  db.ShowHint := not qry.IsEmpty;

  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );



end;

procedure TfrmPesquisaCliente.FormActivate(Sender: TObject);
begin
  inherited;



  edLocalizar.Text := 'CONSUMIDOR';
  confirmado := true;

  Codigo     := qry.FieldByName('ID').AsInteger;

  edLocalizar.SetFocus;

end;

procedure TfrmPesquisaCliente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;

//  form_principal.prc_controla_menu(true);

end;

procedure TfrmPesquisaCliente.FormCreate(Sender: TObject);
begin
  inherited;
  Confirmado       := false;
  rgTipo.ItemIndex := 1;
end;

procedure TfrmPesquisaCliente.rgTipoClick(Sender: TObject);
begin
  inherited;
  qry.SQL.Clear;
  edLocalizar.Enabled := true;

  if rgTipo.ItemIndex = 0  then
  begin
    edLocalizar.EditLabel.Caption := 'Informe um CNPJ ou CPF';
    qry.SQL.Add('select P.ID, P.CPF_CNPJ, P.NOME, P.ENDERECO, P.NUMERO, P.BAIRRO, P.CIDADE, P.UF from PESSOAS P, CLIENTES C where P.ID = C.PESSOA_ID and CPF_CNPJ like :CNPJ_CPF');
  end
  else
  begin
    edLocalizar.EditLabel.Caption := 'Informe um Nome';
    qry.SQL.Add('select P.ID, P.CPF_CNPJ, P.NOME, P.ENDERECO, P.NUMERO, P.BAIRRO, P.CIDADE, P.UF from PESSOAS P, CLIENTES C where P.ID = C.PESSOA_ID and NOME like :NOME');
  end;

  aSql := qry.SQL.Text;
end;

procedure TfrmPesquisaCliente.btn_fecharClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmPesquisaCliente.btn_incluir_novo_clienteClick(Sender: TObject);
var
 v_cnpj : string;
begin
  inherited;
  {pega o novo cliente cadastrado}
  v_cnpj := ufrmClientesE.Incluir;

  {filtra}
  rgTipo.ItemIndex := 0;
  edLocalizar.Text := v_cnpj;

  {seleciona e fecha}
  btnConfirma.Click;

end;

procedure TfrmPesquisaCliente.DBGrid1TitleClick(Column: TColumn);
begin
  inherited;
    prc_ordenar_dgrid(ds, DBGrid1, Column);

end;

end.
