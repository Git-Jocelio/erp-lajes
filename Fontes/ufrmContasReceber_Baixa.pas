unit ufrmContasReceber_Baixa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, uBiblioteca, uTipos, uFinanceiro;

type
  TfrmContasReceber_Baixa = class(TfrmBaseEdicao)
    pnl_id_transacao: TPanel;
    Label1: TLabel;
    edt_ID: TPanel;
    GroupBox1: TGroupBox;
    lbl_nome_cliente: TLabel;
    Label2: TLabel;
    lbl_saldo_aberto: TLabel;
    rg_origem_conta: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edt_valor: TEdit;
    edt_autorizado: TEdit;
    dtp_data: TDateTimePicker;
    rg_baixar_conta: TRadioGroup;
    Label6: TLabel;
    mm_historico: TMemo;
    qry_contas_receber: TFDQuery;
    qry_pedidos: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    Fp_conta_receber_id: integer;
    Fp_nome_cliente: string;
    Fp_saldo_aberto: double;
    Fp_tabela: string;
    Fp_cliente_id: integer;
    Fp_operacao: TOperacao;
    Fconta_receber_baixa_id: integer;
    Fp_cadastrado_em: TDate;
    Fp_historico: string;
    Fp_conta_receber_baixa_id: integer;
    Fp_valor: double;


    function fnc_validar: boolean;
    procedure prc_salvar;

    function fnc_incluir: Boolean;
    function fnc_alterar: Boolean;

  protected
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;

  public
    property p_operacao: TOperacao read Fp_operacao write Fp_operacao;
    property p_conta_receber_id: integer read Fp_conta_receber_id write Fp_conta_receber_id;
    property p_cadastrado_em: TDate read Fp_cadastrado_em write Fp_cadastrado_em;
    property p_conta_receber_baixa_id: integer read Fp_conta_receber_baixa_id write Fp_conta_receber_baixa_id;
    property p_cliente_id: integer read Fp_cliente_id write Fp_cliente_id;
    property p_nome_cliente: string read Fp_nome_cliente write Fp_nome_cliente;
    property p_historico: string read Fp_historico write Fp_historico;
    property p_saldo_aberto: double read Fp_saldo_aberto write Fp_saldo_aberto;
    property p_valor: double read Fp_valor write Fp_valor;

    property p_tabela: string read Fp_tabela write Fp_tabela;

  end;

  procedure executa(operacao: TOperacao;
                    conta_receber_baixa_id : integer;
                    cadastrado_em :TDate;
                    conta_receber_id: integer;
                    nome_cliente: string;
                    historico: string;
                    valor,
                    saldo_aberto: double);

implementation

//procedure executa(operacao: TOperacao; conta_receber_id: integer; nome_cliente: string; saldo_aberto: double);


uses unit_funcoes;procedure executa(operacao: TOperacao;
                  conta_receber_baixa_id : integer;
                  cadastrado_em :TDate;
                  conta_receber_id: integer;
                  nome_cliente: string;
                  historico: string;
                  valor,
                  saldo_aberto: double);
var
 loForm : TfrmContasReceber_Baixa;
begin
  loForm := TfrmContasReceber_Baixa.Create(Application);
  // carregar as propriedades
  loForm.p_operacao               := operacao;
  loForm.p_conta_receber_baixa_id := conta_receber_baixa_id;
  loForm.p_cadastrado_em          := cadastrado_em;
  loForm.p_conta_receber_id       := conta_receber_id;
  loForm.p_nome_cliente           := nome_cliente;
  loForm.p_historico              := historico;
  loForm.p_saldo_aberto           := saldo_aberto;
  loForm.p_valor                  := valor;

  try
    loForm.ShowModal;
  finally
     FreeAndNil(loForm);
  end;
end;


{$R *.dfm}

procedure TfrmContasReceber_Baixa.FormCreate(Sender: TObject);
begin
  inherited;
  p_tabela := 'CONTAS_RECEBER_BAIXA';
  titulo   := 'Baixar conta a receber';

end;

procedure TfrmContasReceber_Baixa.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmContasReceber_Baixa.prc_componentes;
begin
  edt_ID.Caption := '-1';
  dtp_data.Date  := Date;

  qry_contas_receber.Connection := Conexao;
  qry_contas_receber.SQL.Add('select * from CONTAS_RECEBER where ID =:ID');

  qry_pedidos.Connection := Conexao;
  qry_pedidos.SQL.Add('select * from PEDIDOS where ID =:ID')
end;

procedure TfrmContasReceber_Baixa.prc_inicializar;
begin
   prc_ler_dados;
end;

procedure TfrmContasReceber_Baixa.prc_ler_dados;
begin
  lbl_nome_cliente.Caption := p_nome_cliente;
  lbl_saldo_aberto.Caption := formatFloat('R$ 0.00',p_saldo_aberto);

  {Origem da conta}
  uBiblioteca.FilterCds(qry_contas_receber, uTipos.fsInteger, inttostr(p_conta_receber_id));
  p_cliente_id := qry_contas_receber.fieldbyname('PESSOA_ID').asinteger;

  if qry_contas_receber.FieldByName('TABELA_ORIGEM').AsString = 'PEDIDOS' then
    rg_origem_conta.ItemIndex := 0
  else
  if qry_contas_receber.FieldByName('TABELA_ORIGEM').AsString = 'CONTAS_RECEBER' then
    rg_origem_conta.ItemIndex := 1
  else
  if qry_contas_receber.FieldByName('TABELA_ORIGEM').AsString = 'SAIDA_DINHEIRO' then
    rg_origem_conta.ItemIndex := 2
  else
    rg_origem_conta.ItemIndex := 3;


  if p_operacao = OpIncluir then
  begin

  end else
  if p_operacao = opAlterar then
  begin
    dtp_data.Date  := p_cadastrado_em;
    edt_valor.Text := FormatFloat('0.00', p_valor);
    mm_historico.Lines.Add(p_historico);
  end;


end;

function TfrmContasReceber_Baixa.fnc_validar: boolean;
var
  dia,mes,ano : word;
begin
  result := false;
  if dtp_data.Date < date then
  begin
    CriarMensagem('AVISO','informe uma DATA válida');
    if dtp_data.CanFocus then dtp_Data.SetFocus;
    exit;
  end;

  if StrToFloatDef(trim(edt_valor.Text),0) < 0.01 then
  begin
    CriarMensagem('AVISO','informe um VALOR válido');
    if edt_valor.CanFocus then edt_valor.SetFocus;
    exit;
  end;

  if p_operacao = opIncluir then
  begin
    if (StrToFloatDef(trim(edt_valor.Text),0) - p_saldo_aberto) >= 0.01 then
    begin
      CriarMensagem('AVISO','Valor digitado é maior que o saldo devedor do cliente');
      if edt_valor.CanFocus then edt_valor.SetFocus;
      exit;
    end;
  end
  else
  begin
    if StrToFloatDef(edt_valor.Text,0) > (p_saldo_aberto + p_valor) then
    //if (StrToFloatDef(trim(edt_valor.Text),0) - p_saldo_aberto) >= 0.01 then
    begin

    (*
    ShowMessage('formula -> (p_saldo_aberto + p_valor) - StrToFloatDef(edt_valor.text,0)' + sLineBreak +
               'p_saldo_aberto : ' + floattostr(p_saldo_aberto) + slinebreak +
               'p_valor : ' + floattostr(p_valor) + slinebreak +
               'edt_valor : ' + edt_valor.Text );
    *)


      CriarMensagem('AVISO','Valor digitado é maior que o saldo devedor do cliente');
      if edt_valor.CanFocus then edt_valor.SetFocus;
      exit;
    end;
  end ;



  if trim(mm_historico.Text) = '' then
  begin
    CriarMensagem('AVISO','Descreva como foi o pagamento');
    if mm_historico.CanFocus then mm_historico.SetFocus;
    exit;
  end;

  if rg_baixar_conta.ItemIndex < 0 then
  begin
    CriarMensagem('AVISO','Informe o tipo de baixa');
    rg_baixar_conta.SetFocus;
    exit;
  end;

  if rg_baixar_conta.ItemIndex = 1 then
  begin
    if application.MessageBox('Valor será baixado somente nesta conta, o pedido não será atualizado CONTINUA?','Atenção',MB_YESNO)= mrNo then
    begin
      exit;
    end;
  end;

  {senha 123 * n. do dia}

  DecodeDate(Date, ano, mes, dia);

  if edt_autorizado.Text <> inttostr(123*dia) then
  begin
    CriarMensagem('AVISO','Senha de autorização inválida');
    edt_autorizado.SetFocus;
    exit;
  end;

  result := true;
end;


procedure TfrmContasReceber_Baixa.prc_salvar;
var
 debitoCliente: double;
begin
  {validar}
  if not fnc_validar then Exit;

  {inicia uma transação}
  if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;

  case p_operacao of
    OpIncluir:
    begin
      if fnc_incluir then
      begin
        //if Self.Conexao.InTransaction then Self.Conexao.Commit;

        CriarMensagem('AVISO','Informação cadastrada com sucesso!');

        {atualiza saldo do contas receber}
        if uFinanceiro.baixar_contas_receber(Conexao, p_conta_receber_id, 0, strtofloat(edt_valor.Text)) then
        begin

          {atualizar saldo debito no cadastro de cliente}
          debitoCliente:= ufinanceiro.ClienteDebitoOutros(p_cliente_id);
          ufinanceiro.ClienteAtualizaDebitoOutros(p_cliente_id, debitoCliente);
          ModalResult  := mrOk;

        end
       else
         CriarMensagem('AVISO','Não foi possivel baixar o saldo da conta.');

       // comitar a transação
       if Self.Conexao.InTransaction then Self.Conexao.Commit;

      end;
    end;

    opAlterar:
    begin
      {alteração na tabela contas receber baixa}
      if fnc_alterar then
      begin
        {atualiza saldo do contas receber}
        if uFinanceiro.baixar_contas_receber(Conexao, p_conta_receber_id, p_valor, strtofloat(edt_valor.Text)) then
        begin
          (*
          {atualizar saldo debito no cadastro de cliente}
          debitoCliente:= ufinanceiro.ClienteDebitoOutros(p_cliente_id);
          ufinanceiro.ClienteAtualizaDebitoOutros(p_cliente_id, debitoCliente);
          *)
        end
       else
         CriarMensagem('AVISO','Não foi possivel baixar o saldo da conta.');


        CriarMensagem('AVISO','Alteração cadastrada com sucesso!');

        if Self.Conexao.InTransaction then Self.Conexao.Commit;
      end;
      ModalResult := mrOk;
    end ;

    opExcluir: ;
  end;

end;

procedure TfrmContasReceber_Baixa.btnOkClick(Sender: TObject);
begin
  inherited;

  try
    ModalResult := mrNone;
    //***
    prc_salvar;
  except
    on E : Exception do
       begin
         unit_funcoes.CriarMensagem('AVISO','ERRO AO SALVAR A BAIXA.' + slinebreak + slinebreak + E.Message);
         if Conexao.InTransaction then
           Conexao.Rollback;;
         //***
         Raise;
       end;
    end;

end;

function TfrmContasReceber_Baixa.fnc_incluir: Boolean;
var
  qry : TFDQuery;
  contas_receber_baixa_id : integer;
begin
  try
    qry := TFDQuery.Create(Self);
    qry.Connection := Conexao;
    qry.SQL.Clear;
    qry.Sql.Add('INSERT INTO          ');
    qry.Sql.Add('CONTAS_RECEBER_BAIXA ');
    qry.Sql.Add('(                    ');
    qry.Sql.Add('ID,                  ');
    qry.Sql.Add('CADASTRADO_EM,       ');
    qry.Sql.Add('CONTAS_RECEBER_ID,   ');
    qry.Sql.Add('RECIBO_ID,           ');
    qry.Sql.Add('HISTORICO,           ');
    qry.Sql.Add('VALOR,               ');
    qry.Sql.Add('PESSOA_ID,           ');
    qry.Sql.Add('USUARIO_ID )         ');
    qry.Sql.Add('values               ');
    qry.Sql.Add('(                    ');
    qry.Sql.Add(':ID,                 ');
    qry.Sql.Add(':CADASTRADO_EM,      ');
    qry.Sql.Add(':CONTAS_RECEBER_ID,  ');
    qry.Sql.Add(':RECIBO_ID,          ');
    qry.Sql.Add(':HISTORICO,          ');
    qry.Sql.Add(':VALOR,              ');
    qry.Sql.Add(':PESSOA_ID,          ');
    qry.Sql.Add(':USUARIO_ID )        ');
    //***
    contas_receber_baixa_id                 := uBiblioteca.AutoIncremento(conexao, 'CONTAS_RECEBER_BAIXA');
    qry.ParamByName('ID').AsInteger         := contas_receber_baixa_id;
    qry.ParamByName('CADASTRADO_EM').AsDate := dtp_data.date;
    qry.ParamByName('CONTAS_RECEBER_ID').AsInteger := p_conta_receber_id;
    qry.ParamByName('RECIBO_ID').AsInteger  := -1;
    qry.ParamByName('HISTORICO').AsString   := mm_historico.Lines.Text;
    qry.ParamByName('VALOR').AsFloat        := StrToCurrDef(edt_valor.Text,0);
    qry.ParamByName('PESSOA_ID').AsInteger  := qry_contas_receber.FieldByName('PESSOA_ID').AsInteger;
    qry.ParamByName('USUARIO_ID').AsInteger := 3;
    qry.ExecSQL;
    //***
    {registrar no pedido}
    if rg_origem_conta.ItemIndex = 0  then
    begin
      {Registrar pagamento no pedido}
      {:Código}
      if rg_baixar_conta.ItemIndex = 0 then
      begin

        {Como a conta já foi localizada no metodo ler dados... fica fácil}
        // registra pagamento na tabela pedidos_pagamentos
        ufinanceiro.prc_registrar_pagamento_pedido(
                                              Conexao,
                                              qry_contas_receber.fieldbyname('ID_ORIGEM').AsInteger,
                                              date,
                                              StrToFloatDef( edt_valor.text,0 ),
                                              'Baixado manual N. "' + IntToStr(contas_receber_baixa_id) + '" - EM : ' + datetostr(date) + ' Valor : ' + FormatFloat('0.00', StrToFloat(edt_valor.Text)) + ' '  + mm_historico.Lines.Text
                                             );
        {atualiza saldo aberto do pedido}
        uFinanceiro.prc_baixar_pedido(
                                      conexao,
                                      qry_contas_receber.fieldbyname('ID_ORIGEM').AsInteger,
                                      StrToFloatDef(edt_valor.text,0)
                                      //contas_receber_baixa_id,
                                      //mm_historico.Lines.Text
                                      );
      end;

    end;

    Result := (qry.RowsAffected > 0);

  finally
      FreeAndNil(QRY);
  end;
end;

function TfrmContasReceber_Baixa.fnc_alterar: Boolean;
var
  loQry : TFDQuery;
  marcar_alterado : string;
begin
  marcar_alterado := mm_historico.Lines.Text + ' [ Alterado em : ' + datetostr(date) + ' ]';
  try
    loQry := TFDQuery.Create(self);
    loQry.Connection := conexao;
    loQry.SQL.Clear;
    loQry.SQL.Add('update                        ');
    loQry.SQL.Add('  CONTAS_RECEBER_BAIXA        ');
    loQry.SQL.Add('set                           ');
    loQry.SQL.Add('  HISTORICO = :HISTORICO,     ');
    loQry.SQL.Add('  ALTERADO_EM = :ALTERADO_EM, ');
    loQry.SQL.Add('  VALOR = :VALOR,             ');
    loQry.SQL.Add('  USUARIO_ID = :USUARIO_ID    ');
    loQry.SQL.Add('where                         ');
    loQry.SQL.Add('  ID = :ID                    ');
    loQry.Params.ParamByName('ALTERADO_EM').AsDate   := date;
    loQry.Params.ParamByName('HISTORICO').AsString   := marcar_alterado;
    loQry.Params.ParamByName('VALOR').AsFloat        := strtofloatdef(edt_valor.Text,0);
    loQry.Params.ParamByName('USUARIO_ID').AsInteger := 3;
    loQry.Params.ParamByName('ID').AsInteger         := p_conta_receber_baixa_id;
    loQry.ExecSQL;
    (*
    ShowMessage('formula -> (p_saldo_aberto + p_valor) - StrToFloatDef(edt_valor.text,0)' + sLineBreak +
               'p_saldo_aberto : ' + floattostr(p_saldo_aberto) + slinebreak +
               'p_valor : ' + floattostr(p_valor) + slinebreak +
               'edt_valor : ' + edt_valor.Text );
   *)

    {atualiza saldo aberto do pedido}
    uFinanceiro.prc_baixar_pedido(
                                  conexao,
                                  qry_contas_receber.fieldbyname('ID_ORIGEM').AsInteger,  // número do pedido
                                  {passo a diferença entre valores, pois a função prc_baixar_pedido soma os valores pagos}
                                  ( StrToFloatDef(edt_valor.text,0) - p_valor )
                                  //-1,// não usa mais, tirar esse parametro depois
                                  //mm_historico.Lines.Text
                                  );

  finally
    FreeAndNil(loQry);
  end;
end;

end.
