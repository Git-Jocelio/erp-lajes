 // configurações do sistema
 // inicio 21/02/2024

unit ufrmConfiguracoesSistema;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, uTipos, Vcl.ExtDlgs, uBiblioteca, IniFiles,
  ufrmContratoVenda, Vcl.Imaging.pngimage ;

type
  TfrmConfiguracoesSistema = class(TfrmBaseEdicao)
    PageControl1: TPageControl;
    tbs_pedido: TTabSheet;
    pgc_pedidos: TPageControl;
    tbs_pedido_comissoes: TTabSheet;
    Label5: TLabel;
    cbx_comissao_vendedor: TDBLookupComboBox;
    Label6: TLabel;
    cbx_comissao_adm: TDBLookupComboBox;
    tbs_pedido_relatorios: TTabSheet;
    ds_comissao_vendedor: TDataSource;
    ds_comissao_adm: TDataSource;
    qry_comissao_vendedor: TFDQuery;
    qry_comissao_adm: TFDQuery;
    tbs_geral: TTabSheet;
    Label3: TLabel;
    edt_empresa: TEdit;
    Label7: TLabel;
    edt_pedido_relatorios_img_pedido: TEdit;
    img_logo: TImage;
    btn_buscar_imagem: TSpeedButton;
    OpenPictureDialog1: TOpenPictureDialog;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    GroupBox1: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    edt_custos_lajes_vendedor: TEdit;
    edt_custos_lajes_balcao: TEdit;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Label1: TLabel;
    cbx_eixo_laje: TComboBox;
    Label4: TLabel;
    edt_qtde_130: TEdit;
    Label10: TLabel;
    edt_qtde_250: TEdit;
    lbl_senha: TLabel;
    edt_senha_uso_vitalicio: TEdit;
    cb_mostrar_botao_contrato: TCheckBox;
    cb_mostrar_botao_comissao: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    cbx_concreto_usinado: TDBLookupComboBox;
    Label14: TLabel;
    cbx_bomba_concreto: TDBLookupComboBox;
    ds_concreto_usinado: TDataSource;
    qry_concreto_usinado: TFDQuery;
    ds_bomba_concreto: TDataSource;
    qry_bomba_concreto: TFDQuery;
    cb_mostrar_qtde_laje_ordem_entrega: TCheckBox;
    cb_ordem_entrega_com_cabecalho: TCheckBox;
    cb_pedido_com_cabecalho: TCheckBox;
    GroupBox4: TGroupBox;
    cb_mostrar_coluna_id_pedido: TCheckBox;
    cb_mostrar_coluna_nosso_numero: TCheckBox;
    cb_mostrar_coluna_valor_pedido: TCheckBox;
    cb_mostrar_coluna_valor_pago: TCheckBox;
    cb_mostrar_coluna_resta_pagar: TCheckBox;
    cb_mostrar_coluna_data_emissao: TCheckBox;
    cb_mostrar_coluna_data_contabil: TCheckBox;
    cb_mostrar_coluna_data_entrega: TCheckBox;
    GroupBox5: TGroupBox;
    cb_pedir_forma_pagto: TCheckBox;
    cb_pedido_mostrar_aba_financeiro: TCheckBox;
    cb_calculo_laje: TCheckBox;
    cb_pedido_preco_vendedor: TCheckBox;
    BitBtn1: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn_buscar_imagemClick(Sender: TObject);
    procedure edt_custos_lajes_vendedorKeyPress(Sender: TObject; var Key: Char);
    procedure edt_custos_lajes_vendedorExit(Sender: TObject);
    procedure lbl_tituloDblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    Fp_tabela: string;
    Fp_eixo_laje: integer;
    procedure prc_salvar;
    procedure prc_gravar_arquivo_ini;
    procedure prc_ler_arquivo_ini;

  protected
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;
    function prc_validar: boolean;
    procedure prc_incluir_alterar;

  public
    property p_tabela:string read Fp_tabela write Fp_tabela;
    property p_eixo_laje :integer read Fp_eixo_laje write Fp_eixo_laje;

  end;

   procedure prc_executa;

implementation

uses unit_funcoes;

procedure prc_executa;
var
  loForm: TfrmConfiguracoesSistema;
begin
  try
    loForm:= TfrmConfiguracoesSistema.Create(Application);
    loForm.ShowModal;
  finally
    freeandnil(loForm);
  end;


end;

{$R *.dfm}

{ TfrmConfiguracoesSistema }

procedure TfrmConfiguracoesSistema.BitBtn1Click(Sender: TObject);
begin
  inherited;
  try
    if frmContratoVenda = nil then
      frmContratoVenda := TfrmContratoVenda.Create(application);

    frmContratoVenda.ShowModal;
  finally
    FreeAndNil(frmContratoVenda);
  end;

end;

procedure TfrmConfiguracoesSistema.btnOkClick(Sender: TObject);
begin
  inherited;
  prc_salvar;
end;

procedure TfrmConfiguracoesSistema.edt_custos_lajes_vendedorExit(
  Sender: TObject);
begin
  inherited;
  uBiblioteca.prc_formata_dinheiro(sender);
end;

procedure TfrmConfiguracoesSistema.edt_custos_lajes_vendedorKeyPress(
  Sender: TObject; var Key: Char);
begin
  inherited;
  uBiblioteca.prc_somente_numeros(sender, key);
end;

procedure TfrmConfiguracoesSistema.FormCreate(Sender: TObject);
begin
  inherited;
    self.p_tabela := 'CONFIGURACOES_SISTEMA';

end;

procedure TfrmConfiguracoesSistema.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmConfiguracoesSistema.lbl_tituloDblClick(Sender: TObject);
begin
  inherited;
  lbl_senha.Visible               := TRUE;
  edt_senha_uso_vitalicio.Visible := TRUE;
end;

procedure TfrmConfiguracoesSistema.prc_componentes;
begin
  {qry da tabela CONFIGURACOES_SISTEMA}
  qry.Connection := Conexao;
  qry.SQL.Add('select * from ' + p_tabela);
  qry.Open;

  qry_comissao_vendedor.Connection := Conexao;
  qry_comissao_vendedor.Open('select * from plano_contas where tipo = ' + quotedstr('A') + ' order by descricao');

  qry_comissao_adm.Connection := Conexao;
  qry_comissao_adm.Open('select * from plano_contas where tipo = ' + quotedstr('A') + ' order by descricao');

  qry_concreto_usinado.Connection := conexao;
  qry_concreto_usinado.Open('select * from plano_contas where tipo = ' + quotedstr('A') + ' order by descricao');

  qry_bomba_concreto.Connection := conexao;
  qry_bomba_concreto.Open('select * from plano_contas where tipo = ' + quotedstr('A') + ' order by descricao');


  lbl_titulo.Caption := 'CONFIGURAÇÕES DO SISTEMA';
  lbl_sub_titulo.Caption := 'Configurações padrões de campos usados no sistema';
  // cofigurações da maquina local
  prc_ler_arquivo_ini;
end;

procedure TfrmConfiguracoesSistema.prc_inicializar;
begin
  prc_ler_dados;
end;

procedure TfrmConfiguracoesSistema.prc_ler_dados;
var
  loQry : TFDQuery;
  ArquivoINI: TIniFile;
begin
  {Geral}
  edt_empresa.Text  :=  qry.FieldByName('GERAL_EMPRESA').AsString;
  edt_qtde_130.Text :=  qry.FieldByName('GERAL_QTDE_FORMA_130').AsString;
  edt_qtde_250.Text :=  qry.FieldByName('GERAL_QTDE_FORMA_250').AsString;
  edt_senha_uso_vitalicio.Text := criptografia( qry.FieldByName('GERAL_LIBERAR_SISTEMA').AsString );

  {pedido-comissao}
  cbx_comissao_vendedor.KeyValue := qry.FieldByName('PEDIDO_CONTA_COMISSAO_VEND').AsInteger;
  cbx_comissao_adm.KeyValue      := qry.FieldByName('PEDIDO_CONTA_COMISSAO_adm').AsInteger;
  cbx_concreto_usinado.KeyValue  := qry.FieldByName('PEDIDO_CONCRETO_USINADO').AsInteger;
  cbx_bomba_concreto.KeyValue    := qry.FieldByName('PEDIDO_BOMBA_CONCRETO').AsInteger;

  {pedido-relatório}
  // centralizar o logotipo usado no projeto na tabela empresa
  //edt_pedido_relatorios_img_pedido.Text := qry.FieldByName('PEDIDO_RELATORIOS_LOGO_PEDIDO').AsString;
  //if (qry.FieldByName('PEDIDO_RELATORIOS_LOGO_PEDIDO').AsString <> '') then
  //  img_logo.Picture.LoadFromFile(qry.FieldByName('PEDIDO_RELATORIOS_LOGO_PEDIDO').AsString);
  try
    loqry := TFDQuery.Create(nil);
    loqry.Connection := conexao;
    loqry.Open('select IMG_LOGO from empresa');

    if (loqry.FieldByName('IMG_LOGO').AsString <> '') then
    begin
      edt_pedido_relatorios_img_pedido.Text := loqry.FieldByName('IMG_LOGO').AsString;
      img_logo.Picture.LoadFromFile(loqry.FieldByName('IMG_LOGO').AsString);
    end;

  finally
     freeandnil(loqry);
  end;


  cb_mostrar_botao_contrato.Checked := qry.FieldByName('PED_REL_MOSTRAR_BTN_CONTRATO').AsString = 'S';
  cb_mostrar_botao_comissao.Checked := qry.FieldByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString = 'S';
  cb_mostrar_qtde_laje_ordem_entrega.Checked := qry.FieldByName('PED_REL_MOSTRAR_QTDE_LAJE').AsString = 'S';
  cb_ordem_entrega_com_cabecalho.Checked := qry.FieldByName('PED_REL_MOSTRAR_CABECALHO').AsString = 'S';
  cb_pedido_com_cabecalho.Checked := qry.FieldByName('PED_REL_MOSTRAR_CABECALHO_PED').AsString = 'S';

  {pedido... outros}
  cb_mostrar_coluna_id_pedido.Checked      := qry.FieldByName('PEDIDO_OUTROS_MOSTRA_ID_PEDIDO').AsString = 'S';
  cb_pedir_forma_pagto.Checked             := qry.FieldByName('PEDIDO_OUTROS_FORMA_PGTO').AsString = 'S';
  cb_pedido_mostrar_aba_financeiro.Checked := qry.FieldByName('PEDIDO_MOSTRAR_ABA_FINANCEIRO').AsString = 'S';
  cb_calculo_laje.Checked                  := qry.FieldByName('PEDIDO_CALCULAR_LAJE_POR_VIGA').AsString = 'S';
  cb_pedido_preco_vendedor.Checked         := qry.FieldByName('PEDIDO_COLUNA_PRECO_VEND').AsString = 'S';

  {custos de lajes}
  edt_custos_lajes_vendedor.Text := FormatFloat('0.00', qry.FieldByName('CUSTOS_PERC_VENDEDOR').AsFloat);
  edt_custos_lajes_balcao.Text   := FormatFloat('0.00', qry.FieldByName('CUSTOS_PERC_BALCAO').AsFloat);

  cbx_eixo_laje.Text := FormatFloat( '0.00', ( qry.FieldByName('EIXO_LAJE').AsFloat / 1000 ));
  p_eixo_laje :=  qry.FieldByName('EIXO_LAJE').AsInteger;


end;


procedure TfrmConfiguracoesSistema.prc_gravar_arquivo_ini;
var
  IniFile : string;
  Ini : TInifile;
begin
  {cria um arquivo com o mesmo nome da aplicação e troca a extensao}
  IniFile := ChangeFileExt(application.ExeName,'.ini');
  Ini := TIniFile.Create( IniFile );


  try
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_id',ubiblioteca.SeSenao(cb_mostrar_coluna_id_pedido.Checked,'true','false'));
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_data_emissao',ubiblioteca.SeSenao(cb_mostrar_coluna_data_emissao.Checked,'true','false'));
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_data_contabil',ubiblioteca.SeSenao(cb_mostrar_coluna_data_contabil.Checked,'true','false'));
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_data_entrega',ubiblioteca.SeSenao(cb_mostrar_coluna_data_entrega.Checked,'true','false'));
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_nosso_numero',ubiblioteca.SeSenao(cb_mostrar_coluna_nosso_numero.Checked,'true','false'));
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_valor_pedido',ubiblioteca.SeSenao(cb_mostrar_coluna_valor_pedido.Checked,'true','false'));
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_valor_pago',ubiblioteca.SeSenao(cb_mostrar_coluna_valor_pago.Checked,'true','false'));
    Ini.WriteString('configuracao_tela_pedidos', 'mostrar_coluna_resta',ubiblioteca.SeSenao(cb_mostrar_coluna_resta_pagar.Checked,'true','false'));

    Ini.WriteString('configuracao_tela_emissao_pedidos', 'mostrar_coluna_preco_vendedor',ubiblioteca.SeSenao(cb_pedido_preco_vendedor.Checked,'true','false'));
  finally
    FreeAndNil( Ini );
  end;

end;

procedure TfrmConfiguracoesSistema.prc_ler_arquivo_ini;
var
  IniFile : string;
  Ini : TInifile;
  mostrar_coluna_id_pedido,
  mostrar_coluna_data_emissao,
  mostrar_coluna_data_contabil,
  mostrar_coluna_nosso_numero,
  mostrar_coluna_valor_pedido,
  mostrar_coluna_valor_pago,
  mostrar_coluna_resta,
  mostrar_coluna_data_entrega : string;
begin
  {cria um arquivo com o mesmo no da aplicação e troca a extensao para .ini}
  IniFile := ChangeFileExt(application.ExeName,'.ini');

  Ini     := TIniFile.Create( IniFile );

  if not FileExists(IniFile) then
  begin
    criarMensagem('AVISO','Arquivo .Ini não encontrado para configuração da tela de pedidos');
  end
  else
  begin

    try
      mostrar_coluna_id_pedido    := Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_id','' );
      mostrar_coluna_data_emissao := Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_data_emissao','' );
      mostrar_coluna_data_contabil:= Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_data_contabil','' );
      mostrar_coluna_data_entrega := Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_data_entrega','' );
      mostrar_coluna_nosso_numero := Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_nosso_numero','' );
      mostrar_coluna_valor_pedido := Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_valor_pedido','' );
      mostrar_coluna_valor_pago   := Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_valor_pago','' );
      mostrar_coluna_resta        := Ini.ReadString('configuracao_tela_pedidos', 'mostrar_coluna_resta','');

      cb_mostrar_coluna_id_pedido.Checked     := uBiblioteca.SeSenao(mostrar_coluna_id_pedido = 'true', true,false);
      cb_mostrar_coluna_data_emissao.Checked  := uBiblioteca.SeSenao(mostrar_coluna_data_emissao = 'true', true,false);
      cb_mostrar_coluna_data_contabil.Checked := uBiblioteca.SeSenao(mostrar_coluna_data_contabil = 'true', true,false);
      cb_mostrar_coluna_data_entrega.Checked  := uBiblioteca.SeSenao(mostrar_coluna_data_entrega = 'true', true,false);
      cb_mostrar_coluna_nosso_numero.Checked  := uBiblioteca.SeSenao(mostrar_coluna_nosso_numero = 'true', true,false);
      cb_mostrar_coluna_valor_pedido.Checked  := uBiblioteca.SeSenao(mostrar_coluna_valor_pedido = 'true', true,false);
      cb_mostrar_coluna_valor_pago.Checked    := uBiblioteca.SeSenao(mostrar_coluna_valor_pago = 'true', true,false);
      cb_mostrar_coluna_resta_pagar.Checked   := uBiblioteca.SeSenao(mostrar_coluna_resta = 'true', true,false);


    finally
      FreeAndNil( Ini );
    end;

  end;

end;

procedure TfrmConfiguracoesSistema.prc_salvar;
begin
   if prc_validar then
   begin
     prc_incluir_alterar;
     close;
   end;
end;

function TfrmConfiguracoesSistema.prc_validar: boolean;
begin
  result := false;
  if edt_empresa.text = '' then
  begin
    criarMensagem('AVISO','informe uma EMPRESA');
    edt_empresa.SetFocus;
    exit;
    // jocelio tem que ser TRIUNFO OU FERRARI, palavra chave pra calcular as comissões de cada empresa
  end;

  if edt_pedido_relatorios_img_pedido.text = '' then
  begin
    criarMensagem('AVISO','selecione uma imagem para o pedido');
    PageControl1.TabIndex := 1;
    pgc_pedidos.TabIndex  := 1;
   // edt_pedido_relatorios_img_pedido.SetFocus;
    exit;
    // jocelio tem que ser TRIUNFO OU FERRARI, palavra chave pra calcular as comissões de cada empresa
  end;

  if strtointdef(edt_qtde_130.text,0) < 0 then
  begin
    criarMensagem('AVISO','INFORME A QUANTIDADE DE FORMAS DE 130 mm EM METROS LINEARES ');
    edt_qtde_130.SetFocus;
    exit;
  end;

  if strtointdef(edt_qtde_250.text,0) < 0 then
  begin
    criarMensagem('AVISO','INFORME A QUANTIDADE DE FORMAS DE 250 mm EM METROS LINEARES ');
    edt_qtde_250.SetFocus;
    exit;
  end;

  result := true;
end;

procedure TfrmConfiguracoesSistema.btn_buscar_imagemClick(Sender: TObject);
var
 v_endereco: string;
begin
  inherited;
  {seleciona uma imagem}
   if OpenPictureDialog1.Execute then
   begin
     v_endereco := OpenPictureDialog1.FileName;
     img_logo.Picture.loadfromfile( v_endereco);
     edt_pedido_relatorios_img_pedido.Text := v_endereco ;
   end;
end;

procedure TfrmConfiguracoesSistema.prc_incluir_alterar;
var
  loqry : TFDQuery;
begin
  try
    qry.sql.clear;

    qry.SQL.Add('UPDATE ');
    qry.SQL.Add(p_tabela);  // CONFIGURACOES_SISTEMA
    qry.SQL.Add('SET   ');

    {aba geral}
    qry.SQL.Add('  GERAL_EMPRESA = :GERAL_EMPRESA,                 ');
    qry.SQL.Add('  GERAL_QTDE_FORMA_130  = :QTDE_FORMA_130,        ');
    qry.SQL.Add('  GERAL_QTDE_FORMA_250  = :QTDE_FORMA_250,        ');
    qry.SQL.Add('  GERAL_LIBERAR_SISTEMA = :GERAL_LIBERAR_SISTEMA, ');

    {aba pedido... comissao}
    qry.SQL.Add('  PEDIDO_CONTA_COMISSAO_VEND = :PEDIDO_CONTA_COMISSAO_VEND, ');
    qry.SQL.Add('  PEDIDO_CONTA_COMISSAO_ADM  = :PEDIDO_CONTA_COMISSAO_ADM,  ');
    qry.SQL.Add('  PEDIDO_CONCRETO_USINADO    = :PEDIDO_CONCRETO_USINADO,  ');
    qry.SQL.Add('  PEDIDO_BOMBA_CONCRETO      = :PEDIDO_BOMBA_CONCRETO,  ');

    {aba pedido... relatorios}
    qry.SQL.Add('  PEDIDO_RELATORIOS_LOGO_PEDIDO = :PEDIDO_RELATORIOS_LOGO_PEDIDO, ');
    qry.SQL.Add('  PED_REL_MOSTRAR_BTN_CONTRATO  = :PED_REL_MOSTRAR_BTN_CONTRATO,  ');
    qry.SQL.Add('  PED_REL_MOSTRAR_BTN_COMISSAO  = :PED_REL_MOSTRAR_BTN_COMISSAO,  ');
    qry.SQL.Add('  PED_REL_MOSTRAR_QTDE_LAJE     = :PED_REL_MOSTRAR_QTDE_LAJE,  ');
    qry.SQL.Add('  PED_REL_MOSTRAR_CABECALHO     = :PED_REL_MOSTRAR_CABECALHO,  ');
    qry.SQL.Add('  PED_REL_MOSTRAR_CABECALHO_PED = :PED_REL_MOSTRAR_CABECALHO_PED,  ');

    {aba pedido... Outras configurações no pedido}
    qry.SQL.Add('  PEDIDO_OUTROS_MOSTRA_ID_PEDIDO  = :PEDIDO_OUTROS_MOSTRA_ID_PEDIDO, ');
    qry.SQL.Add('  PEDIDO_OUTROS_FORMA_PGTO        = :PEDIDO_OUTROS_FORMA_PGTO,       ');
    qry.SQL.Add('  PEDIDO_MOSTRAR_ABA_FINANCEIRO   = :PEDIDO_MOSTRAR_ABA_FINANCEIRO,  ');
    qry.SQL.Add('  PEDIDO_CALCULAR_LAJE_POR_VIGA   = :PEDIDO_CALCULAR_LAJE_POR_VIGA,  ');
    // dentro da emissão do pedido, mostras a coluna preço do vendedor
    qry.SQL.Add('  PEDIDO_COLUNA_PRECO_VEND        = :PEDIDO_COLUNA_PRECO_VEND,  ');

    {aba custos de laje}
    qry.SQL.Add('  CUSTOS_PERC_VENDEDOR  = :CUSTOS_PERC_VENDEDOR, ');
    qry.SQL.Add('  CUSTOS_PERC_BALCAO    = :CUSTOS_PERC_BALCAO,   ');
    qry.SQL.Add('  EIXO_LAJE = :EIXO_LAJE ');

    qry.ParamByName('GERAL_EMPRESA').AsString                  := edt_empresa.Text;
    qry.ParamByName('GERAL_LIBERAR_SISTEMA').AsString          := criptografia(edt_senha_uso_vitalicio.Text);

    qry.ParamByName('QTDE_FORMA_130').AsInteger                := strtoint( edt_qtde_130.Text );
    qry.ParamByName('QTDE_FORMA_250').AsInteger                := strtoint( edt_qtde_250.Text );

    qry.ParamByName('PEDIDO_CONTA_COMISSAO_VEND').AsInteger := cbx_comissao_vendedor.KeyValue;
    qry.ParamByName('PEDIDO_CONTA_COMISSAO_ADM').AsInteger  := cbx_comissao_adm.KeyValue;
    qry.ParamByName('PEDIDO_CONCRETO_USINADO').AsInteger    := cbx_concreto_usinado.KeyValue;
    qry.ParamByName('PEDIDO_BOMBA_CONCRETO').AsInteger      := cbx_bomba_concreto.KeyValue;


    qry.ParamByName('PEDIDO_RELATORIOS_LOGO_PEDIDO').AsString  := edt_pedido_relatorios_img_pedido.Text;
    qry.ParamByName('PED_REL_MOSTRAR_BTN_CONTRATO').AsString   := ubiblioteca.SeSenao(cb_mostrar_botao_contrato.Checked = true, 'S','N');
    qry.ParamByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString   := ubiblioteca.SeSenao(cb_mostrar_botao_comissao.Checked = true, 'S','N');
    qry.ParamByName('PED_REL_MOSTRAR_QTDE_LAJE').AsString      := ubiblioteca.SeSenao(cb_mostrar_qtde_laje_ordem_entrega.Checked = true, 'S','N');
    qry.ParamByName('PED_REL_MOSTRAR_CABECALHO').AsString      := ubiblioteca.SeSenao(cb_ordem_entrega_com_cabecalho.Checked = true, 'S','N');
    qry.ParamByName('PED_REL_MOSTRAR_CABECALHO_PED').AsString  := ubiblioteca.SeSenao(cb_pedido_com_cabecalho.Checked = true, 'S','N');

    qry.ParamByName('PEDIDO_OUTROS_MOSTRA_ID_PEDIDO').AsString := ubiblioteca.SeSenao(cb_mostrar_coluna_id_pedido.Checked = true, 'S','N');
    qry.ParamByName('PEDIDO_OUTROS_FORMA_PGTO').AsString       := ubiblioteca.SeSenao(cb_pedir_forma_pagto.Checked = true, 'S','N');
    qry.ParamByName('PEDIDO_MOSTRAR_ABA_FINANCEIRO').AsString  := ubiblioteca.SeSenao(cb_pedido_mostrar_aba_financeiro.Checked = true, 'S','N');
    qry.ParamByName('PEDIDO_CALCULAR_LAJE_POR_VIGA').AsString  := ubiblioteca.SeSenao(cb_calculo_laje.Checked = true, 'S','N');
    qry.ParamByName('PEDIDO_COLUNA_PRECO_VEND').AsString       := ubiblioteca.SeSenao(cb_pedido_preco_vendedor.Checked = true, 'S','N');

    qry.ParamByName('CUSTOS_PERC_VENDEDOR').AsFloat            := strtofloat(edt_custos_lajes_vendedor.Text);
    qry.ParamByName('CUSTOS_PERC_BALCAO').AsFloat              := strtofloat(edt_custos_lajes_balcao.Text);

    //salva o eixo em milimetros
    if cbx_eixo_laje.ItemIndex = 0 then
      p_eixo_laje := 370
    else if cbx_eixo_laje.ItemIndex = 1 then
      p_eixo_laje := 380
    else if cbx_eixo_laje.ItemIndex = 2 then
      p_eixo_laje := 420
    else if cbx_eixo_laje.ItemIndex = 3 then
      p_eixo_laje := 430
    else if cbx_eixo_laje.ItemIndex = 4 then
      p_eixo_laje := 490
    else if cbx_eixo_laje.ItemIndex = 5 then
      p_eixo_laje := 500;

    qry.ParamByName('EIXO_LAJE').AsInteger := p_eixo_laje;

    qry.ExecSQL;

    criarMensagem('AVISO','INFORMAÇÕES ALTERADAS COM SUCESSO.');

    // salvar endereço da imagem na tabela empresa,
    // onde decidi centralizar somente nessa tabela
    try
      loqry := TFDQuery.Create(nil);
      loqry.Connection := conexao;
      loQry.SQl.add('update empresa set img_logo =:img_logo');
      loQry.ParamByName('img_logo').AsString := edt_pedido_relatorios_img_pedido.Text;
      loqry.ExecSQL
    finally
      FreeAndNil(loqry);
    end;


  except
    on E : Exception do
      raise Exception.Create(e.Message + sLineBreak +  sLineBreak + 'ERRO AS SALVAR AS CONFIGURAÇÕES' );
   // ShowMessage('Erro ao salvar as configurações')
  end;

  prc_gravar_arquivo_ini;
end;






end.
