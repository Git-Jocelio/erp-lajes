unit ufrmPesquisaChequeCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids, udmConn;

type
  TfrmPesquisaChequeCliente = class(TfrmBaseEdicao)
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    pnl_resultado: TPanel;
    lbl_resultado: TLabel;
    btn_fechar: TSpeedButton;
    qryPESSOA_ID: TIntegerField;
    qryID: TIntegerField;
    qryCADASTRADO_EM: TDateField;
    qryNOME_CORRENTISTA: TStringField;
    qryNOME_BANCO: TStringField;
    qryNR_AGENCIA: TStringField;
    qryNR_CONTA: TStringField;
    qryNR_CHEQUE: TStringField;
    qryVALOR: TFMTBCDField;
    qryPRE_DATADO_PARA: TDateField;
    qryHISTORICO: TStringField;
    qryREPASSADO: TStringField;
    qryCORRENTISTA_ID: TIntegerField;
    procedure FormShow(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    Fp_confirmado: boolean;
    Fp_id: integer;
    Fp_correntista_id: integer;
    Fp_nm_banco: string;
    Fp_conta: string;
    Fp_agencia: string;
    Fp_nr_cheque: string;
    Fp_data: TDate;
    Fp_historico: string;
    Fp_valor: double;
    { Private declarations }
  public
    property p_id : integer read Fp_id write Fp_id;
    property p_correntista_id : integer read Fp_correntista_id write Fp_correntista_id;
    property p_nm_banco : string read Fp_nm_banco write Fp_nm_banco;
    property p_agencia : string read Fp_agencia write Fp_agencia;
    property p_conta : string read Fp_conta write Fp_conta;
    property p_nr_cheque : string read Fp_nr_cheque write Fp_nr_cheque;
    property p_valor: double read Fp_valor write Fp_valor;
    property p_data : TDate read Fp_data write Fp_data;
    property p_historico : string read Fp_historico write Fp_historico;

    property p_confirmado : boolean read Fp_confirmado write Fp_confirmado;

    procedure prc_componenetes;
  end;

var
  frmPesquisaChequeCliente: TfrmPesquisaChequeCliente;

implementation

{$R *.dfm}

{ TfrmPesquisaChequeCliente }

procedure TfrmPesquisaChequeCliente.btnOkClick(Sender: TObject);
begin
  inherited;
  if not QRY.IsEmpty then
  begin
    p_id        := qry.FieldByName('ID').AsInteger;
    p_nm_banco  := qry.FieldByName('NOME_BANCO').AsString;
    p_agencia   := qry.FieldByName('nr_agencia').AsString;
    p_conta     := qry.FieldByName('nr_conta').AsString;
    p_nr_cheque := qry.FieldByName('NR_CHEQUE').AsString;
    p_valor     := qry.FieldByName('valor').AsFloat;
    p_data      := qry.FieldByName('pre_datado_para').AsDateTime;
    p_historico := qry.FieldByName('historico').AsString;
    p_correntista_id := qry.FieldByName('correntista_id').AsInteger;
    p_confirmado     := true;
  end;
  close;
end;

procedure TfrmPesquisaChequeCliente.btn_fecharClick(Sender: TObject);
begin
  inherited;
  CLOSE;
end;

procedure TfrmPesquisaChequeCliente.FormCreate(Sender: TObject);
begin
  inherited;
  titulo := 'CHEQUES DE CLIENTES EM CARTEIRA';
  p_confirmado := false;
end;

procedure TfrmPesquisaChequeCliente.FormShow(Sender: TObject);
begin
  inherited;
  prc_componenetes;
end;

procedure TfrmPesquisaChequeCliente.prc_componenetes;
begin
   lbl_sub_titulo.Caption := 'Lista de cheques de clientes em carteira';

   qry.Close;
   qry.ParamByName('REPASSADO').AsString := 'N';
   QRY.Open;
end;

end.
