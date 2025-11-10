 //***************************************************************************//
// Cadastro de Contas a Pagar_baixa
// desenvolvida por Jocelio G Silva
// inicio : 11/01/2024 Deus seja louvado.
// fim :
//***************************************************************************//

unit ufrmContasPagar_Baixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, uBiblioteca, uTipos, unit_funcoes;

type
  TfrmContasPagar_Baixa = class(TfrmBaseEdicao)
    pnl_id_transacao: TPanel;
    Label1: TLabel;
    edt_ID: TPanel;
    GroupBox1: TGroupBox;
    lbl_nome_pessoa: TLabel;
    Label2: TLabel;
    lbl_saldo_aberto: TLabel;
    rg_forma_pagto: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    edt_valor: TEdit;
    dtp_data: TDateTimePicker;
    mm_historico: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    Fp_nome_pessoa: string;
    Fp_conta_receber_id: integer;
    Fp_saldo_aberto: double;
    Fp_tabela: string;

    procedure prc_salvar;
    procedure prc_incluir;
    procedure prc_atualizar_saldo_contas_pagar(valor_pago: double);

  protected
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;
    function fnc_validar:boolean;

  public
    property p_conta_pagar_id: integer read Fp_conta_receber_id write Fp_conta_receber_id;
    property p_nome_pessoa: string read Fp_nome_pessoa write Fp_nome_pessoa;
    property p_saldo_aberto: double read Fp_saldo_aberto write Fp_saldo_aberto;

    property p_tabela: string read Fp_tabela write Fp_tabela;

  end;

procedure executa(conta_pagar_id: integer; nome_pessoa: string; saldo_aberto: double);

implementation

{$R *.dfm}

procedure executa(conta_pagar_id: integer; nome_pessoa: string; saldo_aberto: double);
var
 loForm : TfrmContasPagar_Baixa;
begin
  try
    loForm := TfrmContasPagar_Baixa.Create(Application);
    // carregar as propriedades
    loForm.p_conta_pagar_id := conta_pagar_id;
    loForm.p_nome_pessoa    := nome_pessoa;
    loForm.p_saldo_aberto   := saldo_aberto;
    loForm.ShowModal;
  finally
     FreeAndNil(loForm);
  end;
end;


procedure TfrmContasPagar_Baixa.btnOkClick(Sender: TObject);
begin
  inherited;
  prc_salvar;
end;

function TfrmContasPagar_Baixa.fnc_validar: boolean;
begin
  result := false;
  if dtp_data.Date < date then
  begin
    ShowMessage('informe uma DATA VÁLIDA');
    if dtp_data.CanFocus then dtp_data.SetFocus;
    exit;
  end;

  if StrToFloatDef(edt_valor.Text,0) <= 0 then
  begin
    ShowMessage('informe uma valor válido');
    if edt_valor.CanFocus then edt_valor.SetFocus;
    exit;
  end;

  if (StrToFloatDef(edt_valor.Text,0) - p_saldo_aberto) >= 0.01 then
  begin
    ShowMessage('Valor digitado é maior que o saldo devedor do fornecedor');
    if edt_valor.CanFocus then edt_valor.SetFocus;
    exit;
  end;


  if rg_forma_pagto.ItemIndex = -1 then
  begin
    ShowMessage('informe a forma de pagamento');
    if rg_forma_pagto.CanFocus then rg_forma_pagto.SetFocus;
    exit;
  end;


  if mm_historico.Lines.text = '' then
  begin
    ShowMessage('Descreva como foi o pagamento');
    if mm_historico.CanFocus then mm_historico.SetFocus;
    exit;
  end;

  result := true;

end;

procedure TfrmContasPagar_Baixa.FormCreate(Sender: TObject);
begin
  inherited;
  p_tabela := 'CONTAS_PAGAR_BAIXA';
  titulo   := 'Baixar conta a pagar';

end;

procedure TfrmContasPagar_Baixa.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmContasPagar_Baixa.prc_componentes;
begin
  edt_ID.Caption := '-1';
  dtp_data.Date  := Date;

  qry.Connection := Conexao;
  qry.SQL.Add('select * from ' + p_tabela + ' where ID =:ID');


end;

procedure TfrmContasPagar_Baixa.prc_inicializar;
begin
   prc_ler_dados;

end;

procedure TfrmContasPagar_Baixa.prc_ler_dados;
begin
  lbl_nome_pessoa.Caption := p_nome_pessoa;
  lbl_saldo_aberto.Caption := formatFloat('R$ 0.00',p_saldo_aberto);
end;

procedure TfrmContasPagar_Baixa.prc_salvar;
begin
  if not fnc_validar then exit;

  if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
  try
    prc_incluir;

    if Self.Conexao.InTransaction then Self.Conexao.Commit;

    ModalResult := mrOk;

  except
    {se der algum erro durante o processo de gravação desfaz tudo!}
    on E : Exception do
       begin
         unit_funcoes.criarMensagem('AVISO','NÃO FOI POSSIVEL SALVAR O PAGAMENTO.' + slinebreak + slinebreak + E.Message);
         if Conexao.InTransaction then
           Conexao.Rollback;;

         Raise;
       end;
  end;

end;

procedure TfrmContasPagar_Baixa.prc_incluir;
var
 loQry : TFDQuery;
 codigo: integer;
begin
  try
    loQry := TFDQuery.Create(self);
    with loQry, loQry.SQL do
    begin
      Connection := conexao;
      {faz o lançamento na tabela de contas a pagar baixa}
      Add('insert into ' + self.p_tabela );
      Add('(                   ');
      Add('  ID,               ');
      Add('  CADASTRADO_EM,    ');
      Add('  CONTAS_PAGAR_ID,  ');
      Add('  HISTORICO,        ');
      Add('  VALOR,            ');
      Add('  FORMA_PAGTO,      ');
      Add('  USUARIO_ID        ');
      Add(')                   ');
      Add('VALUES              ');
      Add('(                   ');
      Add('  :ID,              ');
      Add('  :CADASTRADO_EM,   ');
      Add('  :CONTAS_PAGAR_ID, ');
      Add('  :HISTORICO,       ');
      Add('  :VALOR,           ');
      Add('  :FORMA_PAGTO,     ');
      Add('  :USUARIO_ID       ');
      Add(')                   ');

      Codigo := uBiblioteca.AutoIncremento(conexao, self.p_tabela);
      ParamByName('ID').AsInteger              := Codigo;
      ParamByName('CADASTRADO_EM').AsDate      := Date;
      ParamByName('CONTAS_PAGAR_ID').AsInteger := p_conta_pagar_id;
      ParamByName('HISTORICO').AsString        := mm_historico.Lines.Text;
      ParamByName('VALOR').AsFloat             := strtofloat(edt_valor.Text);
      ParamByName('FORMA_PAGTO').AsInteger     := rg_forma_pagto.ItemIndex;
      ParamByName('USUARIO_ID').AsInteger      := 3;
      ExecSQL;

      {atualiza o saldo da conta a pagar principal}
      prc_atualizar_saldo_contas_pagar(strtofloat(edt_valor.Text)) ;

    end;
  finally
    FreeAndNil(loQry)
  end;
end;

procedure TfrmContasPagar_Baixa.prc_atualizar_saldo_contas_pagar(valor_pago: double);
var
  loQuery        : TFDQuery;
  oldValorPago   : double;
  oldSaldoAberto : double;
begin
  try
    loQuery := TFDQuery.Create(Self);
    with loQuery, loQuery.Sql do
    begin
      Connection := conexao;
      Add('select * from CONTAS_PAGAR where ID = :ID');
      ParamByName('ID').AsInteger := p_conta_pagar_id;
      Open;
      oldValorPago   := loQuery.fieldbyname('VALOR_PAGO').AsFloat;
      oldSaldoAberto := loQuery.fieldbyname('SALDO_ABERTO').AsFloat;

      //Atualiza o para o novo valor
      SQL.Clear;
      Add('UPDATE CONTAS_PAGAR                  ');
      Add('SET DATA_PAGAMENTO = :DATA_PAGAMENTO,');
      Add('  VALOR_PAGO       = :VALOR_PAGO,    ');
      Add('  SALDO_ABERTO     = :SALDO_ABERTO,  ');
      Add('  PAGO             = :PAGO           ');
      Add('WHERE ID           = :ID             ');

      ParamByName('DATA_PAGAMENTO').AsDate := dtp_data.Date;
      ParamByName('VALOR_PAGO').AsFloat    := oldValorPago + StrToFloatDef(edt_valor.Text,0);
      ParamByName('SALDO_ABERTO').AsFloat  := oldSaldoAberto - StrToFloatDef(edt_valor.Text,0);

      if ( (p_saldo_aberto - StrToFloatDef(edt_valor.Text,0)) >= 0.01 ) then ParamByName('PAGO').AsString  := 'N'
       else ParamByName('PAGO').AsString  := 'S';

      ParamByName('ID'   ).AsInteger := p_conta_pagar_id;
      ExecSQL;
      //
    end;
  finally
    FreeAndNil( loQuery );
  end;
end;


end.
