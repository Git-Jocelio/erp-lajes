unit unit_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Buttons, Vcl.AppEvnts, ufrmEstoquesConsulta,
  ufrmProducoesVigas, unit_atualizacao_banco_de_dados, unit_seguranca_sistema,
  Vcl.ExtDlgs,  System.DateUtils, ufrmRecibos, Vcl.Menus, ufrmProducaoVigas,
  ufrmCortes, ufrmPequisa_vigas_vendidas, ufrmCategorias, Vcl.ComCtrls;

type
  Tform_principal = class(TForm)
    pnl_topo: TPanel;
    pnl_menulateral: TPanel;
    img_logo_empresa: TImage;
    lbl_titulo: TLabel;
    lbl_versao: TLabel;
    img_botato_logado: TImage;
    img_botao_sair: TImage;
    pnl_botao_sobre: TPanel;
    img_botao_sobre: TImage;
    lbl_botao_sobre: TLabel;
    pnl_botao_estoques: TPanel;
    img_botao_estoques: TImage;
    lbl_botao_estoques: TLabel;
    pnl_botao_notas: TPanel;
    img_botao_notas: TImage;
    lbl_botao_notas: TLabel;
    pnl_botao_pessoas: TPanel;
    img_botao_pessoas: TImage;
    lbl_botao_cadastros: TLabel;
    pnl_botao_produtos: TPanel;
    img_botao_produtos: TImage;
    lbl_botao_produtos: TLabel;
    pnl_botao_financeiro: TPanel;
    img_botao_financeiro: TImage;
    lbl_botao_financeiro: TLabel;
    pnl_barra_separadora: TPanel;
    ApplicationEvents: TApplicationEvents;
    pnl_botao_compras: TPanel;
    img_botao_compras: TImage;
    lbl_botao_compras: TLabel;
    pnl_botao_faturamento: TPanel;
    img_botao_faturamento: TImage;
    lbl_botao_faturamento: TLabel;
    pnl_Principal: TPanel;
    pnl_submenu_faturamento: TPanel;
    Shape2: TShape;
    pnl_submenu_pessoas: TPanel;
    Shape1: TShape;
    pnl_submenu_cadastros_botao_transportadoras: TPanel;
    pnl_submenu_cadastros_botao_vendedores: TPanel;
    img_submenu_cadastros_botao_vendedores: TImage;
    lbl_submenu_cadastros_botao_vendedores: TLabel;
    pnl_submenu_cadastros_botao_empresa: TPanel;
    img_submenu_cadastros_botao_empresa: TImage;
    lbl_submenu_cadastros_botao_empresa: TLabel;
    pnl_submenu_cadastros_botao_usuario: TPanel;
    img_submenu_cadastros_botao_usuario: TImage;
    lbl_submenu_cadastros_botao_usuario: TLabel;
    pnl_submenu_cadastros_botao_prestadores: TPanel;
    img_submenu_cadastros_botao_prestadores: TImage;
    lbl_submenu_cadastros_botao_prestadores: TLabel;
    pnl_botao_sistema: TPanel;
    img_botao_sistema: TImage;
    lbl_botao_sistema: TLabel;
    pnl_botao_utilitarios: TPanel;
    img_botao_utilitarios: TImage;
    lbl_botao_utilitarios: TLabel;
    pnl_submenu_cadastros_botao_clientes: TPanel;
    img_submenu_cadastros_botao_clientes: TImage;
    lbl_submenu_cadastros_botao_clientes: TLabel;
    img_submenu_cadastros_botao_transportadoras: TImage;
    lbl_submenu_cadastros_botao_transportadoras: TLabel;
    Label3: TLabel;
    pnl_submenu_cadastros_botao_fornecedores: TPanel;
    img_submenu_cadastros_botao_fornecedores: TImage;
    lbl_submenu_cadastros_botao_fornecedores: TLabel;
    pnl_submenu_cadastros_botao_pessoas: TPanel;
    img_submenu_cadastros_botao_pessoas: TImage;
    lbl_submenu_cadastros_botao_pessoas: TLabel;
    pnl_submenu_produtos: TPanel;
    Shape3: TShape;
    Label1: TLabel;
    pnl_submenu_produtos_botao_vigas: TPanel;
    img_submenu_produtos_botao_vigas: TImage;
    lbl_submenu_produtos_botao_vigas: TLabel;
    pnl_submenu_produtos_botao_trelicas: TPanel;
    img_submenu_produtos_botao_trelicas: TImage;
    lbl_submenu_produtos_botao_trelicas: TLabel;
    pnl_submenu_produtos_botao_isopor: TPanel;
    img_submenu_produtos_botao_isopor: TImage;
    lbl_submenu_produtos_botao_isopor: TLabel;
    pnl_submenu_produtos_botao_lajotas: TPanel;
    img_submenu_produtos_botao_lajotas: TImage;
    lbl_submenu_produtos_botao_lajotas: TLabel;
    pnl_submenu_produtos_botao_concreto: TPanel;
    img_submenu_produtos_botao_concreto: TImage;
    lbl_submenu_produtos_botao_concreto: TLabel;
    pnl_submenu_produtos_botao_vergalhoes: TPanel;
    img_submenu_produtos_botao_vergalhoes: TImage;
    lbl_submenu_produtos_botao_vergalhoes: TLabel;
    pnl_submenu_produtos_botao_lajes: TPanel;
    img_submenu_produtos_botao_lajes: TImage;
    lbl_submenu_produtos_botao_lajes: TLabel;
    pnl_submenu_produtos_botao_bomba: TPanel;
    img_submenu_produtos_botao_bomba: TImage;
    lbl_submenu_produtos_botao_bomba: TLabel;
    pnl_submenu_produtos_botao_revenda: TPanel;
    img_submenu_produtos_botao_revenda: TImage;
    lbl_submenu_produtos_botao_revenda: TLabel;
    pnl_submenu_faturamento_botao_pedidos: TPanel;
    img_submenu_faturamento_botao_pedidos: TImage;
    lbl_submenu_faturamento_botao_pedidos: TLabel;
    pnl_submenu_compras: TPanel;
    Shape4: TShape;
    pnl_submenu_faturamento_botao_compras: TPanel;
    img_submenu_faturamento_botao_compras: TImage;
    lbl_submenu_faturamento_botao_compras: TLabel;
    pnl_submenu_estoques: TPanel;
    Shape5: TShape;
    pnl_submenu_estoques_botao_producao: TPanel;
    img_submenu_estoques_botao_producao: TImage;
    lbl_submenu_estoques_botao_producao: TLabel;
    pnl_submenu_financeiro: TPanel;
    Shape6: TShape;
    Label2: TLabel;
    pnl_submenu_finaceiro_botao_chempresa: TPanel;
    img_submenu_finaceiro_botao_chempresa: TImage;
    lbl_submenu_finaceiro_botao_chempresa: TLabel;
    pnl_submenu_finaceiro_botao_cartao: TPanel;
    img_submenu_finaceiro_botao_cartao: TImage;
    lbl_submenu_finaceiro_botao_cartao: TLabel;
    pnl_submenu_finaceiro_botao_areceber: TPanel;
    img_submenu_finaceiro_botao_areceber: TImage;
    lbl_submenu_finaceiro_botao_areceber: TLabel;
    pnl_submenu_finaceiro_botao_apagar: TPanel;
    img_submenu_finaceiro_botao_apagar: TImage;
    lbl_submenu_finaceiro_botao_apagar: TLabel;
    pnl_submenu_finaceiro_botao_chcliente: TPanel;
    img_submenu_finaceiro_botao_chcliente: TImage;
    lbl_submenu_finaceiro_botao_chcliente: TLabel;
    pnl_submenu_finaceiro_botao_auxiliares: TPanel;
    img_submenu_finaceiro_botao_auxiliares: TImage;
    lbl_submenu_finaceiro_botao_auxiliares: TLabel;
    pnl_submenu_sistema: TPanel;
    Shape7: TShape;
    pnl_submenu_sistema_botao_servidor: TPanel;
    img_submenu_sistema_botao_servidor: TImage;
    lbl_submenu_sistema_botao_servidor: TLabel;
    pnl_submenu_sistema_botao_sistema: TPanel;
    img_submenu_sistema_botao_sistema: TImage;
    lbl_submenu_sistema_botao_sistema: TLabel;
    mm_atualicao_banco: TMemo;
    pnl_submenu_estoques_botao_produzir: TPanel;
    img_submenu_estoques_botao_produzir: TImage;
    lbl_submenu_estoques_botao_produzir: TLabel;
    pnl_submenu_estoques_botao_consulta: TPanel;
    img_submenu_estoques_botao_consulta: TImage;
    lbl_submenu_estoques_botao_consulta: TLabel;
    memo_seguranca: TMemo;
    OpenPictureDialog1: TOpenPictureDialog;
    pnl_submenu_utilitarios: TPanel;
    Shape8: TShape;
    pnl_submenu_utilitarios_botao_notificacoes: TPanel;
    img_submenu_utilitarios_botao_notificacoes: TImage;
    lbl_submenu_utilitarios_botao_notificacoes: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    Label4: TLabel;
    Panel2: TPanel;
    Image2: TImage;
    Label5: TLabel;
    pnl_sub_menu_cadAuxiliares: TPanel;
    Shape9: TShape;
    pnl_CadAuxiliares_FormasPgto: TPanel;
    img_CadAuxiliares_FormasPgto: TImage;
    lbl_CadAuxiliares_FormasPgto: TLabel;
    pnl_sub_menu_producao_telas: TPanel;
    img_sub_menu_producao_telas: TImage;
    lbl_sub_menu_producao_telas: TLabel;
    Label6: TLabel;
    pnl_submenu_finaceiro_recibos: TPanel;
    img_submenu_finaceiro_recibos: TImage;
    lbl_submenu_finaceiro_recibos: TLabel;
    Menu: TMainMenu;
    Cadastros1: TMenuItem;
    Cadastros2: TMenuItem;
    Fatutamento1: TMenuItem;
    Fatutamento2: TMenuItem;
    Estoques1: TMenuItem;
    Estoques2: TMenuItem;
    NotaFiscalEletrnica1: TMenuItem;
    NotaFiscalEletrnica2: TMenuItem;
    Utilitrios1: TMenuItem;
    Sobre1: TMenuItem;
    CadastroAuxiliares1: TMenuItem;
    FormasPagamento1: TMenuItem;
    FormasPagamento2: TMenuItem;
    ContasBancrias1: TMenuItem;
    EntradadeDinheiro1: TMenuItem;
    Usurios1: TMenuItem;
    Usurios2: TMenuItem;
    Vendedores1: TMenuItem;
    Clientes1: TMenuItem;
    ransportadoras1: TMenuItem;
    Fornecedores1: TMenuItem;
    PrestadoresdeServio1: TMenuItem;
    Pessoas1: TMenuItem;
    Revenda1: TMenuItem;
    Lajotas1: TMenuItem;
    Isopor1: TMenuItem;
    relias1: TMenuItem;
    Vergalhes1: TMenuItem;
    VigasdeLaje1: TMenuItem;
    Lajes1: TMenuItem;
    ConcretoUsinado1: TMenuItem;
    BombadeConcreto1: TMenuItem;
    ControledePedidos1: TMenuItem;
    DevoluesTrocas1: TMenuItem;
    BaixarPedidos1: TMenuItem;
    ControledeCompras1: TMenuItem;
    EntradadeVigasProduo1: TMenuItem;
    ProduodoDia1: TMenuItem;
    ProduodeTelas1: TMenuItem;
    ConsultaAteraodeEstoques1: TMenuItem;
    SaidadeDinheiro1: TMenuItem;
    ContasReceber1: TMenuItem;
    ContasaPagar1: TMenuItem;
    VendasComCartodeCrdito1: TMenuItem;
    ControleChequeCliente1: TMenuItem;
    ControleChequedaEmpresa1: TMenuItem;
    RecibodePagamento1: TMenuItem;
    Con1: TMenuItem;
    ConfiguraodoServidor1: TMenuItem;
    MovimentaodoCaixaDinheiro1: TMenuItem;
    Correntistas1: TMenuItem;
    N1: TMenuItem;
    CadastrodeOperadorasdeCartodeCrdito1: TMenuItem;
    CadastrodeBandeirasdeCartodeCrdito1: TMenuItem;
    CadastrodeMquinasdeCartodeCrdito1: TMenuItem;
    CadastrodeTaxasdeOperadoras1: TMenuItem;
    CadastrodeFORMASPAGTOdeCartodeCrdito1: TMenuItem;
    RecibodePagamentodeContas1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    PixRecebidos1: TMenuItem;
    PixEnviados1: TMenuItem;
    Button1: TButton;
    N5: TMenuItem;
    GerarCortes1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    ListView1: TListView;
    procedure img_botao_sairClick(Sender: TObject);
    procedure pnl_menulateralMouseEnter(Sender: TObject);
    procedure pnl_PrincipalMouseEnter(Sender: TObject);
    procedure pnl_botao_notasMouseEnter(Sender: TObject);
    procedure pnl_botao_financeiroClick(Sender: TObject);
    procedure ApplicationEventsModalEnd(Sender: TObject);
    procedure pnl_botao_pessoasClick(Sender: TObject);
    procedure pnl_botao_produtosClick(Sender: TObject);
    procedure pnl_botao_estoquesClick(Sender: TObject);
    procedure pnl_botao_faturamentoClick(Sender: TObject);
    procedure lbl_botao_comprasClick(Sender: TObject);
    procedure pnl_botao_sistemaClick(Sender: TObject);
    procedure pnl_submenu_cadastros_botao_vendedoresClick(Sender: TObject);
    procedure pnl_submenu_faturamento_botao_pedidosClick(Sender: TObject);
    procedure pnl_submenu_cadastros_botao_clientesClick(Sender: TObject);
    procedure pnl_submenu_cadastros_botao_usuarioClick(Sender: TObject);
    procedure pnl_submenu_cadastros_botao_empresaClick(Sender: TObject);
    procedure pnl_submenu_cadastros_botao_transportadorasClick(Sender: TObject);
    procedure pnl_submenu_cadastros_botao_fornecedoresClick(Sender: TObject);
    procedure pnl_submenu_finaceiro_botao_apagarClick(Sender: TObject);
    procedure pnl_submenu_finaceiro_botao_areceberClick(Sender: TObject);
    procedure pnl_submenu_cadastros_botao_pessoasClick(Sender: TObject);
    procedure mm_atualicao_bancoDblClick(Sender: TObject);
    procedure pnl_submenu_faturamento_botao_comprasClick(Sender: TObject);
    procedure pnl_submenu_sistema_botao_sistemaClick(Sender: TObject);
    procedure pnl_submenu_sistema_botao_servidorClick(Sender: TObject);
    procedure pnl_submenu_estoques_botao_produzirClick(Sender: TObject);
    procedure pnl_submenu_estoques_botao_consultaClick(Sender: TObject);
    procedure pnl_submenu_estoques_botao_producaoClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure pnl_botao_utilitariosClick(Sender: TObject);
    procedure pnl_submenu_utilitarios_botao_notificacoesClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure img_submenu_cadastros_botao_prestadoresClick(Sender: TObject);
    procedure lbl_submenu_finaceiro_botao_auxiliaresClick(Sender: TObject);
    procedure pnl_CadAuxiliares_FormasPgtoClick(Sender: TObject);
    procedure pnl_sub_menu_producao_telasClick(Sender: TObject);
    procedure pnl_submenu_finaceiro_recibosClick(Sender: TObject);
    procedure FormasPagamento2Click(Sender: TObject);
    procedure ContasBancrias1Click(Sender: TObject);
    procedure EntradadeDinheiro1Click(Sender: TObject);
    procedure SaidadeDinheiro1Click(Sender: TObject);
    procedure MovimentaodoCaixaDinheiro1Click(Sender: TObject);
    procedure Correntistas1Click(Sender: TObject);
    procedure ControleChequeCliente1Click(Sender: TObject);
    procedure CadastrodeOperadorasdeCartodeCrdito1Click(Sender: TObject);
    procedure CadastrodeBandeirasdeCartodeCrdito1Click(Sender: TObject);
    procedure CadastrodeMquinasdeCartodeCrdito1Click(Sender: TObject);
    procedure CadastrodeTaxasdeOperadoras1Click(Sender: TObject);
    procedure CadastrodeFORMASPAGTOdeCartodeCrdito1Click(Sender: TObject);
    procedure VendasComCartodeCrdito1Click(Sender: TObject);
    procedure RecibodePagamento1Click(Sender: TObject);
    procedure PixRecebidos1Click(Sender: TObject);
    procedure FormasPagamento1Click(Sender: TObject);
    procedure RecibodePagamentodeContas1Click(Sender: TObject);
    procedure PixEnviados1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure lbl_tituloDblClick(Sender: TObject);
    procedure GerarCortes1Click(Sender: TObject);
    procedure N7Click(Sender: TObject);


  private
    Fcnpj: string;
    procedure prc_componentes;
    procedure prc_EscondeMenus;
    procedure prc_esconde_sub_menus;
    procedure prc_executar_button1;
    procedure prc_abrir_menu_produtos_categoria;
    { Private declarations }
  public
    { Public declarations }
    procedure prc_controla_menu(Ativar : boolean);
    property cnpj : string read Fcnpj write Fcnpj;
  end;

var
  form_principal: Tform_principal;

  // controla se o sistema foi aberto,
  // pra não ficar mostrando a janela de notificações
  // sempre que voltar pro menu principal
  var_abertura_do_sistema : boolean;
implementation


{$R *.dfm}

uses unit_funcoes,unit_fundo_esmaecer, ufrmVendedores,ufrmClientes,ufrmPedidos,
     ufrmUsuarios, ufrmEmpresa, ufrmTransportadoras, ufrmFornecedores,
     ufrmContasPagar, ufrmContasReceber,
     ufrmPessoas, uBiblioteca, Winapi.ShellAPI, udmConn, FireDAC.Comp.Client,
     Classe.Conexao, ufrmCompras, ufrmEstoquesMovimentacao, ufrmPedidosBaixa,
     ufrmConfiguracoesSistema, ufrmConfiguracaoServidor, ufrmEstoquesProducao,
     ufrmNotificacoes, unit_controle_estoques, ufrmPrestadoresServicos,
     ufrmFormaPagto, ufrmProducaoTelas, ufrmBancos,
     ufrmContasBancarias, ufrmDinheiroEntrada, ufrmDinheiroSaida,
     ufrmDinheiroMovimentacao, ufrmCorrentistas, ufrmChequesClientes,
     ufrmCartaoOperadoras, ufrmCartaoBandeiras, ufrmCartaoMaquinas, ufrmCartaoTaxas,
     ufrmCartaoFormasPagto, ufrmCartaoVendas, ufrmPixRecebidos,
     ufrmRecibosFornecedores, ufrmPixEnviados;

procedure Tform_principal.ApplicationEventsModalEnd(Sender: TObject);
begin
 // form_fundo_esmaecer.Hide;
end;

procedure Tform_principal.Button1Click(Sender: TObject);
var
  loqry, q1 : TFDQuery;
begin

  try
    loqry := TFDQuery.Create(application);
    loqry.Connection := dmConn.FDConnection;
    q1 := TFDQuery.Create(application);
    q1.Connection := dmConn.FDConnection;
    q1.SQL.Add('update pedidos_itens_laje set nivel =:tipo where ID = :ID');

    loqry.SQL.Add('select i.id, i.produto_id, p.viga, p.lajota, p.isopor from pedidos_itens_laje i, produtos p where p.id = i.produto_id order by I.id');
    loqry.Open;
    loqry.First;
    while not loqry.eof do
    begin
      if loqry.FieldByName('VIGA').AsString = 'S' then
      begin
        Q1.ParamByName('TIPO').AsString := 'VIGA';
        Q1.ParamByName('id').AsInteger := loqry.FieldByName('id').AsInteger;
        q1.ExecSQL;
      end else
      if loqry.FieldByName('LAJOTA').AsString = 'S' then
      begin
        Q1.ParamByName('TIPO').AsString := 'LAJOTA';
        Q1.ParamByName('id').AsInteger := loqry.FieldByName('id').AsInteger;
        q1.ExecSQL;
      end else
      if loqry.FieldByName('ISOPOR').AsString = 'S' then
      begin
        Q1.ParamByName('TIPO').AsString := 'EPS';
        Q1.ParamByName('id').AsInteger := loqry.FieldByName('id').AsInteger;
        q1.ExecSQL;
      end;


      loqry.Next;
    end;

    ShowMessage('banco atualizado com sucesso!')

  finally
    freeandnil(loqry);
    freeandnil(Q1);
  end;
end;

procedure Tform_principal.prc_abrir_menu_produtos_categoria;
begin
  try
  if frmCategorias = nil then
     frmCategorias := TfrmCategorias.create(Application);
     frmCategorias.Left := 185;
     frmCategorias.top := 150;
     frmCategorias.Show;

  finally
    //FreeAndNil(frmCategorias);
  end;
end;

procedure Tform_principal.CadastrodeBandeirasdeCartodeCrdito1Click(
  Sender: TObject);
begin
  ufrmCartaoBandeiras.prc_executa;
end;

procedure Tform_principal.CadastrodeFORMASPAGTOdeCartodeCrdito1Click(
  Sender: TObject);
begin
  ufrmCartaoFormasPagto.prc_executa;
end;

procedure Tform_principal.CadastrodeMquinasdeCartodeCrdito1Click(
  Sender: TObject);
begin
  ufrmCartaoMaquinas.prc_executa;
end;

procedure Tform_principal.CadastrodeOperadorasdeCartodeCrdito1Click(
  Sender: TObject);
begin
  ufrmCartaoOperadoras.prc_executa;
end;

procedure Tform_principal.CadastrodeTaxasdeOperadoras1Click(Sender: TObject);
begin
  ufrmCartaoTaxas.prc_executa;
end;

procedure Tform_principal.ContasBancrias1Click(Sender: TObject);
begin
  ufrmContasBancarias.prc_executa;
end;

procedure Tform_principal.ControleChequeCliente1Click(Sender: TObject);
begin
  try
    if frmChequesClientes = nil then
      frmChequesClientes := TfrmChequesClientes.Create(application);

    frmChequesClientes.ShowModal;
  finally
    FreeAndNil(frmChequesClientes);
  end;
end;

procedure Tform_principal.Correntistas1Click(Sender: TObject);
begin
  try
    if frmCorrentistas = nil then
      frmCorrentistas := TfrmCorrentistas.Create(application);

    frmCorrentistas.ShowModal;
  finally
    FreeAndNil(frmCorrentistas);
  end;

end;

procedure Tform_principal.EntradadeDinheiro1Click(Sender: TObject);
begin
  try
    if frmDinheiroEntrada = nil then
      frmDinheiroEntrada := TfrmDinheiroEntrada.Create(application);

    frmDinheiroEntrada.ShowModal;
  finally
    FreeAndNil(frmDinheiroEntrada);
  end;
end;

procedure Tform_principal.FormActivate(Sender: TObject);
begin
  // para não ficar verificando sempre que a janela estiver ativa
  // vou por uma variavel para controlar;
  if var_abertura_do_sistema then
    // verifica se tem algum ordem de compra em ABERTO cadastrada
    // no sistema
    if fnc_buscar_ordem_compra_por_status('A') then
    begin
      if frmNotificacoes = nil then
      begin
        try
          frmNotificacoes := TfrmNotificacoes.Create( application );
          frmNotificacoes.ShowModal;
        finally
          var_abertura_do_sistema := false;
          FreeAndNil( frmNotificacoes );
        end;
      end;
    end;
end;

procedure Tform_principal.FormasPagamento1Click(Sender: TObject);
begin
  ufrmformapagto.executa;
end;

procedure Tform_principal.FormasPagamento2Click(Sender: TObject);
begin
   ufrmBancos.prc_executa;
end;

procedure Tform_principal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(frmCategorias);
  //liberando o form da memoria
  FreeandNil ( form_principal );

  //Encerrando a Aplicação
  Application.Terminate;
end;



procedure Tform_principal.FormCreate(Sender: TObject);
var
  loQry : TFDQuery;
  //senha_vitalicia, ano, mes : integer;
  //cnpj,
  senha_vitalicia: string;


begin

  var_abertura_do_sistema := true;

  // configura componentes
  prc_componentes;

  // atualizar tabelas no banco de dados
  unit_atualizacao_banco_de_dados.prc_atualizar_tabelas( mm_atualicao_banco ) ;

  //Ativando o Memory Leak (Vazamento de memoria)
  ReportMemoryLeaksOnShutdown := True;

  // libera o sistema pra uso vitalicio, caso eu autorizar com a senha ( J@cel1@_Autor1@u )
  // obs. pssivel alterar a senha, na tela de confiurações do sistema
  try
    loQry := TFDQuery.Create(application);
    loqry.Connection := dmConn.FDConnection;

    {senha vitalicia cadastrada no banco de dados}
    loqry.SQL.Clear;
    loqry.SQL.Add('select geral_liberar_sistema from configuracoes_sistema');
    loqry.Open;
    senha_vitalicia := loQry.FieldByName('geral_liberar_sistema').AsString;

    {cnpj da empresa}
    loqry.SQL.Clear;
    loqry.SQL.Add('select p.cpf_cnpj from pessoas p, empresa e where p.id = e.pessoa_id');
    loqry.Open;
    cnpj := loQry.FieldByName('cpf_cnpj').AsString;
    lbl_titulo.Caption := lbl_titulo.Caption + ' - Liberado para CNPJ :' + cnpj;
    // Jocelio
    if cnpj = '10562976892' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '10562976892'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else
    // triunfo
    if cnpj = '17936070000159' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '17936070000159'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else
    // lajes pinhal
    if cnpj = '18341642000110' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '18341642000110'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else
    // bombaserv
    if cnpj = '54517171000111' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '54517171000111'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else
    // veredas
    if cnpj = '09522481000170' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '09522481000170'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else
    // KEMEL - DANIEL
    if cnpj = '14891635000130' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '14891635000130'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else
    // LAJES CAMPO GRANDE
   (* if cnpj = '15369278000108' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '15369278000108'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else
    // LAJES FERRARI INSTALADO EM 28/01/2025
    if cnpj = '54246590000166' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '54246590000166'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end
    else  *)
    // TELAS VEREDAS INSTALADO EM 10/02/2025
    if cnpj = '59047583000159' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '59047583000159'+'J@cel1@_Autor1z@u' then
      begin
        prc_validar_sistema(memo_seguranca);
      end;
    end else
    // LAJES PAIVA INSTALADO EM 10/06/2025
    if cnpj = '46077049000143' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '46077049000143'+'J@cel1@_Autor1z@u' then
      begin

        prc_validar_sistema(memo_seguranca);
      end;
    end else
    // LAJES PIOLI INSTALA EM 23/01/2026
    if cnpj = '03458888000107' then
    begin
      senha_vitalicia := cnpj + criptografia(senha_vitalicia);
      if senha_vitalicia <> '03458888000107'+'J@cel1@_Autor1z@u' then
      begin

        prc_validar_sistema(memo_seguranca);
      end;
    end else
    begin
      CriarMensagem('AVISO','CÓPIA NÃO AUTORIZADA PARA ESTA EMPRESA!');
      application.Terminate;
    end;



  finally
    loqry.Close;
    FreeAndNil( loQry );
  end;
end;

procedure Tform_principal.FormShow(Sender: TObject);
var
  versao_app_banco : integer;

begin
  {configura o tamanho do memo_segurança de
  maneira que ele consiga mostrar os dados do arquivo winmaker em duas linhas
  importante esta configuração estar antes da verificação do sistema }
  memo_seguranca.Height  := 90;
  memo_seguranca.Width   := 500;
  memo_seguranca.Visible := FALSE;


  {*** ATUALIZAÇÃO DO SISTEMA NAS MÁQUINAS DA REDE ***}

  {
  Busca a versão do sistema gravada no banco de dados na tabela VERSAO_APP e o
  valor guarda na variável versao_app_banco. este valor é o mesmo do executavél que
  esta rodando no servidor. se as máquinas clientes estiverem com uma versão
  inferior, o aplicativo atualizador do sistema (esta com nome de project1) que
  esta instalado junto com o executável nas máquinas
  cliente é chamado pra atualizar o sistema. Portanto sempre que quiser atualizar
  o sistema, terá que seguir os seguintes passos:
  1. abrir o dmConn e atualizar a constante versao_app ex. se tiver 113 passar pra 114
  2. atualizar o campo VERSAO da tabela VERSAO_APP no banco de dados do servidor
  com o mesmo valor que esta na nova versão do aplicativo}

  {busca a ultima versão do app no banco de dados(tabela VERSAO_APP) }
  versao_app_banco := uBiblioteca.Sistema.versaoAtual;
  lbl_versao.Caption := 'Versão do executável no banco : ' + inttostr(versao_app_banco) +
                        ' - Versão do executavél na máquina : ' + inttostr(udmConn.versao_app);

  {versao_app = "valor da const declarada em uDmConn"}
  if udmConn.versao_app < versao_app_banco then
  begin

    CriarMensagem('AVISO','Existe uma nova versão do sistema disponivel no servidor...' + sLineBreak +
    'por favor aguarde ...');

    {Derruba a aplicação syslajes}
    Application.Terminate;

    if cnpj ='17936070000159' then
    begin
      {chama o atualizador, após atualizar sobe a aplicação syslajes novamente}
      ShellExecute( Handle,'open', 'project1.exe', nil, 'C:\lajes triunfo', SW_SHOWNORMAL );
    end else
    begin
      {chama o atualizador, após atualizar sobe a aplicação syslajes novamente}
      ShellExecute( Handle,'open', 'project1.exe', nil, 'C:\SYSLAJES', SW_SHOWNORMAL );
    end;
    {*** FINAL DA ATUALIZAÇÃO DO SISTEMA NAS MÁQUINAS DA REDE ***}


    (* exemplo de atualização no banco de dados
    loQry :=  TFDQuery.Create(self);

    loqry.Connection := dmConn.FDConnection;
    loqry.SQL.Add('select * from banco_versao');
    loqry.Open;
    ShowMessage(loqry.SQL.Text);
    script := loqry.FieldByName('script').AsString;
    ShowMessage(script);
    loqry.SQL.Clear;
    loqry.SQL.Add(script);
    loqry.ExecSQL;
    *)



  end;


    // jocelio depois excluir essa procedure
    prc_executar_button1;

end;

procedure Tform_principal.GerarCortes1Click(Sender: TObject);
begin
  try
  if frmCortes = nil then
     frmCortes := TfrmCortes.create(Application);

  frmCortes.ShowModal;

  finally
    FreeAndNil(frmcortes);
  end;
end;

procedure Tform_principal.img_botao_sairClick(Sender: TObject);
begin
  //fecha o form principal
  form_principal.Close;
end;

procedure Tform_principal.img_submenu_cadastros_botao_prestadoresClick(
  Sender: TObject);
begin
  try
    if frmPrestadoresServicos = nil  then
      frmPrestadoresServicos := TfrmPrestadoresServicos.Create(application);
    frmPrestadoresServicos.ShowModal;
  finally
    freeandnil(frmPrestadoresServicos);
  end;

end;

procedure Tform_principal.lbl_botao_comprasClick(Sender: TObject);
begin

  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu Tabelas
  pnl_submenu_compras.Visible := True;
  pnl_submenu_compras.Top     :=  pnl_botao_compras.Top;
  pnl_submenu_compras.Left    := 0;
end;

procedure Tform_principal.lbl_submenu_finaceiro_botao_auxiliaresClick(
  Sender: TObject);
begin
  pnl_sub_menu_Cadauxiliares.Visible := True;
  pnl_sub_menu_Cadauxiliares.Top     := pnl_submenu_financeiro.Top;

  pnl_sub_menu_Cadauxiliares.Left    := pnl_submenu_financeiro.Left + pnl_submenu_financeiro.Width;
end;

procedure Tform_principal.lbl_tituloDblClick(Sender: TObject);
begin
  Button1.Visible := true;
end;

procedure Tform_principal.prc_executar_button1;
var
  qry : TFDQuery;
begin
// verifica se a tabela pedido_itens_laje esta atualizada
// conforme código do Button1
  qry := TFDQuery.Create(nil);
  qry.Connection := dmConn.FDConnection;
  qry.SQL.Add('select * from pedidos_itens_laje where nivel = :nivel');
  qry.ParamByName('nivel').AsString := '';
  qry.Active := true;

  if qry.RecordCount > 0 then Button1.Click;

  qry.Active := false;
  FreeAndNil(qry);


end;

procedure Tform_principal.mm_atualicao_bancoDblClick(Sender: TObject);
begin
  mm_atualicao_banco.Visible := false;
end;

procedure Tform_principal.MovimentaodoCaixaDinheiro1Click(Sender: TObject);
begin
  try
    if frmDinheiroMovimentacao = nil  then
      frmDinheiroMovimentacao := TfrmDinheiroMovimentacao.Create(application);
    frmDinheiroMovimentacao.ShowModal;
  finally
    freeandnil(frmDinheiroMovimentacao);
  end;

end;

procedure Tform_principal.N7Click(Sender: TObject);
begin
  try
    if frmPedidosBaixa = nil  then
      frmPequisa_vigas_vendidas := TfrmPequisa_vigas_vendidas.Create(application);
    frmPequisa_vigas_vendidas.ShowModal;
  finally
    freeandnil(frmPequisa_vigas_vendidas);
  end;
end;

procedure Tform_principal.Panel1Click(Sender: TObject);
begin
  try
    if frmPedidosBaixa = nil  then
      frmPedidosBaixa := TfrmPedidosBaixa.Create(application);
    frmPedidosBaixa.ShowModal;
  finally
    freeandnil(frmPedidosBaixa);
  end;

end;

procedure Tform_principal.PixEnviados1Click(Sender: TObject);
begin
  try
    if frmPixEnviados = nil then
      frmPixEnviados := TfrmPixEnviados.Create(application);
    frmPixEnviados.ShowModal;
  finally
    freeandnil(frmPixEnviados);
  end;

end;

procedure Tform_principal.PixRecebidos1Click(Sender: TObject);
begin
  try
    if frmPixRecebidos = nil then
      frmPixRecebidos := TfrmPixRecebidos.Create(application);
    frmPixRecebidos.ShowModal;
  finally
    freeandnil(frmPixRecebidos);
  end;
end;

procedure Tform_principal.pnl_botao_estoquesClick(Sender: TObject);
begin

  //Funcao que esconde um SubMenu caso esteja aberto
  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu COnfigurações
  pnl_submenu_estoques.Visible := True;
  pnl_submenu_estoques.Top     :=  pnl_botao_estoques.Top;
  pnl_submenu_estoques.Left    := 0;
end;

procedure Tform_principal.pnl_botao_notasMouseEnter(Sender: TObject);
begin
  //expande o menu lateral
  pnl_menulateral.Width := 185;

  if ( Sender is TPanel ) then
    MudarBotao ( form_principal, ( Sender AS TPanel ) )
  else
  if ( Sender is TLabel ) then
    MudarBotao ( form_principal, ( ( Sender AS TLabel ).Parent As TPanel ) )
  else
  if ( Sender is TImage ) then
    MudarBotao ( form_principal, ( ( Sender AS TImage ).Parent As TPanel ) );

 // prc_esconde_sub_menus;
end;

procedure Tform_principal.pnl_botao_pessoasClick(Sender: TObject);
begin

  //Funcao que esconde um SubMenu caso esteja aberto
  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu COnfigurações
  pnl_submenu_pessoas.Visible := True;
  pnl_submenu_pessoas.Top     :=  pnl_botao_pessoas.Top;
  pnl_submenu_pessoas.Left    := 0;

end;

procedure Tform_principal.pnl_botao_produtosClick(Sender: TObject);
begin

  //Funcao que esconde um SubMenu caso esteja aberto
  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu COnfigurações
  {
  pnl_submenu_produtos.Visible := True;
  pnl_submenu_produtos.Top :=  pnl_botao_produtos.Top;
  pnl_submenu_produtos.Left:= 0;
  }
  prc_abrir_menu_produtos_categoria;

end;

procedure Tform_principal.pnl_botao_sistemaClick(Sender: TObject);
begin

  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu Tabelas
  pnl_submenu_sistema.Visible := True;
  pnl_submenu_sistema.Top     :=  pnl_botao_sistema.Top;
  pnl_submenu_sistema.Left    := 0;

end;

procedure Tform_principal.pnl_botao_utilitariosClick(Sender: TObject);
begin
  //Funcao que esconde um SubMenu caso esteja aberto
  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu COnfigurações
  pnl_submenu_utilitarios.Visible := True;
  pnl_submenu_utilitarios.Top     :=  pnl_botao_utilitarios.Top;
  pnl_submenu_utilitarios.Left    := 0;

end;

procedure Tform_principal.pnl_CadAuxiliares_FormasPgtoClick(Sender: TObject);

begin
  ufrmformapagto.executa;
end;

procedure Tform_principal.pnl_botao_financeiroClick(Sender: TObject);
begin

  //Funcao que esconde um SubMenu caso esteja aberto
  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu Tabelas
  pnl_submenu_financeiro.Visible := True;
  //pnl_submenu_financeiro.Top     :=  pnl_botao_financeiro.Top;
  pnl_submenu_financeiro.Top     :=  pnl_botao_pessoas.Top;
  pnl_submenu_financeiro.Left    := 0;

end;

procedure Tform_principal.pnl_botao_faturamentoClick(Sender: TObject);
begin

  //Funcao que esconde um SubMenu caso esteja aberto
  prc_EscondeMenus;

  //Posicionando e mostrando o SubMenu Tabelas
  pnl_submenu_faturamento.Visible := True;
  pnl_submenu_faturamento.Top     :=  pnl_botao_faturamento.Top;
  pnl_submenu_faturamento.Left    := 0;

end;

procedure Tform_principal.pnl_PrincipalMouseEnter(Sender: TObject);
begin

  //retrai o menu lateral e esconde os submenus
  pnl_menulateral.Width := 50;

  prc_EscondeMenus;

end;

procedure Tform_principal.pnl_menulateralMouseEnter(Sender: TObject);
begin
  //expande o menu lateral
  pnl_menulateral.Width := 185;
end;

procedure Tform_principal.pnl_submenu_cadastros_botao_clientesClick(
  Sender: TObject);
begin
  ufrmClientes.executa;
end;

procedure Tform_principal.pnl_submenu_cadastros_botao_empresaClick(
  Sender: TObject);
begin
  ufrmEmpresa.executa;
end;

procedure Tform_principal.pnl_submenu_cadastros_botao_fornecedoresClick(
  Sender: TObject);
begin
  if frmFornecedores = nil then
  begin

    frmFornecedores := TfrmFornecedores.Create(Application);
    form_principal.prc_controla_menu(false);

    frmFornecedores.top    :=  form_principal.pnl_Principal.Top;
    frmFornecedores.Left   := form_principal.pnl_menulateral.Width;

    frmFornecedores.Width  := form_principal.pnl_principal.Width;
    frmFornecedores.Height := form_principal.pnl_principal.Height;

  end;

  frmFornecedores.ShowModal;

  form_principal.prc_controla_menu(true);
end;

procedure Tform_principal.pnl_submenu_cadastros_botao_pessoasClick(
  Sender: TObject);
begin
  ufrmPessoas.prc_executa;
end;

procedure Tform_principal.pnl_submenu_cadastros_botao_transportadorasClick(
  Sender: TObject);
begin
  ufrmTransportadoras.executa;
end;

procedure Tform_principal.pnl_submenu_cadastros_botao_usuarioClick(
  Sender: TObject);
begin

  ufrmUsuarios.prc_executa;
end;

procedure Tform_principal.pnl_submenu_cadastros_botao_vendedoresClick(
  Sender: TObject);
begin
  ufrmVendedores.executa;
end;

procedure Tform_principal.pnl_submenu_estoques_botao_produzirClick(
  Sender: TObject);
begin
  if frmEstoquesProducao = nil then
  begin
    frmEstoquesProducao := TfrmEstoquesProducao.Create(application);
    try
      frmEstoquesProducao.ShowModal;
    finally
      FreeAndNil(frmEstoquesProducao);
    end;
  end;
end;

procedure Tform_principal.pnl_submenu_estoques_botao_consultaClick(
  Sender: TObject);
begin
  if frmEstoquesConsulta = nil then
  begin
    frmEstoquesConsulta := TfrmEstoquesConsulta.Create(application);
    try
      frmEstoquesConsulta.ShowModal;
    finally
      FreeAndNil(frmEstoquesConsulta);
    end;
  end;
end;

procedure Tform_principal.pnl_submenu_estoques_botao_producaoClick(
  Sender: TObject);
begin
  try
    if frmProducoesVigas = nil then
      frmProducoesVigas := TfrmProducoesVigas.Create(application);
    frmProducoesVigas.ShowModal;
  finally
     FreeAndNil(frmProducoesVigas) ;
  end;
end;

procedure Tform_principal.pnl_submenu_faturamento_botao_comprasClick(
  Sender: TObject);
begin
  ufrmCompras.prc_executa;
end;

procedure Tform_principal.pnl_submenu_faturamento_botao_pedidosClick(
  Sender: TObject);
begin
  ufrmPedidos.executa;
end;

procedure Tform_principal.pnl_submenu_finaceiro_botao_apagarClick(
  Sender: TObject);
begin
   ufrmContasPagar.prc_executa;
end;

procedure Tform_principal.pnl_submenu_finaceiro_botao_areceberClick(
  Sender: TObject);
begin
  ufrmContasReceber.prc_executa;
end;

procedure Tform_principal.pnl_submenu_finaceiro_recibosClick(Sender: TObject);
begin
  try
    if frmRecibos = nil then
      frmRecibos := TfrmRecibos.Create(application);

    frmRecibos.ShowModal;
  finally
    freeandnil(frmRecibos);
  end;

end;

procedure Tform_principal.pnl_submenu_sistema_botao_servidorClick(
  Sender: TObject);
begin
  if frmConfiguracaoServidor = nil then
  begin
    frmConfiguracaoServidor := TfrmConfiguracaoServidor.Create(Application);
  end;

  frmConfiguracaoServidor.ShowModal;

end;

procedure Tform_principal.pnl_submenu_sistema_botao_sistemaClick(
  Sender: TObject);
begin
  ufrmConfiguracoesSistema.prc_executa;
  { executar prc_componentes, pode ser que o
   usuario alterou o logotipo da empresa}
  prc_componentes;
end;

procedure Tform_principal.pnl_submenu_utilitarios_botao_notificacoesClick(
  Sender: TObject);
begin
    if frmNotificacoes = nil then
    begin
      try
        frmNotificacoes := TfrmNotificacoes.Create( application );
        frmNotificacoes.ShowModal;
      finally
        FreeAndNil( frmNotificacoes );
      end;
    end;

end;

procedure Tform_principal.pnl_sub_menu_producao_telasClick(Sender: TObject);
begin
  try
    if frmProducaoTelas = nil then
      frmProducaoTelas := TfrmProducaoTelas.Create(application);

    frmProducaoTelas.ShowModal;
  finally
    freeandnil(frmProducaoTelas);
  end;
end;

procedure Tform_principal.prc_componentes;
var
  loqry : TFDQuery;
begin

  {ativa o memo atualização do banco de dados caso houver}
  mm_atualicao_banco.Height  := 400;
  mm_atualicao_banco.Align   := alClient;//alTop;
  mm_atualicao_banco.Visible := FALSE;

  //carrega o logo da empresa
  try
    loqry:= TFDQuery.Create(application);
    loqry.Connection := dmConn.FDConnection;
    loqry.SQL.Add('select IMG_LOGO from EMPRESA');
    loQry.Open;

    if not loqry.IsEmpty then
      img_logo_empresa.Picture.LoadFromFile(loqry.FieldByName('IMG_LOGO').AsString);

  finally
    loqry.close;
    freeandnil(loqry);
  end;

end;

procedure Tform_principal.prc_controla_menu( Ativar: boolean );
begin

  //retrai o menu lateral e esconde os submenus
  pnl_menulateral.Width := 50;
  prc_EscondeMenus;
  pnl_menulateral.Enabled := Ativar;
  pnl_topo.Enabled        := Ativar;

end;

procedure Tform_principal.prc_EscondeMenus;
begin
  //Funcao que esconde qualquer submenu que esteja aberto
  pnl_submenu_pessoas.Visible     := False;
  pnl_submenu_produtos.Visible    := False;
  if Assigned(frmCategorias) then frmCategorias.hide;
  pnl_submenu_faturamento.Visible := False;
  pnl_submenu_compras.Visible     := False;
  pnl_submenu_estoques.Visible    := False;
  pnl_submenu_financeiro.Visible  := False;
  pnl_submenu_sistema.Visible     := False;
  pnl_submenu_utilitarios.Visible := False;

  prc_esconde_sub_menus;

end;

procedure Tform_principal.prc_esconde_sub_menus;
begin

  pnl_sub_menu_cadAuxiliares.Visible := False;

end;

procedure Tform_principal.RecibodePagamento1Click(Sender: TObject);
begin
    try
    if frmRecibos = nil then
      frmRecibos := TfrmRecibos.Create(application);

    frmRecibos.ShowModal;
  finally
    FreeAndNil(frmRecibos);
  end;
end;

procedure Tform_principal.RecibodePagamentodeContas1Click(Sender: TObject);
begin
    try
    if frmRecibosFornecedores = nil then
      frmRecibosFornecedores := TfrmRecibosFornecedores.Create(application);

    frmRecibosFornecedores.ShowModal;
  finally
    FreeAndNil(frmRecibosFornecedores);
  end;
end;

procedure Tform_principal.SaidadeDinheiro1Click(Sender: TObject);
begin
  try
    if frmDinheiroSaida = nil then
      frmDinheiroSaida := TfrmDinheiroSaida.Create(application);

    frmDinheiroSaida.ShowModal;
  finally
    FreeAndNil(frmDinheiroSaida);
  end;

end;

procedure Tform_principal.VendasComCartodeCrdito1Click(Sender: TObject);
begin
  ufrmCartaoVendas.prc_executa;
end;

end.
