unit ufrmProdutosE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, ufrmTabelaPrecosE, unit_funcoes, System.ImageList, Vcl.ImgList,
  Vcl.Menus ;

type
  TfrmProdutosE = class(TfrmBaseEdicao)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    edDescricao: TDBEdit;
    Label6: TLabel;
    Label29: TLabel;
    edFantasia: TDBEdit;
    edID: TDBText;
    edCadastro: TDBText;
    edAlteracao: TDBText;
    cbAtivo: TDBCheckBox;
    cbEstoqueControlado: TDBCheckBox;
    cbxUnidade: TDBComboBox;
    Label28: TLabel;
    edPeso: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    cbRevenda: TDBCheckBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    pc_precos: TPageControl;
    tbs_precos: TTabSheet;
    tbs_fiscal: TTabSheet;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edClassFis: TDBEdit;
    edSitTrib: TDBEdit;
    edTxICMS: TDBEdit;
    edTxIPI: TDBEdit;
    ds_lista_precos: TDataSource;
    ds_precos_deletados: TDataSource;
    mt_lista_precos: TFDMemTable;
    mt_lista_precosID: TIntegerField;
    mt_lista_precosPRODUTO_ID: TIntegerField;
    mt_lista_precosFORMA_PAGTO_ID: TIntegerField;
    mt_lista_precosFORMA_PAGTO_DESCRICAO: TStringField;
    mt_lista_precosPRECO_VENDEDOR: TFloatField;
    mt_lista_precosPRECO_VENDA: TFloatField;
    mt_lista_precosTAXA_PARCELAMENTO: TFloatField;
    mt_lista_precosATIVO: TStringField;
    mt_precos_deletados: TFDMemTable;
    mt_precos_deletadosID: TIntegerField;
    qryID: TIntegerField;
    qryATIVO: TStringField;
    qryDATA_CAD: TDateField;
    qryDATA_ALT: TDateField;
    qryDEPARTAMENTO_ID: TIntegerField;
    qryDESCRICAO: TStringField;
    qryNOME_FANTASIA: TStringField;
    qryUNIDADE: TStringField;
    qryPRECO_CUSTO: TCurrencyField;
    qryPERCA: TCurrencyField;
    qryCUSTO_LIQUIDO: TCurrencyField;
    qryPRECO_VENDEDOR: TCurrencyField;
    qryPRECO_VENDA: TCurrencyField;
    qryESTOQUE_CONTROLADO: TStringField;
    qryTEMPO_REPOSICAO: TSmallintField;
    qryQTDE_MIN: TCurrencyField;
    qryQTDE_MAX: TCurrencyField;
    qryPONTO_PEDIDO: TCurrencyField;
    qryESTOQUE_FISICO: TCurrencyField;
    qryPEDIDO_ABERTO: TCurrencyField;
    qryESTOQUE_DISPONIVEL: TCurrencyField;
    qryPEDIDO_AGUARDANDO: TCurrencyField;
    qryESTOQUE_LIQUIDO: TCurrencyField;
    qryCLASS_FIS: TStringField;
    qrySIT_TRIB: TStringField;
    qryTX_IPI: TCurrencyField;
    qryPESO: TCurrencyField;
    qryTX_ICMS: TCurrencyField;
    qryREVENDA: TStringField;
    qryMATERIA_PRIMA: TStringField;
    qryAGREGADO: TStringField;
    qryLAJE: TStringField;
    qryVIGA: TStringField;
    qryLAJOTA: TStringField;
    qryISOPOR: TStringField;
    qryCONCRETO: TStringField;
    qryBOMBA: TStringField;
    qryVERGALHAO: TStringField;
    qryTRELICA: TStringField;
    qryNEGATIVO_DE_LAJE: TStringField;
    qryREFORCO_DE_VIGA: TStringField;
    tbs_estoques: TTabSheet;
    gbx_estoques: TGroupBox;
    Label14: TLabel;
    Label18: TLabel;
    Label16: TLabel;
    Label15: TLabel;
    Label13: TLabel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    edTempoReposicao: TDBEdit;
    edEstLiquido: TDBEdit;
    edPedAguardando: TDBEdit;
    edEstDisponivel: TDBEdit;
    edPedAberto: TDBEdit;
    edEstFisico: TDBEdit;
    edPontoPedido: TDBEdit;
    edQtdeMax: TDBEdit;
    edQtdeMin: TDBEdit;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    mn_alterar: TMenuItem;
    mn_excluir: TMenuItem;
    gb_formas_pagto: TGroupBox;
    btn_incluir: TSpeedButton;
    dbg_condicoes_pagto: TDBGrid;
    mt_lista_precosPRECO_CUSTO: TFloatField;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ds_lista_precosDataChange(Sender: TObject; Field: TField);
    procedure btn_icluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbg_condicoes_pagtoDblClick(Sender: TObject);
    procedure dbg_condicoes_pagtoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbg_condicoes_pagtoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure mn_alterarClick(Sender: TObject);
    procedure mn_excluirClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
  private
    FOperacao: uTipos.TOperacao;
    FTitulo: string;
    FTabela: string;
    Fp_codigo: integer;
    FDepartamento_id: integer;

    procedure Salvar();
    procedure prc_incluir_alterar(operacao: TOperacao; v_tabela: string);
    procedure prc_atualiza_preco(v_preco_custo, v_preco_vendedor, v_preco_venda: double);
    function fnc_buscar_novo_id: integer;

  protected
    procedure Componentes();
    procedure Inicializar();

    procedure LerDados();
    function valida: boolean;

  public
    property p_codigo :integer read Fp_codigo write Fp_codigo;
    property Operacao :uTipos.TOperacao read FOperacao write FOperacao;
    property Tabela   :string read FTabela write FTabela;
    property Titulo   :string read FTitulo write FTitulo;
    property departamento_id: integer read FDepartamento_id write FDepartamento_id;
  end;

  procedure Incluir(departamento_id: integer);
  procedure Alterar(ACodigo :integer);
  procedure Excluir(ACodigo :integer);

implementation

uses uBiblioteca, udmConn;

procedure Incluir(departamento_id: integer);
var
  loForm : TfrmProdutosE;
begin
  loForm := TfrmProdutosE.Create(Application);
  try
    loForm.Operacao := uTipos.opIncluir;
    loForm.p_codigo := 0;
    loForm.departamento_id := departamento_id;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Alterar(ACodigo :integer);
var
  loForm : TfrmProdutosE;
begin
  loForm := TfrmProdutosE.Create(Application);
  try
    loForm.Operacao := uTipos.opAlterar;
    loForm.p_codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Excluir(ACodigo :integer);
var
  loForm : TfrmProdutosE;
begin
  loForm := TfrmProdutosE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.p_codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

{$R *.dfm}

procedure TfrmProdutosE.btnOkClick(Sender: TObject);
begin
  inherited;
  Salvar();

end;

procedure TfrmProdutosE.btn_excluirClick(Sender: TObject);
begin
  inherited;
  if mt_lista_precosID.AsInteger > 0 then
  begin
    mt_precos_deletados.Insert;
    mt_precos_deletadosID.AsInteger := mt_lista_precosID.AsInteger;
    mt_precos_deletados.post;
  end;

  mt_lista_precos.Delete;

end;

procedure TfrmProdutosE.btn_icluirClick(Sender: TObject);
begin
  inherited;

  if frmTabelaPrecosE = nil then
  begin
    try
      frmTabelaPrecosE := TfrmTabelaPrecosE.Create(self);
      frmTabelaPrecosE.p_codigo := qry.FieldByName('ID').AsInteger;
      frmTabelaPrecosE.p_descricaoProduto := qry.FieldByName('DESCRICAO').AsString;
      frmTabelaPrecosE.p_operacao := uTipos.OpIncluir;

      frmTabelaPrecosE.ShowModal;

      // verificar duplicidade
      mt_lista_precos.First;
      if mt_lista_precos.Locate( 'FORMA_PAGTO_ID',frmTabelaPrecosE.p_formaPagtoId,[] ) then
      begin
        ShowMessage(' forma de pagamento : "' + frmTabelaPrecosE.p_descricaoFormaPagto + '" já foi selecionada para este produto');
        exit;
      end;

      if frmTabelaPrecosE.p_confirmado = true then
      begin

        mt_lista_precos.Insert;
        mt_lista_precosID.AsInteger := -1;
        mt_lista_precosPRODUTO_ID.AsInteger := qry.FieldByName('ID').AsInteger;
        mt_lista_precosFORMA_PAGTO_ID.AsInteger := frmTabelaPrecosE.p_formaPagtoId;
        mt_lista_precosFORMA_PAGTO_DESCRICAO.AsString := frmTabelaPrecosE.p_descricaoFormaPagto;
        mt_lista_precosPRECO_VENDEDOR.AsFloat := frmTabelaPrecosE.p_precoVendedor;
        mt_lista_precosPRECO_VENDA.AsFloat := frmTabelaPrecosE.p_precoVenda;
        mt_lista_precosTAXA_PARCELAMENTO.AsFloat := frmTabelaPrecosE.p_taxa;
        mt_lista_precosATIVO.AsString := frmTabelaPrecosE.p_ativo;
        mt_lista_precos.Post;

        // atualiza preços a vista
        if frmTabelaPrecosE.p_intervalo = 0 then
          prc_atualiza_preco( frmTabelaPrecosE.p_precoCusto,
                              frmTabelaPrecosE.p_precoVendedor,
                              frmTabelaPrecosE.p_precoVenda) ;
      end;

    finally
       FreeAndNil(frmTabelaPrecosE);
    end;

  end;

end;



procedure TfrmProdutosE.Componentes;
begin
  qry.Open('select * from '+ self.Tabela +' where ID = :ID');
  dbg_condicoes_pagto.Columns[1].Visible := false; // produto_id
  dbg_condicoes_pagto.Columns[2].Visible := false; // forma_pagto_id
  dbg_condicoes_pagto.Columns[7].Visible := false; // taxa_parcelamento

end;

procedure TfrmProdutosE.dbg_condicoes_pagtoDblClick(Sender: TObject);
begin
  inherited;
  if frmTabelaPrecosE = nil then
  begin
    try
      frmTabelaPrecosE := TfrmTabelaPrecosE.Create(self);
      frmtabelaPrecosE.p_formaPagtoId := mt_lista_precosID.AsInteger;
      frmTabelaPrecosE.p_operacao := opAlterar;
      frmtabelaPrecosE.ShowModal;

      if frmTabelaPrecosE.p_confirmado = true then
      begin
        mt_lista_precos.Edit;
        mt_lista_precosPRECO_VENDEDOR.AsFloat := frmTabelaPrecosE.p_precoVendedor;
        mt_lista_precosPRECO_VENDA.AsFloat := frmTabelaPrecosE.p_precoVenda;
        mt_lista_precosTAXA_PARCELAMENTO.AsFloat := frmTabelaPrecosE.p_taxa;
        mt_lista_precosATIVO.AsString := frmTabelaPrecosE.p_ativo;
        mt_lista_precos.Post;
        // atualiza preços a vista
        if frmTabelaPrecosE.p_intervalo = 0 then
          prc_atualiza_preco(frmTabelaPrecosE.p_precoCusto,
                             frmTabelaPrecosE.p_precoVendedor,
                             frmTabelaPrecosE.p_precoVenda) ;

      end;

    finally
       FreeAndNil(frmTabelaPrecosE);
    end;

  end;

end;

procedure TfrmProdutosE.dbg_condicoes_pagtoDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
var
  X, Y: Integer;
begin
  if Column.Title.Caption = 'Ações' then
  begin
    dbg_condicoes_pagto.Canvas.FillRect(Rect);

    X := Rect.Left + (Rect.Width - ImageList1.Width) div 2;
    Y := Rect.Top + (Rect.Height - ImageList1.Height) div 2;

    ImageList1.Draw(dbg_condicoes_pagto.Canvas, X, Y, 0); // índice do ícone
  end
  else
    dbg_condicoes_pagto.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmProdutosE.dbg_condicoes_pagtoMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  GC: TGridCoord;
begin
  if Button <> mbLeft then Exit;

  GC := dbg_condicoes_pagto.MouseCoord(X, Y);

  // Linha inválida ou cabeçalho
  if (GC.X < 1) or (GC.Y < 1) then Exit;

  // Verifica se clicou na coluna "Ações"
  if dbg_condicoes_pagto.Columns[GC.X - 1].Title.Caption = 'Ações' then
  begin
    // Posiciona o dataset na linha correta
    dbg_condicoes_pagto.DataSource.DataSet.RecNo := GC.Y;

    PopupMenu1.Popup(Mouse.CursorPos.X, Mouse.CursorPos.Y);
  end;
end;

procedure TfrmProdutosE.prc_atualiza_preco(v_preco_custo, v_preco_vendedor, v_preco_venda: double);
begin

  qry.FieldByName('PRECO_CUSTO').AsFloat := v_preco_custo;
  qry.FieldByName('PRECO_VENDEDOR').AsFloat := v_preco_vendedor;
  qry.FieldByName('PRECO_VENDA').AsFloat := v_preco_venda;

end;


procedure TfrmProdutosE.ds_lista_precosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  mn_excluir.Enabled := not mt_lista_precos.IsEmpty;
  mn_alterar.Enabled := not mt_lista_precos.IsEmpty;

end;

procedure TfrmProdutosE.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Connection := self.Conexao;
  self.Tabela := 'PRODUTOS';
end;

procedure TfrmProdutosE.FormShow(Sender: TObject);
begin
  inherited;
  Componentes;
  Inicializar;

end;

procedure TfrmProdutosE.Inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin
                       pnTitulo.Caption := 'CADASTRO DE PRODUTOS';
                       lbl_sub_titulo.Caption := 'Incluir novo produto';
                       btnOk.Caption := 'Salvar dados';
                       //
                       qry.Insert;
                       qry.FieldByName('ID').AsInteger := ubiblioteca.AutoIncremento(self.Conexao,self.Tabela);
                       qry.FieldByName('DATA_CAD').AsDateTime := Date;
                       qry.FieldByName('ATIVO').AsString := 'S';
                       qry.FieldByName('ESTOQUE_CONTROLADO').AsString := 'N';
                       qry.FieldByName('PRECO_CUSTO').AsFloat := 0;
                       qry.FieldByName('PRECO_VENDA').AsFloat := 0;
                       qry.FieldByName('ESTOQUE_FISICO').AsFloat := 0;
                       qry.FieldByName('PEDIDO_ABERTO').AsFloat := 0;
                       qry.FieldByName('ESTOQUE_DISPONIVEL').AsFloat := 0;
                       qry.FieldByName('PEDIDO_AGUARDANDO').AsFloat := 0;
                       qry.FieldByName('ESTOQUE_LIQUIDO').AsFloat := 0;
                       //CONTROLE DE ESTOQUE
                       qry.FieldByName('PONTO_PEDIDO').AsFloat := 0;
                       qry.FieldByName('QTDE_MIN').AsFloat := 0;
                       qry.FieldByName('QTDE_MAX').AsFloat := 0;
                       qry.FieldByName('TEMPO_REPOSICAO').AsInteger := 0;
                       //FISCAL
                       qry.FieldByName('CLASS_FIS').AsString := '';
                       qry.FieldByName('SIT_TRIB').AsString := '';
                       qry.FieldByName('TX_ICMS').AsFloat := 0;
                       qry.FieldByName('TX_IPI').AsFloat := 0;

                       qry.FieldByName('DEPARTAMENTO_ID').AsInteger := departamento_id;
                       qry.FieldByName('REVENDA').AsString := 'S';
                       qry.FieldByName('MATERIA_PRIMA').AsString := 'N';// pega pelo checkBox
                       qry.FieldByName('AGREGADO').AsString := 'N';// pega pelo checkBox
                       qry.FieldByName('LAJE').AsString := 'N';
                       qry.FieldByName('VIGA').AsString := 'N';
                       qry.FieldByName('LAJOTA').AsString := 'N';
                       qry.FieldByName('ISOPOR').AsString := 'N';
                       qry.FieldByName('CONCRETO').AsString := 'N';
                       qry.FieldByName('BOMBA').AsString := 'N';
                       qry.FieldByName('VERGALHAO').AsString := 'N';
                       qry.FieldByName('TRELICA').AsString := 'N';

                     end;
  uTipos.opAlterar: begin
                      self.LerDados;
                      pnTitulo.Caption := 'CADASTRO DE PRODUTOS';
                      lbl_sub_titulo.Caption := 'Alterar dados do produto';
                      btnOk.Caption := 'Salvar Alterações';
                      //
                      qry.Edit;
                      qry.FieldByName('DATA_ALT').AsDateTime := Date;
                      btnOk.SetFocus;
                    end;
  uTipos.opExcluir: begin
                      self.LerDados;
                       pnTitulo.Caption := 'CADASTRO DE PRODUTOS';
                       lbl_sub_titulo.Caption := 'Excluir';
                      pnDados.Enabled   := false;
                      btnOk.Caption := 'Excluir';
                      qry.Edit;
                      qry.FieldByName('ATIVO').AsString := 'N';
                      btnFechar.SetFocus;
                    end;
  else
    begin
      pnDados.Enabled   := false;
      if btnFechar.CanFocus then btnFechar.SetFocus;
    end;
  end;

end;

procedure TfrmProdutosE.mn_alterarClick(Sender: TObject);
begin
  if frmTabelaPrecosE = nil then
  begin
    try
      frmTabelaPrecosE := TfrmTabelaPrecosE.Create(self);
      frmtabelaPrecosE.p_formaPagtoId := mt_lista_precosID.AsInteger;
      frmTabelaPrecosE.p_operacao := opAlterar;
      frmtabelaPrecosE.ShowModal;

      if frmTabelaPrecosE.p_confirmado = true then
      begin

        mt_lista_precos.Edit;
        mt_lista_precosPRECO_CUSTO.AsFloat := frmTabelaPrecosE.p_precoCusto;
        mt_lista_precosPRECO_VENDEDOR.AsFloat := frmTabelaPrecosE.p_precoVendedor;
        mt_lista_precosPRECO_VENDA.AsFloat := frmTabelaPrecosE.p_precoVenda;
        mt_lista_precosTAXA_PARCELAMENTO.AsFloat := frmTabelaPrecosE.p_taxa;
        mt_lista_precosATIVO.AsString := frmTabelaPrecosE.p_ativo;
        mt_lista_precos.Post;

        // atualiza preços a vista
        if frmTabelaPrecosE.p_intervalo = 0 then
          prc_atualiza_preco(frmTabelaPrecosE.p_precoCusto,
                             frmTabelaPrecosE.p_precoVendedor,
                             frmTabelaPrecosE.p_precoVenda) ;
      end;
    finally
       FreeAndNil(frmTabelaPrecosE);
    end;
  end;
end;

procedure TfrmProdutosE.mn_excluirClick(Sender: TObject);
begin
  if mt_lista_precosID.AsInteger > 0 then
  begin
    mt_precos_deletados.Insert;
    mt_precos_deletadosID.AsInteger := mt_lista_precosID.AsInteger;
    mt_precos_deletados.post;
  end;

  mt_lista_precos.Delete;
end;

procedure TfrmProdutosE.LerDados;
var
  loQry : TFDQuery;
begin
  uBiblioteca.FilterCds(qry, uTipos.fsInteger, inttostr(self.p_codigo));

  try
    loqry := TFDQuery.Create(self) ;
    loqry.Connection := conexao;

    loqry.SQL.Add('select ');
    loqry.SQL.Add('  P.ID, P.PRODUTO_ID, P.FORMA_PAGTO_ID, F.DESCRICAO AS FORMA_PAGTO_DESCRICAO,  ');
    loqry.SQL.Add('  P.PRECO_CUSTO, P.PRECO_VENDEDOR, P.PRECO_VENDA, P.TAXA_PARCELAMENTO, P.ATIVO ');
    loqry.SQL.Add('from ');
    loqry.SQL.Add('  PRODUTOS_FORMA_PAGAMENTO P, FORMAS_PAGTO F ');
    loqry.SQL.Add('where ' );
    loqry.SQL.Add('  P.forma_pagto_id = F.id AND PRODUTO_ID =:PRODUTO_ID ') ;
    loQry.Params.ParamByName('PRODUTO_ID').AsInteger := QRY.FieldByName('ID').AsInteger;
    loQry.Open;

    mt_lista_precos.CopyDataSet(loQry) ;

   // pnDados.Enabled := false;

  finally
    FreeAndNil(loqry);
  end;

end;

function  TfrmProdutosE.fnc_buscar_novo_id: integer;
var
  qry : TFDQuery;
begin
  try
    qry := TFDQuery.Create(nil);
    qry.Connection := conexao;
    qry.SQL.Clear;
    qry.SQL.Add('select max(id) as novo_id from produtos');
    qry.Active:= true;
    result := qry.FieldByName('novo_id').AsInteger;
  finally
    freeandnil(qry);
  end;

end;

procedure TfrmProdutosE.Salvar;
begin

    if not Valida then Exit;

    if operacao = opexcluir then
      if Application.MessageBox('Deseja excluir este registro?','Atenção',MB_OKCANCEL) = mrCancel then exit;

    if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
    //***
    try
      qry.Post;
      if operacao = OpIncluir then p_codigo := fnc_buscar_novo_id;

      {exclui formas de pagamento se houver}
      if not mt_precos_deletados.IsEmpty then
      begin
        mt_precos_deletados.First;
        while not mt_precos_deletados.eof do
        begin
          mt_precos_deletados.First;
          prc_incluir_alterar(opexcluir, 'PRODUTOS_FORMA_PAGAMENTO');
          mt_precos_deletados.Delete;
        end;
      end;

      {inclui ou altera dados da grid}
      mt_lista_precos.First;
      while not mt_lista_precos.eof do
      begin
        if mt_lista_precosID.AsInteger < 0 then
          prc_incluir_alterar(opincluir, 'PRODUTOS_FORMA_PAGAMENTO');
        if mt_lista_precosID.AsInteger > 0 then
          prc_incluir_alterar(opAlterar, 'PRODUTOS_FORMA_PAGAMENTO');


        mt_lista_precos.Next;
      end;

      if Self.Conexao.InTransaction then Self.Conexao.Commit;
      ModalResult := mrOk;
    except
      {se der algum erro durante o processo de gravação desfaz tudo!}
      on E : Exception do
         begin
           CriarMensagem('AVISO','NÃO FOI POSSIVEL SALVAR O PRODUTO.' + slinebreak + slinebreak + E.Message);
           if Conexao.InTransaction then
             Conexao.Rollback;;
           //***
           Raise;
         end;
    end;

end;

procedure TfrmProdutosE.btn_incluirClick(Sender: TObject);
begin
    try
      if frmTabelaPrecosE = nil then
        frmTabelaPrecosE := TfrmTabelaPrecosE.Create(self);

      frmTabelaPrecosE.p_codigo := qry.FieldByName('ID').AsInteger;
      frmTabelaPrecosE.p_descricaoProduto := qry.FieldByName('DESCRICAO').AsString;
      frmTabelaPrecosE.p_operacao := uTipos.OpIncluir;

      frmTabelaPrecosE.ShowModal;

      // verificar duplicidade
      mt_lista_precos.First;
      if mt_lista_precos.Locate( 'FORMA_PAGTO_ID',frmTabelaPrecosE.p_formaPagtoId,[] ) then
      begin
        ShowMessage(' forma de pagamento : "' + frmTabelaPrecosE.p_descricaoFormaPagto + '" já foi selecionada para este produto');
        exit;
      end;

      if frmTabelaPrecosE.p_confirmado = true then
      begin

        mt_lista_precos.Insert;
        mt_lista_precosID.AsInteger := -1;
        mt_lista_precosPRODUTO_ID.AsInteger := qry.FieldByName('ID').AsInteger;
        mt_lista_precosFORMA_PAGTO_ID.AsInteger := frmTabelaPrecosE.p_formaPagtoId;
        mt_lista_precosFORMA_PAGTO_DESCRICAO.AsString := frmTabelaPrecosE.p_descricaoFormaPagto;
        mt_lista_precosPRECO_CUSTO.AsFloat := frmTabelaPrecosE.p_precoCusto;
        mt_lista_precosPRECO_VENDEDOR.AsFloat := frmTabelaPrecosE.p_precoVendedor;
        mt_lista_precosPRECO_VENDA.AsFloat := frmTabelaPrecosE.p_precoVenda;
        mt_lista_precosTAXA_PARCELAMENTO.AsFloat := frmTabelaPrecosE.p_taxa;
        mt_lista_precosATIVO.AsString := frmTabelaPrecosE.p_ativo;
        mt_lista_precos.Post;

        // atualiza preços a vista
        if frmTabelaPrecosE.p_intervalo = 0 then
          prc_atualiza_preco(frmTabelaPrecosE.p_precoCusto,
                             frmTabelaPrecosE.p_precoVendedor,
                             frmTabelaPrecosE.p_precoVenda) ;
      end;

    finally
       FreeAndNil(frmTabelaPrecosE);
    end;

end;

function TfrmProdutosE.valida: boolean;
begin
  result := false;

  if qry.FieldByName('DESCRICAO').AsString = '' then
  begin
    ShowMessage('Informe uma descrição');
    edDescricao.SetFocus;
    exit;
  end;

  if qry.FieldByName('UNIDADE').AsString = '' then
  begin
    ShowMessage('Informe uma unidade de medida');
    cbxUnidade.SetFocus;
    exit;
  end;

  if qry.FieldByName('NOME_FANTASIA').AsString = '' then
  begin
    ShowMessage('Informe um nome de fantasia');
    edFantasia.SetFocus;
    exit;
  end;

  if ((qry.FieldByName('CUSTO_LIQUIDO').AsFloat <= 0) or
  (qry.FieldByName('CUSTO_LIQUIDO').AsFloat < qry.FieldByName('PRECO_CUSTO').AsFloat))
   then
  begin
    qry.FieldByName('PRECO_CUSTO').AsFloat := qry.FieldByName('CUSTO_LIQUIDO').AsFloat;
  end;

  if mt_lista_precos.IsEmpty then
  begin
    ShowMessage('cadastre uma forma de pagamento');
    btn_incluir.Click;
    exit;
  end;

  result := true;
end;

procedure TfrmProdutosE.prc_incluir_alterar(operacao: TOperacao; v_tabela: string);
var
 loQry : TFDQuery;
begin
  loQry := TFDQuery.Create(self);
  loQry.Connection := conexao;
  try

    loQry.sql.clear;
    if operacao = opExcluir then
    begin
      {não deleta do banco, marca ATIVO = N}  // v_tabela = PRODUTOS_FORMA_PAGAMENTO
      loQry.SQL.Add('update ' + v_tabela + ' set ATIVO = ''N'' where id =:id');
      loQry.ParamByName('id').AsInteger := mt_precos_deletadosID.AsInteger;
      loQry.ExecSQL;
      exit;
    end;


    if operacao = OpIncluir then
    begin
      loQry.SQL.Add('insert into ' + v_tabela  );
      loQry.SQL.Add('(                    ');
      loQry.SQL.Add('  ID,                ');
      loQry.SQL.Add('  PRODUTO_ID,        ');
      loQry.SQL.Add('  FORMA_PAGTO_ID,    ');
      loQry.SQL.Add('  PRECO_CUSTO,       ');
      loQry.SQL.Add('  PRECO_VENDEDOR,    ');
      loQry.SQL.Add('  PRECO_VENDA,       ');
      loQry.SQL.Add('  TAXA_PARCELAMENTO, ');
      loQry.SQL.Add('  ATIVO              ');
      loQry.SQL.Add(')                    ');
      loQry.SQL.Add('VALUES               ');
      loQry.SQL.Add('(                    ');
      loQry.SQL.Add('  :ID,               ');
      loQry.SQL.Add('  :PRODUTO_ID,       ');
      loQry.SQL.Add('  :FORMA_PAGTO_ID,   ');
      loQry.SQL.Add('  :PRECO_CUSTO,      ');
      loQry.SQL.Add('  :PRECO_VENDEDOR,   ');
      loQry.SQL.Add('  :PRECO_VENDA,      ');
      loQry.SQL.Add('  :TAXA_PARCELAMENTO,');
      loQry.SQL.Add('  :ATIVO             ');
      loQry.SQL.Add(')                    ');
      loQry.ParamByName('ID').AsInteger := uBiblioteca.AutoIncremento(conexao, v_tabela);
      loQry.ParamByName('PRODUTO_ID').AsInteger := p_codigo;
      loQry.ParamByName('FORMA_PAGTO_ID').AsInteger := mt_lista_precosFORMA_PAGTO_ID.AsInteger;
    end
    else
    begin
      loQry.SQL.Add('UPDATE                                   ');
      loQry.SQL.Add(v_tabela + ' ');
      loQry.SQL.Add('SET                                      ');
      loQry.SQL.Add('  PRECO_CUSTO       = :PRECO_CUSTO,      ');
      loQry.SQL.Add('  PRECO_VENDEDOR    = :PRECO_VENDEDOR,   ');
      loQry.SQL.Add('  PRECO_VENDA       = :PRECO_VENDA,      ');
      loQry.SQL.Add('  TAXA_PARCELAMENTO = :TAXA_PARCELAMENTO,');
      loQry.SQL.Add('  ATIVO             = :ATIVO             ');
      loQry.SQL.Add('WHERE                                    ');
      loQry.SQL.Add('  ID = :ID                               ');
      //
      loQry.ParamByName('ID').AsInteger := mt_lista_precosID.AsInteger;

    end;

    loQry.ParamByName('PRECO_CUSTO').AsFloat       := mt_lista_precosPRECO_CUSTO.AsFloat;
    loQry.ParamByName('PRECO_VENDEDOR').AsFloat    := mt_lista_precosPRECO_VENDEDOR.AsFloat;
    loQry.ParamByName('PRECO_VENDA').AsFloat       := mt_lista_precosPRECO_VENDA.AsFloat;
    loQry.ParamByName('TAXA_PARCELAMENTO').AsFloat := mt_lista_precosTAXA_PARCELAMENTO.AsFloat;
    loQry.ParamByName('ATIVO').AsString            := mt_lista_precosATIVO.AsString;
    //ShowMessage(loQry.SQL.Text);
    loQry.ExecSQL;

  finally
    FreeAndNil(loQry)
  end;
end;


end.
