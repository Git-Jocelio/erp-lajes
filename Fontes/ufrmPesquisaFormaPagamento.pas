unit ufrmPesquisaFormaPagamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.DBCtrls;

type
  TfrmPesquisaFormaPagamento = class(TfrmBaseEdicao)
    cbx_forma_pagamento: TDBLookupComboBox;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Fp_id_forma_pagamento: integer;
    function fnc_validar: boolean;
    procedure prc_componentes;
  public
    property p_id_forma_pagamento: integer read Fp_id_forma_pagamento write Fp_id_forma_pagamento;
  end;

function fnc_executar: integer;

implementation

function fnc_executar: integer;
var
  loForm : TfrmPesquisaFormaPagamento;
begin
  loForm := TfrmPesquisaFormaPagamento.Create(Application);
  try
    loForm.ShowModal;
    result := loForm.p_id_forma_pagamento;
  finally
    FreeAndNil(loForm);
  end;
end;


{$R *.dfm}

procedure TfrmPesquisaFormaPagamento.btnOkClick(Sender: TObject);
begin
  inherited;
  if fnc_validar then
  p_id_forma_pagamento := cbx_forma_pagamento.KeyValue;
  close;

end;

function TfrmPesquisaFormaPagamento.fnc_validar: boolean;
begin
  result := false;
  if cbx_forma_pagamento.Text = '' then
  begin
    ShowMessage('selecione uma FORMA DE PAGAMENTO');
    cbx_forma_pagamento.SetFocus;
    exit;
  end;
  result := true;;
end;

procedure TfrmPesquisaFormaPagamento.FormCreate(Sender: TObject);
begin
  inherited;
  p_id_forma_pagamento := -1; // vazio
end;

procedure TfrmPesquisaFormaPagamento.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
end;

procedure TfrmPesquisaFormaPagamento.prc_componentes;
begin
  lbl_titulo.Caption     := 'FORMAS DE PAGAMENTO' ;
  lbl_sub_titulo.Caption := 'selecione uma forma de pagamento';

  qry.Connection := conexao;
  qry.Open('select * from FORMAS_PAGTO where ATIVO = ' + QuotedStr('S') +  ' order by DESCRICAO')
end;

end.
