unit ufrmProducaoVigasPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, udmConn, Vcl.DBCtrls;

type
  TfrmProducaoVigasPedidos = class(TfrmBaseEdicao)
    edt_pedido: TEdit;
    Label1: TLabel;
    btn_busca_pedido: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    DBText1: TDBText;
    DBText2: TDBText;
    DBText3: TDBText;
    DBText4: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_local_entrega: TLabel;
    procedure btn_busca_pedidoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    Fp_nosso_numero: string;
    Fp_nome: string;
    Fp_endereco: string;
    Fp_bairro: string;
    Fp_numero: string;
    Fp_confirmado: boolean;

    procedure prc_componentes;

  public
    property p_nosso_numero: string read Fp_nosso_numero write Fp_nosso_numero;
    property p_nome: string read Fp_nome write Fp_nome;
    property p_endereco: string read Fp_endereco write Fp_endereco;
    property p_numero: string read Fp_numero write Fp_numero;
    property p_bairro: string read Fp_bairro write Fp_bairro;
    property p_confirmado: boolean read Fp_confirmado write Fp_confirmado;

  end;

var
  frmProducaoVigasPedidos: TfrmProducaoVigasPedidos;

implementation

{$R *.dfm}

{ TfrmProducaoVigasPedidos }

procedure TfrmProducaoVigasPedidos.btnFecharClick(Sender: TObject);
begin
  p_confirmado := false;
  inherited;

end;

procedure TfrmProducaoVigasPedidos.btnOkClick(Sender: TObject);
begin
  inherited;
  p_confirmado := true;
  close;
end;

procedure TfrmProducaoVigasPedidos.btn_busca_pedidoClick(Sender: TObject);
var
  loQry: TFDQuery;
begin
  inherited;

  p_nosso_numero := '';

  {validar}
  if edt_pedido.Text = '' then
  begin
    ShowMessage('Informe um número de PEDIDO válido');
    edt_pedido.SetFocus;
    exit;
  end;

  p_nosso_numero := edt_pedido.Text;;

  qry.SQL.Text;
  {buscar pedido}
  qry.Close;
  qry.ParamByName('NOSSO_NUMERO').AsString  := p_nosso_numero;
  qry.Open;

  if qry.IsEmpty then
  begin
    ShowMessage('Pedido NÃO cadastrado no sistema');
    edt_pedido.SetFocus;
    exit;
  end;

  {ve se tem local de entrega cadastrado}
  loQry:= TFDQuery.Create(Application);
  loQry.Connection := Conexao;
  loqry.SQL.Add('select * from PEDIDOS_LOCAL_ENTREGA where PEDIDO_ID =:PEDIDO_ID');
  loQry.ParamByName('PEDIDO_ID').AsInteger := qry.FieldByName('ID').AsInteger;
  loQry.Open;

  if not loqry.IsEmpty then
  begin
    {achou}
    p_nome     := loqry.FieldByName('NOME').AsString;
    p_endereco := loqry.FieldByName('ENDERECO').AsString;
    p_numero   := loqry.FieldByName('NUMERO').AsString;
    p_bairro   := loqry.FieldByName('BAIRRO').AsString;
  end
  else
  begin
    p_nome     := qry.FieldByName('NOME').AsString;
    p_endereco := qry.FieldByName('ENDERECO').AsString;
    p_numero   := qry.FieldByName('NUMERO').AsString;
    p_bairro   := qry.FieldByName('BAIRRO').AsString;
  end;

  lbl_local_entrega.Caption := p_nome + ' ' +
                               p_endereco + ' ' +
                               p_numero + ' ' +
                               p_bairro;
  FreeAndNil(loQry);

end;

procedure TfrmProducaoVigasPedidos.FormCreate(Sender: TObject);
begin
  inherited;
   p_confirmado := false;
   titulo := 'Selecionar pedido';
   lbl_sub_titulo.Caption := 'Informe um número de pedido válido e confirme'

end;

procedure TfrmProducaoVigasPedidos.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
end;

procedure TfrmProducaoVigasPedidos.prc_componentes;
begin
  qry.Connection := conexao;
  qry.SQL.Add('select p.id, p.nosso_numero, ps.nome, ps.endereco, ps.bairro, ps.numero ');
  qry.SQL.Add('from pedidos p, pessoas ps ');
//  qry.SQL.Add('where p.cliente_id = ps.id and p.nosso_numero =:nosso_numero ');
  qry.SQL.Add('where p.cliente_id = ps.id and p.id =:nosso_numero ');

  lbl_local_entrega.Caption := '';


end;

end.
