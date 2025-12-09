unit ufrmPequisa_vigas_vendidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, udmConn, Vcl.Mask,
  Vcl.DBCtrls, frxClass, frxDBSet, unit_funcoes;

type
  TfrmPequisa_vigas_vendidas = class(TfrmBaseEdicao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    dtp_entrega_ini: TDateTimePicker;
    dtp_entrega_fim: TDateTimePicker;
    GroupBox3: TGroupBox;
    cbxSituacao: TComboBox;
    dbg_vigas: TDBGrid;
    qryPRODUTO_ID: TIntegerField;
    qryNOME_FANTASIA: TStringField;
    qryTOTAL_QTDE: TLargeintField;
    qryMETRO_LINEARES: TFMTBCDField;
    btn_fechar: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ds_grupo: TDataSource;
    qry_grupo: TFDQuery;
    qry_grupoFORMA_MEDIDA: TIntegerField;
    qry_grupoTRELICA_ALTURA: TIntegerField;
    qry_grupoTOTAL_QTDE: TLargeintField;
    qry_grupoMTS_LINEARES: TLargeintField;
    ds_totais: TDataSource;
    qry_totais: TFDQuery;
    qry_totaisTOTAL_MTS_LINEARES: TLargeintField;
    Label7: TLabel;
    edt_total_geral: TDBEdit;
    dbg_grupos: TDBGrid;
    Label4: TLabel;
    btn_pesquisar: TBitBtn;
    frxReport: TfrxReport;
    frxDBVigas: TfrxDBDataset;
    frxDBGrupo: TfrxDBDataset;
    frxDBTotal: TfrxDBDataset;
    procedure FormCreate(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_pesquisarClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
  private
    function fnc_validar: boolean;
    function fnc_sql_vigas(condicao: string): string;
    function fnc_sql_grupo(condicao: string): string;
    function fnc_sql_total(condicao: string): string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPequisa_vigas_vendidas: TfrmPequisa_vigas_vendidas;
implementation

{$R *.dfm}

procedure TfrmPequisa_vigas_vendidas.btn_pesquisarClick(Sender: TObject);
begin
  inherited;

  if not fnc_validar then exit;

  //muda o sql conforme situação do pedido
  if cbxSituacao.Text <> '< Todos >' then
  begin
    qry.SQL.Clear;
    qry.SQL.Add( fnc_sql_vigas('=') );

    qry_grupo.SQL.Clear;
    qry_grupo.SQL.Add( fnc_sql_grupo('=') );

    qry_totais.SQL.Clear;
    qry_totais.SQL.Add( fnc_sql_total('=') );
  end else
  if cbxSituacao.Text = '< Todos >' then
  begin
    qry.SQL.Clear;
    //qry.SQL.Add(sql_qry_vigas_todos);
    qry.SQL.Add( fnc_sql_vigas('<>') );

    qry_grupo.SQL.Clear;
    qry_grupo.SQL.Add( fnc_sql_grupo('<>') );

    qry_totais.SQL.Clear;
    qry_totais.SQL.Add( fnc_sql_total('<>') );

  end;
  // passa os parametros e abre as pesquisas
  // LISTA VIGAS
  qry.Close;
  qry.ParamByName('DATA_INICIO').AsDate := dtp_entrega_ini.Date;
  qry.ParamByName('DATA_FIM').AsDate := dtp_entrega_fim.Date;
  qry.ParamByName('SITUACAO_PEDIDO').AsString := cbxSituacao.Text;
  qry.Open;

  // não achou nada, cai fora!
  if qry.IsEmpty then
  begin
    CriarMensagem('AVISO','Nenhum registro encontrado para os parâmetros fornecidos.' + slinebreak +
                  'Informe novos parâmetros e tente novamente');
    exit;

  end;

  // AGRUPA POR FORMA E ALTURA
  qry_grupo.Close;
  qry_grupo.ParamByName('DATA_INICIO').AsDate := dtp_entrega_ini.Date;
  qry_grupo.ParamByName('DATA_FIM').AsDate := dtp_entrega_fim.Date;
  qry_grupo.ParamByName('SITUACAO_PEDIDO').AsString := cbxSituacao.Text;
  qry_grupo.Open;

  // TOTAL GERAL
  qry_totais.Close;
  qry_totais.ParamByName('DATA_INICIO').AsDate := dtp_entrega_ini.Date;
  qry_totais.ParamByName('DATA_FIM').AsDate := dtp_entrega_fim.Date;

  qry_totais.ParamByName('SITUACAO_PEDIDO').AsString := cbxSituacao.Text;
  qry_totais.Open;

end;

function TfrmPequisa_vigas_vendidas.fnc_validar():boolean;
begin
  Result := false;
  if cbxSituacao.Text = '' then
  begin
    CriarMensagem('AVISO','Informe a situação do pedido');
    cbxSituacao.SetFocus;
    exit;
  end;

  if dtp_entrega_ini.Date > dtp_entrega_fim.date then
  begin
    CriarMensagem('AVISO','Informe um periodo válido. A data final tem que ser igual ou maior que a inicial ');
    dtp_entrega_ini.SetFocus;
    exit;
  end;

  result := true;
end;

procedure TfrmPequisa_vigas_vendidas.btnOkClick(Sender: TObject);
begin
  inherited;
  frxReport.Variables['DATA_INICIO'] := QuotedStr(FormatDateTime('dd/MM/yyyy', dtp_entrega_ini.Date));
  frxReport.Variables['DATA_FIM']    := QuotedStr(FormatDateTime('dd/MM/yyyy', dtp_entrega_fim.Date));
  frxReport.Variables['SITUACAO_PEDIDO'] := QuotedStr(cbxSituacao.Text);
  frxReport.ShowReport();
end;

procedure TfrmPequisa_vigas_vendidas.btn_fecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPequisa_vigas_vendidas.dsDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  btnOk.Enabled := not qry.IsEmpty;
end;

function TfrmPequisa_vigas_vendidas.fnc_sql_grupo(condicao: string): string;
begin

  result :=
      'SELECT                                                                ' +
      '    pv.FORMA_MEDIDA,                                                  ' +
      '    pv.TRELICA_ALTURA,                                                ' +
      '    SUM(pil.QTDE) AS TOTAL_QTDE,                                      ' +
      '    SUM(pil.QTDE * COALESCE(pv.COMPRIMENTO, 2))/1000 AS MTS_LINEARES  ' +
      'FROM PEDIDOS p                                                        ' +
      'JOIN PEDIDOS_ITENS_LAJE pil ON p.ID = pil.PEDIDO_ID                   ' +
      'JOIN PRODUTOS pr ON pr.ID = pil.PRODUTO_ID                            ' +
      'JOIN PRODUTOS_VIGAS pv ON pv.PRODUTO_ID = pr.ID                       ' +
      'WHERE p.DATA_EMISSAO BETWEEN :DATA_INICIO AND :DATA_FIM               ' +
      '  AND p.ORCAMENTO =' + quotedstr('N') +
      '  AND p.SITUACAO ' + condicao + ' :SITUACAO_PEDIDO                    ' +
      '  AND pr.VIGA =' + quotedstr('S') +
      'GROUP BY pv.FORMA_MEDIDA, pv.TRELICA_ALTURA                           ' +
      'ORDER BY pv.FORMA_MEDIDA, pv.TRELICA_ALTURA';

end;

function TfrmPequisa_vigas_vendidas.fnc_sql_total(condicao: string): string;
begin

  result :=
      'SELECT SUM(MTS_LINEARES) AS TOTAL_MTS_LINEARES                               ' +
      'FROM (                                                                       ' +
      '    SELECT SUM(pil.QTDE * COALESCE(pv.COMPRIMENTO, 2))/1000 AS MTS_LINEARES  ' +
      '    FROM PEDIDOS p                                                           ' +
      '    JOIN PEDIDOS_ITENS_LAJE pil ON p.ID = pil.PEDIDO_ID                      ' +
      '    JOIN PRODUTOS pr ON pr.ID = pil.PRODUTO_ID                               ' +
      '    JOIN PRODUTOS_VIGAS pv ON pv.PRODUTO_ID = pr.ID                          ' +
      '    WHERE p.DATA_EMISSAO BETWEEN :DATA_INICIO AND :DATA_FIM                  ' +
      '      AND p.ORCAMENTO =' + quotedstr('N') +
      '      AND p.SITUACAO '+ condicao +' :SITUACAO_PEDIDO                         ' +
      '      AND pr.VIGA =' + quotedstr('S') +
      '    GROUP BY pv.FORMA_MEDIDA, pv.TRELICA_ALTURA                              ' +
      ') AS T';

end;

function TfrmPequisa_vigas_vendidas.fnc_sql_vigas(condicao:string): string;
begin
   result :=
      'SELECT                                                        ' +
      '  pil.PRODUTO_ID,                                             ' +
      '  pr.nome_fantasia,                                           ' +
      '  SUM(pil.QTDE) AS TOTAL_QTDE,                                ' +
      '  CAST(                                                       ' +
      '    SUM( pil.QTDE * ( COALESCE(pv.COMPRIMENTO,0) / 1000.0 ) ) ' +
      '    AS DECIMAL(15,2)                                          ' +
      '  ) AS METRO_LINEARES                                         ' +
      'FROM PEDIDOS p                                                ' +
      'JOIN PEDIDOS_ITENS_LAJE pil ON p.ID = pil.PEDIDO_ID           ' +
      'JOIN PRODUTOS pr ON pr.ID = pil.PRODUTO_ID                    ' +
      'JOIN PRODUTOS_VIGAS pv ON pv.PRODUTO_ID = pr.ID               ' +
      'WHERE p.DATA_EMISSAO BETWEEN :DATA_INICIO AND :DATA_FIM       ' +
      '  AND p.ORCAMENTO =' + quotedstr('N') +
      '  AND p.SITUACAO '+ condicao + ' :SITUACAO_PEDIDO             ' +
      '  AND pr.VIGA =' + quotedstr('S') +
      'GROUP BY pil.PRODUTO_ID, pr.nome_fantasia                     ' +
      'ORDER BY pr.nome_fantasia;                                    ' ;

end;

procedure TfrmPequisa_vigas_vendidas.FormCreate(Sender: TObject);
begin
  inherited;
  titulo := 'PESQUISA DE VIGAS VENDIDAS ' ;

  // datas iniciais
  dtp_entrega_ini.Date := date;
  dtp_entrega_fim.Date := date;

end;



end.
