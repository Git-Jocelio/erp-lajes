unit ufrmViga_AlteracaoPreco;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmViga_AlteracaoPreco = class(TfrmBaseEdicao)
    DBText1: TDBText;
    Label2: TLabel;
    Label3: TLabel;
    edValorVendedor: TEdit;
    Bevel1: TBevel;
    GroupBox1: TGroupBox;
    mmMens: TMemo;
    Label1: TLabel;
    edValorVenda: TEdit;
    qryVigas: TFDQuery;
    dsVigas: TDataSource;
    cbxVigas: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FpAltura: integer;
    function Validar: boolean;
    procedure addMensagem(mensagem: string);
    { Private declarations }
  public
    property pAltura: integer read FpAltura write FpAltura;

  end;

var
  frmViga_AlteracaoPreco: TfrmViga_AlteracaoPreco;

implementation

{$R *.dfm}

uses udmConn;

procedure TfrmViga_AlteracaoPreco.btnOkClick(Sender: TObject);
var
  valorMetroLinearVendedor: double;
  valorMetroLinearVenda: double;
begin
  inherited;
  if Validar then
  begin
    {alterar preços}
    addMensagem('Informações validadas');
    {Localizar as vigas que serão alteradas}
    qry.Close;
    qry.ParamByName('ALTURA').AsInteger := pAltura;
    QRY.Open();
    addMensagem('Sera alterado os valores dos Preços de  "'+ inttostr(qry.RecordCount) +'" vigas H-'+ inttostr(pAltura)  );


    valorMetroLinearVendedor := StrToFloat(edValorVendedor.Text);
    valorMetroLinearVenda    := StrToFloat(edValorVenda.Text);

    qry.First;
    while not qry.eof do
    begin
      qry.Edit;
      qry.FieldByName('PRECO_VENDEDOR').AsFloat := ((valorMetroLinearVendedor * QRY.FieldByName('COMPRIMENTO').AsInteger) / 1000);
      qry.FieldByName('PRECO_VENDA'   ).AsFloat := ((valorMetroLinearVenda * QRY.FieldByName('COMPRIMENTO').AsInteger) / 1000);
      qry.Post;
      //
      qry.Next;
    end;

    addMensagem('Aguarde...' );
    sleep(8000);
    addMensagem('Valores alterados com sucesso!' );

  end;
end;

procedure TfrmViga_AlteracaoPreco.addMensagem(mensagem: string);
begin
  mmMens.Lines.Add(mensagem);
end;

procedure TfrmViga_AlteracaoPreco.FormCreate(Sender: TObject);
begin
  inherited;
  qryVigas.Connection := self.Conexao;
end;

procedure TfrmViga_AlteracaoPreco.FormShow(Sender: TObject);
begin
  inherited;
  qryVigas.Open();
end;

function TfrmViga_AlteracaoPreco.Validar: boolean;
begin
  result := false;

  if cbxVigas.Text = '' then
  begin
    ShowMessage('Selecione uma viga');
    cbxVigas.SetFocus;
    exit;
  end;

  if StrToFloatDef(edValorVendedor.Text,0) <= qryVigas.FieldByName('PRECO_CUSTO').AsFloat then
  begin
    ShowMessage('informe um valor maior que o preço de custo');
    edValorVendedor.SetFocus;
    exit;
  end;

  if StrToFloatDef(edValorVenda.Text,0) <= strtofloatdef(edValorVendedor.Text,0) then
  begin
    ShowMessage('informe um valor maior que o preço do Vendedor');
    edValorVenda.SetFocus;
    exit;
  end;

  pAltura:= qryVigas.FieldByName('TRELICA_ALTURA').AsInteger;
  btnOk.Enabled := false;
  result := true;

end;

end.
