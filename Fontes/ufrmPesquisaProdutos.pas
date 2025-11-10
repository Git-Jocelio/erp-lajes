unit ufrmPesquisaProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, uBiblioteca;

type
  TfrmPesquisaProdutos = class(TfrmBaseConexao)
    pnRodape: TPanel;
    ds: TDataSource;
    gbQtde: TGroupBox;
    edQtde: TEdit;
    gbPrecoVenda: TGroupBox;
    edVenda: TEdit;
    gbItemPedido: TGroupBox;
    lbNivel: TLabel;
    lbLocal: TLabel;
    cbxLocal: TComboBox;
    gbBotoes: TGroupBox;
    btnConfirma: TBitBtn;
    cbxNivel: TComboBox;
    edItemPedido: TPanel;
    edt_unidade: TDBText;
    bv_unidade: TBevel;
    lbSituacao: TLabel;
    cbxSituacao: TComboBox;
    gb_Preco_vendedor: TGroupBox;
    edt_preco_vendedor: TEdit;
    Label1: TLabel;
    gb_preco_fornecedor: TGroupBox;
    edt_preco_fornecedor: TEdit;
    lbl_forma_pagamento: TLabel;
    pnl_cabecalho: TPanel;
    lbl_titulo: TLabel;
    pnl_separa_topo: TPanel;
    Panel5: TPanel;
    dbgProdutos: TDBGrid;
    pnl_resultado: TPanel;
    lbl_resultado: TLabel;
    qryID: TIntegerField;
    qryDESCRICAO: TStringField;
    qryNOME_FANTASIA: TStringField;
    qryUNIDADE: TStringField;
    qryPRECO_CUSTO: TCurrencyField;
    qryPRECO_VENDEDOR: TCurrencyField;
    qryPRECO_VENDA: TCurrencyField;
    qryESTOQUE_FISICO: TCurrencyField;
    qryPEDIDO_ABERTO: TCurrencyField;
    qryESTOQUE_DISPONIVEL: TCurrencyField;
    qryLAJE: TStringField;
    qryLAJOTA: TStringField;
    qryISOPOR: TStringField;
    qryREVENDA: TStringField;
    qryCONCRETO: TStringField;
    qryBOMBA: TStringField;
    qryVERGALHAO: TStringField;
    qryTRELICA: TStringField;
    qryNEGATIVO_DE_LAJE: TStringField;
    qryVIGA: TStringField;
    qryMATERIA_PRIMA: TStringField;
    qryREFORCO_DE_VIGA: TStringField;
    pnTopo: TPanel;
    rgFiltrar: TRadioGroup;
    Panel2: TPanel;
    rgTipoForma: TRadioGroup;
    rgAltura: TRadioGroup;
    gbx_qtde_vigas: TGroupBox;
    edt_qtde_vigas: TEdit;
    btn_fechar: TBitBtn;
    SpeedButton1: TSpeedButton;
    qryESTOQUE_CONTROLADO: TStringField;
    btnBuscar: TBitBtn;
    gbTamanho: TGroupBox;
    edTamanho: TEdit;

    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure btnConfirmaClick(Sender: TObject);
    procedure btnBuscarClick(Sender: TObject);

    procedure rgTipoFormaClick(Sender: TObject);
    procedure rgAlturaClick(Sender: TObject);
    procedure rgFiltrarClick(Sender: TObject);

    procedure edQtdeKeyPress(Sender: TObject; var Key: Char);
    procedure edTamanhoEnter(Sender: TObject);
    procedure edQtdeEnter(Sender: TObject);
    procedure edQtdeExit(Sender: TObject);
    procedure edTamanhoExit(Sender: TObject);
    procedure edTamanhoKeyPress(Sender: TObject; var Key: Char);

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    procedure edVendaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_preco_vendedorExit(Sender: TObject);
    procedure dbgProdutosKeyPress(Sender: TObject; var Key: Char);
    procedure dbgProdutosTitleClick(Column: TColumn);
    procedure btn_fecharClick(Sender: TObject);
  private
    FLocal: string;
    FProduto: integer;
    FVenda: double;
    FDescricao: string;
    FQtde: double;
    FSituacao: string;
    FCusto: double;
    FitemConfirmado: boolean;
    FNivel: string;
    FItem: integer;
    FLaje: string;
    FViga: string;
    FBomba: string;
    FRevenda: string;
    FVergalhao: string;
    FIsopor: string;
    FLajota: string;
    FConcreto: string;
    FNegativo: string;
    FReforco: string;
    FnomeFantasia: string;
    FSqlBase: string;
    FqtdeVigas: integer;
    FCustoFornecedor: double;
    Fp_forma_pagto_id: integer;
    Fp_unidade: string;
    FEstoqueControlado: string;

    procedure filtrarLajes(altura: integer);
    procedure filtrarVigas(altura, largura:integer; tamanho: string);
    procedure filtrarLajotas(altura: integer);
    procedure filtrarIsopor(altura: integer);
    procedure filtrarRevenda;
    procedure filtrarConcreto;
    procedure filtrarBomba;
    procedure filtrarTodos;

    procedure PreparaPesquisa;
    function  ValidarBusca: boolean;
    function  ValidarItem(itemLaje: boolean): boolean;
    procedure onEnter(obj: TObject);
    procedure onExit(obj: TObject);
    procedure prc_filtrar_materia_prima;

  public
    // Produto
    property Item: integer read FItem write FItem;
    property Produto: integer read FProduto write FProduto;
    property Descricao: string read FDescricao write FDescricao;
    property p_unidade: string read Fp_unidade write Fp_unidade;
    property nomeFantasia: string read FnomeFantasia write FnomeFantasia;
    property Qtde: double read FQtde write FQtde;
    property CustoFornecedor: double read FCustoFornecedor write FCustoFornecedor;
    property Custo: double read FCusto write FCusto;
    property Venda: double read FVenda write FVenda;
    property Local: string read FLocal write FLocal;
    property Nivel: string read FNivel write FNivel;
    property Situacao: string read FSituacao write FSituacao;
    property Laje: string read FLaje write FLaje;
    property Viga: string read FViga write FViga;
    property Lajota: string read FLajota write FLajota;
    property Isopor: string read FIsopor write FIsopor;
    property Revenda: string read FRevenda write FRevenda;
    property Concreto: string read FConcreto write FConcreto;
    property Bomba: string read FBomba write FBomba;
    property Vergalhao: string read FVergalhao write FVergalhao;
    property Negativo: string read FNegativo write FNegativo;
    property Reforco: string read FReforco write FReforco;
    property qtdeVigas: integer read FqtdeVigas write FqtdeVigas;
    property p_forma_pagto_id: integer read Fp_forma_pagto_id write Fp_forma_pagto_id;
    property EstoqueControlado: string read FEstoqueControlado write FEstoqueControlado;

    // define se o item foi selecionado
    property itemConfirmado: boolean read FitemConfirmado write FitemConfirmado;
    property SqlBase: string read FSqlBase write FSqlBase;


  end;

var
  frmPesquisaProdutos: TfrmPesquisaProdutos;

implementation

{$R *.dfm}

uses unit_funcoes, udmConn, unit_principal;

//uses udmConn;


procedure TfrmPesquisaProdutos.btn_fecharClick(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TfrmPesquisaProdutos.btnBuscarClick(Sender: TObject);
var
  altura, largura: integer;
  tamanho : string;
begin
  inherited;
  if ValidarBusca then
  begin
    // altura da treliça
    if rgAltura.ItemIndex = 0 then altura := 80;
    if rgAltura.ItemIndex = 1 then altura := 120;
    if rgAltura.ItemIndex = 2 then altura := 160;
    if rgAltura.ItemIndex = 3 then altura := 200;
    if rgAltura.ItemIndex = 4 then altura := 250;
    if rgAltura.ItemIndex = 5 then altura := 300;

    {forma padrão}
    if rgTipoForma.ItemIndex = 0  then largura := 130 else
    {forma painel}
    if rgTipoForma.ItemIndex = 1  then largura := 250 else
    {forma trelifacil}
    if rgTipoForma.ItemIndex = 2  then largura := 120;

    // lajes
    if rgFiltrar.ItemIndex = 0 then
      filtrarLajes(altura);

    // vigas
    if rgFiltrar.ItemIndex = 1 then
    begin
      if StrTofloatdef(edTamanho.Text,0) = 0 then
      begin
       unit_funcoes.CriarMensagem('AVISO','Informe um tamanho válido');
        edTamanho.SetFocus;
        exit;
      end;
      tamanho :=  formatfloat('0000',StrTofloat(edTamanho.Text)*1000);
      //ShowMessage(tamanho);
      filtrarVigas(altura,largura,tamanho);

    end;

    // lajotas
    if rgFiltrar.ItemIndex = 2 then
      filtrarLajotas(altura);

    // isopor
    if rgFiltrar.ItemIndex = 3 then
      filtrarIsopor(altura);

    // revenda
    if rgFiltrar.ItemIndex = 4 then
      filtrarRevenda;

    // Concreto
    if rgFiltrar.ItemIndex = 5 then
      filtrarConcreto;

    // Bomba
    if rgFiltrar.ItemIndex = 6 then
      filtrarBomba;

    // Todos
    if rgFiltrar.ItemIndex = 7 then
      filtrarTodos;

    { mat prima de lajes}
    if rgFiltrar.ItemIndex = 8 then
      prc_filtrar_materia_prima;


  end;

  {Poe o foco no dbgrid}
  frmPesquisaProdutos.ActiveControl:= dbgProdutos;

  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( dbgProdutos );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( dbgProdutos );

end;

procedure TfrmPesquisaProdutos.btnConfirmaClick(Sender: TObject);
begin
  inherited;
  if ValidarItem(gbPrecoVenda.Visible) then
  {se o groupbox venda estiver visivel, então e um item de pedido}
  begin
    Item            := StrToIntDef(edItemPedido.Caption,0);
    Produto         := qry.FieldByName('ID').AsInteger;
    Descricao       := qry.FieldByName('DESCRICAO').AsString;
    p_unidade       := qry.FieldByName('UNIDADE').AsString;
    nomeFantasia    := qry.FieldByName('NOME_FANTASIA').AsString;
    Qtde            := StrToFloatDef(edQtde.Text,0);
    CustoFornecedor := qry.FieldByName('PRECO_CUSTO').AsFloat;
    //Custo         := qry.FieldByName('PRECO_VENDEDOR'  ).AsFloat;
    Custo           := StrToFloatDef(edt_preco_vendedor.Text,0);
    Venda           := StrToFloatDef(edVenda.Text,0);
    Local           := cbxLocal.Text;
    Nivel           := cbxNivel.Text;
    Situacao        := cbxSituacao.Text;
    laje            := qry.FieldByName('LAJE').Asstring;
    Viga            := qry.FieldByName('VIGA').Asstring;
    Lajota          := qry.FieldByName('LAJOTA').Asstring;
    Isopor          := qry.FieldByName('ISOPOR').Asstring;
    Revenda         := qry.FieldByName('REVENDA').Asstring;
    Concreto        := qry.FieldByName('CONCRETO').Asstring;
    Bomba           := qry.FieldByName('BOMBA').Asstring;
    Vergalhao       := qry.FieldByName('VERGALHAO').Asstring;
    Negativo        := qry.FieldByName('NEGATIVO_DE_LAJE').Asstring;
    reforco         := qry.FieldByName('REFORCO_DE_VIGA').Asstring;
    qtdeVigas       := StrToIntDef(edt_qtde_vigas.Text,0 );
    EstoqueControlado := qry.FieldByName('ESTOQUE_CONTROLADO').Asstring;
   // ShowMessage('VALOR NEG LAJE ' + Negativo);

    itemConfirmado := true;
    close;

  end;
end;

function TfrmPesquisaProdutos.ValidarItem(itemLaje: boolean): boolean;
begin
  result := false;
  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO', 'Selecione um produto');
    exit;

  end;

  if StrToFloatDef(edQtde.Text,0) = 0  then
  begin
    unit_funcoes.CriarMensagem('AVISO','Informe uma quantidade válida');
    edQtde.SetFocus;
    exit;
  end;

  {só verifica o valor se for item de pedido}
  if itemLaje = true then
    if StrToFloatDef(edVenda.Text,0) <= 0  then
    begin
      unit_funcoes.CriarMensagem('AVISO','Informe um valor válido');
      edVenda.SetFocus;
      exit;
    end;

  if itemLaje = true then
    if StrToFloatDef(edt_preco_vendedor.Text,0) <= 0  then
    begin
      unit_funcoes.CriarMensagem('AVISO','Informe um valor válido');
      edt_preco_vendedor.SetFocus;
      exit;
    end;


  if ( (rgFiltrar.ItemIndex = 0) and
       (StrToIntDef(edt_qtde_vigas.Text,0) <= 0) and
       (gbQtde.Visible = true) ) then
  begin
    unit_funcoes.CriarMensagem('AVISO','informe a quantidade de vigas');
    edt_qtde_vigas.SetFocus;
    exit;
  end;


  result := true;
end;

procedure TfrmPesquisaProdutos.dbgProdutosKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (( key = #13 ) and not ( qry.IsEmpty ) ) then btnConfirma.Click;

end;

procedure TfrmPesquisaProdutos.dbgProdutosTitleClick(Column: TColumn);
begin
  inherited;
  //pinta o titulo da coluna que foi clicada
  prc_pintar_titulo_coluna( dbgProdutos, Column );

  if ( not ( ds.DataSet.IsEmpty ) ) then
  begin
    //ao inves de usar o order by, pode ser ordenado usando a propriedade
    // IndexFieldNames nos componentes TFDQuery - :D corresponde ao decrescente
    if ( ds.DataSet as TFDQuery ).IndexFieldNames = Column.FieldName Then
      ( ds.DataSet as TFDQuery ).IndexFieldNames := Column.FieldName + ':D'
    else
      ( ds.DataSet as TFDQuery ).IndexFieldNames := Column.FieldName;

    //apos realizar a ordenação, coloca o cursor no primeiro campo
    ( ds.DataSet as TFDQuery ).First;

    //ajustas as colunas do dbgrid
    prc_ajustar_colunas_grid( dbgProdutos );

    //aumenta o tamanho da linha do ddgrid
    prc_ajusta_tamanho_linha( dbgProdutos );
  end;

end;

procedure TfrmPesquisaProdutos.dsDataChange(Sender: TObject; Field: TField);
var
  loQry : TFDQuery;
  v_preco_fornecedor, v_preco_venda, v_preco_vendedor: double;
begin
  inherited;

  // só executa se for a tela de pedidos que chamou
  if gbQtde.Visible = true then
  begin
    try
      {qry auxiliar para buscar o preço conforme a forma de pagamento selecionada}
      loQry := TFDQuery.Create(self);
      loQry.Connection := conexao;
      loQry.SQL.Add('select * from PRODUTOS_FORMA_PAGAMENTO where PRODUTO_ID =:PRODUTO_ID and FORMA_PAGTO_ID =:FORMA_PAGTO_ID');
      loQry.Params.ParamByName('PRODUTO_ID').AsInteger     := qry.FieldByName('ID').AsInteger;
      loQry.Params.ParamByName('FORMA_PAGTO_ID').AsInteger := p_forma_pagto_id;
      loQry.Open;

      if not loQry.IsEmpty then
      begin
        {se achar precos cadastrado na tabela PRODUTOS_FORMA_PAGAMENTOS... usa eles}
        v_preco_venda    :=  loqry.FieldByName('PRECO_VENDA').AsFloat;
        v_preco_vendedor :=  loqry.FieldByName('PRECO_VENDEDOR').AsFloat ;
      end
      else
      begin
        {senão usa os preços da tabela de PRODUTOS }
        v_preco_venda    :=  qry.FieldByName('PRECO_VENDA').AsFloat;
        v_preco_vendedor :=  qry.FieldByName('PRECO_VENDEDOR').AsFloat ;
      end;
      v_preco_fornecedor    :=  qry.FieldByName('PRECO_CUSTO').AsFloat;
    finally
      loQry.Close;
      FreeAndNil(loQry);
    end;

    gbx_qtde_vigas.Visible := qry.FieldByName('LAJE').AsString = 'S';
  end;

  if not qry.IsEmpty then
  begin

    if (qry.FieldByName('UNIDADE').AsString = 'PC') or
       (qry.FieldByName('UNIDADE').AsString = 'UN') then
    begin
      edQtde.NumbersOnly      := true;
      edQtde.Text             := formatfloat('0',strtofloat(edQtde.Text));
    end
    else
    begin
      edQtde.NumbersOnly      := false;
      edQtde.Text             := formatfloat('0.00',strtofloat(edQtde.Text));
    end;

    edt_preco_fornecedor.Text := formatfloat('0.00',v_preco_fornecedor);
    edt_preco_vendedor.Text   := formatfloat('0.00',v_preco_vendedor);
    edVenda.Text              := formatfloat('0.00',v_preco_venda);

    btnConfirma.Enabled := true;
  end
  else
  begin
    edQtde.NumbersOnly      := false;
  //  edQtde.Text             := '1';
    edt_preco_vendedor.Text := '0,00';
    edVenda.Text            := '0,00';
    btnConfirma.Enabled     := false;
  end;

  {Situação do item, se concreto ou bomba, marca aguardando}
  if (qry.FieldByName('CONCRETO').AsString = 'S') or (qry.FieldByName('BOMBA').AsString = 'S') then
    cbxSituacao.text := 'AGUARDANDO'
  else
    cbxSituacao.text := 'ABERTO';

end;



procedure TfrmPesquisaProdutos.edQtdeEnter(Sender: TObject);
begin
  inherited;
  onEnter(sender as TEdit);

end;

procedure TfrmPesquisaProdutos.edQtdeExit(Sender: TObject);
begin
  inherited;
  onExit(sender as TEdit);

end;

procedure TfrmPesquisaProdutos.edQtdeKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  uBiblioteca.prc_somente_numeros(sender, key);
  if Key = #13 then btnConfirma.Click;
end;

procedure TfrmPesquisaProdutos.edTamanhoEnter(Sender: TObject);
begin
  inherited;
  onEnter(sender as TEdit);
end;

procedure TfrmPesquisaProdutos.edTamanhoExit(Sender: TObject);
begin
  inherited;
  onExit(sender as TEdit);

end;

procedure TfrmPesquisaProdutos.edTamanhoKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if rgFiltrar.ItemIndex = 1 then prc_somente_numeros(sender, key);
  if Key = #13 then btnBuscar.Click;

end;

procedure TfrmPesquisaProdutos.edt_preco_vendedorExit(Sender: TObject);
begin
  inherited;
    onExit(sender as TEdit);
    uBiblioteca.prc_formata_dinheiro(sender);
end;

procedure TfrmPesquisaProdutos.edVendaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  prc_somente_numeros(sender,key);
end;

procedure TfrmPesquisaProdutos.onEnter(obj: TObject);
begin
   (obj as Tedit).Color := $00A0F8FA;
end;

procedure TfrmPesquisaProdutos.onExit(obj: TOBject);
begin
   (obj as Tedit).Color := clWindow;
end;


procedure TfrmPesquisaProdutos.filtrarLajes(altura: integer);
begin
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  qry.SQL.Add(' from PRODUTOS P, PRODUTOS_LAJES L ');
  qry.SQL.Add(' where L.PRODUTO_ID = P.ID and L.ALTURA =:ALTURA');
 // ShowMessage(qry.SQL.Text);
  qry.Params[0].AsInteger := altura;
  QRY.Open();


  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','LAJE não foi cadastrada no sistema');
  end;
end;

procedure TfrmPesquisaProdutos.filtrarVigas(altura, largura: integer; tamanho: string);
begin

  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  qry.SQL.Add('from PRODUTOS P, PRODUTOS_VIGAS V ');
  qry.SQL.Add('where ');
  qry.SQL.Add('V.PRODUTO_ID = P.ID and ');
  qry.SQL.Add('V.trelica_ALTURA = :ALTURA  and ');
  qry.SQL.Add('V.forma_medida   = :LARGURA and ');
  qry.SQL.Add('V.COMPRIMENTO    = :TAMANHO');
  //
  qry.Params[0].AsInteger := altura;
  qry.Params[1].AsInteger := largura;
  qry.Params[2].AsString  := tamanho;
  qry.Open();


  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','VIGA não foi cadastrada no sistema');
  end;
end;

procedure TfrmPesquisaProdutos.filtrarLajotas(altura: integer);
begin
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  qry.SQL.Add('from PRODUTOS P, PRODUTOS_LAJOTAS L ');
  qry.SQL.Add('where ');
  qry.SQL.Add('L.PRODUTO_ID = P.ID and L.ALTURA =:ALTURA');
  //
  QRY.ParamByName('ALTURA').AsInteger := altura;
  QRY.Open();

  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','LAJOTA não foi cadastrada no sistema');
  end;
end;


procedure TfrmPesquisaProdutos.filtrarIsopor(altura: integer);
begin
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  qry.SQL.Add('from PRODUTOS P, PRODUTOS_EPS E ');
  qry.SQL.Add('where ');
  qry.SQL.Add('E.PRODUTO_ID = P.ID and E.ALTURA =:ALTURA');
  //
  QRY.Params[0].AsInteger := altura;
  QRY.Open();



  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','ISOPOR não foi cadastrado no sistema');
  end;
end;

procedure TfrmPesquisaProdutos.filtrarRevenda;
begin
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  qry.SQL.Add('from ');
  qry.SQL.Add('  PRODUTOS P ');
  qry.SQL.Add('where ');
  qry.SQL.Add(' P.VERGALHAO =      ' + quotedstr('N')+ ' and ');
  qry.SQL.Add(' P.TRELICA =        ' + quotedstr('N') + ' and ');
//  qry.SQL.Add(' P.REFORCO_DE_VIGA =' + quotedstr('N') + ' and ');
  qry.SQL.Add(' P.REVENDA =        ' + quotedstr('S'));
  qry.SQL.Add('order by ');
  qry.SQL.Add(' P.NOME_FANTASIA');
  QRY.Open();


  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','PRODUTO não foi cadastrado no sistema');
  end;
end;


procedure TfrmPesquisaProdutos.filtrarConcreto;
begin
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  qry.SQL.Add('from PRODUTOS P, PRODUTOS_CONCRETO C ');
  qry.SQL.Add('where ');
  qry.SQL.Add('C.PRODUTO_ID = P.ID ');
  //
  QRY.Open();

  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','CONCRETO não foi cadastrada no sistema');
  end;
end;

procedure TfrmPesquisaProdutos.filtrarBomba;
begin
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  qry.SQL.Add('from PRODUTOS P, PRODUTOS_BOMBA B ');
  qry.SQL.Add('where ');
  qry.SQL.Add('B.PRODUTO_ID = P.ID');
  //
  QRY.Open();

  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','BOMBA não foi cadastrada no sistema');
  end;
end;

procedure TfrmPesquisaProdutos.filtrarTodos;
begin
  // lista todos menos ferragens e treliças
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  //
  qry.SQL.Add('from                                      ');
  qry.SQL.Add('  PRODUTOS P                              ');
  qry.SQL.Add('where                                     ');
  qry.SQL.Add('  P.VERGALHAO =' + QuotedStr('N') + ' and ');
  //qry.SQL.Add('  P.TRELICA =' + QuotedStr('N') + ' and   ');
  qry.SQL.Add('  P.NOME_FANTASIA like :DESCRICAO         ');
  qry.SQL.Add('order by                                  ');
  qry.SQL.Add('  P.NOME_FANTASIA                         ');

  // localiza o produto
  qry.ParamByName('DESCRICAO').AsString := '%'+edTamanho.Text+'%';
  qry.Open();


  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','Produto não localizado');
  end;
end;

procedure TfrmPesquisaProdutos.prc_filtrar_materia_prima;
begin
  // listar materia prima na fabricação de lajes
  qry.SQL.Clear;
  qry.SQL.Add(SqlBase);
  //
  qry.SQL.Add('from                                 ');
  qry.SQL.Add('  PRODUTOS P                         ');
  qry.SQL.Add('where                                ');
  qry.SQL.Add('  P.MATERIA_PRIMA =' + QuotedStr('S') );

  qry.Open;

  if qry.IsEmpty then
  begin
    unit_funcoes.CriarMensagem('AVISO','Produto não localizado');
  end;
end;


function TfrmPesquisaProdutos.ValidarBusca: boolean;
begin
  result := false;

  if rgFiltrar.ItemIndex = -1  then
  begin
    unit_funcoes.CriarMensagem('AVISO','Selecione um tipo de produto');
    rgFiltrar.SetFocus;
    exit;
  end;

  if ((rgFiltrar.ItemIndex = 0) and (rgAltura.ItemIndex = -1))  then
  begin
    unit_funcoes.CriarMensagem('AVISO','Selecione a altura da Laje');
    rgAltura.SetFocus;
    exit;
  end;

  if ((rgFiltrar.ItemIndex = 1) and (rgTipoForma.ItemIndex = -1))  then
  begin
    unit_funcoes.CriarMensagem('AVISO','Selecione a largura da forma');
    rgTipoForma.SetFocus;
    exit;
  end;

  if ((rgFiltrar.ItemIndex = 1) and (rgAltura.ItemIndex = -1))  then
  begin
    unit_funcoes.CriarMensagem('AVISO','Selecione a altura da viga');
    rgTipoForma.SetFocus;
    exit;
  end;

  if ((rgFiltrar.ItemIndex = 2) and (rgAltura.ItemIndex = -1))  then
  begin
    unit_funcoes.CriarMensagem('AVISO','Selecione a altura da lajota');
    rgAltura.SetFocus;
    exit;
  end;

  if ((rgFiltrar.ItemIndex = 3) and (rgAltura.ItemIndex = -1))  then
  begin
    unit_funcoes.CriarMensagem('AVISO','Selecione a altura do isopor');
    rgAltura.SetFocus;
    exit;
  end;

  result := true;

end;

procedure TfrmPesquisaProdutos.FormActivate(Sender: TObject);
begin
  inherited;
  // posição do form
(*  frmPesquisaProdutos.Top  := form_principal.pnl_topo.Height;
  frmPesquisaProdutos.Left := form_principal.pnl_menulateral.Width;
  // dimensoes
  frmPesquisaProdutos.Width  := form_principal.pnl_Principal.Width;
  frmPesquisaProdutos.Height := form_principal.pnl_Principal.Height;
 *)
end;

procedure TfrmPesquisaProdutos.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Connection := self.Conexao;
  itemConfirmado := false;

  SqlBase :=
            'select                 ' +
            ' P.ID ,                ' +
            ' P.DESCRICAO ,         ' +
            ' P.NOME_FANTASIA ,     ' +
            ' P.UNIDADE,            ' +
            ' P.PRECO_CUSTO,        ' +
            ' P.PRECO_VENDEDOR,     ' +
            ' P.PRECO_VENDA,        ' +
            ' P.ESTOQUE_FISICO,     ' +
            ' P.PEDIDO_ABERTO,      ' +
            ' P.ESTOQUE_DISPONIVEL, ' +
            ' P.REVENDA,            ' +
            ' P.MATERIA_PRIMA,      ' +
            ' P.LAJE,               ' +
            ' P.VIGA,               ' +
            ' P.LAJOTA, P.ISOPOR,   ' +
            ' P.CONCRETO,           ' +
            ' P.BOMBA,              ' +
            ' P.VERGALHAO,          ' +
            ' P.TRELICA,            ' +
            ' P.NEGATIVO_DE_LAJE,   ' +
            ' P.REFORCO_DE_VIGA,    ' +
            ' P.ESTOQUE_CONTROLADO  ';
    // posiciona os botoes no centro
    btnConfirma.Left := trunc( gbBotoes.Width / 2 ) - btnConfirma.Width;
    btn_fechar.Left  := btnConfirma.Left + btnConfirma.Width - 20;
end;

procedure TfrmPesquisaProdutos.FormShow(Sender: TObject);
begin
  inherited;
  if rgTipoForma.Visible  then edTamanho.SetFocus;

  if cbxLocal.Text = ''  then
    cbxLocal.Text := 'L-9';

  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( dbgProdutos );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( dbgProdutos );

end;

procedure TfrmPesquisaProdutos.rgAlturaClick(Sender: TObject);
begin
  inherited;
  PreparaPesquisa;
  if rgFiltrar.ItemIndex <> 1 then
  begin
    btnbuscar.Visible := false;
    btnBuscar.Click;
  end;
end;

procedure TfrmPesquisaProdutos.PreparaPesquisa;
begin

  btnBuscar.VISIBLE := true;

  qry.Close;
  edVenda.Text           := '0,00';
  btnConfirma.Enabled    := false;
  edt_qtde_vigas.Text    := '';
  edTamanho.NumbersOnly  := false;
end;

procedure TfrmPesquisaProdutos.rgFiltrarClick(Sender: TObject);
begin
  inherited;
  PreparaPesquisa;
  // lajes
  if rgFiltrar.ItemIndex = 0 then
  begin
    rgTipoForma.Visible    := false;

    rgAltura.Visible       := true;
    rgAltura.left          := 3;

    gbx_qtde_vigas.Visible := true;
    gbx_qtde_vigas.left    := 126;

    gbTamanho.Visible      := false;
    btnbuscar.Visible      := false;

    edQtde.NumbersOnly     := False;
    cbxNivel.Text          := 'Térreo';
  end;
  // vigas
  if rgFiltrar.ItemIndex = 1 then
  begin
    rgTipoForma.Visible    := true;
    rgTipoForma.left       := 3;
    rgTipoForma.ItemIndex  := 0;

    gbx_qtde_vigas.Visible := false;

    rgAltura.Visible       := true;
    rgAltura.left          := 118;

    gbTamanho.Left         := 240;
    gbTamanho.Caption      := ' Tamanho da viga  ';
    gbTamanho.Visible      := true;
    edTamanho.text         := '';

    btnBuscar.Visible      := true;
    btnBuscar.left         := 407;
    edQtde.NumbersOnly     := True;
  end;
  // lajotas
  if rgFiltrar.ItemIndex = 2 then
  begin
    //btnbuscar.Visible      := false;
    rgTipoForma.Visible    := false;
    rgAltura.Visible       := true;
    rgAltura.left          := 3;
    gbTamanho.Visible      := false;
    edQtde.NumbersOnly     := True;
    gbx_qtde_vigas.Visible := false;
    btnBuscar.Visible      := false;
  end;
  // isopor
  if rgFiltrar.ItemIndex = 3 then
  begin
    //btnbuscar.Visible      := false;
    rgTipoForma.Visible    := false;
    rgAltura.Visible       := true;
    rgAltura.left          := 3;
    gbTamanho.Visible      := false;
    edQtde.NumbersOnly     := True;
    gbx_qtde_vigas.Visible := false;
    btnBuscar.Visible      := false;
  end;
  // revenda
  if rgFiltrar.ItemIndex = 4 then
  begin
    rgTipoForma.Visible    := false;
    rgAltura.Visible       := false;
    gbTamanho.Visible      := false;
    edQtde.NumbersOnly     := false;
    gbx_qtde_vigas.Visible := false;
    btnbuscar.Visible      := false;
    btnBuscar.Click;
  end;
  // concreto usinado
  if rgFiltrar.ItemIndex = 5 then
  begin
    rgTipoForma.Visible    := false;
    rgAltura.Visible       := false;
    gbTamanho.Visible      := false;
    edQtde.NumbersOnly     := false;
    gbx_qtde_vigas.Visible := false;
    btnBuscar.VISIBLE := FALSE;;
    btnBuscar.Click;
 end;
  // bomba
  if rgFiltrar.ItemIndex = 6 then
  begin
    btnBuscar.VISIBLE := FALSE;;
    rgTipoForma.Visible    := false;
    rgAltura.Visible       := false;
    gbTamanho.Visible      := false;
    edQtde.NumbersOnly     := True;
    gbx_qtde_vigas.Visible := false;
    btnBuscar.Click;
  end;

  // todos
  if rgFiltrar.ItemIndex = 7 then
  begin
    gbTamanho.left         := 3;
    btnBuscar.Left         := 171;
    rgTipoForma.Visible    := false;
    gbx_qtde_vigas.Visible := false;
    rgAltura.Visible       := false;

    gbTamanho.Caption      := ' Pesquisar por ';
    gbTamanho.Visible      := true;
    edTamanho.text         := '';
    edTamanho.NumbersOnly  := false;
    edQtde.NumbersOnly     := false;

    btnBuscar.Click;
  end;

  // Mat Prima (Lajes)
  if rgFiltrar.ItemIndex = 8 then
  begin
    gbTamanho.Caption      := ' Pesquisar por ';
    rgTipoForma.Visible    := false;
    rgAltura.Visible       := false;
    gbTamanho.Visible      := true;
    edTamanho.clear;
    edQtde.NumbersOnly     := true;
    gbx_qtde_vigas.Visible := false;
    btnBuscar.Click;
  end;



end;

procedure TfrmPesquisaProdutos.rgTipoFormaClick(Sender: TObject);
begin
  inherited;
  PreparaPesquisa;
end;


end.
