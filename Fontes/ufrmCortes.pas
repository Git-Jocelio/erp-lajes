unit ufrmCortes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Buttons, ufrmCortesTamanhos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.FB, FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, Data.DB,
  FireDAC.Comp.Client;

type
  TfrmCortes = class(TForm)
    PageControl1: TPageControl;
    tbs_inicial: TTabSheet;
    pnl_fundo_inicio: TPanel;
    tbs_resultados: TTabSheet;
    pnl_cabecalho: TPanel;
    btn_fechar: TSpeedButton;
    lbl_titulo: TLabel;
    pnl_separa_topo: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    lbl_corte_manual: TLabel;
    lbl_corte_pedido: TLabel;
    Image: TImage;
    procedure btn_fecharClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lbl_corte_manualMouseEnter(Sender: TObject);
    procedure lbl_corte_manualMouseLeave(Sender: TObject);
    procedure lbl_corte_pedidoMouseEnter(Sender: TObject);
    procedure lbl_corte_pedidoMouseLeave(Sender: TObject);
    procedure lbl_corte_manualClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    procedure prc_componenetes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCortes: TfrmCortes;

implementation

{$R *.dfm}

procedure TfrmCortes.btn_fecharClick(Sender: TObject);
begin
  close;
end;


procedure TfrmCortes.FormActivate(Sender: TObject);
begin (*
  try
    FDConnection.Connected := true
  except
    ShowMessage('Erro ao tentar conectar ao banco de dados!.' + #13 + #13
                + 'Informe o local do banco de dados ou contate o desenvolvedor.');
    btn_endereco.Click;
  end;
  *)
end;

procedure TfrmCortes.FormShow(Sender: TObject);
var
  hoje, vencimento :string;
begin



  prc_componenetes;
 (*
  vencimento := '09/11/2025';
  hoje := datetostr(now);

  if  strtodate(hoje) > strtodate(vencimento) then
  begin
    ShowMessage('Entre em contato com o desenvolvedor.');
    application.Terminate;
  end;
 *)
end;

procedure TfrmCortes.lbl_corte_manualClick(Sender: TObject);
begin
  try
    if frmCortesTamanhos = nil then
      frmCortesTamanhos := TfrmCortesTamanhos.Create(application);

    frmCortesTamanhos.ShowModal;
  finally
    FreeAndNil(frmCortesTamanhos);
  end;
end;

procedure TfrmCortes.lbl_corte_manualMouseEnter(Sender: TObject);
begin

  lbl_corte_manual.Font.Size  := 10;
  lbl_corte_manual.Font.Color := clblue;

end;

procedure TfrmCortes.lbl_corte_manualMouseLeave(Sender: TObject);
begin

  lbl_corte_manual.Font.Size  := 9;
  lbl_corte_manual.Font.Color := clBlack;

end;

procedure TfrmCortes.lbl_corte_pedidoMouseEnter(Sender: TObject);
begin

  lbl_corte_pedido.Font.Size  := 10;
  lbl_corte_pedido.Font.Color := clblue;

end;

procedure TfrmCortes.lbl_corte_pedidoMouseLeave(Sender: TObject);
begin

  lbl_corte_pedido.Font.Size  := 9;
  lbl_corte_pedido.Font.Color := clBlack;

end;

procedure TfrmCortes.prc_componenetes;
begin
  tbs_inicial.TabVisible    := true;
  tbs_resultados.TabVisible := False;
end;

end.
