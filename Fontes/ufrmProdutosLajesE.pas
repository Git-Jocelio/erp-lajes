unit ufrmProdutosLajesE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, Vcl.DBCtrls, Vcl.Mask, Vcl.ComCtrls, Vcl.Grids,
  Vcl.DBGrids, ufrmTabelaPrecosE, unit_funcoes, Vcl.Menus, System.ImageList,
  Vcl.ImgList;

type
  TfrmProdutosLajesE = class(TfrmBaseEdicao)
    dsLajes: TDataSource;
    qryLajes: TFDQuery;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label29: TLabel;
    edID: TDBText;
    edCadastro: TDBText;
    edAlteracao: TDBText;
    edDescricao: TDBEdit;
    edFantasia: TDBEdit;
    cbAtivo: TDBCheckBox;
    cbEstoqueControlado: TDBCheckBox;
    cbxUnidade: TDBComboBox;
    GroupBox1: TGroupBox;
    Label12: TLabel;
    Label10: TLabel;
    rgEnchimento: TRadioGroup;
    edCarga: TDBEdit;
    rgForma: TDBRadioGroup;
    edAltura: TDBComboBox;
    Label28: TLabel;
    edPeso: TDBEdit;
    ds_lista_precos: TDataSource;
    mt_lista_precos: TFDMemTable;
    mt_lista_precosID: TIntegerField;
    mt_lista_precosPRODUTO_ID: TIntegerField;
    mt_lista_precosFORMA_PAGTO_ID: TIntegerField;
    mt_lista_precosPRECO_VENDEDOR: TFloatField;
    mt_lista_precosPRECO_VENDA: TFloatField;
    mt_lista_precosFORMA_PAGTO_DESCRICAO: TStringField;
    mt_lista_precosATIVO: TStringField;
    mt_lista_precosTAXA_PARCELAMENTO: TFloatField;
    ds_precos_deletados: TDataSource;
    mt_precos_deletados: TFDMemTable;
    mt_precos_deletadosID: TIntegerField;
    pc_precos: TPageControl;
    tbs_precos: TTabSheet;
    Label7: TLabel;
    edCusto: TDBEdit;
    gb_formas_pagto: TGroupBox;
    dbg_condicoes_pagto: TDBGrid;
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
    Label13: TLabel;
    edt_custo_liquido: TDBEdit;
    edt_mao_obra: TEdit;
    Label4: TLabel;
    PopupMenu1: TPopupMenu;
    mn_alterar: TMenuItem;
    mn_excluir: TMenuItem;
    btn_incluir: TSpeedButton;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure rgEnchimentoClick(Sender: TObject);
    procedure edCustoEnter(Sender: TObject);
    procedure rgFormaClick(Sender: TObject);
    procedure ds_lista_precosDataChange(Sender: TObject; Field: TField);
    procedure mn_alterarClick(Sender: TObject);
    procedure mn_excluirClick(Sender: TObject);
    procedure dbg_condicoes_pagtoDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbg_condicoes_pagtoMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btn_incluirClick(Sender: TObject);
  private
    Fp_codigo: integer;
    Fp_operacao: uTipos.TOperacao;
    Fp_titulo: string;
    Fp_tabela: string;
    FDepartamento_id: integer;

    procedure salvar;
    function calcularValorDeCusto(largura_forma, altura: integer): double;
    procedure prc_incluir_alterar(operacao: TOperacao; v_tabela: string);
    procedure prc_custo_mao_de_obra(v_preco_vendedor, v_custo_materia_prima: double);
    function fnc_buscar_novo_id: integer;
    procedure prc_atualiza_preco(v_preco_vendedor, v_preco_venda: double);
 protected

    procedure Componentes();
    procedure Inicializar();

    procedure LerDados();
    function valida: boolean;

  public
    property p_codigo: integer read Fp_codigo write Fp_codigo;
    property p_operacao :uTipos.TOperacao read Fp_operacao write Fp_operacao;
    property p_tabela   :string read Fp_tabela write Fp_tabela;
    property p_titulo   :string read Fp_titulo write Fp_titulo;

    property departamento_id: integer read FDepartamento_id write FDepartamento_id;
  end;

  procedure Incluir(departamento_id: integer);
  procedure Alterar(ACodigo: integer);
  procedure Excluir(ACodigo: integer);

implementation

uses uBiblioteca, udmConn;

procedure Incluir(departamento_id: integer);
var
  loForm: TfrmProdutosLajesE;
begin
  loForm:= TfrmProdutosLajesE.Create(Application);
  try
    loform.p_operacao := uTipos.OpIncluir;
    loForm.p_codigo := 0;
    loForm.departamento_id := departamento_id;
    loForm.ShowModal
  finally
    FreeAndNil(loForm);
  end;

end;

procedure Alterar(ACodigo: integer);
var
  loForm: TfrmProdutosLajesE;
begin
  loForm:= TfrmProdutosLajesE.Create(Application);
  try
    loform.p_operacao := uTipos.opAlterar;
    loForm.p_codigo := ACodigo;
    loForm.ShowModal
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Excluir(ACodigo: integer);
var
  loForm: TfrmProdutosLajesE;
begin
  loForm:= TfrmProdutosLajesE.Create(Application);
  try
    loform.p_operacao := uTipos.opExcluir;
    loForm.p_codigo := ACodigo;
    loForm.ShowModal
  finally
    FreeAndNil(loForm);
  end;

end;

{$R *.dfm}




procedure TfrmProdutosLajesE.btnOkClick(Sender: TObject);
begin
  inherited;
  Salvar();

end;

procedure TfrmProdutosLajesE.prc_custo_mao_de_obra(v_preco_vendedor, v_custo_materia_prima: double);
begin

  qryLajes.FieldByName('CUSTO_MAO_DE_OBRA').AsFloat := ( v_preco_vendedor - v_custo_materia_prima);
  qry.FieldByName('PRECO_VENDEDOR').AsFloat         := ( v_preco_vendedor );
  qry.FieldByName('PRECO_VENDA').AsFloat            := ( frmTabelaPrecosE.p_precoVenda );

end;

procedure TfrmProdutosLajesE.btn_incluirClick(Sender: TObject);
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
        // inserir na grid
        //ShowMessage(frmTabelaPrecosE.DescricaoFormaPAgto) ;

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
          prc_atualiza_preco(frmTabelaPrecosE.p_precoVendedor,frmTabelaPrecosE.p_precoVenda) ;
      end;

    finally
       FreeAndNil(frmTabelaPrecosE);
    end;
end;

procedure TfrmProdutosLajesE.prc_atualiza_preco(v_preco_vendedor, v_preco_venda: double);
begin

  qry.FieldByName('PRECO_VENDEDOR').AsFloat := ( v_preco_vendedor );
  qry.FieldByName('PRECO_VENDA').AsFloat := ( v_preco_venda );

end;


function TfrmProdutosLajesE.calcularValorDeCusto(largura_forma, altura: integer): double;
var
  loQry :TFDQuery;
  custoMetroLinear, custoLajota, custoEps: double;
begin
  result := 0;
  //custoMetroLinear := 0;
  rgEnchimento.Enabled := true;

  if edAltura.Text = '' then
  begin
    ShowMessage('Selecione a ALTURA da laje');
    edAltura.SetFocus;
    exit;
  end;

  if rgForma.ItemIndex = -1 then
  begin
    ShowMessage('Selecione o tipo de FORMA');
    rgForma.SetFocus;
    exit;
  end;

  if rgForma.ItemIndex = 1 then // painel
  begin
    rgEnchimento.ItemIndex := -1;
    rgEnchimento.Enabled := false;
  end;


  if rgForma.ItemIndex = 0 then
  if rgEnchimento.ItemIndex = -1 then
  begin
    ShowMessage('Selecione o tipo de ENCHIMENTO');
    rgEnchimento.SetFocus;
    exit;
  end;

  loQry := TFDQuery.Create(nil);
  try
    {pega o custo de um metro linear de viga}
    loqry.Close;
    loqry.sql.Clear;
    loqry.Connection := self.Conexao;
    loqry.sql.text := 'select P.* ' +
                      'from PRODUTOS P, PRODUTOS_VIGAS V ' +
                      'where P.ID = V.PRODUTO_ID and     ' +
                           ' V.FORMA_MEDIDA =:FORMA_MEDIDA and       ' +
                           ' V.TRELICA_ALTURA =:ALTURA and       ' +
                           ' V.COMPRIMENTO = 1000        ' ;
    loQry.ParamByName('FORMA_MEDIDA').AsInteger := largura_forma;
    loQry.ParamByName('ALTURA').AsInteger       := altura;
    loQry.Open();

    if not loqry.IsEmpty then
      custoMetroLinear := loQry.FieldByName('PRECO_CUSTO').AsFloat
    else
    begin
      ShowMessage('Vigas "' + edAltura.Text + '" não foram cadastradas no sistema. Cadastre as vigas e tente novamnete.');
      exit;
    end;

    if rgForma.ItemIndex = 0 then
    begin

      {pega o custo da lajota}
      loqry.Close;
      loqry.sql.Clear;
      loqry.sql.text := 'select P.* ' +
                        'from PRODUTOS P, PRODUTOS_LAJOTAS L ' +
                        'where P.ID = L.PRODUTO_ID and       ' +
                             ' L.ALTURA =:ALTURA             ' ;
      loQry.ParamByName('ALTURA').AsInteger := altura;
      loQry.Open();

      if not loqry.IsEmpty then
        custoLajota := loQry.FieldByName('PRECO_CUSTO').AsFloat
      else
      begin
        ShowMessage('Lajota "' + edAltura.Text + '" não foram cadastradas no sistema. Cadastre as vigas e tente novamnete.');
        exit;
      end;

      {pega o custo do Eps}
      loqry.Close;
      loqry.sql.Clear;
      loqry.sql.text := 'select P.* ' +
                        'from PRODUTOS P, PRODUTOS_EPS E ' +
                        'where P.ID = E.PRODUTO_ID and   ' +
                             ' E.ALTURA =:ALTURA         ' ;
      loQry.ParamByName('ALTURA').AsInteger := altura;
      loQry.Open();

      if not loqry.IsEmpty then
        custoEps := loQry.FieldByName('PRECO_CUSTO').AsFloat
      else
      begin
        ShowMessage('EPS "' + edAltura.Text + '" não foram cadastradas no sistema. Cadastre o EPS e tente novamente ');
        exit;
      end;

     {custo do m2 da laje com lajota}
      if rgEnchimento.ItemIndex = 0 then
        result := (custoMetroLinear * 2.40 ) + (custoLajota * 12 );

     {custo do m2 da laje com isopor}
      if rgEnchimento.ItemIndex = 1 then
        result := (custoMetroLinear * 2.40 ) + (custoEps * 2.40 );
    end
    else
      {painel}
      result := (custoMetroLinear * 4 );

  finally
    loqry.Close;
    freeandnil(loQry);
  end;


end;

procedure TfrmProdutosLajesE.Componentes;
begin
  qry.Open('select * from '+ self.p_tabela +' where ID = :ID');
  qryLajes.Open('select * from PRODUTOS_LAJES where PRODUTO_ID =:ID');

  dbg_condicoes_pagto.Columns[0].Visible := false;
  dbg_condicoes_pagto.Columns[1].Visible := false;
  dbg_condicoes_pagto.Columns[2].Visible := false;
end;

procedure TfrmProdutosLajesE.dbg_condicoes_pagtoDrawColumnCell(Sender: TObject;
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

procedure TfrmProdutosLajesE.dbg_condicoes_pagtoMouseUp(Sender: TObject;
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

procedure TfrmProdutosLajesE.ds_lista_precosDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  mn_alterar.Enabled := not mt_lista_precos.IsEmpty;
  mn_excluir.Enabled := not mt_lista_precos.IsEmpty;
end;

procedure TfrmProdutosLajesE.edCustoEnter(Sender: TObject);
begin
  inherited;
  {forma 130 mm}
  if rgEnchimento.ItemIndex = 0  then
    qry.FieldByName('PRECO_CUSTO').AsFloat :=
      calcularValorDeCusto(130, strtoint(edAltura.Text))
  else if rgEnchimento.ItemIndex = 1  then
  {forma 250 mm}
    qry.FieldByName('PRECO_CUSTO').AsFloat :=
      calcularValorDeCusto(250, strtoint(edAltura.Text));


end;

procedure TfrmProdutosLajesE.FormCreate(Sender: TObject);
begin
  inherited;
  qry.Connection := self.Conexao;
  self.p_tabela := 'PRODUTOS';
  qryLajes.Connection := self.Conexao;

end;

procedure TfrmProdutosLajesE.FormShow(Sender: TObject);
begin
  inherited;
  Componentes;
  Inicializar;

end;

procedure TfrmProdutosLajesE.Inicializar;
begin
  case self.p_operacao of
  uTipos.opIncluir: begin
                       pnTitulo.Caption := 'Cadastro de Lajes [Inclusão]';
                       lbl_sub_titulo.Caption := 'formulário de cadastro de novas lajes';
                       btnOk     .Caption := 'Salvar Dados';
                       // insert em produtos
                       qry.Insert;
                       p_codigo := ubiblioteca.AutoIncremento(self.Conexao,self.p_tabela);
                       qry.FieldByName('ID').AsInteger := p_codigo;
                       qry.FieldByName('DATA_CAD').AsDateTime := Date;
                       qry.FieldByName('ATIVO').AsString := 'S';
                       qry.FieldByName('UNIDADE').AsString := 'M2';
                       qry.FieldByName('ESTOQUE_CONTROLADO').AsString := 'N';
                       qry.FieldByName('PRECO_CUSTO').AsFloat := 0;
                       qry.FieldByName('PRECO_VENDA').AsFloat := 0;
                       //ESTOQUE
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
                       // identifiação do produto
                       qry.FieldByName('DEPARTAMENTO_ID').AsInteger := departamento_id;
                       qry.FieldByName('REVENDA').AsString := 'N';
                       qry.FieldByName('MATERIA_PRIMA').AsString := 'N';
                       qry.FieldByName('AGREGADO').AsString := 'N';
                       qry.FieldByName('LAJE').AsString := 'S';// LAJE
                       qry.FieldByName('VIGA').AsString := 'N';
                       qry.FieldByName('LAJOTA').AsString := 'N';
                       qry.FieldByName('ISOPOR').AsString := 'N';
                       qry.FieldByName('CONCRETO').AsString := 'N';
                       qry.FieldByName('BOMBA').AsString := 'N';
                       qry.FieldByName('VERGALHAO').AsString := 'N';
                       qry.FieldByName('TRELICA').AsString := 'N';
                       // insert em lajes
                       qryLajes.Insert;
                       qryLajes.FieldByName('ID').AsInteger := ubiblioteca.AutoIncremento(self.Conexao,'PRODUTOS_LAJES');
                       qryLajes.FieldByName('PRODUTO_ID').AsInteger := qry.FieldByName('ID').AsInteger;
                       qryLajes.FieldByName('LAJOTA').AsString := 'N';
                       qryLajes.FieldByName('ISOPOR').AsString := 'N';
                       qryLajes.FieldByName('MISTA').AsString := 'N';

                     end;
  uTipos.opAlterar: begin
                      self.LerDados;
                      pnTitulo.Caption := 'Cadastro de Lajes [Alteração]';
                      lbl_sub_titulo.Caption := 'alterar dados de uma laje já cadastrada';
                      btnOk.Caption := 'Salvar Alterações';
                      //produto
                      qry.Edit;
                      qry.FieldByName('DATA_ALT').AsDateTime := Date;
                      //trelica
                      qryLajes.Edit;

                      // Configura rg enchimento
                      if qryLajes.FieldByName('LAJOTA').AsString = 'S' then
                        rgEnchimento.ItemIndex :=0
                      else
                      if qryLajes.FieldByName('ISOPOR').AsString = 'S' then
                        rgEnchimento.ItemIndex :=1
                      else
                        rgEnchimento.ItemIndex :=2;


                      btnOk.SetFocus;
                    end;
  uTipos.opExcluir: begin
                      self.LerDados;
                      pnTitulo.Caption        := 'Cadastro de Lajes [Exclusão]';
                      lbl_sub_titulo.Caption := 'Inativar uma laje já cadastrada';
                      pnDados.Enabled   := false;
                      btnOk.Caption := 'Inativar';
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

procedure TfrmProdutosLajesE.LerDados;
var
  loQry : TFDQuery;
begin
  uBiblioteca.FilterCds(qry, uTipos.fsInteger, inttostr(self.p_codigo));
  uBiblioteca.FilterCds(qryLajes, uTipos.fsInteger, inttostr(self.p_codigo));
  edt_mao_obra.Text := FormatFloat('0.00', QRY.FieldByName('CUSTO_LIQUIDO').AsFloat - QRY.FieldByName('PRECO_CUSTO').AsFloat );
  {formas de pagamento}
  try
    loqry := TFDQuery.Create(self) ;
    loqry.Connection := conexao;

    loqry.SQL.Add('select ');
    loqry.SQL.Add('  P.ID, P.PRODUTO_ID, P.FORMA_PAGTO_ID, F.DESCRICAO AS FORMA_PAGTO_DESCRICAO, P.PRECO_VENDEDOR, ');
    loqry.SQL.Add('P.PRECO_VENDA, P.TAXA_PARCELAMENTO, P.ATIVO ');
    loqry.SQL.Add('from ');
    loqry.SQL.Add('  PRODUTOS_FORMA_PAGAMENTO P, FORMAS_PAGTO F ');
    loqry.SQL.Add('where ' );
    loqry.SQL.Add('  P.forma_pagto_id = F.id AND PRODUTO_ID =:PRODUTO_ID and P.ativo =:ativo') ;
    loQry.Params.ParamByName('PRODUTO_ID').AsInteger := QRY.FieldByName('ID').AsInteger;
    loQry.Params.ParamByName('ATIVO').AsString := 'S';
    loQry.Open;

    mt_lista_precos.CopyDataSet(loQry) ;

    pnDados.Enabled := true;

  finally
    FreeAndNil(loqry);
  end;

end;


procedure TfrmProdutosLajesE.mn_alterarClick(Sender: TObject);
begin
  if frmTabelaPrecosE = nil then
  begin
    try
      frmTabelaPrecosE                := TfrmTabelaPrecosE.Create(self);
      frmtabelaPrecosE.p_formaPagtoId := mt_lista_precosID.AsInteger;
      frmTabelaPrecosE.p_operacao     := opAlterar;
      frmtabelaPrecosE.ShowModal;

      if frmTabelaPrecosE.p_confirmado = true then
      begin
        // inserir na grid
        mt_lista_precos.Edit;
        mt_lista_precosPRECO_VENDEDOR.AsFloat    := frmTabelaPrecosE.p_precoVendedor;
        mt_lista_precosPRECO_VENDA.AsFloat       := frmTabelaPrecosE.p_precoVenda;
        mt_lista_precosTAXA_PARCELAMENTO.AsFloat := frmTabelaPrecosE.p_taxa;
        mt_lista_precosATIVO.AsString            := frmTabelaPrecosE.p_ativo;
        mt_lista_precos.Post;

        // atualiza preços a vista
        if frmTabelaPrecosE.p_intervalo = 0 then
          prc_custo_mao_de_obra(frmTabelaPrecosE.p_precoVendedor,qry.FieldByName('PRECO_CUSTO').AsFloat) ;
      end;

    finally
       FreeAndNil(frmTabelaPrecosE);
    end;

  end;
end;

procedure TfrmProdutosLajesE.mn_excluirClick(Sender: TObject);
begin
  if mt_lista_precosID.AsInteger > 0 then
  begin
    mt_precos_deletados.Insert;
    mt_precos_deletadosID.AsInteger := mt_lista_precosID.AsInteger;
    mt_precos_deletados.post;
  end;

  mt_lista_precos.Delete;
end;

procedure TfrmProdutosLajesE.rgEnchimentoClick(Sender: TObject);
begin
  inherited;
  if rgEnchimento.ItemIndex = 0 then
  begin
    qryLajes.FieldByName('LAJOTA').AsString := 'S';
    qryLajes.FieldByName('ISOPOR').AsString := 'N';
    qryLajes.FieldByName('MISTA').AsString  := 'N';
  end;
  if rgEnchimento.ItemIndex = 1 then
  begin
    qryLajes.FieldByName('LAJOTA').AsString := 'N';
    qryLajes.FieldByName('ISOPOR').AsString := 'S';
    qryLajes.FieldByName('MISTA').AsString  := 'N';

  end;
  if rgEnchimento.ItemIndex = 2 then
  begin
    qryLajes.FieldByName('LAJOTA').AsString := 'N';
    qryLajes.FieldByName('ISOPOR').AsString := 'N';
    qryLajes.FieldByName('MISTA').AsString  := 'S';

  end;

end;

procedure TfrmProdutosLajesE.rgFormaClick(Sender: TObject);
begin
  inherited;
  if rgForma.ItemIndex = 1 then
  begin
    rgEnchimento.ItemIndex := -1;
    rgEnchimento.Enabled := false;
  end
  else
  begin
    rgEnchimento.Enabled := true;
  end

end;

function  TfrmProdutosLajesE.fnc_buscar_novo_id: integer;
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

procedure TfrmProdutosLajesE.salvar;
begin


    if not Valida then Exit;

    if p_operacao = opexcluir then
      if Application.MessageBox('Deseja excluir este registro?','Atenção',MB_OKCANCEL) = mrCancel then exit;

    if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
    try
      {salva o produto }
      qry.Post;
      if p_operacao = OpIncluir then p_codigo := fnc_buscar_novo_id;

      {salva detalhes da laje}
      if p_operacao <> opexcluir then
        qryLajes.Post;

      {exclui formas de pagameto. se houver}
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

function TfrmProdutosLajesE.valida: boolean;
var
  loQry : TFDQuery;
  enchimento,lajota,isopor,mista : string;
begin
  result := false;

  if edDescricao.Text = '' then
  begin
    ShowMessage('Informe uma Descrição');
    edDescricao.SetFocus;
    exit;
  end;

  if cbxUnidade.Text = '' then
  begin
    ShowMessage('Informe uma Unidade de medida');
    cbxUnidade.SetFocus;
    exit;
  end;

  if edFantasia.Text = '' then
  begin
    ShowMessage('Informe um nome de fantasia');
    edFantasia.SetFocus;
    exit;
  end;

  if edAltura.Text = '' then
  begin
    ShowMessage('Informe a altura da laje');
    edAltura.SetFocus;
    exit;
  end;

  if qry.FieldByName('PRECO_VENDA').AsFloat <= 0 then
  begin
    ShowMessage('Informe um preço de venda válido');
    btn_incluir.click;
    exit;
  end;

  if edPeso.Text = '' then
  begin
    ShowMessage('Informe o peso do laje');
    edPeso.SetFocus;
    exit;
  end;


  if edCarga.Text = '' then
  begin
    ShowMessage('Informe a sobre carga da laje');
    edCarga.SetFocus;
    exit;
  end;


  if rgForma.ItemIndex = -1 then
  begin
    ShowMessage('Selecione a largura da forma');
    rgForma.SetFocus;
    exit;
  end;

  {ver duplicidade}
  if self.p_operacao = OpIncluir then
  begin
  try
    if rgEnchimento.ItemIndex = 0 then
    begin
     lajota     := 'S';
     isopor     := 'N';
     mista      := 'N';
     enchimento := 'LAJOTA';
    end;

    if rgEnchimento.ItemIndex = 1 then
    begin
     lajota     := 'N';
     isopor     := 'S';
     mista      := 'N';
     enchimento := 'ISOPOR';
    end;

    if rgEnchimento.ItemIndex = 2 then
    begin
     lajota     := 'N';
     isopor     := 'N';
     mista      := 'S';
     enchimento := 'MISTO';
    end;

    {duplicidade}
    (*
    loQry := uBiblioteca.CriaQuery(self.Conexao,'select * from PRODUTOS_LAJES where ALTURA =:ALTURA and LAJOTA =:LAJOTA and ISOPOR =:ISOPOR and MISTA =:MISTA and FORMA =:FORMA',false);
    *)
    loQry := TFDQuery.Create(self);
    loQry.Connection := conexao;
    loQry.Close;
    loqry.SQL.Clear;
    loqry.SQL.add('select * from PRODUTOS_LAJES where ALTURA =:ALTURA and LAJOTA =:LAJOTA and ISOPOR =:ISOPOR and MISTA =:MISTA and FORMA =:FORMA');

    loQry.ParamByName('ALTURA').AsInteger := strtoint(edAltura.Text);
    loQry.ParamByName('LAJOTA').AsString  := lajota;
    loQry.ParamByName('ISOPOR').AsString  := isopor;
    loQry.ParamByName('MISTA').AsString   := mista;
    //loQry.Params[4].AsInteger := uBiblioteca.SeSenao(rgForma.ItemIndex = 0, '130','250');
    {forma padrão}
    if rgForma.ItemIndex = 0 then loQry.Params[4].AsInteger := 130 else
    {forma painel}
    if rgForma.ItemIndex = 1 then loQry.Params[4].AsInteger := 250 else
    {forma trelifacil}
    if rgForma.ItemIndex = 2 then loQry.Params[4].AsInteger := 120;

    loQry.Open;
    if loQry.RecordCount = 1 then
    begin
      ShowMessage( 'Laje com altuta H-"' + edAltura.Text +
                   '" com enchimento "' + enchimento +
                   '" na forma de "' +
                   sesenao(rgforma.ItemIndex =2,'TRELIFACIL', rgForma.Items[rgForma.ItemIndex] )+
                   '" Já esta cadastrada no sistema');
      exit;
    end;

  finally
    loQry.Close;
    FreeAndNil(loQry);
  end;

  end;


  if mt_lista_precos.IsEmpty then
  begin
    ShowMessage('Cadastre uma forma de pagamento');
    btn_incluir.Click;
    exit;
  end;

  Result := True;
end;


procedure TfrmProdutosLajesE.prc_incluir_alterar(operacao: TOperacao; v_tabela: string);
var
 loQry : TFDQuery;
begin
  loQry := TFDQuery.Create(self);
  loQry.Connection := conexao;
  try

    loQry.sql.clear;
    if operacao = opExcluir then
    begin
      {não deleta do banco, marca ATIVO = N}
      loQry.SQL.Add('update ' + v_tabela + ' set ATIVO = ''N'' where id =:id');
      loQry.ParamByName('id').AsInteger := mt_precos_deletadosID.AsInteger;
      loQry.ExecSQL;
      exit;
    end;


    if operacao = OpIncluir then
    begin
      loQry.SQL.Add('insert into ' + v_tabela  );
      loQry.SQL.Add('(');
      loQry.SQL.Add('  ID, ');
      loQry.SQL.Add('  PRODUTO_ID, ');
      loQry.SQL.Add('  FORMA_PAGTO_ID, ');
      loQry.SQL.Add('  PRECO_VENDEDOR, ');
      loQry.SQL.Add('  PRECO_VENDA, ');
      loQry.SQL.Add('  TAXA_PARCELAMENTO, ');
      loQry.SQL.Add('  ATIVO ');
      loQry.SQL.Add(') ');
      loQry.SQL.Add('VALUES ');
      loQry.SQL.Add('(');
      loQry.SQL.Add('  :ID, ');
      loQry.SQL.Add('  :PRODUTO_ID, ');
      loQry.SQL.Add('  :FORMA_PAGTO_ID, ');
      loQry.SQL.Add('  :PRECO_VENDEDOR, ');
      loQry.SQL.Add('  :PRECO_VENDA, ');
      loQry.SQL.Add('  :TAXA_PARCELAMENTO, ');
      loQry.SQL.Add('  :ATIVO ');
      loQry.SQL.Add(') ');
      //ShowMessage(loQry.SQL.Text)    ;
      //Codigo := uBiblioteca.AutoIncremento(conexao, v_tabela);
      loQry.ParamByName('ID').AsInteger := uBiblioteca.AutoIncremento(conexao, v_tabela);
      loQry.ParamByName('PRODUTO_ID').AsInteger := p_codigo;
      loQry.ParamByName('FORMA_PAGTO_ID').AsInteger := mt_lista_precosFORMA_PAGTO_ID.AsInteger;
    end
    else
    begin
      loQry.SQL.Add('UPDATE                          ');
      loQry.SQL.Add(v_tabela + ' ');
      loQry.SQL.Add('SET                                      ');
      loQry.SQL.Add('  PRECO_VENDEDOR    = :PRECO_VENDEDOR,   ');
      loQry.SQL.Add('  PRECO_VENDA       = :PRECO_VENDA,      ');
      loQry.SQL.Add('  TAXA_PARCELAMENTO = :TAXA_PARCELAMENTO,');
      loQry.SQL.Add('  ATIVO             = :ATIVO             ');
      loQry.SQL.Add('WHERE                                    ');
      loQry.SQL.Add('  ID = :ID                               ');
      //
      loQry.ParamByName('ID').AsInteger       := mt_lista_precosID.AsInteger;

    end;

    loQry.ParamByName('PRECO_VENDEDOR').AsFloat    := mt_lista_precosPRECO_VENDEDOR.AsFloat;
    loQry.ParamByName('PRECO_VENDA').AsFloat       := mt_lista_precosPRECO_VENDA.AsFloat;
    loQry.ParamByName('TAXA_PARCELAMENTO').AsFloat := mt_lista_precosTAXA_PARCELAMENTO.AsFloat;
    loQry.ParamByName('ATIVO').AsString   := mt_lista_precosATIVO.AsString;
    loQry.ExecSQL;

  finally
    FreeAndNil(loQry)
  end;
end;

end.
