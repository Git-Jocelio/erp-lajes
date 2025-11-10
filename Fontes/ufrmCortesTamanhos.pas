unit ufrmCortesTamanhos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Comp.DataSet, FireDAC.Comp.Client, ufrmCortesCRUD,
  ufrmCortesProcessamento;

type
  TfrmCortesTamanhos = class(TForm)
    pnl_cabecalho: TPanel;
    btn_fechar: TSpeedButton;
    lbl_titulo: TLabel;
    Image: TImage;
    pnl_separa_topo: TPanel;
    pnl_main: TPanel;
    pnl_rodape: TPanel;
    dbg_tamanhos: TDBGrid;
    Panel1: TPanel;
    btn_gerar_corte: TBitBtn;
    btn_separar: TBitBtn;
    mtb_producao: TFDMemTable;
    mtb_producaoID: TAutoIncField;
    mtb_producaoTAMANHO: TFloatField;
    mtb_producaoQTDE: TIntegerField;
    mtb_producaoALTURA: TStringField;
    ds_producao: TDataSource;
    pnl_botoes: TPanel;
    btn_incluir: TBitBtn;
    btn_alterar: TBitBtn;
    btn_excluir: TBitBtn;
    lbl_qtde_vigas: TLabel;
    lbl_mts_lineares: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbl_qtde_tamanhos: TLabel;
    procedure btn_fecharClick(Sender: TObject);
    procedure mtb_producaoNewRecord(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_alterarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure ds_producaoDataChange(Sender: TObject; Field: TField);
    procedure btn_gerar_corteClick(Sender: TObject);
  private
    procedure prc_somar_qtde_e_metros_lineares;
    { Private declarations }
  public
    { Public declarations }
    altura_trelica : string;
  end;

var
  frmCortesTamanhos: TfrmCortesTamanhos;

implementation

{$R *.dfm}

procedure TfrmCortesTamanhos.btn_incluirClick(Sender: TObject);
begin
  try
    if frmCortesCRUD = nil then
      frmCortesCRUD := TfrmCortesCRUD.Create(application);
    frmCortesCRUD.ShowModal;

    if frmCortesCRUD.confirmado then
    begin
      // validar
      mtb_producao.first;
      if mtb_producao.Locate('tamanho', frmCortesCRUD.tamanho, []) then
      begin
        ShowMessage('Este tamanho de corte já esta na lista.');
        exit;
      end;

      // incluir na grid
      mtb_producao.insert;
      mtb_producaoTAMANHO.AsFloat := frmCortesCRUD.tamanho;
      mtb_producaoQTDE.AsInteger  := frmCortesCRUD.quantidade;
      mtb_producaoALTURA.AsString := frmCortesCRUD.altura_trelica;
      mtb_producao.post;

      prc_somar_qtde_e_metros_lineares;
    end;

  finally
    FreeAndNil(frmCortesCRUD);
  end;

end;

procedure TfrmCortesTamanhos.ds_producaoDataChange(Sender: TObject;
  Field: TField);
begin
  btn_alterar.Enabled := not mtb_producao.IsEmpty;
  btn_excluir.Enabled := not mtb_producao.IsEmpty;
  btn_gerar_corte.Enabled := not mtb_producao.IsEmpty;

end;

procedure TfrmCortesTamanhos.btn_alterarClick(Sender: TObject);
begin
  try
    if frmCortesCRUD = nil then
      frmCortesCRUD := TfrmCortesCRUD.Create(application);

    // editar na tela de crud
    frmCortesCRUD.edt_tamanho.Text    := formatfloat('0.00', mtb_producaoTAMANHO.AsFloat);
    frmCortesCRUD.edt_quantidade.Text := inttostr( mtb_producaoQTDE.AsInteger);

    if mtb_producaoALTURA.AsString = 'H8' THEN frmCortesCRUD.rg_altura.ItemIndex := 0;
    if mtb_producaoALTURA.AsString = 'H12' THEN frmCortesCRUD.rg_altura.ItemIndex := 1;
    if mtb_producaoALTURA.AsString = 'H16' THEN frmCortesCRUD.rg_altura.ItemIndex := 2;
    if mtb_producaoALTURA.AsString = 'H20' THEN frmCortesCRUD.rg_altura.ItemIndex := 3;
    if mtb_producaoALTURA.AsString = 'H25' THEN frmCortesCRUD.rg_altura.ItemIndex := 4;
    if mtb_producaoALTURA.AsString = 'H30' THEN frmCortesCRUD.rg_altura.ItemIndex := 5;

    frmCortesCRUD.ShowModal;

    if frmCortesCRUD.confirmado then
    begin
      // validar
      (*
      mtb_producao.first;
      if mtb_producao.Locate('tamanho', frmCortesCRUD.tamanho, []) then
      begin
        ShowMessage('Este tamanho de corte já esta na lista.');
        exit;
      end;
      *)
      // incluir na grid
      mtb_producao.EDIT;
      mtb_producaoTAMANHO.AsFloat := frmCortesCRUD.tamanho;
      mtb_producaoQTDE.AsInteger  := frmCortesCRUD.quantidade;
      mtb_producaoALTURA.AsString := frmCortesCRUD.altura_trelica;
      mtb_producao.post;

      prc_somar_qtde_e_metros_lineares;

    end;

  finally
    FreeAndNil(frmCortesCRUD);
  end;

end;

procedure TfrmCortesTamanhos.btn_excluirClick(Sender: TObject);
begin
  //perguntar pro usuario
  if MessageDlg('Você deseja exluir este regisro?', mtConfirmation, [mbYes, mbNO], 0) = mrYes then
  begin
   mtb_producao.delete;
   prc_somar_qtde_e_metros_lineares;
  end;



end;

procedure TfrmCortesTamanhos.btn_fecharClick(Sender: TObject);
begin
  close;
end;

procedure TfrmCortesTamanhos.btn_gerar_corteClick(Sender: TObject);
begin
  try
    if frmCortesProcessamento = nil then
      frmCortesProcessamento := TfrmCortesProcessamento.Create(application);
    // transferido da memtable local para o form de processamento
    mtb_producao.First;
    while not mtb_producao.eof do
    begin
      frmCortesProcessamento.mtb_producao.insert;
      frmCortesProcessamento.mtb_producaoQTDE.AsInteger := mtb_producaoQTDE.AsInteger;
      frmCortesProcessamento.mtb_producaoTAMANHO.AsFloat := mtb_producaoTAMANHO.AsFloat;
      frmCortesProcessamento.mtb_producao.post;


      mtb_producao.Next;
    end;
    frmCortesProcessamento.rg_muda_corte.ItemIndex := 1;

    frmCortesProcessamento.ShowModal;
    // voltando do processamento fecha esse form
    close;
  finally
    FreeAndNil(frmCortesProcessamento);
  end;

end;

procedure TfrmCortesTamanhos.prc_somar_qtde_e_metros_lineares;
var
  qtde_vigas: integer;
  metros_leneares : double;
begin
  qtde_vigas:=0;
  metros_leneares :=0;

  mtb_producao.First;
  while not mtb_producao.eof do
  begin
    qtde_vigas :=qtde_vigas + mtb_producaoQTDE.AsInteger;
    metros_leneares := metros_leneares + (mtb_producaoQTDE.AsInteger * mtb_producaoTAMANHO.Asfloat);

    mtb_producao.Next;
  end;

  // atualiza painel
  lbl_qtde_tamanhos.Caption   := inttostr(mtb_producao.RecordCount);
  lbl_qtde_vigas.Caption   := inttostr(qtde_vigas);
  lbl_mts_lineares.Caption := formatfloat('0.00',metros_leneares);

end;

procedure TfrmCortesTamanhos.FormCreate(Sender: TObject);
begin
    altura_trelica := 'H8';

end;

procedure TfrmCortesTamanhos.mtb_producaoNewRecord(DataSet: TDataSet);
begin
  mtb_producaoALTURA.AsString := altura_trelica;
end;

end.
