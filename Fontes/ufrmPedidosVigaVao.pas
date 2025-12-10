unit ufrmPedidosVigaVao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, unit_funcoes;

type
  TfrmPedidosVigaVao = class(TfrmBaseConexao)
    pnl_cabecalho: TPanel;
    btn_fechar: TSpeedButton;
    lbl_titulo: TLabel;
    pnl_separa_topo: TPanel;
    pnl_rodape: TPanel;
    pnl_principal: TPanel;
    btn_incluir: TBitBtn;
    btn_fechar2: TBitBtn;
    GroupBox2: TGroupBox;
    edt_menor_viga: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_maior_viga: TEdit;
    Label3: TLabel;
    edt_vao: TEdit;
    dbg_vigas: TDBGrid;
    ds: TDataSource;
    Label4: TLabel;
    edt_local: TEdit;
    btn_calcular: TBitBtn;
    rg_inicio: TRadioGroup;
    rg_arredondamento: TRadioGroup;
    mtb_vigas: TFDMemTable;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_fechar2Click(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure btn_calcularClick(Sender: TObject);
  private
    function fnc_validar: boolean;
    function fnc_ajustar_tamanho(arredondar, tamanho: double): double;
    procedure prc_calcular(arredondar: integer; eixo, menor, maior,
      vao: double);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidosVigaVao: TfrmPedidosVigaVao;

implementation

{$R *.dfm}

function TfrmPedidosVigaVao.fnc_validar:boolean;
begin
 result := false;
 if strtofloatdef( edt_menor_viga.Text,0) <= 0 then
 begin
   criarmensagem('AVISO','Informe um valor válido.');
   edt_menor_viga.SetFocus;
   exit;
 end;

 if strtofloatdef( edt_maior_viga.Text,0) <= 0 then
 begin
   criarmensagem('AVISO','Informe um valor válido.');
   edt_maior_viga.SetFocus;
   exit;
 end;

 if strtofloatdef( edt_maior_viga.Text,0) < strtofloatdef( edt_menor_viga.Text,0) then
 begin
   criarmensagem('AVISO','O maior valor deve ser igual ou maior que o menor valor');
   edt_maior_viga.SetFocus;
   exit;
 end;



 result := true;

end;

procedure TfrmPedidosVigaVao.btn_calcularClick(Sender: TObject);
begin
  inherited;
  if not fnc_validar then exit;
  //prc_calcular();
end;


procedure TfrmPedidosVigaVao.prc_calcular(arredondar: integer; eixo, menor, maior,vao: double);
var

  contador : integer;
  diferenca_maior_menor: double;
  intervalo: double;
  qtde_vigas: integer;
  novo_tamanho : double;
begin
  // diferença entre viga maior e viga menor
  diferenca_maior_menor  := ( maior - menor );

  // qtde de vigas para cobrir o vão
  qtde_vigas := trunc(( vao / eixo));
  contador   := qtde_vigas;

  // intervalo a ser acrescentado em cada viga
  intervalo  := (diferenca_maior_menor/qtde_vigas);

  if rg_inicio.ItemIndex = 0 then
  begin
    // primeira viga sem alteração no tamanho
    mtb_vigas.Append;
    mtb_vigas.FieldByName('quantidade').AsInteger := 1;
    mtb_vigas.FieldByName('tamanho').Asfloat := maior;
    mtb_vigas.Post;
    contador   := contador -1;;

    while qtde_vigas > contador do
    begin
      mtb_vigas.Append;
      mtb_vigas.FieldByName('quantidade').AsInteger := 1;
      novo_tamanho := maior - intervalo;

     // mtb_vigas.FieldByName('tamanho').Asfloat := fnc_ajustar_tamanho(arredondar, novo_tamanho);
      mtb_vigas.Post;

      contador := contador -1;
    end;
  end;

end;

function TfrmPedidosVigaVao.fnc_ajustar_tamanho(arredondar, tamanho:double):double;
var
  comprimento: integer;
  resto: string;
begin
  comprimento := length(floattostr(tamanho));
  resto:= copy( floattostr(tamanho), comprimento-1,comprimento );
  if arredondar = 5 then
  begin
    if strtoint(resto) <=2 then resto:='0'
    else if ((strtoint(resto) >=3) and (strtoint(resto) <=7)) then resto := '5'
    else resto := 'acresta'

  end else
  if arredondar = 10 then
  begin

  end else
  if arredondar = 20 then
  begin

  end;

end;

procedure TfrmPedidosVigaVao.btn_fechar2Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPedidosVigaVao.btn_fecharClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TfrmPedidosVigaVao.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btn_incluir.Enabled := not mtb_vigas.IsEmpty;

end;

end.
