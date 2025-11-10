unit ufrmContasPagar_Lancamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, uBiblioteca, Vcl.ComCtrls;

type
  TfrmContasPagar_Lancamentos = class(TfrmBaseEdicao)
    Label32: TLabel;
    Label1: TLabel;
    lbl_id: TLabel;
    Label2: TLabel;
    lbl_cadastrado_em: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    lbl_conta_pagar: TLabel;
    Label7: TLabel;
    lbl_alterado_em: TLabel;
    Label5: TLabel;
    dtp_data_contabil: TDateTimePicker;
    mm_obs: TMemo;
    rg_operacao: TRadioGroup;
    edt_valor: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    FOperacao: uTipos.TOperacao;
    FCodigo: integer;
    Fconta_pagar_id: integer;
    Ftabela: string;
    Fhistorico: string;
    Fvalor: double;
    Fdebito_credito: string;
    Fdata_contabil: TDate;
    Flancamento_confirmado: boolean;

    function  fnc_validar: Boolean;


    procedure prc_salvar;

  protected

    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;
    procedure prc_limpar_tela;

  public

    property Codigo    :integer read FCodigo write FCodigo;
    property Operacao  :uTipos.TOperacao read FOperacao write FOperacao;
    property conta_pagar_id :integer read Fconta_pagar_id write Fconta_pagar_id;
    property tabela :string read Ftabela write Ftabela;

    property debito_credito :string read Fdebito_credito write Fdebito_credito;
    property valor :double read Fvalor write Fvalor;
    property historico :string read Fhistorico write Fhistorico;
    property data_contabil :TDate read Fdata_contabil write Fdata_contabil;

    property lancamento_confirmado :boolean read Flancamento_confirmado write Flancamento_confirmado;

  end;

var
  frmContasPagar_Lancamentos: TfrmContasPagar_Lancamentos;

implementation

{$R *.dfm}



{ TfrmContasPagar_Lancamentos }

procedure TfrmContasPagar_Lancamentos.btnOkClick(Sender: TObject);
begin
  inherited;

  if fnc_validar then
    prc_salvar;

end;


function TfrmContasPagar_Lancamentos.fnc_validar: Boolean;
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


procedure TfrmContasPagar_Lancamentos.FormCreate(Sender: TObject);
begin
  inherited;
  titulo      := 'Lançamentos na contas pagar';

  lancamento_confirmado := false;
end;

procedure TfrmContasPagar_Lancamentos.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmContasPagar_Lancamentos.prc_componentes;
begin

end;

procedure TfrmContasPagar_Lancamentos.prc_inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin

                       {Novo id usuario}
                       lbl_id.Caption := inttostr( Codigo );
                       lbl_conta_pagar.Caption := inttostr( self.codigo );

                       lbl_titulo.Caption        := titulo + pnTitulo.Caption + ' [Incluir]';
                       lbl_sub_titulo.Caption    := ' Incluir outras despesas/crédito dentro de uma conta a pagar ';

                       lbl_cadastrado_em.Caption := datetostr(date);
                       dtp_data_contabil.Date    := date;

                       prc_limpar_tela;
                       btnOk     .Caption := 'Incluir';

                     end;
  uTipos.opAlterar: begin

                      prc_ler_dados;
                      //pnDados.Enabled  := false;
                      lbl_titulo.Caption  := titulo + ' [Alteração]';
                      lbl_sub_titulo.Caption  := 'Alterar outras despesas/crédito dentro de uma conta a pagar ';
                      lbl_alterado_em.Caption := datetostr( date );
                      btnOk.Caption    := 'Alterar';
                      //
                      btnOk.SetFocus;

                    end;
  uTipos.opExcluir: begin

                      prc_ler_dados;
                      lbl_titulo.Caption        := titulo + pnTitulo.Caption + ' [Excluir]';
                      lbl_sub_titulo.Caption    := ' Excluir outras despesas/crédito dentro de uma conta a pagar ';
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

procedure TfrmContasPagar_Lancamentos.prc_ler_dados;
var
  qry_lancamentos : TFDQuery;
begin
  try

    qry_lancamentos := TFDQuery.Create(Self);
    try
      with qry_lancamentos, qry_lancamentos.Sql do
      begin
        Connection := Self.Conexao;
        Add('SELECT * FROM ' + Self.Tabela + ' WHERE ID =:ID');
        ParamByName('ID').AsInteger := Self.Codigo;
        //ShowMessage('SQL ' + qry_despesa.SQL.Text + '  ' + INTTOSTR(Codigo));
        Open;
      end;
      if not qry_lancamentos.IsEmpty then
      begin

        //Carrega dados da pessoas
        lbl_id.Caption            := inttostr( self.Codigo );
        lbl_cadastrado_em.Caption := datetostr( qry_lancamentos.FieldByName('CADASTRADO_EM').AsDateTime );
        lbl_alterado_em.Caption   := datetostr( qry_lancamentos.FieldByName('ALTERADO_EM').AsDateTime );
        lbl_conta_pagar.Caption := inttostr( codigo );
        dtp_data_contabil.Date    := qry_lancamentos.fieldbyname('DATA_CONTABIL').AsDateTime ;
        rg_operacao.ItemIndex     := ubiblioteca.SeSenao( qry_lancamentos.fieldbyname('DEBITO_CREDITO').AsString = 'D', 0,1) ;
        //edt_valor.Text            := ubiblioteca.SeSenao( qry_despesa.fieldbyname('DEBITO_CREDITO').AsString = 'D',formatfloat( '0.00', qry_despesa.fieldbyname('VALOR').AsFloat),formatfloat( '0.00', qry_despesa.fieldbyname('VALOR').AsFloat * -1) );
        edt_valor.Text            := formatfloat( '0.00', qry_lancamentos.fieldbyname('VALOR').AsFloat);
        mm_obs.Lines.Text         := qry_lancamentos.fieldbyname('HISTORICO').AsString;

      end
      else
      begin
        ShowMessage('Despesa não encontrada!');

      end;
    finally
      FreeAndNil(qry_lancamentos);
    end;
  except
    on E : Exception do
       Raise Exception.Create(E.Message + Self.Name + '.prc_ler_dados');
    end;
end;

procedure TfrmContasPagar_Lancamentos.prc_limpar_tela;
begin

end;

procedure TfrmContasPagar_Lancamentos.prc_salvar;
begin
   // carrega as propriedades
   lancamento_confirmado := true;
   debito_credito:= SeSenao(rg_operacao.ItemIndex = 0, 'D','C');
   valor := StrToFloat(edt_valor.Text);
   historico := mm_obs.Lines.Text;
   data_contabil :=dtp_data_contabil.Date;
   close;
end;





end.
