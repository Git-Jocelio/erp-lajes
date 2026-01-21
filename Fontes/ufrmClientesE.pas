//*************************************************************//
//                                                             //
// data: 02/01/2021
// refaturado em 21/01/2026                                    //
// manutencao de clientes                                      //
// autor : jocelio g da silva                                  //
//                                                             //
//*************************************************************//
unit ufrmClientesE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, Vcl.Mask, Vcl.DBCtrls, ufrmVendedoresE;

type
  TfrmClientesE = class(TfrmBaseEdicao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    pnCliente: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    DBEdit19: TDBEdit;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    qryVendedores: TFDQuery;
    dsVendedores: TDataSource;
    cbxVendedor: TDBLookupComboBox;
    Label4: TLabel;
    cbxFormaPagto: TDBLookupComboBox;
    qryFormaPagto: TFDQuery;
    dsFormaPagto: TDataSource;
    btn_incluir_vendedor: TBitBtn;
    edt_limite_credito: TEdit;
    edt_creditos: TEdit;
    edt_pedidos_receber: TEdit;
    edt_outros_debitos: TEdit;
    edt_obs: TEdit;
    cb_mostra_tela_pagto: TCheckBox;
    lbl_id: TLabel;
    lbl_cadastrado_em: TLabel;
    lbl_alterado_em: TLabel;
    cb_ativo: TCheckBox;
    edt_cpf_cnpj: TEdit;
    edt_rg_ie: TEdit;
    edt_telefone: TEdit;
    edt_celular: TEdit;
    edt_nome: TEdit;
    edt_endereco: TEdit;
    edt_numero: TEdit;
    edt_bairro: TEdit;
    edt_cidade: TEdit;
    edt_uf: TEdit;
    edt_cep: TEdit;
    edt_email: TEdit;
    btn_validar_cpf_cnpj: TSpeedButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnOkClick(Sender: TObject);
    procedure btn_incluir_vendedorClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btn_validar_cpf_cnpjClick(Sender: TObject);
  private
    FOperacao: uTipos.TOperacao;
    FTabela: string;
    FCodigo: integer;
    Fp_cpf_cnpj: string;
    Fpessoa_id: integer;

    function fnc_validar: Boolean;
    procedure prc_validar_cpf_cnpj;

    procedure prc_salvar;
    function prc_incluir_alterar_pessoa(operacao: TOperacao):integer;
    procedure prc_incluir_alterar(operacao: TOperacao);

    procedure prc_carregar_pessoa;
    procedure prc_carregar_cliente;
    procedure prc_limpar_pessoa;
    procedure prc_habilitar_desbilitar_componentes(habilitar : boolean);
  protected

    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;

  public
    property Codigo   :integer read FCodigo write FCodigo;
    property pessoa_id   :integer read Fpessoa_id write Fpessoa_id;
    property Operacao :uTipos.TOperacao read FOperacao write FOperacao;
    property Tabela   :string read FTabela write FTabela;
    property p_cpf_cnpj :string read Fp_cpf_cnpj write Fp_cpf_cnpj;

  end;

  function Incluir :string;
  procedure Alterar(ACodigo :integer);
  procedure Excluir(ACodigo :integer);

implementation

uses uBiblioteca, ufrmPessoasE, unit_funcoes;



function Incluir :string;
var
  loForm : TfrmClientesE;
begin
  loForm := TfrmClientesE.Create(Application);
  try
    loForm.Operacao := uTipos.opIncluir;
    loForm.Codigo   := 0;
    loForm.ShowModal;
    result := loform.p_cpf_cnpj;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Alterar(ACodigo :integer);
var
  loForm : TfrmClientesE;
begin
  loForm := TfrmClientesE.Create(Application);
  try
    loForm.Operacao := uTipos.opAlterar;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Excluir(ACodigo :integer);
var
  loForm : TfrmClientesE;
begin
  loForm := TfrmClientesE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;


{$R *.dfm}

procedure TfrmClientesE.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TfrmClientesE.btnOkClick(Sender: TObject);
begin
  inherited;
   if not fnc_validar then Exit
     else prc_salvar;
end;

procedure TfrmClientesE.btn_incluir_vendedorClick(Sender: TObject);
begin
  inherited;
  ufrmVendedoresE.incluir;
  qryVendedores.close;
  qryVendedores.Open;

end;

procedure TfrmClientesE.prc_componentes;
begin

  qry.Connection := self.Conexao;

  qryVendedores.Connection := self.Conexao;
  qryVendedores.Open('select * from VENDEDORES V, PESSOAS P where V.PESSOA_ID = P.ID order by P.NOME');

  qryFormaPagto.Connection := self.Conexao;
  qryFormaPagto.Open('select * from FORMAS_PAGTO');

end;


procedure TfrmClientesE.prc_habilitar_desbilitar_componentes(
  habilitar: boolean);
begin

   edt_rg_ie.Enabled := habilitar;
   edt_celular.Enabled := habilitar;
   edt_telefone.Enabled := habilitar;
   edt_nome.Enabled := habilitar;
   edt_endereco.Enabled := habilitar;
   edt_numero.Enabled := habilitar;
   edt_bairro.Enabled := habilitar;
   edt_cidade.Enabled := habilitar;
   edt_uf.Enabled := habilitar;
   edt_cep.Enabled := habilitar;
   edt_email.Enabled := habilitar;

end;

procedure TfrmClientesE.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'CLIENTES';

end;

procedure TfrmClientesE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmClientesE.prc_inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin
                       pnTitulo.Caption := 'CADASTRO DE CLIENTES';
                       lbl_sub_titulo.Caption := 'Incluir um novo cliente';
                       btnOk.Caption := 'Incluir';
                       btnok.Enabled := FALSE;
                       prc_habilitar_desbilitar_componentes(FALSE);
                       pnCliente.Enabled := false;
                       lbl_cadastrado_em.Caption  := datetostr(date);
                       edt_limite_credito.Text  := '0,00';
                       edt_creditos.Text        := '0,00';
                       edt_pedidos_receber.Text := '0,00';
                       edt_outros_debitos.Text  := '0,00';
                       cb_mostra_tela_pagto.Checked := false;
                       cb_ativo.Checked := TRUE;

                     end;
  uTipos.opAlterar: begin
                      prc_habilitar_desbilitar_componentes(TRUE);
                      pnCliente.Enabled := TRUE;
                      prc_ler_dados;
                      pnTitulo.Caption := 'CADASTRO DE CLIENTES';
                      lbl_sub_titulo.Caption := 'Alterar dados do cliente';
                      btnOk.Caption := 'Alterar';
                      btnOk.SetFocus;
                    end;
  uTipos.opExcluir: begin
                      prc_habilitar_desbilitar_componentes(FALSE);
                      pnCliente.Enabled := FALSE;
                      prc_ler_dados;
                      pnTitulo.Caption := 'CADASTRO DE CLIENTES';
                      lbl_sub_titulo.Caption := 'Excluir Cliente';
                      btnOk.Caption      := 'Excluir';
                      btnFechar.SetFocus;
                    end;
  else
    begin
      prc_habilitar_desbilitar_componentes(FALSE);
      pnCliente.Enabled := FALSE;
      if btnFechar.CanFocus then btnFechar.SetFocus;
    end;
  end;


end;

procedure TfrmClientesE.prc_ler_dados;
begin
  // carregar edits pessoa...
  qry.SQL.clear;
  qry.SQL.Add('select * from PESSOAS where ID =:ID');
  uBiblioteca.FilterCds(qry, uTipos.fsInteger, inttostr(CODIGO) );
  prc_carregar_pessoa;

  // carregar cliente ...
  qry.active := FALSE;
  qry.SQL.Clear;
  qry.SQL.Add('select * from CLIENTES where PESSOA_ID =:PESSOA_ID');
  qry.ParamByName('PESSOA_ID').AsInteger := CODIGO;
  qry.active := TRUE;
  prc_carregar_cliente;


end;

procedure TfrmClientesE.prc_salvar;
begin

    try

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;

      // salvar no banco pessoa e cliente
      pessoa_id := prc_incluir_alterar_pessoa(operacao);
      prc_incluir_alterar(operacao);

      if Self.Conexao.InTransaction then Self.Conexao.Commit;

      if operacao = OpIncluir then
        CriarMensagem('AVISO',' Cliente CADASTRADO com sucesso. ')
      else if operacao = OpAlterar then
        CriarMensagem('AVISO',' Cliente ALTERADO com sucesso. ')
      else CriarMensagem('AVISO',' Cliente EXCLUIDO com sucesso. ');

      ModalResult := mrOk;

    except
    on E : Exception do
       begin
         CriarMensagem('AVISO','NÃO FOI POSSIVEL SALVAR O REGISTRO.' + slinebreak + slinebreak + E.Message);
         if conexao.InTransaction then
           conexao.Rollback;
         //***
         Raise;
       end;
    end;

end;

procedure TfrmClientesE.btn_validar_cpf_cnpjClick(Sender: TObject);
begin
  inherited;
  prc_validar_cpf_cnpj;
end;

procedure TfrmClientesE.prc_validar_cpf_cnpj;
begin
    if ((length(edt_cpf_cnpj.Text)<>11) and
        (length(edt_cpf_cnpj.Text)<>14)) then
    begin
      criarmensagem('AVISO','CPF/CNPJ Inválido');
      edt_cpf_cnpj.SetFocus;
      exit;
    end;

    // validar cpf
    if length(edt_cpf_cnpj.Text) = 11 then
    begin
      if not uBiblioteca.ValidarCpf(edt_cpf_cnpj.Text) then
      begin
        criarMensagem('AVISO','Informe um Cpf válido');
        edt_cpf_cnpj.SetFocus;
        exit;
      end;
    end;

    // validar cnpj
    if length(trim(edt_cpf_cnpj.Text)) = 14 then // cnpj
    begin
      if not uBiblioteca.ValidarCgc(edt_cpf_cnpj.Text) then
      begin
        criarMensagem('AVISO','Informe um Cnpj válido');
        edt_cpf_cnpj.SetFocus;
        exit;
      end;
    end;

    // se validou , não pode mais mudar o cpf/cnpj
    edt_cpf_cnpj.Enabled := false;
    btn_validar_cpf_cnpj.Enabled := FALSE;
    prc_habilitar_desbilitar_componentes(TRUE);
    pnCliente.Enabled := TRUE;
    btnok.Enabled := true;

    // procura o cpf/cnpj na tabela pessoas
    qry.SQL.Clear;
    qry.SQL.Add('select * from pessoas where CPF_CNPJ =:CPF_CNPJ');
    qry.ParamByName('CPF_CNPJ').AsString:= edt_cpf_cnpj.Text;
    qry.Active := true;

    //achou a pessoa!
    if not qry.IsEmpty then
    begin
      // carregar a pessoa
      prc_carregar_pessoa;
      //prc_habiltar_edits_pessoa(false);
      pnDados.Enabled := false;
    end
    else if qry.IsEmpty then
    begin
      // não achou... limpa a tela para cadastrar
      prc_limpar_pessoa;
      //prc_habiltar_edits_pessoa(true);
      edt_rg_ie.SetFocus;
    end;

    if strtointdef(lbl_id.Caption,0) > 0 then
    begin
      qry.Active := false;
      // procura o id da pessoa dentro da tabela de clientes
      qry.SQL.Clear;
      qry.SQL.Add('select * from clientes where pessoa_id =:pessoa_id');
      qry.ParamByName('pessoa_id').AsInteger:= strtoint(lbl_id.Caption);
      qry.Active := true;

      //achou o cliente!
      if not qry.IsEmpty then
      begin
        // carregar dados do cliente
        prc_carregar_cliente;
        //prc_habiltar_edits_pessoa(false);
        pnCliente.Enabled := false;
        CriarMensagem('AVISO','Cliente já esta cadastrado no sistema');
      end
    end else
    begin
      // cliente novo ...
      prc_limpar_pessoa;
      //prc_habiltar_edits_pessoa(true);
      edt_rg_ie.SetFocus;
    end;

end;


procedure TfrmClientesE.prc_carregar_pessoa;
begin
  ActiveControl := edt_nome;
  edt_cpf_cnpj.Enabled := FALSE;

  lbl_id.Caption            := qry.FieldByName('ID').AsString;
  lbl_cadastrado_em.Caption := qry.FieldByName('DATA_CAD').AsString;
  lbl_alterado_em.Caption   := qry.FieldByName('DATA_ALT').AsString;

  cb_ativo.Checked  := qry.FieldByName('ATIVO').AsString = 'S';
  edt_cpf_cnpj.Text := qry.FieldByName('CPF_CNPJ').AsString;
  edt_rg_ie.Text    := qry.FieldByName('RG_IE').AsString;
  edt_telefone.Text := qry.FieldByName('TELEFONE').AsString;
  edt_celular.Text  := qry.FieldByName('CELULAR').AsString;
  edt_nome.Text     := qry.FieldByName('NOME').AsString;
  edt_endereco.Text := qry.FieldByName('ENDERECO').AsString;
  edt_numero.Text   := qry.FieldByName('NUMERO').AsString;
  edt_bairro.Text   := qry.FieldByName('BAIRRO').AsString;
  edt_cidade.Text   := qry.FieldByName('CIDADE').AsString;
  edt_uf.Text       := qry.FieldByName('UF').AsString;
  edt_cep.Text      := qry.FieldByName('CEP').AsString;
  edt_email.Text    := qry.FieldByName('EMAIL').AsString;

end;


procedure TfrmClientesE.prc_carregar_cliente;
begin
  edt_limite_credito.Text := formatfloat('0.00', qry.FieldByName('LIMITE_CREDITO').AsFloat);
  cbxVendedor.KeyValue    := qry.FieldByName('VENDEDOR_ID').AsInteger;
  cbxFormaPagto.KeyValue  := qry.FieldByName('COND_PAGTO').AsInteger;
  edt_creditos.Text       := formatfloat('0.00', qry.FieldByName('CREDITOS').AsFloat);
  edt_pedidos_receber.Text:= formatfloat('0.00', qry.FieldByName('PEDIDOS_RECEBER').AsFloat);
  edt_outros_debitos.Text := formatfloat('0.00', qry.FieldByName('OUTROS_DEBITOS').AsFloat);
  edt_obs.Text            := qry.FieldByName('PEDIDO_OBS').AsString;
  cb_mostra_tela_pagto.Checked := SeSenao( qry.FieldByName('MOSTRA_TELA_PAGTO').AsString = 'S',true, false);

end;

procedure TfrmClientesE.prc_limpar_pessoa;
begin

  lbl_id.Caption := '';
  lbl_cadastrado_em.Caption := datetostr(date);
  lbl_alterado_em.Caption := '';

  cb_ativo.Checked  := false;
  edt_rg_ie.Text    := '';
  edt_nome.Text     := '';
  edt_telefone.Text := '';
  edt_celular.Text  := '';
  edt_endereco.Text := '';
  edt_numero.Text   := '';
  edt_bairro.Text   := '';
  edt_cidade.Text   := '';
  edt_uf.Text       := 'SP';
  edt_cep.Text      := '';
  edt_email.Text    := '';
end;



function TfrmClientesE.fnc_validar: Boolean;
begin
  result := false;

  if edt_cpf_cnpj.Text = '' then
  begin
    CriarMensagem('AVISO','Informe um CPF/CNPJ válido.');
    edt_cpf_cnpj.SetFocus;
    exit;
  end;

  if edt_cpf_cnpj.Enabled = true then
  begin
    prc_validar_cpf_cnpj;
    exit;
  end;

  {verifica duplicidade}
  if self.Operacao = uTipos.OpIncluir then
    if strtointdef(lbl_id.Caption,0) > 0 then

  begin
    try
        qry.SQL.clear;
        qry.SQL.Add('select PESSOA_ID from CLIENTES where PESSOA_ID =:PESSOA_ID');
        qry.ParamByName('PESSOA_ID').AsInteger := strtoint(lbl_id.Caption);
        qry.Open;
        if not qry.IsEmpty then
        begin
          CriarMensagem('AVISO','Cliente JÁ CADASTRADO no sistema');
          exit;
        end;
    except
      on E : Exception do
      Raise Exception.Create(E.Message + Self.Name +'.Valida : ' + self.Caption );
    end;
  end;

  if edt_celular.Text = '' then
  begin
    CriarMensagem('AVISO','Informe um número de telefone celular.');
    edt_celular.SetFocus;
    exit;
  end;

  if edt_nome.Text = '' then
  begin
    CriarMensagem('AVISO','Informe o nome da Pessoa.');
    edt_nome.SetFocus;
    exit;
  end;

  if not (cbxVendedor.KeyValue > 0)  then
  begin
    CriarMensagem('AVISO','Informe um representante');
    cbxVendedor.SetFocus;
    exit;
  end;

  if cbxFormaPagto.Text = '' then
  begin
    CriarMensagem('AVISO','Informe as condições de pagamento');
    cbxFormaPagto.SetFocus;
    exit;
  end;

  p_cpf_cnpj := edt_cpf_cnpj.Text;

  result := true;

end;

procedure TfrmClientesE.prc_incluir_alterar(operacao: TOperacao);
begin
  qry.SQL.clear;

  if operacao = opExcluir then
  begin
    // ver se o cliente tem pedido...
    qry.SQL.Add('select * from pedidos where cliente_id =:cliente_id');
    qry.ParamByName('cliente_id').AsInteger := Codigo;
    qry.Open;

    // não tem. pode excluir
    if qry.IsEmpty then
    begin
      qry.SQL.Add('delete from CLIENTES where pessoa_id =:pessoa_id');
      qry.ParamByName('pessoa_id').AsInteger := Codigo;
      qry.ExecSQL;
    end
    else
    begin
      CriarMensagem('AVISO','Não é possivel EXCLUIR um cliente com pedido(s) colocado(s) ');
    end;

    exit;
  end;


  if operacao = OpIncluir then
  begin


    //incluir o cliente
    qry.SQL.Clear;
    qry.SQL.Add('insert into clientes ');
    qry.SQL.Add('(');
    qry.SQL.Add('  ID, ');
    qry.SQL.Add('  PESSOA_ID, ');
    qry.SQL.Add('  LIMITE_CREDITO, ');
    qry.SQL.Add('  VENDEDOR_ID, ');
    qry.SQL.Add('  COND_PAGTO, ');
    qry.SQL.Add('  PEDIDO_OBS, ');
    qry.SQL.Add('  MOSTRA_TELA_PAGTO, ');
    qry.SQL.Add('  CREDITOS, ');
    qry.SQL.Add('  PEDIDOS_RECEBER, ');
    qry.SQL.Add('  OUTROS_DEBITOS  ');
    qry.SQL.Add(') ');
    qry.SQL.Add('VALUES ');
    qry.SQL.Add('(');
    qry.SQL.Add('  :ID, ');
    qry.SQL.Add('  :PESSOA_ID, ');
    qry.SQL.Add('  :LIMITE_CREDITO, ');
    qry.SQL.Add('  :VENDEDOR_ID, ');
    qry.SQL.Add('  :COND_PAGTO, ');
    qry.SQL.Add('  :PEDIDO_OBS, ');
    qry.SQL.Add('  :MOSTRA_TELA_PAGTO, ');
    qry.SQL.Add('  :CREDITOS, ');
    qry.SQL.Add('  :PEDIDOS_RECEBER, ');
    qry.SQL.Add('  :OUTROS_DEBITOS ');
    qry.SQL.Add(') ');

    Codigo := uBiblioteca.AutoIncremento(conexao, 'CLIENTES');
    qry.ParamByName('ID').AsInteger        := Codigo;
    qry.ParamByName('PESSOA_ID').AsInteger := pessoa_id;

  end
  else if operacao = opAlterar then
  begin

    qry.SQL.Add('UPDATE                                   ');
    qry.SQL.Add('  CLIENTES                               ');
    qry.SQL.Add('SET                                      ');
    qry.SQL.Add('  LIMITE_CREDITO    = :LIMITE_CREDITO,   ');
    qry.SQL.Add('  VENDEDOR_ID       = :VENDEDOR_ID,      ');
    qry.SQL.Add('  COND_PAGTO        = :COND_PAGTO,       ');
    qry.SQL.Add('  PEDIDO_OBS        = :PEDIDO_OBS,       ');
    qry.SQL.Add('  CREDITOS          = :CREDITOS,         ');
    qry.SQL.Add('  PEDIDOS_RECEBER   = :PEDIDOS_RECEBER,  ');
    qry.SQL.Add('  OUTROS_DEBITOS    = :OUTROS_DEBITOS,   ');
    qry.SQL.Add('  MOSTRA_TELA_PAGTO = :MOSTRA_TELA_PAGTO ');
    qry.SQL.Add('WHERE                                    ');
    qry.SQL.Add('  PESSOA_ID = :PESSOA_ID                 ');
    qry.ParamByName('PESSOA_ID').AsInteger := Codigo;

  end;

  qry.ParamByName('LIMITE_CREDITO').AsFloat := strtofloat(edt_limite_credito.Text);
  qry.ParamByName('VENDEDOR_ID').AsInteger  := qryVendedores.fieldbyname('id').asinteger;
  qry.ParamByName('COND_PAGTO').AsInteger   := qryFormaPagto.fieldbyname('id').asinteger;;
  qry.ParamByName('PEDIDO_OBS').AsString    := edt_obs.Text;
  qry.ParamByName('CREDITOS').AsFloat       := StrToFloat(edt_creditos.Text);
  qry.ParamByName('PEDIDOS_RECEBER').Asfloat:= StrToFloat(edt_pedidos_receber.Text);
  qry.ParamByName('OUTROS_DEBITOS').Asfloat := StrToFloat(edt_outros_debitos.Text);
  qry.ParamByName('MOSTRA_TELA_PAGTO').AsString := SeSenao(cb_mostra_tela_pagto.Checked , 'S', 'N');

  qry.ExecSQL;

end;

function TfrmClientesE.prc_incluir_alterar_pessoa(operacao: TOperacao):integer;
begin
  qry.sql.clear;

  if operacao = opExcluir then
  begin
    qry.SQL.Add('update pessoas set ATIVO = ''N'' where id =:id');
    qry.ParamByName('id').AsInteger := Codigo;
    qry.ExecSQL;
    exit;
  end;


  if operacao = OpIncluir then
  begin
    qry.SQL.Add('insert into pessoas ');
    qry.SQL.Add('(');
    qry.SQL.Add('  ID, ');
    qry.SQL.Add('  NOME, ');
    qry.SQL.Add('  CPF_CNPJ, ');
    qry.SQL.Add('  RG_IE, ');
    qry.SQL.Add('  ENDERECO, ');
    qry.SQL.Add('  NUMERO, ');
    qry.SQL.Add('  COMPLEMENTO, ');
    qry.SQL.Add('  BAIRRO, ');
    qry.SQL.Add('  CIDADE, ');
    qry.SQL.Add('  UF, ');
    qry.SQL.Add('  CEP, ');
    qry.SQL.Add('  TELEFONE, ');
    qry.SQL.Add('  CELULAR, ');
    qry.SQL.Add('  DATA_CAD, ');
    qry.SQL.Add('  EMAIL, ');
    qry.SQL.Add('  FIS_JUR, ');
    qry.SQL.Add('  ATIVO ');
    qry.SQL.Add(') ');
    qry.SQL.Add('VALUES ');
    qry.SQL.Add('(');
    qry.SQL.Add('  :ID, ');
    qry.SQL.Add('  :NOME, ');
    qry.SQL.Add('  :CPF_CNPJ, ');
    qry.SQL.Add('  :RG_IE, ');
    qry.SQL.Add('  :ENDERECO, ');
    qry.SQL.Add('  :NUMERO, ');
    qry.SQL.Add('  :COMPLEMENTO, ');
    qry.SQL.Add('  :BAIRRO, ');
    qry.SQL.Add('  :CIDADE, ');
    qry.SQL.Add('  :UF, ');
    qry.SQL.Add('  :CEP, ');
    qry.SQL.Add('  :TELEFONE, ');
    qry.SQL.Add('  :CELULAR, ');
    qry.SQL.Add('  :DATA_CAD, ');
    qry.SQL.Add('  :EMAIL, ');
    qry.SQL.Add('  :FIS_JUR, ');
    qry.SQL.Add('  :ATIVO ');
    qry.SQL.Add(') ');

    Codigo := uBiblioteca.AutoIncremento(conexao, 'PESSOAS');
    qry.ParamByName('ID').AsInteger      := Codigo;
    qry.ParamByName('DATA_CAD').AsDate   := Date;
    qry.ParamByName('CPF_CNPJ').AsString := edt_cpf_cnpj.Text;
    qry.ParamByName('RG_IE').AsString    := edt_rg_ie.Text;
    qry.ParamByName('FIS_JUR').AsString  := 'F';// excluir esse campo da tabela

  end
  else if operacao = opAlterar then
  begin
    qry.SQL.Add('UPDATE                        ');
    qry.SQL.Add('  PESSOAS                     ');
    qry.SQL.Add('SET                           ');
    qry.SQL.Add('  NOME        = :NOME,        ');
    qry.SQL.Add('  ENDERECO    = :ENDERECO,    ');
    qry.SQL.Add('  NUMERO      = :NUMERO,      ');
    qry.SQL.Add('  COMPLEMENTO = :COMPLEMENTO, ');
    qry.SQL.Add('  BAIRRO      = :BAIRRO,      ');
    qry.SQL.Add('  CIDADE      = :CIDADE,      ');
    qry.SQL.Add('  UF          = :UF,          ');
    qry.SQL.Add('  CEP         = :CEP,         ');
    qry.SQL.Add('  TELEFONE    = :TELEFONE,    ');
    qry.SQL.Add('  CELULAR     = :CELULAR,     ');
    qry.SQL.Add('  EMAIL       = :EMAIL,       ');
    qry.SQL.Add('  ATIVO       = :ATIVO,       ');
    qry.SQL.Add('  DATA_ALT    = :DATA_ALT     ');
    qry.SQL.Add('WHERE                         ');
    qry.SQL.Add('  ID = :ID                    ');
    qry.ParamByName('ID').AsInteger := Codigo;
    qry.ParamByName('DATA_ALT').AsDate := Date;

  end;

  qry.ParamByName('NOME').AsString        := edt_nome.Text;
  qry.ParamByName('ENDERECO').AsString    := edt_endereco.Text;
  qry.ParamByName('NUMERO').AsString      := edt_numero.text;
  qry.ParamByName('COMPLEMENTO').AsString := '';
  qry.ParamByName('BAIRRO').AsString      := edt_bairro.Text;
  qry.ParamByName('CIDADE').AsString      := edt_cidade.Text;
  qry.ParamByName('UF').AsString          := edt_uf.Text;
  qry.ParamByName('CEP').AsString         := edt_cep.Text;
  qry.ParamByName('TELEFONE').AsString    := edt_telefone.Text;
  qry.ParamByName('CELULAR').AsString     := edt_celular.Text;
  qry.ParamByName('EMAIL').AsString       := edt_email.Text;
  qry.ParamByName('ATIVO').AsString       := SeSenao(cb_ativo.Checked = true, 'S', 'N');

  qry.ExecSQL;
  result := codigo;  // pessoa_id
end;



end.
