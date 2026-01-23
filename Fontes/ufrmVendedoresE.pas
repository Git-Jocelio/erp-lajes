unit ufrmVendedoresE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, Vcl.DBCtrls, Vcl.Mask, udmConn;

type
  TfrmVendedoresE = class(TfrmBaseEdicao)
    pnVendedor: TPanel;
    Label9: TLabel;
    edt_comissao_vendedor: TEdit;
    Label10: TLabel;
    edt_comissao_adm: TEdit;
    Label1: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lbl_id: TLabel;
    btn_validar_cpf_cnpj: TSpeedButton;
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
    Label6: TLabel;
    Label2: TLabel;
    lbl_cadastrado_em: TLabel;
    Label3: TLabel;
    lbl_alterado_em: TLabel;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_comissao_vendedorExit(Sender: TObject);
    procedure edt_comissao_vendedorKeyPress(Sender: TObject; var Key: Char);
    procedure btn_validar_cpf_cnpjClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);

  private
    FOperacao: uTipos.TOperacao;
    FCodigo: integer;
    FTabela: string;
    FTitulo: string;
    Fp_cpf_cnpj: string;
    Fpessoa_id: integer;

    function fnc_validar: Boolean;
    procedure prc_salvar;
    procedure prc_validar_cpf_cnpj;
    procedure prc_carregar_pessoa;
    procedure prc_carregar_vendedor;
    procedure prc_limpar_pessoa;
    function prc_incluir_alterar_pessoa(operacao: TOperacao): integer;
    procedure prc_incluir_alterar(operacao: TOperacao);
    procedure prc_habilitar_desbilitar_componentes(habilitar: boolean);
  protected

    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;


  public
    property Codigo   :integer read FCodigo write FCodigo;
    property Operacao :uTipos.TOperacao read FOperacao write FOperacao;
    property Tabela   :string read FTabela write FTabela;
    property Titulo   :string read FTitulo write FTitulo;
    property pessoa_id   :integer read Fpessoa_id write Fpessoa_id;
    property p_cpf_cnpj :string read Fp_cpf_cnpj write Fp_cpf_cnpj;
  end;

  procedure Incluir;
  procedure Alterar(ACodigo :integer);
  procedure Excluir(ACodigo :integer);


implementation

uses uBiblioteca, ufrmPesquisaPessoa, ufrmPessoasE, unit_funcoes;

procedure Incluir;
var
  loForm : TfrmVendedoresE;
begin
  loForm := TfrmVendedoresE.Create(Application);
  try
    loForm.Operacao := uTipos.opIncluir;
    loForm.Codigo   := 0;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Alterar(ACodigo :integer);
var
  loForm : TfrmVendedoresE;
begin
  loForm := TfrmVendedoresE.Create(Application);
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
  loForm : TfrmVendedoresE;
begin
  loForm := TfrmVendedoresE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;



{$R *.dfm}

procedure TfrmVendedoresE.btnFecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmVendedoresE.btnOkClick(Sender: TObject);
begin
  inherited;
   if not fnc_validar then Exit
     else prc_salvar;
end;

procedure TfrmVendedoresE.btn_validar_cpf_cnpjClick(Sender: TObject);
begin
  inherited;
  prc_validar_cpf_cnpj;
end;

procedure TfrmVendedoresE.prc_validar_cpf_cnpj;
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
    pnVendedor.Enabled := TRUE;
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
      // procura o id da pessoa dentro da tabela de vendedores
      qry.SQL.Clear;
      qry.SQL.Add('select * from vendedores where pessoa_id =:pessoa_id');
      qry.ParamByName('pessoa_id').AsInteger:= strtoint(lbl_id.Caption);
      qry.Active := true;

      //achou o vendedor!
      if not qry.IsEmpty then
      begin
        // carregar dados do cliente
        prc_carregar_vendedor;
        //prc_habiltar_edits_pessoa(false);
        pnVendedor.Enabled := false;
        CriarMensagem('AVISO','Vendedor já esta cadastrado no sistema');
      end
    end else
    begin
      // vendedor novo ...
      prc_limpar_pessoa;
      //prc_habiltar_edits_pessoa(true);
      edt_rg_ie.SetFocus;
    end;

end;

procedure TfrmVendedoresE.prc_habilitar_desbilitar_componentes(
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

procedure TfrmVendedoresE.prc_carregar_pessoa;
begin
  ActiveControl := edt_nome;
  edt_cpf_cnpj.Enabled := FALSE;
  btn_validar_cpf_cnpj.Enabled := false;

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


procedure TfrmVendedoresE.prc_carregar_vendedor;
begin

  edt_comissao_vendedor.Text := formatfloat('0.00', qry.FieldByName('COMISSAO_VENDEDOR').AsFloat);
  edt_comissao_adm.Text       := formatfloat('0.00', qry.FieldByName('COMISSAO_ADM').AsFloat);

end;

procedure TfrmVendedoresE.prc_limpar_pessoa;
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



procedure TfrmVendedoresE.prc_componentes;
begin
  qry.Connection := conexao;
end;

procedure TfrmVendedoresE.edt_comissao_vendedorExit(Sender: TObject);
begin
  inherited;
  ubiblioteca.prc_formata_dinheiro(sender);
end;

procedure TfrmVendedoresE.edt_comissao_vendedorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ubiblioteca.prc_somente_numeros(sender,key);

end;

procedure TfrmVendedoresE.FormCreate(Sender: TObject);
begin
  inherited;
  Tabela := 'VENDEDORES';
end;

procedure TfrmVendedoresE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmVendedoresE.prc_inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin
                       prc_habilitar_desbilitar_componentes(FALSE);
                       pnVendedor.Enabled := false;
                       pnTitulo.Caption := 'CADASTRO DE VENDEDORES';
                       lbl_sub_titulo.Caption := 'Incluir um novo vendedor';
                       btnOk.Caption := 'Incluir';
                       btnok.Enabled := FALSE;
                       lbl_cadastrado_em.Caption  := datetostr(date);
                       cb_ativo.Checked := TRUE;

                     end;
  uTipos.opAlterar: begin
                      prc_habilitar_desbilitar_componentes(TRUE);
                      pnVendedor.Enabled := TRUE;
                      prc_ler_dados;
                      pnTitulo.Caption := 'CADASTRO DE VENDEDORES';
                      lbl_sub_titulo.Caption := 'Alterar dados do vendedor';
                      btnOk.Caption := 'Alterar';
                      btnOk.SetFocus;
                    end;
  uTipos.opExcluir: begin
                      prc_ler_dados;
                      pnDados.Enabled    := false;
                      pnVendedor.Enabled := FALSE;
                      pnTitulo.Caption := 'CADASTRO DE VENDEDORES';
                      lbl_sub_titulo.Caption := 'Excluir vendedor';
                      btnOk.Caption      := 'Excluir';
                      btnFechar.SetFocus;
                    end;
  else
    begin
      pnDados.Enabled   := false;
      if btnFechar.CanFocus then btnFechar.SetFocus;
    end;
  end;

end;

procedure TfrmVendedoresE.prc_ler_dados;
begin
  // carregar edits pessoa...
  qry.SQL.clear;
  qry.SQL.Add('select * from PESSOAS where ID =:ID');
  uBiblioteca.FilterCds(qry, uTipos.fsInteger, inttostr(CODIGO) );
  prc_carregar_pessoa;

  // carregar cliente ...
  qry.active := FALSE;
  qry.SQL.Clear;
  qry.SQL.Add('select * from VENDEDORES where PESSOA_ID =:PESSOA_ID');
  qry.ParamByName('PESSOA_ID').AsInteger := CODIGO;
  qry.active := TRUE;
  prc_carregar_vendedor;


end;

procedure TfrmVendedoresE.prc_salvar;
begin
    try

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;

      // salvar no banco pessoa e cliente
      pessoa_id := prc_incluir_alterar_pessoa(operacao);
      prc_incluir_alterar(operacao);

      if Self.Conexao.InTransaction then Self.Conexao.Commit;

      if operacao = OpIncluir then
        CriarMensagem('AVISO',' Vendedor CADASTRADO com sucesso. ')
      else if operacao = OpAlterar then
        CriarMensagem('AVISO',' Vendedor ALTERADO com sucesso. ')
      else CriarMensagem('AVISO',' Vendedor EXCLUIDO com sucesso.');

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

function TfrmVendedoresE.prc_incluir_alterar_pessoa(operacao: TOperacao):integer;
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

procedure TfrmVendedoresE.prc_incluir_alterar(operacao: TOperacao);
begin
  qry.SQL.clear;

  if operacao = opExcluir then
  begin
    // ver se o vendedor tem pedido...
    qry.SQL.Add('select * from pedidos where vendedor_id =:pessoa_id');
    qry.ParamByName('pessoa_id').AsInteger := Codigo;
    qry.Open;

    // não tem. pode excluir
    if qry.IsEmpty then
    begin
      qry.SQL.Add('delete from VENDEDORES where pessoa_id =:pessoa_id');
      qry.ParamByName('pessoa_id').AsInteger := Codigo;
      qry.ExecSQL;
    end
    else
    begin
      CriarMensagem('AVISO','Não é possivel EXCLUIR um vendedor com pedido(s) colocado(s) ');
    end;

    exit;
  end;


  if operacao = OpIncluir then
  begin


    //incluir o vendedor
    qry.SQL.Clear;
    qry.SQL.Add('insert into vendedores ');
    qry.SQL.Add('(                      ');
    qry.SQL.Add('  ID,                  ');
    qry.SQL.Add('  PESSOA_ID,           ');
    qry.SQL.Add('  COMISSAO_VENDEDOR,   ');
    qry.SQL.Add('  COMISSAO_ADM         ');
    qry.SQL.Add(')                      ');
    qry.SQL.Add('VALUES                 ');
    qry.SQL.Add('(                      ');
    qry.SQL.Add('  :ID,                 ');
    qry.SQL.Add('  :PESSOA_ID,          ');
    qry.SQL.Add('  :COMISSAO_VENDEDOR,  ');
    qry.SQL.Add('  :COMISSAO_ADM        ');
    qry.SQL.Add(')                      ');

    Codigo := uBiblioteca.AutoIncremento(conexao, 'VENDEDORES');
    qry.ParamByName('ID').AsInteger        := Codigo;
    qry.ParamByName('PESSOA_ID').AsInteger := pessoa_id;

  end
  else if operacao = opAlterar then
  begin

    qry.SQL.Add('UPDATE                                   ');
    qry.SQL.Add('  VENDEDORES                             ');
    qry.SQL.Add('SET                                      ');
    qry.SQL.Add('  COMISSAO_VENDEDOR = :COMISSAO_VENDEDOR,');
    qry.SQL.Add('  COMISSAO_ADM      = :COMISSAO_ADM      ');
    qry.SQL.Add('WHERE                                    ');
    qry.SQL.Add('  PESSOA_ID = :PESSOA_ID                 ');
    qry.ParamByName('PESSOA_ID').AsInteger := Codigo;

  end;

  qry.ParamByName('COMISSAO_VENDEDOR').AsFloat := strtofloat( edt_comissao_vendedor.Text);
  qry.ParamByName('COMISSAO_ADM').AsFloat      := strtofloat( edt_comissao_adm.Text);

  qry.ExecSQL;

end;


function TfrmVendedoresE.fnc_validar: Boolean;
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
        qry.SQL.Add('select PESSOA_ID from VENDEDORES where PESSOA_ID =:PESSOA_ID');
        qry.ParamByName('PESSOA_ID').AsInteger := strtoint(lbl_id.Caption);
        qry.Open;
        if not qry.IsEmpty then
        begin
          CriarMensagem('AVISO','Vendedor JÁ CADASTRADO no sistema.');
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


  p_cpf_cnpj := edt_cpf_cnpj.Text;

  result := true;
end;


end.
