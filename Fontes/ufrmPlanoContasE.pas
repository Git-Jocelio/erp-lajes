//***************************************************************************//
// Manutenção do Cadastro de Plano de Contas
// desenvolvida por Jocelio G Silva
// inicio : 26/10/2023 retomando o sistema ! Deus seja louvado.
// fim :
//***************************************************************************//

unit ufrmPlanoContasE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, uBiblioteca;

type
  TfrmPlanoContasE = class(TfrmBaseEdicao)
    lbl_cadastrado_em: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    lbl_Id: TLabel;
    Label4: TLabel;
    lbl_alterado_em: TLabel;
    rg_tipoconta: TRadioGroup;
    Label6: TLabel;
    edt_nr_conta: TEdit;
    Label7: TLabel;
    edt_descricao: TEdit;
    rg_DRE: TRadioGroup;
    rg_fluxocaixa: TRadioGroup;
    rg_balanco: TRadioGroup;
    cb_conta: TCheckBox;
    rg_CustoFixo: TRadioGroup;
    rg_custo_variavel: TRadioGroup;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    FOperacao: uTipos.TOperacao;
    FTabela: string;
    FCodigo: integer;

    procedure prc_salvar;
    procedure prc_incluir_alterar(operacao: TOperacao);
  protected
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;
    function prc_validar: boolean;

  public
    property Codigo   :integer read FCodigo write FCodigo;
    property Operacao :uTipos.TOperacao read FOperacao write FOperacao;
    property Tabela   :string read FTabela write FTabela;

  end;

  procedure prc_incluir;
  procedure prc_alterar(ACodigo :integer);
  procedure prc_excluir(ACodigo :integer);

implementation

procedure prc_incluir;
var
  loForm : TfrmPlanoContasE;
begin
  loForm := TfrmPlanoContasE.Create(Application);
  try
    loForm.Operacao := uTipos.opIncluir;
    loForm.Codigo   := 0;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure prc_alterar(ACodigo :integer);
var
  loForm : TfrmPlanoContasE;
begin
  loForm := TfrmPlanoContasE.Create(Application);
  try
    loForm.Operacao := uTipos.opAlterar;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure prc_excluir(ACodigo :integer);
var
  loForm : TfrmPlanoContasE;
begin
  loForm := TfrmPlanoContasE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;


{$R *.dfm}

procedure TfrmPlanoContasE.btnOkClick(Sender: TObject);
begin
  inherited;
  prc_salvar;
end;

procedure TfrmPlanoContasE.FormCreate(Sender: TObject);
begin
  inherited;
  self.Tabela := 'PLANO_CONTAS';

end;

procedure TfrmPlanoContasE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmPlanoContasE.prc_componentes;
begin
  {qry de principal}
  qry.Connection := SELF.Conexao;
  qry.SQL.Clear;
  qry.SQL.Add('select * from ' + tabela + ' where ID =:ID');

end;

procedure TfrmPlanoContasE.prc_inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin

                       pnTitulo.Caption := 'Manutenção de PLANO DE CONTAS [Inclusão]';
                       lbl_sub_titulo.Caption := 'inclui um novo plano de contas ao sistema';
                       pnDados.Enabled := true;

                       {Novo id usuario}
                       {pegar somente na hora de incluir no banco}
                       //self.Codigo := ubiblioteca.AutoIncremento(self.Conexao,self.Tabela);
                       //ShowMessage(Inttostr(SELF.Codigo));
                       lbl_Id.Caption := '-1';
                       lbl_cadastrado_em.Caption := DateToStr(Date);
                       btnOk     .Caption := 'Incluir';

                     end;
  uTipos.opAlterar: begin

                      prc_ler_dados;
                      pnTitulo.Caption := 'Manutenção de PLANO DE CONTAS [Alteração]';
                      lbl_sub_titulo.Caption := 'alterar um plano de contas já cadastrado no sistema';
                      btnOk.Caption    := 'Alterar';
                      //
                      btnOk.SetFocus;

                    end;
  uTipos.opExcluir: begin

                      prc_ler_dados;
                      pnTitulo.Caption    := 'Manutenção de PLANO DE CONTAS [Exclusão]';
                      lbl_sub_titulo.Caption := 'exclui um plano de contas já cadastrado no sistema';
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

procedure TfrmPlanoContasE.prc_ler_dados;
var
 loQry: TFDQuery;
begin

  try

    loQry := TFDQuery.Create(Self);
    try
      with loQry, loQry.Sql do
      begin
        Connection := Self.Conexao;
        Add('SELECT * FROM ' + Self.Tabela + ' WHERE ID =:ID');
        ParamByName('ID').AsInteger := Codigo;
        Open;
      end;
      if not loQry.IsEmpty then
      begin
        //Carrega dados da pessoas
        lbl_Id.Caption            := loQry.FieldByName('ID').AsString;
        lbl_cadastrado_em.Caption := loQry.FieldByName('CADASTRADO_EM').AsString;
        lbl_alterado_em.Caption   := loQry.FieldByName('ALTERADO_EM').AsString;
        rg_tipoconta.ItemIndex    := ubiblioteca.SeSenao(loQry.FieldByName('TIPO').AsString = 'A', 0, 1);
        cb_conta.Checked          := loQry.FieldByName('ATIVO').AsString = 'S';
        edt_nr_conta.Text           := loQry.FieldByName('NR_CONTA').AsString;
        edt_descricao.Text           := loQry.FieldByName('DESCRICAO').AsString;
        rg_DRE.ItemIndex          := ubiblioteca.SeSenao(loQry.FieldByName('VAI_PARA_DRE').AsString = 'S', 0, 1);
        rg_fluxocaixa.ItemIndex   := ubiblioteca.SeSenao(loQry.FieldByName('VAI_PARA_FLUXO_CAIXA').AsString = 'S', 0, 1);
        rg_balanco.ItemIndex      := ubiblioteca.SeSenao(loQry.FieldByName('VAI_PARA_BALANCO').AsString = 'S', 0, 1);
        rg_CustoFixo.ItemIndex    := ubiblioteca.SeSenao(loQry.FieldByName('CUSTO_FIXO').AsString = 'S', 0, 1);
        rg_custo_variavel.ItemIndex := ubiblioteca.SeSenao(loQry.FieldByName('CUSTO_VARIAVEL').AsString = 'S', 0, 1);

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

function TfrmPlanoContasE.prc_validar: boolean;
begin
  result := false;

  if rg_tipoconta.ItemIndex = -1 then
  begin
    ShowMessage('informe o tipo de conta');
    rg_tipoconta.SetFocus;
    exit;
  end;

  if edt_nr_conta.text = '' then
  begin
    ShowMessage('informe o CÓDIGO DA CONTA');
    edt_nr_conta.SetFocus;
    exit;
  end;
  (*: verificar duplicidade *)

  if edt_descricao.text = '' then
  begin
    ShowMessage('informe a DESCRIÇÃO DA CONTA');
    edt_descricao.SetFocus;
    exit;
  end;

  if rg_DRE.ItemIndex = -1 then
  begin
    ShowMessage('informe se esta conta aparecerá no relatório DRE');
    rg_DRE.SetFocus;
    exit;
  end;

  if rg_fluxocaixa.ItemIndex = -1 then
  begin
    ShowMessage('informe se esta conta aparecerá no relatório FLUXO DE CAIXA');
    rg_fluxocaixa.SetFocus;
    exit;
  end;

  if rg_balanco.ItemIndex = -1 then
  begin
    ShowMessage('informe se esta conta aparecerá no relatório de BALANÇO');
    rg_balanco.SetFocus;
    exit;
  end;

  result := true;
end;

procedure TfrmPlanoContasE.prc_salvar;
begin
  //ShowMessage('salvar');
  case Self.Operacao of

    // Inclusão
    uTipos.opIncluir :
    begin
      if not prc_validar then Exit;

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
      //***
      try
        prc_incluir_alterar(OpIncluir);
        if Self.Conexao.InTransaction then Self.Conexao.Commit;
        ModalResult := mrOk;
      except
        conexao.Rollback;
        ShowMessage('Não foi possível salvar o registro');
      end;
    end;

    // Alteração
    uTipos.opAlterar :
    begin
      if not prc_validar then Exit;

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
      //***
      try
        prc_incluir_alterar(opAlterar);
        if Self.Conexao.InTransaction then Self.Conexao.Commit;
        ModalResult := mrOk;
      except
        conexao.Rollback;
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
          prc_incluir_alterar(opExcluir);
          if Self.Conexao.InTransaction then Self.Conexao.Commit;
          ModalResult := mrOk;
        except
          conexao.Rollback;
          ShowMessage('Não foi possível excluir o registro');
        end;
      end; // if
    end;
  end;// case

end;

procedure TfrmPlanoContasE.prc_incluir_alterar(operacao: TOperacao);
begin
  qry.sql.clear;
  if operacao = opExcluir then
  begin
    qry.SQL.Add('update '+ self.Tabela + ' set ATIVO = ''N'' where id =:id');
    qry.ParamByName('id').AsInteger := Codigo;
    qry.ExecSQL;
    exit;
  end;


  if operacao = OpIncluir then
  begin
    qry.SQL.Add('insert into ' + self.Tabela );
    qry.SQL.Add('(');
    qry.SQL.Add('  ID, ');
    qry.SQL.Add('  CADASTRADO_EM, ');
    qry.SQL.Add('  TIPO, ');
    qry.SQL.Add('  NR_CONTA, ');
    qry.SQL.Add('  DESCRICAO, ');
    qry.SQL.Add('  CUSTO_FIXO, ');
    qry.SQL.Add('  CUSTO_VARIAVEL, ');
    qry.SQL.Add('  VAI_PARA_DRE, ');
    qry.SQL.Add('  VAI_PARA_FLUXO_CAIXA, ');
    qry.SQL.Add('  VAI_PARA_BALANCO, ');
    qry.SQL.Add('  ATIVO ');
    qry.SQL.Add(') ');
    qry.SQL.Add('VALUES ');
    qry.SQL.Add('(');
    qry.SQL.Add('  :ID, ');
    qry.SQL.Add('  :CADASTRADO_EM, ');
    qry.SQL.Add('  :TIPO, ');
    qry.SQL.Add('  :NR_CONTA, ');
    qry.SQL.Add('  :DESCRICAO, ');
    qry.SQL.Add('  :CUSTO_FIXO, ');
    qry.SQL.Add('  :CUSTO_VARIAVEL, ');
    qry.SQL.Add('  :VAI_PARA_DRE, ');
    qry.SQL.Add('  :VAI_PARA_FLUXO_CAIXA, ');
    qry.SQL.Add('  :VAI_PARA_BALANCO, ');
    qry.SQL.Add('  :ATIVO ');
    qry.SQL.Add(') ');

    Codigo := uBiblioteca.AutoIncremento(conexao, self.Tabela);
    qry.ParamByName('ID').AsInteger         := Codigo;
    qry.ParamByName('CADASTRADO_EM').AsDate := Date;
  end
  else
  begin
    qry.SQL.Add('UPDATE                          ');
    //qry.SQL.Add('  PLANO_CONTAS                  ');
    qry.SQL.Add(Tabela);
    qry.SQL.Add('SET                             ');
    qry.SQL.Add('  ALTERADO_EM    = :ALTERADO_EM,   ');
    qry.SQL.Add('  TIPO           = :TIPO,         ');
    qry.SQL.Add('  NR_CONTA         = :NR_CONTA,       ');
    qry.SQL.Add('  DESCRICAO      = :DESCRICAO,    ');
    qry.SQL.Add('  CUSTO_FIXO      = :CUSTO_FIXO,    ');
    qry.SQL.Add('  CUSTO_VARIAVEL      = :CUSTO_VARIAVEL,    ');
    qry.SQL.Add('  VAI_PARA_DRE   = :VAI_PARA_DRE, ');
    qry.SQL.Add('  VAI_PARA_FLUXO_CAIXA = :VAI_PARA_FLUXO_CAIXA,  ');
    qry.SQL.Add('  VAI_PARA_BALANCO = :VAI_PARA_BALANCO, ');
    qry.SQL.Add('  ATIVO           = :ATIVO         ');
    qry.SQL.Add('WHERE                         ');
    qry.SQL.Add('  ID = :ID                    ');
    //
    qry.ParamByName('ID').AsInteger       := Codigo;
    qry.ParamByName('ALTERADO_EM').AsDate := Date;

  end;

  qry.ParamByName('TIPO').AsString        := ubiblioteca.SeSenao(rg_tipoconta.ItemIndex = 0 , 'A','S');
  qry.ParamByName('ATIVO').AsString       := SeSenao(cb_conta.Checked, 'S', 'N');
  qry.ParamByName('NR_CONTA').AsString      := edt_nr_conta.Text;
  qry.ParamByName('DESCRICAO').AsString   := edt_descricao.Text;
  qry.ParamByName('CUSTO_FIXO').AsString     := ubiblioteca.SeSenao(rg_CustoFixo.ItemIndex = 0 , 'S','N');
  qry.ParamByName('CUSTO_VARIAVEL').AsString     := ubiblioteca.SeSenao(rg_custo_variavel.ItemIndex = 0 , 'S','N');
  qry.ParamByName('VAI_PARA_DRE').AsString     := ubiblioteca.SeSenao(rg_DRE.ItemIndex = 0 , 'S','N');
  qry.ParamByName('VAI_PARA_FLUXO_CAIXA').AsString   := ubiblioteca.SeSenao(rg_fluxocaixa.ItemIndex = 0 , 'S','N');
  qry.ParamByName('VAI_PARA_BALANCO').AsString := ubiblioteca.SeSenao(rg_balanco.ItemIndex = 0 , 'S','N');
  //ShowMessage(QRY.SQL.Text);
  qry.ExecSQL;

end;


end.
