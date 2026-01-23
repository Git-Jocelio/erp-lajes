unit ufrmEmpresaE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, ufrmPesquisaPessoa, uBiblioteca, uTipos, ufrmPessoasE,
  Vcl.DBCtrls, Vcl.Mask, udmConn, Vcl.ExtDlgs;

type
  TfrmEmpresaE = class(TfrmBaseEdicao)
    OpenPictureDialog1: TOpenPictureDialog;
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
    lbl_id: TLabel;
    lbl_cadastrado_em: TLabel;
    lbl_alterado_em: TLabel;
    btn_validar_cpf_cnpj: TSpeedButton;
    cb_ativo: TCheckBox;
    edt_cpf_cnpj: TEdit;
    edt_rg_ie: TEdit;
    edt_telefone: TEdit;
    Edit1: TEdit;
    edt_nome: TEdit;
    edt_endereco: TEdit;
    edt_numero: TEdit;
    edt_bairro: TEdit;
    edt_cidade: TEdit;
    edt_uf: TEdit;
    edt_cep: TEdit;
    edt_email: TEdit;
    pnCliente: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label4: TLabel;
    img_logo: TImage;
    btn_buscar_logo: TSpeedButton;
    edt_nome_fantasia: TEdit;
    edt_site: TEdit;
    edt_celular: TEdit;
    edt_telefone_fixo: TEdit;
    edt_crea: TEdit;
    edt_frase: TEdit;
    edt_imagem: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn_buscar_logoClick(Sender: TObject);
    procedure btn_validar_cpf_cnpjClick(Sender: TObject);
  private
    FOperacao: uTipos.TOperacao;
    FCodigo: integer;
    FTabela: string;
    Fpessoa_id: integer;
    Fp_cpf_cnpj: string;
    function  fnc_validar: Boolean;
    procedure prc_salvar;
    procedure prc_incluir_alterar(operacao: TOperacao);

    procedure prc_carregar_empresa;
    procedure prc_carregar_pessoa;
    procedure prc_limpar_pessoa;
    procedure prc_habilitar_desbilitar_componentes(habilitar: boolean);
    function prc_incluir_alterar_pessoa(operacao: TOperacao): integer;
    procedure prc_validar_cpf_cnpj;

  protected
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;

  public
    { Public declarations }
    property Codigo   :integer read FCodigo write FCodigo;
    property Operacao :uTipos.TOperacao read FOperacao write FOperacao;
    property Tabela   :string read FTabela write FTabela;
    property pessoa_id   :integer read Fpessoa_id write Fpessoa_id;
    property p_cpf_cnpj :string read Fp_cpf_cnpj write Fp_cpf_cnpj;

  end;

  procedure Incluir;
  procedure Alterar(ACodigo :integer);
  procedure Excluir(ACodigo :integer);

implementation

uses unit_funcoes;

procedure Incluir;
var
  loForm : TfrmEmpresaE;
begin
  loForm := TfrmEmpresaE.Create(Application);
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
  loForm : TfrmEmpresaE;
begin
  loForm := TfrmEmpresaE.Create(Application);
  try
    loForm.Operacao := uTipos.opAlterar;
    loForm.Codigo   := ACodigo;
    //ShowMessage('ALTERAR')  ;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Excluir(ACodigo :integer);
var
  loForm : TfrmEmpresaE;
begin
  loForm := TfrmEmpresaE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;


{$R *.dfm}

procedure TfrmEmpresaE.btnOkClick(Sender: TObject);
begin
  inherited;
   if not fnc_validar then Exit
     else prc_salvar;

end;

procedure TfrmEmpresaE.prc_componentes;
begin
  qry.SQL.Add('select * from PESSOAS where ID =:ID');
end;


procedure TfrmEmpresaE.FormCreate(Sender: TObject);

begin
  inherited;
  Tabela := 'EMPRESA';

end;

procedure TfrmEmpresaE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;
end;

procedure TfrmEmpresaE.btn_validar_cpf_cnpjClick(Sender: TObject);
begin
  inherited;
  prc_validar_cpf_cnpj;

end;

procedure TfrmEmpresaE.prc_validar_cpf_cnpj;
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
      // procura o id da pessoa dentro da tabela de empresa
      qry.SQL.Clear;
      qry.SQL.Add('select * from empresa where pessoa_id =:pessoa_id');
      qry.ParamByName('pessoa_id').AsInteger:= strtoint(lbl_id.Caption);
      qry.Active := true;

      //achou a empresa!
      if not qry.IsEmpty then
      begin
        // carregar dados da empresa
        prc_carregar_empresa;
        //prc_habiltar_edits_pessoa(false);
        pnCliente.Enabled := false;
        CriarMensagem('AVISO','Empresa já esta cadastrado no sistema');
      end
    end else
    begin
      // empresa nova ...
      prc_limpar_pessoa;
      //prc_habiltar_edits_pessoa(true);
      edt_rg_ie.SetFocus;
    end;

end;


function TfrmEmpresaE.fnc_validar: Boolean;
begin
  if Operacao = opExcluir then
  begin
    result := FALSE;
    exit;
  end;

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

  if edt_nome_fantasia.Text = '' then
  begin
    CriarMensagem('AVISO','Informe o NOME FANTASIA da empresa');
    edt_nome_fantasia.SetFocus;
    exit;
  end;

  if edt_site.Text = '' then
  begin
    CriarMensagem('AVISO','Informe o SITE da empresa');
    edt_site.SetFocus;
    exit;
  end;

  if edt_celular.Text = '' then
  begin
    CriarMensagem('AVISO','Informe o CELULAR da empresa');
    edt_celular.SetFocus;
    exit;
  end;

  if edt_telefone_fixo.Text = '' then
  begin
    CriarMensagem('AVISO','Informe o TELEFONE FIXO da empresa');
    edt_telefone_fixo.SetFocus;
    exit;
  end;

  if edt_crea.Text = '' then
  begin
    CriarMensagem('AVISO','Informe o número do CREA da empresa');
    edt_crea.SetFocus;
    exit;
  end;

  if edt_frase.Text = '' then
  begin
    CriarMensagem('AVISO','Informe uma FRASE DE BOAS VINDAS da empresa');
    edt_frase.SetFocus;
    exit;
  end;
  (*
  {carrega a classe}
  dmConn.empresa.PessoaId      := ds.DataSet.FieldByName('ID').AsInteger;
  dmConn.empresa.Nome_Fantasia := edt_nome_fantasia.Text;
  dmConn.empresa.Site          := edt_site.Text;
  dmConn.empresa.Crea          := edt_crea.Text;
  dmConn.empresa.Frase         := edt_frase.Text;
  dmConn.empresa.Telefone1     := edt_celular.Text;
  dmConn.empresa.Telefone2     := edt_telefone_fixo.Text;
  *)

  result := true;
end;

procedure TfrmEmpresaE.prc_inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin
                       pnTitulo.Caption := 'CADASTRO DE EMPRESA';
                       lbl_sub_titulo.Caption := 'Incluir um nova empresa';
                       btnOk.Caption := 'Incluir';
                       btnok.Enabled := FALSE;
                       prc_habilitar_desbilitar_componentes(FALSE);
                       pnCliente.Enabled := false;
                       lbl_cadastrado_em.Caption  := datetostr(date);
                       cb_ativo.Checked := TRUE;

                     end;
  uTipos.opAlterar: begin
                      prc_habilitar_desbilitar_componentes(TRUE);
                      pnCliente.Enabled := TRUE;
                      prc_ler_dados;
                      pnTitulo.Caption := 'CADASTRO DE EMPRESA';
                      lbl_sub_titulo.Caption := 'Alterar dados da empresa';
                      btnOk.Caption := 'Alterar';
                      btnOk.SetFocus;
                    end;
  uTipos.opExcluir: begin
                      prc_habilitar_desbilitar_componentes(FALSE);
                      pnCliente.Enabled := FALSE;
                      prc_ler_dados;
                      pnTitulo.Caption := 'CADASTRO DE EMPRESA';
                      lbl_sub_titulo.Caption := 'Excluir Empresa';
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

procedure TfrmEmpresaE.prc_ler_dados;

begin
  // carregar edits pessoa...
  qry.SQL.clear;
  qry.SQL.Add('select * from PESSOAS where ID =:ID');
  uBiblioteca.FilterCds(qry, uTipos.fsInteger, inttostr(CODIGO) );
  prc_carregar_pessoa;

  // carregar empresa ...
  qry.active := FALSE;
  qry.SQL.Clear;
  qry.SQL.Add('select * from EMPRESA where PESSOA_ID =:PESSOA_ID');
  qry.ParamByName('PESSOA_ID').AsInteger := CODIGO;
  qry.active := TRUE;
  prc_carregar_empresa;
end;

procedure TfrmEmpresaE.prc_salvar;
begin
    try

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;

      // salvar no banco pessoa e empresa
      pessoa_id := prc_incluir_alterar_pessoa(operacao);
      prc_incluir_alterar(operacao);

      if Self.Conexao.InTransaction then Self.Conexao.Commit;

      if operacao = OpIncluir then
        CriarMensagem('AVISO',' Empresa CADASTRADA com sucesso. ')
      else if operacao = OpAlterar then
        CriarMensagem('AVISO',' Empresa ALTERADO com sucesso. ')
      else CriarMensagem('AVISO',' Empresa EXCLUIDA com sucesso. ');

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

procedure TfrmEmpresaE.btn_buscar_logoClick(Sender: TObject);
var
 v_endereco: string;
begin
  inherited;
  {seleciona uma imagem}
   if OpenPictureDialog1.Execute then
   begin
     v_endereco := OpenPictureDialog1.FileName;
     img_logo.Picture.loadfromfile( v_endereco);
     edt_imagem.Text := v_endereco ;
   end;
end;

procedure TfrmEmpresaE.prc_incluir_alterar(operacao: TOperacao);
begin
  qry.SQL.clear;

  if operacao = opExcluir then
  begin
      Qry.SQL.Add('update EMPRESA set ATIVO = ' + QuotedStr('N') + ' where PESSOA_ID =:ID');
      Qry.ParamByName('ID').AsInteger := Codigo;
      Qry.ExecSQL;
      exit;
  end;


  if operacao = OpIncluir then
  begin


    //incluir empresa
    qry.SQL.Clear;
      qry.SQL.Add('insert into EMPRESA ');
      qry.SQL.Add('(                        ');
      qry.SQL.Add('  ID,                    ');
      qry.SQL.Add('  PESSOA_ID,             ');
      qry.SQL.Add('  NOME_FANTASIA,         ');
      qry.SQL.Add('  SITE,                  ');
      qry.SQL.Add('  CREA,                  ');
      qry.SQL.Add('  TELEFONE1,             ');
      qry.SQL.Add('  TELEFONE2,             ');
      qry.SQL.Add('  IMG_LOGO,              ');
      qry.SQL.Add('  ATIVO                  ');
      qry.SQL.Add(')                        ');
      qry.SQL.Add('VALUES                   ');
      qry.SQL.Add('(                        ');
      qry.SQL.Add('  :ID,                   ');
      qry.SQL.Add('  :PESSOA_ID,            ');
      qry.SQL.Add('  :NOME_FANTASIA,        ');
      qry.SQL.Add('  :SITE,                 ');
      qry.SQL.Add('  :CREA,                 ');
      qry.SQL.Add('  :TELEFONE1,            ');
      qry.SQL.Add('  :TELEFONE2,            ');
      qry.SQL.Add('  :IMG_LOGO,             ');
      qry.SQL.Add('  :ATIVO                 ');
      qry.SQL.Add(')                        ');

      Codigo := uBiblioteca.AutoIncremento(conexao, 'EMPRESA');
      qry.ParamByName('ID').AsInteger        := Codigo;
      qry.ParamByName('PESSOA_ID').AsInteger := qry.FieldByName('ID').AsInteger;
  end
  else if operacao = opAlterar then
  begin
    qry.SQL.Clear;
      qry.SQL.Add('UPDATE                              ');
      qry.SQL.Add('  EMPRESA                           ');
      qry.SQL.Add('SET                                 ');
      qry.SQL.Add('  NOME_FANTASIA   = :NOME_FANTASIA, ');
      qry.SQL.Add('  SITE = :SITE,                     ');
      qry.SQL.Add('  CREA  = :CREA,                    ');
      qry.SQL.Add('  TELEFONE1  = :TELEFONE1,          ');
      qry.SQL.Add('  TELEFONE2  = :TELEFONE2,          ');
      qry.SQL.Add('  IMG_LOGO  = :IMG_LOGO,            ');
      qry.SQL.Add('  ATIVO  = :ATIVO                   ');
      qry.SQL.Add('WHERE                               ');
      qry.SQL.Add('  PESSOA_ID = :PESSOA_ID            ');
      qry.ParamByName('PESSOA_ID').AsInteger := Codigo;

  end;

    //ShowMessage(loqry.SQL.text);

    qry.ParamByName('NOME_FANTASIA').AsString := edt_nome_fantasia.Text;
    qry.ParamByName('SITE').AsString          := edt_site.Text;
    qry.ParamByName('CREA').AsString          := edt_crea.Text;
    qry.ParamByName('TELEFONE1').AsString     := edt_telefone_fixo.Text;
    qry.ParamByName('TELEFONE2').AsString     := edt_celular.Text;
    qry.ParamByName('IMG_LOGO').AsString      := edt_imagem.Text;
    qry.ParamByName('ATIVO').AsString         := 'S';
    qry.ExecSQL;

end;

procedure TfrmEmpresaE.prc_carregar_pessoa;
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


procedure TfrmEmpresaE.prc_carregar_empresa;
begin

  edt_nome_fantasia.Text := qry.FieldByName('NOME_FANTASIA').AsString;
  edt_site.Text          := qry.FieldByName('SITE').AsString;
  edt_crea.Text          := qry.FieldByName('CREA').AsString;
  edt_frase.Text         := qry.FieldByName('FRASE').AsString;
  edt_celular.Text       := qry.FieldByName('TELEFONE1').AsString;
  edt_telefone_fixo.Text := qry.FieldByName('TELEFONE2').AsString;
  edt_imagem.Text        := qry.FieldByName('IMG_LOGO').AsString;
  {o componente image1 recebe e mostra a nova imagem}
  img_logo.Picture.LoadFromFile(edt_imagem.Text );

end;

procedure TfrmEmpresaE.prc_limpar_pessoa;
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

procedure TfrmEmpresaE.prc_habilitar_desbilitar_componentes(
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

function TfrmEmpresaE.prc_incluir_alterar_pessoa(operacao: TOperacao):integer;
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
