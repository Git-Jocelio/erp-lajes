
unit ufrmComissoesDespesaE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, uBiblioteca, Vcl.ComCtrls;

type
  TfrmComissoesDespesasE = class(TfrmBaseEdicao)
    Panel1: TPanel;
    Label32: TLabel;
    Label1: TLabel;
    lbl_id: TLabel;
    Label2: TLabel;
    lbl_cadastrado_em: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    lbl_numero_pedido: TLabel;
    Label7: TLabel;
    dtp_data_contabil: TDateTimePicker;
    mm_obs: TMemo;
    lbl_alterado_em: TLabel;
    rg_operacao: TRadioGroup;
    Label5: TLabel;
    edt_valor: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edt_valorExit(Sender: TObject);
    procedure edt_valorKeyPress(Sender: TObject; var Key: Char);
  private
    FOperacao: uTipos.TOperacao;
    FTabela: string;
    FCodigo: integer;
    Fpedido_id: integer;

    function  fnc_validar: Boolean;

    function  fnc_incluir: boolean;
    function  fnc_alterar: boolean;
    function  fnc_excluir: boolean;

    procedure prc_salvar;

  protected

    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;
    procedure prc_limpar_tela;

  public

    property Codigo    :integer read FCodigo write FCodigo;
    property Operacao  :uTipos.TOperacao read FOperacao write FOperacao;
    property Tabela    :string read FTabela write FTabela;
    property pedido_id :integer read Fpedido_id write Fpedido_id;

  end;

  var
   frmComissoesDespesasE  : TfrmComissoesDespesasE;
  //procedure prc_incluir(ACodigo :integer);
  //procedure prc_alterar(ACodigo :integer);
  //procedure prc_excluir(ACodigo :integer);

implementation


(*
procedure prc_incluir(ACodigo :integer);
var
  loForm : TfrmComissao_DespesasE;
begin
  loForm := TfrmComissao_DespesasE.Create(Application);
  try
    loForm.Operacao := uTipos.opIncluir;
    loForm.Codigo   := ACodigo;// número do pedido
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;

procedure prc_alterar(ACodigo :integer);
var
  loForm : TfrmComissao_DespesasE;
begin
  loForm := TfrmComissao_DespesasE.Create(Application);
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
  loForm : TfrmComissao_DespesasE;
begin
  loForm := TfrmComissao_DespesasE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;
*)

{$R *.dfm}

procedure TfrmComissoesDespesasE.btnOkClick(Sender: TObject);
begin
  inherited;
  prc_salvar;
end;

procedure TfrmComissoesDespesasE.edt_valorExit(Sender: TObject);
begin
  inherited;
  ubiblioteca.prc_formata_dinheiro(sender);
end;

procedure TfrmComissoesDespesasE.edt_valorKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  ubiblioteca.prc_somente_numeros(sender, key);
end;

function TfrmComissoesDespesasE.fnc_alterar: boolean;
var
  loQuery : TFDQuery;
begin
  //ShowMessage( INTTOSTR(rg_operacao.ItemIndex));
  try
    loQuery := TFDQuery.Create(Self);
    try
      with loQuery, loQuery.Sql do
      begin
        Connection := Self.Conexao;
        Add('UPDATE                              ');
        Add('  COMISSAO_DESPESAS                 ');
        Add('SET                                 ');
        Add('  ALTERADO_EM = :ALTERADO_EM,       ');
        Add('  DATA_CONTABIL = :DATA_CONTABIL,   ');
        Add('  HISTORICO =:HISTORICO,            ');
        Add('  DEBITO_CREDITO = :DEBITO_CREDITO, ');
        Add('  VALOR =:VALOR                     ');
        Add('WHERE                               ');
        Add('ID = :ID                            ');
        ParamByName('ID').AsInteger            := self.Codigo;
        ParamByName('ALTERADO_EM').AsDate      := Date;
        ParamByName('DATA_CONTABIL').AsDate    := dtp_data_contabil.Date;
        ParamByName('HISTORICO').AsMemo        := mm_obs.Lines.Text;
        ParamByName('DEBITO_CREDITO').AsString := ubiblioteca.SeSenao(rg_operacao.ItemIndex = 0, 'D','C');
        if Operacao <> opAlterar then
          ParamByName('VALOR').AsFloat           := ubiblioteca.SeSenao(rg_operacao.ItemIndex = 0, StrToFloat(edt_valor.Text), StrToFloat(edt_valor.Text) * -1)
        else
          ParamByName('VALOR').AsFloat           := StrToFloat(edt_valor.Text);
        ExecSQL;
        //***
        Result := (loQuery.RowsAffected > 0);
      end;
    finally
      FreeAndNil(loQuery);
    end; // try/finnaly
  except
    on E : Exception do
       Raise Exception.Create(E.Message + sLineBreak + 'local : ufrmComissoesDespesaE.prc_salvar.fnc_alterar');
  end; //try/exception
end;

function TfrmComissoesDespesasE.fnc_excluir: boolean;
var
  loQuery : TFDQuery;
begin
  try
    loQuery := TFDQuery.Create(Self);
    try
      with loQuery, loQuery.Sql do
        begin
          Connection := Self.Conexao;
          Add('DELETE FROM '+ self.Tabela + ' WHERE ID = :ID');
          ParamByName('ID').AsInteger := self.Codigo;
          ExecSQL;
          Result := (loQuery.RowsAffected > 0);

        end;
    finally
      FreeAndNil(loQuery);
      end;
  except
    on E : Exception do
       Raise Exception.Create(E.Message + ' : ufrmComissoesDespesaE.prc_salvar.fnc_excluir');
    end;
end;

function TfrmComissoesDespesasE.fnc_incluir: boolean;
var
  qry : TFDQuery;
begin
  // Incluir
  try
    qry := TFDQuery.Create(Self);
    try
      with qry, qry.Sql do
      begin
        Connection := Conexao;
        Add('INSERT INTO         ');
        Add('   COMISSAO_DESPESAS ');
        Add('  (ID,              ');
        Add('   PEDIDO_ID,       ');
        Add('   CADASTRADO_EM,   ');
        //Add('   ALTERADO_EM,   ');
        Add('   DATA_CONTABIL,   ');
        Add('   HISTORICO,       ');
        Add('   DEBITO_CREDITO,  ');
        Add('   VALOR)           ');
        Add('VALUES              ');
        Add('  (:ID,             ');
        Add('   :PEDIDO_ID,      ');
        Add('   :CADASTRADO_EM,  ');
        //Add('   :ALTERADO_EM,  ');
        Add('   :DATA_CONTABIL,  ');
        Add('   :HISTORICO,      ');
        Add('   :DEBITO_CREDITO, ');
        Add('   :VALOR)          ');

        ParamByName('ID').AsInteger            := Codigo;
        ParamByName('PEDIDO_ID').AsInteger     := pedido_id;
        ParamByName('CADASTRADO_EM').AsDate    := date;
        //ParamByName('ALTERADO_EM').Asdate    := date;
        ParamByName('DATA_CONTABIL').Asdate    := dtp_data_contabil.date;
        ParamByName('HISTORICO').AsString      := mm_obs.Lines.Text;
        ParamByName('DEBITO_CREDITO').AsString := uBiblioteca.SeSenao (rg_operacao.ItemIndex = 0, 'D','C');
        ParamByName('VALOR').AsFloat           := uBiblioteca.SeSenao (rg_operacao.ItemIndex = 0, StrToFloat(edt_valor.Text), StrToFloat(edt_valor.Text)* -1);
        ExecSQL;
        //***
        Result := ( qry.RowsAffected > 0 );
      end;



    finally
      FreeAndNil(qry);
    end;
  except
    on E : Exception do
       Raise Exception.Create(E.Message + ' : ufrmComissoesDespesaE.prc_salvar.fnc_incluir');
    end;
end;

function TfrmComissoesDespesasE.fnc_validar: Boolean;
begin
  Result := false;

(*
  if dtp_data_contabil.Date < StrToDate(lbl_cadastrado_em.Caption) then
  begin
    ShowMessage('informe uma DATA CONTABIL válida');
    dtp_data_contabil.SetFocus;
    exit;
  end;
*)

  if rg_operacao.ItemIndex = -1 then
  begin
    ShowMessage('informe uma operação DÉBITO/CRÉDITO');
    rg_operacao.SetFocus;
    exit;
  end;

  if StrToFloatDef(edt_valor.Text,0) = 0 then
  begin
    ShowMessage('informe um VALOR válido');
    edt_valor.SetFocus;
    exit;
  end;

  if trim(mm_obs.Lines.Text) = '' then
  begin
    ShowMessage('informe um HISTÓRICO');
    mm_obs.SetFocus;
    exit;
  end;


  //ShowMessage('Dados validados com sucesso!');
  result := true;
end;

procedure TfrmComissoesDespesasE.FormCreate(Sender: TObject);
begin

  inherited;
  self.Tabela := 'COMISSAO_DESPESAS';
  titulo      := 'Manutenção de outras despesas da comissão';

end;

procedure TfrmComissoesDespesasE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmComissoesDespesasE.prc_componentes;
begin

end;

procedure TfrmComissoesDespesasE.prc_inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin

                       {Novo id usuario}
                       Codigo := ubiblioteca.AutoIncremento(self.Conexao,self.Tabela);
                       lbl_id.Caption := inttostr( Codigo );
                       lbl_numero_pedido.Caption := inttostr( self.pedido_id );

                       lbl_titulo.Caption        := titulo + pnTitulo.Caption + ' [Incluir]';
                       lbl_sub_titulo.Caption    := ' Incluir outras despesas/crédito dentro comissão de um pedido ';

                       lbl_cadastrado_em.Caption := datetostr(date);
                       dtp_data_contabil.Date    := date;
                       lbl_cadastrado_em.caption := DateToStr(Date);

                       prc_limpar_tela;
                       //pnDados.Enabled := true;

                       rg_operacao.SetFocus;
                       btnOk     .Caption := 'Incluir';

                     end;
  uTipos.opAlterar: begin

                      prc_ler_dados;
                      //pnDados.Enabled  := false;
                      lbl_titulo.Caption  := titulo + ' [Alteração]';
                      lbl_sub_titulo.Caption  := 'Alterar outras despesas/crédito dentro comissão de um pedido ';
                      lbl_alterado_em.Caption := datetostr( date );
                      btnOk.Caption    := 'Alterar';
                      //
                      btnOk.SetFocus;

                    end;
  uTipos.opExcluir: begin

                      prc_ler_dados;
                      lbl_titulo.Caption        := titulo + pnTitulo.Caption + ' [Excluir]';
                      lbl_sub_titulo.Caption    := ' Excluir outras despesas/crédito dentro comissão de um pedido ';
                      pnDados.Enabled     := false;
                      btnOk.Caption       := 'Excluir';
                      btnFechar.SetFocus;

                    end;
  else
    begin
      pnDados.Enabled   := false;
      //pnCliente.Enabled   := false;
      if btnFechar.CanFocus then btnFechar.SetFocus;
    end;
  end;
end;

procedure TfrmComissoesDespesasE.prc_ler_dados;
var
  qry_despesa : TFDQuery;
begin
  try

    qry_despesa := TFDQuery.Create(Self);
    try
      with qry_despesa, qry_despesa.Sql do
      begin
        Connection := Self.Conexao;
        Add('SELECT * FROM ' + Self.Tabela + ' WHERE ID =:ID');
        ParamByName('ID').AsInteger := Self.Codigo;
        //ShowMessage('SQL ' + qry_despesa.SQL.Text + '  ' + INTTOSTR(Codigo));
        Open;
      end;
      if not qry_despesa.IsEmpty then
      begin

        //Carrega dados da pessoas
        lbl_id.Caption            := inttostr( self.Codigo );
        lbl_cadastrado_em.Caption := datetostr( qry_despesa.FieldByName('CADASTRADO_EM').AsDateTime );
        lbl_alterado_em.Caption   := datetostr( qry_despesa.FieldByName('ALTERADO_EM').AsDateTime );
        lbl_numero_pedido.Caption := inttostr( pedido_id );
        dtp_data_contabil.Date    := qry_despesa.fieldbyname('DATA_CONTABIL').AsDateTime ;
        rg_operacao.ItemIndex     := ubiblioteca.SeSenao( qry_despesa.fieldbyname('DEBITO_CREDITO').AsString = 'D', 0,1) ;
        //edt_valor.Text            := ubiblioteca.SeSenao( qry_despesa.fieldbyname('DEBITO_CREDITO').AsString = 'D',formatfloat( '0.00', qry_despesa.fieldbyname('VALOR').AsFloat),formatfloat( '0.00', qry_despesa.fieldbyname('VALOR').AsFloat * -1) );
        edt_valor.Text            := formatfloat( '0.00', qry_despesa.fieldbyname('VALOR').AsFloat);
        mm_obs.Lines.Text         := qry_despesa.fieldbyname('HISTORICO').AsString;

      end
      else
      begin
        ShowMessage('Despesa não encontrada!');

      end;
    finally
      FreeAndNil(qry_despesa);
    end;
  except
    on E : Exception do
       Raise Exception.Create(E.Message + Self.Name + '.prc_ler_dados');
    end;
end;

procedure TfrmComissoesDespesasE.prc_limpar_tela;
begin
  rg_operacao.ItemIndex := -1;
  edt_valor.Text := '';
  mm_obs.Clear;
end;

procedure TfrmComissoesDespesasE.prc_salvar;
begin
  case Self.Operacao of

    // Inclusão
    uTipos.opIncluir :
    begin
      if not fnc_validar then Exit;

      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
      //***
      if fnc_incluir then
      begin
        if Self.Conexao.InTransaction then Self.Conexao.Commit;
        if Application.MessageBox('Deseja continuar incluindo?','Inclusão...',MB_YESNO) = mrYES then
          prc_inicializar
        else
        begin
          ShowMessage('informação gravada com sucesso!');
          ModalResult := mrOk;
        end;
      end
      else
      begin
        ShowMessage('Não foi possível incluir a comissão');
      end;
    end;

    // Alteração
    uTipos.opAlterar :
    begin
      if not fnc_validar then Exit;
      if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
      //***
      if fnc_alterar then
      begin
        if Self.Conexao.InTransaction then Self.Conexao.Commit;
        ModalResult := mrOk;
      end
      else
      begin
        ShowMessage('Não foi possível alterar a comissão');
      end;
    end;

    //Exclusão
    uTipos.opExcluir :
    begin
      if Application.MessageBox('Deseja excluir este registro?','Atenção',MB_OKCANCEL) = mrOK then
      begin
        if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
        if fnc_excluir then
        begin
          if Self.Conexao.InTransaction then Self.Conexao.Commit;
          ModalResult := mrOk;
        end
        else
        begin
          ShowMessage('Não foi possível excluir a comissão');
        end;
      end; // if
    end;
  end;// case

end;

end.
