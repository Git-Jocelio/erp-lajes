//****************************************************************************//
//  Emissao e manutenção de um pedido
//  Programador : Jocélio Gomes da Silva
//  inicio : 16/02/2021
//  fim :
//
//  DEUS seja louvado!
//
//****************************************************************************//
// Histórico de desenvolvimento
// 16/02/21 iniciei fiz a chamada dos formPedidos e PedidosE,
// vou dar uma pausa pra criar a tabela de pedidos, mas agora que percebi que
// não criei o cadastro de vigas que alias é um dos cadastros mais complexos :/
// volto depois aqui...
// vou recapitular na minha cabeça como criar... até...
// 16/03/21 ufa! voltei rsss
// criei o cadastro de vigas deu trabalho, acredito que há ainda que melhorar,
// ficou algumas coisas pra tras tipo recalcular os custos das vigas... mas
// ficar pra depois, preciso dar continuidade no pedido ai da pra perceber o
// que faltou no cadastro de vigas
// 27/04/21 pedido bem adiantada... cabeca do pedido
// 12/0521 Terminei o pedido ate o ponto de incluir alterar e excluir itens e adiconais h8...
// prox passo implementar a h12...
unit ufrmPedidosE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  Vcl.ComCtrls, Vcl.WinXPickers, Datasnap.DBClient, uFinanceiro, Vcl.Menus,
  FireDAC.Stan.StorageBin, udmConn, ufrmMensagens, ufrmPedidosAddVigas,
  ufrmPessoasE, ufrmComissoesE, ufrmComissoesDespesaE, midas, ufrmVendedoresE,
  ufrmPesquisaFormaPagamento, ufrmContasReceber_Baixa, unit_movimenta_estoques,
  ufrmRecibosE;

type
  TfrmPedidosE = class(TfrmBaseEdicao)
    pcVenda: TPageControl;
    tbVenda: TTabSheet;
    qryID: TIntegerField;
    qryENTRADA_SAIDA: TStringField;
    qrySERIE: TSmallintField;
    qryCHAVE_ACESSO: TStringField;
    qryPROTOCOLO_AUTORIZACAO: TStringField;
    qryNAT_OPERACAO: TStringField;
    qryDATA_EMISSAO: TDateField;
    qryDATA_ENTRADA_SAIDA: TDateField;
    qryHORA_ENTRADA_SAIDA: TTimeField;
    qryDATA_CONTABIL: TDateField;
    qryORCAMENTO: TStringField;
    qrySITUACAO: TStringField;
    qryFORMA_PAGTO_ID: TSmallintField;
    qryCLIENTE_ID: TIntegerField;
    qryVENDEDOR_ID: TIntegerField;
    qryVALOR_PRODUTOS: TCurrencyField;
    qryFRETE_CLIENTE: TCurrencyField;
    qryFRETE_EMITENTE: TCurrencyField;
    qryDESCRICAO_ACRESCIMO: TStringField;
    qryACRESCIMO: TCurrencyField;
    qryDESCONTO: TCurrencyField;
    qryBASE_ICMS: TCurrencyField;
    qryVALOR_ICMS: TCurrencyField;
    qryBASE_ICMS_ST: TCurrencyField;
    qryVALOR_ICMS_ST: TCurrencyField;
    qryVALOR_SEGURO: TCurrencyField;
    qryVALOR_IPI: TCurrencyField;
    qryVALOR_TOTAL_PEDIDO: TCurrencyField;
    qryTRANSPORTADORA_ID: TIntegerField;
    qryFRETE_POR_CONTA: TIntegerField;
    qryPRODUTOS_QTDE: TCurrencyField;
    qryESPECIE: TStringField;
    qryMARCA: TStringField;
    qryNUMERACAO: TStringField;
    qryPESO_BRUTO: TStringField;
    qryPESO_LIQUIDO: TStringField;
    qryVALOR_PAGO: TCurrencyField;
    qryPAGO: TStringField;
    qryOBS_ADM: TStringField;
    qryOBS_ENTREGA: TStringField;
    qryDATA_ENTREGA: TDateField;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label10: TLabel;
    qryDATA_ALTERACAO: TDateField;
    DBText1: TDBText;
    dtpDataContabil: TDateTimePicker;
    Bevel1: TBevel;
    qryClientes: TFDQuery;
    dsCliente: TDataSource;
    dsVendedores: TDataSource;
    qryVendedores: TFDQuery;
    tbDestinatario: TTabSheet;
    pcCliente: TPageControl;
    tbCliente: TTabSheet;
    tbs_local_entrega: TTabSheet;
    Label11: TLabel;
    DBEdit2: TDBEdit;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Label13: TLabel;
    DBEdit4: TDBEdit;
    Label14: TLabel;
    DBEdit5: TDBEdit;
    Label15: TLabel;
    DBEdit6: TDBEdit;
    Label16: TLabel;
    DBEdit7: TDBEdit;
    Label17: TLabel;
    DBEdit11: TDBEdit;
    Label18: TLabel;
    DBEdit12: TDBEdit;
    dsLocalEntrega: TDataSource;
    qryLocalEntrega: TFDQuery;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    dsFormaPagto: TDataSource;
    qryFormaPagto: TFDQuery;
    pgc_principal: TPageControl;
    tbs_itens_pedido: TTabSheet;
    tbs_itens_laje: TTabSheet;
    tbsFrete: TTabSheet;
    tbsImpostos: TTabSheet;
    tbs_contas_receber: TTabSheet;
    tbs_contas_pagar: TTabSheet;
    GroupBox3: TGroupBox;
    Label33: TLabel;
    cbxTransportadoras: TDBLookupComboBox;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    TabSheet6: TTabSheet;
    pcObs: TPageControl;
    tbObsAdm: TTabSheet;
    tbObsEntrega: TTabSheet;
    gbImpostos: TGroupBox;
    Label29: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    dsPedidoItens: TDataSource;
    qryTransportadoras: TFDQuery;
    dsTransportadoras: TDataSource;
    pnl_topo: TPanel;
    gbx_cliente: TGroupBox;
    btnBuscaCliente: TBitBtn;
    btnNovoCliente: TBitBtn;
    gbx_vendedor: TGroupBox;
    cbxVendedores: TDBLookupComboBox;
    GroupBox2: TGroupBox;
    dtpDataEntrega: TDateTimePicker;
    Label4: TLabel;
    qryPedidoItens: TFDQuery;
    qryGravaPedidoItens: TFDQuery;
    dsItensLaje: TDataSource;
    qryGravaItensLaje: TFDQuery;
    qryAux: TFDQuery;
    pnPedidoItens: TPanel;
    dbg_itens_venda: TDBGrid;
    qryGravaFerragens: TFDQuery;
    dbg_contas_pagar: TDBGrid;
    dsContasReceber: TDataSource;
    qryFornecedor: TFDQuery;
    dsFornecedores: TDataSource;
    qryBombas: TFDQuery;
    dsBomba: TDataSource;
    qryContasReceber: TFDQuery;
    dsPrestadorServico: TDataSource;
    qryPrestadorServico: TFDQuery;
    ds_recibos: TDataSource;
    pmCRUItensLaje: TPopupMenu;
    pmIncluirViga: TMenuItem;
    pmExcluirViga: TMenuItem;
    pmAlterarViga: TMenuItem;
    pmIncluirLajota: TMenuItem;
    pmIncluirIsopor: TMenuItem;
    N1: TMenuItem;
    pmCRUItensPedido: TPopupMenu;
    pmIncluirItemPedido: TMenuItem;
    pmAlterarItemPedido: TMenuItem;
    pmExcluirItemPedido: TMenuItem;
    N2: TMenuItem;
    pmIncluirReforcoAdicional: TMenuItem;
    tbs_ferragens: TTabSheet;
    dbg_Ferragens: TDBGrid;
    dsPedidoFerragens: TDataSource;
    pmCRUDFerragens: TPopupMenu;
    pmAlterarFerroNegativo: TMenuItem;
    pmExcluirFerroNegativo: TMenuItem;
    tbs_reforco_viga: TTabSheet;
    dbg_reforcos_das_vigas: TDBGrid;
    pmCRUDReforcoViga: TPopupMenu;
    pmAlterarReforcoAdicional: TMenuItem;
    dsReforcoVigas: TDataSource;
    ExcluirReforcoAdicional: TMenuItem;
    N3: TMenuItem;
    pmIncluirReforoAdicional: TMenuItem;
    GroupBox5: TGroupBox;
    Label103: TLabel;
    edTotVendaFerragem: TEdit;
    edTotCustoFerragem: TEdit;
    Label104: TLabel;
    GroupBox6: TGroupBox;
    Label105: TLabel;
    Label106: TLabel;
    edTotVendaRerforco: TEdit;
    edTotCustoRerforco: TEdit;
    pmIncluirFerroNegativo: TMenuItem;
    Label107: TLabel;
    qryNOSSO_NUMERO: TStringField;
    qryTotalLaje: TFDQuery;
    pnl_itens_laje: TPanel;
    dbg_itens_laje: TDBGrid;
    gbResumoLajeH8: TGroupBox;
    Label6: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    edVigasH8Info: TEdit;
    edQtdeVigasH8: TEdit;
    edMetrosLinearesH8: TEdit;
    edMetrosQuadradosH8: TEdit;
    edQtdeLajotasH8: TEdit;
    edQtdeIsoporH8: TEdit;
    Label1: TLabel;
    tbs_comissao_triunfo: TTabSheet;
    dsComissao_itens: TDataSource;
    qryComissao_itens: TFDQuery;
    qryComissao_itensID: TIntegerField;
    qryComissao_itensPEDIDO_ID: TIntegerField;
    qryComissao_itensPRODUTO_ID: TIntegerField;
    qryComissao_itensNOME_FANTASIA: TStringField;
    qryComissao_itensQUANTIDADE: TCurrencyField;
    qryComissao_itensCUSTO_FORN: TCurrencyField;
    qryComissao_itensCUSTO_VEND: TCurrencyField;
    qryComissao_itensPRECO_VENDA: TCurrencyField;
    qryComissao_itensDEBITO_CREDITO: TStringField;
    qryComissao_itensOBS: TStringField;
    N4: TMenuItem;
    pmLiberarLajotaIsopor: TMenuItem;
    btn_alterar_pessoa: TBitBtn;
    ds_comissao_despesas: TDataSource;
    qry_comissao_despesas: TFDQuery;
    qryComissoes: TFDQuery;
    pnl_comissao_totais: TPanel;
    Label32: TLabel;
    lbl_data_contabil: TLabel;
    Label65: TLabel;
    lbl_valor_venda: TLabel;
    Label66: TLabel;
    lbl_custo_pedido: TLabel;
    Label67: TLabel;
    lbl_taxa_adm: TLabel;
    Label73: TLabel;
    lbl_comissao_adm: TLabel;
    Label74: TLabel;
    lbl_margem: TLabel;
    Label75: TLabel;
    lbl_margem_vendedor: TLabel;
    Label76: TLabel;
    lbl_comissao_vendedor: TLabel;
    labelOutrasdespesas: TLabel;
    lbl_outras_despesas: TLabel;
    btn_alterar_obs: TSpeedButton;
    Label64: TLabel;
    mm_obs_comissao: TMemo;
    pgc_comissoes: TPageControl;
    tbs_comissoes: TTabSheet;
    tbs_comissoes_outros: TTabSheet;
    gbx_comissao_outros: TGroupBox;
    dbg_outras_despesas: TDBGrid;
    Panel1: TPanel;
    btn_incluir_lancamento: TSpeedButton;
    btn_excluir_lancamento: TSpeedButton;
    gbx_comissao_itens: TGroupBox;
    dbg_comissao_itens: TDBGrid;
    cdsFerragensDeletados: TFDMemTable;
    cdsFerragensDeletadosID: TIntegerField;
    cdsFerragensDeletadosPRODUTO: TIntegerField;
    cdsPedidoItensDeletados: TFDMemTable;
    cdsPedidoItensDeletadosID: TIntegerField;
    cdsPedidoItensDeletadosPRODUTO: TIntegerField;
    cdsItensLajeDeletados: TFDMemTable;
    cdsItensLajeDeletadosID: TIntegerField;
    cdsItensLajeDeletadosPRODUTO: TIntegerField;
    cdsItensLajeDeletadosQUANTIDADE: TIntegerField;
    cdsPedidoItensDeletadosQUANTIDADE: TFloatField;
    cdsFerragensDeletadosQUANTIDADE: TFloatField;
    cdsItensLaje: TFDMemTable;
    mtb_concreto_deletados: TFDMemTable;
    mtb_concreto_deletadosID: TIntegerField;
    cdsPedidoFerragens: TFDMemTable;
    cdsPedidoItens: TFDMemTable;
    gbx_financeiro: TGroupBox;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Label79: TLabel;
    Label9: TLabel;
    edt_nr_pedido: TPanel;
    edt_emissao: TPanel;
    edt_alteracao: TPanel;
    edt_nome: TEdit;
    edt_celular: TEdit;
    edt_telefone: TEdit;
    edt_cep: TEdit;
    edt_endereco: TEdit;
    edt_numero_entrega: TEdit;
    edt_bairro: TEdit;
    edt_cidade: TEdit;
    edt_uf: TEdit;
    mm_obs_adm: TMemo;
    mm_obs_entrega: TMemo;
    edt_qtde_volumes: TEdit;
    edt_especie: TEdit;
    edt_marca: TEdit;
    edt_numero_frete: TEdit;
    edt_peso_bruto: TEdit;
    edt_peso_liquido: TEdit;
    edt_base_icms: TEdit;
    edt_valor_icms: TEdit;
    edt_valor_icms_st: TEdit;
    edt_vlr_produtos: TEdit;
    edt_frete_cli: TEdit;
    edt_valor_seguro: TEdit;
    edt_valor_ipi: TEdit;
    edt_desc: TEdit;
    edt_acresc: TEdit;
    edt_vlr_total: TEdit;
    rg_frete: TRadioGroup;
    edt_transportadora_id: TPanel;
    cb_orcamento: TCheckBox;
    edt_valor_produtos: TPanel;
    edt_frete_cliente: TEdit;
    cbx_desc_acrescimo: TComboBox;
    edt_acrescimo: TEdit;
    edt_desconto: TEdit;
    edt_valor_total: TPanel;
    edt_valor_pago: TPanel;
    lbl_cliente_id: TLabel;
    lbl_cliente_nome: TLabel;
    lbl_vendedor_id: TPanel;
    lbl_situacao_pedido: TLabel;
    edt_complemento: TMemo;
    btn_incluir_vendedor: TBitBtn;
    qry_recibos: TFDQuery;
    pnl_forma_pagto: TPanel;
    btn_busca_forma_pagto: TSpeedButton;
    lbl_percentual_desconto: TLabel;
    Label55: TLabel;
    tbs_comissao_ferrari: TTabSheet;
    Panel2: TPanel;
    Label7: TLabel;
    lbl_data_contabil_ferrari: TLabel;
    Label56: TLabel;
    lbl_vr_pedido_ferrari: TLabel;
    Label58: TLabel;
    lbl_tx_comissao_real_ferrari: TLabel;
    Label83: TLabel;
    lbl_vr_pedido_com_desconto_ferrari: TLabel;
    Label85: TLabel;
    lbl_vr_comissao_liquido_ferrari: TLabel;
    Label87: TLabel;
    lbl_tx_comissao_vendedor_ferrari: TLabel;
    Label89: TLabel;
    lbl_vr_comissao_vendedor_ferrari: TLabel;
    Label91: TLabel;
    lbl_vr_outros_lancamentos_ferrari: TLabel;
    Label81: TLabel;
    lbl_vr_desconto_concedido_ferrari: TLabel;
    lbl_tx_desconto_concedido_ferrari: TLabel;
    Label94: TLabel;
    lbl_tx_comissao_abono_ferrari: TLabel;
    PageControl2: TPageControl;
    TabSheet1: TTabSheet;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    TabSheet2: TTabSheet;
    GroupBox4: TGroupBox;
    dbg_outras_despesas_ferrari: TDBGrid;
    Panel3: TPanel;
    btn_excluir_lancamento_ferrari: TSpeedButton;
    ds_contas_pagar: TDataSource;
    qry_contas_pagar: TFDQuery;
    qry_sistema: TFDQuery;
    gb_contas_receber: TGroupBox;
    dbg_contas_receber: TDBGrid;
    gb_recibos: TGroupBox;
    dgb_recibos: TDBGrid;
    gbReforcosVigas: TGroupBox;
    dbg_reforco_viga: TDBGrid;
    lbl_titulo_topo: TLabel;
    btn_fechar: TSpeedButton;
    cbx_situacao: TComboBox;
    tbs_financeiro: TTabSheet;
    pnl_financeiro: TPanel;
    Label51: TLabel;
    edt_financeiro_vr_produtos: TEdit;
    Label57: TLabel;
    edt_financeiro_frete_cliente: TEdit;
    Label80: TLabel;
    edt_financeiro_acrescimos: TEdit;
    Label82: TLabel;
    edt_financeiro_descontos: TEdit;
    Label84: TLabel;
    edt_financeiro_vr_venda: TEdit;
    Label86: TLabel;
    edt_financeiro_custos_produtos: TEdit;
    Label88: TLabel;
    edt_financeiro_frete_empresa: TEdit;
    Label90: TLabel;
    edt_financeiro_comissoes: TEdit;
    Label92: TLabel;
    edt_financeiro_cartao_credito: TEdit;
    Label93: TLabel;
    edt_financeiro_outras_despesas: TEdit;
    Label95: TLabel;
    edt_financeiro_total_custos: TEdit;
    Label96: TLabel;
    edt_financeiro_margem_contribuicao: TEdit;
    Label97: TLabel;
    Label98: TLabel;
    edt_financeiro_margem_percentual: TEdit;
    btn_recalcular_totais: TBitBtn;
    Label8: TLabel;
    Label31: TLabel;
    tbs_concreto: TTabSheet;
    pmCRUDConcreto: TPopupMenu;
    ds_fornecedor_concreto: TDataSource;
    qry_fornecedor_concreto: TFDQuery;
    ds_prestador_servico: TDataSource;
    qry_prestador_servico: TFDQuery;
    pgc_concreto_realizado: TPageControl;
    tbs_concreto_realizado: TTabSheet;
    tbs_bomba: TTabSheet;
    Label101: TLabel;
    cbx_prestador_servico: TDBLookupComboBox;
    Label100: TLabel;
    dtp_executacao_concreto: TDateTimePicker;
    Label102: TLabel;
    edt_resp_bombeamento: TEdit;
    Label99: TLabel;
    Label108: TLabel;
    dbg_concreto_utilizado: TDBGrid;
    cbx_fornecedor_concreto: TDBLookupComboBox;
    btn_incluir_concreto_utilizado: TButton;
    Button2: TButton;
    Label110: TLabel;
    cbx_bomba_contratada: TDBLookupComboBox;
    edt_preco_custo_bomba: TEdit;
    Label111: TLabel;
    Label112: TLabel;
    edt_qtde_bomba: TEdit;
    Label113: TLabel;
    edt_total_bomba: TEdit;
    mtb_concreto_utilizado: TFDMemTable;
    mtb_concreto_utilizadoID: TIntegerField;
    mtb_concreto_utilizadoID_ITEMPEDIDO: TIntegerField;
    mtb_concreto_utilizadoPRODUTO_ID: TIntegerField;
    mtb_concreto_utilizadoPEDIDO_ID: TIntegerField;
    mtb_concreto_utilizadoDESCRICAO: TStringField;
    mtb_concreto_utilizadoUNIDADE: TStringField;
    mtb_concreto_utilizadoQUANTIDADE: TFloatField;
    mtb_concreto_utilizadoPRECO_CUSTO: TFloatField;
    ds_concreto_realizado: TDataSource;
    lbl_excluir: TLabel;
    lbl_duplo_clique: TLabel;
    ds_tipo_bomba: TDataSource;
    qry_tipo_bomba: TFDQuery;
    lbl_obs_custo_laje: TLabel;
    edt_nosso_numero: TEdit;
    mtb_concreto_utilizadoTOTAL: TFloatField;
    mtb_concreto_utilizadoTOTAL_CONCRETO: TAggregateField;
    Label30: TLabel;
    DBText2: TDBText;
    lbl_comissao_vendedor_informada: TLabel;
    edt_comissao_vendedor_informada: TEdit;
    qryCOMISSAO_VENDEDOR_INFORMADA: TFMTBCDField;
    DBGrid3: TDBGrid;
    DataSource1: TDataSource;
    procedure btnNovoClienteClick(Sender: TObject);
    procedure btnBuscaClienteClick(Sender: TObject);

    procedure tbVendaShow(Sender: TObject);
    procedure tbClienteShow(Sender: TObject);
    procedure TabSheet6Show(Sender: TObject);
    procedure tbDestinatarioShow(Sender: TObject);
    procedure tbs_itens_pedidoShow(Sender: TObject);
    procedure cdsPedidoItensCalcFields(DataSet: TDataSet);
    procedure dsPedidoItensDataChange(Sender: TObject; Field: TField);
    procedure edFreteClienteExit(Sender: TObject);
    procedure dsItensLajeDataChange(Sender: TObject; Field: TField);

    procedure rgFreteClick(Sender: TObject);
    procedure pmIncluirVigaClick(Sender: TObject);
    procedure pmExcluirVigaClick(Sender: TObject);
    procedure pmAlterarVigaClick(Sender: TObject);
    procedure pmIncluirLajotaClick(Sender: TObject);
    procedure pmIncluirIsoporClick(Sender: TObject);
    procedure pmExcluirItemPedidoClick(Sender: TObject);
    procedure pmIncluirItemPedidoClick(Sender: TObject);
    procedure pmAlterarItemPedidoClick(Sender: TObject);
    procedure pmIncluirReforcoAdicionalClick(Sender: TObject);
    procedure pmIncluirFerroNegativoClick(Sender: TObject);
    procedure pmAlterarFerroNegativoClick(Sender: TObject);
    procedure pmExcluirFerroNegativoClick(Sender: TObject);
    procedure tbs_reforco_vigaShow(Sender: TObject);
    procedure ExcluirReforcoAdicionalClick(Sender: TObject);
    procedure pmAlterarReforcoAdicionalClick(Sender: TObject);
    procedure pmIncluirReforoAdicionalClick(Sender: TObject);
    procedure cdsPedidoFerragensNewRecord(DataSet: TDataSet);
    procedure tbs_ferragensShow(Sender: TObject);
    procedure tbs_itens_lajeShow(Sender: TObject);
    procedure dsPedidoFerragensDataChange(Sender: TObject; Field: TField);
    procedure dbg_comissao_itensDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure pmLiberarLajotaIsoporClick(Sender: TObject);
    procedure btn_alterar_pessoaClick(Sender: TObject);
    procedure btn_alterar_obsClick(Sender: TObject);
    procedure btn_incluir_lancamentoClick(Sender: TObject);
    procedure tbs_comissoesShow(Sender: TObject);


    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure edt_frete_clienteExit(Sender: TObject);
    procedure cbxVendedoresCloseUp(Sender: TObject);
    procedure cbxTransportadorasCloseUp(Sender: TObject);
    procedure rg_freteClick(Sender: TObject);
    procedure btn_excluir_lancamentoClick(Sender: TObject);
    procedure tbs_comissoes_outrosShow(Sender: TObject);
    procedure tbs_comissao_triunfoShow(Sender: TObject);
    procedure btn_incluir_vendedorClick(Sender: TObject);
    procedure dbg_outras_despesasDblClick(Sender: TObject);
    procedure ds_comissao_despesasDataChange(Sender: TObject; Field: TField);
    procedure btn_busca_forma_pagtoClick(Sender: TObject);
    procedure tbs_comissao_ferrariShow(Sender: TObject);
    procedure dbg_contas_receberDblClick(Sender: TObject);
    procedure tbs_recibosShow(Sender: TObject);
    procedure gbReforcosVigasMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure gbReforcosVigasMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure gbReforcosVigasMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_fecharClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure tbs_financeiroShow(Sender: TObject);
    procedure btn_recalcular_totaisClick(Sender: TObject);
    procedure edt_financeiro_frete_clienteExit(Sender: TObject);
    procedure edt_financeiro_frete_clienteKeyPress(Sender: TObject;
      var Key: Char);
    procedure btn_incluir_concreto_utilizadoClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dbg_concreto_utilizadoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbg_concreto_utilizadoDblClick(Sender: TObject);
    procedure ds_tipo_bombaDataChange(Sender: TObject; Field: TField);
    procedure edt_preco_custo_bombaExit(Sender: TObject);
    procedure edt_preco_custo_bombaKeyPress(Sender: TObject; var Key: Char);
    procedure tbs_concretoShow(Sender: TObject);
    procedure cb_orcamentoClick(Sender: TObject);
    procedure dgb_recibosDblClick(Sender: TObject);
    procedure edt_total_bombaExit(Sender: TObject);
    procedure edt_total_bombaKeyPress(Sender: TObject; var Key: Char);


  private

    {id e item  provisório da tabela temporaria itens venda}
    _id, id_do_item_a_ser_alterado, item: integer;
    FOperacao: uTipos.TOperacao;
    Fp_titulo: string;
    Fp_tabela: string;
    FCodigo: integer;

    Fp_lajota: string;
    Fp_altura_Laje: integer;
    Fp_largura_forma: integer;
    Fp_item_pedido: integer;
    Fp_qtde_vigas: integer;
    Fp_isopor: string;
    Fp_pedido_alterado: boolean;
    Fp_cliente_id: integer;
    Fp_vendedor_id: integer;
    Fp_transportadora_id: integer;
    Fp_frete_por_conta: integer;
    Fp_executar_dataChange_ds_pedidoItes: boolean;
    Fp_forma_pagto_id: integer;
    Fp_comissao_vendedor: double;
    Fp_comissao_abono: double;
    Fp_comissao_adm: double;
    Fp_empresa: string;
    Fp_eixo_laje: double;

   {criar cds's}
    procedure CriarTabelaTemporaria(cds: TFDMemTable);         // Itens de Pedido
    procedure CriarTabelaTemporariaItensLaje(cds: TFDMemTable);// Itens de Laje
    procedure CriarCdsAdicionais(cds: TFDMemTable);            // ferragens
//    procedure CriarCdsConcretoRealizado(cds: TFDMemTable);
//****************************************************************************//

    {chamada do botão add item ao pedido}
    procedure AdicionarItemPedido;
    {variavel para cds}
    procedure AddProduto( adicionalViga, eCompraFerros: string;
                         cds: TFDMemTable;
                         operacao: TOperacao;
                         aId, aPedido, aItem, aProduto: Integer;
                         aDescricao, aLocal, aSituacao, aNivel,
                         aLaje,aViga,aLajota, aIsopor, aRevenda,
                         aConcreto,aBomba, aVergalhao: string;
                         aQuantidade,aCustoFornecedor, APrecoCusto,aVenda : double;
                         aNegativo, aReforco: string; aQtdeVigas: integer;
                         aEstoqueControlado: string);
//****************************************************************************//


    {chamada do botão item laje}
    procedure AddViga(cdsItensLaje: TFDMemTable);
    {variavel para cds}
    procedure AddItemLaje(cds: TFDMemTable; operacao: TOperacao; aId, aPedido,
                          aItem, aProduto: Integer; aDescricao, aLocal, aSituacao,
                          aNivel: string; aQuantidade, APrecoCusto, aVenda: double);


//****************************************************************************//
    {chamada do botão adicionar reforço na viga}
    procedure AddReforcoViga(viga_extra: boolean;dsItemLaje:TDataSource; idTabela: integer);

    {variavel para cds...usando}
    procedure AddFerragem(reforco_viga: boolean; cds: TFDMemTable;
                          operacao:TOperacao; id, idPedido: integer; pedido_item :integer;
                          nmTabela: string; IdTabela, idProduto: integer;
                          descricao: string; dInicio, corpo, dFim: double;
                          qtdeVigas, quantidade: integer;// custo_fornecedor,
                          preco_custo, preco_venda: double; posicao:string);

//****************************************************************************//

    {chamada do botão inserir lajota/eps}
    procedure AddLajotaEps(tipo: string; cdsItensLaje: TFDMemTable);

    procedure ProdutosDeletados(cds: TFDMemTable; ID, Produto: integer; Quantidade: Double);

    {salvar no banco Cabeça do pedido}
    procedure prc_salvar;
    procedure SalvarItensVenda;
    procedure SalvarFerragens(novoId: integer);
    procedure SalvarItensLaje(altura: integer; cdsItensLajeDeletados: TFDMemTable;
                             qryGravaItensLaje: TFDQuery; cdsItensLaje: TFDMemTable);
    //procedure SalvarConcretoRealizado;
    //procedure SalvarItensConcretoRealizado;

    procedure CarregarItensPedido;
    procedure CarregarFerragens;
    procedure CarregarItensLaje;
    //procedure ControlaGuiaLajes(produto: integer);

    function ContarVigas(cds: TFDMemTable):integer;
    function SomarMetrosLineares(cds: TFDMemTable): double;
    function SomarMetrosQuadrados(forma: integer; metroslineares: double): double;
    function SomarQtdeLajotas(metroslineares: double; qtdeVigas: integer): integer;
    function SomarQtdeIsopor(metroslineares: double): integer;

    function  SomarValorCustoFerragem: double;
    function  SomarValorVendaFerragem: double;
    procedure SomarFerroNegativo;

    function  SomarValorCustoReforcoViga(filtrar: boolean): double;
    function  SomarValorVendaReforcoViga(filtrar: boolean): double;
    procedure SomarReforcoViga;

    procedure SomarValorProdutos;

    procedure Totais;

    function eViga(produto: integer): boolean;
    function eLaje(produto: integer): boolean;
//    function eConcreto(produto: integer): boolean;
//    function eBomba(produto: integer): boolean;
    function eReforcoViga: integer;

    procedure ExcluirViga(cdsItensLaje, cdsItensLajeDeletados: TFDMemTable);
    procedure EditarItemLaje(cdsItensLaje: TFDMemTable);
    procedure ExcluirItensLaje(cdsItensLaje, cdsItensLajeDeletados: TFDMemTable);
    procedure ExcluirItemPedido;
    procedure AlterarItemPedido;
    procedure EditarFerragem(cds: TFDMemTable; nmTabela: string);

    //procedure FiltraReforcosViga(dsViga: TDataSource; nmTabela: string; cdsViga: TClientDataSet);
    //procedure FiltraReforcoViga(cdsItensLaje: TClientDataSet; nome_tabela: string);
    procedure filtrarVigas(cds: TFDMemTable; nrPedido, nrItem: integer);

    procedure formataFloat(DataSet: TDataSet);
    function  openQryAux(sql, parametro: string): Integer;
    procedure prc_totais_laje(pedido, item_pedido: integer);
    procedure prc_filtrar_ferragens(nome_tabela: string; tabela_id: integer);
    procedure prc_controla_menu_itens_laje;
    procedure prc_carregar_comissao;
    procedure prc_salvar_comissao;
    function  fnc_somar_despesas(pedido_id: integer): double;
    procedure prc_carregar_pedido;
    function  fnc_incluir_alterar_pedido(operacao: TOperacao): boolean;
    function  fnc_incluir_alterar_local_entrega(operacao: TOperacao):boolean;
    function  fnc_somar_custo_pedido: double;

    procedure prc_atualizar_Painel_comissao_triunfo;
    procedure prc_atualizar_Painel_comissao_ferrari;
    procedure prc_calcular_painel_financeiro;
    procedure prc_recalcular_painel_financeiro;
    function fnc_incluir_alterar_concreto_realizado(
      operacao: TOperacao): boolean;

  protected
    procedure Componentes;
    procedure Inicializar;

    procedure LerDados;
    function  validar: boolean;
    //function  validarConcretoRealizado: boolean; // estava no private

  public

    // variaveis usadas para mover o group box de reforco de viga
    MouseDownSpot : TPoint;
    Capturing : bool;

    {codigo = número do pedido}
    property Codigo: integer read Fcodigo write Fcodigo;
    property p_cliente_id : integer read Fp_cliente_id write Fp_cliente_id;
    property p_vendedor_id: integer read Fp_vendedor_id write Fp_vendedor_id;
    property p_forma_pagto_id: integer read Fp_forma_pagto_id write Fp_forma_pagto_id;
    property p_transportadora_id: integer read Fp_transportadora_id write Fp_transportadora_id;
    property p_frete_por_conta: integer read Fp_frete_por_conta write Fp_frete_por_conta;
    property Operacao :uTipos.TOperacao read FOperacao write FOperacao;
    property p_tabela   :string read Fp_tabela write Fp_tabela;
    property p_titulo   :string read Fp_titulo write Fp_titulo;
    property p_pedido_alterado: boolean read Fp_pedido_alterado write Fp_pedido_alterado;
    property p_empresa   :string read Fp_empresa write Fp_empresa;

    {taxas de comissão}
    property p_comissao_vendedor :double read Fp_comissao_vendedor write Fp_comissao_vendedor;
    property p_comissao_adm :double read Fp_comissao_adm write Fp_comissao_adm;
    property p_comissao_abono :double read Fp_comissao_abono write Fp_comissao_abono;


    {propriedades da laje selecionada}
    property p_item_pedido   : integer read Fp_item_pedido write Fp_item_pedido;
    property p_qtde_vigas    : integer read Fp_qtde_vigas write Fp_qtde_vigas;

    property p_largura_forma : integer read Fp_largura_forma write Fp_largura_forma;
    property p_altura_laje   : integer read Fp_altura_Laje write Fp_altura_Laje;
    property p_lajota        : string read Fp_lajota write Fp_lajota;
    property p_isopor        : string read Fp_isopor write Fp_isopor;
    property p_eixo_laje     : double read Fp_eixo_laje write Fp_eixo_laje;

    property p_executar_dataChange_ds_pedidoItes : boolean read Fp_executar_dataChange_ds_pedidoItes write Fp_executar_dataChange_ds_pedidoItes;

  end;
var
  loForm : TfrmPedidosE;

  procedure Incluir;
  procedure Alterar(ACodigo: integer);
  procedure Excluir(ACodigo: integer);
  var
    i : integer; // var usado pra incluir um novo concreto utilizado
implementation

uses
  uBiblioteca, ufrmClientesE, ufrmPesquisaCliente, ufrmPesquisaProdutos,
  udmPesquisa, ufrmPesquisaAdicionais, ufrmPedididosFerragensE, unit_principal,
  unit_funcoes, unit_controle_estoques, ufrmPedidosPesquisaConcreto;


procedure Incluir;
begin

  loForm := TfrmPedidosE.Create(Application);
  try
    loForm.Operacao := uTipos.OpIncluir;
    loForm.codigo := 0;

    form_principal.prc_controla_menu(false);

    loform.top    := form_principal.pnl_Principal.Top +20;
    loform.Left   := form_principal.pnl_menulateral.Width ;
    loForm.Width  := form_principal.pnl_principal.Width ;
    loForm.Height := form_principal.pnl_principal.Height -10;

    loForm.ShowModal;

  finally
    FreeAndNil(loForm);
  end;

end;

procedure Alterar(ACodigo: integer);
begin

  loForm := TfrmPedidosE.Create(Application);
  try
    loForm.Operacao := uTipos.opAlterar;
    loForm.codigo := ACodigo;

    form_principal.prc_controla_menu(false);

    loform.top    := form_principal.pnl_Principal.Top +20;
    loform.Left   := form_principal.pnl_menulateral.Width;
    loForm.Width  := form_principal.pnl_principal.Width;
    loForm.Height := form_principal.pnl_principal.Height -10;

    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;

end;

procedure Excluir(ACodigo: integer);
var
  loForm : TfrmPedidosE;
begin
  loForm := TfrmPedidosE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.codigo   := ACodigo;

    form_principal.prc_controla_menu(false);

    loform.top    := form_principal.pnl_Principal.Top +20;
    loform.Left   := form_principal.pnl_menulateral.Width;
    loForm.Width  := form_principal.pnl_principal.Width;
    loForm.Height := form_principal.pnl_principal.Height -10;

    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;


{$R *.dfm}




procedure TfrmPedidosE.AddFerragem(
                                   reforco_viga: boolean;
                                   cds: TFDMemTable;
                                   operacao:TOperacao;
                                   id,
                                   idPedido: integer;
                                   pedido_item : integer;
                                   nmTabela: string;
                                   IdTabela,
                                   idProduto: integer;
                                   descricao: string;
                                   dInicio,corpo,dFim: double;
                                   qtdeVigas,
                                   quantidade: integer;
                                   //custo_fornecedor: double;
                                   preco_custo,
                                   preco_venda: double;
                                   posicao:string);
var
 comprimento: double;
begin


  comprimento := dInicio+corpo+dFim;

  {Salva no ClientDataSet}
  if operacao = uTipos.OpIncluir then
  begin
    cds.Append;
    cds.FieldByName('ID').AsInteger        := id;
    cds.FieldByName('PEDIDO_ID').AsInteger := idPedido;
    cds.FieldByName('TABELA').AsString     := nmTabela;
    cds.FieldByName('ID_TABELA').AsInteger := idTabela;
  end
  else
   cds.Edit;
  //
  //ShowMessage('qtde vigas ' + inttostr(qtdeVigas));
  cds.FieldByName('PEDIDO_ITEM').AsInteger  := pedido_item;
  cds.fieldbyname('PRODUTO_ID'  ).Asinteger := idProduto;
  cds.fieldbyname('DESCRICAO'   ).AsString  := descricao;
  cds.fieldbyname('DOBRA_INI'   ).AsFloat   := dInicio;
  cds.fieldbyname('CORPO'       ).AsFloat   := corpo;
  cds.fieldbyname('DOBRA_FIM'   ).AsFloat   := dFim;
  cds.fieldbyname('COMPRIMENTO' ).AsFloat   := comprimento;
  cds.fieldbyname('QTDE_VIGAS'  ).AsInteger := ubiblioteca.SeSenao(reforco_viga = true, qtdeVigas, -1);
  cds.fieldbyname('QUANTIDADE'  ).AsInteger := quantidade;
  //cds.fieldbyname('CUSTO_FORNECEDOR').AsFloat := custo_fornecedor;
  cds.fieldbyname('PRECO_CUSTO' ).AsFloat   := preco_custo;
  cds.fieldbyname('PRECO_VENDA' ).AsFloat   := preco_venda;
  cds.fieldbyname('POSICAO'     ).AsString  := posicao;

  cds.fieldbyname('TOTAL_LINEAR').AsFloat   := //qtdeVigas * quantidade * comprimento; alterei em 20/02/22
                                               ubiblioteca.SeSenao(reforco_viga = true, (qtdeVigas* quantidade * comprimento), (quantidade * comprimento));

  cds.fieldbyname('TOT_CUSTO'   ).AsFloat   := ubiblioteca.SeSenao( reforco_viga = true,(qtdeVigas * quantidade * comprimento * preco_custo), (quantidade * comprimento * preco_custo) );
  cds.fieldbyname('TOT_VENDA'   ).AsFloat   := ubiblioteca.SeSenao( reforco_viga = true,(qtdeVigas * quantidade * comprimento * preco_venda), (quantidade * comprimento * preco_venda) );

  cds.Post;
end;



procedure TfrmPedidosE.AdicionarItemPedido;
var
  produto: integer;
begin
  inherited;
  {proximo item do pedido}
  cdsPedidoItens.Last;
  item := cdsPedidoItens.FieldByName('ITEM').AsInteger + 1;

  if frmPesquisaProdutos = nil then
  begin
    frmPesquisaProdutos := TfrmPesquisaProdutos.Create(self);
    try
      frmPesquisaProdutos.lbl_titulo.Caption := 'INCLUSÃO DE UM NOVO PRODUTO AO PEDIDO';
      {abre a pesquisa mostrando todos os produtos}
      frmPesquisaProdutos.rgFiltrar.ItemIndex := 7; // todos
      frmPesquisaProdutos.btnBuscar.Click;
      frmPesquisaProdutos.edItemPedido.Caption:= inttostr(item);

      frmPesquisaProdutos.p_forma_pagto_id            := p_forma_pagto_id;
      frmPesquisaProdutos.lbl_forma_pagamento.Caption := 'Forma de pagamento : ' + pnl_forma_pagto.Caption;

      {esconde a coluna preço do fornecedor}
      frmPesquisaProdutos.dbgProdutos.Columns[4].Visible := false;
      frmPesquisaProdutos.gb_preco_fornecedor.Visible    := false;
      //não é permitido mudar a situação do pedido por aqui
      //frmPesquisaProdutos.cbxSituacao.Enabled := false;
      {preco vendedor}
      frmPesquisaProdutos.gb_Preco_vendedor.Visible := qry_sistema.FieldByName('PEDIDO_COLUNA_PRECO_VEND').AsString = 'S';


      frmPesquisaProdutos.ShowModal;
      if frmPesquisaProdutos.itemConfirmado then
      begin
         {produto selecionado}
         produto := frmPesquisaProdutos.Produto;

         (* vou ter que permitir a inclusao de lajes repetidas
         Depois implementar pra restringir demais produtos *)
         {então ficou assim}

         {ve se o produto ja foi incluso no pedido}
         cdsPedidoItens.First;
         while not cdsPedidoItens.Eof do
         begin

           if produto = cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger then
           begin
             {ja tem uma laje então, tem que ser de locais diferentes}
             if cdsPedidoItens.fieldbyname('LAJE').AsString = 'S' then
             begin
               if cdsPedidoItens.fieldbyname('NIVEL').AsString = frmPesquisaProdutos.cbxNivel.Text  then
               begin
                CriarMensagem('AVISO','Ja existe uma laje semelhante inclusa no mesmo nivel do projeto, ' + sLineBreak +
                            'Altere para outro nivel ou tente novamente');
                exit;
               end
               else
               cdsPedidoItens.Next;
             end
             else
             begin
              {não é laje... só avisa}
              //ShowMessage(frmPesquisaProdutos.Descricao +  ' ATENÇÃO JÁ  INCLUSO no pedido.');
              if CriarMensagem('CONFIRMACAO','Item já ESTA INCLUSO no sistema! Inclui novamente? ') then
                break
              else
                exit;
             end;
           end
           else
           cdsPedidoItens.Next;
         end;


         {adiciona no cds de itens do pedido}
         dec(_Id);
         ADDProduto( 'N',                          // adicional de viga
                     'N',                          // venda de ferragem
                     cdsPedidoItens,
                     uTipos.OpIncluir,
                     _id,                           //id provisório da tabela de itens do pedido
                     codigo,                       // id do pedido
                     item,                         // número do item do pedido
                     frmPesquisaProdutos.Produto,
                     //frmPesquisaProdutos.Descricao,
                     frmPesquisaProdutos.nomeFantasia,
                     frmPesquisaProdutos.Local,
                     frmPesquisaProdutos.Situacao,
                     frmPesquisaProdutos.Nivel,
                     frmPesquisaProdutos.Laje,     // LAJE
                     frmPesquisaProdutos.Viga,     // VIGA
                     frmPesquisaProdutos.Lajota,   // LAJOTA
                     frmPesquisaProdutos.Isopor,   // ISOPOR
                     frmPesquisaProdutos.Revenda,  // REVENDA
                     frmPesquisaProdutos.Concreto, // CONCRETO
                     frmPesquisaProdutos.Bomba,    // BOMBA
                     frmPesquisaProdutos.Vergalhao,// VEGALHAO
                     frmPesquisaProdutos.Qtde,
                     frmPesquisaProdutos.CustoFornecedor,
                     frmPesquisaProdutos.Custo,
                     frmPesquisaProdutos.Venda,
                     frmPesquisaProdutos.Negativo,
                     frmPesquisaProdutos.Reforco,
                     frmPesquisaProdutos.qtdeVigas,
                     frmPesquisaProdutos.EstoqueControlado
                     );

         {implermentar: por um campo agreegate e eliminar esta rotina :sit aberto}
         SomarValorProdutos;

         {verifica se o item adicionado é uma laje, se for mostra a aba itens da laje}
         if eLaje(produto) then
         begin

           {itens da laje fica visivel}
           tbs_itens_laje.TabVisible := true;

           {carrega as propriedades da laje}
           p_largura_forma    := qryAux.FieldByName('FORMA').AsInteger ;
           p_altura_Laje      := qryAux.FieldByName('ALTURA').AsInteger;
           edVigasH8Info.Text := IntToStr(frmPesquisaProdutos.qtdeVigas);

         end;

         {posiciona no item inserido}
         cdsPedidoItens.First;
         cdsPedidoItens.last;


         p_pedido_alterado := true;
      end;

    finally

      FreeAndNil( frmPesquisaProdutos );
    end;

  end;
end;


procedure TfrmPedidosE.AddViga(cdsItensLaje: TFDMemTable);// qtdeVigasInfo: integer);
var
  qtdeEnchimento, qtdeVigasDigitadas, qtdeLajota, qtdeEps: integer;
  qtdeVigasInfo : integer;
  qtde: string;
begin
  inherited;
  if cdsPedidoItens.FieldByName('LAJE').AsString = 'N' then
  begin
    CriarMensagem('AVISO','OPERACAO INVÁLIDA!' + #13 +
                'Você esta tentando incluir uma viga em um produto que NÃO é Laje, ' + #13 +
                'Selecione uma laje e tente novamente.');

    pgc_principal.ActivePage := tbs_itens_pedido;
    exit;
  end;

  if frmPesquisaProdutos = nil then
  begin

    frmPesquisaProdutos := TfrmPesquisaProdutos.Create(self);
    try
      frmPesquisaProdutos.lbl_titulo.Caption := 'INCLUSÃO DE VIGA EM UMA LAJE';
      {abre a pesquisa mostrando só vigas}
      frmPesquisaProdutos.rgFiltrar.ItemIndex := 1; // vigas
      frmPesquisaProdutos.rgFiltrar.Enabled := false;

      frmPesquisaProdutos.cbxNivel.text    := 'VIGA';
      frmPesquisaProdutos.cbxNivel.Enabled := false;

      {tipo de forma da laje}
      if p_largura_forma = 130 then frmPesquisaProdutos.rgTipoForma.ItemIndex := 0;
      if p_largura_forma = 250 then frmPesquisaProdutos.rgTipoForma.ItemIndex := 1;
      if p_largura_forma = 120 then frmPesquisaProdutos.rgTipoForma.ItemIndex := 2;

      frmPesquisaProdutos.rgTipoForma.Enabled := false;

      {altura da laje}
      if p_altura_Laje = 80 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 0;
      if p_altura_Laje = 120 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 1;
      if p_altura_Laje = 160 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 2;
      if p_altura_Laje = 200 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 3;
      if p_altura_Laje = 250 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 4;
      if p_altura_Laje = 300 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 5;

      frmPesquisaProdutos.rgAltura.Enabled := false;

      {não a necessidade de mostra o preço de venda}
      frmPesquisaProdutos.gbPrecoVenda.Visible      := false;
      frmPesquisaProdutos.gb_Preco_vendedor.Visible := false;

      {manda o número do item do pedido}
      frmPesquisaProdutos.edItemPedido.Caption := cdsPedidoItens.FieldByName('ITEM').AsString;
      //frmPesquisaProdutos.edt_qtde_vigas.Text := '0';
      frmPesquisaProdutos.edt_qtde_vigas.Text := inttostr(cdsPedidoItens.FieldByName('QTDE_VIGAS').AsInteger);

      frmPesquisaProdutos.Caption := 'Incluir Vigas na laje';

      {pega a quantidade de vigas informadas no edits}
      qtdeVigasInfo:= cdsPedidoItens.FieldByName('QTDE_VIGAS').AsInteger;


      if qtdeVigasInfo = 0 then
      begin
        while qtdeVigasInfo = 0 do
        begin
          qtde := InputBox('Informe a total de vigas H-'+inttostr(p_altura_Laje), 'Quantidade ','1' );
          if strtointdef(qtde,0) = 0 then
          begin
            CriarMensagem('AVISO','Informe uma quantidade valida');
            next;
          end;
          qtdeVigasInfo := strtointdef(qtde,0);
        end;
      end
      else
      begin
        qtde := inttostr(qtdeVigasInfo);
      end;

      {atualiza a quantidade da variavel}
      qtdeVigasInfo := strtoint(qtde);

      frmPesquisaProdutos.ShowModal;

      if frmPesquisaProdutos.itemConfirmado then
      begin

        // adiciona em memória
        dec(_Id);

        AddItemLaje(
                   cdsItensLaje,
                   uTipos.OpIncluir,
                   _id,
                   codigo,
                   frmPesquisaProdutos.Item,
                   frmPesquisaProdutos.Produto,
                   //frmPesquisaProdutos.Descricao,
                   frmPesquisaProdutos.nomeFantasia,
                   frmPesquisaProdutos.Local,
                   frmPesquisaProdutos.Situacao,
                   frmPesquisaProdutos.Nivel,
                   frmPesquisaProdutos.Qtde,
                   frmPesquisaProdutos.Custo,
                   frmPesquisaProdutos.Venda
                   );

        {atualizar painel de resumo da laje}
        //ShowMessage('numero do item do pedido :'  + inttostr(item) );
        prc_totais_laje(codigo, cdsPedidoItens.FieldByName('item').AsInteger);

        {inclui lajota ou isopor}
        //if strtointdef(edVigasH12Info.Text,0) = strtointdef(edQtdeVigasH12.Text,0) then
        if qtdeVigasInfo = qtdeVigasDigitadas then
        begin
          {:incluir lajotas h12}
          {busca o codigo da lajota/Isopor atraves da altura da laje}
          qtdeEnchimento := 0;
          if p_lajota = 'S' then
            if openQryAux('select * from PRODUTOS_LAJOTAS where ALTURA =:ALTURA', IntToStr(p_altura_Laje)) = 1 then
              //qtdeEnchimento := StrToInt(edQtdeLajotasH12.Text) ;
              qtdeEnchimento := qtdeLajota ;
          if p_isopor = 'S' then
             if openQryAux('select * from PRODUTOS_EPS where ALTURA =:ALTURA',IntToStr(p_altura_Laje) ) = 1 then
               //qtdeEnchimento := StrToInt(edQtdeIsoporH12.Text) ;
               qtdeEnchimento := qtdeEps ;

          {busca descrição, preco_custo e preço_venda}
          FilterCds(dmPesquisa.qryBuscaProduto, utipos.fsInteger,qryAux.FieldByName('PRODUTO_ID').AsString );

          dec(_Id);
          AddItemLaje(
                     //cdsItensLajeH12,
                     cdsItensLaje,
                     uTipos.OpIncluir,
                     _id,
                     codigo,
                     frmPesquisaProdutos.Item,
                     qryAux.FieldByName('PRODUTO_ID').AsInteger,
                     //dmPesquisa.qryBuscaProduto.FieldByName('DESCRICAO').AsString,
                     dmPesquisa.qryBuscaProduto.FieldByName('NOME_FANTASIA').AsString,
                     frmPesquisaProdutos.Local,
                     frmPesquisaProdutos.Situacao,
                     frmPesquisaProdutos.Nivel,
                     //'N',
                     qtdeEnchimento,
                     dmPesquisa.qryBuscaProduto.FieldByName('PRECO_CUSTO').AsFloat,
                     dmPesquisa.qryBuscaProduto.FieldByName('PRECO_VENDA').AsFloat
                     );

          dmPesquisa.qryBuscaProduto.Close;
          qryAux.Close;
        end;

        p_pedido_alterado := true;

      end;

    finally
      FreeAndNil( frmPesquisaProdutos );
    end;
  end;
end;


{adiciona lajota ou viga ao item da laje}
procedure TfrmPedidosE.AddLajotaEps(tipo:string; cdsItensLaje: TFDMemTable);
var
  qtdeEnchimento, qtdeVigasDigitadas, qtdeLajota, qtdeEps: integer;
begin
  inherited;
  if frmPesquisaProdutos = nil then
  begin
    frmPesquisaProdutos := TfrmPesquisaProdutos.Create(self);
    try
      frmPesquisaProdutos.lbl_titulo.Caption := 'INCLUSÃO DE LAJOTA/ISOPOR EM UMA LAJE';
      {abre a pesquisa mostrando lajota ou eps}
      if tipo = 'Lj' then
      begin
        frmPesquisaProdutos.rgFiltrar.ItemIndex := 2; // lajota
        // sugere a quantidade de lajotas
        frmPesquisaProdutos.edQtde.Text   := edQtdeLajotasH8.Text; // lajota
        {vou usar o campo nvel da tabela PEDIDOS_ITENS_LAJE, para informar que
        tipo de produto esta tabela.}
        frmPesquisaProdutos.cbxNivel.Text := 'LAJOTA';
      end else
      if tipo = 'Eps' then
      begin
        frmPesquisaProdutos.rgFiltrar.ItemIndex := 3; // EPS
        // sugere a quantidade de Eps
        frmPesquisaProdutos.edQtde.Text := edQtdeIsoporH8.Text; // eps
        frmPesquisaProdutos.cbxNivel.Text := 'EPS';
      end;
      frmPesquisaProdutos.cbxNivel.Enabled := false;
      frmPesquisaProdutos.rgFiltrar.Enabled := false;

      {altura da laje}
      if p_altura_Laje = 80 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 0;
      if p_altura_Laje = 120 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 1;
      if p_altura_Laje = 160 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 2;
      if p_altura_Laje = 200 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 3;
      if p_altura_Laje = 250 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 4;
      if p_altura_Laje = 300 then
        frmPesquisaProdutos.rgAltura.ItemIndex := 5;
      frmPesquisaProdutos.rgAltura.Enabled := false;

      {não a necessidade de mostra o preço de venda}
      frmPesquisaProdutos.gbPrecoVenda.Visible      := false;
      frmPesquisaProdutos.gb_Preco_vendedor.Visible := false;

      {manda o número do item do pedido}
      frmPesquisaProdutos.edItemPedido.Caption := cdsPedidoItens.FieldByName('ITEM').AsString;

      frmPesquisaProdutos.btnBuscar.Click;

      frmPesquisaProdutos.ShowModal;

      if frmPesquisaProdutos.itemConfirmado then
      begin

        // adiciona em memória
        dec(_Id);
        AddItemLaje(
                   cdsItensLaje,
                   uTipos.OpIncluir,
                   _id,
                   codigo,
                   frmPesquisaProdutos.Item,
                   frmPesquisaProdutos.Produto,
                   frmPesquisaProdutos.Descricao,
                   frmPesquisaProdutos.Local,
                   frmPesquisaProdutos.Situacao,
                   frmPesquisaProdutos.Nivel,
                   frmPesquisaProdutos.Qtde,
                   //frmPesquisaProdutos.Custo,
                   frmPesquisaProdutos.CustoFornecedor,
                   frmPesquisaProdutos.Venda
                   );
        {atualiza edits}
        if p_altura_Laje = 80 then
        begin
         // TotaisTabH8;
          qtdeVigasDigitadas := strtointdef(edQtdeVigasH8.Text,0);
          qtdeEps            := StrToInt(edQtdeIsoporH8.Text);
          qtdeLajota         := StrToInt(edQtdeLajotasH8.Text);
        end;

        p_pedido_alterado := true;
      end;

    finally
      FreeAndNil( frmPesquisaProdutos );
    end;
  end;
end;


function TfrmPedidosE.ContarVigas(cds: TFDMemTable): integer;
var
 v: Integer;
begin
  cds.DisableControls;

  v :=0;

  cds.First;
  while not cds.Eof do
  begin
   {contabiliza somente as vigas, lajota ou isopor não}
//   if eViga(cds.FieldByName('PRODUTO_ID').AsInteger) then
   if cds.FieldByName('NIVEL').AsString = 'VIGA' then
     v := v + cds.FieldByName('QTDE').AsInteger;

   cds.Next;
  end;
  cds.EnableControls;

  result := v;

end;

function TfrmPedidosE.SomarMetrosLineares(cds: TFDMemTable): double;
var
  total,tam : double;
  qtdeVigas: integer;
begin
  cds.DisableControls;
  //tam:= 0;
  //qtdeVigas:= 0;
  total:= 0;

  cds.First;
  while not cds.Eof do
  begin
    {contabiliza somente as vigas, lajota ou isopor não}
    if eViga(cds.FieldByName('PRODUTO_ID').AsInteger) then
    //if cds.FieldByName('NIVEL').AsString = 'VIGA' then
    begin
      tam       := qryAux.FieldByName('COMPRIMENTO').AsFloat/1000;
      qtdeVigas := cds.FieldByName('QTDE').AsInteger;
      total     := total + (qtdeVigas*tam);
    end;
    cds.Next;
  end;

  cds.EnableControls;

  result := total;

end;

function TfrmPedidosE.SomarMetrosQuadrados(forma: integer; metroslineares: double): double;
//var
//  loqry : TFDQuery;
  //eixo_laje : double;
begin
  if forma = 0 then
  begin
     CriarMensagem('AVISO','erro na função SomarMetrosQuadrados. Forma = 0');
     exit;
  end;
//ShowMessage('forma ' + inttostr(forma));
  try
    (*
    loqry := TFDQuery.Create(application);
    loqry.Connection := conexao;
    loqry.Close;
    loqry.SQL.Clear;
    loqry.SQL.Add('select EIXO_LAJE from CONFIGURACOES_SISTEMA');
    loqry.Open;
    p_eixo_laje := loqry.FieldByName('EIXO_LAJE').AsInteger /1000;
    *)

    if forma = 130 then  // forma normal
      //result := metroslineares * 0.42
      result := metroslineares * p_eixo_laje
    else
    if forma = 250 then // forma painel
      result := metroslineares * 0.25
    else
    if forma = 120 then // forma trelifacil
      result := metroslineares * 0.49
    else
      criarmensagem('ERRO', 'ERRO AO CALCULAR METRAGEM QUADRADA DA LAJE!' + slinebreak +
                             'FORMA PASSADA COMO PARAMETRO PARA CALCULO, NÃO ESTA CADASTRADA NO SISTEMA!');

  finally
  //  loqry.close;
  //  FREEANDNIL(loqry);
  end;

end;

function TfrmPedidosE.SomarQtdeIsopor(metroslineares: double): integer;
begin
  result := trunc( metroslineares );
end;

function TfrmPedidosE.SomarQtdeLajotas(metroslineares: double; qtdeVigas: integer): integer;
//var
//  loqry : TFDQuery;
 // eixo_laje : double;
//  cnpj : string;
begin
  try
(*    loqry := TFDQuery.Create(application);
    loqry.Connection := conexao;
    loqry.Close;

    {eixo da laje}
    loqry.SQL.Clear;
    loqry.SQL.Add('select EIXO_LAJE from CONFIGURACOES_SISTEMA');
    loqry.Open;
    p_eixo_laje := loqry.FieldByName('EIXO_LAJE').AsInteger /1000;

    {laje triunfo faz um calculo diferenciado para lajota, demais uso minha
    formula}
    loqry.SQL.Clear;
    loqry.SQL.Add('select p.cpf_cnpj from pessoas p, empresa e where p.id = e.pessoa_id');
    loqry.Open;
    cnpj := loqry.FieldByName('cpf_cnpj').AsString;
*)

    {calculo lajes triunfo}
    //if cnpj = '17936070000159' then
    if p_empresa = 'TRIUNFO' then
       result := trunc(metroslineares * p_eixo_laje * 12)
    else
      result := trunc(((metroslineares * 5) - qtdeVigas)* 1.02 );

  finally
//    loqry.close;
//    FREEANDNIL(loqry);
  end;

end;

procedure TfrmPedidosE.SomarValorProdutos;
var
 v : double; // valor de venda dos produtos
 c : double; // valor de custo dos produtos
 loCds: TFDMemTable;
begin
  p_executar_dataChange_ds_pedidoItes  := false;

  locds := TFDMemTable.Create(self);
  locds.Data := cdsPedidoItens.data;
  locds.DisableControls;

  c := 0;
  v := 0;
  loCds.First;
  while not locds.Eof do
  begin
    {calcula o valor de custo dos produtos}
    c := c + (locds.FieldByName('qtde').AsFloat * locds.FieldByName('custo_fornecedor').AsFloat);

    {calcula o valor de venda dos produtos}
    v := v + (locds.FieldByName('qtde').AsFloat * locds.FieldByName('venda').AsFloat);
    locds.Next;
  end;

  edt_valor_produtos.Caption     := FormatFloat('0.00', v );
  totais;

  locds.EnableControls;
  freeandnil(locds);

  p_executar_dataChange_ds_pedidoItes  := true;

end;

procedure TfrmPedidosE.prc_calcular_painel_financeiro;
var
 custo_produtos, vr_produtos,frete_cliente,acrescimos,descontos, preco_custo: double;
 loCdsItensPedido, loCdsItensLaje: TFDMemTable;
 loqry: TFDQuery;
 {como libero o filtro cdsItensLaje, só posso calcular uma vez, pois o pedido
 pode conter mais que uma laje vendida, o mesmo pra ferragens}
 calcular_custo_laje, calcular_custo_ferragem: boolean;
 calcular_por_viga: string;
begin
  {variavel que define se o calculo de custo da laje vai ser pelas vigas(fabricante)
  ou pelo valor de custo de compra da laje caso seja uma revenda}
  calcular_por_viga := qry_sistema.FieldByName('PEDIDO_CALCULAR_LAJE_POR_VIGA').AsString;
  if calcular_por_viga = 'S' then
    lbl_obs_custo_laje.Caption := '(**) O Calculo de custo da laje(s) esta sendo feito pelo custo das vigas/lajota/isopor que compões as mesmas.'
  else
  if calcular_por_viga = 'N' then
    lbl_obs_custo_laje.Caption := '(**) O Calculo de custo da laje(s) esta sendo feito pela quantidade real das laje(s) x o preço de custo da mesma(s).';

  calcular_custo_laje     := true;
  calcular_custo_ferragem := true;
  custo_produtos          := 0;

  {créditos}
  vr_produtos   := strtofloatdef(edt_valor_produtos.Caption,0);
  frete_cliente := strtofloatdef(edt_frete_cliente.Text,0);
  acrescimos    := strtofloatdef(edt_acrescimo.Text,0);
  descontos     := strtofloatdef(edt_desconto.Text,0);

  edt_financeiro_vr_produtos.Text   := FormatFloat('0.00',vr_produtos);
  edt_financeiro_frete_cliente.Text := FormatFloat('0.00',frete_cliente);
  edt_financeiro_acrescimos.Text    := FormatFloat('0.00',acrescimos);
  edt_financeiro_descontos.Text     := FormatFloat('0.00',descontos);
  edt_financeiro_vr_venda.Text      := FormatFloat('0.00',vr_produtos+frete_cliente+acrescimos-descontos);

  {CALCULAR CUSTO DOS PRODUTO}
  {clone do cdsPedidosItens}
  loCdsItensPedido      := TFDMemTable.Create(self);
  loCdsItensPedido.Data := cdsPedidoItens.data;
  loCdsItensPedido.DisableControls;

  {clone do cdsItensLaje}
  loCdsItensLaje      := TFDMemTable.Create(self);
  loCdsItensLaje.Data := cdsItensLaje.data;
  loCdsItensLaje.DisableControls;
  {calcular o custo do produto item a item}
  loCdsItensPedido.First;
  while not loCdsItensPedido.Eof do
  begin
    {se o item for uma laje calcular o custo pelo seus itens}
    if (loCdsItensPedido.FieldByName('LAJE').AsString = 'S') and (calcular_custo_laje = true) then
    begin
      {calculo pelas vigas da laje}
      if calcular_por_viga = 'S'  then
      begin
        {libero o filtro do cdsItensLaje, pra poder calcular item a item das lajes
        que pode ser mais que uma }
        loCdsItensLaje.Filtered := FALSE;
        loCdsItensLaje.First;
        while not loCdsItensLaje.eof do
        begin
          custo_produtos := custo_produtos + (loCdsItensLaje.FieldByName('QTDE').AsFloat * loCdsItensLaje.FieldByName('CUSTO').AsFloat);
          loCdsItensLaje.next;
        end;
        calcular_custo_laje := false;
      end else
      if calcular_por_viga = 'N'  then
      begin
        {calculo pelo custo da laje na tabela de produtos}
        custo_produtos := custo_produtos + (loCdsItensPedido.FieldByName('QTDE_REAL_LAJE').AsFloat * loCdsItensPedido.FieldByName('CUSTO').AsFloat);
      end;
    end else
    if ((loCdsItensPedido.FieldByName('REFORCO_DE_VIGA').AsString = 'S') or
       (loCdsItensPedido.FieldByName('NEGATIVO_DE_LAJE').AsString = 'S') or
       (loCdsItensPedido.FieldByName('ADICIONAL_DE_VIGA').AsString = 'S'))
       and (calcular_custo_ferragem = true) then
    begin
      try
        {qry para buscar o preço de custo da ferragem, pois não tenho esse
        valor no dbgrig}
        loqry := tfdquery.Create(application);
        loqry.Connection := conexao;
        loqry.SQL.Add('select id, preco_custo from produtos where id =:produto_id ');

        {ferragens}
        dsPedidoFerragens.DataSet.Filtered := false;
        if not dsPedidoFerragens.DataSet.IsEmpty then
        begin
          dsPedidoFerragens.DataSet.First;
          while not dsPedidoFerragens.DataSet.eof do
          begin
            {buscar preço de custo}
            loqry.close;
            loqry.ParamByName('produto_id').AsInteger := dsPedidoFerragens.DataSet.FieldByName('PRODUTO_ID').AsInteger;
            loqry.Open;
            preco_custo := loqry.FieldByName('PRECO_CUSTO').AsFloat;

            //ShowMessage('CUSTO MP : '+ loqry.FieldByName('id').AsString + ' - ' + floattostr(preco_custo));
            custo_produtos := custo_produtos + (dsPedidoFerragens.DataSet.FieldByName('TOTAL_LINEAR').AsFloat * preco_custo);
            dsPedidoFerragens.DataSet.next;
          end;
          //ShowMessage('custo ferragem ' + floattostr(custo_produtos));
          calcular_custo_ferragem := false;
        end;
      finally
        loqry.Close;
        freeandnil(loqry);
      end;
    end
    else
    if (loCdsItensPedido.FieldByName('CONCRETO').AsString = 'S') and
       (loCdsItensPedido.FieldByName('DESCRICAO').AsString <> 'FALTANTE DE CONCRETO') then
    begin
      if not mtb_concreto_utilizado.IsEmpty then
      begin
        mtb_concreto_utilizado.First;
        while not mtb_concreto_utilizado.eof do
        begin
          custo_produtos := custo_produtos + (mtb_concreto_utilizado.FieldByName('preco_custo').AsFloat * mtb_concreto_utilizado.FieldByName('quantidade').AsFloat);
          mtb_concreto_utilizado.Next;
        end;
        {custo da bomba}
        custo_produtos := custo_produtos + STRTOFLOATDEF(edt_total_bomba.Text,0);
      end;
    end
    else
    if ((loCdsItensPedido.FieldByName('LAJE').AsString = 'N') AND
       (loCdsItensPedido.FieldByName('NEGATIVO_DE_LAJE').AsString = 'N') AND
       (loCdsItensPedido.FieldByName('REFORCO_DE_VIGA').AsString = 'N') AND
       (loCdsItensPedido.FieldByName('DESCRICAO').AsString <> 'FALTANTE DE CONCRETO') and
       (loCdsItensPedido.FieldByName('BOMBA').AsString = 'N') and
       (loCdsItensPedido.FieldByName('ADICIONAL_DE_VIGA').AsString = 'N')) then
    begin
      //ShowMessage('produto : ' + loCdsItensPedido.FieldByName('descricao').Asstring + ' ' + loCdsItensPedido.FieldByName('CUSTO_FORNECEDOR').AsString );
      custo_produtos := custo_produtos + (loCdsItensPedido.FieldByName('QTDE').AsFloat * loCdsItensPedido.FieldByName('CUSTO_FORNECEDOR').AsFloat);
    end;

    loCdsItensPedido.Next;
  end;


  //ShowMessage(floattostr(custo_produtos));
  edt_financeiro_custos_produtos.Text := floattostr(custo_produtos);

  prc_recalcular_painel_financeiro;

end;

procedure TfrmPedidosE.prc_recalcular_painel_financeiro;
var
 vr_produtos,frete_cliente,acrescimos,descontos,vr_venda: double;
 custos_produtos,desp_frete,comissoes,desp_cartao,outras_desp: double;
 margem, margem_percentual: double;
begin
  {créditos}
  vr_produtos   := strtofloatdef(edt_financeiro_vr_produtos.Text,0);
  frete_cliente := strtofloatdef(edt_financeiro_frete_cliente.Text,0);
  acrescimos    := strtofloatdef(edt_financeiro_acrescimos.Text,0);
  descontos     := strtofloatdef(edt_financeiro_descontos.Text,0);

  vr_venda := vr_produtos+frete_cliente+acrescimos-descontos;
  edt_financeiro_vr_venda.Text := FormatFloat('0.00', vr_venda);

  {debitos}
  custos_produtos := strtofloatdef(edt_financeiro_custos_produtos.Text,0);
  desp_frete      := strtofloatdef(edt_financeiro_frete_empresa.Text,0);
  comissoes       := strtofloatdef(edt_financeiro_comissoes.Text,0);
  desp_cartao     := strtofloatdef(edt_financeiro_cartao_credito.Text,0);
  outras_desp     := strtofloatdef(edt_financeiro_outras_despesas.Text,0);

  edt_financeiro_total_custos.Text := FormatFloat('0.00',custos_produtos+desp_frete+comissoes+desp_cartao+outras_desp);

  {margem}
  margem := strtofloat(edt_financeiro_vr_venda.Text)-strtofloat(edt_financeiro_total_custos.Text);
  edt_financeiro_margem_contribuicao.Text := FormatFloat('0.00',margem );
  margem_percentual := (margem*100) / vr_venda;
  edt_financeiro_margem_percentual.Text := FormatFloat('0.00',margem_percentual );

end;


function TfrmPedidosE.SomarValorCustoFerragem:double;
var
  v: double;
begin
  cdsPedidoFerragens.DisableControls;
  v :=0;
  cdsPedidoFerragens.First;
  while not cdsPedidoFerragens.Eof do
  begin
    v := v + (
             cdsPedidoFerragens.FieldByName('QUANTIDADE').AsFloat  *
             cdsPedidoFerragens.FieldByName('COMPRIMENTO').AsFloat *
             cdsPedidoFerragens.FieldByName('PRECO_CUSTO').AsFloat
             );
    cdsPedidoFerragens.Next;
  end;
  cdsPedidoFerragens.EnableControls;
  Result := V;
end;

function TfrmPedidosE.SomarValorVendaFerragem:double;
var
 v: double;
begin
  cdsPedidoFerragens.DisableControls;
  v :=0;
  cdsPedidoFerragens.First;
  while not cdsPedidoFerragens.Eof do
  begin
    v := v + (
              cdsPedidoFerragens.FieldByName('QUANTIDADE').AsFloat  *
              cdsPedidoFerragens.FieldByName('COMPRIMENTO').AsFloat *
              cdsPedidoFerragens.FieldByName('PRECO_VENDA').AsFloat
             );
    cdsPedidoFerragens.Next;
  end;
  cdsPedidoFerragens.EnableControls;
  Result := V;
end;

function TfrmPedidosE.SomarValorCustoReforcoViga(filtrar: boolean):double;
var
 v: double;
begin
  //ShowMessage('somar custo de ' + inttostr(cdsPedidoReforcoViga.RecordCount) + 'reforcos de vigas' );

  {se continuar dando eero na totalização dos custo, tentar passar como parametro
  true ou false para a propriedade filtered para o cdsPedidoFerragens}

  cdsPedidoFerragens.Filter   := 'QTDE_VIGAS > ' + quotedstr('0');
  cdsPedidoFerragens.Filtered := filtrar;

  cdsPedidoFerragens.DisableControls;

  v :=0;
  cdsPedidoFerragens.First;
  while not cdsPedidoFerragens.Eof do
  begin

    v := v + cdsPedidoFerragens.FieldByName( 'TOT_CUSTO' ).AsFloat;
    cdsPedidoFerragens.Next;

  end;

  cdsPedidoFerragens.Filtered := true;
  cdsPedidoFerragens.EnableControls;
  Result := V;

end;

function TfrmPedidosE.SomarValorVendaReforcoViga(filtrar: boolean):double;
var
 v: double;
begin
  v :=0;

  cdsPedidoFerragens.DisableControls;

  cdsPedidoFerragens.Filter   := 'QTDE_VIGAS > ' + quotedstr('0');
  cdsPedidoFerragens.Filtered := filtrar;

  cdsPedidoFerragens.First;
  while not cdsPedidoFerragens.Eof do
  begin
    v := v + cdsPedidoFerragens.FieldByName('TOT_VENDA').AsFloat;
    cdsPedidoFerragens.Next;
  end;
  //edTotVendaRerforco.Text := FormatFloat('0.00', V);
  cdsPedidoFerragens.EnableControls;
  cdsPedidoFerragens.Filtered := True;
  Result := V;
end;


procedure TfrmPedidosE.btn_incluir_lancamentoClick(Sender: TObject);
var
  outras_despesas: double;
  total_venda, total_custo : double;
begin
  inherited;

  total_venda  := qryComissoes.FieldByName('TOTAL_VENDA').AsFloat;
  total_custo  := qryComissoes.FieldByName('TOTAL_CUSTO').AsFloat;


  if frmComissoesDespesasE = nil then
    frmComissoesDespesasE := TfrmComissoesDespesasE.create(application);

  frmComissoesDespesasE.Codigo    := 0;
  frmComissoesDespesasE.pedido_id := Codigo;
  frmComissoesDespesasE.Operacao  := OpIncluir;
  frmComissoesDespesasE.ShowModal;


  {lista outras despesas}
  //uBiblioteca.FilterCds(qry_comissao_despesas, utipos.fsInteger, inttostr(qry.FieldByName('PEDIDO_ID').AsInteger));
  AtualizaQuery(qry_comissao_despesas);
  uBiblioteca.FilterCds(qry_comissao_despesas, utipos.fsInteger, inttostr(Codigo));

  {atualiza a tabela comissao, campo outras despesas e recalcula}
  if not qry_comissao_despesas.IsEmpty then
    outras_despesas := fnc_somar_despesas(codigo)
  else
   outras_despesas := 0;

  uFinanceiro.fnc_salvar_comissao(
                                  self.Conexao,
                                  opAlterar,
                                  date,
                                  date,
                                  date,
                                  codigo,
                                  p_vendedor_id,
                                  3,
                                  total_venda,
                                  total_custo,
                                  outras_despesas,
                                  1,//0.50, {consertar}
                                  50      {consertar}
                                  );

  {pra atualizar a tela tive que fazer tudo isso, depois melhorar}
  uBiblioteca.AtualizaQuery(qryComissoes);

  prc_atualizar_Painel_comissao_triunfo;
  //prc_atualizar_Painel_comissao_ferrari;

  //uBiblioteca.FilterCds(qryComissao_itens, utipos.fsInteger, inttostr(self.Codigo));

  FreeAndNil( frmComissoesDespesasE );
end;


procedure TfrmPedidosE.btn_incluir_vendedorClick(Sender: TObject);
begin
  inherited;
  ufrmVendedoresE.incluir;
  qryVendedores.close;
  qryVendedores.Open;

end;

procedure TfrmPedidosE.btn_recalcular_totaisClick(Sender: TObject);
begin
  inherited;
  prc_recalcular_painel_financeiro;
end;

procedure TfrmPedidosE.btn_incluir_concreto_utilizadoClick(Sender: TObject);
begin

  try
    if frmPedidosPesquisaConcreto = nil then
      frmPedidosPesquisaConcreto := TfrmPedidosPesquisaConcreto.Create(application);
    frmPedidosPesquisaConcreto.lbl_titulo.Caption := 'TIPO DE CONCRETO UTILIZADO';
    frmPedidosPesquisaConcreto.qry.SQL.Clear;
    frmPedidosPesquisaConcreto.qry.SQL.Text:= 'select p.id, p.descricao, p.unidade, p.preco_custo from produtos p, produtos_concreto c where p.id = c.produto_id order by descricao ';
    frmPedidosPesquisaConcreto.qry.open;

    frmPedidosPesquisaConcreto.ShowModal;
    if frmPedidosPesquisaConcreto.confirmado = true then
    begin
      {ver duplicidade}
      mtb_concreto_utilizado.First;
      if mtb_concreto_utilizado.Locate('PRODUTO_ID', frmPedidosPesquisaConcreto.produto_id, []) = true then
      begin
        CriarMensagem('AVISO','PRODUTO JÁ INCLUSO DA GRID DE PRODUTOS');
        exit;
      end else
      begin
        {incluir na grid como item novo}
        dec(i);
        mtb_concreto_utilizado.Insert;
        mtb_concreto_utilizado.FieldByName('ID').AsInteger            := i;
        mtb_concreto_utilizado.FieldByName('PEDIDO_ID').AsInteger     := Codigo;
        mtb_concreto_utilizado.FieldByName('ID_ITEMPEDIDO').AsInteger := cdsPedidoItens.FieldByName('ID').AsInteger;
        mtb_concreto_utilizado.FieldByName('PRODUTO_ID').AsInteger    := frmPedidosPesquisaConcreto.produto_id;
        mtb_concreto_utilizado.FieldByName('descricao').AsString  := frmPedidosPesquisaConcreto.descricao;
        mtb_concreto_utilizado.FieldByName('UNIDADE').AsString    := frmPedidosPesquisaConcreto.UNIDADE;
        mtb_concreto_utilizado.FieldByName('quantidade').AsString := frmPedidosPesquisaConcreto.edt_quantidade.Text;
        mtb_concreto_utilizado.FieldByName('preco_custo').AsFloat := strtofloat( frmPedidosPesquisaConcreto.edt_unitario.Text );
        mtb_concreto_utilizado.FieldByName('total').AsFloat := strtofloat( frmPedidosPesquisaConcreto.edt_quantidade.Text )
                                                               * strtofloat( frmPedidosPesquisaConcreto.edt_unitario.Text);
        mtb_concreto_utilizado.post;
      end;
    end;


  finally
    freeandnil(frmPedidosPesquisaConcreto);
  end;

end;

procedure TfrmPedidosE.Button2Click(Sender: TObject);
begin
  try
    if frmPedidosPesquisaConcreto = nil then
      frmPedidosPesquisaConcreto := TfrmPedidosPesquisaConcreto.Create(application);
    frmPedidosPesquisaConcreto.lbl_titulo.Caption := 'QUANTIDADE DE FALTANTE';
    frmPedidosPesquisaConcreto.qry.SQL.Clear;
    frmPedidosPesquisaConcreto.qry.SQL.Text:= 'select p.id, p.descricao, p.unidade, p.preco_custo from produtos p, produtos_concreto c where p.id = c.produto_id and p.descricao like :descricao order by descricao ';
    frmPedidosPesquisaConcreto.qry.ParamByName('descricao').AsString := '%'+'FALTANTE'+'%';
    frmPedidosPesquisaConcreto.qry.open;

    frmPedidosPesquisaConcreto.ShowModal;
    if frmPedidosPesquisaConcreto.confirmado = true then
    begin
      {ver duplicidade}
      mtb_concreto_utilizado.First;
      if mtb_concreto_utilizado.Locate('PRODUTO_ID', frmPedidosPesquisaConcreto.produto_id, []) = true then
      begin
        CriarMensagem('AVISO','PRODUTO JÁ INCLUSO DA GRID DE PRODUTOS');
        exit;
      end else
      begin
        {incluir na grid como item novo}
        dec(i);
        mtb_concreto_utilizado.Insert;
        mtb_concreto_utilizado.FieldByName('ID').AsInteger            := i;
        mtb_concreto_utilizado.FieldByName('PEDIDO_ID').AsInteger     := Codigo;
        mtb_concreto_utilizado.FieldByName('ID_ITEMPEDIDO').AsInteger := cdsPedidoItens.FieldByName('ID').AsInteger;
        mtb_concreto_utilizado.FieldByName('PRODUTO_ID').AsInteger    := frmPedidosPesquisaConcreto.produto_id;
        mtb_concreto_utilizado.FieldByName('descricao').AsString  := frmPedidosPesquisaConcreto.descricao;
        mtb_concreto_utilizado.FieldByName('UNIDADE').AsString    := frmPedidosPesquisaConcreto.UNIDADE;
        mtb_concreto_utilizado.FieldByName('quantidade').AsString := frmPedidosPesquisaConcreto.edt_quantidade.Text;
        mtb_concreto_utilizado.FieldByName('preco_custo').AsFloat := strtofloat( frmPedidosPesquisaConcreto.edt_unitario.Text );
        mtb_concreto_utilizado.FieldByName('total').AsFloat := strtofloat( frmPedidosPesquisaConcreto.edt_quantidade.Text )
                                                               * strtofloat( frmPedidosPesquisaConcreto.edt_unitario.Text);
        mtb_concreto_utilizado.post;
      end;
    end;

  finally
    freeandnil(frmPedidosPesquisaConcreto);
  end;

end;

procedure TfrmPedidosE.btn_excluir_lancamentoClick(Sender: TObject);
var
  outras_despesas: double;
  total_venda    : double;
  total_custo    : double;
begin
  inherited;
  total_venda  := qryComissoes.FieldByName('TOTAL_VENDA').AsFloat;
  total_custo  := qryComissoes.FieldByName('TOTAL_CUSTO').AsFloat;


  if frmComissoesDespesasE = nil then
    frmComissoesDespesasE := TfrmComissoesDespesasE.create(application);

  frmComissoesDespesasE.Codigo    := qry_comissao_despesas.FieldByName('ID').AsInteger;
  frmComissoesDespesasE.pedido_id := Codigo;
  frmComissoesDespesasE.Operacao  := opExcluir;
  frmComissoesDespesasE.ShowModal;


  {atualiza grid outras despesas}
  uBiblioteca.FilterCds(qry_comissao_despesas, utipos.fsInteger, inttostr(Codigo));

  {atualiza a tabela comissao, campo outras despesas e recalcula}
  if not qry_comissao_despesas.IsEmpty then
    outras_despesas := fnc_somar_despesas(codigo)
  else
   outras_despesas := 0;

  uFinanceiro.fnc_salvar_comissao(
                                  self.Conexao,
                                  opAlterar,
                                  date,
                                  date,
                                  date,
                                  codigo,
                                  p_vendedor_id,
                                  3,
                                  total_venda,
                                  total_custo,
                                  outras_despesas,
                                  1,//0.50,
                                  50
                                  );

  {pra atualizar a tela tive que fazer tudo isso, depois melhorar}
  uBiblioteca.AtualizaQuery(qryComissoes);

  prc_atualizar_Painel_comissao_triunfo;
 // prc_atualizar_Painel_comissao_ferrari;

  FreeAndNil( frmComissoesDespesasE );

end;

procedure TfrmPedidosE.btn_fecharClick(Sender: TObject);
begin
  inherited;

  if p_pedido_alterado then
  begin
    (*
    if uBiblioteca.fnc_criar_mensagem('ATENÇÃO',
                                      'Pedido Alterado',
                                      'Foram feitas alterações neste pedido, deseja descartar as alterações ?',
                                      ExtractFilePath(Application.ExeName) + '\Icones\information.ico',
                                      'CONFIRMA')
    *)
    if criarmensagem('CONFIRMACAO','PEDIDO ALTERADO!' + slinebreak + slinebreak +
                     'FORAM FEITAS ALTERAÇÕES NESTE PEDIDO, DESEJA DESCARTAR AS ALTERAÇÕES?') then
    begin
      (*
      uBiblioteca.fnc_criar_mensagem('FECHAR SEM ALTERAR',
                                      'Pedido Alterado',
                                      'Sair sem salvar as alterações',
                                      ExtractFilePath(Application.ExeName) + '\Icones\information.ico',
                                      'OK');
      *)
      criarmensagem('AVISO','PEDIDO ALTERADO!' + slinebreak + slinebreak +
                            'SAIR SEM SALVAR AS ALTERAÇÕES.') ;
      close;
    end
    else
    btnOk.Click ;
  end
  else
  // pedido sem alteração, fechar direto
  close;

end;

function TfrmPedidosE.fnc_somar_despesas(pedido_id: integer):double;
var
  qry : TFDQuery;
  debito  : double;
  credito : double;
begin
  result  := 0;
  debito  := 0;
  credito := 0;

  qry := TFDQuery.Create(application);
  qry.Connection := self.Conexao;
  qry.SQL.Clear;
  qry.SQL.Add('select sum(VALOR) as DEBITO from comissao_despesas where DEBITO_CREDITO = ' + QuotedStr('D') + ' and  PEDIDO_ID =:PEDIDO_ID');
  qry.ParamByName('PEDIDO_ID').AsInteger := pedido_id;
  qry.Open;

  debito := qry.FieldByName('DEBITO').AsFloat;
  //***
  qry.SQL.Clear;
  qry.SQL.Add('select sum(VALOR) as CREDITO from comissao_despesas where DEBITO_CREDITO = ' + QuotedStr('C') + ' and  PEDIDO_ID =:PEDIDO_ID');
  qry.ParamByName('PEDIDO_ID').AsInteger := pedido_id;
  qry.Open;

  credito := qry.FieldByName('CREDITO').AsFloat;

  result := (debito + credito);
//  result := (credito - debito);

  freeandnil( qry );

end;


procedure TfrmPedidosE.Totais;
begin

  edt_valor_total.Caption := FormatFloat('0.00',
                             strtofloat(edt_valor_produtos.Caption) +
                             strtofloat(edt_frete_cliente.Text) +
                             strtofloat(edt_acrescimo.Text) -
                             strtofloat(edt_desconto.Text)
                                        ) ;

  lbl_percentual_desconto.Caption := FormatFloat('0.00',
                             (strtofloat(edt_desconto.Text)*100)  /
                             strtofloat(edt_valor_produtos.Caption)
                                         );

end;

procedure TfrmPedidosE.btnBuscaClienteClick(Sender: TObject);
var
  loQry : TFDQuery;
begin
  inherited;

  p_cliente_id :=  ufrmPesquisaCliente.executa;


  uBiblioteca.FilterCds(qryClientes, uTipos.fsInteger, inttostr(p_cliente_id));
  //qry.FieldByName('CLIENTE_ID').AsInteger := cliente;
  lbl_cliente_id.Caption   := inttostr(p_cliente_id);
  lbl_cliente_nome.Caption := qryClientes.FieldByName('NOME').AsString;

  try

    {busca o vendedor que representa o cliente}
(*    loQry := ubiblioteca.CriaQuery(self.Conexao, 'select * from vendedores where id =:id', false);
*)
    loqry := TFDQuery.Create(self);
    loQry.Connection := conexao;
    loQry.Close;
    loqry.SQL.Clear;
    loqry.SQL.Add('select * from vendedores where id =:id');

    loQry.ParamByName('id').AsInteger := qryClientes.FieldByName('vendedor_id').AsInteger;
    loQry.Open;

    p_vendedor_id           := loQry.FieldByName('pessoa_id').AsInteger;
    p_comissao_vendedor     := loQry.FieldByName('COMISSAO_VENDEDOR').AsFloat;
    p_comissao_adm          := loQry.FieldByName('COMISSAO_ADM').AsFloat;
    lbl_vendedor_id.Caption := inttostr(p_vendedor_id);
    cbxVendedores.KeyValue  := p_vendedor_id;

  finally
    loQry.Close;
    FreeAndNil( loqry );
  end;

  if lbl_cliente_nome.Caption = 'CONSUMIDOR' then
  begin
    pcVenda.ActivePage   := tbDestinatario;
    pcCliente.ActivePage := tbs_local_entrega;
  end;


end;

procedure TfrmPedidosE.pmExcluirFerroNegativoClick(Sender: TObject);
begin
  inherited;
  if cdsPedidoFerragens.IsEmpty then exit;

  if Application.MessageBox('Deseja excluir o registro', 'Confirmação',MB_YESNO) = mrNo then exit;


  {se tiver alguma coisa no grid com id maior que zero
  inclui no cdsExclusao apos confirmação}

  {inclui a Ferragem na lista de deletados}
  if cdsPedidoFerragens.FieldByName('ID').AsInteger > 0 then
  begin
    ProdutosDeletados(
                      cdsFerragensDeletados,
                      cdsPedidoFerragens.fieldbyname('ID').AsInteger,
                      cdsPedidoFerragens.fieldbyname('PRODUTO_ID').AsInteger,
                      cdsPedidoFerragens.fieldbyname('QUANTIDADE').AsInteger
                      );

     p_pedido_alterado := true;

  end;

  {deleta na grid de Itens de laje H8}
  cdsPedidoFerragens.Delete;

  {somar valores dos ferros negativos}
  SomarFerroNegativo;

  SomarReforcoViga;
  SomarValorProdutos;

  {volta pra pagina de ferragem}
  pgc_principal.ActivePage := tbs_ferragens;

end;

procedure TfrmPedidosE.pmAlterarVigaClick(Sender: TObject);
begin
  inherited;
  EditarItemLaje(cdsItensLaje);
end;

procedure TfrmPedidosE.pmAlterarFerroNegativoClick(Sender: TObject);
begin
  inherited;
  {edita ferragen no cds}
  EditarFerragem(cdsPedidoFerragens, 'PEDIDOS_ITENS');

  SomarFerroNegativo;
  SomarValorProdutos;

  {volta pra pagina de ferragem}
  pgc_principal.ActivePage := tbs_ferragens;

end;

procedure TfrmPedidosE.pmExcluirItemPedidoClick(Sender: TObject);
begin
  inherited;
  ExcluirItemPedido;

end;

procedure TfrmPedidosE.ExcluirItemPedido;
begin
  {itens diferente de laje, ferragem e viga}
  if ((cdsPedidoItens.fieldbyname('LAJE').AsString = 'N') and
      (cdsPedidoItens.fieldbyname('NEGATIVO_DE_LAJE').AsString = 'N') and
      (cdsPedidoItens.fieldbyname('VIGA').AsString = 'N')) then
  begin
    if Application.MessageBox('Deseja excluir este item do pedido', 'Confirmação',MB_OKCANCEL) = mrOk then
    begin
      {se tiver alguma coisa no grid e estiver no banco de dados deleta}
      if cdsPedidoItens.FieldByName('ID').AsInteger > 0 then
        {inclui na lista de deletados}
        ProdutosDeletados(
                          cdsPedidoItensDeletados,
                          cdsPedidoItens.fieldbyname('ID').AsInteger,
                          cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger,
                          cdsPedidoItens.fieldbyname('QTDE').AsFloat
                          );
      cdsPedidoItens.Delete;

      SomarValorProdutos;
    end;
    exit;

    p_pedido_alterado := true;
   end;

  {verifica se o item é uma laje, se for excluir tambem os itens da laje}
  if cdsPedidoItens.fieldbyname('LAJE').AsString = 'S' then
  begin
    if Application.MessageBox('Os itens dessa laje serão excluidos automaticamente', 'Confirmação',MB_OKCANCEL) = mrOk then
    begin

      {inclui a laje no cdsDeletados}
      if cdsPedidoItens.FieldByName('ID').AsInteger > 0 then
        {inclui na lista de deletados}
        ProdutosDeletados(
                          cdsPedidoItensDeletados,
                          cdsPedidoItens.fieldbyname('ID').AsInteger,
                          cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger,
                          cdsPedidoItens.fieldbyname('QTDE').AsFloat
                          );

      {filtra os itens da laje selecionada}
      filtrarVigas( cdsItensLaje, codigo, p_item_pedido );
      //ShowMessage('EXCLUIR : ' + IntToStr(cdsItensLajeH8.RecordCount));
      {exclui os itens correspondentes}
      ExcluirItensLaje(cdsItensLaje,cdsItensLajeDeletados);

      {deleta na grig de Produtos e servicos}
      cdsPedidoItens.Delete;
      SomarValorProdutos;

    end; // fim mensagem excluir laje
    exit;
  end;


  {verifica se o item é uma laje, se for excluir tambem os itens da laje}
  if cdsPedidoItens.fieldbyname('NEGATIVO_DE_LAJE').AsString = 'S' then
  begin
    if Application.MessageBox('Os itens de ferragens serão excluidos automaticamente','Confirme',MB_OKCANCEL) = mrOk then
    begin
      {se tiver alguma coisa no grid e estiver no banco de dados deleta}
      if cdsPedidoItens.FieldByName('ID').AsInteger > 0 then
        {inclui na lista de deletados}
        ProdutosDeletados(
                          cdsPedidoItensDeletados,
                          cdsPedidoItens.fieldbyname('ID').AsInteger,
                          cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger,
                          cdsPedidoItens.fieldbyname('QTDE').AsFloat
                          );

      {itens}
      prc_filtrar_ferragens('PEDIDOS_ITENS', cdsPedidoItens.FieldByName('ID').AsInteger);

      if not cdsPedidoFerragens.IsEmpty then
      begin
        cdsPedidoFerragens.First;
        while not cdsPedidoFerragens.eof do
        begin
          {se tiver alguma coisa no grid e estiver no banco de dados inclui para a exclusão, se maior que zero esta no banco}
          if cdsPedidoFerragens.FieldByName('ID').AsInteger > 0 then
            {inclui na lista de deletados para deletar c quando confirmar}
            ProdutosDeletados(
                              cdsFerragensDeletados,
                              cdsPedidoFerragens.fieldbyname('ID').AsInteger,
                              cdsPedidoFerragens.fieldbyname('PRODUTO_ID').AsInteger,
                              cdsPedidoFerragens.fieldbyname('QUANTIDADE').AsInteger
                              );

          {deleta na grig de FERRAGENS}
          cdsPedidoFerragens.Delete;

        end;
      end;
      {deleta na grig de Produtos e servicos}
      cdsPedidoItens.Delete;
      SomarValorProdutos;
    end;// fim mensagem excluir negativo
    exit;
  end;

  if cdsPedidoItens.fieldbyname('VIGA').AsString = 'S' then
  begin
    if cdsPedidoItens.FieldByName('ID').AsInteger > 0 then
      {inclui na lista de deletados}
      ProdutosDeletados(
                        cdsPedidoItensDeletados,
                        cdsPedidoItens.fieldbyname('ID').AsInteger,
                        cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger,
                        cdsPedidoItens.fieldbyname('QTDE').AsFloat
                        );

    {ve se tem adcional}
    prc_filtrar_ferragens('PEDIDOS_ITENS', cdsPedidoItens.FieldByName('ID').AsInteger);

    if not cdsPedidoFerragens.IsEmpty then
    begin
      cdsPedidoFerragens.First;
      while not cdsPedidoFerragens.eof do
      begin
        {se tiver alguma coisa no grid e estiver no banco de dados inclui para a
         exclusão, se maior que zero esta no banco}
        if cdsPedidoFerragens.FieldByName('ID').AsInteger > 0 then
          {inclui na lista de deletados para deletar c quando confirmar}
          ProdutosDeletados(
                            cdsFerragensDeletados,
                            cdsPedidoFerragens.fieldbyname('ID').AsInteger,
                            cdsPedidoFerragens.fieldbyname('PRODUTO_ID').AsInteger,
                            cdsPedidoFerragens.fieldbyname('QUANTIDADE').AsInteger
                            );

        {deleta na grig de FERRAGENS}
        cdsPedidoFerragens.Delete;

      end;
    end;
    {deleta na grig de Produtos e servicos}
    cdsPedidoItens.Delete;
    SomarValorProdutos;

  end;
end;

procedure TfrmPedidosE.ExcluirItensLaje(cdsItensLaje, cdsItensLajeDeletados: TFDMemTable);
begin
  {inclui itens de uma laje(vigas e lajotas/isopor) no cds de deletados,
  que serão excluidos após confirmacao do pedido}

  cdsItensLaje.First;
  if not cdsItensLaje.IsEmpty then
  begin
    while not cdsItensLaje.eof do
    begin
      {se tiver alguma coisa no grid e estiver no banco de dados inclui para a exclusão, se maior que zero esta no banco}
      if cdsItensLaje.FieldByName('ID').AsInteger > 0 then
        {inclui na lista de deletados para deletar c quando confirmar}
        ProdutosDeletados(
                          cdsItensLajeDeletados,
                          cdsItensLaje.fieldbyname('ID').AsInteger,
                          cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger,
                          cdsItensLaje.fieldbyname('QTDE').AsFloat
                          );

       {ver se tem adicional na viga}
       prc_filtrar_ferragens( 'PEDIDOS_ITENS_LAJE', cdsItensLaje.FieldByName('ID').AsInteger );

       if not cdsPedidoFerragens.IsEmpty then
       begin

         cdsPedidoFerragens.First;
         while not cdsPedidoFerragens.Eof do
         begin
           {inclui a Ferragem na lista de deletados}
           if cdsPedidoFerragens.FieldByName('ID').AsInteger > 0 then
           begin
             ProdutosDeletados(
                              cdsFerragensDeletados,
                              cdsPedidoFerragens.fieldbyname('ID').AsInteger,
                              cdsPedidoFerragens.fieldbyname('PRODUTO_ID').AsInteger,
                              cdsPedidoFerragens.fieldbyname('QUANTIDADE').AsInteger
                              );
           end;

          cdsPedidoFerragens.Delete;
         end;


       end; // if not cdsPedidoFerragens.IsEmpty then
      {deleta na grig de Produtos e servicos}
      cdsItensLaje.Delete;
    end; // while not cdsItensLaje.eof do
  end; //  if not cdsItensLaje.IsEmpty then

end;


procedure TfrmPedidosE.ExcluirReforcoAdicionalClick(Sender: TObject);
var
  marcar_posicao_item_laje : integer;
  marcar_posicao_item_pedido : integer;
  e_viga : boolean;

begin
  inherited;
  showmessage('ExcluirReforcoAdicionalClick');
  if cdsPedidoFerragens.IsEmpty then exit;

  if Application.MessageBox('Deseja excluir o registro', 'Confirmação',MB_YESNO) = mrNo then exit;

  marcar_posicao_item_laje   := cdsItensLaje.FieldByName('id').AsInteger;
  marcar_posicao_item_pedido := cdsPedidoItens.FieldByName('id').AsInteger;

  {item do pedido é uma viga extra?}
  e_viga := cdsPedidoItens.FieldByName('VIGA').AsString = 'S';

  {se tiver alguma coisa no grid com id maior que zero
  inclui no cdsExclusao apos confirmação}

  {inclui a Ferragem na lista de deletados}
  if cdsPedidoFerragens.FieldByName('ID').AsInteger > 0 then
  begin
    ProdutosDeletados(
                      cdsFerragensDeletados,
                      cdsPedidoFerragens.fieldbyname('ID').AsInteger,
                      cdsPedidoFerragens.fieldbyname('PRODUTO_ID').AsInteger,
                      cdsPedidoFerragens.fieldbyname('QUANTIDADE').AsInteger
                      );
  end;

  {deleta na grid de Itens de laje H8}
  cdsPedidoFerragens.Delete;

  {somar valores dos ferros negativos}
  SomarReforcoViga;
  SomarValorProdutos;

  // para evitar a perca do link
  // não é uma viga extra.
  if e_viga = false then
  begin
    // volta pra posição depois da alteração
    cdsitenslaje.First;
    cdsitenslaje.Locate('id',marcar_posicao_item_laje,[]);
    // volta pra posição depois da alteração

    cdsPedidoItens.First;
    cdsPedidoItens.Locate('id',marcar_posicao_item_pedido,[]);

    tbs_itens_laje.Show;
  end
  else
  begin
    // itens de pedido
    cdsPedidoItens.First;
    cdsPedidoItens.Locate('id',marcar_posicao_item_pedido,[]);
    tbs_itens_pedido.Show;
  end;


end;

procedure TfrmPedidosE.ExcluirViga(cdsItensLaje, cdsItensLajeDeletados :TFDMemTable);
begin

  {inclui a viga na lista de deletados}
  if cdsItensLaje.FieldByName('ID').AsInteger > 0 then
  begin
    ProdutosDeletados(
                      cdsItensLajeDeletados,
                      cdsItensLaje.fieldbyname('ID').AsInteger,
                      cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger,
                      cdsItensLaje.fieldbyname('QTDE').AsFloat
                      );

    {ver se tem adicional na viga}
    prc_filtrar_ferragens( 'PEDIDOS_ITENS_LAJE', cdsItensLaje.FieldByName('ID').AsInteger );

    if not cdsPedidoFerragens.IsEmpty then
    begin

      cdsPedidoFerragens.First;
      while not cdsPedidoFerragens.Eof do
      begin
        cdsPedidoFerragens.First;
        {inclui a Ferragem na lista de deletados}
        if cdsPedidoFerragens.FieldByName('ID').AsInteger > 0 then
        begin
          ProdutosDeletados(
                            cdsFerragensDeletados,
                            cdsPedidoFerragens.fieldbyname('ID').AsInteger,
                            cdsPedidoFerragens.fieldbyname('PRODUTO_ID').AsInteger,
                            cdsPedidoFerragens.fieldbyname('QUANTIDADE').AsInteger
                            );
        end;

        //cdsPedidoFerragens.Next;
        cdsPedidoFerragens.delete;
      end;

    end;

    p_pedido_alterado := true;

  end;
  {deleta na grid de Itens de laje H8}
  cdsItensLaje.Delete;

  {recalcular pnl resumo de laje}
  prc_totais_laje( codigo, p_item_pedido );

end;


procedure TfrmPedidosE.pmExcluirVigaClick(Sender: TObject);
begin
  inherited;
  ExcluirViga(cdsItensLaje, cdsItensLajeDeletados );

end;

function TfrmPedidosE.openQryAux(sql, parametro:string): Integer;
begin
  result := 0;

  qryAux.close;
  qryaux.SQL.Clear;
  qryAux.SQL.Add(sql);
  qryAux.Params[0].Value := parametro;
  qryAux.Open;
  //
  Result := qryAux.RecordCount;
end;

procedure TfrmPedidosE.ProdutosDeletados(cds: TFDMemTable; ID, Produto: integer; Quantidade: Double);
begin
   cds.Insert;
   cds.FieldByName('ID'        ).AsInteger := ID;
   cds.FieldByName('PRODUTO'   ).AsInteger := Produto;
   cds.FieldByName('QUANTIDADE').AsFloat   := Quantidade;
   cds.Post;

end;


procedure TfrmPedidosE.rgFreteClick(Sender: TObject);
begin
  inherited;

  p_frete_por_conta := rg_frete.ItemIndex;

end;




procedure TfrmPedidosE.rg_freteClick(Sender: TObject);
begin
  inherited;
  p_frete_por_conta := rg_frete.ItemIndex;
end;

procedure TfrmPedidosE.btnFecharClick(Sender: TObject);
begin
  //inherited;

end;

procedure TfrmPedidosE.btnNovoClienteClick(Sender: TObject);
begin
  inherited;
  ufrmClientesE.Incluir;

end;

procedure TfrmPedidosE.btnOkClick(Sender: TObject);
begin
  //inherited;
  prc_salvar;
end;

procedure TfrmPedidosE.btn_alterar_obsClick(Sender: TObject);
begin
  inherited;
  mm_obs_comissao.Lines.Add( ufrmComissoesE.Alterar( Codigo ) );
end;

procedure TfrmPedidosE.cbxTransportadorasCloseUp(Sender: TObject);
begin
  inherited;

  p_transportadora_id := cbxTransportadoras.KeyValue;
  edt_transportadora_id.Caption := inttostr( p_transportadora_id );

end;

procedure TfrmPedidosE.cbxVendedoresCloseUp(Sender: TObject);
begin
  inherited;
  p_vendedor_id       := cbxVendedores.KeyValue;
  p_comissao_vendedor := qryVendedores.FieldByName('COMISSAO_VENDEDOR').AsFloat;
  p_comissao_adm      := qryVendedores.FieldByName('COMISSAO_ADM').AsFloat;

  lbl_vendedor_id.Caption := inttostr( p_vendedor_id );
  (*
  ShowMessage('com vend ' + floattostr(p_comissao_vendedor) + sLineBreak +
              'com adm ' + floattostr(p_comissao_adm));
  *)
 prc_atualizar_Painel_comissao_triunfo;


end;

procedure TfrmPedidosE.cb_orcamentoClick(Sender: TObject);
begin
  inherited;
  if cb_orcamento.Checked then
  begin
    pnTitulo.Color := $001B8D3D;
  end else
  if not cb_orcamento.Checked then
  begin
    pnTitulo.Color := $00E1E1E1;
  end;
end;

procedure TfrmPedidosE.cdsPedidoFerragensNewRecord(DataSet: TDataSet);
begin
  inherited;
  formataFloat(DataSet);
end;

procedure TfrmPedidosE.cdsPedidoItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  cdsPedidoItens.FieldByName('SUB_TOTAL').AsCurrency := cdsPedidoItens.FieldByName('QTDE').AsFloat * cdsPedidoItens.FieldByName('VENDA').AsCurrency;
end;

procedure TfrmPedidosE.formataFloat(DataSet: TDataSet);
begin
  (DataSet.Fields.FieldByName('CORPO'       ) as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('DOBRA_INI'   ) as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('DOBRA_FIM'   ) as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('COMPRIMENTO' ) as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('TOTAL_LINEAR') as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('PRECO_CUSTO' ) as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('PRECO_VENDA' ) as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('TOT_CUSTO'   ) as TFloatField).DisplayFormat := '#0.00';
  (DataSet.Fields.FieldByName('TOT_VENDA'   ) as TFloatField).DisplayFormat := '#0.00';
end;

procedure TfrmPedidosE.Componentes;
begin

  qry_sistema.Connection := conexao;
  //qry_sistema.Open('select * from CONFIGURACOES_SISTEMA');
  qry_sistema.SQL.Clear;
  qry_sistema.SQL.Add('select ');
  qry_sistema.SQL.Add('ID, ');
  qry_sistema.SQL.Add('GERAL_EMPRESA, ');
  qry_sistema.SQL.Add('PEDIDO_CONTA_COMISSAO_VEND, ');
  qry_sistema.SQL.Add('PEDIDO_CONTA_COMISSAO_ADM, ');
  qry_sistema.SQL.Add('PEDIDO_RELATORIOS_LOGO_PEDIDO, ');
  qry_sistema.SQL.Add('PEDIDO_OUTROS_MOSTRA_ID_PEDIDO, ');
  qry_sistema.SQL.Add('CUSTOS_PERC_VENDEDOR, ');
  qry_sistema.SQL.Add('CUSTOS_PERC_BALCAO, ');
  qry_sistema.SQL.Add('PEDIDO_OUTROS_FORMA_PGTO, ');
  qry_sistema.SQL.Add('EIXO_LAJE, ');
  qry_sistema.SQL.Add('GERAL_QTDE_FORMA_130, ');
  qry_sistema.SQL.Add('GERAL_QTDE_FORMA_250, ');
  qry_sistema.SQL.Add('GERAL_LIBERAR_SISTEMA, ');
  qry_sistema.SQL.Add('PED_REL_MOSTRAR_BTN_CONTRATO, ');
  qry_sistema.SQL.Add('PED_REL_MOSTRAR_BTN_COMISSAO, ');
  qry_sistema.SQL.Add('PEDIDO_MOSTRAR_ABA_FINANCEIRO, ');
  qry_sistema.SQL.Add('PEDIDO_CALCULAR_LAJE_POR_VIGA, ');
  qry_sistema.SQL.Add('PEDIDO_CONCRETO_USINADO, ');
  qry_sistema.SQL.Add('PEDIDO_BOMBA_CONCRETO, ');
  qry_sistema.SQL.Add('PED_REL_MOSTRAR_QTDE_LAJE, ');
  qry_sistema.SQL.Add('PED_REL_MOSTRAR_CABECALHO, ');
  qry_sistema.SQL.Add('PED_REL_MOSTRAR_CABECALHO_PED, ');
  qry_sistema.SQL.Add('PEDIDO_COLUNA_PRECO_VEND ');
  qry_sistema.SQL.Add('from CONFIGURACOES_SISTEMA');
  qry_sistema.Open;



  p_empresa   := qry_sistema.FieldByName('GERAL_EMPRESA').AsString;
  p_eixo_laje := qry_sistema.FieldByName('EIXO_LAJE').AsInteger/1000;

  gbReforcosVigas.Height := 180 ;
  gbReforcosVigas.Width  := 638 ;
  gbReforcosVigas.Left   := 390;
  gbReforcosVigas.TOP    := 300 ;

  pgc_principal.TabIndex := 0;
  pcVenda.TabIndex       := 0;
  pcCliente.TabIndex     := 0;

  {aba itens da venda}
  dbg_itens_venda.Columns[0].Visible := false;  // id itens pedido
  dbg_itens_venda.Columns[1].Visible := false;  // número do pedido
  dbg_itens_venda.Columns[2].Visible := true;   // item
  dbg_itens_venda.Columns[3].Visible := false;  // produto_id
  dbg_itens_venda.Columns[4].Visible := true;   // descricao
  dbg_itens_venda.Columns[5].Visible := true;   // qtde
  dbg_itens_venda.Columns[6].Visible := true;   // preco de custo
  dbg_itens_venda.Columns[7].Visible := true;   // venda
  dbg_itens_venda.Columns[8].Visible := true;   // sub_total
  dbg_itens_venda.Columns[9].Visible := true;   // nivel
  dbg_itens_venda.Columns[10].Visible := true;  // local
  dbg_itens_venda.Columns[11].Visible := true;  // situacao
  dbg_itens_venda.Columns[12].Visible := false; // adiciona_de_viga
  dbg_itens_venda.Columns[13].Visible := false; // revenda
  dbg_itens_venda.Columns[14].Visible := false; // laje
  dbg_itens_venda.Columns[15].Visible := false; // viga
  dbg_itens_venda.Columns[16].Visible := false; // lajota
  dbg_itens_venda.Columns[17].Visible := false; // isopor
  dbg_itens_venda.Columns[18].Visible := false; // vergalhão
  dbg_itens_venda.Columns[19].Visible := FALSE;  // concreto
  dbg_itens_venda.Columns[20].Visible := false; // bomba
  dbg_itens_venda.Columns[21].Visible := false; // negativo_de_laje
  dbg_itens_venda.Columns[22].Visible := false; // reforco_de_viga
  dbg_itens_venda.Columns[23].Visible := FALSE;  // qtde_de_vigas
  dbg_itens_venda.Columns[24].Visible := FALSE;  // qtde_real_laje
  dbg_itens_venda.Columns[25].Visible := false; // custo_vendedor
  dbg_itens_venda.Columns[26].Visible := false; // estoque_controlado
  dbg_itens_venda.Columns[27].Visible := true; // data_entrega

  {aba itens de laje h8}
  dbg_itens_laje.Columns[0].Visible := false; // id itens pedido
  dbg_itens_laje.Columns[1].Visible := false; // número do pedido
  dbg_itens_laje.Columns[2].Visible := true;  // item da venda
  dbg_itens_laje.Columns[3].Visible := false; // id produto
  dbg_itens_laje.Columns[4].Visible := true;  // descricao
  dbg_itens_laje.Columns[5].Visible := true;  // qtde
  dbg_itens_laje.Columns[6].Visible := TRUE; // custo
  dbg_itens_laje.Columns[7].Visible := false; // nivel
  dbg_itens_laje.Columns[8].Visible := true;  // local
  dbg_itens_laje.Columns[9].Visible := TRUE;  // situacao


  dbg_reforco_viga.Columns[0].Visible  := false;  // id
  dbg_reforco_viga.Columns[1].Visible  := false;  // id_tabela
  dbg_reforco_viga.Columns[2].Visible  := false;  // produto_id
  dbg_reforco_viga.Columns[4].Visible  := false;  // qtde_vigas
  dbg_reforco_viga.Columns[10].Visible := false;  // preco_custo
  dbg_reforco_viga.Columns[11].Visible := false;  // preco_venda
  dbg_reforco_viga.Columns[13].Visible := false;  // tot_custo
  dbg_reforco_viga.Columns[14].Visible := false;  // tot_venda

  dbg_reforcos_das_vigas.Columns[0].Visible := false; // id
  dbg_reforcos_das_vigas.Columns[1].Visible := false; // pedido_id
  dbg_reforcos_das_vigas.Columns[3].Visible := false; // tabela
  dbg_reforcos_das_vigas.Columns[4].Visible := false; // id_tabela
  dbg_reforcos_das_vigas.Columns[5].Visible := false; // produto_id
  dbg_reforcos_das_vigas.Columns[6].Visible := true;  // descricao

  dbg_Ferragens.Columns[0].Visible  := false;  // id
  dbg_Ferragens.Columns[1].Visible  := false;  // pedido_id
  dbg_Ferragens.Columns[2].Visible  := true;   // pedido item
  dbg_Ferragens.Columns[3].Visible  := false;  // tabela
  dbg_Ferragens.Columns[4].Visible  := false;  // id_tabela
  dbg_Ferragens.Columns[5].Visible  := false;  // produto_id
  dbg_Ferragens.Columns[13].Visible := false;  // qtde_vigas

  tbs_itens_laje.TabVisible       := false;
  tbs_ferragens.TabVisible        := false;
  tbsFrete.TabVisible             := false;
  tbsImpostos.TabVisible          := false;
  tbs_financeiro.TabVisible       := qry_sistema.FieldByName('PEDIDO_MOSTRAR_ABA_FINANCEIRO').AsString ='S';
  dbg_itens_venda.Columns[6].Visible := qry_sistema.FieldByName('PEDIDO_COLUNA_PRECO_VEND').AsString ='S';
  tbs_contas_pagar.TabVisible     := true;
  //tbs_recibos.TabVisible        := true;
  tbs_contas_receber.TabVisible   := true;
  tbs_reforco_viga.TabVisible     := False;
  tbs_concreto.TabVisible := false ;

  {ordenar o lista de itens do pedido sempre pelo numero do item}
  cdsPedidoItens.IndexFieldNames := 'ITEM';

  {ordenar o lista de itens da laje sempre pelo numero do id}
  cdsItensLaje.IndexFieldNames  := 'ID';

  //
  qryLocalEntrega.Open();
  qryVendedores.Open();
  qryFormaPagto.Open();
  qryFornecedor.Open();
  qryBombas.Open();
  qryPrestadorServico.Open;
  {tabela de pedidos}
  qry.Open('select * from '+ p_tabela +' where ID = :ID');
  qryPedidoItens.Open('select * from PEDIDOS_ITENS where PEDIDO_ID = :ID');
  qryGravaPedidoItens.Open('select * from PEDIDOS_ITENS where ID = :ID');
  qryGravaFerragens.Open('select * from PEDIDOS_FERRAGENS where ID = :ID');
  qryGravaItensLaje.Open('select * from PEDIDOS_ITENS_LAJE where ID = :ID');
  qry_comissao_despesas.Connection := self.Conexao;
  qry_comissao_despesas.SQL.Clear;

  with qry_comissao_despesas.SQL do
  begin

    add('select                  ');
    add('  ID,                   ');
    add('  DATA_CONTABIL,        ');
    add('  HISTORICO,            ');
    add('  DEBITO_CREDITO,       ');
    add('  VALOR                 ');
    add('from                    ');
    add('  COMISSAO_DESPESAS     ');
    add('where                   ');
    add('  PEDIDO_ID = :PEDIDO_ID');

  end;

  qryComissoes.close;
  qryComissoes.SQL.Clear;
  qryComissoes.SQL.Add('select ID, CADASTRADO_EM, ALTERADO_EM, DATA_CONTABIL, PEDIDO_ID, VENDEDOR_ID, ');
  qryComissoes.SQL.Add('USUARIO_ID, TOTAL_VENDA, TOTAL_CUSTO, COMISSAO_ADM_TAXA, COMISSAO_ADM, COMISSAO_BRUTA, COMISSAO_LIQUIDA, VALOR_PAGO, DATA_PAGTO, STATUS, HISTORICO, OUTRAS_DESPESAS from COMISSAO where PEDIDO_ID =:PEDIDO_ID');

  qry_recibos.Connection := Conexao;
  qry_recibos.SQL.Clear;
  //qry_recibos.SQL.Add('select * from PEDIDOS_PAGAMENTOS where PEDIDO_ID =:PEDIDO_ID');
  //

  //qry_recibos.SQL.Add('SELECT I.* FROM contas_receber R, contas_receber_baixa I, pedidos P ');
  qry_recibos.SQL.Add('select                                                ');
  qry_recibos.SQL.Add(' I.ID, I.CADASTRADO_EM, I.ALTERADO_EM, I.CONTAS_RECEBER_ID, I.RECIBO_ID, I.PESSOA_ID, I.HISTORICO, I.VALOR, USUARIO_ID ');
  qry_recibos.SQL.Add('from                                                  ');
  qry_recibos.SQL.Add('  contas_receber R, contas_receber_baixa I, pedidos P ');
  qry_recibos.SQL.Add('WHERE                                                 ');
  qry_recibos.SQL.Add('  R.id = I.contas_receber_id and r.tabela_origem = ' + quotedstr('PEDIDOS') );
  qry_recibos.SQL.Add('  and r.id_origem = P.ID and P.id = :PEDIDO_ID        ');
  //
  qry_fornecedor_concreto.Open;
  qry_prestador_servico.Open;
  qry_tipo_bomba.open;
  dtp_executacao_concreto.DateTime := date;

  {edit comissão do vendedor na tela de pedidosE}
  {o edt_comissao_vendedor na tela de pedidos só será visivel se o
  botão comissão da tela de impressaõ estiver oculto, se o botão imprimir
  comissao estiver visivel é pq a lajes triunfo que esta usando o sistema,
  então quando eu for gerar o contas a pagar das comissões se for triunfo guardo
  o valor calculado pelo sistema, senão guardo o valor digitado pelo usuario na
   tela de pedidos }
  edt_comissao_vendedor_informada.Visible := qry_sistema.FieldByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString = 'N';
  lbl_comissao_vendedor_informada.Visible := qry_sistema.FieldByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString = 'N';
end;

procedure TfrmPedidosE.FormActivate(Sender: TObject);
begin
  inherited;
  {coloca o ponteiro no primeiro registro do cdsItensPedidos, para atualizar o cdsferragens}
  cdsPedidoItens.First;

  dbg_itens_venda.SetFocus;

  if (( Operacao = OpIncluir ) and ( p_vendedor_id = -1 ) )then
    {chama a tela de clientes}
    btnBuscaClienteClick(self)

end;

procedure TfrmPedidosE.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  //form_principal.prc_controla_menu(true);
  //freeandnil ( loForm );

end;

procedure TfrmPedidosE.FormCreate(Sender: TObject);
begin

  inherited;
  i :=  0; // var usada para inclusao de um novo concreto utilizado
  p_executar_dataChange_ds_pedidoItes  := true;

  qryAux.Connection:= self.Conexao;

  qryClientes.Connection         := Self.Conexao;
  qryVendedores.Connection       := Self.Conexao;
  qryLocalEntrega.Connection     := Self.Conexao;
  qryFormaPagto.Connection       := Self.Conexao;
  qryTransportadoras.Connection  := Self.Conexao;
  qryPrestadorServico.Connection := Self .Conexao;
  qryTotalLaje.Connection        := self.conexao;

  {cabeça do pedido}
  qry.Connection                 := Self.Conexao;
  qryPedidoItens.Connection      := Self.Conexao;
  qryGravaPedidoItens.Connection := Self.Conexao;

  qryGravaFerragens.Connection := self.Conexao;
  qryFornecedor.Connection     := self.Conexao;
  qryBombas.Connection         := Self.Conexao;
  qryComissoes.Connection      := self.Conexao;

  {Itens de laje H8}
  qryGravaItensLaje.Connection := Self.Conexao;
  {financeiro}
  qryContasReceber.Connection  := Self.Conexao;
  qry_contas_pagar.Connection  := Self.Conexao;

  p_tabela := 'PEDIDOS';

//  ShowMessage('criar cds');

  CriarTabelaTemporaria(cdsPedidoItens);
  CriarCdsAdicionais(cdsPedidoFerragens);
  CriarTabelaTemporariaItensLaje(cdsItensLaje);

  {controla a saida do formulario }
  p_pedido_alterado := false;

end;

procedure TfrmPedidosE.FormShow(Sender: TObject);
begin
  inherited;

  Componentes;
  Inicializar;

end;

procedure TfrmPedidosE.gbReforcosVigasMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  Capturing       := true;
  MouseDownSpot.X := x;
  MouseDownSpot.Y := Y;
end;

procedure TfrmPedidosE.gbReforcosVigasMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Capturing then
   begin
    gbReforcosVigas.Left := gbReforcosVigas.Left-(MouseDownSpot.x-x);
    gbReforcosVigas.Top  := gbReforcosVigas.Top - (MouseDownSpot.y-y);
  end;
end;

procedure TfrmPedidosE.gbReforcosVigasMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
 if Capturing then begin
   Capturing := false;
   gbReforcosVigas.Left := gbReforcosVigas.Left - (MouseDownSpot.x -x);
   gbReforcosVigas.Top  := gbReforcosVigas.Top - (MouseDownSpot.y - y);
 end;
end;

procedure TfrmPedidosE.pmIncluirFerroNegativoClick(Sender: TObject);
begin
  inherited;

 // ShowMessage('ped item ' + inttostr(p_item_pedido));

  {Chama o form de cadastro de ferragem}
  if frmPedididosFerragensE = nil  then
  begin
    try
      frmPedididosFerragensE := TfrmPedididosFerragensE.Create(self);
      frmPedididosFerragensE.operacao := utipos.OpIncluir;
      {não ha a necesidade de marcar a posição de ferragem avulsa}
      frmPedididosFerragensE.lbPosicao.Visible := False;
      frmPedididosFerragensE.cbxPosicao.Visible := False;

      frmPedididosFerragensE.ShowModal;
      {se confirmado adiciona da grid}
      if frmPedididosFerragensE.confirmado then
      begin
        //ShowMessage('ID PEDIDO ITENS ' + cdsPedidoItens.FieldByName('id').AsString);
        //ShowMessage(FLOATTOSTR(frmPedididosFerragensE.dobraInicio+frmPedididosFerragensE.dobraInicio));
        AddFerragem( false,
                     cdsPedidoFerragens,
                     OpIncluir,
                     -1,
                     Codigo,
                     p_item_pedido,
                     'PEDIDOS_ITENS',
                     cdsPedidoItens.FieldByName('id').AsInteger, // ???nesse caso aqui de ferragem este parametro não serve pra nada, só para aaproveirar a procedure mesmo
                     frmPedididosFerragensE.idProduto,
                     frmPedididosFerragensE.descricao,
                     frmPedididosFerragensE.dobraInicio,
                     frmPedididosFerragensE.corpo,
                     frmPedididosFerragensE.dobraFim,
                     1,
                     frmPedididosFerragensE.quantidade,
                     //frmPedididosFerragensE.custoFornecedor,// preco fornecedor
                     frmPedididosFerragensE.custoMetro,     // preco liquido
                     frmPedididosFerragensE.vendaMetro,
                     ubiblioteca.SeSenao((frmPedididosFerragensE.dobraInicio+frmPedididosFerragensE.dobraFim) > 0,'','Barra RETA')
                     );


        {totaliza na venda - adiciona/altera no cdsPedidoItens}
        cdsPedidoItens.First;
        if cdsPedidoItens.Locate('NEGATIVO_DE_LAJE','S',[]) = true then
        begin
          {se localizar}
          cdsPedidoItens.Edit;
          cdsPedidoItens.FieldByName('QTDE').AsFloat := 1;
          cdsPedidoItens.FieldByName('CUSTO').AsFloat := SomarValorCustoFerragem;
          cdsPedidoItens.FieldByName('VENDA').AsFloat := SomarValorVendaFerragem;
          cdsPedidoItens.Post;
        end
        else
        begin
          CriarMensagem('AVISO','item não encontrado para alteração');
        end;

        SomarFerroNegativo;
        SomarValorProdutos;


        {volta pra pagina de ferragem}
        pgc_principal.ActivePage := tbs_ferragens;

        p_pedido_alterado := true;

      end;// if confirmado
    finally
      FreeAndNil(frmPedididosFerragensE);
    end;
  end;

end;


procedure TfrmPedidosE.EditarFerragem(cds: TFDMemTable; nmTabela: string);
var
 posicao: string;
begin
  inherited;
  if frmPedididosFerragensE = nil then
  begin
    try

     {edita do cds pra tela}
      frmPedididosFerragensE := TfrmPedididosFerragensE.Create(self);

      frmPedididosFerragensE.operacao    := uTipos.opAlterar;
      frmPedididosFerragensE.Caption     := 'Alterar Item';
      frmPedididosFerragensE.idProduto   := cds.FieldByName('PRODUTO_ID').AsInteger;
      frmPedididosFerragensE.quantidade  := cds.FieldByName('QUANTIDADE').AsInteger;
      frmPedididosFerragensE.corpo       := cds.FieldByName('CORPO').AsFloat;
      frmPedididosFerragensE.dobraInicio := cds.FieldByName('DOBRA_INI').AsFloat;
      frmPedididosFerragensE.dobraFim    := cds.FieldByName('DOBRA_FIM').AsFloat;
      frmPedididosFerragensE.custoMetro  := cds.FieldByName('PRECO_CUSTO').AsFloat;
      frmPedididosFerragensE.vendaMetro  := cds.FieldByName('PRECO_VENDA').AsFloat;
      frmPedididosFerragensE.Posicao     := cds.FieldByName('POSICAO').AsString;

      //ShowMessage(cds.Name);

      frmPedididosFerragensE.ShowModal;


      {se confirmado adiciona da grid}
      if frmPedididosFerragensE.confirmado then
      begin
       // ShowMessage('EDITANDO QTDE DE VIGAS ' + cds.FieldByName('QTDE_VIGAS').AsString);
        {não ha a necesidade de marcar a posição de ferragem avulsa}
        if cds.Name = 'cdsPedidoFerragens' then
        begin
          frmPedididosFerragensE.lbPosicao.Visible  := False;
          frmPedididosFerragensE.cbxPosicao.Visible := False;
          if (frmPedididosFerragensE.dobraInicio+frmPedididosFerragensE.dobraFim) > 0 then
           posicao := frmPedididosFerragensE.Posicao
          else
           posicao := 'Barra RETA';
        end;

        //ShowMessage('Tabela : ' + nmTabela);
        AddFerragem( uBiblioteca.SeSenao( nmTabela = 'PEDIDOS_ITENS', false, true), // alterei para false em 28/02
                     cds,
                     opAlterar,
                     cdsPedidoFerragens.FieldByName('ID').AsInteger,
                     Codigo, // N. Pedido
                     p_item_pedido,
                     nmTabela,
                     cdsPedidoItens.FieldByName('ID').AsInteger,
                     frmPedididosFerragensE.idProduto,
                     frmPedididosFerragensE.descricao,
                     frmPedididosFerragensE.dobraInicio,
                     frmPedididosFerragensE.corpo,
                     frmPedididosFerragensE.dobraFim,
                     cdsItensLaje.FieldByName('QTDE').AsInteger ,
                     frmPedididosFerragensE.quantidade,
                     //frmPedididosFerragensE.custoFornecedor,
                     frmPedididosFerragensE.custoMetro,
                     frmPedididosFerragensE.vendaMetro,
                     posicao
                     );


      end;// fim pedido confirmado

      p_pedido_alterado := true;

    finally

      //ShowMessage('Tabela : ' + nmTabela);

      {somar valores dos ferros negativos}
      if nmTabela = 'PEDIDOS_ITENS' then
        SomarFerroNegativo
      else
        SomarReforcoViga;

      freeandnil(frmPedididosFerragensE);

    end;// try
  end;// fim form = nil
end;

procedure TfrmPedidosE.SomarFerroNegativo;
var
  totCusto, totVenda: double;
begin
  {recalcula os totais no itens do pedido - adiciona/altera no cdsPedidoItens}
  cdsPedidoItens.First;
  if cdsPedidoItens.Locate('NEGATIVO_DE_LAJE','S',[]) = true then
  begin
    totCusto := SomarValorCustoFerragem;
    totVenda := SomarValorVendaFerragem;

    {se localizar}
    cdsPedidoItens.Edit;
    cdsPedidoItens.FieldByName('CUSTO').AsFloat := totCusto;
    cdsPedidoItens.FieldByName('VENDA').AsFloat := totVenda;
    cdsPedidoItens.post;

    edTotCustoFerragem.Text := FormatFloat('0.00', totCusto);
    edTotCustoFerragem.Text := FormatFloat('0.00', totVenda);
  end
  else
  begin
    CriarMensagem('AVISO','item não encontrado para alteração');
  end;
end;

procedure TfrmPedidosE.SomarReforcoViga;
var
  totCusto, totVenda: double;
begin
  p_executar_dataChange_ds_pedidoItes  := false;


  //ShowMessage('atualizando valores dos reforços');
  cdsPedidoItens.DisableControls;
  totCusto := 0;
  totVenda := 0;
  {recalcula os totais no itens do pedido - adiciona/altera no cdsPedidoItens}
  cdsPedidoItens.First;
  if cdsPedidoItens.Locate('REFORCO_DE_VIGA','S',[]) = true then
  begin
    {se localizar}
    totCusto := SomarValorCustoReforcoViga(true);
    totVenda := SomarValorVendaReforcoViga(true);

    cdsPedidoItens.Edit;
    cdsPedidoItens.FieldByName('CUSTO').AsFloat := totCusto;
    cdsPedidoItens.FieldByName('VENDA').AsFloat := totVenda;
    cdsPedidoItens.Post;

    //edTotCustoRerforco.Text := FormatFloat('0.00', totCusto);
    //edTotVendaRerforco.Text := FormatFloat('0.00', totVenda);

    cdsPedidoItens.EnableControls;

  end
  else
  begin
    CriarMensagem('AVISO','item não encontrado para alteração.');
  end;

  p_executar_dataChange_ds_pedidoItes  := true;

end;


procedure TfrmPedidosE.pmIncluirIsoporClick(Sender: TObject);
begin
  inherited;
  AddLajotaEps('Eps', cdsItensLaje);
end;

procedure TfrmPedidosE.pmIncluirItemPedidoClick(Sender: TObject);
begin
  inherited;
  //ShowMessage(inttostr(p_forma_pagto_id));
  if  qry_sistema.FieldByName('PEDIDO_OUTROS_FORMA_PGTO').AsString = 'S' then
  begin
    if p_forma_pagto_id = -1  then
    begin
      CriarMensagem('AVISO','SELECIONE UMA FORMA DE PAGAMENTO.');
      btn_busca_forma_pagto.Click;
    end
  end
  else
  begin
    p_forma_pagto_id := 3; // a vista, depois consertar
    pnl_forma_pagto.Caption := 'A vista' ;

  end;

  AdicionarItemPedido;
end;

procedure TfrmPedidosE.pmIncluirLajotaClick(Sender: TObject);
begin
  inherited;
  AddLajotaEps('Lj', cdsItensLaje);
end;

procedure TfrmPedidosE.pmIncluirReforoAdicionalClick(Sender: TObject);
begin
  inherited;
  AddReforcoViga(true, dsPedidoItens, cdsPedidoItens.FieldByName('ID').AsInteger);
  SomarValorProdutos;
end;

procedure TfrmPedidosE.pmIncluirReforcoAdicionalClick(Sender: TObject);
begin
  inherited;

  {Incluir reforço adicional das vigas}
  AddReforcoViga( false, dsItensLaje, cdsItensLaje.FieldByName('ID').AsInteger );

end;

procedure TfrmPedidosE.pmIncluirVigaClick(Sender: TObject);
var
  loQry_viga      : TFDQuery;
  loQry_ferragem  : TFDQuery;
  id_produto      : integer;
  nome_fantasia   : string ;
  custo           : double ;
  idReforcoViga   : integer;
  comprimento_viga: integer;
begin
  inherited;

  if self.Operacao = utipos.OpIncluir then
  begin

    try
      frmPedidosAddVigas := TfrmPedidosAddVigas.Create(application);
      frmPedidosAddVigas.ShowModal;


      if frmPedidosAddVigas.P_confirmado then
      begin
        {qry ferragem}
        loQry_ferragem := TFDQuery.Create(self);
        loQry_ferragem.Connection := conexao;
        loQry_ferragem.Close;
        loQry_ferragem.SQL.Clear;
        loQry_ferragem.SQL.Add('select P.ID, P.NOME_FANTASIA, P.PRECO_VENDEDOR, F.DIAMETRO from PRODUTOS P, PRODUTOS_ADICIONAL F where P.ID = F.PRODUTO_ID and F.DIAMETRO =:DIAMETRO');

        {qryViga}
        loQry_viga := TFDQuery.Create(self);
        loQry_viga.Connection := conexao;
        loQry_viga.Close;
        loQry_viga.SQL.Clear;
        loQry_viga.SQL.Add('select                                  ');
        loQry_viga.SQL.Add('  P.ID,                                 ');
        loQry_viga.SQL.Add('  P.NOME_FANTASIA,                      ');
        loQry_viga.SQL.Add('  P.PRECO_CUSTO,                        ');
        //loQry_viga.SQL.Add('  P.PRECO_VENDEDOR,                   ');
        loQry_viga.SQL.Add('  V.TRELICA_ALTURA,                     ');
        loQry_viga.SQL.Add('  V.COMPRIMENTO                         ');
        loQry_viga.SQL.Add('from                                    ');
        loQry_viga.SQL.Add('  PRODUTOS P, PRODUTOS_VIGAS V          ');
        loQry_viga.SQL.Add('where                                   ');
        loQry_viga.SQL.Add('  P.ID = V.PRODUTO_ID and               ');
        loQry_viga.SQL.Add('  V.TRELICA_ALTURA =:TRELICA_ALTURA and ');
        loQry_viga.SQL.Add('  V.FORMA_MEDIDA   =:FORMA_MEDIDA and   ');
        loQry_viga.SQL.Add('  V.COMPRIMENTO    =:COMPRIMENTO        ');

        cdsItensLaje.DisableControls;
        {incluir vigas na grid}
        frmPedidosAddVigas.mtb_vigas.first;
        while not frmPedidosAddVigas.mtb_vigas.Eof do
        begin
          dec(_id);
          {localiza a viga}
          comprimento_viga := trunc((frmPedidosAddVigas.mtb_vigas.FieldByName('TAMANHO').Asfloat+ 0.0001) * 1000);
          //ShowMessage('comprimento viga : ' + inttostr(comprimento_viga));
          loQry_viga.close;
          loQry_viga.ParamByName('TRELICA_ALTURA').AsInteger := p_altura_Laje;
          loQry_viga.ParamByName('FORMA_MEDIDA').AsInteger   := p_largura_forma;
          loQry_viga.ParamByName('COMPRIMENTO').AsInteger    := comprimento_viga;
          loQry_viga.Open;

          {pega código, nome_fantasia e custo}
          id_produto    := loQry_viga.fieldbyname('ID').AsInteger;
          nome_fantasia := loQry_viga.fieldbyname('NOME_FANTASIA').AsString;
          custo         := loQry_viga.fieldbyname('PRECO_CUSTO').AsFloat;// CUSTO MP
          //custo       := loQry_viga.fieldbyname('PRECO_VENDEDOR').AsFloat;;

          AddItemLaje(
                      cdsItensLaje,
                      uTipos.OpIncluir,
                      _id,                                         //  id provisório da tabela pedidos_itens_laje
                      codigo,                                      // número do pedido
                      cdsPedidoItens.fieldbyname('item').AsInteger,// número do item do pedido
                      id_Produto,                                  // id do produto
                      nome_Fantasia,
                      cdsPedidoItens.fieldbyname('LOCAL').AsString,// Local
                      'ABERTO',                                    // Situacao
                      'VIGA',                                      // Nivel
                      frmPedidosAddVigas.mtb_vigasqtde.AsInteger,  // Qtde
                      custo,                                       // Custo
                      custo // consertar depois                    // Venda
                      );

          {***  Cadastrar adicionais ***}

          {ver se a viga tem adicional de 4.2 }
          if frmPedidosAddVigas.mtb_vigasField4_2.AsInteger > 0 then
          begin
            {localiza a viga}
            loQry_ferragem.close;
            loQry_ferragem.ParamByName('DIAMETRO').AsInteger := 4;
            loQry_ferragem.Open;

            {pega código, nome_fantasia e custo}
            id_produto    := loQry_ferragem.fieldbyname('ID').AsInteger;
            nome_fantasia := loQry_ferragem.fieldbyname('NOME_FANTASIA').AsString;
            custo         := loQry_ferragem.fieldbyname('PRECO_VENDEDOR').AsFloat;;

            AddFerragem(
                         true,
                         cdsPedidoFerragens,
                         OpIncluir,
                         -1,// id da tabela reforço,
                         Codigo,
                         p_item_pedido,
                         'PEDIDOS_ITENS_LAJE',
                         _id, // id da tabela de itens de laje
                         id_Produto,
                         nome_fantasia,
                         frmPedidosAddVigas.mtb_vigasdobra_ini.AsFloat,
                         frmPedidosAddVigas.mtb_vigastamanho.AsFloat,
                         frmPedidosAddVigas.mtb_vigasdobra_fim.AsFloat,
                         frmPedidosAddVigas.mtb_vigasqtde.AsInteger,
                         frmPedidosAddVigas.mtb_vigasField4_2.AsInteger,
                         //frmPedididosFerragensE.custoFornecedor,
                         custo,// preço vendedor tem que ser a aquele da tela nova, depois arruma jocelio!
                         custo,// preço de venda
                         frmPedidosAddVigas.mtb_vigasposicao.AsString
                         );

          end;

          {ver se a viga tem adicional de 5.2 }
          if frmPedidosAddVigas.mtb_vigasField5_0.AsInteger > 0 then
          begin
            {localiza a viga}
            loQry_ferragem.close;
            loQry_ferragem.ParamByName('DIAMETRO').AsInteger := 5;
            loQry_ferragem.Open;

            {pega código, nome_fantasia e custo}
            id_produto    := loQry_ferragem.fieldbyname('ID').AsInteger;
            nome_fantasia := loQry_ferragem.fieldbyname('NOME_FANTASIA').AsString;
            custo         := loQry_ferragem.fieldbyname('PRECO_VENDEDOR').AsFloat;;

            AddFerragem(
                         true,
                         cdsPedidoFerragens,
                         OpIncluir,
                         -1,// id da tabela reforço,
                         Codigo,
                         p_item_pedido,
                         'PEDIDOS_ITENS_LAJE',
                         _id, // id da tabela de itens de laje
                         id_Produto,
                         nome_fantasia,
                         frmPedidosAddVigas.mtb_vigasdobra_ini.AsFloat,
                         frmPedidosAddVigas.mtb_vigastamanho.AsFloat,
                         frmPedidosAddVigas.mtb_vigasdobra_fim.AsFloat,
                         frmPedidosAddVigas.mtb_vigasqtde.AsInteger,
                         frmPedidosAddVigas.mtb_vigasField5_0.AsInteger,
                         //frmPedididosFerragensE.custoFornecedor,
                         custo,// preço vendedor tem que ser a aquele da tela nova, depois arruma jocelio!
                         custo,// preço de venda
                         frmPedidosAddVigas.mtb_vigasposicao.AsString
                         );

          end;

          {ver se a viga tem adicional de 6.3 }
          if frmPedidosAddVigas.mtb_vigasField6_3.AsInteger > 0 then
          begin
            {localiza a viga}
            loQry_ferragem.close;
            loQry_ferragem.ParamByName('DIAMETRO').AsInteger := 6;
            loQry_ferragem.Open;

            {pega código, nome_fantasia e custo}
            id_produto    := loQry_ferragem.fieldbyname('ID').AsInteger;
            nome_fantasia := loQry_ferragem.fieldbyname('NOME_FANTASIA').AsString;
            custo         := loQry_ferragem.fieldbyname('PRECO_VENDEDOR').AsFloat;;

            AddFerragem(
                         true,
                         cdsPedidoFerragens,
                         OpIncluir,
                         -1,// id da tabela reforço,
                         Codigo,
                         p_item_pedido,
                         'PEDIDOS_ITENS_LAJE',
                         _id, // id da tabela de itens de laje
                         id_Produto,
                         nome_fantasia,
                         frmPedidosAddVigas.mtb_vigasdobra_ini.AsFloat,
                         frmPedidosAddVigas.mtb_vigastamanho.AsFloat,
                         frmPedidosAddVigas.mtb_vigasdobra_fim.AsFloat,
                         frmPedidosAddVigas.mtb_vigasqtde.AsInteger,
                         frmPedidosAddVigas.mtb_vigasField6_3.AsInteger,
                         //frmPedididosFerragensE.custoFornecedor,
                         custo,// preço vendedor tem que ser a aquele da tela nova, depois arruma jocelio!
                         custo,// preço de venda
                         frmPedidosAddVigas.mtb_vigasposicao.AsString
                         );

          end;

          {ver se a viga tem adicional de 8.0 }
          if frmPedidosAddVigas.mtb_vigasField8_0.AsInteger > 0 then
          begin
            {localiza a viga}
            loQry_ferragem.close;
            loQry_ferragem.ParamByName('DIAMETRO').AsInteger := 8;
            loQry_ferragem.Open;

            {pega código, nome_fantasia e custo}
            id_produto    := loQry_ferragem.fieldbyname('ID').AsInteger;
            nome_fantasia := loQry_ferragem.fieldbyname('NOME_FANTASIA').AsString;
            custo         := loQry_ferragem.fieldbyname('PRECO_VENDEDOR').AsFloat;;

            AddFerragem(
                         true,
                         cdsPedidoFerragens,
                         OpIncluir,
                         -1,// id da tabela reforço,
                         Codigo,
                         p_item_pedido,
                         'PEDIDOS_ITENS_LAJE',
                         _id, // id da tabela de itens de laje
                         id_Produto,
                         nome_fantasia,
                         frmPedidosAddVigas.mtb_vigasdobra_ini.AsFloat,
                         frmPedidosAddVigas.mtb_vigastamanho.AsFloat,
                         frmPedidosAddVigas.mtb_vigasdobra_fim.AsFloat,
                         frmPedidosAddVigas.mtb_vigasqtde.AsInteger,
                         frmPedidosAddVigas.mtb_vigasField8_0.AsInteger,

                         custo,// preço vendedor tem que ser a aquele da tela nova, depois arruma jocelio!
                         custo,// preço de venda
                         frmPedidosAddVigas.mtb_vigasposicao.AsString
                         );

          end;

          {ver se a viga tem adicional de 10.0 }
          if frmPedidosAddVigas.mtb_vigasField10_0.AsInteger > 0 then
          begin
            {localiza a viga}
            loQry_ferragem.close;
            loQry_ferragem.ParamByName('DIAMETRO').AsInteger := 10;
            loQry_ferragem.Open;

            {pega código, nome_fantasia e custo}
            id_produto    := loQry_ferragem.fieldbyname('ID').AsInteger;
            nome_fantasia := loQry_ferragem.fieldbyname('NOME_FANTASIA').AsString;
            custo         := loQry_ferragem.fieldbyname('PRECO_VENDEDOR').AsFloat;;

            AddFerragem(
                         true,
                         cdsPedidoFerragens,
                         OpIncluir,
                         -1,// id da tabela reforço,
                         Codigo,
                         p_item_pedido,
                         'PEDIDOS_ITENS_LAJE',
                         _id, // id da tabela de itens de laje
                         id_Produto,
                         nome_fantasia,
                         frmPedidosAddVigas.mtb_vigasdobra_ini.AsFloat,
                         frmPedidosAddVigas.mtb_vigastamanho.AsFloat,
                         frmPedidosAddVigas.mtb_vigasdobra_fim.AsFloat,
                         frmPedidosAddVigas.mtb_vigasqtde.AsInteger,
                         frmPedidosAddVigas.mtb_vigasField10_0.AsInteger,
                         custo,// preço vendedor tem que ser a aquele da tela nova, depois arruma jocelio!
                         custo,// preço de venda
                         frmPedidosAddVigas.mtb_vigasposicao.AsString
                         );

          end;

          {ver se a viga tem adicional de 12.5 }
          if frmPedidosAddVigas.mtb_vigasField12_5.AsInteger > 0 then
          begin
            {localiza a viga}
            loQry_ferragem.close;
            loQry_ferragem.ParamByName('DIAMETRO').AsInteger := 12;
            loQry_ferragem.Open;

            {pega código, nome_fantasia e custo}
            id_produto    := loQry_ferragem.fieldbyname('ID').AsInteger;
            nome_fantasia := loQry_ferragem.fieldbyname('NOME_FANTASIA').AsString;
            custo         := loQry_ferragem.fieldbyname('PRECO_VENDEDOR').AsFloat;;

            AddFerragem(
                        true,
                        cdsPedidoFerragens,
                        OpIncluir,
                        -1,// id da tabela reforço,
                        Codigo,
                        p_item_pedido,
                        'PEDIDOS_ITENS_LAJE',
                        _id, // id da tabela de itens de laje
                        id_Produto,
                        nome_fantasia,
                        frmPedidosAddVigas.mtb_vigasdobra_ini.AsFloat,
                        frmPedidosAddVigas.mtb_vigastamanho.AsFloat,
                        frmPedidosAddVigas.mtb_vigasdobra_fim.AsFloat,
                        frmPedidosAddVigas.mtb_vigasqtde.AsInteger,
                        frmPedidosAddVigas.mtb_vigasField12_5.AsInteger,
                        custo,// preço vendedor tem que ser a aquele da tela nova, depois arruma jocelio!
                        custo,// preço de venda
                        frmPedidosAddVigas.mtb_vigasposicao.AsString
                        );

          end;

          {Próximo viga ...}
          frmPedidosAddVigas.mtb_vigas.Next;
        end;// fim do while no memTable

        // end;//se o item foi confirmado
        //finally

        {atualizar painel de resumo da laje}
        prc_totais_laje(codigo, cdsPedidoItens.FieldByName('item').AsInteger);
        //
        {totaliza na venda - adiciona/altera no cdsPedidoItens}
        cdsPedidoFerragens.Filtered := false;
        if not cdsPedidoFerragens.IsEmpty then
        begin
          cdsPedidoItens.First;
          if cdsPedidoItens.Locate('REFORCO_DE_VIGA','S',[]) = true then
          begin
            //ShowMessage('incluso e alterando valor');
            {se localizar}
            cdsPedidoItens.Edit;
            //cdsPedidoItens.FieldByName('CUSTO').AsFloat := SomarValorCustoReforcoViga(false);
            //cdsPedidoItens.FieldByName('VENDA').AsFloat := SomarValorVendaReforcoViga(false);
            cdsPedidoItens.FieldByName('CUSTO').AsFloat := SomarValorCustoReforcoViga(true);
            cdsPedidoItens.FieldByName('VENDA').AsFloat := SomarValorVendaReforcoViga(true);
            cdsPedidoItens.Post;
          end
          else
          begin
            {adiciona o item reforço de viga no cds de itens do pedido}
            {Próximo item do pedido}
            cdsPedidoItens.Last;
            item := cdsPedidoItens.FieldByName('ITEM').AsInteger + 1;
            //
            dec(_Id);// novo id
            //
            idReforcoViga := eReforcoViga;
            ADDProduto('N', // adicional de viga
                       'N', // venda de ferragem
                       cdsPedidoItens,
                       uTipos.OpIncluir,
                       _id, //id provisório da tabela de itens do pedido
                       codigo,
                       item, // número do item do pedido
                       idReforcoViga, // cod produto
                       'REFORÇO DE VIGA',
                       'L-9',
                       'ABERTO',
                       '',
                       'N',// LAJE
                       'N',// VIGA
                       'N',// LAJOTA
                       'N',// ISOPOR
                       'N',// REVENDA
                       'N',// CONCRETO
                       'N',// BOMBA
                       'N',// VEGALHAO
                       1,
                       1,
                       1,
                       1,
                       'N',
                       'S',
                       0,
                       'N'
                       );
            {apos incluir tentar localizar novamente e totalizar}
            cdsPedidoItens.First;
            if cdsPedidoItens.Locate('REFORCO_DE_VIGA','S',[]) = true then
            begin
              //ShowMessage('incluso e alterando valor');
              {se localizar}
              cdsPedidoItens.Edit;
              //cdsPedidoItens.FieldByName('CUSTO').AsFloat := SomarValorCustoReforcoViga(false);
              //cdsPedidoItens.FieldByName('VENDA').AsFloat := SomarValorVendaReforcoViga(false);
              cdsPedidoItens.FieldByName('CUSTO').AsFloat := SomarValorCustoReforcoViga(true);
              cdsPedidoItens.FieldByName('VENDA').AsFloat := SomarValorVendaReforcoViga(true);
              cdsPedidoItens.Post;
            end;

           {atualiza o valor na grid itens de pedidos e os edits na tab de reforco viga}
           SomarReforcoViga;
           cdsPedidoFerragens.Filtered := true;

          end;
        end;

        SomarValorProdutos;

        loQry_ferragem.Close;
        FreeAndNil( loQry_ferragem );

        loQry_viga.Close;
        FreeAndNil( loQry_viga );

      end;//se o item foi confirmado
      //
    finally

      FreeAndNil( frmPedidosAddVigas );

      cdsItensLaje.EnableControls;
      cdsPedidoItens.Locate('ITEM',p_item_pedido,[]);
      tbs_itens_laje.Show;

    end;//try finally

  end// se a operacao for incluir
  else
  begin
    cdsPedidoItens.Locate('ITEM',p_item_pedido,[]);
    AddViga(cdsItensLaje);
  end;

end;

procedure TfrmPedidosE.pmLiberarLajotaIsoporClick(Sender: TObject);
begin
  inherited;
  pmIncluirLajota.Enabled := true;
  pmIncluirIsopor.Enabled := true;

end;

procedure TfrmPedidosE.Inicializar;
//var ano, mes, dia : word;
//    hora : string;
//    horas: TDate;
begin

  case self.Operacao of

  uTipos.opIncluir: begin
                       // DecodeDate(Date, ano, mes, dia);
                       // horas := now;
                       // hora  := FormatDateTime('hhmmss', horas);
                       //btnOk.Caption := 'Salvar Pedido';
                       btnOk.Caption := 'INCLUIR PEDIDO';

                       {número do pedido provisório}
                       codigo                      := -1;
                       edt_nr_pedido.Caption       := '-1';
                       //edt_nosso_numero.Caption    := inttostr(ano)+ FormatFloat('00',mes)+ FormatFloat('00',dia) + hora;
                       {alterar o titulo após gerar o número do pedido}
                       lbl_titulo_topo.Caption            := 'CADASTRO DE PEDIDOS - ' + 'Novo Pedido N.: ' + inttostr(Codigo);
                       edt_emissao.Caption         := datetostr( Date );
                       dtpDataContabil.Date        := Date;
                       cb_orcamento.Checked        := false;
                       lbl_cliente_id.Caption      := '';
                       lbl_cliente_nome.Caption    := '';
                       lbl_situacao_pedido.Caption := 'ABERTO';
                       cbx_situacao.Text           := 'ABERTO';
                       p_cliente_id                := -1;
                       btn_alterar_pessoa.Enabled  := false;
                       p_vendedor_id               := -1;
                       edt_frete_cliente.Text      := '0,00';
                       edt_valor_produtos.Caption  := '0,00';
                       cbx_desc_acrescimo.Text     := 'OUTROS ACRESCIMOS';
                       edt_acrescimo.Text      := '0,00';
                       edt_desconto.Text       := '0,00';
                       edt_valor_total.Caption := '0,00';
                       edt_base_icms.Text      := '0,00';
                       edt_valor_icms.Text     := '0,00';
                       edt_valor_icms_st.Text  := '0,00';
                       edt_valor_seguro.Text   := '0,00';
                       edt_valor_ipi.Text      := '0,00';
                       p_frete_por_conta       := rg_frete.ItemIndex;
                       edt_qtde_volumes.Text   := '';
                       edt_especie.Text        := '';
                       edt_marca.Text          := '';
                       edt_numero_frete.Text   := '';
                       edt_peso_bruto.Text     := '';
                       edt_peso_liquido.Text   := '';
                       edt_valor_pago.Caption  := '0,00';
                       dtpDataContabil.Date    := date;
                       dtpDataEntrega.Date     := date;
                       p_forma_pagto_id        := -1; // vazio
                       tbs_comissao_triunfo.TabVisible := false;
                       tbs_comissao_ferrari.TabVisible := false;
                       FilterCds(qry_recibos, fsInteger, '-1');

                     end;

  uTipos.opAlterar: begin
                      self.LerDados;
                      lbl_titulo_topo.Caption := 'CADASTRO DE PEDIDOS - ' + 'Alteração do Pedido N.: ' + inttostr(Codigo);
                      btnOk.Caption           := 'SALVAR ALTERAÇÕES';

                      if dtpDataEntrega.DateTime < date then
                        dtpDataEntrega.DateTime := date;

                      btn_alterar_pessoa.Enabled := true;

                     (*
                      {pedido concreto}
                      if qryPedidoConcreto.RecordCount = 0 then
                        qryPedidoConcreto.insert
                      else
                        qryPedidoConcreto.Edit;
                     *)
                      // eliminar essa comissão ferrari depois...
                      if p_empresa = 'TRIUNFO' then
                      begin
                      //  tbs_comissao_triunfo.TabVisible := TRUE;
                        tbs_comissao_ferrari.TabVisible := false;
                      end;
                      if p_empresa = 'FERRARI' then
                      begin
                      //  tbs_comissao_triunfo.TabVisible := false;
                        tbs_comissao_ferrari.TabVisible := true;
                      end;
                      // não mostrar mais
                      tbs_comissao_ferrari.TabVisible := false;

                      // só vai mostrar através da configurações do sistema
                      // se o botão imprimir comissão estiver visivel, mostra o tabsheet comissão na tela de pedidoE
                      tbs_comissao_triunfo.TabVisible := qry_sistema.FieldByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString = 'S';

                      {pedidos liquidados não poderá fazer alterações}
                      if (cbx_situacao.Text = 'ENTREGUE') or (cbx_situacao.Text = 'RETIROU') then
                        btnOk.Enabled := FALSE
                      else
                      if cbx_situacao.Text = 'PARCIAL' then
                        cbx_situacao.Enabled := FALSE
                      else
                        btnOk.SetFocus;
                    end;


  uTipos.opExcluir: begin
                      self.LerDados;
                      lbl_titulo_topo.Caption := 'CADASTRO DE PEDIDOS - ' + 'Exclusão do Pedido N.: ' + inttostr(codigo);;
                      btnOk.Caption           := 'INATIVAR PEDIDO';
                      {não exclui marca como orcamento}
                      cb_orcamento.Checked    := true;
                      Operacao                := opAlterar;
                      btnFechar.SetFocus;
                    end;
  else
    begin
      pnDados.Enabled   := false;
      if btnFechar.CanFocus then btnFechar.SetFocus;
    end;
  end;

end;

procedure TfrmPedidosE.LerDados;
begin
  {carrega a cabeça do pedido}
  prc_carregar_pedido;

  {busca pagamentos}
  uBiblioteca.FilterCds(qry_recibos, utipos.fsInteger, inttostr(Codigo));

  {busca no banco de dados os itens do pedido}
  uBiblioteca.FilterCds(qryPedidoItens, uTipos.fsInteger, inttostr(self.codigo));

  {busca no banco de dados os comissão}
  prc_carregar_comissao;

  {carrega no clientDataset}
  CarregarItensPedido;

  CarregarFerragens;

  {carrega no mesmo metodo todas as abas h8,12 ...}
  CarregarItensLaje;

  {financeiro}
  // filtra contas a receber
  {financeiro}
  qryContasReceber.Close;
  qryContasReceber.SQL.Add('select R.*, P.NOME from CONTAS_RECEBER R, PESSOAS P where R.PESSOA_ID = P.ID  and TABELA_ORIGEM = '+QuotedStr('PEDIDOS')+ ' and ID_ORIGEM = :PEDIDO_ID' );
  qryContasReceber.Params[0].AsInteger := codigo;
  qryContasReceber.Open;

  qry_contas_pagar.Close;
  qry_contas_pagar.SQL.Add('select C.*, P.NOME from CONTAS_PAGAR C, PESSOAS P where C.PESSOA_ID = P.ID  and TABELA_ORIGEM = '+QuotedStr('PEDIDOS')+ ' and TABELA_ID = :PEDIDO_ID' );
  qry_contas_pagar.Params[0].AsInteger := codigo;
  qry_contas_pagar.Open;

  qry_comissao_despesas.Close;
  qry_comissao_despesas.ParamByName('PEDIDO_ID').AsInteger := Codigo;
  qry_comissao_despesas.Open;

end;

procedure TfrmPedidosE.prc_carregar_pedido;
var
  loqry :TFDQuery;
begin
  loqry := TFDQuery.Create(application);
  loqry.Connection := conexao;

  {busca o pedido}
  uBiblioteca.FilterCds(qry, uTipos.fsInteger, inttostr(self.Codigo));
  p_cliente_id  := qry.FieldByName('CLIENTE_ID').AsInteger;
  p_vendedor_id := qry.FieldByName('VENDEDOR_ID').AsInteger;

  {aba venda}
  lbl_cliente_id.Caption      := IntToStr(p_cliente_id);// qry.FieldByName('CLIENTE_ID').AsString;

  {busca o cliente}
  uBiblioteca.FilterCds(qryClientes, uTipos.fsInteger, inttostr( p_cliente_id));
  lbl_cliente_nome.Caption    := qryClientes.FieldByName('NOME').AsString;
  lbl_vendedor_id.Caption     := qry.FieldByName('VENDEDOR_ID').AsString;

  {busca o vendedor}
  cbxVendedores.KeyValue      := p_vendedor_id;
  p_comissao_vendedor         := qryVendedores.FieldByName('comissao_vendedor').AsFloat;
  p_comissao_adm              := qryVendedores.FieldByName('comissao_adm').AsFloat;
  cb_orcamento.Checked        := uBiblioteca.SeSenao( qry.FieldByName('ORCAMENTO').AsString = 'S', true, false );
  // configura a cor do pnTitulo
  if cb_orcamento.Checked then
  begin
    pnTitulo.Color := $001B8D3D;
  end else
  if not cb_orcamento.Checked then
  begin
    pnTitulo.Color := $00E1E1E1;
  end;

  lbl_situacao_pedido.Caption := qry.FieldByName('SITUACAO').AsString;
  cbx_situacao.Text           := qry.FieldByName('SITUACAO').AsString;


  //***
  edt_nr_pedido.Caption    := qry.FieldByName('ID').AsString;
  edt_nosso_numero.Text    := qry.FieldByName('NOSSO_NUMERO').AsString;
  edt_emissao.Caption      := qry.FieldByName('DATA_EMISSAO').AsString;
  edt_alteracao.Caption    := qry.FieldByName('DATA_ALTERACAO').AsString;
  dtpDataContabil.Date     := qry.FieldByName('DATA_CONTABIL').AsDateTime;
  dtpDataEntrega.Date      := qry.FieldByName('DATA_ENTREGA').AsDateTime;
  edt_comissao_vendedor_informada.Text := formatfloat('0.00', qry.FieldByName('COMISSAO_VENDEDOR_INFORMADA').AsFloat);

  {busca a forma pagamento}
  FilterCds(qryFormaPagto, fsInteger, qry.FieldByName('FORMA_PAGTO_ID').AsString );
  pnl_forma_pagto.Caption := qryFormaPagto.FieldByName('DESCRICAO').AsString;
  p_forma_pagto_id        := qry.FieldByName('FORMA_PAGTO_ID').Asinteger;

  mm_obs_adm.Lines.Add(qry.FieldByName('OBS_ADM').AsString);
  mm_obs_entrega.Lines.Add(qry.FieldByName('OBS_ENTREGA').AsString);

  {busca o local de entrega}
  uBiblioteca.FilterCds(qryLocalEntrega, uTipos.fsInteger, inttostr(self.Codigo));
  if not qryLocalEntrega.IsEmpty then
  begin
    pcVenda.ActivePage   := tbDestinatario;
    pcCliente.ActivePage := tbs_local_entrega;

    edt_nome.Text           := qryLocalEntrega.FieldByName('NOME').AsString;
    edt_celular.Text        := qryLocalEntrega.FieldByName('CELULAR').AsString;
    edt_telefone.Text       := qryLocalEntrega.FieldByName('TELEFONE').AsString;
    edt_cep.Text            := qryLocalEntrega.FieldByName('CEP').AsString;
    edt_endereco.Text       := qryLocalEntrega.FieldByName('ENDERECO').AsString;
    edt_numero_entrega.Text := qryLocalEntrega.FieldByName('NUMERO').AsString;
    edt_bairro.Text         := qryLocalEntrega.FieldByName('BAIRRO').AsString;
    edt_cidade.Text         := qryLocalEntrega.FieldByName('CIDADE').AsString;
    edt_uf.Text             := qryLocalEntrega.FieldByName('UF').AsString;
    edt_complemento.Text    := qryLocalEntrega.FieldByName('COMPLEMENTO').AsString;

  end;
  {aba concreto realizado}
  loqry.SQL.Clear;
  loqry.SQL.Add('select fornecedor_id, prestador_servico_id, produto_bomba_id, bomba_valor, bomba_qtde, bomba_total, data_exec, funcionario from pedidos_concretos where pedido_id =:pedido_id');
  loqry.ParamByName('pedido_id').AsInteger := codigo;
  loqry.Open;
  if not loqry.IsEmpty then
  begin
    cbx_fornecedor_concreto.KeyValue := loqry.FieldByName('FORNECEDOR_ID').AsInteger;
    dtp_executacao_concreto.date     := loqry.FieldByName('DATA_EXEC').AsDateTime;
    edt_resp_bombeamento.text        := loqry.FieldByName('funcionario').Asstring;
    cbx_prestador_servico.KeyValue   := loqry.FieldByName('PRESTADOR_SERVICO_ID').AsInteger;
    cbx_bomba_contratada.KeyValue    := loqry.FieldByName('PRODUTO_BOMBA_ID').AsInteger;
    edt_preco_custo_bomba.Text       := loqry.FieldByName('BOMBA_VALOR').AsString;
    edt_qtde_bomba.Text              := loqry.FieldByName('BOMBA_QTDE').AsString;
    edt_total_bomba.Text             := loqry.FieldByName('BOMBA_TOTAL').AsString;

    {itens}
    loqry.SQL.Clear;
    loqry.SQL.Add('select i.id, i.pedido_id, i.item, i.produto_id, i.qtde, i.custo, p.descricao from PEDIDOS_CONCRETO_ITENS I, PRODUTOS P where P.ID = I.PRODUTO_ID and pedido_id =:pedido_id');          loqry.ParamByName('pedido_id').AsInteger := codigo;
    loqry.ParamByName('pedido_id').AsInteger := codigo;
    loqry.Open;
    if not loqry.IsEmpty then
    begin
      loqry.First;
      while not loqry.eof do
      begin
        mtb_concreto_utilizado.Insert;
        mtb_concreto_utilizado.fieldbyname('ID').AsInteger            := loqry.fieldbyname('ID').AsInteger;
        mtb_concreto_utilizado.fieldbyname('PEDIDO_ID').AsInteger     := loqry.fieldbyname('PEDIDO_ID').AsInteger;
        mtb_concreto_utilizado.fieldbyname('ID_ITEMPEDIDO').AsInteger := loqry.fieldbyname('ITEM').AsInteger;
        mtb_concreto_utilizado.fieldbyname('PRODUTO_ID').AsInteger    := loqry.fieldbyname('PRODUTO_ID').AsInteger;
        mtb_concreto_utilizado.fieldbyname('DESCRICAO').AsString      := loqry.fieldbyname('DESCRICAO').AsString;
        mtb_concreto_utilizado.fieldbyname('UNIDADE').AsString        := 'M3';
        mtb_concreto_utilizado.fieldbyname('QUANTIDADE').AsFloat      := loqry.fieldbyname('QTDE').AsFloat;
        mtb_concreto_utilizado.fieldbyname('PRECO_CUSTO').AsFloat     := loqry.fieldbyname('CUSTO').AsFloat;
        mtb_concreto_utilizado.fieldbyname('TOTAL').AsFloat           := loqry.fieldbyname('QTDE').AsFloat * loqry.fieldbyname('CUSTO').AsFloat;
        loqry.Next;
      end;
      mtb_concreto_utilizado.last;
      mtb_concreto_utilizado.first;
    end else loqry.Close; // não tem itens fecha a qry
  end
  else
  loqry.Close; // não tem dados do concreto fecha a qry

  {aba frete}
  qryTransportadoras.Open;
  p_transportadora_id := qry.FieldByName('TRANSPORTADORA_ID').AsInteger;
  edt_transportadora_id.Caption := inttostr(p_transportadora_id);
  cbxTransportadoras.KeyValue   := p_transportadora_id;

  p_frete_por_conta             := qry.FieldByName('FRETE_POR_CONTA').AsInteger;
  rg_frete.ItemIndex            := p_frete_por_conta;

  edt_qtde_volumes.Text := qry.FieldByName('PRODUTOS_QTDE').AsString;
  edt_especie.Text      := qry.FieldByName('ESPECIE').AsString;
  edt_marca.Text        := qry.FieldByName('MARCA').AsString;
  edt_numero_frete.Text := qry.FieldByName('NUMERACAO').AsString;
  edt_peso_bruto.Text   := qry.FieldByName('PESO_BRUTO').AsString;
  edt_peso_liquido.Text := qry.FieldByName('PESO_LIQUIDO').AsString;

  {aba impostos}
  edt_base_icms.Text      := qry.FieldByName('BASE_ICMS').AsString;
  edt_valor_icms.Text     := qry.FieldByName('VALOR_ICMS').AsString;
  edt_valor_icms_st.Text  := qry.FieldByName('VALOR_ICMS_ST').AsString;
  edt_vlr_produtos.Text   := qry.FieldByName('VALOR_PRODUTOS').AsString;
  edt_frete_cli.Text      := qry.FieldByName('FRETE_CLIENTE').AsString;
  edt_valor_seguro.Text   := qry.FieldByName('VALOR_SEGURO').AsString;
  edt_valor_ipi.Text      := qry.FieldByName('VALOR_IPI').AsString;
  edt_desc.Text           := qry.FieldByName('DESCONTO').AsString;
  edt_acresc.Text         := qry.FieldByName('ACRESCIMO').AsString;
  edt_vlr_total.Text      := qry.FieldByName('VALOR_TOTAL_PEDIDO').AsString;

  {rodape}
  edt_valor_produtos.Caption := formatfloat('0.00', qry.FieldByName('VALOR_PRODUTOS').AsFloat );
  edt_frete_cliente.Text     := formatfloat('0.00', qry.FieldByName('FRETE_CLIENTE').AsFloat );
  cbx_desc_acrescimo.Text    := qry.FieldByName('DESCRICAO_ACRESCIMO').AsString;
  edt_acrescimo.Text         := formatfloat('0.00', qry.FieldByName('ACRESCIMO').AsFloat );
  edt_desconto.Text          := formatfloat('0.00', qry.FieldByName('DESCONTO').AsFloat );
  edt_valor_total.Caption    := formatfloat('0.00', qry.FieldByName('VALOR_TOTAL_PEDIDO').AsFloat );
  edt_valor_pago.Caption     := formatfloat('0.00', qry.FieldByName('VALOR_PAGO').AsFloat );

  freeandnil(loqry);

end;


procedure TfrmPedidosE.prc_totais_laje(pedido, item_pedido: integer);
var
  i :integer;
begin

  {filtrar para garantir que do tem itens de laje da laje passada pr paramentro}
  edVigasH8Info.Text       := IntToStr( p_qtde_vigas );

  edQtdeVigasH8.Text       := IntToStr( ContarVigas(cdsItensLaje));
  edMetrosLinearesH8.Text  := formatfloat('0.00', SomarMetrosLineares(cdsItensLaje));
  edMetrosQuadradosH8.Text := FormatFloat('0.00', SomarMetrosQuadrados(p_largura_forma, strtofloat(edMetrosLinearesH8.Text)));
  edQtdeLajotasH8.Text     := FormatFloat('0', SomarQtdeLajotas(strtofloat(edMetrosLinearesH8.Text),strtoint( edQtdeVigasH8.text)));
  edQtdeIsoporH8.Text      := inttostr(SomarQtdeIsopor(strtofloat(edMetrosLinearesH8.Text)));

  {atualizar a qtde na bolinha da laje no cdsPedidoItens}
  i := cdsPedidoItens.FieldByName('id').AsInteger;
  cdsPedidoItens.First;
  if cdsPedidoItens.Locate('PEDIDO_ID;ITEM', VarArrayOf([ pedido,item_pedido]),[]) then
  begin
    {se encontrar guarda o valor real}
    cdsPedidoItens.Edit;
    cdsPedidoItens.FieldByName('QTDE_REAL_LAJE').asfloat :=  strtofloat( FormatFloat('0.00',strtofloat(edMetrosQuadradosH8.text)));
    cdsPedidoItens.post;
  end
  else
  begin
    {se não encontrar guarda o valor digitado pelo usuario}
    cdsPedidoItens.Edit;
    cdsPedidoItens.FieldByName('QTDE_REAL_LAJE').asfloat := cdsPedidoItens.FieldByName('QTDE').asfloat;
    cdsPedidoItens.post;
  end;

  {posiciona na laje antes da alteração}
  cdsPedidoItens.First;
  cdsPedidoItens.Locate('id', i,[]);


end;

procedure TfrmPedidosE.prc_carregar_comissao;
begin
  uBiblioteca.FilterCds(qrycomissoes, fsInteger, inttostr(codigo));
 // ShowMessage('prc_carregar_comissao ' + inttostr(qryComissoes.RecordCount) );

  // carregar os labels
  lbl_data_contabil.Caption     := DateToStr( qryComissoes.FieldByName('DATA_CONTABIL').AsDateTime );
  lbl_taxa_adm.Caption          := formatfloat('0.00', qryComissoes.FieldByName('COMISSAO_ADM_TAXA').AsFloat );
  //lbl_margem_vendedor.Caption   := '50';//formatfloat('0.00', qry.FieldByName('COMISSAO_ADM_TAXA').AsFloat );
  lbl_margem_vendedor.Caption   := formatfloat('0.00', p_comissao_vendedor );
  lbl_valor_venda.Caption       := formatfloat('0.00', qryComissoes.FieldByName('TOTAL_VENDA').AsFloat );
  lbl_custo_pedido.Caption      := formatfloat('0.00', qryComissoes.FieldByName('TOTAL_CUSTO').AsFloat );
  lbl_outras_despesas.Caption   := formatfloat('0.00', qryComissoes.FieldByName('OUTRAS_DESPESAS').AsFloat );
  lbl_comissao_adm.Caption      := formatfloat('0.00', qryComissoes.FieldByName('COMISSAO_ADM').AsFloat );
  lbl_margem.Caption            := formatfloat('0.00', qryComissoes.FieldByName('COMISSAO_BRUTA').AsFloat );
  lbl_comissao_vendedor.Caption := formatfloat('0.00', qryComissoes.FieldByName('COMISSAO_LIQUIDA').AsFloat );
  mm_obs_comissao.Lines.Add(qryComissoes.FieldByName('HISTORICO').AsString);

  // itens de comissao
  uBiblioteca.FilterCds(qryComissao_itens, utipos.fsInteger, inttostr(self.Codigo));


end;

procedure TfrmPedidosE.prc_atualizar_Painel_comissao_triunfo;
var
  tx_adm            : double;
  tx_vendedor       : double;
  valor_venda       : double;
  custo_pedido      : double;
  outras_despesas   : double;
  comissao_adm      : double;
  margem            : double;
  comissao_vendedor : double;

begin
  {COMISSAO LAJES TRIUNFO}
  tx_adm            := p_comissao_adm;
  tx_vendedor       := p_comissao_vendedor;
  valor_venda       := strtofloatdef(edt_valor_total.Caption,0);
  custo_pedido      := fnc_somar_custo_pedido;
  outras_despesas   := fnc_somar_despesas(codigo);
  comissao_adm      := (valor_venda * tx_adm) / 100 ;
  margem            := valor_venda - ( custo_pedido + outras_despesas + comissao_adm);
  comissao_vendedor := (margem * tx_vendedor) /100;

  // carregar os labels
  lbl_taxa_adm.Caption          := formatfloat('0.00', tx_adm );
  lbl_margem_vendedor.Caption   := formatfloat('0.00', tx_vendedor );
  lbl_valor_venda.Caption       := formatfloat('0.00', valor_venda );
  lbl_custo_pedido.Caption      := formatfloat('0.00', custo_pedido );
  lbl_outras_despesas.Caption   := formatfloat('0.00', outras_despesas );
  lbl_comissao_adm.Caption      := formatfloat('0.00', comissao_adm );
  lbl_margem.Caption            := formatfloat('0.00', margem );
  lbl_comissao_vendedor.Caption := formatfloat('0.00', comissao_vendedor );

  // itens de comissao
  uBiblioteca.FilterCds(qryComissao_itens, utipos.fsInteger, inttostr(self.Codigo));


end;

procedure TfrmPedidosE.prc_atualizar_Painel_comissao_ferrari;
var
  tx_comissao_vendedor     : double;
  tx_comissao_abono        : double;
  tx_desconto_concedido    : double;
  tx_comissao_real         : double;
  valor_venda_ferrari      : double;
  valor_venda_pedido       : double;
  valor_desconto           : double;
  valor_venda_com_desconto : double;
  valor_comissao           : double;
  outras_despesas          : double;
  valor_comissao_vendedor  : double;

begin
  {COMISSAO LAJES FERRARI}
  valor_venda_pedido       := strtofloatdef(edt_valor_total.caption,0);
  valor_venda_ferrari      := fnc_somar_custo_pedido;
  valor_desconto           := strtofloatdef(lbl_vr_pedido_ferrari.caption,0) - strtofloatdef(edt_valor_total.caption,0);
  tx_comissao_vendedor     := 8; //p_comissao_vendedor; AQUI
  tx_comissao_abono        := 50;//p_comissao_abono; // AQUI
  tx_desconto_concedido    := valor_desconto * 100 / valor_venda_ferrari;
  tx_comissao_real         := tx_comissao_vendedor - ( tx_desconto_concedido * tx_comissao_abono / 100 ) ;
  valor_venda_com_desconto := strtofloatdef(edt_valor_total.Caption,0);;
  valor_comissao           := valor_venda_pedido * tx_comissao_real / 100;
  outras_despesas          := fnc_somar_despesas(codigo);
  valor_comissao_vendedor  := valor_comissao + outras_despesas;

  // carregar os labels
  lbl_tx_comissao_vendedor_ferrari.Caption   := '( ' + formatfloat('0.00', tx_comissao_vendedor ) + ' % )';
  lbl_tx_comissao_abono_ferrari.Caption      := '( ' + formatfloat('0.00', tx_comissao_abono ) + ' % )';
  lbl_tx_comissao_real_ferrari.Caption       := '( ' + formatfloat('0.00', tx_comissao_real ) + ' % )';
  lbl_vr_pedido_ferrari.Caption              := formatfloat('0.00', valor_venda_ferrari );
  lbl_vr_desconto_concedido_ferrari.Caption  := formatfloat('0.00', valor_desconto );
  lbl_tx_desconto_concedido_ferrari.Caption  := '( ' + formatfloat('0.00', tx_desconto_concedido ) + ' % )';
  lbl_vr_pedido_com_desconto_ferrari.Caption := formatfloat('0.00', valor_venda_com_desconto );
  lbl_vr_comissao_vendedor_ferrari.Caption   := formatfloat('0.00', valor_comissao );
  lbl_vr_outros_lancamentos_ferrari.Caption  := formatfloat('0.00', outras_despesas );
  lbl_vr_comissao_liquido_ferrari.Caption    := formatfloat('0.00', valor_comissao_vendedor );
  // itens de comissao
  uBiblioteca.FilterCds(qryComissao_itens, utipos.fsInteger, inttostr(self.Codigo));


end;


procedure TfrmPedidosE.CarregarItensPedido;
begin

  {Lê do banco pra tela}
  qryPedidoItens.First;
  while not  qryPedidoItens.Eof do
  begin
    cdsPedidoItens.Insert;
    cdsPedidoItens.FieldByName('ID').AsInteger               :=  qryPedidoItens.FieldByName('ID').AsInteger;
    cdsPedidoItens.FieldByName('PEDIDO_ID').AsInteger        :=  qryPedidoItens.FieldByName('PEDIDO_ID').AsInteger;
    cdsPedidoItens.FieldByName('ITEM').AsInteger             :=  qryPedidoItens.FieldByName('ITEM').AsInteger;
    cdsPedidoItens.FieldByName('PRODUTO_ID').AsInteger       :=  qryPedidoItens.FieldByName('PRODUTO_ID').AsInteger;
    // buscar decrição
    uBiblioteca.FilterCds(dmPesquisa.qryBuscaProduto, uTipos.fsInteger,  qryPedidoItens.FieldByName('PRODUTO_ID').AsString );
    //cdsPedidoItens.FieldByName('DESCRICAO').AsString         := dmPesquisa.qryBuscaProduto.FieldByName('DESCRICAO').AsString;
    cdsPedidoItens.FieldByName('DESCRICAO').AsString         := dmPesquisa.qryBuscaProduto.FieldByName('NOME_FANTASIA').AsString;
    cdsPedidoItens.FieldByName('QTDE').AsFloat               :=  qryPedidoItens.FieldByName('QTDE').AsFloat;
    cdsPedidoItens.FieldByName('CUSTO_FORNECEDOR').AsFloat   :=  qryPedidoItens.FieldByName('PRECO_FORNECEDOR').AsFloat;
    cdsPedidoItens.FieldByName('CUSTO').AsFloat              :=  qryPedidoItens.FieldByName('CUSTO').AsFloat;
    cdsPedidoItens.FieldByName('VENDA').AsFloat              :=  qryPedidoItens.FieldByName('VENDA').AsFloat;
    // no evento oncalcfields do cds ja faz essa conta
    //    cdsPedidoItens.FieldByName('SUB_TOTAL').AsFloat    :=  qryPedidoItens.FieldByName('SUB_TOTAL').AsFloat;
    cdsPedidoItens.FieldByName('LOCAL').AsString             :=  qryPedidoItens.FieldByName('LOCAL').AsString;
    cdsPedidoItens.FieldByName('SITUACAO').AsString          :=  qryPedidoItens.FieldByName('SITUACAO').AsString;
    cdsPedidoItens.FieldByName('DATA_ENTREGA').AsDateTime    :=  qryPedidoItens.FieldByName('DATA_ENTREGA').AsDateTime;
    cdsPedidoItens.FieldByName('NIVEL').AsString             :=  qryPedidoItens.FieldByName('NIVEL').AsString;
    cdsPedidoItens.FieldByName('ADICIONAL_DE_VIGA').AsString :=  qryPedidoItens.FieldByName('ADICIONAL_DE_VIGA').AsString;
    cdsPedidoItens.FieldByName('REVENDA').AsString           :=  qryPedidoItens.FieldByName('REVENDA').AsString;
    cdsPedidoItens.FieldByName('LAJE').AsString              :=  qryPedidoItens.FieldByName('LAJE').AsString;
    cdsPedidoItens.FieldByName('VIGA').AsString              :=  qryPedidoItens.FieldByName('VIGA').AsString;
    cdsPedidoItens.FieldByName('LAJOTA').AsString            :=  qryPedidoItens.FieldByName('LAJOTA').AsString;
    cdsPedidoItens.FieldByName('ISOPOR').AsString            :=  qryPedidoItens.FieldByName('ISOPOR').AsString;
    cdsPedidoItens.FieldByName('VERGALHAO').AsString         :=  qryPedidoItens.FieldByName('VERGALHAO').AsString;
    cdsPedidoItens.FieldByName('CONCRETO').AsString          :=  qryPedidoItens.FieldByName('CONCRETO').AsString;
    cdsPedidoItens.FieldByName('BOMBA').AsString             :=  qryPedidoItens.FieldByName('BOMBA').AsString;
    cdsPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString  :=  qryPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString;
    cdsPedidoItens.FieldByName('REFORCO_DE_VIGA').AsString   :=  qryPedidoItens.FieldByName('REFORCO_DE_VIGA').AsString;
    cdsPedidoItens.FieldByName('QTDE_VIGAS').AsInteger       :=  qryPedidoItens.FieldByName('QTDE_VIGAS').AsInteger;
    cdsPedidoItens.FieldByName('QTDE_REAL_LAJE').AsSTRING    :=  FormatFloat('0.00', qryPedidoItens.FieldByName('QTDE_REAL_LAJE').AsFloat);
    cdsPedidoItens.FieldByName('ESTOQUE_CONTROLADO').AsString:=  dmPesquisa.qryBuscaProduto.FieldByName('ESTOQUE_CONTROLADO').AsString;
    cdsPedidoItens.Post;
    //***
     qryPedidoItens.Next;
  end;
end;




procedure TfrmPedidosE.CarregarItensLaje;
begin
  {Como os itens de laje h8,12,16,20,24 e 30 de um determinado pedido estão
  todos na mesma tabela , resolvi fazer um unico metodo para carregar em seus
  respectivos datasets, usando uma sql para cada altura de laje}

  {Aba H-8}
  //openQryAux('select * from PEDIDOS_ITENS_LAJE where H_LAJE =' + QuotedStr('80') + ' and PEDIDO_ID = :PEDIDO_ID', inttostr(codigo) );
  openQryAux('select * from PEDIDOS_ITENS_LAJE where PEDIDO_ID = :PEDIDO_ID', inttostr(codigo) );
  if qryAux.RecordCount > 0  then
  begin
    qryAux.First;
    while not qryAux.Eof do
    begin
      cdsItensLaje.Insert;
      cdsItensLaje.FieldByName('ID').AsInteger         := qryAux.FieldByName('ID').AsInteger;
      cdsItensLaje.FieldByName('PEDIDO_ID').AsInteger  := qryAux.FieldByName('PEDIDO_ID').AsInteger;
      cdsItensLaje.FieldByName('ITEM').AsInteger       := qryAux.FieldByName('ITEM').AsInteger;
      cdsItensLaje.FieldByName('PRODUTO_ID').AsInteger := qryAux.FieldByName('PRODUTO_ID').AsInteger;
      {buscar decrição...}
      uBiblioteca.FilterCds(dmPesquisa.qryBuscaProduto, uTipos.fsInteger, qryAux.FieldByName('PRODUTO_ID').AsString );
      cdsItensLaje.FieldByName('DESCRICAO').AsString   := dmPesquisa.qryBuscaProduto.FieldByName('NOME_FANTASIA').AsString;
      cdsItensLaje.FieldByName('QTDE').AsFloat         := qryAux.FieldByName('QTDE').AsFloat;
      cdsItensLaje.FieldByName('CUSTO').AsFloat        := qryAux.FieldByName('CUSTO').AsFloat;
      cdsItensLaje.FieldByName('LOCAL').AsString       := qryAux.FieldByName('LOCAL').AsString;
      cdsItensLaje.FieldByName('SITUACAO').AsString    := qryAux.FieldByName('SITUACAO').AsString;
      cdsItensLaje.FieldByName('NIVEL').AsString       := qryAux.FieldByName('NIVEL').AsString;

      cdsItensLaje.Post;
      //***
      qryAux.Next;
    end;

    //TotaisTabH8;
    edVigasH8Info.Text := edQtdeVigasH8.Text;

    cdsPedidoItens.First;
  end;

end;


procedure TfrmPedidosE.CarregarFerragens;
begin
  openQryAux('select * from PEDIDOS_FERRAGENS where PEDIDO_ID = :PEDIDO_ID', inttostr(codigo));
  if qryAux.RecordCount >0  then
  begin
    qryAux.First;
    while not qryAux.Eof do
    begin
      cdsPedidoFerragens.Insert;
      cdsPedidoFerragens.FieldByName('ID'          ).AsInteger := qryAux.FieldByName('ID').AsInteger;
      cdsPedidoFerragens.FieldByName('PEDIDO_ID'   ).AsInteger := qryAux.FieldByName('PEDIDO_ID').AsInteger;
      cdsPedidoFerragens.FieldByName('PEDIDO_ITEM'   ).AsInteger := qryAux.FieldByName('PEDIDO_ITEM').AsInteger;
      cdsPedidoFerragens.FieldByName('TABELA'      ).AsString  := qryAux.FieldByName('TABELA').AsString;
      cdsPedidoFerragens.FieldByName('ID_TABELA'   ).AsInteger := qryAux.FieldByName('TABELA_ID').AsInteger;
      cdsPedidoFerragens.FieldByName('PRODUTO_ID'  ).AsInteger := qryAux.FieldByName('PRODUTO_ID').AsInteger;
      {buscar decrição}
      uBiblioteca.FilterCds(dmPesquisa.qryBuscaProduto, uTipos.fsInteger, qryAux.FieldByName('PRODUTO_ID').AsString );
      cdsPedidoFerragens.FieldByName('DESCRICAO'   ).AsString  := dmPesquisa.qryBuscaProduto.FieldByName('DESCRICAO').AsString;
      cdsPedidoFerragens.FieldByName('QUANTIDADE'  ).AsInteger := qryAux.FieldByName('QTDE').AsInteger;
      cdsPedidoFerragens.FieldByName('QTDE_VIGAS'  ).AsInteger := qryAux.FieldByName('QTDE_VIGAS').AsInteger;
      cdsPedidoFerragens.FieldByName('DOBRA_INI'   ).AsFloat   := qryAux.FieldByName('DOBRA_INI').AsFloat;
      cdsPedidoFerragens.FieldByName('CORPO'       ).AsFloat   := qryAux.FieldByName('CORPO').AsFloat;
      cdsPedidoFerragens.FieldByName('DOBRA_FIM'   ).AsFloat   := qryAux.FieldByName('DOBRA_FIM').AsFloat;
      cdsPedidoFerragens.FieldByName('COMPRIMENTO' ).AsFloat   := qryAux.FieldByName('COMPRIMENTO').AsFloat;
      cdsPedidoFerragens.FieldByName('TOTAL_LINEAR').AsFloat   := qryAux.FieldByName('TOTAL_LINEAR').AsFloat;
      cdsPedidoFerragens.FieldByName('PRECO_CUSTO' ).AsFloat   := qryAux.FieldByName('PRECO_CUSTO').AsFloat;
      cdsPedidoFerragens.FieldByName('PRECO_VENDA' ).AsFloat   := qryAux.FieldByName('PRECO_VENDA').AsFloat;
      cdsPedidoFerragens.FieldByName('POSICAO'     ).AsString  := qryAux.FieldByName('POSICAO').AsString;
      cdsPedidoFerragens.FieldByName('TOT_CUSTO'   ).AsFloat   := ubiblioteca.SeSenao(qryAux.FieldByName('QTDE_VIGAS').AsInteger = -1,
                                                                  // ferragem negativa
                                                                  qryAux.FieldByName('QTDE').AsInteger *
                                                                  qryAux.FieldByName('COMPRIMENTO').AsFloat *
                                                                  qryAux.FieldByName('PRECO_CUSTO').AsFloat
                                                                  ,
                                                                  // reforço de viga
                                                                  qryAux.FieldByName('QTDE').AsInteger *
                                                                  qryAux.FieldByName('QTDE_VIGAS').AsInteger *
                                                                  qryAux.FieldByName('COMPRIMENTO').AsFloat *
                                                                  qryAux.FieldByName('PRECO_CUSTO').AsFloat);

      cdsPedidoFerragens.FieldByName('TOT_VENDA').AsFloat      := ubiblioteca.SeSenao(qryAux.FieldByName('QTDE_VIGAS').AsInteger = -1,
                                                                  qryAux.FieldByName('QTDE').AsFloat *
                                                                  qryAux.FieldByName('COMPRIMENTO').AsFloat *
                                                                  qryAux.FieldByName('PRECO_VENDA').AsFloat
                                                                  ,
                                                                  // reforço de viga
                                                                  qryAux.FieldByName('QTDE').AsFloat *
                                                                  qryAux.FieldByName('QTDE_VIGAS').AsInteger *
                                                                  qryAux.FieldByName('COMPRIMENTO').AsFloat *
                                                                  qryAux.FieldByName('PRECO_VENDA').AsFloat);

      cdsPedidoFerragens.Post;
      //***
      qryAux.Next;
    end;
  end;

end;


function TfrmPedidosE.fnc_incluir_alterar_pedido(operacao: TOperacao): boolean;
var
  qry : TFDQuery;   // qry para manutencão do pedido
  loqry : TFDQuery; // qry para a consulta da tabela configuracoes_sistema

  // id's cadastrados no plano de contas
  v_comissao_vendedor_id,
  v_comissao_adm_id: integer;
  v_concreto_usinado_id : integer;
  v_bomba_concreto_id : integer;

  estoque_fisico : double;
  vr_comissao_vendedor : double;
  vr_acrescimo, vr_desconto, vr_multa, vr_juros, vr_valor_pago : double;
begin
  try //except
    qry := TFDQuery.Create(Self);
    qry.Connection := Conexao;

    loqry := tfdquery.Create(self);
    loqry.Connection := conexao;

    { controle de estoques }
    if operacao = opAlterar then
    begin

      {como é uma edição/alteração... devemos devolver as quantidades para o
      estoque(tabela de produtos), e, depois da gravação, retirar as modificadas
      quantidade(somente na tabela de produtos)}
      {lista os itens do pedido que esta sendo alterado}
      loqry.SQL.Clear;
      loqry.SQL.Add('select i.id, p.orcamento, i.produto_id, i.situacao, i.qtde from pedidos_itens i, pedidos p where p.id = i.pedido_id and i.pedido_id =:pedido_id');
      loqry.ParamByName('pedido_id').AsInteger := codigo;
      loqry.Open;

      {só devolve os estoques se for pedido}
      if loqry.FieldByName('orcamento').AsString = 'N' then
      begin
        loqry.First;
        while not loqry.eof do
        begin
          unit_movimenta_estoques.prc_atualizar_estoque( loqry.FieldByName('PRODUTO_ID').AsInteger,
                         'ENTRADA',
                         loqry.FieldByName('SITUACAO').AsString,
                         loqry.FieldByName('QTDE').AsFloat);

          loqry.Next;
        end;

        {lista dos itens de laje}
        loqry.SQL.Clear;
        loqry.SQL.Add('select id, produto_id, situacao, qtde from pedidos_itens_laje where pedido_id =:pedido_id');
        loqry.ParamByName('pedido_id').AsInteger := codigo;
        loqry.Open;
        loqry.First;
        while not loqry.eof do
        begin
          unit_movimenta_estoques.prc_atualizar_estoque( loqry.FieldByName('PRODUTO_ID').AsInteger,
                         'ENTRADA',
                         loqry.FieldByName('SITUACAO').AsString,
                         loqry.FieldByName('QTDE').AsFloat);

          loqry.Next;
        end;
      end;
    end;


    try //finnaly
      with qry, qry.Sql do
      begin
        if operacao = opAlterar then
        begin
          Add('UPDATE                                          ');
          Add('  PEDIDOS                                       ');
          Add('SET                                             ');
          Add('  ID                   = :ID,                   ');
          Add('  NOSSO_NUMERO         = :NOSSO_NUMERO,         ');
          Add('  ENTRADA_SAIDA        = :ENTRADA_SAIDA,        ');
          Add('  SERIE                = :SERIE,                ');
          Add('  CHAVE_ACESSO         = :CHAVE_ACESSO,         ');
          Add('  PROTOCOLO_AUTORIZACAO= :PROTOCOLO_AUTORIZACAO,');
          Add('  NAT_OPERACAO         = :NAT_OPERACAO,         ');
          Add('  DATA_EMISSAO         = :DATA_EMISSAO,         ');
          Add('  DATA_ENTRADA_SAIDA   = :DATA_ENTRADA_SAIDA,   ');
          Add('  DATA_CONTABIL        = :DATA_CONTABIL,        ');
          Add('  ORCAMENTO            = :ORCAMENTO,            ');
          Add('  SITUACAO             = :SITUACAO,             ');
          Add('  FORMA_PAGTO_ID       = :FORMA_PAGTO_ID,       ');
          Add('  CLIENTE_ID           = :CLIENTE_ID,           ');
          Add('  VENDEDOR_ID          = :VENDEDOR_ID,          ');
          Add('  VALOR_PRODUTOS       = :VALOR_PRODUTOS,       ');
          Add('  FRETE_CLIENTE        = :FRETE_CLIENTE,        ');
          Add('  FRETE_EMITENTE       = :FRETE_EMITENTE,       ');
          Add('  DESCRICAO_ACRESCIMO  = :DESCRICAO_ACRESCIMO,  ');
          Add('  ACRESCIMO            = :ACRESCIMO,            ');
          Add('  DESCONTO             = :DESCONTO,             ');
          Add('  BASE_ICMS            = :BASE_ICMS,            ');
          Add('  VALOR_ICMS           = :VALOR_ICMS,           ');
          Add('  BASE_ICMS_ST         = :BASE_ICMS_ST,         ');
          Add('  VALOR_ICMS_ST        = :VALOR_ICMS_ST,        ');
          Add('  VALOR_SEGURO         = :VALOR_SEGURO,         ');
          Add('  VALOR_IPI            = :VALOR_IPI,            ');
          Add('  VALOR_TOTAL_PEDIDO   = :VALOR_TOTAL_PEDIDO,   ');
          Add('  TRANSPORTADORA_ID    = :TRANSPORTADORA_ID,    ');
          Add('  FRETE_POR_CONTA      = :FRETE_POR_CONTA,      ');
          Add('  PRODUTOS_QTDE        = :PRODUTOS_QTDE,        ');
          Add('  ESPECIE              = :ESPECIE,              ');
          Add('  MARCA                = :MARCA,                ');
          Add('  NUMERACAO            = :NUMERACAO,            ');
          Add('  PESO_BRUTO           = :PESO_BRUTO,           ');
          Add('  PESO_LIQUIDO         = :PESO_LIQUIDO,         ');
          Add('  OBS_ADM              = :OBS_ADM,              ');
          Add('  OBS_ENTREGA          = :OBS_ENTREGA,          ');
          Add('  COMISSAO_VENDEDOR_INFORMADA = :COMISSAO_VENDEDOR_INFORMADA , ');
          Add('  DATA_ENTREGA         = :DATA_ENTREGA,         ');
          Add('  DATA_ALTERACAO       = :DATA_ALTERACAO        ');
          Add('WHERE                                           ');
          Add('  ID = :ID                                      ');
          ParamByName('ID').AsInteger := Codigo;
        end;
        //else
        if operacao = OpIncluir then
        begin
          Add('INSERT INTO             ');
          Add('  PEDIDOS               ');
          Add(' (ID,                   ');
          Add('  NOSSO_NUMERO,         ');
          Add('  ENTRADA_SAIDA,        ');
          Add('  SERIE,                ');
          Add('  CHAVE_ACESSO,         ');
          Add('  PROTOCOLO_AUTORIZACAO,');
          Add('  NAT_OPERACAO,         ');
          Add('  DATA_EMISSAO,         ');
          Add('  DATA_ENTRADA_SAIDA,   ');
          Add('  DATA_CONTABIL,        ');
          Add('  ORCAMENTO,            ');
          Add('  SITUACAO,             ');
          Add('  FORMA_PAGTO_ID,       ');
          Add('  CLIENTE_ID,           ');
          Add('  VENDEDOR_ID,          ');
          Add('  VALOR_PRODUTOS,       ');
          Add('  FRETE_CLIENTE,        ');
          Add('  FRETE_EMITENTE,       ');
          Add('  DESCRICAO_ACRESCIMO,  ');
          Add('  ACRESCIMO,            ');
          Add('  DESCONTO,             ');
          Add('  BASE_ICMS,            ');
          Add('  VALOR_ICMS,           ');
          Add('  BASE_ICMS_ST,         ');
          Add('  VALOR_ICMS_ST,        ');
          Add('  VALOR_SEGURO,         ');
          Add('  VALOR_IPI,            ');
          Add('  VALOR_TOTAL_PEDIDO,   ');
          Add('  TRANSPORTADORA_ID,    ');
          Add('  FRETE_POR_CONTA,      ');
          Add('  PRODUTOS_QTDE,        ');
          Add('  ESPECIE,              ');
          Add('  MARCA,                ');
          Add('  NUMERACAO,            ');
          Add('  PESO_BRUTO,           ');
          Add('  PESO_LIQUIDO,         ');
          Add('  VALOR_PAGO,           ');
          Add('  PAGO,                 ');
          Add('  OBS_ADM,              ');
          Add('  OBS_ENTREGA,          ');
          Add('  COMISSAO_VENDEDOR_INFORMADA, ');
          Add('  DATA_ENTREGA,          ');
          Add('  DATA_ALTERACAO)        ');
          Add('VALUES                   ');
          Add(' (:ID,                   ');
          Add('  :NOSSO_NUMERO,         ');
          Add('  :ENTRADA_SAIDA,        ');
          Add('  :SERIE,                ');
          Add('  :CHAVE_ACESSO,         ');
          Add('  :PROTOCOLO_AUTORIZACAO,');
          Add('  :NAT_OPERACAO,         ');
          Add('  :DATA_EMISSAO,         ');
          Add('  :DATA_ENTRADA_SAIDA,   ');
          Add('  :DATA_CONTABIL,        ');
          Add('  :ORCAMENTO,            ');
          Add('  :SITUACAO,             ');
          Add('  :FORMA_PAGTO_ID,       ');
          Add('  :CLIENTE_ID,           ');
          Add('  :VENDEDOR_ID,          ');
          Add('  :VALOR_PRODUTOS,       ');
          Add('  :FRETE_CLIENTE,        ');
          Add('  :FRETE_EMITENTE,       ');
          Add('  :DESCRICAO_ACRESCIMO,  ');
          Add('  :ACRESCIMO,            ');
          Add('  :DESCONTO,             ');
          Add('  :BASE_ICMS,            ');
          Add('  :VALOR_ICMS,           ');
          Add('  :BASE_ICMS_ST,         ');
          Add('  :VALOR_ICMS_ST,        ');
          Add('  :VALOR_SEGURO,         ');
          Add('  :VALOR_IPI,            ');
          Add('  :VALOR_TOTAL_PEDIDO,   ');
          Add('  :TRANSPORTADORA_ID,    ');
          Add('  :FRETE_POR_CONTA,      ');
          Add('  :PRODUTOS_QTDE,        ');
          Add('  :ESPECIE,              ');
          Add('  :MARCA,                ');
          Add('  :NUMERACAO,            ');
          Add('  :PESO_BRUTO,           ');
          Add('  :PESO_LIQUIDO,         ');
          Add('  :VALOR_PAGO,           ');
          Add('  :PAGO,                 ');
          Add('  :OBS_ADM,              ');
          Add('  :OBS_ENTREGA,          ');
          Add('  :COMISSAO_VENDEDOR_INFORMADA, ');
          Add('  :DATA_ENTREGA,         ');
          Add('  :DATA_ALTERACAO)       ');

          Codigo := uBiblioteca.AutoIncremento(conexao, 'PEDIDOS');
          ParamByName('ID').AsInteger       := Codigo;
          ParamByName('VALOR_PAGO').AsFloat := 0;
          ParamByName('PAGO').AsString      := 'N';

        end;

        ParamByName('NOSSO_NUMERO').AsString          := edt_nosso_numero.text;
        ParamByName('ENTRADA_SAIDA').AsString         := 'S';
        ParamByName('SERIE').AsInteger                := 1;
        ParamByName('CHAVE_ACESSO').AsString          := '';
        ParamByName('PROTOCOLO_AUTORIZACAO').AsString := '';
        ParamByName('NAT_OPERACAO').AsString          := 'VENDA';
        ParamByName('DATA_EMISSAO').AsDate            := strtodate(edt_emissao.Caption);
        ParamByName('DATA_ENTRADA_SAIDA').AsDate      := dtpDataEntrega.Date;
        ParamByName('DATA_CONTABIL').AsDate           := dtpDataContabil.Date;
        ParamByName('ORCAMENTO').AsString             := uBiblioteca.SeSenao( cb_orcamento.Checked, 'S','N' );
        ParamByName('SITUACAO').AsString              := cbx_situacao.Text;
        ParamByName('FORMA_PAGTO_ID').AsInteger       := p_forma_pagto_id;
        ParamByName('CLIENTE_ID').AsInteger           := p_cliente_id;
        ParamByName('VENDEDOR_ID').AsInteger          := p_vendedor_id;
        ParamByName('VALOR_PRODUTOS').AsFloat         := strtofloat(edt_valor_produtos.Caption);
        ParamByName('FRETE_CLIENTE').AsFloat          := strtofloat(edt_frete_cliente.Text);
        ParamByName('FRETE_EMITENTE').AsFloat         := 0;
        ParamByName('DESCRICAO_ACRESCIMO').AsString   := cbx_desc_acrescimo.Text;
        ParamByName('ACRESCIMO').AsFloat              := strtofloat(edt_acrescimo.Text);
        ParamByName('DESCONTO').AsFloat               := strtofloat(edt_desconto.Text);
        ParamByName('BASE_ICMS').AsFloat              := StrToFloatDef(edt_base_icms.Text,0);
        ParamByName('VALOR_ICMS').AsFloat             := strtofloatDef(edt_valor_icms.Text,0);
        ParamByName('BASE_ICMS_ST').AsFloat           := strtofloatDef(edt_valor_icms_st.Text,0);
        ParamByName('VALOR_ICMS_ST').AsFloat          := strtofloatDef(edt_valor_icms_st.Text,0);
        ParamByName('VALOR_SEGURO').AsFloat           := strtofloatDef(edt_valor_seguro.Text,0);
        ParamByName('VALOR_IPI').AsFloat              := strtofloatDef(edt_valor_ipi.Text,0);
        ParamByName('VALOR_TOTAL_PEDIDO').AsFloat     := strtofloat(edt_valor_total.Caption);
        ParamByName('TRANSPORTADORA_ID').AsInteger    := p_transportadora_id;
        ParamByName('FRETE_POR_CONTA').AsInteger      := p_frete_por_conta;
        ParamByName('PRODUTOS_QTDE').AsFloat          := StrToFloatDef(edt_qtde_volumes.Text,0);
        ParamByName('ESPECIE').AsString               := edt_especie.Text;
        ParamByName('MARCA').AsString                 := edt_marca.Text;
        ParamByName('NUMERACAO').AsString             := edt_numero_frete.Text;
        ParamByName('PESO_BRUTO').AsString            := edt_peso_bruto.Text;
        ParamByName('PESO_LIQUIDO').AsString          := edt_peso_liquido.Text;
        ParamByName('OBS_ADM').AsString               := mm_obs_adm.Lines.Text;
        ParamByName('OBS_ENTREGA').AsString           := mm_obs_entrega.Lines.Text;
        ParamByName('COMISSAO_VENDEDOR_INFORMADA').AsFloat := strtofloatDef(edt_comissao_vendedor_informada.Text,0);
        ParamByName('DATA_ENTREGA').AsDate            := dtpDataEntrega.Date;
        ParamByName('DATA_ALTERACAO').AsDate          := date;

        //if operacao = OpIncluir then
        //begin
        //  open;
        //end else
        //if operacao = opAlterar then
        //begin
          ExecSQL;
        //end;
      end; // inseriu, alterou ou exclui a cabeça do pedido

      {salvar local da entrega}
      if ( (edt_nome.Text <> '') or ( edt_endereco.Text <> '') ) then
      begin
        { verifica se tem algum dado no banco de dados }
        uBiblioteca.FilterCds(qryLocalEntrega, fsInteger, IntToStr(Codigo));
        { não achou nada no banco... inclui }
        if qryLocalEntrega.IsEmpty then
          fnc_incluir_alterar_local_entrega( OpIncluir )
        else
        { achou nada no banco... altera }
          fnc_incluir_alterar_local_entrega(opAlterar);
      end
      else
      { não tem nada nos edits }
      begin
        { achou algo no banco... exclui }
        if not qryLocalEntrega.IsEmpty then
          fnc_incluir_alterar_local_entrega(opExcluir);
      end;

      { salvar itens do pedido }
      SalvarItensVenda;

      { salvar itens da laje }
      if not cdsItensLaje.IsEmpty then
      begin
        SalvarItensLaje( p_altura_Laje, cdsItensLajeDeletados, qryGravaItensLaje, cdsItensLaje );
      end;

      {salvar concreto_realizado}
      {se chegou até aqui é pq validou todos os campos do concreto realizado}
      if not mtb_concreto_utilizado.IsEmpty then
        fnc_incluir_alterar_concreto_realizado( operacao );

      //Atualiza os estoques da tabela de produtos
      // a baixa dos estoques fisico sera atraves do frmPedidosBaixa
      {se for orçamento não há o porque de se movimentar os estoques }
      if cb_orcamento.Checked = false then
      begin
        {Retira as quantidades utilizadas nesse pedido do estoque na tabela
        de produtos}

        {como da situação do pedido pode ter sido alterada orcamento pra pedido
        ou vice versa, tenho que usar os dados do banco de dados pois nesse
        momento ja refletem o que esta na tela de pedidos}
        {lista dos itens do pedido}
        loqry.SQL.Clear;
        loqry.SQL.Add('select id, produto_id, situacao, qtde from pedidos_itens where pedido_id =:pedido_id');
        loqry.ParamByName('pedido_id').AsInteger := codigo;

        loqry.Open;
        loqry.First;
        while not loqry.eof do
        begin
          unit_movimenta_estoques.prc_atualizar_estoque
                                     (
                                     loqry.FieldByName('PRODUTO_ID').AsInteger,
                                     'SAIDA',
                                     loqry.FieldByName('SITUACAO').AsString,
                                     loqry.FieldByName('QTDE').AsFloat
                                     );
          loqry.Next;
        end;

        {lista dos itens de laje}
        loqry.SQL.Clear;
        loqry.SQL.Add('select id, produto_id, situacao, qtde from pedidos_itens_laje where pedido_id =:pedido_id');
        loqry.ParamByName('pedido_id').AsInteger := codigo;
        loqry.Open;
        loqry.First;
        while not loqry.eof do
        begin
          unit_movimenta_estoques.prc_atualizar_estoque( loqry.FieldByName('PRODUTO_ID').AsInteger,
                         'SAIDA',
                         loqry.FieldByName('SITUACAO').AsString,
                         loqry.FieldByName('QTDE').AsFloat);

          loqry.Next;
        end;


      end;//fim retira estoques


      { gerar conta a receber }
      if uFinanceiro.AddContasReceber(
         self.Conexao,
         codigo,
         dtpDataContabil.Date,// datacontabil
         qryClientes.FieldByName('ID').AsInteger,
         'PEDIDOS',
         codigo,
         1,
         1,
         (strtofloat(edt_valor_produtos.Caption) + strtofloat(edt_frete_cliente.text) + strtofloat(edt_acrescimo.text) ),
         strtofloat(edt_desconto.text),
         0,
         0,
         0,
         date+30,
         -1, //data pagamento
         uBiblioteca.SeSenao(Operacao = opAlterar, strtofloat(edt_valor_pago.Caption), 0), // valor pago
         //'PEDIDO ID.' +  inttostr(codigo) + '/ NOSSO NÚMERO ' + edt_nosso_numero.Caption,
         uBiblioteca.SeSenao( edt_endereco.Text <> '', 'PED N.' +  inttostr(codigo) + ' ' + edt_endereco.Text, 'PED N.' +  inttostr(codigo) + ' ' + DBEdit3.Text) ,
         '',
         1 // plano de contas : depois pegar o codido
        ) then ;

      {CENTRAL CONTAS A PAGAR}
      {PEDIDO}
      {id´s das contas cadastrados no plano de contas}
      v_comissao_vendedor_id := qry_sistema.FieldByName('PEDIDO_CONTA_COMISSAO_VEND').AsInteger;
      v_comissao_adm_id      := qry_sistema.FieldByName('PEDIDO_CONTA_COMISSAO_ADM').AsInteger;
      v_concreto_usinado_id  := qry_sistema.FieldByName('PEDIDO_CONCRETO_USINADO').AsInteger;
      v_bomba_concreto_id    := qry_sistema.FieldByName('PEDIDO_BOMBA_CONCRETO').AsInteger;
      (*
      ShowMessage('comissao vendedor '+ inttostr(v_comissao_vendedor_id) + slinebreak +
                  'comissao adm '+ inttostr(v_comissao_adm_id) + slinebreak +
                  'concreto '+ inttostr(v_concreto_usinado_id) + slinebreak +
                  'bomba '+ inttostr(v_bomba_concreto_id)
                  );
      *)
      if cb_orcamento.Checked = false then
      begin
        {carrega a variavel vr_comissao_vendedor de acordo com a empresa}
        if qry_sistema.FieldByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString = 'S' then
          {triunfo, pega o calculo da comissao da lajes triunfo }
          vr_comissao_vendedor := strtofloatdef(lbl_comissao_vendedor.Caption,0)
        else
        if qry_sistema.FieldByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString = 'N' then
          {pega o valor digitado pelo usuario no edit}
          vr_comissao_vendedor := strtofloatdef(edt_comissao_vendedor_informada.Text,0);

        //ShowMessage('vr_comissao_vendedor ' + floattostr(vr_comissao_vendedor));

        {OPERACAO INCLUIR}
        if operacao = opIncluir then
        begin
          //ShowMessage('INCLUIR');
          {comissão do vendedor}
          {verifica se o valor da comissão(vr_comissao_vendedor) é maior que 0}
          if vr_comissao_vendedor > 0 then
          begin
            {incluir no contas a pagar a comissão do vendedor}
            ufinanceiro.prc_contas_pagar(
                                         Opincluir, conexao, -1, Codigo{n. pedido}, v_comissao_vendedor_id{ 53},
                                         p_vendedor_id,  inttostr(codigo){n. documento},
                                         'COMISSÃO DE VENDEDOR REF PED. ' + inttostr(codigo), 'PEDIDOS',codigo,
                                         //1, 1, strtofloatdef(lbl_comissao_vendedor.Caption,0),
                                         1, 1, vr_comissao_vendedor,
                                         0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                        );

          end else
          if vr_comissao_vendedor <= 0 then
          begin
            {comissão vendedor = 0}
            {não faz nada}
          end;

          {comissão adm - triunfo}
          if qry_sistema.FieldByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString = 'S' then
          begin
            if strtofloatdef(lbl_comissao_adm.Caption,0) > 0 then
              {jocelio depois ver essa questão da pessoa que esta sendo lançada nesta conta}
              ufinanceiro.prc_contas_pagar(
                                           OpIncluir, conexao, -1, Codigo{n. pedido}, v_comissao_adm_id{73},
                                           p_vendedor_id, inttostr(codigo){n. documento},
                                           'COMISSÃO ADMINISTRATIVA REF PED. ' + inttostr(codigo), 'PEDIDOS',
                                           codigo, 1, 1, strtofloatdef(lbl_comissao_adm.Caption,0),
                                           0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                           );
          end;
          {fim comissões}

          {concreto usinado e bomba}
          if not mtb_concreto_utilizado.IsEmpty then
          begin
            {se há alguma no memtable concreto é pq ja foi validado}
            {concreto}
            ufinanceiro.prc_contas_pagar(
                                         operacao, conexao, -1, Codigo{n. pedido},v_comissao_vendedor_id{53},
                                         cbx_fornecedor_concreto.KeyValue,  inttostr(codigo){n. documento},
                                         'COMPRA DE CONCRETO USINADO REF PED. ' + inttostr(codigo), 'PEDIDOS',codigo,
                                         1, 1, mtb_concreto_utilizadoTOTAL_CONCRETO.Value,
                                         0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                         );

            {bomba}
            ufinanceiro.prc_contas_pagar(
                                         operacao, conexao, -1, Codigo{n. pedido}, v_comissao_adm_id{73},
                                         cbx_prestador_servico.KeyValue, inttostr(codigo){n. documento},
                                         'CONTRATAÇÃO DE SERVIÇO DE BOMBA DE CONCRETO REF PED. ' + inttostr(codigo), 'PEDIDOS',
                                         codigo, 1, 1, strtofloatdef(edt_preco_custo_bomba.Text,0),
                                         0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                         );
          end;
          {frete}
          {a ser implementado mais tarde}

          {fim a operacao incluir}
        end else
        {OPERACAO ALTERAR}
        if operacao = opAlterar then
        begin
//ShowMessage('ALTERAR');
          {Comissão vendedor}

          {verifica se tem algum lançamento de comissão pro vendedor lançada}
          qry.SQL.Clear;
          qry.SQL.Add('select id, acrescimo, desconto, multa, juros, valor_pago from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id and plano_contas_id =:plano_contas_id');
          qry.ParamByName('tabela_origem').Asstring    := 'PEDIDOS';
          qry.ParamByName('tabela_id').AsInteger       := codigo;
          qry.ParamByName('plano_contas_id').AsInteger :=  v_comissao_vendedor_id; // comissão de vendedores = 53
          qry.Open;
          if not qry.IsEmpty then
          begin
            // achou
            vr_acrescimo  := qry.fieldByName('acrescimo').AsFloat;
            vr_desconto   := qry.fieldByName('desconto').AsFloat;
            vr_multa      := qry.fieldByName('multa').AsFloat;
            vr_juros      := qry.fieldByName('juros').AsFloat;
            vr_valor_pago := qry.fieldByName('valor_pago').AsFloat;

            {tem comissão vendedor lançada}
            {o valor da comissão é maior que zero então editar e alterar}
            if vr_comissao_vendedor > 0 then
            begin
//ShowMessage('atualizando a comissão do vendedor');
              qry.SQL.Clear;
              qry.SQL.Add('update ');
              qry.SQL.Add('  contas_pagar set ');
              qry.SQL.Add('pessoa_id =:pessoa_id, alterado_em =:alterado_em, valor_parcela =:valor_parcela, total_parcela =:total_parcela, saldo_aberto =:saldo_aberto, pago =:pago  ');
              qry.SQL.Add('  where tabela_origem =:tabela_origem and tabela_id =:tabela_id and plano_contas_id =:plano_contas_id');
              qry.ParamByName('pessoa_id').AsInteger   := p_vendedor_id;
              qry.ParamByName('alterado_em').AsDate    := date;
              qry.ParamByName('valor_parcela').AsFloat := vr_comissao_vendedor;
              qry.ParamByName('total_parcela').AsFloat := vr_comissao_vendedor + vr_multa + vr_juros - vr_desconto;
              qry.ParamByName('saldo_aberto').AsFloat  := (vr_comissao_vendedor + vr_multa + vr_juros - vr_desconto) - vr_valor_pago;
              qry.ParamByName('pago').Asstring         := ubiblioteca.SeSenao((vr_comissao_vendedor + vr_multa + vr_juros - vr_desconto) - vr_valor_pago > 0.01, 'N','S');
              qry.ParamByName('tabela_origem').Asstring:= 'PEDIDOS';
              qry.ParamByName('tabela_id').AsInteger   := codigo;
              qry.ParamByName('plano_contas_id').AsInteger := v_comissao_vendedor_id {53};
              qry.ExecSQL;
            end else
            {tem comissão vendedor lançada, mas a comissão é menor ou igual a zero}
            if vr_comissao_vendedor <= 0 then
            begin
              {tem algum valor pago}
              if vr_valor_pago > 0 then
              begin
                criarMensagem('AVISO','COMISSÃO DO VENDEDOR ZERADA, PORÉM O VENDEDOR JA RECEBEU ALGUM VALOR DESTA COMISSÃO');
              end else
              if vr_valor_pago <= 0 then
              begin
                qry.SQL.Clear;
                qry.SQL.Add('delete from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id');
                qry.ParamByName('tabela_origem').Asstring := 'PEDIDOS';
                qry.ParamByName('tabela_id').AsInteger    := codigo;
                qry.ExecSQL;
              end;
            end
          end else
          {não tem comissão vendedor lançada,
          mas o valor da comissão é maior que zero então lançar}
          if qry.IsEmpty then
          begin
            if vr_comissao_vendedor > 0 then
            begin
              //ShowMessage('não achou  a comissão do vendedor...incluir');
              {incluir no contas a pagar a comissão do vendedor}
              ufinanceiro.prc_contas_pagar(
                                           Opincluir, conexao, -1, Codigo{n. pedido}, v_comissao_vendedor_id {53},
                                           p_vendedor_id,  inttostr(codigo){n. documento},
                                           'COMISSÃO DE VENDEDOR REF PED. ' + inttostr(codigo), 'PEDIDOS',codigo,
                                           //1, 1, strtofloatdef(lbl_comissao_vendedor.Caption,0),
                                           1, 1, vr_comissao_vendedor,
                                           0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                          );

            end else
            {não tem comissão vendedor lançada, mas o valor da comissão é zero.}
            if vr_comissao_vendedor <= 0 then
            begin
              {não faz nada}
            end;
          end;
          // fim alterar comissoes

          {Fornecedor do concreto usinado}
          {verifica se tem algum lançamento de concreto}
          qry.SQL.Clear;
          qry.SQL.Add('select id, acrescimo, desconto, multa, juros, valor_pago from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id and plano_contas_id =:plano_contas_id');
          qry.ParamByName('tabela_origem').Asstring    := 'PEDIDOS';
          qry.ParamByName('tabela_id').AsInteger       := codigo;
          qry.ParamByName('plano_contas_id').AsInteger :=  v_concreto_usinado_id; // concreto usinado
          qry.Open;
          if not qry.IsEmpty then
          begin
            vr_acrescimo  := qry.fieldByName('acrescimo').AsFloat;
            vr_desconto   := qry.fieldByName('desconto').AsFloat;
            vr_multa      := qry.fieldByName('multa').AsFloat;
            vr_juros      := qry.fieldByName('juros').AsFloat;
            vr_valor_pago := qry.fieldByName('valor_pago').AsFloat;
//ShowMessage('valor concreto ' +  vartostr( mtb_concreto_utilizadoTOTAL_CONCRETO.AsVariant));
            {tem concreto lançado}
            {o valor da conta é maior que zero então editar e alterar}
            if mtb_concreto_utilizadoTOTAL_CONCRETO.Value > 0 then
            begin
//showmessage('atualizando concreto usinado');
              qry.SQL.Clear;
              qry.SQL.Add('update ');
              qry.SQL.Add('  contas_pagar set ');
              qry.SQL.Add('pessoa_id =:pessoa_id, alterado_em =:alterado_em, valor_parcela =:valor_parcela, total_parcela =:total_parcela, saldo_aberto =:saldo_aberto, pago =:pago  ');
              qry.SQL.Add('  where tabela_origem =:tabela_origem and tabela_id =:tabela_id and plano_contas_id =:plano_contas_id');
              qry.ParamByName('pessoa_id').AsInteger   := cbx_fornecedor_concreto.KeyValue;
              qry.ParamByName('alterado_em').AsDate    := date;
              qry.ParamByName('valor_parcela').AsFloat := mtb_concreto_utilizadoTOTAL_CONCRETO.Value;
              qry.ParamByName('total_parcela').AsFloat := mtb_concreto_utilizadoTOTAL_CONCRETO.Value + vr_multa + vr_juros - vr_desconto;
              qry.ParamByName('saldo_aberto').AsFloat  := (mtb_concreto_utilizadoTOTAL_CONCRETO.Value + vr_multa + vr_juros - vr_desconto) - vr_valor_pago;
              qry.ParamByName('pago').Asstring         := ubiblioteca.SeSenao((mtb_concreto_utilizadoTOTAL_CONCRETO.Value + vr_multa + vr_juros - vr_desconto) - vr_valor_pago > 0.01, 'N','S');
              qry.ParamByName('tabela_origem').Asstring:= 'PEDIDOS';
              qry.ParamByName('tabela_id').AsInteger   := codigo;
              qry.ParamByName('plano_contas_id').AsInteger := v_concreto_usinado_id ;
              qry.ExecSQL;
            end else
            {tem conta de concreto lançado, mas o valor é menor ou igual a zero}
            if mtb_concreto_utilizadoTOTAL_CONCRETO.Value <= 0 then
            begin
              {tem algum valor pago}
              if vr_valor_pago > 0 then
              begin
                criarMensagem('AVISO','COMISSÃO DO VENDEDOR ZERADA, PORÉM O VENDEDOR JA RECEBEU ALGUM VALOR DESTA COMISSÃO');
              end else
              if vr_valor_pago <= 0 then
              begin
                qry.SQL.Clear;
                qry.SQL.Add('delete from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id');
                qry.ParamByName('tabela_origem').Asstring := 'PEDIDOS';
                qry.ParamByName('tabela_id').AsInteger    := codigo;
                qry.ExecSQL;
              end;
            end;
          end else
          {não tem concreto lançado, mas o valor da comissão é maior que zero então lançar}
          if qry.IsEmpty then
          begin
            if mtb_concreto_utilizadoTOTAL_CONCRETO.Value > 0 then
            begin
//showmessage('incluindo concreto usinado');
              {incluir no contas a pagar a comissão do vendedor}
              ufinanceiro.prc_contas_pagar(
                                           Opincluir, conexao, -1, Codigo{n. pedido}, v_concreto_usinado_id,
                                           cbx_fornecedor_concreto.KeyValue,  inttostr(codigo){n. documento},
                                           'COMPRA DE CONCRETO USINADO REF PED. ' + inttostr(codigo) , 'PEDIDOS',codigo,
                                           //1, 1, strtofloatdef(lbl_comissao_vendedor.Caption,0),
                                           1, 1, mtb_concreto_utilizadoTOTAL_CONCRETO.Value,
                                           0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                          );

            end else
            {não tem concreto usinado lançado, mas o valor da conta é zero.}
            if mtb_concreto_utilizadoTOTAL_CONCRETO.Value <= 0 then
            begin
              {não faz nada}
            end;
          end;

          {Fornecedora da bomba de concreto}
          {verifica se tem algum lançamento de bomba}
          qry.SQL.Clear;
          qry.SQL.Add('select id, acrescimo, desconto, multa, juros, valor_pago from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id and plano_contas_id =:plano_contas_id');
          qry.ParamByName('tabela_origem').Asstring    := 'PEDIDOS';
          qry.ParamByName('tabela_id').AsInteger       := codigo;
          qry.ParamByName('plano_contas_id').AsInteger :=  v_bomba_concreto_id; // bomba de concreto
          qry.Open;
          if not qry.IsEmpty then
          begin
            vr_acrescimo  := qry.fieldByName('acrescimo').AsFloat;
            vr_desconto   := qry.fieldByName('desconto').AsFloat;
            vr_multa      := qry.fieldByName('multa').AsFloat;
            vr_juros      := qry.fieldByName('juros').AsFloat;
            vr_valor_pago := qry.fieldByName('valor_pago').AsFloat;

            {tem concreto lançado}
            {o valor da conta é maior que zero então editar e alterar}
            if strtofloatdef(edt_total_bomba.Text,0) > 0 then
            begin
//ShowMessage('atualizando bomba');
              qry.SQL.Clear;
              qry.SQL.Add('update ');
              qry.SQL.Add('  contas_pagar set ');
              qry.SQL.Add('pessoa_id =:pessoa_id, alterado_em =:alterado_em, valor_parcela =:valor_parcela, total_parcela =:total_parcela, saldo_aberto =:saldo_aberto, pago =:pago  ');
              qry.SQL.Add('  where tabela_origem =:tabela_origem and tabela_id =:tabela_id and plano_contas_id =:plano_contas_id');
              qry.ParamByName('pessoa_id').AsInteger   := cbx_prestador_servico.KeyValue;
              qry.ParamByName('alterado_em').AsDate    := date;
              qry.ParamByName('valor_parcela').AsFloat := strtofloatdef(edt_total_bomba.Text,0);
              qry.ParamByName('total_parcela').AsFloat := strtofloatdef(edt_total_bomba.Text,0) + vr_multa + vr_juros - vr_desconto;
              qry.ParamByName('saldo_aberto').AsFloat  := (strtofloatdef(edt_total_bomba.Text,0) + vr_multa + vr_juros - vr_desconto) - vr_valor_pago;
              qry.ParamByName('pago').Asstring         := ubiblioteca.SeSenao((strtofloatdef(edt_total_bomba.Text,0) + vr_multa + vr_juros - vr_desconto) - vr_valor_pago > 0.01, 'N','S');
              qry.ParamByName('tabela_origem').Asstring:= 'PEDIDOS';
              qry.ParamByName('tabela_id').AsInteger   := codigo;
              qry.ParamByName('plano_contas_id').AsInteger := v_bomba_concreto_id ;
              qry.ExecSQL;
            end else
            {tem conta de bomba lançada, mas o valor é menor ou igual a zero}
            if strtofloatdef(edt_total_bomba.Text,0) <= 0 then
            begin
              {tem algum valor pago}
              if vr_valor_pago > 0 then
              begin
                criarMensagem('AVISO','COMISSÃO DO VENDEDOR ZERADA, PORÉM O VENDEDOR JA RECEBEU ALGUM VALOR DESTA COMISSÃO');
              end else
              if vr_valor_pago <= 0 then
              begin
                qry.SQL.Clear;
                qry.SQL.Add('delete from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id');
                qry.ParamByName('tabela_origem').Asstring := 'PEDIDOS';
                qry.ParamByName('tabela_id').AsInteger    := codigo;
                qry.ExecSQL;
              end;
            end;
          end else
          if qry.IsEmpty then
          begin
            {não tem bomba lançada, mas o valor da conta é maior que zero então lançar}
            if strtofloatdef(edt_total_bomba.Text,0) > 0 then
            begin
              {incluir no contas a pagar a comissão do vendedor}
              ufinanceiro.prc_contas_pagar(
                                           Opincluir, conexao, -1, Codigo{n. pedido}, v_bomba_concreto_id {53},
                                           cbx_prestador_servico.KeyValue,  inttostr(codigo){n. documento},
                                           'CONTRATAÇÃO DE SERVICO DE BOMBA DE CONCRETO REF PED. ' + inttostr(codigo), 'PEDIDOS',codigo,
                                           //1, 1, strtofloatdef(lbl_comissao_vendedor.Caption,0),
                                           1, 1, strtofloatdef(edt_total_bomba.Text,0),
                                           0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                          );

            end else
            {não tem comissão vendedor lançada, mas o valor da comissão é zero.}
            if strtofloatdef(edt_total_bomba.Text,0) <= 0 then
            begin
              {não faz nada}
            end;
          end;

        end;
      end else
      {ORCAMENTO}
      if cb_orcamento.Checked = true then
      begin
        {verifica se tem algum lançamento desse pedido na tabela de contas a pagar}
        qry.SQL.Clear;
        qry.SQL.Add('select id, valor_pago from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id');
        qry.ParamByName('tabela_origem').Asstring := 'PEDIDOS';
        qry.ParamByName('tabela_id').AsInteger := codigo;
        qry.Open;
        {tem conta lancada...}
        if not qry.IsEmpty then
        begin
          {tem conta mas não pagamos nada... exclui.}
          if qry.fieldbyname('valor_pago').AsFloat <= 0.01 then
          begin
            qry.close;
            {deletar a conta encontrada pois se trata de um orcamento}
            qry.SQL.Clear;
            qry.SQL.Add('delete from contas_pagar where tabela_origem =:tabela_origem and tabela_id =:tabela_id');
            qry.ParamByName('tabela_origem').Asstring := 'PEDIDOS';
            qry.ParamByName('tabela_id').AsInteger := codigo;
            qry.ExecSQL;
          end else
          {tem conta com valor pago lançado... só avisa o usuario}
          if qry.fieldbyname('valor_pago').AsFloat > 0.01 then
          begin
            CriarMensagem('AVISO', 'EXISTE UMA CONTA A PAGAR DESTE ORCAMENTO COM VALORES PAGOS. VERIFIQUE!')
          end;
        end else
        if qry.IsEmpty then
        begin
          {não tem conta lancada...não faz nada}
          qry.close;
        end;

      end;{fim da central de contas a pagar}


    finally
      FreeAndNil(qry);
    end; // try/finnaly
  except
    on E : Exception do
       Raise Exception.Create(E.Message + ' '+ Self.Name + '.fnc_incluir_alterar_pedido');
  end; //try/exception
end;

function TfrmPedidosE.fnc_incluir_alterar_local_entrega(operacao: TOperacao): boolean;
var
  qry : TFDQuery;
  ID : integer;
begin
  //ShowMessage('incluir ou alterar endereco de entrega');
  try
    qry := TFDQuery.Create(Self);
    qry.Connection := Conexao;

    try
      if operacao = opExcluir then
      begin
        qry.SQL.Clear;
        qry.SQL.Add('delete from PEDIDOS_LOCAL_ENTREGA where PEDIDO_ID = :PEDIDO_ID');
        qry.Params.ParamByName('PEDIDO_ID').AsInteger := Codigo;
        qry.ExecSQL;
        //
        exit;
      end;


      if operacao = opAlterar then
      begin

        qry.sql.Clear;
        qry.sql.Add('UPDATE                       ');
        qry.sql.Add('  PEDIDOS_LOCAL_ENTREGA      ');
        qry.sql.Add('SET                          ');
        //Add('  ID        = :ID,         ');
        qry.sql.Add('  PEDIDO_ID   = :PEDIDO_ID,  ');
        qry.sql.Add('  NOME        = :NOME,       ');
        qry.sql.Add('  CELULAR     = :CELULAR,    ');
        qry.sql.Add('  TELEFONE    = :TELEFONE,    ');
        qry.sql.Add('  EMAIL       = :EMAIL,      ');
        qry.sql.Add('  ENDERECO    = :ENDERECO,   ');
        qry.sql.Add('  NUMERO      = :NUMERO,     ');
        qry.sql.Add('  BAIRRO      = :BAIRRO,     ');
        qry.sql.Add('  CIDADE      = :CIDADE,     ');
        qry.sql.Add('  UF          = :UF,         ');
        qry.sql.Add('  CEP         = :CEP,        ');
        qry.sql.Add('  COMPLEMENTO = :COMPLEMENTO ');
        qry.sql.Add('WHERE                        ');
        qry.sql.Add('  PEDIDO_ID = :PEDIDO_ID     ');

      end
      else
      begin
        qry.sql.Clear;
        qry.sql.Add('INSERT INTO             ');
        qry.sql.Add('   PEDIDOS_LOCAL_ENTREGA');
        qry.sql.Add('  (ID,                  ');
        qry.sql.Add('   PEDIDO_ID,           ');
        qry.sql.Add('   NOME,                ');
        qry.sql.Add('   CELULAR,             ');
        qry.sql.Add('   TELEFONE,            ');
        qry.sql.Add('   EMAIL,               ');
        qry.sql.Add('   ENDERECO,            ');
        qry.sql.Add('   NUMERO,              ');
        qry.sql.Add('   BAIRRO,              ');
        qry.sql.Add('   CIDADE,              ');
        qry.sql.Add('   UF,                  ');
        qry.sql.Add('   CEP,                 ');
        qry.sql.Add('   COMPLEMENTO)         ');
        qry.sql.Add('VALUES                  ');
        qry.sql.Add('  (:ID,                 ');
        qry.sql.Add('   :PEDIDO_ID,          ');
        qry.sql.Add('   :NOME,               ');
        qry.sql.Add('   :CELULAR,            ');
        qry.sql.Add('   :TELEFONE,           ');
        qry.sql.Add('   :EMAIL,              ');
        qry.sql.Add('   :ENDERECO,           ');
        qry.sql.Add('   :NUMERO,             ');
        qry.sql.Add('   :BAIRRO,             ');
        qry.sql.Add('   :CIDADE,             ');
        qry.sql.Add('   :UF,                 ');
        qry.sql.Add('   :CEP,                ');
        qry.sql.Add('   :COMPLEMENTO)        ');

        ID := uBiblioteca.AutoIncremento( conexao, 'PEDIDOS_LOCAL_ENTREGA');
        qry.ParamByName('ID').AsInteger         := ID;

      end;

      qry.ParamByName('PEDIDO_ID').AsInteger  := Codigo;
      qry.ParamByName('NOME').AsString        := edt_nome.Text;
      qry.ParamByName('CELULAR').AsString     := edt_celular.Text;
      qry.ParamByName('TELEFONE').AsString    := edt_telefone.Text;
      qry.ParamByName('EMAIL').AsString       := '';
      qry.ParamByName('ENDERECO').AsString    := edt_endereco.Text;
      qry.ParamByName('NUMERO').AsString      := edt_numero_entrega.Text;
      qry.ParamByName('BAIRRO').AsString      := edt_bairro.Text;
      qry.ParamByName('CIDADE').AsString      := edt_cidade.Text;
      qry.ParamByName('UF').AsString          := edt_uf.Text;
      qry.ParamByName('CEP').AsString         := edt_cep.Text;
      qry.ParamByName('COMPLEMENTO').AsString := edt_complemento.Text;

      qry.ExecSQL;


        Result := (qry.RowsAffected > 0);
    finally
      FreeAndNil(qry);
    end; // try/finnaly
  except
    on E : Exception do
       Raise Exception.Create(E.Message + Self.Name +'.Alterar');
  end; //try/exception

end;


function TfrmPedidosE.fnc_incluir_alterar_concreto_realizado(operacao: TOperacao): boolean;
var
  qry : TFDQuery;
  ID : integer;
begin
  try
    qry := TFDQuery.Create(Self);
    qry.Connection := Conexao;
    try

      {excluir no banco itens delatados pelo usuario}
      if not mtb_concreto_deletados.IsEmpty then
      begin
        qry.SQL.Clear;
        qry.SQL.Add('delete from PEDIDOS_CONCRETO_ITENS where id = :id');
        mtb_concreto_deletados.First;
        while not mtb_concreto_deletados.eof do
        begin

          qry.Params.ParamByName('id').AsInteger := mtb_concreto_deletados.FieldByName('id').AsInteger;
          qry.ExecSQL;
          mtb_concreto_deletados.next;

        end;
      end;

      {ver se esta cadastrado}
      qry.SQL.Clear;
      qry.SQL.Add('select ID from PEDIDOS_CONCRETOS where PEDIDO_ID = :PEDIDO_ID');
      qry.Params.ParamByName('PEDIDO_ID').AsInteger := Codigo;
      qry.open;

      if qry.IsEmpty then
        operacao := opincluir
      else
      begin
        operacao := opalterar;
      end;

      if operacao = opAlterar then
      begin
        qry.sql.Clear;
        qry.sql.Add('UPDATE                                          ');
        qry.sql.Add('  PEDIDOS_CONCRETOS                             ');
        qry.sql.Add('SET                                             ');
        qry.sql.Add('  PEDIDO_ID            = :PEDIDO_ID,            ');
        qry.sql.Add('  FORNECEDOR_ID        = :FORNECEDOR_ID,        ');
        qry.sql.Add('  PRESTADOR_SERVICO_ID = :PRESTADOR_SERVICO_ID, ');
        qry.sql.Add('  PRODUTO_BOMBA_ID     = :PRODUTO_BOMBA_ID,     ');
        qry.sql.Add('  BOMBA_VALOR          = :BOMBA_VALOR,          ');
        qry.sql.Add('  BOMBA_QTDE           = :BOMBA_QTDE,           ');
        qry.sql.Add('  BOMBA_TOTAL          = :BOMBA_TOTAL,          ');
        qry.sql.Add('  FUNCIONARIO          = :FUNCIONARIO,          ');
        qry.sql.Add('  DATA_EXEC            = :DATA_EXEC             ');
        qry.sql.Add('WHERE                                           ');
        qry.sql.Add('  PEDIDO_ID = :PEDIDO_ID                        ');
      end else
      if operacao = opincluir then
      begin
        qry.sql.Clear;
        qry.sql.Add('INSERT INTO              ');
        qry.sql.Add('   PEDIDOS_CONCRETOS     ');
        qry.sql.Add('   (PEDIDO_ID,           ');
        qry.sql.Add('   FORNECEDOR_ID,        ');
        qry.sql.Add('   PRESTADOR_SERVICO_ID, ');
        qry.sql.Add('   PRODUTO_BOMBA_ID,     ');
        qry.sql.Add('   BOMBA_VALOR,          ');
        qry.sql.Add('   BOMBA_QTDE,           ');
        qry.sql.Add('   BOMBA_TOTAL,          ');
        qry.sql.Add('   FUNCIONARIO,          ');
        qry.sql.Add('   DATA_EXEC)            ');
        qry.sql.Add('VALUES                   ');
        qry.sql.Add('   (:PEDIDO_ID,          ');
        qry.sql.Add('   :FORNECEDOR_ID,       ');
        qry.sql.Add('   :PRESTADOR_SERVICO_ID,');
        qry.sql.Add('   :PRODUTO_BOMBA_ID,    ');
        qry.sql.Add('   :BOMBA_VALOR,         ');
        qry.sql.Add('   :BOMBA_QTDE,          ');
        qry.sql.Add('   :BOMBA_TOTAL,         ');
        qry.sql.Add('   :FUNCIONARIO,         ');
        qry.sql.Add('   :DATA_EXEC)           ');
      end;

      qry.ParamByName('PEDIDO_ID').AsInteger            := Codigo;
      qry.ParamByName('FORNECEDOR_ID').AsInteger        := cbx_fornecedor_concreto.KeyValue;
      qry.ParamByName('PRESTADOR_SERVICO_ID').AsInteger := cbx_prestador_servico.KeyValue;
      qry.ParamByName('PRODUTO_BOMBA_ID').AsFloat       := cbx_bomba_contratada.KeyValue;
      qry.ParamByName('BOMBA_VALOR').AsFloat            := strtofloat(edt_preco_custo_bomba.Text);
      qry.ParamByName('BOMBA_QTDE').AsInteger           := StrToInt(edt_qtde_bomba.Text);
      qry.ParamByName('BOMBA_TOTAL').AsFloat            := strtofloat(edt_preco_custo_bomba.Text)*StrToInt(edt_qtde_bomba.Text);
      qry.ParamByName('FUNCIONARIO').AsString           := edt_resp_bombeamento.Text;
      qry.ParamByName('DATA_EXEC').AsDate               := dtp_executacao_concreto.Date;
      qry.ExecSQL;

      {itens}
      mtb_concreto_utilizado.First;
      while not mtb_concreto_utilizado.eof do
      begin
        qry.SQL.Clear;
        if mtb_concreto_utilizado.FieldByName('ID').AsInteger < 0 then
        begin
          qry.SQL.Add('insert into PEDIDOS_CONCRETO_ITENS ( pedido_id, item, produto_id, qtde, custo ) values( :pedido_id, :item, :produto_id, :qtde, :custo )');
          qry.ParamByName('pedido_id').AsInteger  := mtb_concreto_utilizado.FieldByName('pedido_id').AsInteger;
        end
        else
        if mtb_concreto_utilizado.FieldByName('ID').AsInteger > 0 then
        begin
          qry.SQL.Add('update PEDIDOS_CONCRETO_ITENS set item =:item, produto_id =:produto_id, qtde =:qtde, custo =:custo where id =:id ');
          qry.ParamByName('id').AsInteger  := mtb_concreto_utilizado.FieldByName('id').AsInteger;
        end;

        qry.ParamByName('item').AsInteger       := mtb_concreto_utilizado.FieldByName('id_itempedido').AsInteger;
        qry.ParamByName('produto_id').AsInteger := mtb_concreto_utilizado.FieldByName('produto_id').AsInteger;
        qry.ParamByName('qtde').AsFloat         := mtb_concreto_utilizado.FieldByName('quantidade').AsFloat;
        qry.ParamByName('custo').AsFloat        := mtb_concreto_utilizado.FieldByName('preco_custo').AsInteger;
        qry.ExecSQL;

        mtb_concreto_utilizado.Next;
      end;
      (*
      {contas a pagar}
      if not cb_orcamento.Checked then
      begin
        if operacao = opincluir then
        begin
            {gerar conta a pagar para a fornecedor do concreto}
            ufinanceiro.prc_contas_pagar(
                                         operacao, conexao, -1, Codigo{n. pedido}, 53,
                                         p_vendedor_id,  inttostr(codigo){n. documento},
                                         'COMPRA DE CONCRETO USINADO', 'PEDIDOS',codigo,
                                         1, 1, mtb_concreto_utilizadoTOTAL_CONCRETO.Value,
                                         0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                         );

            {gerar conta a pagar para a fornecedor da bomba}
            ufinanceiro.prc_contas_pagar(
                                         operacao, conexao, -1, Codigo{n. pedido}, 73,
                                         p_vendedor_id, inttostr(codigo){n. documento},
                                         'CONTRATAÇÃO DE SERVIÇO DE BOMBA', 'PEDIDOS',
                                         codigo, 1, 1, strtofloatdef(edt_preco_custo_bomba.Text,0),
                                         0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                         );
        end
        else
        if operacao = opAlterar then
        begin
          qry_contas_pagar.first;
          while not qry_contas_pagar.eof do  // qry da grid de contas a pagar
          begin

            {conta a pagar ao vendedor}
            ufinanceiro.prc_contas_pagar(
                                         opAlterar, conexao, qry_contas_pagar.fieldbyname('ID').asinteger{contaPagarID},
                                         Codigo{n. pedido}, 28,
                                         cbx_fornecedor_concreto.KeyValue,  inttostr(codigo){n. documento},
                                         'COMPRA DE CONCRETO USINADO', 'PEDIDOS',codigo,
                                         1, 1, strtofloatdef(lbl_comissao_vendedor.Caption,0),
                                         0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                        );
            {conta a pagar ADM}
              ufinanceiro.prc_contas_pagar(
                                           opAlterar, conexao, qry_contas_pagar.fieldbyname('ID').asinteger{contaPagarID}, Codigo{n. pedido}, 28,
                                           cbx_prestador_servico.KeyValue, inttostr(codigo){n. documento},
                                           'CONTRATAÇÃO DE SERVIÇO DE BOMBA', 'PEDIDOS',
                                           codigo, 1, 1, strtofloatdef(lbl_comissao_adm.Caption,0),
                                           0,0,0,0, date+30 , 0,'S','S','S','S', '', ''
                                          );
            qry_contas_pagar.next;
          end;

        end;
      end
      else
      if cb_orcamento.Checked then
      begin
        // orcamento deletar as contas a pagar
      end;
      *)
      Result := (qry.RowsAffected > 0);
    finally
      FreeAndNil(qry);
    end; // try/finnaly
  except
    on E : Exception do
       Raise Exception.Create(E.Message + Self.Name +'.Incluir/Alterar');
  end; //try/exception

end;


procedure TfrmPedidosE.SalvarItensVenda;
var
  novoItem         : Integer;
  metros_lineares  : double;
  qtdeRealLaje     : double;
  qryItensComissao :TFDQuery;
  situacao_dos_itens: string;

  estoque_minimo, estoque_fisico, pedido_aberto, estoque_disponivel: double;
begin

  {exluir itens do pedido no banco de dados}
  cdsPedidoItensDeletados.First;
  while not cdsPedidoItensDeletados.eof do
  begin
    cdsPedidoItensDeletados.First;

    {exclui o item da venda}
    uBiblioteca.FilterCds( qryGravaPedidoItens, uTipos.fsInteger,  cdsPedidoItensDeletados.FieldByName('ID').AsString);
    qryGravaPedidoItens.Delete;

    cdsPedidoItensDeletados.Delete;
  end;

  {se houver itens de comissao cadastrado deleta e insere tudo de novo
  quando for salvar os itens da venda no banco de dados}
  //if operacao <> utipos.OpIncluir then
  //begin
  // alteração em 03/05/24 exclui independente da operação
  try
    qryItensComissao := TFDQuery.Create(Application);
    qryItensComissao.Connection := self.Conexao;

    qryItensComissao.Close;
    qryItensComissao.SQL.Clear;
    qryItensComissao.SQL.Add('delete from COMISSAO_ITEM where pedido_id = :pedido_id');
    qryItensComissao.ParamByName('pedido_id').AsInteger := self.Codigo;
    qryItensComissao.ExecSQL;
  finally
    FreeAndNil(qryItensComissao);
  end;
  //end;

  {incluir ou alterar itens do pedido}
  cdspedidoitens.DisableControls;
  cdsPedidoItens.First;
  while not cdsPedidoItens.eof do
  begin
    if cdsPedidoItens.FieldByName('ID').AsInteger < 0 then
    begin
      {Item novo}
      qryGravaPedidoItens.Insert;
      novoItem := uBiblioteca.AutoIncremento(self.Conexao,'PEDIDOS_ITENS');
      qryGravaPedidoItens.FieldByName('ID').AsInteger        := novoItem;
      qryGravaPedidoItens.FieldByName('PEDIDO_ID').AsInteger := codigo;
    end
    else
    begin
      {edição de um item}
      uBiblioteca.FilterCds( qryGravaPedidoItens, uTipos.fsInteger, cdsPedidoItens.FieldByName('ID').AsString);
      novoItem := cdsPedidoItens.FieldByName('ID').AsInteger;
      qryGravaPedidoItens.Edit;
    end;
    // AQUI TEM UN ERRO, FALTA VER A SITUAÇÃO PARCIAL
    {default}
    //situacao_dos_itens := 'ABERTO';
    (*
    {se a situacao do pedido estiver aguardando, passa os itens do pedido para aguardando}
    if cbx_situacao.Text = 'AGUARDANDO' then
      if cdsPedidoItens.fieldbyname('SITUACAO').AsString = 'ABERTO' then
        situacao_dos_itens := 'AGUARDANDO';

    {se a situacao do pedido estiver aberto, passa os itens do pedido para aberto, menos
    concreto e bomba}
      if (cdsPedidoItens.fieldbyname('CONCRETO').AsString = 'S') or (cdsPedidoItens.fieldbyname('BOMBA').AsString = 'S') then
        situacao_dos_itens := 'AGUARDANDO';
    *)
    // corrigido em 06/04/2025
    if cbx_situacao.Text = 'AGUARDANDO' then
        situacao_dos_itens := 'AGUARDANDO';

    if cbx_situacao.Text = 'ENTREGUE' then
        situacao_dos_itens := 'ENTREGUE';

    if cbx_situacao.Text = 'RETIROU' then
        situacao_dos_itens := 'REIROU';

    if cbx_situacao.Text = 'ABERTO' then
      if (cdsPedidoItens.fieldbyname('CONCRETO').AsString = 'S') or (cdsPedidoItens.fieldbyname('BOMBA').AsString = 'S') then
        situacao_dos_itens := 'AGUARDANDO' else situacao_dos_itens := 'ABERTO';

    if cbx_situacao.Text = 'PARCIAL' then
        situacao_dos_itens := cdsPedidoItens.fieldbyname('SITUACAO').AsString;


    {manda itens da tela pro banco de dados}
    qryGravaPedidoItens.FieldByName('PRODUTO_ID').AsInteger      := cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger;
    qryGravaPedidoItens.FieldByName('ITEM').AsInteger            := cdsPedidoItens.FieldByName('ITEM').AsInteger;
    qryGravaPedidoItens.FieldByName('QTDE').AsFloat              := cdsPedidoItens.fieldbyname('QTDE').AsFloat ;
    qryGravaPedidoItens.FieldByName('PRECO_FORNECEDOR').AsFloat  := cdsPedidoItens.fieldbyname('CUSTO_FORNECEDOR').AsFloat ;
    qryGravaPedidoItens.FieldByName('CUSTO').AsFloat             := cdsPedidoItens.fieldbyname('CUSTO').AsFloat ; // PRECO VENDEDOR
    qryGravaPedidoItens.FieldByName('VENDA').AsFloat             := cdsPedidoItens.fieldbyname('VENDA').AsFloat ;
    qryGravaPedidoItens.FieldByName('LOCAL').AsString            := cdsPedidoItens.fieldbyname('LOCAL').AsString ;
    //qryGravaPedidoItens.FieldByName('SITUACAO').AsString       := cdsPedidoItens.fieldbyname('SITUACAO').AsString ;
    qryGravaPedidoItens.FieldByName('SITUACAO').AsString         := situacao_dos_itens ;
    qryGravaPedidoItens.FieldByName('NIVEL').AsString            := cdsPedidoItens.fieldbyname('NIVEL').AsString ;
    qryGravaPedidoItens.FieldByName('ADICIONAL_DE_VIGA').AsString:= cdsPedidoItens.fieldbyname('ADICIONAL_DE_VIGA').AsString ;
    qryGravaPedidoItens.FieldByName('REVENDA').AsString          := cdsPedidoItens.fieldbyname('REVENDA').AsString ;
    qryGravaPedidoItens.FieldByName('LAJE').AsString             := cdsPedidoItens.fieldbyname('LAJE').AsString ;
    qryGravaPedidoItens.FieldByName('VIGA').AsString             := cdsPedidoItens.fieldbyname('VIGA').AsString ;
    qryGravaPedidoItens.FieldByName('LAJOTA').AsString           := cdsPedidoItens.fieldbyname('LAJOTA').AsString ;
    qryGravaPedidoItens.FieldByName('ISOPOR').AsString           := cdsPedidoItens.fieldbyname('ISOPOR').AsString ;
    qryGravaPedidoItens.FieldByName('VERGALHAO').AsString        := cdsPedidoItens.fieldbyname('VERGALHAO').AsString ;
    qryGravaPedidoItens.FieldByName('CONCRETO').AsString         := cdsPedidoItens.fieldbyname('CONCRETO').AsString ;
    qryGravaPedidoItens.FieldByName('BOMBA').AsString            := cdsPedidoItens.fieldbyname('BOMBA').AsString ;
    qryGravaPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString := cdsPedidoItens.fieldbyname('NEGATIVO_DE_LAJE').AsString ;
    qryGravaPedidoItens.FieldByName('REFORCO_DE_VIGA').AsString  := cdsPedidoItens.fieldbyname('REFORCO_DE_VIGA').AsString ;
    qryGravaPedidoItens.FieldByName('QTDE_VIGAS').AsInteger      := cdsPedidoItens.fieldbyname('QTDE_VIGAS').AsInteger ;
    qryGravaPedidoItens.FieldByName('QTDE_REAL_LAJE').AsFloat    := cdsPedidoItens.fieldbyname('QTDE_REAL_LAJE').AsFLOAT ;
    qryGravaPedidoItens.Post;

//***codigo incluso em 19/05/2025 para corrigir erro de duplicação de adionais
//*** mais abaixo comentei uma parte do código. linha : 5650 mais ou menos
   {exluir ferragens negativa/positiva do banco caso houver}
   if not cdsferragensdeletados.IsEmpty then
   begin
     cdsFerragensDeletados.First;
     while not cdsFerragensDeletados.eof do
     begin
       cdsFerragensDeletados.First;
       //ShowMessage(' excluir id : ' + cdsFerragensDeletados.FieldByName('ID').AsString);
       uBiblioteca.FilterCds( qryGravaFerragens, uTipos.fsInteger, cdsFerragensDeletados.FieldByName('ID').AsString);
       {deleta no banco}
       qryGravaFerragens.Delete;

       cdsFerragensDeletados.delete;
     end;
   end;

//**
    {ferragem negativa }
    if cdsPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString = 'S' then
    begin
      cdsPedidoFerragens.Filter   := '';
      cdsPedidoFerragens.Filtered := false;
      cdsPedidoFerragens.Filter   := ' QTDE_VIGAS = ' + QuotedStr('-1');
      cdsPedidoFerragens.Filtered := true;

      if not cdsPedidoFerragens.IsEmpty then
        SalvarFerragens(novoItem);
    end;

    {reforço de viga}
    if cdsPedidoItens.FieldByName('VIGA').AsString = 'S' then
    begin
      prc_filtrar_ferragens('PEDIDOS_ITENS', cdsPedidoItens.FieldByName('ID').AsInteger);
      if not cdsPedidoFerragens.IsEmpty then
      begin
        SalvarFerragens(novoItem);
      end;
    end;


    if cb_orcamento.Checked = false then
    {só gera comissão pra pedidos }
    begin

      {salvar comissão}
      {... primeiro pegar a qtde real da laje}
      if cdsPedidoItens.FieldByName('LAJE').AsString = 'S' then
       if eLaje(cdsPedidoItens.FieldByName('PRODUTO_ID').AsInteger) then
      begin

        if Operacao = OpIncluir then
        begin

          // pedido novo passo -1
          filtrarVigas(cdsItensLaje, -1 , cdsPedidoItens.FieldByName('item').AsInteger);

        end
        else
        begin

          // edição de um pedido passo número ja gerado
          filtrarVigas(cdsItensLaje, codigo, cdsPedidoItens.FieldByName('item').AsInteger);

        end;

        qtdeRealLaje    := 0;
        metros_lineares := 0;
        p_largura_forma := qryAux.FieldByName('FORMA').AsInteger ;

        metros_lineares := SomarMetrosLineares( cdsItensLaje );
        //ShowMessage('mt linear :' + floattostr(metros_lineares));

        //ShowMessage('forma ' + inttostr(p_largura_forma) );
        qtdeRealLaje    := SomarMetrosQuadrados( p_largura_forma, metros_lineares );
        //ShowMessage('qtde real :' + floattostr(qtdeRealLaje));

      end;

      {nova comissão Itens }
      {percorre os itens de pedido, itens comuns salva normal
      se for reforço de viga ou negativo de laje, busca no cds de ferragem pra
      salvar detalhado}
      if ( (cdsPedidoItens.FieldByName('REFORCO_DE_VIGA').AsString = 'N') and
           (cdsPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString = 'N') ) then
      begin
      {itens comum , pega do cds itens do pedido}
      ufinanceiro.fnc_salvar_comissao_itens(
                                           self.Conexao,
                                           self.Operacao,
                                           self.Codigo,
                                           cdsPedidoItens.FieldByName('PRODUTO_ID').AsInteger,
                                           ubiblioteca.SeSenao(                          // qtde do produto
                                           cdsPedidoItens.FieldByName('LAJE').AsString = 'N',
                                           cdsPedidoItens.FieldByName('QTDE').AsFloat,
                                           qtdeRealLaje ),
                                           cdsPedidoItens.FieldByName('CUSTO_FORNECEDOR').AsFloat,// custo fornecedor
                                           cdsPedidoItens.FieldByName('CUSTO').AsFloat,  // custo vendedor
                                           cdsPedidoItens.FieldByName('VENDA').AsFloat,  // preco venda
                                           'D',
                                           ''
                                           );
      end;

      {reforço pega do cds ferrragens}
      if (cdsPedidoItens.FieldByName('REFORCO_DE_VIGA').AsString = 'S') then
      begin
        cdsPedidoFerragens.Filtered := false;
        cdsPedidoFerragens.Filter   := 'QTDE_VIGAS > 0';
        cdsPedidoFerragens.Filtered := True;
        cdsPedidoFerragens.First;
        cdsPedidoFerragens.DisableControls;
        while not cdsPedidoFerragens.Eof do
        begin
          ufinanceiro.fnc_salvar_comissao_itens(
                                               self.Conexao,
                                               self.Operacao,
                                               self.Codigo,
                                               cdsPedidoFerragens.FieldByName('PRODUTO_ID').AsInteger,
                                               cdsPedidoFerragens.FieldByName('TOTAL_LINEAR').AsFloat,
                                               cdsPedidoFerragens.FieldByName('PRECO_CUSTO').AsFloat,// custo fornecedor
                                               cdsPedidoFerragens.FieldByName('PRECO_CUSTO').AsFloat,  // custo vendedor
                                               cdsPedidoFerragens.FieldByName('PRECO_VENDA').AsFloat,  // preco venda
                                               'D',
                                               'Reforço de viga'
                                               );



          cdsPedidoFerragens.Next;
        end;
        cdsPedidoFerragens.EnableControls;

      end;
      {negativo de laje pega do cds ferragens }
      if (cdsPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString = 'S') then
      begin
        cdsPedidoFerragens.Filtered := false;
        cdsPedidoFerragens.Filter := 'QTDE_VIGAS < 0';
        cdsPedidoFerragens.Filtered := True;
        cdsPedidoFerragens.First;
        cdsPedidoFerragens.DisableControls;
        while not cdsPedidoFerragens.Eof do
        begin
          ufinanceiro.fnc_salvar_comissao_itens(
                                               self.Conexao,
                                               self.Operacao,
                                               self.Codigo,
                                               cdsPedidoFerragens.FieldByName('PRODUTO_ID').AsInteger,
                                               cdsPedidoFerragens.FieldByName('TOTAL_LINEAR').AsFloat,
                                               cdsPedidoFerragens.FieldByName('PRECO_CUSTO').AsFloat,// custo fornecedor
                                               cdsPedidoFerragens.FieldByName('PRECO_CUSTO').AsFloat,  // custo vendedor
                                               cdsPedidoFerragens.FieldByName('PRECO_VENDA').AsFloat,  // preco venda
                                               'D',
                                               'Negativo de laje'
                                               );

          cdsPedidoFerragens.Next;
        end;
        cdsPedidoFerragens.EnableControls;

      end;

    end; // cb_orcamento.checked = false

    // verificar estoques minimo
    if cdsPedidoItens.FieldByName('REVENDA').AsString = 'S' then
    begin
      {estoque minimo do item cadastrado na tabela de produtos}
      estoque_minimo := unit_movimenta_estoques.fnc_buscar_estoque_minimo(  cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger);
      if estoque_minimo > 0 then
      begin
        estoque_fisico     := unit_movimenta_estoques.fnc_buscar_estoque_fisico(cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger);
        pedido_aberto      := unit_movimenta_estoques.fnc_buscar_pedido_aberto(cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger);
        estoque_disponivel := estoque_fisico - pedido_aberto;
        //se o estoque disponivel estiver igual ou abaixo do minimo
        // emite uma ordem de compra
        if estoque_disponivel <= estoque_minimo then
        begin
          // se não encontrar nenhum ordem de compra em aberto, emite uma.
          if not unit_movimenta_estoques.fnc_buscar_ordem_compra_por_produto( cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger ) then
          begin
            unit_movimenta_estoques.prc_emitir_ordem_compra( cdsPedidoItens.fieldbyname('PRODUTO_ID').AsInteger );
          end;
        end;
      end;
    end;


    //próximo item
    cdsPedidoItens.Next;
  end; // fim while cdsPedidoItens

  cdspedidoitens.EnableControls;

  if cb_orcamento.Checked = false then
    {inclui /alterar comissao(cabeça)...}
    prc_salvar_comissao
  else
  begin
    {mudo pra opEcluir pq passo opAlterar na chamada do funcao excluir}
    Operacao := opExcluir;
    prc_salvar_comissao;
  end;
(*  alterado em 16/05/2025
motivo: ao excluir um adicional de viga e excluir novamente na mesma viga
o adicional duplica.. então comentei esta parte. mas preciso analizar se não
dara outro problema

  {Importante...caso o usuario excluir o item negativo de laje a procedure
  SalvarFerragens, não será executada acima...
  então executo depois por segurança }
  if not cdsFerragensDeletados.IsEmpty then
  begin
    showmessage('incluindo ferragem') ;
    SalvarFerragens(novoItem);
  end;
*)
  {atualizo o painel financeiro pra atualizar os labels com os valores da comissao
  ai consigo enviar pra o contas a pagar}
  prc_atualizar_Painel_comissao_triunfo;
end;

procedure TfrmPedidosE.prc_salvar;
begin
  {faz as validações, se não validar não contiunua}
  if not validar then Exit;

  {inicia uma nova transação}
  if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
  try

    {incluir/alterar o pedido}
    fnc_incluir_alterar_pedido( Operacao );

    {manda pro banco de dados}
    if Self.Conexao.InTransaction then Self.Conexao.Commit;

    {mensagem ao usuário}
    if operacao = opincluir then
      CriarMensagem('AVISO',' PEDIDO INCLUIDO COM SUCESSO. ')
    else if operacao = opalterar then
      CriarMensagem('AVISO',' PEDIDO ALTERADO COM SUCESSO. ');

    {fecha o formulário}
    Close;

  except
    {se der algum erro durante o processo de gravação desfaz tudo!}
    on E : Exception do
       begin
         CriarMensagem('AVISO','NÃO FOI POSSIVEL SALVAR O PEDIDO.' + slinebreak + slinebreak + E.Message);
         if Conexao.InTransaction then
           Conexao.Rollback;;
         //***
         Raise;
       end;
  end;

end;

procedure TfrmPedidosE.prc_salvar_comissao;
var
  tx_adm, tx_vendedor, total_venda, custo_pedido: double;
  loQry : TFDQuery;
begin


  total_venda  := StrToFloat(edt_valor_total.Caption);
  custo_pedido := fnc_somar_custo_pedido;


  {ver se a comissão já existe no banco pois a mesma pode ter sido deletada
  pq o pedido virou orcamento ou foi deletado.
  se for um pedido(orcamento = false) e nao achar comissao no banco
  a operacao vai ser opIncluir senao alterar}
  if cb_orcamento.Checked = false then // pedido
  begin
    try
      loQry := TFDQuery.Create(self);
      loQry.Connection := Conexao;

      //pegar taxas de comissão do vendedor
      loqry.SQL.Clear;
      loQry.SQL.Add('select * from VENDEDORES where PESSOA_ID =:PESSOA_ID');
      loQry.ParamByName('PESSOA_ID').AsInteger :=  p_vendedor_id ;
      //ShowMessage('vend ' + inttostr(p_vendedor_id));
      loQry.Open;
      tx_adm       := loQry.fieldByName('COMISSAO_ADM').AsFloat;
      tx_vendedor  := loQry.fieldByName('COMISSAO_VENDEDOR').AsFloat;
      loqry.Close;

      // ver se a comissão foi lançada, se vazio incluir, senão altera
      loqry.SQL.Clear;
      loQry.SQL.Add('select * from COMISSAO where PEDIDO_ID =:PEDIDO_ID');
      loQry.ParamByName('PEDIDO_ID').AsInteger := Codigo;
      loQry.Open;

      if loQry.IsEmpty then
        Operacao := OpIncluir
      else
        Operacao := opAlterar;

    finally
      loQry.Close;
      FreeAndNil( loQry );
    end;

  end;

  uFinanceiro.fnc_salvar_comissao(
                                  self.Conexao,
                                  self.Operacao,       // pode ser opIncluir ou OpAlterar
                                  date,
                                  date,
                                  dtpDataContabil.date,// data contabil
                                  Codigo,
                                  cbxVendedores.KeyValue,
                                  3,
                                  total_venda,
                                  custo_pedido,
                                  fnc_somar_despesas(codigo),
                                  tx_adm,              //comissaoAdmTaxa,
                                  tx_vendedor
                                  );

end;

function TfrmPedidosE.fnc_somar_custo_pedido: double ;
begin
  result := 0;
  {filtra os lançamentos da comissao}
  ubiblioteca.FilterCds(qryComissao_itens, utipos.fsInteger, inttostr(self.Codigo));
  qryComissao_itens.First;
  while not qryComissao_itens.Eof do
  begin
    result := result + ( qryComissao_itens.FieldByName('quantidade').AsFloat * qryComissao_itens.FieldByName('custo_vend').AsFloat);

    qryComissao_itens.Next;
  end;

end;


procedure TfrmPedidosE.SalvarItensLaje(altura: integer;
                                       cdsItensLajeDeletados: TFDMemTable;
                                       qryGravaItensLaje: TFDQuery;
                                       cdsItensLaje: TFDMemTable);
var
  idAtual, novoId: integer;
  estoque_minimo, estoque_fisico, pedido_aberto, estoque_disponivel: double;
  situacao_do_item : string;
  loqry: TFDQuery;
begin
   //ShowMessage('Salvar itens da laje');

   {Liberar filtros}
   cdsItensLaje.Filtered := false;

   {exluir vigas}
   cdsItensLajeDeletados.First;
   while not cdsItensLajeDeletados.eof do
   begin
      cdsItensLajeDeletados.First;
      {sql qryGravaitensLaje = 'select * from PEDIDOS_ITENS_LAJE where ID = :ID'}
      uBiblioteca.FilterCds( qryGravaItensLaje, uTipos.fsInteger, cdsItensLajeDeletados.FieldByName('ID').AsString);
      {deleta no banco}
      qryGravaItensLaje.Delete;

      cdsItensLajeDeletados.Delete;
   end;

   {incluir ou alterar}
   cdsItensLaje.DisableControls;
   cdsItensLaje.First;
   while not cdsItensLaje.eof do
   begin

     idAtual := cdsItensLaje.FieldByName('ID').AsInteger;

     if cdsItensLaje.FieldByName('ID').AsInteger < 0 then
     begin

       {item novo}
       qryGravaItensLaje.Insert;
       novoId := uBiblioteca.AutoIncremento(self.Conexao,'PEDIDOS_ITENS_LAJE');
       qryGravaItensLaje.FieldByName('ID').AsInteger        := novoId;
       qryGravaItensLaje.FieldByName('PEDIDO_ID').AsInteger := codigo;
       qryGravaItensLaje.FieldByName('H_LAJE').AsInteger    := altura;

     end
     else
     begin
       //Edição de um item,  busca o registro no banco de dados e altera
       uBiblioteca.FilterCds( qryGravaItensLaje, uTipos.fsInteger, cdsItensLaje.FieldByName('ID').AsString);
       {id do banco}
       novoId := cdsItensLaje.FieldByName('ID').AsInteger;

       qryGravaItensLaje.Edit;
     end;

     {buscar a situação do item no cdsPedidoItem}
     try
       loqry := TFDquery.Create(application);
       loqry.Connection := conexao;
       loqry.SQL.Add('select situacao from pedidos_itens where pedido_id =:pedido_id and item =:item');
       loqry.ParamByName('pedido_id').AsInteger := codigo;
       loqry.ParamByName('item').AsInteger := cdsItensLaje.FieldByName('ITEM').AsInteger;
       loqry.Open;

       situacao_do_item := loqry.fieldbyname('SITUACAO').AsString;
     finally
       freeandnil(loqry);
     end;

     qryGravaItensLaje.FieldByName('PRODUTO_ID').AsInteger := cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger;
     qryGravaItensLaje.FieldByName('ITEM').AsInteger       := cdsItensLaje.FieldByName('ITEM').AsInteger;
     qryGravaItensLaje.FieldByName('QTDE').AsFloat         := cdsItensLaje.fieldbyname('QTDE').AsFloat ;
     qryGravaItensLaje.FieldByName('CUSTO').AsFloat        := cdsItensLaje.fieldbyname('CUSTO').AsFloat ;
     qryGravaItensLaje.FieldByName('LOCAL').AsString       := cdsItensLaje.fieldbyname('LOCAL').AsString ;
     //qryGravaItensLaje.FieldByName('SITUACAO').AsString  := cdsItensLaje.fieldbyname('SITUACAO').AsString ;
     qryGravaItensLaje.FieldByName('SITUACAO').AsString    := situacao_do_item ;
     qryGravaItensLaje.FieldByName('NIVEL').AsString       := cdsItensLaje.fieldbyname('NIVEL').AsString ;
     //qryGravaItensLaje.FieldByName('H_LAJE').AsInteger   := altura;
     qryGravaItensLaje.Post;

     {verifica se a viga tem adicionais}
     {grava adicionais da viga}
     //     prc_filtrar_ferragens('PEDIDOS_ITENS_LAJE', novoId);
     prc_filtrar_ferragens('PEDIDOS_ITENS_LAJE', idAtual);
     if not cdsPedidoFerragens.IsEmpty then
     begin
       SalvarFerragens(novoId);
     end;

     // verificar estoques minimo
     estoque_minimo := fnc_buscar_estoque_minimo(cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger);
     if estoque_minimo > 0 then
     begin
       estoque_fisico     := unit_movimenta_estoques.fnc_buscar_estoque_fisico(cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger);
       pedido_aberto      := unit_movimenta_estoques.fnc_buscar_pedido_aberto(cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger);
       estoque_disponivel := estoque_fisico - pedido_aberto;
       //se o estoque disponivel estiver igual ou abaixo do minimo
       // emite uma ordem de compra
       if estoque_disponivel <= estoque_minimo then
       begin
         // se não encontrar nenhum ordem de compra em aberto, emite uma.
         if not unit_movimenta_estoques.fnc_buscar_ordem_compra_por_produto( cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger ) then
         begin
           unit_movimenta_estoques.prc_emitir_ordem_compra( cdsItensLaje.fieldbyname('PRODUTO_ID').AsInteger );
         end;
       end;
     end;

     cdsItensLaje.Next;
   end;

   cdsItensLaje.EnableControls;

end;

(*
procedure TfrmPedidosE.SalvarItensConcretoRealizado;
var
  novoItem: Integer;
begin
   //ShowMessage('salvar itens da venda');
    {exluir}
   cdsConcretoDeletados.First;
   while not  cdsConcretoDeletados.eof do
   begin
     cdsConcretoDeletados.First;
     uBiblioteca.FilterCds( qryGravaItensConcretoRealizado, uTipos.fsInteger,  cdsConcretoDeletados.FieldByName('ID').AsString);
     qryGravaItensConcretoRealizado.Delete;

     cdsConcretoDeletados.Delete;
   end;

   {incluir ou alterar}
   cdsConcreto.First;
   while not cdsConcreto.eof do
   begin
     if cdsConcreto.FieldByName('ID').AsInteger < 0 then
     begin
       {Itens novos}
       qryGravaItensConcretoRealizado.Insert;
       novoItem := uBiblioteca.AutoIncremento(self.Conexao,'PEDIDOS_CONCRETO_ITENS');
       qryGravaItensConcretoRealizado.FieldByName('ID').AsInteger := novoItem;
       qryGravaItensConcretoRealizado.FieldByName('PEDIDO_ID').AsInteger := codigo;
     end
     else
     begin
       {Edição de um item,  busca o registro no banco de dados e altera}
       uBiblioteca.FilterCds( qryGravaItensConcretoRealizado, uTipos.fsInteger, cdsConcreto.FieldByName('ID').AsString);
       qryGravaItensConcretoRealizado.Edit;
     end;

     qryGravaItensConcretoRealizado.FieldByName('PRODUTO_ID').AsInteger := cdsConcreto.fieldbyname('PRODUTO_ID').AsInteger;
     qryGravaItensConcretoRealizado.FieldByName('QTDE').AsFloat         := cdsConcreto.fieldbyname('QTDE').AsFloat ;
     qryGravaItensConcretoRealizado.FieldByName('CUSTO').AsFloat        := cdsConcreto.fieldbyname('CUSTO').AsFloat ;
     qryGravaItensConcretoRealizado.FieldByName('LOCAL').AsString       := cdsConcreto.fieldbyname('LOCAL').AsString ;
     qryGravaItensConcretoRealizado.FieldByName('SITUACAO').AsString    := cdsConcreto.fieldbyname('SITUACAO').AsString ;
     qryGravaItensConcretoRealizado.FieldByName('NIVEL').AsString       := cdsConcreto.fieldbyname('NIVEL').AsString ;
     qryGravaItensConcretoRealizado.FieldByName('ITEM').AsInteger       := cdsConcreto.FieldByName('ITEM').AsInteger;
     qryGravaItensConcretoRealizado.Post;

     cdsConcreto.Next;
   end;
end;
*)
(*
function TfrmPedidosE.validarConcretoRealizado: boolean;
begin
  result := false;

  {aba aluguel da bomda}
  if cbxPrestadorServico.Text = '' then
  begin
    ShowMessage('Selecione o fornecedor da bomba');
    cbxPrestadorServico.SetFocus;
    exit;
  end;

  if cbxBomba.Text = '' then
  begin
    ShowMessage('Selecione uma tipo de bomba');
    cbxBomba.SetFocus;
    exit;
  end;

  if StrToFloatDef(edValorBomba_.Text,0) <= 0 then
  //if qryBombas.FieldByName('PRECO_VENDA').AsFloat <= 0 then
  begin
    ShowMessage('Informe um valor válido');
    edValorBomba_.SetFocus;
    exit;
  end;

  if qryPedidoConcreto.FieldByName('BOMBA_QTDE').AsFloat <= 0 then
  begin
    ShowMessage('Informe uma quantidade válida');
    edQtdeBomba.SetFocus;
    exit;
  end;

  {calcula total}
  qryPedidoConcreto.FieldByName('BOMBA_TOTAL').AsFloat :=
     qryPedidoConcreto.FieldByName('BOMBA_QTDE').AsFloat * StrToFloatDef(edValorBomba_.Text,0);


  {aba fornecedor do concreto}
  if cbxFornecedorConcreto.Text = '' then
  begin
    ShowMessage('Selecione o fornecedor do concreto');
    cbxFornecedorConcreto.SetFocus;
    exit;
  end;

  if edDataExec.Text = '' then
  begin
    ShowMessage('informe a data de execução');
    edDataExec.SetFocus;
    exit;
  end;

  if cdsConcreto.IsEmpty then
  begin
    ShowMessage('informe as quantidades de concreto e a bomba');
    TabFornecedorConcreto.Show;
    btnAddConcreto.SetFocus;
    exit;
  end;


  result := true;
end;
*)
(*
procedure TfrmPedidosE.SalvarConcretoRealizado;
begin
  if not validarConcretoRealizado then
  begin
     ShowMessage('não validou');
     exit;
  end
  else
  begin
    {no LerDados não encontrou o registro, então é um novo registro}
    if qryPedidoConcreto.RecordCount = 0 then
    begin
     qryPedidoConcreto.FieldByName('ID').AsInteger        := uBiblioteca.AutoIncremento(self.Conexao, 'PEDIDOS_CONCRETOS');
     qryPedidoConcreto.FieldByName('PEDIDO_ID').AsInteger :=	codigo;
    end;

    {incluir ou alterar}
    qryPedidoConcreto.FieldByName('FORNECEDOR_ID').AsInteger        :=	cbxFornecedorConcreto.KeyValue;
    qryPedidoConcreto.FieldByName('PRESTADOR_SERVICO_ID').AsInteger := cbxPrestadorServico.KeyValue;
    qryPedidoConcreto.FieldByName('PRODUTO_BOMBA_ID').AsInteger     := cbxBomba.KeyValue;
    qryPedidoConcreto.FieldByName('BOMBA_VALOR').AsFloat            := strtofloatdef(edValorBomba_.Text,0);
    qryPedidoConcreto.Post;

    SalvarItensConcretoRealizado;
  end;

end;
*)
procedure TfrmPedidosE.SalvarFerragens(novoId: integer);
begin
   {salva as ferragens do pedido, compradas por fora}

   (* 19/05/2025 coloquei essa parte do codigo dentro da procedure que
   salva os itens do pedido...assim atendera compras de ferragens por fora
   e reforço de laje

   {exluir ferragens do banco}
   cdsFerragensDeletados.First;
   while not cdsFerragensDeletados.eof do
   begin
     cdsFerragensDeletados.First;
     //ShowMessage(' excluir id : ' + cdsFerragensDeletados.FieldByName('ID').AsString);
     uBiblioteca.FilterCds( qryGravaFerragens, uTipos.fsInteger, cdsFerragensDeletados.FieldByName('ID').AsString);
     {deleta no banco}
     qryGravaFerragens.Delete;

     cdsFerragensDeletados.delete;
   end;
   *)

   {salva os adicionais se houver}
   if not cdsPedidoFerragens.IsEmpty then
   begin

     cdsPedidoFerragens.DisableControls;
     cdsPedidoFerragens.First;
     while not cdsPedidoFerragens.Eof do
     begin
       if cdsPedidoFerragens.FieldByName('ID').AsInteger < 0 then
       begin
         qryGravaFerragens.Append;
         qryGravaFerragens.FieldByName('ID').AsInteger := uBiblioteca.AutoIncremento(self.Conexao,'PEDIDOS_FERRAGENS');
         {a amarração se dará somente com o numero do pedido}
         qryGravaFerragens.FieldByName('PEDIDO_ID').AsInteger := codigo;
         qryGravaFerragens.FieldByName('TABELA'   ).AsString  := cdsPedidoFerragens.FieldByName('TABELA').AsString;
         qryGravaFerragens.FieldByName('TABELA_ID').AsInteger := novoId;

       end
       else
       begin
         {localiza e edita}
         uBiblioteca.FilterCds( qryGravaFerragens, uTipos.fsInteger, cdsPedidoFerragens.FieldByName('ID').AsString);
         qryGravaFerragens.Edit;
       end;
       qryGravaFerragens.FieldByName('PEDIDO_ITEM' ).AsInteger := cdsPedidoFerragens.FieldByName('PEDIDO_ITEM' ).AsInteger;
       qryGravaFerragens.FieldByName('PRODUTO_ID'  ).AsInteger := cdsPedidoFerragens.FieldByName('PRODUTO_ID'  ).AsInteger;
       qryGravaFerragens.FieldByName('QTDE'        ).AsInteger := cdsPedidoFerragens.FieldByName('QUANTIDADE'  ).AsInteger;
       qryGravaFerragens.FieldByName('QTDE_VIGAS'  ).AsInteger := cdsPedidoFerragens.FieldByName('QTDE_VIGAS'  ).AsInteger;
       qryGravaFerragens.FieldByName('DOBRA_INI'   ).AsFloat   := cdsPedidoFerragens.FieldByName('DOBRA_INI'   ).AsFloat;
       qryGravaFerragens.FieldByName('CORPO'       ).AsFloat   := cdsPedidoFerragens.FieldByName('CORPO'       ).AsFloat;
       qryGravaFerragens.FieldByName('DOBRA_FIM'   ).AsFloat   := cdsPedidoFerragens.FieldByName('DOBRA_FIM'   ).AsFloat;
       qryGravaFerragens.FieldByName('COMPRIMENTO' ).AsFloat   := cdsPedidoFerragens.FieldByName('COMPRIMENTO' ).AsFloat;
       qryGravaFerragens.FieldByName('TOTAL_LINEAR').AsFloat   := cdsPedidoFerragens.FieldByName('TOTAL_LINEAR').AsFloat;
       qryGravaFerragens.FieldByName('PRECO_CUSTO' ).AsFloat   := cdsPedidoFerragens.FieldByName('PRECO_CUSTO' ).AsFloat;
       qryGravaFerragens.FieldByName('PRECO_VENDA' ).AsFloat   := cdsPedidoFerragens.FieldByName('PRECO_VENDA' ).AsFloat;;
       qryGravaFerragens.FieldByName('POSICAO'     ).AsString  := cdsPedidoFerragens.FieldByName('POSICAO'     ).AsString;
       qryGravaFerragens.Post;
         //
       cdsPedidoFerragens.Next;
     end;
     cdsPedidoFerragens.EnableControls;

   end;
end;


procedure TfrmPedidosE.TabSheet6Show(Sender: TObject);
begin
  inherited;
  pcVenda.Height := 180;

end;

procedure TfrmPedidosE.tbs_comissao_ferrariShow(Sender: TObject);
begin
  inherited;
//  prc_atualizar_Painel_comissao_triunfo;
//  prc_atualizar_Painel_comissao_ferrari;

end;

procedure TfrmPedidosE.tbs_comissao_triunfoShow(Sender: TObject);
begin
  inherited;
  prc_atualizar_Painel_comissao_triunfo;
 // prc_atualizar_Painel_comissao_ferrari;

end;

procedure TfrmPedidosE.tbs_comissoesShow(Sender: TObject);
begin
  inherited;
  pcVenda.TabIndex := 0;
end;

procedure TfrmPedidosE.tbs_comissoes_outrosShow(Sender: TObject);
begin
  inherited;

  prc_atualizar_Painel_comissao_triunfo;
 // prc_atualizar_Painel_comissao_ferrari;

end;

procedure TfrmPedidosE.tbs_concretoShow(Sender: TObject);
begin
  inherited;
  pcVenda.ActivePage := tbvenda;
end;

procedure TfrmPedidosE.tbs_ferragensShow(Sender: TObject);
begin
  inherited;

  p_item_pedido   := cdsPedidoItens.FieldByName('ITEM').AsInteger;

  //ShowMessage('filtrar ferragem');
  {filtra todas as ferragens}
  cdsPedidoFerragens.Filtered := false;
  cdsPedidoFerragens.Filter   := 'QTDE_VIGAS = ' + quotedstr('-1');
  cdsPedidoFerragens.Filtered := true;

  edTotCustoFerragem.Text := FormatFloat('0.00', SomarValorCustoFerragem);

end;

procedure TfrmPedidosE.tbs_financeiroShow(Sender: TObject);
begin
  inherited;
  gbReforcosVigas.visible := false;
  prc_calcular_painel_financeiro;
end;

procedure TfrmPedidosE.tbs_itens_lajeShow(Sender: TObject);
begin
  inherited;

  if eLaje(cdsPedidoItens.FieldByName('PRODUTO_ID').AsInteger) then
  begin

    {carrega as propriedades da laje selecionada}
    p_item_pedido   := cdsPedidoItens.FieldByName('ITEM').AsInteger;
    p_qtde_vigas    := cdsPedidoItens.FieldByName('QTDE_VIGAS').AsInteger;

    {nesse momento a qryAux esta com essa sql: select * from PRODUTOS_LAJES where PRODUTO_ID =:ID}
    p_largura_forma := qryAux.FieldByName('FORMA').AsInteger;
    p_altura_laje   := qryAux.FieldByName('ALTURA').AsInteger;
    p_lajota        := qryAux.FieldByName('LAJOTA').AsString;
    p_isopor        := qryAux.FieldByName('ISOPOR').AsString;

    filtrarVigas( cdsItensLaje, codigo, p_item_pedido );
    //alterado em 09/01/2025 prc_totais_laje( codigo, p_qtde_vigas );
    prc_totais_laje( codigo, p_item_pedido );

  end
  else
    CriarMensagem('AVISO','Perca do link da laje! ' + sLineBreak +
                  'Erro ao tentar incluir vigas em um produto que NÃO é laje');

end;

procedure TfrmPedidosE.tbs_recibosShow(Sender: TObject);
begin
  inherited;
  {atualiza recibos}
  uBiblioteca.FilterCds(qry_recibos, utipos.fsInteger, inttostr(Codigo));

end;

procedure TfrmPedidosE.tbs_reforco_vigaShow(Sender: TObject);
begin
  inherited;

  gbReforcosVigas.Visible     := false;

  {mostrar todos os reforços de vigas}
  cdsPedidoFerragens.Filtered := false;
  cdsPedidoFerragens.Filter   := '';
  cdsPedidoFerragens.Filter   := 'QTDE_VIGAS > ' + quotedstr('0');
  cdsPedidoFerragens.Filtered := true;


  edTotCustoRerforco.Text := FormatFloat('0.00', SomarValorCustoReforcoViga(true));
  //edTotvendaRerforco.Text := FormatFloat('0.00', SomarValorVendaReforcoViga(true));

end;

procedure TfrmPedidosE.tbClienteShow(Sender: TObject);
begin
  inherited;
  pcVenda.Height := 180;

end;

procedure TfrmPedidosE.tbDestinatarioShow(Sender: TObject);
begin
  inherited;
  pcVenda.Height := 180;

end;


procedure TfrmPedidosE.tbVendaShow(Sender: TObject);
begin
  inherited;
  pcVenda.Height := 180;  //104
end;

procedure TfrmPedidosE.tbs_itens_pedidoShow(Sender: TObject);
begin
  inherited;
  {esconde detalhes de reforço de vigas}
  gbReforcosVigas.Visible :=  false;
end;

function TfrmPedidosE.validar: boolean;
var
  qtdeVigasInformada, qtdeVigasDigitadas : integer;
begin
  result := false;

  if p_cliente_id = -1 then
  begin
    pcVenda.TabIndex := 1;
    CriarMensagem('ERRO','INFORME UM CLIENTE.');
    btnBuscaCliente.Click;
    exit;
  end;

  if (p_vendedor_id = -1) or (cbxVendedores.Text ='') then
  begin
    pcVenda.TabIndex := 0;
    CriarMensagem('ERRO','INFORME UM VENDEDOR.');
    cbxVendedores.SetFocus;
    exit;
  end;
(*
  if ((pnl_forma_pagto.Caption = 'Selecione uma forma de pagamento') or
      (pnl_forma_pagto.Caption = '')) then
  begin
    pcVenda.TabIndex := 0;
    CriarMensagem('ERRO','INFORME UMA FORMA DE PAGAMENTO.');
    btn_busca_forma_pagto.Click;
    exit;
  end;
*)
  if p_forma_pagto_id < 0 then
  begin
    pcVenda.TabIndex := 0;
    CriarMensagem('ERRO','INFORME UMA FORMA DE PAGAMENTO.');
    btn_busca_forma_pagto.Click;
    exit;
  end;

  if dtpDataEntrega.Date < strtodate(edt_emissao.Caption) then
  begin
    pcVenda.TabIndex := 0;
    CriarMensagem('ERRO','INFORME UMA DATA DE ENTREGA VÁLIDA.');
    dtpDataEntrega.SetFocus;
    exit;
  end;

  if cdsPedidoItens.IsEmpty then
  begin
    CriarMensagem('ERRO','NÃO É POSSIVEL SALVAR UM PEDIDO SEM ITENS !');
    exit;
  end;

  {verifica se tem reforço no itens de pedido, se tiver e não houver seu itens
  avisa o usuario}
  cdsPedidoItens.First;
  if cdsPedidoItens.Locate('REFORCO_DE_VIGA','S',[]) = true then
    {tem reforço}
    if cdsPedidoFerragens.IsEmpty then
    begin
      CriarMensagem('ERRO','Exclua o item "REFORÇO DE VIGA" e tente novamente');
      exit;
    end;

  {verifica se tem concreto usinado nos itens do pedido, se houver verifica se
  tem alguma informação nos campos de concreto realizado.  ou ta tudo preenchido
  certinho ou tudo vazio}
  cdsPedidoItens.First;
  if cdsPedidoItens.Locate('CONCRETO','S',[]) = true then
    {tem concreto no pedido}
    {usuario esta tentado informar o concreto realizado}
    if not mtb_concreto_utilizado.IsEmpty then
    begin
      {então verificar os campos obrigatórios}
      {fornecedor do concreto}
      if cbx_fornecedor_concreto.Text = '' then
      begin
        CriarMensagem('ERRO', 'INFORME O FORNECEDOR DO CONCRETO.');
        tbs_concreto_realizado.TabVisible := true;
        tbs_concreto_realizado.Show;
        cbx_fornecedor_concreto.SetFocus;
        exit;
      end;
      {fornecedor da bomba}
      if cbx_prestador_servico.Text = '' then
      begin
        CriarMensagem('AVISO', 'INFORME O FORNECEDOR DA BOMBA.');
        tbs_bomba.TabVisible := true;
        tbs_bomba.Show;
        cbx_prestador_servico.SetFocus;
        exit;
      end;
      {tipo de bomba}
      if cbx_bomba_contratada.Text = '' then
      begin
        CriarMensagem('AVISO', 'INFORME O TIPO DE BOMBA CONTRATADA.');
        tbs_bomba.TabVisible := true;
        tbs_bomba.Show;
        cbx_bomba_contratada.SetFocus;
        exit;
      end;
    end;

  cdsItensLaje.Filtered := false;
  if not cdsItensLaje.IsEmpty then
  begin
    qtdeVigasInformada := 0;
    qtdeVigasDigitadas := 0;

    cdsPedidoItens.First;
    while not cdsPedidoItens.Eof do
    begin
      qtdeVigasInformada := qtdeVigasInformada + cdsPedidoItens.FieldByName('qtde_vigas').AsInteger;
      cdsPedidoItens.Next;
    end;

    cdsItensLaje.First;
    while not cdsItensLaje.Eof do
    begin
      if eViga(cdsItensLaje.FieldByName('produto_id').AsInteger) then
      begin
        qtdeVigasDigitadas := qtdeVigasDigitadas + cdsItensLaje.FieldByName('qtde').AsInteger;
      end;
      cdsItensLaje.Next;
    end;

    // se não houver itens de laje é pq o usuario digitou vigas avulsas
   // if not cdsItensLaje.IsEmpty then
    if  qtdeVigasInformada <> qtdeVigasDigitadas then
    begin
      CriarMensagem('AVISO','Quantidade de vigas DIGITADAS : "' + inttostr(qtdeVigasDigitadas) + '"' + sLineBreak +
                    'Difere da quantidade INFORMDA : "' + inttostr(qtdeVigasInformada) + '"' + sLineBreak +
                    sLineBreak +
                    'Confira os dados e tente novamente');
      pgc_principal.ActivePage := tbs_itens_pedido;
      cdspedidoitens.First;
      exit;
    end;

  end;

  result := true;

end;



procedure TfrmPedidosE.CriarTabelaTemporaria(cds : TFDMemTable);
var
  Campos : TField;
begin
  {Itens do pedido}

  (* Cria a estrutura do ClientDataSet*)
  cds.Close;
  Cds.Fields.Clear;
  Cds.FieldDefs.Clear;

  (* Coluna ID *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'ID';


  (* Coluna PEDIDO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PEDIDO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'PEDIDO_ID';

  (* Coluna ITEM *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'ITEM';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Item';


  (* Coluna PRODUTO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PRODUTO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Código';

  (* Coluna DESCRICAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'DESCRICAO';
  campos.Size         := 55;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Produtos e Serviços';

  (* Coluna QUANTIDADE *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'QTDE';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Quantidade';

  (* Coluna VALOR_UNIT *)
  Campos              := TCurrencyField.Create(self);
  Campos.FieldName    := 'CUSTO_FORNECEDOR';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Custo fornecedor';

  (* Coluna VALOR_CUSTO *)
  Campos              := TCurrencyField.Create(self);
  Campos.FieldName    := 'CUSTO';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'custo vendedor';


  (* Coluna SUB_TOTAL, Campo calculado *)
  Campos              := TCurrencyField.Create(self);
  Campos.FieldName    := 'VENDA';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  //Campos.FieldKind    := fkCalculated;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Total';

  (* Coluna SUB_TOTAL, Campo calculado *)
  Campos              := TCurrencyField.Create(self);
  Campos.FieldName    := 'SUB_TOTAL';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.FieldKind    := fkCalculated;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Total';


  (* Coluna LOCAL *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'LOCAL';
  campos.Size         := 4;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Local';

  (* Coluna SITUACAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'SITUACAO';
  campos.Size         := 15;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Situação';

  (* Coluna DATA_ENTREGA *)
  Campos              := TDateField.Create(self);
  Campos.FieldName    := 'DATA_ENTREGA';
  //campos.Size         := 25;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Data Entrega';


  (* Coluna NIVEL *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'NIVEL';
  campos.Size         := 60;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Nivel x ';

  (* Coluna LAJE *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'LAJE';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'laje';

  (* Coluna VIGA *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'VIGA';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Viga';

  (* Coluna LAJOTA *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'LAJOTA';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Lajota';

  (* Coluna ISOPOR *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'ISOPOR';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Isopor';

  (* Coluna REVENDA *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'REVENDA';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Revenda';

  (* Coluna CONCRETO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'CONCRETO';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Concreto';

  (* Coluna BOMBA *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'BOMBA';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Bomba';

  (* Coluna ADICIONAL_DE_VIGA campos auxiliar*)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'ADICIONAL_DE_VIGA';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Adicional de Viga';

  (* Coluna VERGALHAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'VERGALHAO';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Vergalhao';

  (* Coluna NEGATIVO DE LAJE *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'NEGATIVO_DE_LAJE';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'negativo de laje';

  (* Coluna REFORÇO DE VIGA *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'REFORCO_DE_VIGA';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'reforco de viga';

  (* Coluna ESTOQUE CONTROLADO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'ESTOQUE_CONTROLADO';
  campos.Size         := 1;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Estoque Controlado';


  (* Coluna ITEM *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'QTDE_VIGAS';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'QTDE_VIGAS';

  (* Coluna QTDE REAL DA LAJE *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'QTDE_REAL_LAJE';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Qtde Real';

  (* Cria o ClientDataSet de produtos em memória*)
  Cds.CreateDataSet;
  cds.Open;
end;


procedure TfrmPedidosE.CriarTabelaTemporariaItensLaje(cds: TFDMemTable);
var
  Campos : TField;
begin
  {itens da laje}
  (* Cria a estrutura do ClientDataSet*)
  cds.Close;
  Cds.Fields.Clear;
  Cds.FieldDefs.Clear;

  (* Coluna ID *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'ID';


  (* Coluna PEDIDO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PEDIDO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'PEDIDO_ID';

  (* Coluna ITEM *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'ITEM';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Item';


  (* Coluna PRODUTO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PRODUTO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Código';

  (* Coluna DESCRICAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'DESCRICAO';
  campos.Size         := 55;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Produtos e Serviços';

  (* Coluna QTDE *)
  //Campos              := TFloatField.Create(self);
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'QTDE';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Quantidade';

  (* Coluna CUSTO *)
  Campos              := TCurrencyField.Create(self);
  Campos.FieldName    := 'CUSTO';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Unitário';


  (* Coluna LOCAL *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'LOCAL';
  campos.Size         := 4;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Local';

  (* Coluna SITUACAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'SITUACAO';
  campos.Size         := 15;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Situação';

  (* Coluna NIVEL *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'NIVEL';
  campos.Size         := 15;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Nivel';

  // cds.IndexFieldNames := 'DESCRICAO';

  (* Cria o ClientDataSet de produtos em memória*)
  Cds.CreateDataSet;
  cds.Open;
end;

procedure TfrmPedidosE.CriarCdsAdicionais(cds : TFDMemTable);
var
  Campos : TField;
begin
  {ferragens e adicionais}
  (* Cria a estrutura do ClientDataSet*)
  cds.Close;
  Cds.Fields.Clear;
  Cds.FieldDefs.Clear;

  (* Coluna ID *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'ID';


  (* Coluna PEDIDO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PEDIDO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'PEDIDO_ID';

  (* Coluna PEDIDO_ITEM *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PEDIDO_ITEM';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'PEDIDO_ITEM';


  (* Coluna TABELA *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'TABELA';
  campos.Size         := 60;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'TABELA';


  (* Coluna ID_TABELA *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'ID_TABELA';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'ID_TABELA';



  (* Coluna PRODUTO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PRODUTO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Código';

  (* Coluna DESCRICAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'DESCRICAO';
  campos.Size         := 100;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Descrição';

  (* Coluna QUANTIDADE DE VIGA *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'QTDE_VIGAS';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'QtdeVigas';

  (* Coluna QUANTIDADE POR VIGA *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'QUANTIDADE';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Quantidade';

  (* Coluna DOBRA_INI *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'DOBRA_INI';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Dobra inicial';

  (* Coluna CORPO *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'CORPO';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Corpo';

  (* Coluna DOBRA_FIM *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'DOBRA_FIM';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Dobra Final';


  (* Coluna COMPRIMENTO *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'COMPRIMENTO';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Comprimento';

  (* Coluna TOTAL_LINEAR *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'TOTAL_LINEAR';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Total Linear';

{
  (* Coluna Preco_custo do fornecedor*)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'CUSTO_FORNECEDOR';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Preço de custo do fornecedor';
}
  (* Coluna Preco_custo *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'PRECO_CUSTO';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Preço de custo';

  (* Coluna Preco_Venda *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'PRECO_VENDA';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Preço de Venda';

  (* Coluna Tot_Custo *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'TOT_CUSTO';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Total de Custo';

  (* Coluna Tot_Venda *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'TOT_VENDA';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Total de Venda';


  (* Coluna POSICAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'POSICAO';
  campos.Size         := 20;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'POSICAO';

  (* Cria o ClientDataSet de produtos em memória*)
  Cds.CreateDataSet;
  cds.Open;
end;


{
procedure TfrmPedidosE.CriarCdsConcretoRealizado(cds: TFDMemTable);
var
  Campos : TField;
begin
  (* Cria a estrutura do ClientDataSet*)
  cds.Close;
  Cds.Fields.Clear;
  Cds.FieldDefs.Clear;

  (* Coluna ID *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'ID';


  (* Coluna PEDIDO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PEDIDO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'PEDIDO_ID';

  (* Coluna ITEM *)
  Campos               := TIntegerField.Create(self);
  Campos.FieldName    := 'ITEM';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Item';


  (* Coluna PRODUTO_ID *)
  Campos              := TIntegerField.Create(self);
  Campos.FieldName    := 'PRODUTO_ID';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Código';

  (* Coluna DESCRICAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'DESCRICAO';
  campos.Size         := 55;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Produtos e Serviços';

  (* Coluna QUANTIDADE *)
  Campos              := TFloatField.Create(self);
  Campos.FieldName    := 'QTDE';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Quantidade';

  (* Coluna VALOR_UNIT *)
  Campos              := TCurrencyField.Create(self);
  Campos.FieldName    := 'CUSTO';
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Unitário';


  (* Coluna LOCAL *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'LOCAL';
  campos.Size         := 4;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Local';

  (* Coluna SITUACAO *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'SITUACAO';
  campos.Size         := 15;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Situação';

  (* Coluna NIVEL *)
  Campos              := TStringField.Create(self);
  Campos.FieldName    := 'NIVEL';
  campos.Size         := 15;
  Campos.Name         := Cds.Name + Campos.FieldName;
  Campos.Index        := Cds.FieldCount;
  Campos.DataSet      := Cds;
  Campos.DisplayLabel := 'Nivel';

  (* Cria o ClientDataSet de produtos em memória*)
  Cds.CreateDataSet;
  cds.Open;
end;
}

procedure TfrmPedidosE.edFreteClienteExit(Sender: TObject);
begin
  inherited;
  Totais;
end;

procedure TfrmPedidosE.dbg_outras_despesasDblClick(Sender: TObject);
var
  outras_despesas: double;
//  pedido_atual : integer;
//  vendedor_id : integer;
  total_venda, total_custo : double;
begin
  inherited;
  //ufrmComissoesDespesaE.prc_incluir( qry.FieldByName('PEDIDO_ID').AsInteger );
(*
  pedido_atual := qry.FieldByName('PEDIDO_ID').AsInteger;
  vendedor_id  := qry.FieldByName('VENDEDOR_ID').AsInteger;
  total_venda  := qry.FieldByName('TOTAL_VENDA').AsFloat;
  total_custo  := qry.FieldByName('TOTAL_CUSTO').AsFloat;
*)


  //pedido_atual := qryComissoes.FieldByName('PEDIDO_ID').AsInteger;
  //vendedor_id  := qryComissoes.FieldByName('VENDEDOR_ID').AsInteger;
  total_venda  := qryComissoes.FieldByName('TOTAL_VENDA').AsFloat;
  total_custo  := qryComissoes.FieldByName('TOTAL_CUSTO').AsFloat;


  if frmComissoesDespesasE = nil then
    frmComissoesDespesasE := TfrmComissoesDespesasE.create(application);

  frmComissoesDespesasE.Codigo    := qry_comissao_despesas.FieldByName('ID').AsInteger;
  //frmComissoesDespesasE.pedido_id := pedido_atual;
  frmComissoesDespesasE.pedido_id := Codigo;
  frmComissoesDespesasE.Operacao  := opAlterar;
  frmComissoesDespesasE.ShowModal;


  {lista outras despesas}
  //uBiblioteca.FilterCds(qry_comissao_despesas, utipos.fsInteger, inttostr(qry.FieldByName('PEDIDO_ID').AsInteger));
  uBiblioteca.FilterCds(qry_comissao_despesas, utipos.fsInteger, inttostr(Codigo));

  {atualiza a tabela comissao, campo outras despesas e recalcula}
  if not qry_comissao_despesas.IsEmpty then
    outras_despesas := fnc_somar_despesas(codigo)
  else
   outras_despesas := 0;

  uFinanceiro.fnc_salvar_comissao(
                                  self.Conexao,
                                  opAlterar,
                                  date,
                                  date,
                                  date,
                                  codigo,
                                  p_vendedor_id,
                                  3,
                                  total_venda,
                                  total_custo,
                                  outras_despesas,
                                  1,//0.50,
                                  50
                                  );

  {pra atualizar a tela tive que fazer tudo isso, depois melhorar}
  uBiblioteca.AtualizaQuery(qryComissoes);

  prc_atualizar_Painel_comissao_triunfo;
//  prc_atualizar_Painel_comissao_ferrari;

  //uBiblioteca.FilterCds(qryComissao_itens, utipos.fsInteger, inttostr(self.Codigo));

  FreeAndNil( frmComissoesDespesasE );
end;

procedure TfrmPedidosE.dgb_recibosDblClick(Sender: TObject);
begin
  inherited;
  if not qry_recibos.IsEmpty then
   if qry_recibos.FieldByName('recibo_id').AsInteger > 0 then
  begin
    try
      if frmRecibosE = nil then
        frmRecibosE := TfrmRecibosE.Create(application);

      frmRecibosE.p_operacao := utipos.opAlterar;
      frmRecibosE.codigo := qry_recibos.FieldByName('recibo_id').AsInteger;
      frmRecibosE.ShowModal;

    finally
      freeandnil(frmRecibosE);
    end;
  end;
end;

procedure TfrmPedidosE.pmAlterarItemPedidoClick(Sender: TObject);
begin
  inherited;
  id_do_item_a_ser_alterado := cdsPedidoItens.FieldByName('ID').AsInteger;
  AlterarItemPedido;
end;

procedure TfrmPedidosE.AlterarItemPedido;
var
  e_laje : boolean;
begin
  inherited;

  if cdsPedidoItens.IsEmpty then exit;

  {verifica se o item editado é uma laje}
  e_laje := false;

  // edição do produto
  if frmPesquisaProdutos = nil then
  begin
    try

      {na edição do item mostra todos os itens do banco de dados}
      frmPesquisaProdutos := TfrmPesquisaProdutos.Create(self);
      frmPesquisaProdutos.lbl_titulo.Caption  := 'ALTERAÇÃO DE UM ITEM DO PEDIDO';
      frmPesquisaProdutos.rgFiltrar.ItemIndex := 7;
      // reposiciona componentes
      frmPesquisaProdutos.gbTamanho.Visible   := false;
      frmPesquisaProdutos.btnBuscar.Visible   := false;
      frmPesquisaProdutos.gbx_qtde_vigas.Left := 3;
      {preco vendedor}
      frmPesquisaProdutos.gb_Preco_vendedor.Visible := qry_sistema.FieldByName('PEDIDO_COLUNA_PRECO_VEND').AsString = 'S';
      frmPesquisaProdutos.btnBuscar.Click;

      frmPesquisaProdutos.qry.Locate('ID',cdsPedidoItens.FieldByName('PRODUTO_ID').AsInteger,[]);
      if ( frmPesquisaProdutos.qry.FieldByName('UNIDADE').Asstring = 'PC' ) or
         ( frmPesquisaProdutos.qry.FieldByName('UNIDADE').Asstring = 'UN' ) then
      begin
        frmPesquisaProdutos.edQtde.Text := Floattostr(cdsPedidoItens.FieldByName('QTDE').AsFloat);
      end
      else
      begin
        frmPesquisaProdutos.edQtde.Text := FormatFloat('0.00',cdsPedidoItens.FieldByName('QTDE').AsFloat);
      end;

      frmPesquisaProdutos.edt_preco_vendedor.Text := FormatFloat('0.00',cdsPedidoItens.FieldByName('CUSTO').AsFloat);
      frmPesquisaProdutos.edVenda.Text            := FormatFloat('0.00',cdsPedidoItens.FieldByName('VENDA').AsFloat);
      frmPesquisaProdutos.edItemPedido.Caption    := cdsPedidoItens.FieldByName('ITEM').AsString;
      frmPesquisaProdutos.cbxNivel.Text           := cdsPedidoItens.FieldByName('NIVEL').AsString;
      frmPesquisaProdutos.cbxLocal.text           := cdsPedidoItens.FieldByName('LOCAL').AsString;
      frmPesquisaProdutos.cbxSituacao.Text        := cdsPedidoItens.FieldByName('SITUACAO').AsString;
      frmPesquisaProdutos.p_forma_pagto_id        := p_forma_pagto_id;
      frmPesquisaProdutos.lbl_forma_pagamento.Caption := 'Forma de pagamento : ' + pnl_forma_pagto.Caption;

      if eLaje( cdsPedidoItens.FieldByName('PRODUTO_ID').AsInteger ) then
      begin
        //frmPesquisaProdutos.rgFiltrar.ItemIndex    := 0;
        frmPesquisaProdutos.gbx_qtde_vigas.Visible := true;
        frmPesquisaProdutos.edt_qtde_vigas.Text    := cdsPedidoItens.FieldByName('QTDE_VIGAS').AsString;
        e_laje := true;
      end;

      //não é permitido mudar a situação do pedido por aqui
      //frmPesquisaProdutos.cbxSituacao.Enabled := false;

      frmPesquisaProdutos.ShowModal;
      // alterar
      if frmPesquisaProdutos.itemConfirmado then
      begin

        {esta trocando uma laje por um produto não laje}
        if not eLaje(frmPesquisaProdutos.Produto) then
        begin
          if e_laje = true then
          begin
            {verifica se tem itens}
            if not cdsItensLaje.IsEmpty then
              CriarMensagem('AVISO','Não permitido alterar uma laje por outro produto. ' + sLineBreak +
                          'Primeiro exclua os itens da laje e tente novamente. ');
            exit;
          end;
        end;

       // ShowMessage('ALTERAR ITEM : ' + INTTOSTR(_ID) );
       // ShowMessage('ALTERANDO ITEM : ' + cdsPedidoItens.FieldByName('ID').AsString);
       // ShowMessage('ID DA NOVA VARIAVEL : ' + INTTOSTR(id_do_item_a_ser_alterado));

        ADDProduto('N',// ADIONAL DE VIGA
                   'S',// COMPRA DE FERROS
                   cdsPedidoItens,
                   uTipos.opAlterar,
                   _id,
                   codigo,
                   frmPesquisaProdutos.Item,
                   frmPesquisaProdutos.Produto,
                   //frmPesquisaProdutos.Descricao,
                   frmPesquisaProdutos.nomeFantasia,
                   frmPesquisaProdutos.Local,
                   frmPesquisaProdutos.Situacao,
                   frmPesquisaProdutos.Nivel,
                   frmPesquisaProdutos.Laje,     // LAJE
                   frmPesquisaProdutos.Viga,     // VIGA
                   frmPesquisaProdutos.Lajota,   // LAJOTA
                   frmPesquisaProdutos.Isopor,   // ISOPOR
                   frmPesquisaProdutos.Revenda,  // REVENDA
                   frmPesquisaProdutos.Concreto, // CONCRETO
                   frmPesquisaProdutos.Bomba,    // BOMBA
                   frmPesquisaProdutos.Vergalhao,// VEGALHAO
                   frmPesquisaProdutos.Qtde,
                   frmPesquisaProdutos.CustoFornecedor,
                   frmPesquisaProdutos.Custo,
                   frmPesquisaProdutos.Venda,
                   frmPesquisaProdutos.Negativo,
                   frmPesquisaProdutos.Reforco,
                   frmPesquisaProdutos.qtdeVigas,
                   frmPesquisaProdutos.EstoqueControlado

                 );

        SomarValorProdutos;
        {verifica se o item adicionado é uma laje, se for mostra a aba itens da laje}
        if eLaje(frmPesquisaProdutos.Produto) then
        begin
          {itens da laje fica visivel}
          tbs_itens_laje.TabVisible := true;
          {posiciona na aba de itens da laje}
//          pcPrincipal.TabIndex := 1;
          {carrega as propriedade da laje}
          p_largura_forma := qryAux.FieldByName('FORMA' ).AsInteger ;
          p_altura_Laje   := qryAux.FieldByName('ALTURA').AsInteger;
        end
        else
          tbs_itens_laje.TabVisible := false;

        p_pedido_alterado := true;

       end;

    finally
      freeandnil(frmPesquisaProdutos);
    end;
  end;
end;


procedure TfrmPedidosE.btn_alterar_pessoaClick(Sender: TObject);
begin
  inherited;
  //ufrmPessoasE.Alterar( qryClientes.FieldByName('ID').AsInteger );
  ufrmPessoasE.Alterar( p_cliente_id );

end;

procedure TfrmPedidosE.btn_busca_forma_pagtoClick(Sender: TObject);
begin
  inherited;
  p_forma_pagto_id := ufrmPesquisaFormaPagamento.fnc_executar;

  FilterCds(qryFormaPagto, fsInteger, inttostr(p_forma_pagto_id)) ;
  if p_forma_pagto_id > 0 then
    pnl_forma_pagto.Caption := qryFormaPagto.FieldByName('DESCRICAO').AsString
  else
    pnl_forma_pagto.Caption := 'Selecione uma forma de pagamento' ;

end;

procedure TfrmPedidosE.pmAlterarReforcoAdicionalClick(Sender: TObject);
var
  marcar_posicao_item_laje : integer;
  marcar_posicao_item_pedido : integer;
  e_viga : boolean;
begin
  inherited;

  marcar_posicao_item_laje   := cdsItensLaje.FieldByName('id').AsInteger;
  marcar_posicao_item_pedido := cdsPedidoItens.FieldByName('id').AsInteger;

  {item do pedido é uma viga extra?}
  e_viga := cdsPedidoItens.FieldByName('VIGA').AsString = 'S';

  EditarFerragem(cdsPedidoFerragens,'PEDIDOS_ITENS_LAJE');
  SomarValorProdutos;

  // para evitar a perca do link
  if e_viga = false then
  begin
    // volta pra posição depois da alteração
    cdsitenslaje.First;
    cdsitenslaje.Locate('id',marcar_posicao_item_laje,[]);
    // volta pra posição depois da alteração

    cdsPedidoItens.First;
    cdsPedidoItens.Locate('id',marcar_posicao_item_pedido,[]);

    tbs_itens_laje.Show;
  end
  else
  begin
    // itens de pedido
    cdsPedidoItens.First;
    cdsPedidoItens.Locate('id',marcar_posicao_item_pedido,[]);
    tbs_itens_pedido.Show;
  end;
end;

procedure TfrmPedidosE.dbg_concreto_utilizadoDblClick(Sender: TObject);
begin
  {alteração de um produto}
  try
    if frmPedidosPesquisaConcreto = nil then
      frmPedidosPesquisaConcreto := TfrmPedidosPesquisaConcreto.Create(application);
    {carrega os dados}
    frmPedidosPesquisaConcreto.qry.Open;
    frmPedidosPesquisaConcreto.cbx_produto.KeyValue := mtb_concreto_utilizadoPRODUTO_ID.AsInteger;
    frmPedidosPesquisaConcreto.edt_quantidade.Text  := mtb_concreto_utilizadoQUANTIDADE.AsString;
    frmPedidosPesquisaConcreto.edt_unitario.Text    := formatfloat('0.00', mtb_concreto_utilizadoPRECO_CUSTO.Asfloat);
    frmPedidosPesquisaConcreto.btn_confirma.Enabled := true;
    frmPedidosPesquisaConcreto.ShowModal;
    {se confirmado, altera os dados}
    if frmPedidosPesquisaConcreto.confirmado = true then
    begin
      {incluir na grid como item novo}
      dec(i);
      mtb_concreto_utilizado.edit;
      mtb_concreto_utilizado.FieldByName('PRODUTO_ID').AsInteger:= frmPedidosPesquisaConcreto.produto_id;
      mtb_concreto_utilizado.FieldByName('descricao').AsString  := frmPedidosPesquisaConcreto.descricao;
      mtb_concreto_utilizado.FieldByName('UNIDADE').AsString    := frmPedidosPesquisaConcreto.UNIDADE;
      mtb_concreto_utilizado.FieldByName('quantidade').AsString := frmPedidosPesquisaConcreto.edt_quantidade.Text;
      mtb_concreto_utilizado.FieldByName('preco_custo').AsFloat := strtofloat( frmPedidosPesquisaConcreto.edt_unitario.Text );
      mtb_concreto_utilizado.post;
    end;
  finally
    FreeAndNil(frmPedidosPesquisaConcreto);
  end;
end;

procedure TfrmPedidosE.dbg_concreto_utilizadoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //se pressionou a tecla delete dentro do dbgrid entao chama o delete do dataset
  if ( Key = VK_DELETE ) and ( not ( ds_concreto_realizado.DataSet.IsEmpty ) ) and
     ( CriarMensagem('CONFIRMAÇÃO','Tem Certeza que deseja EXCLUIR essa Informação?') ) then
  begin
    {insere na memoria para excluir no banco caso o usuário confirme}
    mtb_concreto_deletados.Insert;
    mtb_concreto_deletados.FieldByName('ID').AsInteger := mtb_concreto_utilizado.FieldByName('ID').AsInteger;
    mtb_concreto_deletados.Post;

    ds_concreto_realizado.DataSet.Delete;
  end;
end;

procedure TfrmPedidosE.EditarItemLaje(cdsItensLaje: TFDMemTable);
var
  tamanho_viga: integer;
  itemDoPedido, itemDaLaje: integer;
  tipo_produto : STRING;
begin
  {guarda posições }
  itemDoPedido := cdsPedidoItens.FieldByName('id').AsInteger;
  itemDaLaje   := cdsItensLaje.FieldByName('id').AsInteger;

  {edição do produto}
  inherited;
  if frmPesquisaProdutos = nil then
  begin
    try
      {na edição do item mostra todos os itens do banco de dados}
      frmPesquisaProdutos := TfrmPesquisaProdutos.Create(self);
      frmPesquisaProdutos.lbl_titulo.Caption := 'ALTERAÇÃO DE UM ITEM DE LAJE';
      frmPesquisaProdutos.rgFiltrar.ItemIndex       := 7;
      frmPesquisaProdutos.btnBuscar.Click;
      frmPesquisaProdutos.qry.Locate('ID',cdsItensLaje.FieldByName('PRODUTO_ID').AsInteger,[]);
      frmPesquisaProdutos.edItemPedido.Caption      := cdsPedidoItens.FieldByName('ITEM').AsString;
      frmPesquisaProdutos.edQtde.Text               := cdsItensLaje.FieldByName('QTDE').AsString;
      frmPesquisaProdutos.gbPrecoVenda.Visible      := false;
      frmPesquisaProdutos.gb_Preco_vendedor.Visible := false;

      {alterar titulo do formulario}
      frmPesquisaProdutos.Caption := 'Alterar Item';

      frmPesquisaProdutos.ShowModal;

      {Garante que o item pai seja uma laje}
      if cdsPedidoItens.FieldByName('LAJE').AsString = 'N' then
      begin
        CriarMensagem('AVISO','OPERACAO INVÁLIDA!' + #13 +
                    'Você esta tentando incluir uma viga em um produto que NÃO é Laje, ' + #13 +
                    'Selecione uma laje e tente novamente.'
                   );
        pgc_principal.ActivePage := tbs_itens_pedido;
        exit;
      end;

      {alterar}
      if frmPesquisaProdutos.itemConfirmado then
      begin

        {CAMPO NIVEL}
        if frmPesquisaProdutos.Viga = 'S' then
          tipo_produto := 'VIGA';
        if frmPesquisaProdutos.Lajota = 'S' then
          tipo_produto := 'LAJOTA';
        if frmPesquisaProdutos.Isopor = 'S' then
          tipo_produto := 'EPS';

        AddItemLaje(
                   cdsItensLaje,
                   uTipos.opAlterar,
                   _id,
                   codigo,
                   frmPesquisaProdutos.Item,
                   frmPesquisaProdutos.Produto,
                   frmPesquisaProdutos.nomeFantasia,
                   frmPesquisaProdutos.Local,
                   frmPesquisaProdutos.Situacao,
                   //frmPesquisaProdutos.Nivel,
                   tipo_produto,
                   frmPesquisaProdutos.Qtde,
                   frmPesquisaProdutos.CustoFornecedor,
                   frmPesquisaProdutos.Venda
                   );

        //if eViga(frmPesquisaProdutos.Produto) then
        if tipo_produto = 'VIGA' then
        begin
          tamanho_viga := qryAux.FieldByName('comprimento').AsInteger;

          // vai usar esta linha
          //FiltraReforcosViga(cdsPedidoFerragens, 'PEDIDOS_ITENS_LAJE', cdsItensLaje);
          prc_filtrar_ferragens('PEDIDOS_ITENS_LAJE',itemDaLaje ); // *** se der erro volta aqui

          if not cdsPedidoFerragens.IsEmpty then
          begin
            {altera a qtde de vigas}
            cdsPedidoFerragens.First;
            while not cdsPedidoFerragens.eof do
            begin
//showmessage('AQUIII');
              AddFerragem(
                           true, // é reforço de viga ?
                           cdsPedidoFerragens,
                           opAlterar,
                           cdsPedidoFerragens.FieldByName('ID').AsInteger,
                           Codigo, // N. Pedido
                           p_item_pedido,
                           'PEDIDOS_ITENS_LAJE',
                           cdsPedidoItens.FieldByName('ID').AsInteger,
                           cdsPedidoFerragens.FieldByName('PRODUTO_ID').AsInteger,
                           cdsPedidoFerragens.FieldByName('descricao').AsString,
                           cdsPedidoFerragens.FieldByName('dobra_Ini').AsFloat,
                           tamanho_viga/1000,
                           cdsPedidoFerragens.FieldByName('dobra_Fim').AsFloat,
                           cdsItensLaje.FieldByName('QTDE').AsInteger ,
                           cdsPedidoFerragens.FieldByName('quantidade').AsInteger,
                           cdsPedidoFerragens.FieldByName('preco_custo').AsFloat,
                           cdsPedidoFerragens.FieldByName('preco_venda').AsFloat,
                           //posicao
                           cdsPedidoFerragens.FieldByName('posicao').AsString
                           );

              cdsPedidoFerragens.Next;
            end; // while

            SomarReforcoViga; //(*)
          end; // if not cdsPedidoFerragens.IsEmpty then

          //SomarReforcoViga; (*) 07/11/2024 PASSEI PRA CIMA
          //SomarValorProdutos;




        end;

        p_pedido_alterado := true;
      end;
      (* alterado em 07/11/2024
      {Volta para posições iniciais}
      cdsPedidoItens.First;
      cdsPedidoItens.Locate( 'id',itemDoPedido,[]);

      pcPrincipal.ActivePage := tbs_itens_laje;
      cdsItensLaje.First;
      cdsItensLaje.Locate( 'id',itemDaLaje,[]);
      *)
    finally
      FreeAndNil( frmPesquisaProdutos );
    end;
  end;

end;




procedure TfrmPedidosE.dbg_comissao_itensDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
//  prc_zebrar_dbGrid( sender as TdbGrid, rect,  TDBGrid(Sender).DataSource.DataSet.RecNo, column, state );

end;

procedure TfrmPedidosE.dbg_contas_receberDblClick(Sender: TObject);
begin
  inherited;
(*
  {chama o formulário de baixa do contas a receber}
  if not dsContasReceber.DataSet.IsEmpty then
  if qryContasReceber.FieldByName('SALDO_ABERTO').Asfloat > 0.01 then
  begin

    ufrmContasReceber_Baixa.executa(qryContasReceber.FieldByName('ID').AsInteger,
                   lbl_cliente_nome.Caption, qryContasReceber.FieldByName('SALDO_ABERTO').Asfloat);

    {atualiza a conta}
    uBiblioteca.FilterCds(qryContasReceber, utipos.fsInteger, inttostr(Codigo));

  end;
*)
end;

procedure TfrmPedidosE.dsItensLajeDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  //FiltraReforcoViga(cdsItensLajeH8, 'PEDIDOS_ITENS_LAJE');
  prc_controla_menu_itens_laje;
  prc_filtrar_ferragens('PEDIDOS_ITENS_LAJE', cdsItensLaje.FieldByName('ID').AsInteger);
//  if cdsItensLaje.FieldByName('NIVEL').AsString = 'VIGA' then
//  ShowMessage('VIGA') ELSE ShowMessage('OUTROS');
end;

procedure TfrmPedidosE.prc_controla_menu_itens_laje;
//var
//  loQry: TFDQuery;
begin
  {desabilita se não tiver viga pra exclui}
  pmExcluirViga.Enabled   := not cdsItensLaje.IsEmpty;
  pmAlterarViga.Enabled   := not cdsItensLaje.IsEmpty;

  {só libera pra laje selecionada}
  pmIncluirLajota.Enabled :=  ( not (cdsItensLaje.IsEmpty) and (p_lajota = 'S') );
  pmIncluirIsopor.Enabled :=  ( not (cdsItensLaje.IsEmpty) and (p_isopor = 'S') );

  {libera se ja tiver lajota ou isopor incluso}
  pmLiberarLajotaIsopor.Enabled := ((pmIncluirIsopor.Enabled = true) or (pmIncluirLajota.Enabled = true));

  {só habilita se for viga}
//  loQry := uBiblioteca.CriaQuery(self.Conexao,'select * from PRODUTOS_VIGAS where PRODUTO_ID =:ID',false);
  (*
  try
    loqry := TFDQuery.Create(self);
    loQry.Connection := conexao;
    loQry.Close;
    loqry.SQL.Clear;
    loqry.SQL.Add('select * from PRODUTOS_VIGAS where PRODUTO_ID =:ID');

    loQry.ParamByName('ID').AsInteger := cdsItensLaje.FieldByName('PRODUTO_ID').AsInteger;
    loQry.Open();

    pmIncluirReforcoAdicional.Enabled := loQry.RecordCount = 1;
  finally
    loqry.Close;
    FreeAndNil( loQry );

  end;
  *)
  pmIncluirReforcoAdicional.Enabled := cdsItensLaje.FieldByName('NIVEL').AsString = 'VIGA';


  //prc_filtrar_ferragens('PEDIDOS_ITENS_LAJE', cdsItensLajeH8.FieldByName('ID').AsInteger);

end;

procedure TfrmPedidosE.dsPedidoFerragensDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  pmAlterarFerroNegativo.Enabled := not cdsPedidoFerragens.IsEmpty;
  pmExcluirFerroNegativo.Enabled := not cdsPedidoFerragens.IsEmpty;

end;

procedure TfrmPedidosE.dsPedidoItensDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  if p_executar_dataChange_ds_pedidoItes  = false then exit;

  {controle do poupUp Menu, se vazio não habilita}
  pmExcluirItemPedido.Enabled := not dsPedidoItens.DataSet.IsEmpty;
  pmAlterarItemPedido.Enabled := not dsPedidoItens.DataSet.IsEmpty;


  if cdsPedidoItens.FieldByName('VIGA').AsString = 'S' then
  begin
    pmIncluirReforoAdicional.Enabled := true;
    gbReforcosVigas.Visible          := true;
    prc_controla_menu_itens_laje;
    prc_filtrar_ferragens('PEDIDOS_ITENS', cdsPedidoItens.FieldByName('ID').AsInteger);

    //ShowMessage('filtrando reforço');
  end
  else
  begin
    pmIncluirReforoAdicional.Enabled := false;
    gbReforcosVigas.Visible          := false;
  end;



  //Inicio***********************************************************************
  {Controla aba Reforço de viga}
  tbs_reforco_viga.TabVisible := cdsPedidoItens.FieldByName('REFORCO_DE_VIGA').AsString = 'S';
  {não cosegue excluir um item pai se tiver item}
  if cdsPedidoItens.FieldByName('REFORCO_DE_VIGA').AsString = 'S' then
  begin

    {filtro pra saber se a viga tem adicional}
    cdsPedidoFerragens.Filtered := false;
    cdsPedidoFerragens.Filter   := 'QTDE_VIGAS > ' + quotedstr('0');
    cdsPedidoFerragens.Filtered := true;

    pmExcluirItemPedido.Enabled := cdsPedidoFerragens.IsEmpty;

    pmAlterarItemPedido.Enabled := true;

  end;
  //Fim***********************************************************************

  //Inicio***********************************************************************
  {Controla aba ferragem negativa/positiva}
  tbs_ferragens.TabVisible := cdsPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString = 'S';
  {não consegue excluir um item pai}
  if cdsPedidoItens.FieldByName('NEGATIVO_DE_LAJE').AsString = 'S' then
  begin

    pmExcluirItemPedido.Enabled := cdsPedidoFerragens.IsEmpty;
    pmAlterarItemPedido.Enabled := true;

  end;
  //Fim***********************************************************************

  if cdsPedidoItens.FieldByName('LAJE').AsString = 'S'  then
  begin
     //ControlaGuiaLajes(cdsPedidoItens.FieldByName('produto_id').AsInteger);
     tbs_itens_laje.TabVisible := true;
     gbReforcosVigas.Visible   := false;  // acrescetei em 30/09
  end
  else
     tbs_itens_laje.TabVisible := false;

  {controla a aba concreto}
  if cdsPedidoItens.FieldByName('CONCRETO').AsString = 'S'  then
    tbs_concreto.TabVisible := true
  else
  if cdsPedidoItens.FieldByName('CONCRETO').AsString = 'N'  then
    tbs_concreto.TabVisible := false;

end;

procedure TfrmPedidosE.ds_comissao_despesasDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  btn_excluir_lancamento.Enabled := not qry_comissao_despesas.IsEmpty;
  dbg_outras_despesas.Enabled    := not qry_comissao_despesas.IsEmpty;
  // FERRARI
  btn_excluir_lancamento_ferrari.Enabled := not qry_comissao_despesas.IsEmpty;
  dbg_outras_despesas_ferrari.Enabled    := not qry_comissao_despesas.IsEmpty;

end;

procedure TfrmPedidosE.ds_tipo_bombaDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  edt_preco_custo_bomba.Text := formatfloat('0.00', qry_tipo_bomba.FieldByName('PRECO_CUSTO').AsFloat);
end;

function TfrmPedidosE.eViga(produto: integer): boolean;
begin
  result := openQryAux('select * from PRODUTOS_VIGAS where PRODUTO_ID =:ID', inttostr(produto)) = 1;
end;

procedure TfrmPedidosE.edt_financeiro_frete_clienteExit(Sender: TObject);
begin
  inherited;
  ubiblioteca.prc_formata_dinheiro(sender);
  btn_recalcular_totais.Click;
end;

procedure TfrmPedidosE.edt_financeiro_frete_clienteKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ubiblioteca.prc_somente_numeros(sender,key);
end;

procedure TfrmPedidosE.edt_frete_clienteExit(Sender: TObject);
begin
  inherited;
  totais;
  ubiblioteca.prc_formata_dinheiro(sender);
end;

procedure TfrmPedidosE.edt_preco_custo_bombaExit(Sender: TObject);
begin
  inherited;
  edt_total_bomba.Text := formatfloat('0.00', strtoint(edt_qtde_bomba.Text) * strtofloatdef(edt_preco_custo_bomba.text,0));
end;

procedure TfrmPedidosE.edt_preco_custo_bombaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  prc_somente_numeros(sender, key);
end;

procedure TfrmPedidosE.edt_total_bombaExit(Sender: TObject);
begin
  inherited;
  ubiblioteca.prc_formata_dinheiro(sender);

end;

procedure TfrmPedidosE.edt_total_bombaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  ubiblioteca.prc_somente_numeros(sender, key);

end;

function TfrmPedidosE.eLaje(produto: integer): boolean;
begin
  {Verifica se o produto passado como parametro é uma LAJE}
  Result:= openQryAux('select * from PRODUTOS_LAJES where PRODUTO_ID =:ID',IntToStr(produto)) = 1;
end;

function TfrmPedidosE.eReforcoViga(): integer;
begin
  {Verifica se o produto passado como parametro é um Ferro adicional}
  openQryAux('select * from PRODUTOS where REFORCO_DE_VIGA = :REFORCO','S') ;
  Result:= qryAux.FieldByName('ID').AsInteger;
end;

(*
function TfrmPedidosE.eConcreto(produto: integer): boolean;
begin
  {Verifica se o produto passado como parametro é um Ferro adicional}
  Result:= openQryAux('select * from PRODUTOS_CONCRETO where PRODUTO_ID =:ID',IntToStr(produto)) = 1;
end;
*)
(*
function TfrmPedidosE.eBomba(produto: integer): boolean;
begin
  {Verifica se o produto passado como parametro é um Ferro adicional}
  Result:= openQryAux('select * from PRODUTOS_BOMBA where PRODUTO_ID =:ID',IntToStr(produto)) = 1;
end;
*)

(*
procedure TfrmPedidosE.ControlaGuiaLajes(produto: integer);
var
  loQry : TFDQuery;
begin
  try
    loQry := TFDQuery.Create(self);
    loQry.Connection := self.Conexao;
    loQry.SQL.Add('select * from PRODUTOS_LAJES where PRODUTO_ID =:ID');
    loQry.Params[0].AsInteger := produto;
    loQry.Open();

    {Verifica se o produto passado como parametro é uma laje}
    //if eLaje(produto) then
    if loQry.RecordCount = 1 then
    begin
      {achou! é uma laje}

      {cofigura as guias para a laje selecionada}

      {Carrega variaveis}
      p_largura_forma := loQry.FieldByName('FORMA').AsInteger;
      p_altura_Laje   := loQry.FieldByName('ALTURA').AsInteger;
      p_lajota        := loQry.FieldByName('LAJOTA').AsString;
      p_isopor        := loQry.FieldByName('ISOPOR').AsString;
      p_qtde_vigas    := cdsPedidoItens.FieldByName('QTDE_VIGAS').AsInteger;
      p_item_pedido   := cdsPedidoItens.FieldByName('ITEM').AsInteger;

      //...
      tbs_itens_laje.TabVisible := True;
    end // fim recordcount = 1
    else
    begin
      tbs_itens_laje.TabVisible := false;
    end;
  finally
    FreeAndNil(loQry);
  end;
end;
*)


procedure TfrmPedidosE.filtrarVigas(cds: TFDMemTable; nrPedido, nrItem: integer);
begin
  cds.Filtered := false;
  cds.Filter   := '';
  {filtra os item de uma laje da mesma altura dentro de um pedido}
  cds.Filter := 'PEDIDO_ID =' + QuotedStr(inttostr(nrPedido)) +
                ' and ITEM =' + QuotedStr(inttostr(nrItem));

  cds.Filtered := true;
end;

procedure TfrmPedidosE.AddProduto( adicionalViga, eCompraFerros: string;
                                   cds: TFDMemTable;
                                   operacao: TOperacao;
                                   aId, aPedido, aItem, aProduto: Integer;
                                   aDescricao, aLocal, aSituacao, aNivel,
                                   aLaje,aViga,aLajota, aIsopor, aRevenda,
                                   aConcreto,aBomba, aVergalhao: string;
                                   aQuantidade,aCustoFornecedor, APrecoCusto,aVenda : double;
                                   aNegativo, aReforco: string; aQtdeVigas: integer;
                                   aEstoqueControlado: string);
begin

  if operacao = uTipos.OpIncluir then
  begin
    cds.Insert;
    cds.FieldByName('ID').AsInteger        := aId;   // pk
    cds.FieldByName('PEDIDO_ID').AsInteger := codigo;
  end
  else
  if operacao = uTipos.opAlterar then
  begin
    // posiciona no item a ser alterado
    cds.First;
    cds.Locate('ID', id_do_item_a_ser_alterado, []);
    cds.Edit;
  end;

  cds.FieldByName('ITEM').AsInteger             := aItem;       //item do pedido
  cds.FieldByName('PRODUTO_ID').AsInteger       := aProduto;    //cdprod
  cds.FieldByName('DESCRICAO').AsString         := aDescricao;
  cds.FieldByName('QTDE').AsFloat               := aQuantidade ;//qtdvendprod
  cds.FieldByName('CUSTO_FORNECEDOR').AsFloat   := aCustoFornecedor; //
  cds.FieldByName('CUSTO').AsFloat              := APrecoCusto; // vlrcustoprod
  cds.FieldByName('VENDA').AsFloat              := aVenda;
  cds.FieldByName('SUB_TOTAL').AsFloat          := aQuantidade * aVenda;
  cds.FieldByName('LOCAL').AsString             := aLocal;
  cds.FieldByName('SITUACAO').AsString          := aSituacao;
  cds.FieldByName('NIVEL').AsString             := aNivel;
  cds.FieldByName('ADICIONAL_DE_VIGA').AsString := adicionalViga;//pode dar erro aqui!
  cds.FieldByName('LAJE').AsString              := aLaje;
  cds.FieldByName('VIGA').AsString              := aViga;
  cds.FieldByName('LAJOTA').AsString            := aLajota;
  cds.FieldByName('ISOPOR').AsString            := aIsopor;
  cds.FieldByName('REVENDA').AsString           := aRevenda;
  cds.FieldByName('CONCRETO').AsString          := aConcreto;
  cds.FieldByName('BOMBA').AsString             := aBomba;
  cds.FieldByName('VERGALHAO').AsString         := aVergalhao;
  cds.FieldByName('NEGATIVO_DE_LAJE').AsString  := aNegativo;
  cds.FieldByName('REFORCO_DE_VIGA').AsString   := aReforco;
  cds.FieldByName('QTDE_VIGAS').AsInteger       := aQtdeVigas;
  cds.FieldByName('ESTOQUE_CONTROLADO').AsString:= aEstoqueControlado;

  cds.Post;

end;

procedure TfrmPedidosE.AddReforcoViga(viga_extra: boolean; dsItemLaje:TDataSource; idTabela: integer);
var
  idReforcoViga: integer;
  tamanhoDaViga: double;
  posicao      : string;
  itemDoPedido : integer; // id da tabela pedido
  itemDaLaje   : integer; // id da tabela item laje


begin

  itemDoPedido := cdsPedidoItens.FieldByName('id').AsInteger;
  itemDaLaje   := cdsItensLaje.FieldByName('id').AsInteger;

  {Chama o form de cadastro de ferragem}
  if frmPedididosFerragensE = nil  then
  begin
    try
      {pega o tamanho da viga}
      if eViga(dsItemLaje.DataSet.FieldByName('PRODUTO_ID').AsInteger) then
      begin

        {comprimento maximo do reforço da viga}
        tamanhoDaViga := qryAux.FieldByName('COMPRIMENTO').AsFloat/1000;

      end;

      frmPedididosFerragensE               := TfrmPedididosFerragensE.Create(self);
      frmPedididosFerragensE.operacao      := utipos.OpIncluir;
      frmPedididosFerragensE.TamanhoDaViga := tamanhoDaViga;

      frmPedididosFerragensE.ShowModal;

      {se confirmado adiciona da grid}
      if frmPedididosFerragensE.confirmado then
      begin

       if frmPedididosFerragensE.corpo < tamanhoDaViga then
         posicao := frmPedididosFerragensE.cbxPosicao.Text
       else
         posicao := '';

        AddFerragem( true,
                     cdsPedidoFerragens,
                     OpIncluir,
                     -1,// id da tabela reforço,
                     Codigo, // pedido_id
                     p_item_pedido, // número do item no pedido
                     ubiblioteca.SeSenao( viga_extra=true, 'PEDIDOS_ITENS', 'PEDIDOS_ITENS_LAJE' ),
                     idTabela, // id da tabela de itens de laje
                     frmPedididosFerragensE.idProduto,
                     frmPedididosFerragensE.descricao,
                     frmPedididosFerragensE.dobraInicio,
                     frmPedididosFerragensE.corpo,
                     frmPedididosFerragensE.dobraFim,
                     dsItemLaje.DataSet.FieldByName('QTDE').AsInteger,
                     frmPedididosFerragensE.quantidade,
                     frmPedididosFerragensE.custoMetro,
                     frmPedididosFerragensE.vendaMetro,
                     posicao
                     );

        {totaliza na venda - adiciona/altera no cdsPedidoItens}
        cdsPedidoItens.first;
        if cdsPedidoItens.Locate('REFORCO_DE_VIGA','S',[]) = true then
        begin

          {se localizar}
          cdsPedidoItens.Edit;
          cdsPedidoItens.FieldByName('CUSTO').AsFloat := SomarValorCustoReforcoViga(false);
          cdsPedidoItens.FieldByName('VENDA').AsFloat := SomarValorVendaReforcoViga(false);
          cdsPedidoItens.Post;

        end
        else
        begin

          {adiciona no cds de itens do pedido}
          {Próximo item do pedido}
          cdsPedidoItens.Last;
          item := cdsPedidoItens.FieldByName('ITEM').AsInteger + 1;
          //
          dec(_Id);// novo id
          //
          idReforcoViga := eReforcoViga;
          ADDProduto(
                       'N', // adicional de viga
                       'N', // venda de ferragem
                       cdsPedidoItens,
                       uTipos.OpIncluir,
                       _id, //id provisório da tabela de itens do pedido
                       codigo,
                       item, // número do item do pedido
                       idReforcoViga, // cod produto
                       'REFORÇO DE VIGA',
                       'L-9',
                       'ABERTO',
                       '',
                       'N',// LAJE
                       'N',// VIGA
                       'N',// LAJOTA
                       'N',// ISOPOR
                       'N',// REVENDA
                       'N',// CONCRETO
                       'N',// BOMBA
                       'N',// VEGALHAO
                       1,
                       1,
                       1,
                       1,
                       'N',
                       'S',
                       0,
                       'N'// ESTOQUE CONTROLADO
                       );

          {apos incluir tentar localizar novamente e totalizar}
          cdsPedidoItens.First;
          if cdsPedidoItens.Locate('REFORCO_DE_VIGA','S',[]) = true then
          begin

            {se localizar}
            cdsPedidoItens.Edit;
            cdsPedidoItens.FieldByName('CUSTO').AsFloat := SomarValorCustoReforcoViga(false);
            cdsPedidoItens.FieldByName('VENDA').AsFloat := SomarValorVendaReforcoViga(false);
            cdsPedidoItens.Post;

          end;


        end;


        p_pedido_alterado := true;
      end;
    finally

      {atualiza o valor na grid itens de pedidos e os edits na tab de reforco viga}
      SomarReforcoViga;
      SomarValorProdutos;


      if viga_extra = false then
      begin
        cdsPedidoItens.Locate( 'id',itemDoPedido,[]);
        tbs_itens_laje.Show;
        cdsItensLaje.Locate( 'id',itemDaLaje,[]);
      end
      else
      begin
        {Volta pra tab itens de laje}
        cdsPedidoItens.Locate( 'id',itemDoPedido,[]);
        tbs_itens_pedido.Show;
      end;

      FreeAndNil(frmPedididosFerragensE);
    end;
  end;
end;

procedure TfrmPedidosE.AddItemLaje(cds: TFDMemTable; operacao: TOperacao;
                                   aId, aPedido, aItem, aProduto: Integer;
                                   aDescricao, aLocal, aSituacao, aNivel: string;
                                   aQuantidade,APrecoCusto,aVenda : double);
begin

  if operacao = uTipos.OpIncluir then
  begin
    cds.Append;
    cds.FieldByName('ID').AsInteger := aId;   // pk
    cds.FieldByName('PEDIDO_ID').AsInteger  := codigo;
  end
  else
  if operacao = uTipos.opAlterar then
    cds.Edit;

  cds.FieldByName('ITEM').AsInteger       := aItem;       //item do pedido
  cds.FieldByName('PRODUTO_ID').AsInteger := aProduto;    //cdprod
  cds.FieldByName('DESCRICAO').AsString   := aDescricao;
  cds.FieldByName('QTDE').AsFloat         := aQuantidade ;//qtdvendprod
  cds.FieldByName('CUSTO').AsFloat        := APrecoCusto; // vlrcustoprod
  cds.FieldByName('LOCAL').AsString       := aLocal;
  cds.FieldByName('SITUACAO').AsString    := aSituacao;
  cds.FieldByName('NIVEL').AsString       := aNivel;
  //cds.FieldByName('ADICIONAL_DE_VIGA').AsString  := aAdicionalViga;
  cds.Post;

end;
(*
procedure TfrmPedidosE.FiltraReforcosViga(dsViga: TDataSource; nmTabela:string; cdsViga: TClientDataSet);
var
  id: integer;
begin
 {Filtra um cds de forma genérica}

 if  dsViga.DataSet.State = dsBrowse then
 begin
   id := cdsViga.FieldByName('ID').AsInteger;

   {dsViga é o cds que eu quero filtrar
    ou seja só pode ser o cdsFerragem ou cdsReforcoViga}

   dsViga.DataSet.Filter   := '';
   dsViga.DataSet.Filtered := false;
   dsViga.DataSet.Filter   := 'TABELA = ' + QuotedStr(nmTabela) + ' and ID_TABELA = ' + inttostr(id) ;
   dsViga.DataSet.Filtered := true;

   gbReforcosVigas.Visible := dsViga.DataSet.RecordCount > 0;
 end;

end;
*)

procedure TfrmPedidosE.prc_filtrar_ferragens(nome_tabela: string; tabela_id: integer);
begin

   cdsPedidoFerragens.Filtered := false;
   cdsPedidoFerragens.Filter   := '';
   cdsPedidoFerragens.Filter   := 'TABELA = '    + QuotedStr(nome_tabela) +
                                  ' and ID_TABELA = ' + QuotedStr(IntToStr(tabela_id));
   cdsPedidoFerragens.Filtered := true;

   gbReforcosVigas.Visible := cdsPedidoFerragens.RecordCount > 0;
end;


end.
