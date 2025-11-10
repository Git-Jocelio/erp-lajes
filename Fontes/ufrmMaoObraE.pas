// 09/03/2024 base frmFornecedoresE
unit ufrmMaoObraE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uTipos, uBiblioteca, Vcl.DBCtrls;

type
  TfrmMaoObraE = class(TfrmBaseEdicao)
    Label1: TLabel;
    lbl_mao_de_obra_id: TLabel;
    Label2: TLabel;
    lbl_Cadastrado_em: TLabel;
    Label4: TLabel;
    lbl_alterado_em: TLabel;
    Label11: TLabel;
    edt_descricao: TEdit;
    Label12: TLabel;
    edt_valor: TEdit;
    Label3: TLabel;
    edt_unidade: TEdit;
    cb_ativo: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure edt_valorKeyPress(Sender: TObject; var Key: Char);
    procedure edt_valorExit(Sender: TObject);
  private
    FOperacao: uTipos.TOperacao;
    FTabela: string;
    FCodigo: integer;
  protected
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;

    function fnc_validar: boolean;
    procedure prc_incluir_alterar;
    procedure prc_salvar;

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
  loForm : TfrmMaoObraE;
begin
  loForm := TfrmMaoObraE.Create(Application);
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
  loForm : TfrmMaoObraE;
begin
  loForm := TfrmMaoObraE.Create(Application);
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
  loForm : TfrmMaoObraE;
begin
  loForm := TfrmMaoObraE.Create(Application);
  try
    loForm.Operacao := uTipos.opExcluir;
    loForm.Codigo   := ACodigo;
    loForm.ShowModal;
  finally
    FreeAndNil(loForm);
  end;
end;



{$R *.dfm}

procedure TfrmMaoObraE.btnOkClick(Sender: TObject);
begin
  inherited;
  if fnc_validar then
  begin
    prc_salvar;
  end;

end;

procedure TfrmMaoObraE.edt_valorExit(Sender: TObject);
begin
  inherited;
  uBiblioteca.prc_formata_dinheiro(sender);
end;

procedure TfrmMaoObraE.edt_valorKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  uBiblioteca.prc_somente_numeros(sender,key);
end;

function TfrmMaoObraE.fnc_validar: boolean;
begin

  result := false;

  if edt_descricao.Text = '' then
  begin
    ShowMessage('Informe o DESCRIÇÃO da mão-de-obra');
    edt_descricao.SetFocus;
    exit;
  end;

  if StrToFloatDef(edt_valor.Text,0) <= 0 then
  begin
    ShowMessage('Informe um VALOR válido');
    edt_valor.SetFocus;
    exit;
  end;

  if edt_unidade.Text = '' then
  begin
    ShowMessage('Informe uma DESCRIÇÃO válida');
    edt_unidade.SetFocus;
    exit;
  end;

  result := true;

end;

procedure TfrmMaoObraE.FormCreate(Sender: TObject);
begin
  inherited;
  self.Tabela := 'MAO_OBRA';
  // titulo do lbl_titulo
  titulo := 'CADASTRO DE MÃO-DE-OBRA';

end;

procedure TfrmMaoObraE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;

end;

procedure TfrmMaoObraE.prc_componentes;
begin
  {qry de pessoas}
  qry.SQL.Add('select * from PESSOAS where ID =:ID');

end;

procedure TfrmMaoObraE.prc_incluir_alterar;
var
  loQry : TFDQuery;
begin
  try
    loQry := TFDQuery.Create(self);
    loQry.Connection := Conexao;

    if operacao = opExcluir then
    begin
      loQry.SQL.Add('update ' + Tabela + ' set ATIVO = ' + QuotedStr('N') + ' where ID =:ID');
      loQry.ParamByName('ID').AsInteger := Codigo;
      loQry.ExecSQL;
      exit;
    end;


    if operacao = OpIncluir then
    begin
      //loQry.SQL.Add('insert into FORNECEDORES ');
      loQry.SQL.Add('insert into ' + tabela );
      loQry.SQL.Add('(                     ');
      loQry.SQL.Add('  ID,                 ');
      loQry.SQL.Add('  CADASTRADO_EM,      ');
      loQry.SQL.Add('  DESCRICAO,          ');
      loQry.SQL.Add('  VALOR,              ');
      loQry.SQL.Add('  UNIDADE,            ');
      loQry.SQL.Add('  ATIVO               ');
      loQry.SQL.Add(')                     ');
      loQry.SQL.Add('VALUES                ');
      loQry.SQL.Add('(                     ');
      loQry.SQL.Add('  :ID,                ');
      loQry.SQL.Add('  :CADASTRADO_EM,     ');
      loQry.SQL.Add('  :DESCRICAO,         ');
      loQry.SQL.Add('  :VALOR,             ');
      loQry.SQL.Add('  :UNIDADE,           ');
      loQry.SQL.Add('  :ATIVO              ');
      loQry.SQL.Add(')                     ');

      Codigo := uBiblioteca.AutoIncremento(conexao, tabela);
      loQry.ParamByName('ID').AsInteger         := Codigo;
      loQry.ParamByName('CADASTRADO_EM').AsDate := date;

    end
    else
    begin
      loQry.SQL.Add('UPDATE                        ');
      loQry.SQL.Add(  tabela                        );
      loQry.SQL.Add('SET                           ');
      loQry.SQL.Add('  ALTERADO_EM = :ALTERADO_EM, ');
      loQry.SQL.Add('  DESCRICAO   = :DESCRICAO,   ');
      loQry.SQL.Add('  VALOR       = :VALOR,       ');
      loQry.SQL.Add('  UNIDADE     = :UNIDADE,     ');
      loQry.SQL.Add('  ATIVO       = :ATIVO        ');
      loQry.SQL.Add('WHERE                         ');
      loQry.SQL.Add('  ID = :ID                    ');

      loQry.ParamByName('ID').AsInteger       := Codigo;
      loQry.ParamByName('ALTERADO_EM').AsDate := date;

    end;
    //ShowMessage(loqry.SQL.text);

    loQry.ParamByName('DESCRICAO').AsString := edt_descricao.Text;
    loQry.ParamByName('VALOR').AsFloat      := strtofloat(edt_valor.Text);
    loQry.ParamByName('UNIDADE').AsString   := edt_unidade.Text;
    loQry.ParamByName('ATIVO').AsString     := SeSenao(cb_ativo.Checked, 'S','N');
    loQry.ExecSQL;
  finally
     FreeAndNil(loQry);
  end;
end;

procedure TfrmMaoObraE.prc_inicializar;
begin
  case self.Operacao of
  uTipos.opIncluir: begin
                       lbl_sub_titulo.Caption    := 'Incluir uma nova MÃO-DE-OBRA';
                       lbl_mao_de_obra_id.Caption := '<NOVO>';
                       lbl_Cadastrado_em.Caption := datetostr(date);
                       btnOk     .Caption        := 'Incluir';
                       qry.Close;
                     end;
  uTipos.opAlterar: begin
                      self.prc_ler_dados;
                      lbl_sub_titulo.Caption   := 'Alterar uma nova MÃO-DE-OBRA';
                       lbl_alterado_em.Caption := datetostr(date);
                      btnOk.Caption            := 'Alterar';
                      //
                      btnOk.SetFocus;
                    end;
  uTipos.opExcluir: begin
                      self.prc_ler_dados;
                      pnDados.Enabled        := false;
                      lbl_sub_titulo.Caption := 'Marcar uma MÃO-DE-OBRA como inativa';
                      btnOk.Caption          := 'Excluir';
                      btnFechar.SetFocus;
                    end;
  else
    begin
      pnDados.Enabled       := false;
      if btnFechar.CanFocus then btnFechar.SetFocus;
    end;
  end;

end;

procedure TfrmMaoObraE.prc_ler_dados;
var
  loQry: TFDQuery;
begin
  try
    loQry:= TFDQuery.Create(self);
    loQry.Connection := conexao;
    loqry.sql.Add('select * from ' + tabela + ' where id = :id');
    loQry.Params.ParamByName('id').AsInteger := Codigo;
    loQry.Open;

    lbl_mao_de_obra_id.Caption := loQry.FieldByName('id').AsString;
    lbl_Cadastrado_em.Caption  := loQry.FieldByName('cadastrado_em').AsString;
    lbl_alterado_em.Caption    := loQry.FieldByName('alterado_em').AsString;
    edt_descricao.Text         := loQry.FieldByName('descricao').AsString;
    edt_valor.Text             := formatfloat('0.00', loQry.FieldByName('valor').Asfloat);
    edt_unidade.Text           := loQry.FieldByName('unidade').AsString;
    cb_ativo.Checked           := ubiblioteca.SeSenao( loQry.FieldByName('ativo').AsString = 'S', true, false);
  finally
    FreeAndNil(loQry)
  end;

end;

procedure TfrmMaoObraE.prc_salvar;
begin
  if not Self.Conexao.InTransaction then Self.Conexao.StartTransaction;
  //***
  try
    prc_incluir_alterar;

    if Self.Conexao.InTransaction then Self.Conexao.Commit;
      ShowMessage('MÃO-DE-OBRA salva com sucesso!');

    ModalResult := mrOk;
  except
    Self.Conexao.Rollback;
    ShowMessage('Não foi possível salvar o registro');

  end;

end;

end.
