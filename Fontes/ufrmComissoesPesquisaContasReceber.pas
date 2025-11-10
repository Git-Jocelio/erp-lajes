unit ufrmComissoesPesquisaContasReceber;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uBiblioteca, Vcl.DBCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids,
  udmConn;

type
  TfrmComissoesPesquisaContasReceber = class(TfrmBaseEdicao)
    Panel1: TPanel;
    Label1: TLabel;
    lbl_nome_vendedor: TLabel;
    gb_data_contabil: TGroupBox;
    Label7: TLabel;
    cb_data_contabil: TCheckBox;
    dtp_data_contabil_ini: TDateTimePicker;
    dtp_data_contabil_fim: TDateTimePicker;
    btnLocalizar: TBitBtn;
    dbn_principal: TDBNavigator;
    dbg_contas_receber: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnFecharClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnLocalizarClick(Sender: TObject);
  private
    Fp_confirmado: boolean;
    Fp_vendedor_id: integer;

    procedure prc_componentes;
    procedure prc_filtrar;

  public

    property p_vendedor_id : integer read Fp_vendedor_id write Fp_vendedor_id;
    property p_confirmado : boolean read Fp_confirmado write Fp_confirmado;

  end;

var
  frmComissoesPesquisaContasReceber: TfrmComissoesPesquisaContasReceber;

implementation

{$R *.dfm}

procedure TfrmComissoesPesquisaContasReceber.btnFecharClick(Sender: TObject);
begin
  p_confirmado := false;
  close;
  //inherited;
end;

procedure TfrmComissoesPesquisaContasReceber.btnLocalizarClick(Sender: TObject);
begin
  inherited;

  if cb_data_contabil.Checked then
  begin

    if dtp_data_contabil_fim.date < dtp_data_contabil_ini.Date then
      ShowMessage('informe uma data válida');

    dtp_data_contabil_fim.SetFocus;

  end;

  prc_filtrar;

end;

procedure TfrmComissoesPesquisaContasReceber.btnOkClick(Sender: TObject);
begin
  p_confirmado := false;

  if dbg_contas_receber.SelectedRows.Count = 0 then
  begin
    ShowMessage('nenhum item selecionado');
    btnLocalizar.SetFocus;
    exit;
  end;


  p_confirmado := true;
  close;
end;

procedure TfrmComissoesPesquisaContasReceber.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 {deixar marcado senão fecha o dataset, procedure heradada}
 // inherited;

end;

procedure TfrmComissoesPesquisaContasReceber.FormCreate(Sender: TObject);
begin
  inherited;

  titulo := 'Pesquisa de débitos do vendedor' ;
  lbl_sub_titulo.Caption := 'Lista todos os débitos aberto do vendedor em um periodo pré-selecionado';

end;

procedure TfrmComissoesPesquisaContasReceber.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;

end;

procedure TfrmComissoesPesquisaContasReceber.prc_componentes;
var
  loQry: TFDQuery;
begin

  {nome do vendedor}
(*  loQry := uBiblioteca.CriaQuery( conexao, 'select * from PESSOAS where ID =:ID', false);
*)
  try
    loqry := TFDQuery.Create(self);
    loQry.Connection := conexao;
    loQry.Close;
    loqry.SQL.Clear;
    loqry.SQL.Add('select * from PESSOAS where ID =:ID');


    loqry.ParamByName('ID').AsInteger := p_vendedor_id;
    loQry.Open;

    lbl_nome_vendedor.Caption := loQry.FieldByName('NOME').AsString;
  finally
    loQry.Close;
    FreeAndNil(loQry);

  end;

  {datas default}
  dtp_data_contabil_ini.Date := date;
  dtp_data_contabil_fim.Date := date;

  btnOk.Enabled := false;

end;

procedure TfrmComissoesPesquisaContasReceber.prc_filtrar;
var
  loSql, condicao : string;
begin

  btnOk.Enabled := false;
  condicao      := '';
  loSql         := '';

  loSql := 'select * from CONTAS_RECEBER where PAGO = ' + QuotedStr('N') + ' and PESSOA_ID =:PESSOA_ID';

  if cb_data_contabil.Checked then
  begin
     condicao := ' and DATA_CONTABIL between :DATA_INI and :DATA_FIM ';
  end;


  loSql := loSql + condicao;
  //  ShowMessage(loSql);
  qry.SQL.Text := loSql;
  {parametros}


  if cb_data_contabil.Checked then
  begin
    qry.ParamByName('DATA_INI').AsDate := dtp_data_contabil_ini.Date;
    qry.ParamByName('DATA_FIM').AsDate := dtp_data_contabil_fim.Date;
  end;

  qry.ParamByName('PESSOA_ID').AsInteger := p_vendedor_id;


  qry.Open;
  //ShowMessage(qry.SQL.Text);
  if qry.IsEmpty then
  begin
    ShowMessage('Nenhum registro encontrado!');
  end
  else
    btnOk.Enabled := true;

end;



end.
