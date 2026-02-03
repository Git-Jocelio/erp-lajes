//***************************************************************************//
// Cadastro de Tabela de preços
// desenvolvida por Jocelio G Silva
// inicio : 28/01/2024 // base ufrmPlanoContasE
// fim :  31/01/2024
//***************************************************************************//
unit ufrmTabelaPrecosE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, Vcl.DBCtrls, uBiblioteca, Vcl.Grids, Vcl.DBGrids;

type
  TfrmTabelaPrecosE = class(TfrmBaseEdicao)
    lbl_Id: TLabel;
    Label1: TLabel;
    ds_Forma_pagto: TDataSource;
    qry_forma_pagto: TFDQuery;
    Label5: TLabel;
    Label12: TLabel;
    edt_preco_vendedor: TEdit;
    lbl_descricao_produto: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edt_preco_venda: TEdit;
    Label8: TLabel;
    edt_taxa: TEdit;
    cbx_forma_pagto: TDBLookupComboBox;
    Label13: TLabel;
    ds_produtos: TDataSource;
    qry_produtos: TFDQuery;
    cb_ativo: TCheckBox;
    Label2: TLabel;
    edt_preco_custo: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure edt_preco_vendedorExit(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edt_taxaKeyPress(Sender: TObject; var Key: Char);
    procedure edt_taxaExit(Sender: TObject);
  private
    Fp_operacao: uTipos.TOperacao;
    Fp_tabela: string;
    Fp_codigo: integer;
    Fp_descricaoProduto: string;
    Fp_precoVenda: double;
    Fp_formaPagtoId: integer;
    Fp_precoVendedor: double;
    Fp_confirmado: boolean;
    Fp_taxa: double;
    Fp_descricaoFormaPagto: string;
    Fp_ativo: string;
    Fp_intervalo: integer;
    Fp_precoCusto: double;

    procedure prc_calcula_mao_de_obra;
    procedure prc_salvar;
   // procedure prc_incluir_alterar(operacao: TOperacao; v_tabela: string; v_id: integer);
  protected
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;
    function prc_validar: boolean;

  public
    property p_codigo   :integer read Fp_codigo write Fp_codigo;
    property p_descricaoProduto   :string read Fp_descricaoProduto write Fp_descricaoProduto;
    property p_operacao :uTipos.TOperacao read Fp_operacao write Fp_operacao;
    property p_tabela   :string read Fp_tabela write Fp_tabela;

    {dados da tabela produtos_forma_pagto}
    property p_intervalo: integer read Fp_intervalo write Fp_intervalo;
    property p_formaPagtoId: integer read Fp_formaPagtoId write Fp_formaPagtoId;
    property p_descricaoFormaPagto: string read Fp_descricaoFormaPagto write Fp_descricaoFormaPagto;
    property p_precoCusto: double read Fp_precoCusto write Fp_precoCusto;
    property p_precoVendedor: double read Fp_precoVendedor write Fp_precoVendedor;
    property p_precoVenda: double read Fp_precoVenda write Fp_precoVenda;
    property p_taxa: double read Fp_taxa write Fp_taxa;
    property p_ativo: string read Fp_ativo write Fp_ativo;

    property p_confirmado: boolean read Fp_confirmado write Fp_confirmado;


  end;

var
   frmTabelaPrecosE: TfrmTabelaPrecosE;

implementation



{$R *.dfm}

procedure TfrmTabelaPrecosE.btnOkClick(Sender: TObject);
begin
  inherited;
  if prc_validar then
    prc_salvar;
end;

procedure TfrmTabelaPrecosE.edt_taxaExit(Sender: TObject);
begin
  inherited;
  prc_formata_dinheiro(sender);

end;

procedure TfrmTabelaPrecosE.edt_taxaKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
 // if not (key in [#1..#31,#48..#57,#44]) then key := #0;
 prc_somente_numeros(sender, key);
end;

procedure TfrmTabelaPrecosE.edt_preco_vendedorExit(Sender: TObject);
begin
  inherited;
  prc_calcula_mao_de_obra;

end;

procedure TfrmTabelaPrecosE.FormCreate(Sender: TObject);
begin
  inherited;
  self.p_tabela := 'PRODUTOS_FORMA_PAGAMENTO';
  p_confirmado := false;
end;

procedure TfrmTabelaPrecosE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmTabelaPrecosE.prc_componentes;
begin

  {qryforma_pagto}
  qry_forma_pagto.Connection := Conexao;
  qry_forma_pagto.SQL.Add('select * from FORMAS_PAGTO order by DESCRICAO');
  qry_forma_pagto.Open;

  {qryProdutos}
  // busca os dados do produto
  qry_produtos.Connection := Conexao;
  qry_produtos.SQL.Add('select * from PRODUTOS where ID =:ID');
  qry_produtos.Params.ParamByName('ID').AsInteger := p_codigo;
  qry_produtos.Open;

  // confirgura os labels
  //lbl_id_produto.Caption := INTTOSTR(p_codigo);
  lbl_descricao_produto.Caption := qry_produtos.FieldByName('DESCRICAO').AsString;

end;

procedure TfrmTabelaPrecosE.prc_inicializar;
begin
  case self.p_operacao of
  uTipos.opIncluir: begin

                       //pnTitulo.Caption := 'Manutenção da Tabela de Preços [Inclusão]';
                       pnTitulo.Caption := 'TABELA DE PREÇOS';
                       lbl_sub_titulo.Caption := 'Inclusão de forma de pagamento ao produto';
                       pnDados.Enabled := true;

                       {Novo id usuario}
                       lbl_Id.Caption := '-1';
                       //lbl_cadastrado_em.Caption := DateToStr(Date);
                       btnOk     .Caption := 'Incluir';

                     end;
  uTipos.opAlterar: begin

                      prc_ler_dados;
                      pnTitulo.Caption := 'TABELA DE PREÇOS';
                      lbl_sub_titulo.Caption := 'Alterar preço/forma pagamento no produto';
                      btnOk.Caption    := 'OK';
                      cbx_forma_pagto.ReadOnly := true;
                      //
                      btnOk.SetFocus;

                    end;
  uTipos.opExcluir: begin

                      prc_ler_dados;
                      pnTitulo.Caption    := 'TABELA DE PREÇOS';
                      lbl_sub_titulo.Caption := 'exclui uma forma de pagamento no produto';
                      pnDados.Enabled     := false;
                      btnOk.Caption       := 'Excluir';
                      btnFechar.SetFocus;

                    end;
  else
    begin
      pnDados.Enabled   := false;
      if btnFechar.CanFocus then btnFechar.SetFocus;
    end;
  end;

end;

procedure TfrmTabelaPrecosE.prc_ler_dados;
var
 loQry: TFDQuery;
begin

  try

    loQry := TFDQuery.Create(Self);
    try
      with loQry, loQry.Sql do
      begin

        Connection := Self.Conexao;
        Add('select ');
        Add('  P.ID, P.PRODUTO_ID, PR.DESCRICAO, P.FORMA_PAGTO_ID, P.PRECO_VENDEDOR, ');
        Add('  P.PRECO_CUSTO, P.PRECO_VENDA, P.TAXA_PARCELAMENTO, P.ATIVO ');
        Add('from ');
        Add('  PRODUTOS_FORMA_PAGAMENTO P, PRODUTOS PR ');
        Add('where ' );
        Add('  P.PRODUTO_ID = PR.ID AND P.ID =:ID ') ;
        ParamByName('ID').AsInteger := p_formaPagtoId;
        Open;

      end;

      if not loQry.IsEmpty then
      begin
        //Carrega dados do produto
        lbl_Id.Caption                := loQry.FieldByName('ID').AsString;
        //lbl_id_produto.Caption        := loQry.FieldByName('PRODUTO_ID').AsString;
        lbl_descricao_produto.Caption := loQry.FieldByName('DESCRICAO').AsString;
        cbx_forma_pagto.KeyValue      := loQry.FieldByName('FORMA_PAGTO_ID').AsInteger;
        edt_taxa.Text                 := FormatFloat('0.00',loQry.FieldByName('TAXA_PARCELAMENTO').AsFloat);
        edt_preco_custo.Text          := FormatFloat('0.00',  loQry.FieldByName('PRECO_CUSTO').AsFloat );
        edt_preco_vendedor.Text       := FormatFloat('0.00',  loQry.FieldByName('PRECO_VENDEDOR').AsFloat );
        edt_preco_venda.Text          := FormatFloat('0.00',  loQry.FieldByName('PRECO_VENDA').AsFloat );
        cb_ativo.Checked              := SeSenao(loQry.FieldByName('ATIVO').AsString = 'S',TRUE,FALSE);
        cbx_forma_pagto.Enabled       := FALSE;
      end
      else
      begin
        ShowMessage('conta NÃO encontrada!');
      end;
    finally
      FreeAndNil(loQry);
    end;
  except
    on E : Exception do
       Raise Exception.Create(E.Message + Self.Name + '.prc_ler_dados');
  end;
end;


procedure TfrmTabelaPrecosE.prc_salvar;
begin
   {carrega as propriedades}
   p_intervalo := qry_forma_pagto.FieldByName('INTERVALO').AsInteger;
   p_formaPagtoId := cbx_forma_pagto.KeyValue;
   p_descricaoFormaPagto := cbx_forma_pagto.Text;
   p_precoCusto := strtofloat(edt_preco_custo.Text);
   p_precoVendedor := strtofloat(edt_preco_vendedor.Text);
   p_precoVenda := strtofloat(edt_preco_venda.Text);
   p_taxa := strtofloat(edt_taxa.Text);
   p_ativo := SeSenao(cb_ativo.Checked, 'S','N');
   // fecha o form
   p_confirmado := true;
   close;
end;

function TfrmTabelaPrecosE.prc_validar: boolean;
begin
   result := false;

   if cbx_forma_pagto.Text = '' then
   begin
     ShowMessage('Selecione uma FORMA DE PAGAMENTO');
     cbx_forma_pagto.SetFocus;
     exit;

   end;

   if StrToFloatDef(edt_taxa.Text,0) < 0 then
   begin
     ShowMessage('informe um VALOR DE TAXA VÁLIDO');
     edt_taxa.SetFocus;
     exit;

   end;

   if StrToFloatDef(edt_preco_custo.Text,0) <= 0 then
   begin
     ShowMessage('informe o PREÇO DE CUSTO');
     edt_preco_custo.SetFocus;
     exit;

   end;

   if StrToFloatDef(edt_preco_vendedor.Text,0) <= 0 then
   begin
     ShowMessage('informe o PREÇO PARA O VENDEDOR');
     edt_preco_vendedor.SetFocus;
     exit;

   end;

   if StrToFloatDef(edt_preco_venda.Text,0) <= 0 then
   begin
     ShowMessage('informe O PREÇO DE VENDA VÁLIDO');
     edt_preco_venda.SetFocus;
     exit;

   end;

   result := true;

end;




procedure TfrmTabelaPrecosE.prc_calcula_mao_de_obra;
begin
   //edt_mao_de_obra.Text := FormatFloat ('0.00', strtofloat(edt_preco_vendedor.Text) - strtofloat(edt_custo.Text));
end;




end.
