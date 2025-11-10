unit ufrmProdutosBombaE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, Vcl.DBCtrls, Vcl.Mask;

type
  TfrmProdutosBombaE = class(TfrmBaseEdicao)
    Bevel1: TBevel;
    Bevel2: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label19: TLabel;
    Label29: TLabel;
    edID: TDBText;
    edCadastro: TDBText;
    edAlteracao: TDBText;
    Label28: TLabel;
    Label4: TLabel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    DBText1: TDBText;
    edDescricao: TDBEdit;
    edCusto: TDBEdit;
    edVenda: TDBEdit;
    edFantasia: TDBEdit;
    cbAtivo: TDBCheckBox;
    cbEstoqueControlado: TDBCheckBox;
    cbxUnidade: TDBComboBox;
    cbxDepartamento: TDBLookupComboBox;
    edPeso: TDBEdit;
    gbx_Fical: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    edClassFis: TDBEdit;
    edSitTrib: TDBEdit;
    edTxICMS: TDBEdit;
    edTxIPI: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    edt_preco_vendedor: TDBEdit;
    cbRevenda: TDBCheckBox;
    gbx_tipo_bomba: TGroupBox;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    dsConcreto: TDataSource;
    qryBomba: TFDQuery;
    dsDeptos: TDataSource;
    qryDeptos: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    FOperacao: uTipos.TOperacao;
    FTitulo  : string;
    FTabela  : string;
    FCodigo  : integer;

    procedure prc_Salvar;

  protected
    procedure prc_Componentes;
    procedure prc_Inicializar;

    procedure prc_LerDados;
    function  fnc_Validar: boolean;


  public
    { Public declarations }
    property codigo   : integer         read FCodigo   write FCodigo;
    property Operacao :uTipos.TOperacao read FOperacao write FOperacao;
    property Tabela   :string           read FTabela   write FTabela;
    property Titulo   :string           read FTitulo   write FTitulo;
  end;

  procedure Incluir;
  procedure Alterar(ACodigo: integer);
  procedure Excluir(ACodigo: integer);

implementation

uses uBiblioteca;

procedure Incluir;
var
  loForm :TfrmProdutosBombaE;
begin
  loForm := TfrmProdutosBombaE.Create(Application);
  try
    loForm.Operacao := uTipos.OpIncluir;
    loForm.codigo   := 0;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Alterar(ACodigo: integer);
var
  loForm :TfrmProdutosBombaE;
begin
  loForm := TfrmProdutosBombaE.Create(Application);
  try
    loForm.Operacao := uTipos.opAlterar;
    loForm.codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure Excluir(ACodigo: integer);
var
  loForm :TfrmProdutosBombaE;
begin
  loForm := TfrmProdutosBombaE.Create(Application);
  try
    loform.Operacao := uTipos.opExcluir;
    loForm.codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;


{$R *.dfm}

procedure TfrmProdutosBombaE.btnOkClick(Sender: TObject);
begin
  inherited;
  prc_Salvar;
end;

function TfrmProdutosBombaE.fnc_Validar: boolean;
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

  if cbxDepartamento.Text = '' then
  begin
    ShowMessage('Informe um Departamento');
    edFantasia.SetFocus;
    exit;
  end;

  if qry.FieldByName('PRECO_CUSTO').AsFloat <= 0 then
  begin
    ShowMessage('Informe um valor válido');
    edCusto.SetFocus;
    exit;
  end;

  if qry.FieldByName('PRECO_VENDA').AsFloat < qry.FieldByName('PRECO_VENDEDOR').AsFloat then
  begin
    ShowMessage('Informe um preço de venda válido válido');
    edVenda.SetFocus;
    exit;
  end;



  Result := True;

end;

procedure TfrmProdutosBombaE.FormCreate(Sender: TObject);
begin
  inherited;

  self.Tabela := 'PRODUTOS';
  qryDeptos.Connection := self.Conexao;
  qryBomba.Connection  := self.Conexao;

end;

procedure TfrmProdutosBombaE.FormShow(Sender: TObject);
begin
  inherited;
  prc_Componentes;
  prc_Inicializar;

end;

procedure TfrmProdutosBombaE.prc_Componentes;
begin
  qry.Open('select * from '+ self.Tabela +' where ID = :ID');
  qryDeptos.Open('select * from DEPARTAMENTOS order by NOME');
  qryBomba.Open('select * from PRODUTOS_BOMBA where PRODUTO_ID =:ID');

end;

procedure TfrmProdutosBombaE.prc_Inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin
                       pnTitulo.Caption := 'CADASTRO DE BOMBA DE CONCRETO';
                       lbl_sub_titulo.Caption := 'Incluir Novo';
                       btnOk     .Caption := 'Incluir';
                       // insert em produtos
                       qry.Insert;
                       qry.FieldByName('ID').AsInteger := ubiblioteca.AutoIncremento(self.Conexao,self.Tabela);
                       qry.FieldByName('DATA_CAD').AsDateTime := Date;
                       qry.FieldByName('ATIVO').AsString              := 'S';
                       qry.FieldByName('ESTOQUE_CONTROLADO').AsString := 'N';
                       qry.FieldByName('PRECO_CUSTO').AsFloat         := 0;
                       qry.FieldByName('PRECO_VENDEDOR').AsFloat      := 0;
                       qry.FieldByName('PRECO_VENDA').AsFloat         := 0;
                       //ESTOQUE
                       qry.FieldByName('ESTOQUE_FISICO').AsFloat      := 0;
                       qry.FieldByName('PEDIDO_ABERTO').AsFloat       := 0;
                       qry.FieldByName('ESTOQUE_DISPONIVEL').AsFloat  := 0;
                       qry.FieldByName('PEDIDO_AGUARDANDO').AsFloat   := 0;
                       qry.FieldByName('ESTOQUE_LIQUIDO').AsFloat     := 0;
                       //CONTROLE DE ESTOQUE
                       qry.FieldByName('PONTO_PEDIDO').AsFloat        := 0;
                       qry.FieldByName('QTDE_MIN').AsFloat            := 0;
                       qry.FieldByName('QTDE_MAX').AsFloat            := 0;
                       qry.FieldByName('TEMPO_REPOSICAO').AsInteger   := 0;
                       qry.FieldByName('PESO').AsInteger              := 0;
                       //FISCAL
                       qry.FieldByName('CLASS_FIS').AsString          := '';
                       qry.FieldByName('SIT_TRIB').AsString           := '';
                       qry.FieldByName('TX_ICMS').AsFloat             := 0;
                       qry.FieldByName('TX_IPI').AsFloat              := 0;

                       // identifiação do produto
                       qry.FieldByName('REVENDA').AsString            := 'S';
                       qry.FieldByName('MATERIA_PRIMA').AsString      := 'N';
                       qry.FieldByName('AGREGADO').AsString           := 'N';
                       qry.FieldByName('LAJE').AsString               := 'N';
                       qry.FieldByName('VIGA').AsString               := 'N';
                       qry.FieldByName('LAJOTA').AsString             := 'N';
                       qry.FieldByName('ISOPOR').AsString             := 'N';
                       qry.FieldByName('CONCRETO').AsString           := 'N';
                       qry.FieldByName('BOMBA').AsString              := 'S';
                       qry.FieldByName('VERGALHAO').AsString          := 'N';
                       qry.FieldByName('TRELICA').AsString            := 'N';

                       // insert em trelica
                       qryBomba.Insert;
                       qryBomba.FieldByName('ID').AsInteger := ubiblioteca.AutoIncremento(self.Conexao,'PRODUTOS_CONCRETO');
                       qryBomba.FieldByName('PRODUTO_ID').AsInteger := qry.FieldByName('ID').AsInteger;
                     end;

  uTipos.opAlterar: begin
                      self.prc_LerDados;
                       pnTitulo.Caption := 'CADASTRO DE BOMBA DE CONCRETO';
                       lbl_sub_titulo.Caption := 'Alterar';
                      btnOk.Caption    := 'Alterar';
                      //produto
                      qry.Edit;
                      qry.FieldByName('DATA_ALT').AsDateTime := Date;
                      //trelica
                      qryBomba.Edit;
                      btnOk.SetFocus;
                    end;

  uTipos.opExcluir: begin
                      self.prc_LerDados;
                       pnTitulo.Caption := 'CADASTRO DE BOMBA DE CONCRETO';
                       lbl_sub_titulo.Caption := 'Excluir';
                      pnDados.Enabled  := false;
                      btnOk.Caption    := 'Excluir';
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

procedure TfrmProdutosBombaE.prc_LerDados;
begin

  uBiblioteca.FilterCds(qry, uTipos.fsInteger, inttostr(self.Codigo));
  uBiblioteca.FilterCds(qryBomba, uTipos.fsInteger, inttostr(self.Codigo));

end;

procedure TfrmProdutosBombaE.prc_Salvar;
begin
  case Self.Operacao of

    // Inclusão
    uTipos.opIncluir :
    begin
      if not fnc_Validar then Exit;

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
      //***
      try
        {Próximo código}
        qry.Post;
        qryBomba.Post;
        if Self.Conexao.InTransaction then Self.Conexao.Commit;

        if Application.MessageBox('Deseja continuar incluindo?','Inclusão...',MB_YESNO) = mrYES then
          Self.prc_Inicializar
        else
          ModalResult := mrOk;
      except
        ShowMessage('Não foi possível salvar o registro');
      end;
    end;

    // Alteração
    uTipos.opAlterar :
    begin
      if not fnc_Validar then Exit;

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
      //***
      try
        qry.Post;
        qryBomba.Post;
        if Self.Conexao.InTransaction then Self.Conexao.Commit;
        ModalResult := mrOk;
      except
        ShowMessage('Não foi possível alterar o registro');
      end;
    end;

    //Exclusão
    uTipos.opExcluir :
    begin
      if Application.MessageBox('Deseja excluir este registro?','Atenção',MB_OKCANCEL) = mrOK then
      begin
        if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
        try
          //qryPessoas.Delete;
          qry.Post;
          if Self.Conexao.InTransaction then Self.Conexao.Commit;
          ModalResult := mrOk;
        except
          ShowMessage('Não foi possível excluir o registro');
        end;
      end; // if
    end;
  end;// case


end;

end.
