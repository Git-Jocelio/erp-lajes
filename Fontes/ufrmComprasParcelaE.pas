unit ufrmComprasParcelaE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Vcl.ComCtrls, Vcl.StdCtrls, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Buttons, Vcl.ExtCtrls, unit_funcoes;

type
  TfrmComprasParcelaE = class(TfrmBaseEdicao)
    edt_nr_compra: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_nr_documento: TEdit;
    Label3: TLabel;
    edt_nr_parcela: TEdit;
    Label4: TLabel;
    dtp_vencimento: TDateTimePicker;
    Label5: TLabel;
    edt_valor_parcela: TEdit;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
  private
    Fparcela_id: integer;
    Fdt_vencimento: Tdate;
    Fcompra_id: integer;
    Fvr_documento: double;
    Fnr_documento: string;
    procedure prc_ler_dados;
    function fnc_validar: boolean;
    procedure prc_salvar;
    { Private declarations }
  public
   property compra_id: integer read Fcompra_id write Fcompra_id;
   property parcela_id: integer read Fparcela_id write Fparcela_id;
   property nr_documento: string read Fnr_documento write Fnr_documento;
   property vr_documento: double read Fvr_documento write Fvr_documento;
   property dt_vencimento: Tdate read Fdt_vencimento write Fdt_vencimento;

  end;

var
  frmComprasParcelaE: TfrmComprasParcelaE;

implementation

{$R *.dfm}

procedure TfrmComprasParcelaE.FormShow(Sender: TObject);
begin
  inherited;
  prc_ler_dados;
end;

procedure TfrmComprasParcelaE.prc_ler_dados;
begin
  edt_nr_compra.Text     := inttostr(compra_id);
  edt_nr_documento.Text  := nr_documento;
  edt_nr_parcela.Text    := inttostr(parcela_id);
  edt_valor_parcela.Text := formatfloat('0.00',vr_documento);
  dtp_vencimento.Date    := dt_vencimento;
end;

procedure TfrmComprasParcelaE.btnOkClick(Sender: TObject);
begin
  prc_salvar;

end;

function TfrmComprasParcelaE.fnc_validar: boolean;
begin
  result := false;
  if dtp_vencimento.Date < date then
  begin
    criarmensagem('ERRO', 'INFORME UMA DATA VÁLIDA.');
    dtp_vencimento.SetFocus;
    exit;

  end;
  result := true;
end;

procedure TfrmComprasParcelaE.prc_salvar;
begin
  if fnc_validar then
  begin
    compra_id     := strtoint(edt_nr_compra.Text);
    parcela_id    := strtoint(edt_nr_parcela.Text);
    nr_documento  := edt_nr_documento.Text;
    vr_documento  := strtofloat(edt_valor_parcela.Text);
    dt_vencimento := dtp_vencimento.Date;
    close;
  end;

end;


end.
