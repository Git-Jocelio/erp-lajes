unit ufrmPequisa_vigas_vendidas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Grids, Vcl.DBGrids, udmConn, Vcl.Mask,
  Vcl.DBCtrls;

type
  TfrmPequisa_vigas_vendidas = class(TfrmBaseEdicao)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    dtp_entrega_ini: TDateTimePicker;
    dtp_entrega_fim: TDateTimePicker;
    GroupBox3: TGroupBox;
    cbxSituacao: TComboBox;
    DBGrid1: TDBGrid;
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
    DBEdit4: TDBEdit;
    DBGrid2: TDBGrid;
    Label4: TLabel;
    procedure btnOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPequisa_vigas_vendidas: TfrmPequisa_vigas_vendidas;

implementation

{$R *.dfm}

procedure TfrmPequisa_vigas_vendidas.btnOkClick(Sender: TObject);
begin
  inherited;
  // LISTA VIGAS
  qry.Close;
  qry.ParamByName('DATA_INICIO').AsDate := dtp_entrega_ini.Date;
  qry.ParamByName('DATA_FIM').AsDate := dtp_entrega_fim.Date;

  qry.ParamByName('SITUACAO_PEDIDO').AsString := cbxSituacao.Text;
  qry.Open;

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

procedure TfrmPequisa_vigas_vendidas.btn_fecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPequisa_vigas_vendidas.FormCreate(Sender: TObject);
begin
  inherited;
  titulo := 'PESQUISA DE VIGAS VENDIDAS ' ;

  dtp_entrega_ini.Date := date;
  dtp_entrega_fim.Date := date;

end;

end.
