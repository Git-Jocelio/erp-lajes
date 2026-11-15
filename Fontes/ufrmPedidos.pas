unit ufrmPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ComCtrls, Vcl.ToolWin, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.DBCtrls, uTipos, Vcl.ExtCtrls,
  ufrmContasReceber, ufrmPedidosCustos, ufrmPedidosTotais, IniFiles,
  unit_funcoes, frxClass, frxDBSet, frxExportBaseDialog, frxExportPDF;

type
  TfrmPedidos = class(TfrmBaseGrade)
    pcPesquisa: TPageControl;
    tbs_numero_Pedido: TTabSheet;
    tbs_obra: TTabSheet;
    tbs_customizado: TTabSheet;
    edNumeroPedido: TEdit;
    cbNome: TCheckBox;
    edNome: TEdit;
    cbEndereco: TCheckBox;
    edEndereco: TEdit;
    cbBairro: TCheckBox;
    edBairro: TEdit;
    cbCidade: TCheckBox;
    edCidade: TEdit;
    cbCEP: TCheckBox;
    edCep: TEdit;
    tbs_cpf_cnpj: TTabSheet;
    edCpfCnpj: TEdit;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    cbEmissao: TCheckBox;
    dtpEmissaoIni: TDateTimePicker;
    dtpEmissaoFim: TDateTimePicker;
    GroupBox2: TGroupBox;
    cb_contabil: TCheckBox;
    dtp_contabil_fim: TDateTimePicker;
    dtp_contabil_ini: TDateTimePicker;
    cbCliente: TCheckBox;
    cbxCliente: TDBLookupComboBox;
    cbVendedor: TCheckBox;
    cbxVendedor: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    cbxTipoVenda: TComboBox;
    cbxSituacao: TComboBox;
    cbxFinanceiro: TComboBox;
    qryCliente: TFDQuery;
    dsCliente: TDataSource;
    qryVendedor: TFDQuery;
    dsVendedor: TDataSource;
    btnFitrarNumero: TSpeedButton;
    btnFiltrarDadosObra: TSpeedButton;
    btnFiltrarCPF_CNPJ: TSpeedButton;
    qryQtde: TFDQuery;
    tbs_endereco: TTabSheet;
    btn_filtrar_endereço_cliente: TSpeedButton;
    cb_endereco_cliente: TCheckBox;
    edt_endereco_cliente: TEdit;
    cb_bairro_cliente: TCheckBox;
    edt_bairro_cliente: TEdit;
    cb_cidade_cliente: TCheckBox;
    edt_cidade_cliente: TEdit;
    cb_cep_cliente: TCheckBox;
    edt_cep_cliente: TEdit;
    edt_nome_cliente: TEdit;
    cb_nome_cliente: TCheckBox;
    btnFiltrarCustomizado: TSpeedButton;
    qrySistema: TFDQuery;
    ppm_financeiro: TPopupMenu;
    mn_conta_receber: TMenuItem;
    CUSTOS1: TMenuItem;
    mn_custo_comissao: TMenuItem;
    N1: TMenuItem;
    mn_totais: TMenuItem;
    Label2: TLabel;
    cb_entrega: TCheckBox;
    dtp_entrega_ini: TDateTimePicker;
    dtp_entrega_fim: TDateTimePicker;
    TabSheet2: TTabSheet;
    btn_pesquisar_concreto: TBitBtn;
    frx_rel_pedidos: TfrxReport;
    N2: TMenuItem;
    menu_imprimir: TMenuItem;
    frxDBEmpresa: TfrxDBDataset;
    qryEmpresa: TFDQuery;
    frxDBPedidos: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    frxDBImagem: TfrxDBDataset;
    qryImagemRelatorio: TFDQuery;
    Label4: TLabel;
    Label3: TLabel;
    cbUsuario: TCheckBox;
    cbxUsuario: TDBLookupComboBox;
    dsUsuario: TDataSource;
    qryUsuario: TFDQuery;
    qryID: TIntegerField;
    qryORCAMENTO: TStringField;
    qryNOSSO_NUMERO: TStringField;
    qryCLIENTE_ID: TIntegerField;
    qryNOME_CLIENTE: TStringField;
    qryNOME_ENTREGA: TStringField;
    qryENDERECO_CLIENTE: TStringField;
    qryENDERECO_ENTREGA: TStringField;
    qryNUMERO_CLIENTE: TStringField;
    qryNUMERO_ENTREGA: TStringField;
    qryBAIRRO_CLIENTE: TStringField;
    qryBAIRRO_ENTREGA: TStringField;
    qryCIDADE_CLIENTE: TStringField;
    qryCIDADE_ENTREGA: TStringField;
    qryCEP: TStringField;
    qryVENDEDOR_ID: TIntegerField;
    qryNOME_VENDEDOR: TStringField;
    qryDATA_EMISSAO: TDateField;
    qryDATA_CONTABIL: TDateField;
    qryDATA_ENTREGA: TDateField;
    qrySITUACAO: TStringField;
    qryVALOR_TOTAL_PEDIDO: TCurrencyField;
    qryVALOR_PAGO: TCurrencyField;
    qryPAGO: TStringField;
    qryRESTA: TFMTBCDField;
    pnl_rodape: TPanel;
    pnl_rodape_L1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    lbl_pedido_orcamento: TLabel;
    lbl_nr_Pedido: TLabel;
    Panel4: TPanel;
    Label15: TLabel;
    lbl_nm_ultimo_alterado: TLabel;
    Panel6: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbl_dt_ult_alteracao: TLabel;
    Panel7: TPanel;
    Label17: TLabel;
    lbl_nm_vendedor: TLabel;
    Panel8: TPanel;
    Label19: TLabel;
    lbl_end_entrega: TLabel;
    Panel9: TPanel;
    Label7: TLabel;
    lbl_nm_destinatatio: TLabel;
    Panel10: TPanel;
    Label13: TLabel;
    lbl_nm_emissor: TLabel;
    qryDATA_ALTERACAO: TDateField;
    qryUSUARIO_ID: TIntegerField;
    qryNOME_USUARIO: TStringField;
    qryUSUARIO_ALTERACAO_ID: TIntegerField;
    qryNOME_USUARIO_ALTERACAO: TStringField;

    procedure actIncluirExecute(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
    procedure actPesquisarExecute(Sender: TObject);
    procedure actImprimirExecute(Sender: TObject);
    procedure btnFitrarNumeroClick(Sender: TObject);
    procedure btnFiltrarDadosObraClick(Sender: TObject);
    procedure btnFiltrarCustomizadoClick(Sender: TObject);
    procedure btnFiltrarCPF_CNPJClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure tbs_numero_PedidoShow(Sender: TObject);
    procedure tbs_obraShow(Sender: TObject);
    procedure tbs_customizadoShow(Sender: TObject);
    procedure tbs_cpf_cnpjShow(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure btn_filtrar_endereço_clienteClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure tbs_enderecoShow(Sender: TObject);
    procedure mn_conta_receberClick(Sender: TObject);
    procedure mn_totaisClick(Sender: TObject);
    procedure mn_custo_comissaoClick(Sender: TObject);
    procedure cbEmissaoClick(Sender: TObject);
    procedure cb_contabilClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure edNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_pesquisar_concretoClick(Sender: TObject);
    procedure menu_imprimirClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);

  private

    FFieldOrcamento: TField;
    FsqlPadrao: string;
    procedure ASql();
    function ValidarPesquisa(): boolean;
    procedure Pesquisar();
    procedure FiltarCustomizado;
    procedure FiltarDadosObra;
    procedure FiltrarPorNumero;
    procedure FiltrarCpfCnpj;
    procedure prc_filtar_endereco_cliente;
    procedure prc_totais;
    procedure prc_ler_arquivo_ini;
  public
    property sqlPadrao : string read FsqlPadrao write FsqlPadrao;
    procedure componentes;
  end;
var
  loForm :TfrmPedidos;

procedure executa;

implementation

uses ufrmPedidosE, uBiblioteca, ufrmRelPedidos, unit_principal,
  ufrmPedidosConsultaConcreto;

procedure executa;
begin
  try
  if loForm = nil then
  begin
    loForm := TfrmPedidos.Create(Application);
    form_principal.prc_controla_menu(false);

    // se abrir dentro no painel principal no funciona os edites
    //loform.Parent := form_principal.pnl_principal;

    loform.top    := form_principal.pnl_Principal.Top +20;
    loform.Left   := form_principal.pnl_menulateral.Width;

    loForm.Width  := form_principal.pnl_principal.Width;
    loForm.Height := form_principal.pnl_principal.Height -10;
  end;
    loForm.Showmodal;
    // loform.btnPesquisar.Click;
  finally
    freeandnil(loform);
  end;
end;

{$R *.dfm}

procedure TfrmPedidos.actAlterarExecute(Sender: TObject);
var
 idAtual : integer;
begin
 // inherited;
  try
    idAtual := qry.FieldByName('ID').AsInteger;

    ufrmPedidosE.Alterar(idAtual);
    ubiblioteca.AtualizaQuery(qry);

    {Volta pro pedido selecionado}
    qry.First;
    qry.Locate('ID', idAtual, []);

    //ajustas as colunas do dbgrid
    prc_ajustar_colunas_grid( DBGrid1 );

    //aumenta o tamanho da linha do ddgrid
    prc_ajusta_tamanho_linha( DBGrid1 );

  except
    on E: Exception do
    begin
     Raise Exception.Create(E.Message  + ' : ufrmPedidos.alterar');
    end;
  end;

end;

procedure TfrmPedidos.actExcluirExecute(Sender: TObject);
begin
  inherited;
   if  not ( ds.DataSet.IsEmpty ) and
    (CriarMensagem('CONFIRMAÇÃO','Tem Certeza que deseja EXCLUIR essa Informação?')) then
   begin
    ufrmPedidosE.Excluir(qry.FieldByName('ID').AsInteger);
    ubiblioteca.AtualizaQuery(qry);
   end;
end;

procedure TfrmPedidos.actImprimirExecute(Sender: TObject);
begin
  inherited;
  ufrmRelPedidos.executa(qry.FieldByName('ID').AsInteger);
end;

procedure TfrmPedidos.actIncluirExecute(Sender: TObject);
begin
  inherited;
  ufrmPedidosE.Incluir;
  ubiblioteca.AtualizaQuery(qry);

  //ajustas as colunas do dbgrid
 // prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );



end;

procedure TfrmPedidos.actPesquisarExecute(Sender: TObject);
begin

  if btnPesquisar.Caption = 'Pesquisar >>' then
  begin
    btnPesquisar.Caption := '<< Ocultar Pesquisa';
    GroupBoxPesquisa.Height := 210; // 100

  end
  else
   begin
     btnPesquisar.Caption := 'Pesquisar >>';
     GroupBoxPesquisa.Height := 0;
   end;

end;

procedure TfrmPedidos.ASql;
begin
  qry.Close;
  qry.SQL.Clear;
(*  qry.SQL.Text :=
  'SELECT ' +
  '    P.ID, ' +
  '    P.ORCAMENTO, ' +
  '    P.NOSSO_NUMERO, ' +
  '    P.CLIENTE_ID, ' +
  '    PC.NOME AS NOME_CLIENTE, ' +
  '    COALESCE(PLE.NOME, PC.NOME) AS NOME_ENTREGA, ' +
  '    PC.ENDERECO AS ENDERECO_CLIENTE, ' +
  '    COALESCE(PLE.ENDERECO, PC.ENDERECO) AS ENDERECO_ENTREGA, ' +
  '    PC.NUMERO AS NUMERO_CLIENTE, ' +
  '    COALESCE(PLE.NUMERO, PC.NUMERO) AS NUMERO_ENTREGA, ' +
  '    PC.BAIRRO AS BAIRRO_CLIENTE, ' +
  '    COALESCE(PLE.BAIRRO, PC.BAIRRO) AS BAIRRO_ENTREGA, ' +
  '    PC.CIDADE AS CIDADE_CLIENTE, ' +
  '    COALESCE(PLE.CIDADE, PC.CIDADE) AS CIDADE_ENTREGA, ' +
  '    PC.CEP, ' +
  '    P.VENDEDOR_ID, ' +
  '    PV.NOME AS NOME_VENDEDOR, ' +
  '    P.DATA_EMISSAO, ' +
  '    P.DATA_ALTERACAO, ' +
  '    P.DATA_CONTABIL, ' +
  '    P.DATA_ENTREGA, ' +
  '    P.SITUACAO, ' +
  '    P.VALOR_TOTAL_PEDIDO, ' +
  '    P.VALOR_PAGO, ' +
  '    P.PAGO, ' +
  '    (P.VALOR_TOTAL_PEDIDO - P.VALOR_PAGO) AS RESTA ' +
  'FROM PEDIDOS P ' +
  '    INNER JOIN CLIENTES C ON C.PESSOA_ID = P.CLIENTE_ID ' +
  '    INNER JOIN PESSOAS PC ON PC.ID = C.PESSOA_ID ' +
  '    INNER JOIN VENDEDORES V ON V.PESSOA_ID = P.VENDEDOR_ID ' +
  '    INNER JOIN PESSOAS PV ON PV.ID = V.PESSOA_ID ' +
  '    LEFT JOIN PEDIDOS_LOCAL_ENTREGA PLE ON PLE.PEDIDO_ID = P.ID ' +
  'WHERE 1=1 ';
*)
qry.SQL.Text :=
  'SELECT ' +
  '    P.ID, ' +
  '    P.ORCAMENTO, ' +
  '    P.NOSSO_NUMERO, ' +
  '    P.CLIENTE_ID, ' +
  '    PC.NOME AS NOME_CLIENTE, ' +
  '    COALESCE(PLE.NOME, PC.NOME) AS NOME_ENTREGA, ' +
  '    PC.ENDERECO AS ENDERECO_CLIENTE, ' +
  '    COALESCE(PLE.ENDERECO, PC.ENDERECO) AS ENDERECO_ENTREGA, ' +
  '    PC.NUMERO AS NUMERO_CLIENTE, ' +
  '    COALESCE(PLE.NUMERO, PC.NUMERO) AS NUMERO_ENTREGA, ' +
  '    PC.BAIRRO AS BAIRRO_CLIENTE, ' +
  '    COALESCE(PLE.BAIRRO, PC.BAIRRO) AS BAIRRO_ENTREGA, ' +
  '    PC.CIDADE AS CIDADE_CLIENTE, ' +
  '    COALESCE(PLE.CIDADE, PC.CIDADE) AS CIDADE_ENTREGA, ' +
  '    PC.CEP, ' +
  '    P.VENDEDOR_ID, ' +
  '    PV.NOME AS NOME_VENDEDOR, ' +
  '    P.USUARIO_ID, ' +
  '    PU.NOME AS NOME_USUARIO, ' +
  '    P.USUARIO_ALTERACAO_ID, ' +
  '    PUA.NOME AS NOME_USUARIO_ALTERACAO, ' +
  '    P.DATA_EMISSAO, ' +
  '    P.DATA_ALTERACAO, ' +
  '    P.DATA_CONTABIL, ' +
  '    P.DATA_ENTREGA, ' +
  '    P.SITUACAO, ' +
  '    P.VALOR_TOTAL_PEDIDO, ' +
  '    P.VALOR_PAGO, ' +
  '    P.PAGO, ' +
  '    (P.VALOR_TOTAL_PEDIDO - P.VALOR_PAGO) AS RESTA ' +
  'FROM PEDIDOS P ' +
  '    INNER JOIN CLIENTES C ON C.PESSOA_ID = P.CLIENTE_ID ' +
  '    INNER JOIN PESSOAS PC ON PC.ID = C.PESSOA_ID ' +
  '    INNER JOIN VENDEDORES V ON V.PESSOA_ID = P.VENDEDOR_ID ' +
  '    INNER JOIN PESSOAS PV ON PV.ID = V.PESSOA_ID ' +
  '    LEFT JOIN PEDIDOS_LOCAL_ENTREGA PLE ON PLE.PEDIDO_ID = P.ID ' +
  '    LEFT JOIN PESSOAS PU ON PU.ID = P.USUARIO_ID ' +
  '    LEFT JOIN PESSOAS PUA ON PUA.ID = P.USUARIO_ALTERACAO_ID ' +
  'WHERE 1=1 ';
  sqlPadrao := qry.SQL.Text;


end;

procedure TfrmPedidos.btn_pesquisar_concretoClick(Sender: TObject);
var
  pedido_selecionado : integer;
begin
  inherited;
  try
  if frmPedidosConsultaConcreto = nil then
     frmPedidosConsultaConcreto := TfrmPedidosConsultaConcreto.Create(application);

   frmPedidosConsultaConcreto.ShowModal;
   {captura o pedido selecionado}
   pedido_selecionado := frmPedidosConsultaConcreto.pedido_id;
   {busca o pedido pelo seu id}
   pcPesquisa.TabIndex := 0;
   edNumeroPedido.Text := inttostr(pedido_selecionado);
   btnFitrarNumero.Click;

  finally
    freeandnil(frmPedidosConsultaConcreto);
  end;

end;

procedure TfrmPedidos.cbEmissaoClick(Sender: TObject);
begin
  inherited;
  DBGrid1.Columns[1].Visible := cbEmissao.Checked;

  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );



end;

procedure TfrmPedidos.cb_contabilClick(Sender: TObject);
begin
  inherited;
  DBGrid1.Columns[2].Visible := cb_contabil.Checked;

  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );


end;

procedure TfrmPedidos.componentes;
begin
  GroupBoxPesquisa.Height := 0;

  qrySistema.Connection  := self.Conexao;
  qrySistema.Open('select * from CONFIGURACOES_SISTEMA');

  qryCliente.Connection  := self.Conexao;
  qryCliente.Open;
  dsCliente.DataSet := qryCliente;

  qryVendedor.Connection := self.Conexao;
  qryVendedor.Open;
  dsVendedor.DataSet := qryVendedor;

  qryUsuario.Connection := self.Conexao;
  qryUsuario.Open;
  dsUsuario.DataSet := qryUsuario;


  ds.DataSet := qry;


  dtpEmissaoIni.Date    := Date;
  dtpEmissaoFim.Date    := Date;
  dtp_contabil_ini.Date := Date;
  dtp_contabil_fim.Date := Date;
  dtp_entrega_ini.Date  := Date;
  dtp_entrega_fim.Date  := Date;

  qryQtde.Connection := self.Conexao;
  qryQtde.Open('select count( id ) as qtde from pedidos');

  if qryQtde.fieldbyname('qtde').AsInteger > 100 then
  begin
    if qrySistema.FieldByName('GERAL_EMPRESA').AsString <> 'TRIUNFO' then
    begin
      ShowMessage('Atingido o número máximo de pedidos para teste');
      application.Terminate;
    end;
  end
  else
  begin
    //ShowMessage( 'número de pedidos feitos ' + inttostr(qryQtde.fieldbyname('qtde').AsInteger));
    caption := caption + ' [ Quantidade de pedidos emitidos pelo sistema "' + inttostr(qryQtde.fieldbyname('qtde').AsInteger) + '"]';
    qryQtde.Close;
  end;

  pcPesquisa.ActivePageIndex := 3;

  {mostra as colunas da grid que o usuario quer ver}
  prc_ler_arquivo_ini;
 // DBGrid1.Columns[0].Visible := qrySistema.FieldByName('PEDIDO_OUTROS_MOSTRA_ID_PEDIDO').AsString = 'S';
 qryempresa.Connection := conexao;
 qryEmpresa.Open;

 qryImagemRelatorio.Connection := conexao;
 qryImagemRelatorio.Open;
end;

procedure TfrmPedidos.mn_custo_comissaoClick(Sender: TObject);
begin
  inherited;
  ufrmPedidosCustos.prc_executa(qry.FieldByName('id').AsInteger);
end;

procedure TfrmPedidos.DBGrid1DblClick(Sender: TObject);
begin
//  inherited;
  if not qry.IsEmpty then btnAlterar.Click;
end;

procedure TfrmPedidos.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  // Verifica o orçamento do registro atual
  if FFieldOrcamento.AsString = 'S' then
    DBGrid1.Canvas.Brush.Color := $00D9F2D9
  else
    DBGrid1.Canvas.Brush.Color := clWhite;

  // Mantém a seleção padrão do Windows
  if gdSelected in State then
    DBGrid1.Canvas.Brush.Color := clHighlight;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;


procedure TfrmPedidos.DBGrid1TitleClick(Column: TColumn);
begin
 // não usarei a herança do formBAse padrao
 // inherited;

  if not qry.IsEmpty then
     prc_ordenar_dgrid( ds, DBGrid1, column ) ;

end;

procedure TfrmPedidos.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;

  lbl_nr_Pedido.Caption := qry.FieldByName('ID').AsString;
  lbl_nm_vendedor.Caption := qry.FieldByName('NOME_VENDEDOR').AsString;
  lbl_nm_emissor.Caption := qry.FieldByName('NOME_USUARIO').AsString;
  lbl_dt_ult_alteracao.Caption := qry.FieldByName('DATA_ALTERACAO').AsString;
  lbl_nm_ultimo_alterado.Caption := qry.FieldByName('NOME_USUARIO_ALTERACAO').AsString;
  lbl_nm_destinatatio.Caption := qry.FieldByName('NOME_CLIENTE').AsString;
  lbl_end_entrega.Caption := qry.FieldByName('ENDERECO_ENTREGA').AsString +
                             ' Número : ' + qry.FieldByName('NUMERO_ENTREGA').AsString +
                             ' Bairro : ' + qry.FieldByName('BAIRRO_ENTREGA').AsString +
                             ' Cidade : ' + qry.FieldByName('CIDADE_ENTREGA').AsString;

  {controle do poup menu financeiro}
  mn_conta_receber.Enabled  := not ds.DataSet.IsEmpty;
  mn_custo_comissao.Enabled := not ds.DataSet.IsEmpty;
  mn_totais.Enabled         := not ds.DataSet.IsEmpty;
  menu_imprimir.Enabled     := not ds.DataSet.IsEmpty;

  if  qry.FieldByName('orcamento').AsString = 'N' then
  begin
    lbl_pedido_orcamento.Caption := 'Número do Pedido';
    pnl_rodape.Color:= clWhite;
  end
  else
  if  qry.FieldByName('orcamento').AsString = 'S' then
  begin
    lbl_pedido_orcamento.Caption := 'Número do Orçamento';
    pnl_rodape.Color:= $00D9F2D9;
  end else
    pnl_rodape.Color:= clWhite;



end;

procedure TfrmPedidos.edNumeroPedidoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then btnFitrarNumero.Click;

end;

procedure TfrmPedidos.FormActivate(Sender: TObject);
begin
  inherited;
  // busca pedido
  btnFiltrarCustomizado.Click;
  // fecha opções de pesquisa
  btnPesquisar.Click;
end;

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  form_principal.prc_controla_menu(true);
 // freeandnil ( loForm );

end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  inherited;
  // property tabela no form BaseGrade
  self.Tabela := 'PEDIDOS';
  self.Titulo := 'Cadastro de Pedidos [' + self.Tabela + ']';
  Caption := Titulo;
  ASql();


end;

procedure TfrmPedidos.FormShow(Sender: TObject);
begin
//  inherited;
  componentes;

end;

procedure TfrmPedidos.mn_conta_receberClick(Sender: TObject);
var
  sql: string;
  marcar_posicao : integer;
begin
  inherited;

  try
    {chama o formulario de contas a receber do pedido selecionado}
    if frmContasReceber = nil then
      frmContasReceber := TfrmContasReceber.Create(self);

   // form_principal.prc_controla_menu(false);

    // se abrir dentro no painel principal não funciona os edites :(
    //loform.Parent := form_principal.pnl_principal;

    frmContasReceber.top    :=  form_principal.pnl_Principal.Top;
    frmContasReceber.Left   := form_principal.pnl_menulateral.Width;

    frmContasReceber.Width  := form_principal.pnl_principal.Width;
    frmContasReceber.Height := form_principal.pnl_principal.Height;

    marcar_posicao:= qry.FieldByName('id').AsInteger;

    {filtar a conta pelo numero do pedido}
    sql := 'select CR.*, PS.ID AS PS_ID, PS.NOME, P.ID AS NUMERO from CONTAS_RECEBER CR, PEDIDOS P, PESSOAS PS where CR.PESSOA_ID = PS.ID and  P.ID = CR.ID_ORIGEM and CR.TABELA_ORIGEM = ' + QuotedStr('PEDIDOS') + ' and CR.ID_ORIGEM =:PEDIDO_ID';
   // ShowMessage(INTTOSTR( qry.FieldByName('id').AsInteger));
    frmContasReceber.qry.SQL.clear;
    frmContasReceber.qry.SQL.Add(sql);
    frmContasReceber.qry.Params.ParamByName('PEDIDO_ID').AsInteger := qry.FieldByName('id').AsInteger;
    frmContasReceber.qry.Open;

    {mostra somente o form de baixa}
    frmContasReceber.PageControl1.ActivePage := frmContasReceber.tbs_contas_receber_baixa;
    frmContasReceber.ToolBar1.Enabled        := false;
    frmcontasreceber.TabSheet1.VISIBLE       := false;

    // atualiza caso tenha baixado o pedido
    btnFiltrarCustomizado.Click;

    frmContasReceber.ShowMODAL;

    // volta pro pedido inicial
    qry.Locate('id',marcar_posicao,[]);

  finally
    FreeAndNil(frmContasReceber);
   end;

end;

procedure TfrmPedidos.mn_totaisClick(Sender: TObject);
begin
  inherited;
 prc_totais;

end;

procedure TfrmPedidos.menu_imprimirClick(Sender: TObject);
var
  Picture: TfrxPictureView;
  logoTipo : string;
begin
  inherited;
  // carregar imagem
  logoTipo := qryEmpresa.FieldByName('img_logo').AsString;
  Picture := TfrxPictureView(frx_rel_pedidos.FindObject('Picture1'));
  if FileExists(logoTipo) then
    Picture.Picture.LoadFromFile(logoTipo)
  else
    Picture.Picture := nil;


  frx_rel_pedidos.ShowReport;
end;

procedure TfrmPedidos.prc_totais;
// procedure para totalizar um periodo de vendas
var
  // totais
  qtde_pedidos: integer;
  qtde_pedidos_pagos: integer;
  qtde_orcamento: integer;

  qtde_pedidos_abertos   : integer;
  //qtde_pedidos_entregues : integer;
  //qtde_pedidos_retirou   : integer;
  //qtde_pedidos_retirou   : integer;
  qtde_pedidos_liquidado   : integer;
  qtde_pedidos_aguardando: integer;
  qtde_pedidos_cancelados: integer;

  valor_total_pedidos : double;
  valor_pago : double;
  valor_a_receber : double;

  valor_comissoes : double;

  // parametros da pesquisa utilizada
  cliente,vendedor, nome_vendedor, emi1,emi2, cont1, cont2, ent1, ent2, orcamento, situacao, pago: string;
begin
  inherited;
  qtde_pedidos:= qry.RecordCount;
  qtde_pedidos_pagos:= 0;
  qtde_orcamento    := 0;

  qtde_pedidos_abertos   := 0;
  //qtde_pedidos_entregues := 0;
  //qtde_pedidos_retirou   := 0;
  qtde_pedidos_liquidado   := 0;

  qtde_pedidos_aguardando:= 0;
  qtde_pedidos_cancelados:= 0;

  valor_total_pedidos   := 0;
  valor_pago            := 0;
  valor_a_receber       := 0;

  valor_comissoes       := 0;

  // totalizar cabeça do frmPedidosTotais
  qry.DisableControls;
  qry.first;
  while not qry.eof do
  begin
    if qry.FieldByName('PAGO').AsString = 'S' then
      qtde_pedidos_pagos := qtde_pedidos_pagos + 1;
    if qry.FieldByName('ORCAMENTO').AsString = 'S' then
      qtde_orcamento := qtde_orcamento + 1;
    if qry.FieldByName('SITUACAO').AsString = 'ABERTO' then
      qtde_pedidos_abertos := qtde_pedidos_abertos + 1;
    (*
    if qry.FieldByName('SITUACAO').AsString = 'ENTREGUE' then
      qtde_pedidos_entregues := qtde_pedidos_entregues + 1;
    if qry.FieldByName('SITUACAO').AsString = 'RETIROU' then
      qtde_pedidos_retirou := qtde_pedidos_retirou + 1;
    *)
    if qry.FieldByName('SITUACAO').AsString = 'LIQUIDADO' then
      qtde_pedidos_liquidado := qtde_pedidos_liquidado + 1;


    if qry.FieldByName('SITUACAO').AsString = 'AGUARDANDO' then
      qtde_pedidos_aguardando := qtde_pedidos_aguardando + 1;
    if qry.FieldByName('SITUACAO').AsString = 'CANCELADO' then
      qtde_pedidos_cancelados := qtde_pedidos_cancelados + 1;

    valor_total_pedidos := valor_total_pedidos + qry.FieldByName('VALOR_TOTAL_PEDIDO').AsFloat;
    valor_pago := valor_pago + qry.FieldByName('VALOR_PAGO').AsFloat;
    valor_a_receber := valor_total_pedidos - valor_pago ;

    qry.Next;
  end;
  qry.EnableControls;
  // falta calcular comissoes do pedrio seleciona
  valor_comissoes := -1;


  {carregar as variaveis conf. parametros que o usuario selecionou, caso não selecionou passar -1}
  if (cbCliente.Checked) and (cbxCliente.Text <> '') then
    cliente := cbxCliente.KeyValue
  else
    cliente := '-1';

  if (cbVendedor.Checked) and (cbxVendedor.Text <> '') then
  begin
    vendedor := cbxVendedor.KeyValue;
    nome_vendedor := 'VENDEDOR : ' + cbxVendedor.text;
  end
  else
  begin
    vendedor := '-1';
    nome_vendedor := 'VENDEDOR - Não Informado';
  end;
  if cbEmissao.Checked then
  begin
    emi1 := datetostr(dtpEmissaoIni.date);
    emi2 := datetostr(dtpEmissaofim.date);
  end
  else
  begin
    emi1 := '-1';
    emi2 := '-1';
  end;

  if cb_contabil.Checked then
  begin
    cont1 := datetostr(dtp_contabil_ini.date);
    cont2 := datetostr(dtp_contabil_fim.date);
  end
  else
  begin
    cont1 := '-1';
    cont2 := '-1';
  end;

  if cb_entrega.Checked then
  begin
    ent1 := datetostr(dtp_entrega_ini.date);
    ent2 := datetostr(dtp_entrega_fim.date);
  end
  else
  begin
    ent1 := '-1';
    ent2 := '-1';
  end;

  if cbxTipoVenda.text <> '' then
  begin
    if cbxTipoVenda.text = '< Pedido >' then
      orcamento := 'N'
    else
      orcamento := 'S'
  end
  else
    orcamento := '-1';

  if cbxSituacao.text <> '' then
  begin
    if cbxSituacao.text = '< Todos >' then
      situacao := '-1'
    else
      situacao := cbxSituacao.text
  end
  else
    situacao := '-1';

  if cbxFinanceiro.text <> '' then
  begin
    if cbxFinanceiro.text = '< Todos >' then
      pago := '-1'
    else
    begin
      if cbxFinanceiro.text = '< Pago >' then pago := 'S';
      if cbxFinanceiro.text = '< Receber >' then pago := 'N';
    end;
  end
  else
    situacao := '-1';

 ufrmPedidosTotais.prc_executa(
                               nome_vendedor,
                               qtde_pedidos,
                               qtde_pedidos_pagos,
                               qtde_orcamento,
                               qtde_pedidos_abertos,
                              { qtde_pedidos_entregues,
                               qtde_pedidos_retirou, }
                               qtde_pedidos_liquidado,
                               qtde_pedidos_aguardando,
                               qtde_pedidos_cancelados,
                               valor_total_pedidos,
                               valor_pago,
                               valor_a_receber,
                               valor_comissoes,
                               strtoint(cliente) ,
                               strtoint(vendedor),
                               emi1,emi2,
                               cont1,cont2, ent1, ent2,
                               orcamento,
                               situacao,
                               pago
                               ) ;

end;

procedure TfrmPedidos.Pesquisar;
begin

  if ValidarPesquisa then
  begin

    if pcPesquisa.ActivePage = tbs_numero_Pedido then
    begin
      FiltrarPorNumero;
    end ELSE

    if pcPesquisa.ActivePage = tbs_endereco then
    begin
      prc_filtar_endereco_cliente;
    end ELSE

    if ((pcPesquisa.ActivePage = tbs_cpf_cnpj) and (btnFiltrarCustomizado.Tag = 0)) then
    begin
      FiltrarCpfCnpj;
    end ELSE

    if pcPesquisa.ActivePage = tbs_customizado then
    begin
      FiltarCustomizado;
    end ELSE

    if pcPesquisa.ActivePage = tbs_obra then
    begin
      FiltarDadosObra;
    end;

  end;

  // recolhe a pesquisa
  btnPesquisar.Click;

  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );

end;

procedure TfrmPedidos.btn_fecharClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmPedidos.btn_filtrar_endereço_clienteClick(Sender: TObject);
begin
  inherited;
  Pesquisar;

end;

procedure TfrmPedidos.FiltrarPorNumero;
var
 condicao : string;
begin
  {filtra pelo número do Pedido}
  condicao := ' and P.ID = :ID ';


  {carrega a instrução}
  qry.close;
  qry.Sql.Clear;
  qry.Sql.Add( sqlPadrao + condicao );

  {passagem dos parametros}
  if condicao <> '' then
    qry.ParamByName('ID').AsString := edNumeroPedido.Text;

  {abre a pesquisa}
  qry.Open();

  if qry.IsEmpty then
  begin
    criarmensagem('AVISO', 'Pedido Número "' + edNumeroPedido.Text + '" não esta cadastrado do sistema.' );
  end;

end;

procedure TfrmPedidos.FiltrarCpfCnpj;
var
 condicao : string;
begin
  {filtra pelo número do Pedido}
  condicao := ' and PC.CPF_CNPJ = :CPF_CNPJ ';


  {carrega a instrução}
  qry.close;
  qry.Sql.Clear;
  qry.Sql.Add( sqlPadrao + condicao );
  {passagem dos parametros}
  if condicao <> '' then
  begin
    //qry.Params.ParamByName('CPF_CNPJ').AsInteger := StrToInt(edCpfCnpj.Text);
    qry.Params.ParamByName('CPF_CNPJ').AsString := edCpfCnpj.Text;
  end;
  //ShowMessage(qry.SQL.Text);

  {abre a pesquisa}
  qry.Open();

  if qry.IsEmpty then
  begin
    ShowMessage('Nenhum registro encontrado');
  end;

end;

procedure TfrmPedidos.prc_filtar_endereco_cliente;
var
 condicao : string;
begin
  condicao := '';
  {filtra por Datas}
  if cb_nome_cliente.checked then
    condicao := ' and PC.NOME like :NOME_CLIENTE ';

  if cb_endereco_cliente.checked then
    condicao := condicao + ' and PC.ENDERECO like :ENDERECO ';

  if cb_bairro_cliente.checked then
    condicao := condicao + ' and PC.BAIRRO like :BAIRRO ';

  {filtra por cliente e ou vendedor}
  if cb_cidade_cliente.checked then
    condicao := condicao + ' and PC.CIDADE like :CIDADE ';

  if cb_cep_cliente.checked then
    condicao :=  condicao  + ' and PC.CEP like :CEP ';

  {carrega a instrução}
  qry.close;
  qry.Sql.Clear;
  qry.Sql.Add( sqlPadrao + condicao );
  {passagem dos parametros}
  if condicao <> '' then
  begin
    if cb_nome_cliente.checked then
      qry.ParamByName('NOME_CLIENTE').AsString := '%' + edt_nome_cliente.Text + '%';

    if cb_endereco_cliente.checked then
      qry.ParamByName('ENDERECO').AsString := '%' + edt_endereco_cliente.Text + '%';

    if cb_bairro_cliente.checked then
      qry.ParamByName('BAIRRO').AsString := '%' + edt_bairro_cliente.Text + '%';

    if cb_cidade_cliente.checked then
      qry.ParamByName('CIDADE').AsString := '%' + edt_cidade_cliente.Text + '%';

    if cb_cep_cliente.checked then
      qry.ParamByName('CEP').AsString := '%' + edt_cep_cliente.Text + '%';

  end;
  //ShowMessage(qry.SQL.Text);

  {abre a pesquisa}
  // ordena por id
  qry.SQL.Text := qry.SQL.Text + ' order by P.ID';
  qry.Open();

  if qry.IsEmpty then
  begin
    ShowMessage('Nenhum registro encontrado');
  end;

end;


procedure TfrmPedidos.btnFitrarNumeroClick(Sender: TObject);
begin
  inherited;
  pesquisar;


end;

procedure TfrmPedidos.btnFiltrarDadosObraClick(Sender: TObject);
begin
  inherited;
  pesquisar;

end;

procedure TfrmPedidos.btnFiltrarCustomizadoClick(Sender: TObject);
begin
  inherited;
  pesquisar;
  FFieldOrcamento := qry.FieldByName('ORCAMENTO');
end;

procedure TfrmPedidos.btnFiltrarCPF_CNPJClick(Sender: TObject);
begin
  inherited;
  pesquisar;
end;

procedure TfrmPedidos.TabSheet1Show(Sender: TObject);
begin
  inherited;
  GroupBoxPesquisa.Height := 210;
  edCpfCnpj.Text          := '';
  edNumeroPedido.Text     := '';
  qry.Close;

end;

procedure TfrmPedidos.tbs_numero_PedidoShow(Sender: TObject);
begin
  inherited;
  // controla botoes
  btnAlterar.Enabled  := false;
  btnExcluir.Enabled  := false;
  btnImprimir.Enabled := false;


  //dbn_principal.Visible   := false;
  GroupBoxPesquisa.Height := 140;
  edCpfCnpj.Text          := '';
  edNumeroPedido.Text     := '';
  qry.Close;
end;

procedure TfrmPedidos.tbs_obraShow(Sender: TObject);
begin
  inherited;
  // controla botoes
  btnAlterar.Enabled  := false;
  btnExcluir.Enabled  := false;
  btnImprimir.Enabled := false;

  //dbn_principal.Visible   := false;
  GroupBoxPesquisa.Height := 140;

  qry.Close;

end;

procedure TfrmPedidos.tbs_cpf_cnpjShow(Sender: TObject);
begin
  inherited;
  // controla botoes
  btnAlterar.Enabled  := false;
  btnExcluir.Enabled  := false;
  btnImprimir.Enabled := false;

  //dbn_principal.Visible   := false;
  GroupBoxPesquisa.Height := 130;
  edCpfCnpj.Clear;
  edNumeroPedido.Clear;

  qry.Close;

end;

procedure TfrmPedidos.tbs_customizadoShow(Sender: TObject);
begin
  inherited;
  // controla botoes
  btnAlterar.Enabled  := false;
  btnExcluir.Enabled  := false;
  btnImprimir.Enabled := false;

  cbxTipoVenda.ItemIndex  := 0; // Pedidos
  cbxSituacao.ItemIndex   := 5; // Todos
  cbxFinanceiro.ItemIndex := 2; // Todos
  GroupBoxPesquisa.Height := 210;

  qry.Close;
  cbEmissao.Checked := True;

end;

procedure TfrmPedidos.tbs_enderecoShow(Sender: TObject);
begin
  inherited;
  // controla botoes
  btnAlterar.Enabled  := false;
  btnExcluir.Enabled  := false;
  btnImprimir.Enabled := false;

  qry.Close;
  GroupBoxPesquisa.Height := 140;
end;

function TfrmPedidos.ValidarPesquisa: boolean;
begin
  result := false;

  if pcPesquisa.ActivePage = tbs_numero_Pedido then // número pedido
  begin
    if edNumeroPedido.Text = '' then
    begin
      criarmensagem('AVISO','INFORME UM NÚMERO VÁLIDO.');
      edNumeroPedido.SetFocus;
      exit;
    end;
  end;

  if pcPesquisa.ActivePage = tbs_cpf_cnpj then // cpf / cnpj
  begin
    //if StrToInt64Def(edCpfCnpj.Text,0)=0 then
    if edCpfCnpj.Text = '' then
    begin
      criarmensagem('AVISO','INFORME UM CPF ou CNPJ VÁLIDO.');
      edCpfCnpj.SetFocus;
      exit;
    end;
  end;

  if pcPesquisa.ActivePage = tbs_customizado then
  begin
    if cbEmissao.Checked then
      if dtpEmissaoFim.Date < dtpEmissaoIni.Date then
      begin
        criarmensagem('AVISO','DATA DE EMISSÃO INICIAL E MAIOR QUE A DATA FINAL.' + slinebreak + 'CORRIJA OS DADOS E TENTENOVAMENTE. ');
        dtpEmissaoIni.SetFocus;
        exit;
      end;

    if cb_contabil.Checked then
      if dtp_contabil_fim.Date < dtp_contabil_ini.Date then
      begin
        criarmensagem('AVISO','DATA DE CONTÁBIL INICIAL E MAIOR QUE A DATA FINAL.' + slinebreak + 'CORRIJA OS DADOS E TENTENOVAMENTE. ');
        dtp_contabil_ini.SetFocus;
        exit;
      end;


    if cb_entrega.Checked then
      if dtp_entrega_fim.Date < dtp_entrega_ini.Date then
      begin
        criarmensagem('AVISO','DATA DE ENTREGA INICIAL E MAIOR QUE A DATA FINAL.' + slinebreak + 'CORRIJA OS DADOS E TENTENOVAMENTE. ');
        dtp_contabil_ini.SetFocus;
        exit;
      end;

  end;

  if pcPesquisa.ActivePage = tbs_obra then
  begin
    if cbNome.Checked then
      if edNome.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UM NOME. ');
        edNome.SetFocus;
        exit;
      end;

    if cbEndereco.Checked then
      if edEndereco.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UM ENDEREÇO. ');
        edEndereco.SetFocus;
        exit;
      end;

    if cbBairro.Checked then
      if edBairro.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UM BAIRRO. ');
        edBairro.SetFocus;
        exit;
      end;

    if cbCidade.Checked then
      if edCidade.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UMA CIDADE. ');
        edCidade.SetFocus;
        exit;
      end;

    if cbCEP.Checked then
      if edCep.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UM CEP. ');
        edCep.SetFocus;
        exit;
      end;

  end;

  if pcPesquisa.ActivePage = tbs_endereco then
  begin
    if cb_endereco_cliente.Checked then
      if edt_endereco_cliente.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UM ENDEREÇO. ');
        edt_endereco_cliente.SetFocus;
        exit;
      end;

    if cb_bairro_cliente.Checked then
      if edt_bairro_cliente.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UM BAIRRO. ');
        edt_bairro_cliente.SetFocus;
        exit;
      end;

    if cb_cidade_cliente.Checked then
      if edt_cidade_cliente.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UMA CIDADE. ');
        edt_cidade_cliente.SetFocus;
        exit;
      end;

    if cb_cep_cliente.Checked then
      if edt_cep_cliente.Text = ''  then
      begin
        criarmensagem('AVISO','INFORME UM CEP. ');
        edt_cep_cliente.SetFocus;
        exit;
      end;

  end;


  result := true;
//  ShowMessage('validou');
end;


procedure TfrmPedidos.FiltarCustomizado;
var
 condicao : string;
begin
  condicao := '';
  {filtra por Datas}
  if cbEmissao.checked then
    condicao := ' and P.DATA_EMISSAO between :DTEMI_INI and :DTEMI_FIM ';

  if cb_contabil.checked then
    condicao := condicao + ' and P.DATA_CONTABIL between :DATA_CONTABIL_INI and :DATA_CONTABIL_FIM ';

  if cb_entrega.checked then
    condicao := condicao + ' and P.DATA_ENTREGA between :DATA_ENTREGA_INI and :DATA_ENTREGA_FIM ';

  {filtra pela situação do pedido}
  if cbxTipoVenda.text <> '< Todos >' then
    condicao := condicao + ' and P.ORCAMENTO = :ORCAMENTO ';

  if cbxSituacao.text <> '< Todos >' then
    condicao := condicao + ' and P.SITUACAO = :SITUACAO ';

  if cbxFinanceiro.text <> '< Todos >' then
    condicao := condicao + ' and P.PAGO = :PAGO ';

  {filtra por cliente e ou vendedor}
  if cbCliente.checked then
    condicao := condicao + ' and P.CLIENTE_ID = :CLIENTE ';

  if cbVendedor.checked then
    condicao :=  condicao  + ' and P.VENDEDOR_ID = :VENDEDOR ';

  if cbUsuario.checked then
    condicao :=  condicao  + ' and P.USUARIO_ID = :USUARIO_ID ';


  {carrega a instrução}
  qry.close;
  qry.Sql.Clear;
  qry.Sql.Add( sqlPadrao + condicao );
  {passagem dos parametros}
  if condicao <> '' then
  begin
    if cbEmissao.checked then
    begin
      qry.Params.ParamByName('DTEMI_INI').AsDate := dtpEmissaoIni.DateTime;
      qry.Params.ParamByName('DTEMI_FIM').AsDate := dtpEmissaoFim.DateTime;
    end;

    if cb_contabil.checked then
    begin
      qry.Params.ParamByName('DATA_CONTABIL_INI').AsDate := dtp_contabil_ini.DateTime;
      qry.Params.ParamByName('DATA_CONTABIL_FIM').AsDate := dtp_contabil_fim.DateTime;
    end;

    if cb_entrega.checked then
    begin
      qry.Params.ParamByName('DATA_ENTREGA_INI').AsDate := dtp_entrega_ini.DateTime;
      qry.Params.ParamByName('DATA_ENTREGA_FIM').AsDate := dtp_entrega_fim.DateTime;
    end;


    {filtra pela situação do pedido}
    if cbxTipoVenda.text <> '< Todos >' then
    begin
      qry.Params.ParamByName('ORCAMENTO').AsString := uBiblioteca.SeSenao(cbxTipoVenda.Text = '< Pedido >', 'N','S' );
    end;
    // ABERTO, AGUARDANDO, ENTREGUE, RETIROU, PARCIAL
    if cbxSituacao.text <> '< Todos >' then
      qry.Params.ParamByName('SITUACAO').AsString := cbxSituacao.Text;

    if cbxFinanceiro.text <> '< Todos >' then
      qry.Params.ParamByName('PAGO').AsString := uBiblioteca.SeSenao(cbxFinanceiro.Text = '< Pago >', 'S','N' );

    {filtra por cliente e ou vendedor}
    if cbCliente.checked then
      qry.Params.ParamByName('CLIENTE').AsString := cbxCliente.KeyValue;

    if cbVendedor.checked then
      qry.Params.ParamByName('VENDEDOR').AsString := cbxVendedor.KeyValue;

    if cbUsuario.checked then
      qry.ParamByName('USUARIO_ID').AsInteger := cbxUsuario.KeyValue;

  end;
  //ShowMessage(qry.SQL.Text);

  {abre a pesquisa}
  sSql := qry.SQL.Text ;
  qry.Open;

  // atualiza o dbgrid
  qry.Last; qry.First;
end;

procedure TfrmPedidos.FiltarDadosObra;
var
 condicao : string;
begin

  condicao := '';
  {filtra por Datas}
  if cbNome.checked then
    condicao := ' and PLE.NOME like :NOME_ENTREGA ';

  if cbEndereco.checked then
    condicao := condicao + ' and PLE.ENDERECO like :ENDERECO_ENTREGA ';

  {filtra pela situação do pedido}
  if cbBairro.Checked then
    condicao := condicao + ' and PLE.BAIRRO like :BAIRRO_ENTREGA ';

  if cbCidade.Checked then
    condicao := condicao + ' and PLE.CIDADE like :CIDADE_ENTREGA ';

  if cbCEP.Checked then
    condicao := condicao + ' and CEP like :CEP ';

  {carrega a instrução}
  qry.close;
  qry.Sql.Clear;
  qry.Sql.Add( sqlPadrao + condicao );
  {passagem dos parametros}
  if condicao <> '' then
  begin
    if cbNome.checked then
      qry.ParamByName('NOME_ENTREGA').AsString := '%' + edNome.Text + '%';

    if cbEndereco.checked then
      qry.ParamByName('ENDERECO_ENTREGA').AsString := '%' + edEndereco.Text + '%';

    if cbBairro.checked then
      qry.ParamByName('BAIRRO_ENTREGA').AsString := '%' + edBairro.Text + '%';


    if cbCidade.checked then
      qry.ParamByName('CIDADE_ENTREGA').AsString := '%' + edCidade.Text + '%';

    if cbCEP.checked then
      qry.ParamByName('CEP').AsString := '%' + edCep.Text + '%';

  end;
  //ShowMessage(qry.SQL.Text);

  {abre a pesquisa}
  // ordena por id
  qry.SQL.Text := qry.SQL.Text + ' order by P.ID';
  qry.Open();

  if qry.IsEmpty then
  begin
    criarmensagem('AVISO','NENHUM REGISTRO ENCONTRADO.');
  end;


end;


procedure TfrmPedidos.prc_ler_arquivo_ini;
var
  IniFile : string;
  Ini : TInifile;
  mostrar_coluna_id_pedido,
  mostrar_coluna_data_emissao,
  mostrar_coluna_data_contabil,
  mostrar_coluna_data_entrega,
  mostrar_coluna_nosso_numero,
  mostrar_coluna_valor_pedido,
  mostrar_coluna_valor_pago,
  mostrar_coluna_resta : string;
begin
  {cria um arquivo com o mesmo no da aplicação e troca a extensao para .ini}
  IniFile := ChangeFileExt(application.ExeName,'.ini');

  Ini := TIniFile.Create( IniFile );

  if not FileExists(IniFile) then
  begin
    ShowMessage('Arquivo .Ini não encontrado para configuração da tela de pedidos');
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
      //ShowMessage(mostrar_coluna_id_pedido+mostrar_coluna_nosso_numero+mostrar_coluna_valor_pedido+mostrar_coluna_valor_pago+mostrar_coluna_resta);

      DBGrid1.Columns[0].Visible := uBiblioteca.SeSenao(mostrar_coluna_id_pedido = 'true', true,false);
      DBGrid1.Columns[1].Visible := uBiblioteca.SeSenao(mostrar_coluna_data_emissao = 'true', true,false);
      DBGrid1.Columns[2].Visible := uBiblioteca.SeSenao(mostrar_coluna_data_contabil = 'true', true,false);
      DBGrid1.Columns[3].Visible := uBiblioteca.SeSenao(mostrar_coluna_nosso_numero = 'true', true,false);
      DBGrid1.Columns[5].Visible := uBiblioteca.SeSenao(mostrar_coluna_data_entrega = 'true', true,false);
      DBGrid1.Columns[8].Visible := uBiblioteca.SeSenao(mostrar_coluna_valor_pedido = 'true', true,false);
      DBGrid1.Columns[9].Visible := uBiblioteca.SeSenao(mostrar_coluna_valor_pago = 'true', true,false);
      DBGrid1.Columns[10].Visible := uBiblioteca.SeSenao(mostrar_coluna_resta = 'true', true,false);

    finally
      FreeAndNil( Ini );
    end;

  end;
end;



end.
