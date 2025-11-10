unit ufrmRecibosAterarValorConta;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uBiblioteca, unit_funcoes;

type
  TfrmRecibosAlterarValorConta = class(TfrmBaseEdicao)
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lbl_pessoa: TLabel;
    edt_baixar: TEdit;
    lbl_nr_documento: TLabel;
    lbl_total_parcela: TLabel;
    lbl_saldo_aberto: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbl_historico: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure edt_baixarKeyPress(Sender: TObject; var Key: Char);
    procedure edt_baixarExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    Fp_confirmado: boolean;
    function fnc_validar: boolean;
    procedure prc_salvar;
    { Private declarations }
  public
    property p_confirmado : boolean read Fp_confirmado write Fp_confirmado;
  end;

var
  frmRecibosAlterarValorConta: TfrmRecibosAlterarValorConta;

implementation

{$R *.dfm}

procedure TfrmRecibosAlterarValorConta.btnOkClick(Sender: TObject);
begin
  inherited;
  prc_salvar;
end;

procedure TfrmRecibosAlterarValorConta.prc_salvar;
begin
  if fnc_validar then
  begin
    p_confirmado := true;
    close;
  end;
end;


procedure TfrmRecibosAlterarValorConta.edt_baixarExit(Sender: TObject);
begin
  inherited;
  ubiblioteca.prc_formata_dinheiro(sender);
end;

function TfrmRecibosAlterarValorConta.fnc_validar : boolean;
begin
  result := false;

  if ( (strtofloatdef(edt_baixar.Text, 0) <= 0 ) or
       (strtofloatdef(edt_baixar.Text, 0) > (strtofloat(lbl_saldo_aberto.Caption))) ) then
  begin
    unit_funcoes.CriarMensagem('AVISO', 'INFORME UM VALOR VÁLIDO.');
    edt_baixar.SetFocus;
    exit;
  end;

  result := true;
end;

procedure TfrmRecibosAlterarValorConta.edt_baixarKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  uBiblioteca.prc_somente_numeros(sender, key);
end;

procedure TfrmRecibosAlterarValorConta.FormCreate(Sender: TObject);
begin
  inherited;
 titulo                 := 'ALTERAÇÃO DE VALOR';
 lbl_sub_titulo.Caption := 'Alteração do valor a ser pago desta conta.';
 p_confirmado           := false;
end;

end.
