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
    mtb_lista_de_vigas: TFDMemTable;
    mtb_lista_de_vigasQUANTIDADE: TIntegerField;
    mtb_lista_de_vigasTAMANHO_REAL: TFloatField;
    mtb_lista_de_vigasTAMANHO_AJUSTADO: TFloatField;
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_fechar2Click(Sender: TObject);
    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure btn_calcularClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    Fvao: string;
    function fnc_validar: boolean;
    function fnc_ajustar_tamanho(arredondar, tamanho: double): double;
    procedure prc_calcular(arredondar: integer; eixo, menor, maior, vao: double);
    function GetListaVigas: TFDMemTable;
    { Private declarations }

  public
     property vao: string read Fvao write fvao;
     property ListaVigas: TFDMemTable read GetListaVigas;
  end;

//var
 // frmPedidosVigaVao: TfrmPedidosVigaVao;

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

procedure TfrmPedidosVigaVao.FormCreate(Sender: TObject);
begin
  inherited;
  mtb_lista_de_vigas.Active:= true
end;

function TfrmPedidosVigaVao.GetListaVigas: TFDMemTable;
begin
  Result := mtb_lista_de_vigas;
end;

procedure TfrmPedidosVigaVao.btn_calcularClick(Sender: TObject);
var
  arredondar_a_cada: integer;
begin
  inherited;
  arredondar_a_cada := 0;
  if not fnc_validar then exit;
  if rg_arredondamento.ItemIndex = 0  then arredondar_a_cada := 5;
  if rg_arredondamento.ItemIndex = 1  then arredondar_a_cada := 10;
  if rg_arredondamento.ItemIndex = 2  then arredondar_a_cada := 20;

  prc_calcular(arredondar_a_cada, 0.43, strtofloat(edt_menor_viga.Text),
               strtofloat(edt_maior_viga.Text), strtofloat(edt_vao.Text));

 ShowMessage('FIM')   ;
end;


procedure TfrmPedidosVigaVao.prc_calcular(arredondar: integer; eixo, menor, maior,vao: double);
var

  contador : integer;
  diferenca_maior_menor: double;
  intervalo: double;
  qtde_vigas: integer;
begin
  mtb_lista_de_vigas.Close; mtb_lista_de_vigas.Open;

  // diferença entre viga maior e viga menor
  diferenca_maior_menor  := ( maior - menor );
  // qtde de vigas para cobrir o vão
  qtde_vigas := trunc(( vao / eixo));
  contador   := 0;

  // intervalo a ser acrescentado em cada viga
  intervalo  := (diferenca_maior_menor/qtde_vigas);
  // iniciar mntagem com viga
  if rg_inicio.ItemIndex = 0 then
  begin
    // primeira viga sem alteração no tamanho
    mtb_lista_de_vigas.Append;
    mtb_lista_de_vigas.FieldByName('quantidade').AsInteger := 1;
    mtb_lista_de_vigas.FieldByName('tamanho_real').Asfloat := maior;
    mtb_lista_de_vigas.FieldByName('tamanho_ajustado').Asfloat := maior;
    mtb_lista_de_vigas.Post;

    while qtde_vigas > contador do
    begin
      mtb_lista_de_vigas.Append;
      mtb_lista_de_vigas.FieldByName('quantidade').AsInteger := 1;
      //novo_tamanho := maior - intervalo;
      maior := maior - intervalo;

      mtb_lista_de_vigas.FieldByName('tamanho_real').Asfloat := maior;
      mtb_lista_de_vigas.FieldByName('tamanho_ajustado').Asfloat := fnc_ajustar_tamanho(arredondar, maior);
      //mtb_vigas.FieldByName('tamanho').Asfloat := maior;
      mtb_lista_de_vigas.Post;

      contador := contador +1;
    end;
  end;

end;

function TfrmPedidosVigaVao.fnc_ajustar_tamanho(arredondar, tamanho:double):double;
var
  tamanho_x_10: double;
  tamanho_truncado: double;
  unidade : integer;
begin
  result :=0;

  //arredondar a cada 5 cm
  if arredondar = 5 then
  begin

     tamanho_x_10 := tamanho *10;
     tamanho_truncado := trunc(tamanho_x_10);
     unidade := trunc((tamanho_x_10 - tamanho_truncado)*10);

     if unidade <=2 then begin ShowMessage('unid <=2 '); result := (tamanho_truncado/10); end;
     if ((unidade >=3) and (unidade <=7)) then begin ShowMessage('unid 3 a 7 '); result := (tamanho_truncado/10) +0.05; end;
     if unidade >=8 then begin ShowMessage('unid 8 e 9 '); result := (tamanho_truncado +1) /10; end

  end else
  if arredondar = 10 then
  begin

     tamanho_x_10 := tamanho *10;
     tamanho_truncado := trunc(tamanho_x_10);
     unidade := trunc((tamanho_x_10 - tamanho_truncado)*10);

     if unidade <=2 then result := (tamanho_truncado/10);
     if ((unidade >=3) and (unidade <=7)) then result := (tamanho_truncado/10) +0.10;
     if unidade >=8 then result := (tamanho_truncado +1) /10;

  end else
  if arredondar = 20 then
  begin

     tamanho_truncado := trunc(tamanho); // 5,05 vira 5
     unidade := trunc((tamanho - tamanho_truncado)*100); // 0,05 vira 5

     if (unidade <=9 ) then result := tamanho_truncado;
     if ((unidade >=10) and (unidade <=20)) then result := tamanho_truncado  + 0.2;
     if ((unidade >=21) and (unidade <=25)) then result := tamanho_truncado  + 0.2;
     if ((unidade >=26) and (unidade <=40)) then result := tamanho_truncado  + 0.4;
     if ((unidade >=41) and (unidade <=45)) then result := tamanho_truncado  + 0.4;
     if ((unidade >=46) and (unidade <=60)) then result := tamanho_truncado  + 0.6;
     if ((unidade >=61) and (unidade <=65)) then result := tamanho_truncado  + 0.6;
     if ((unidade >=66) and (unidade <=80)) then result := tamanho_truncado  + 0.8;
     if ((unidade >=81) and (unidade <=85)) then result := tamanho_truncado  + 0.8;
     if (unidade >=86) then result := tamanho_truncado  + 1;

  end;

end;

procedure TfrmPedidosVigaVao.btn_fechar2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmPedidosVigaVao.btn_fecharClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmPedidosVigaVao.btn_incluirClick(Sender: TObject);
begin
  inherited;
  if not mtb_lista_de_vigas.IsEmpty then
  begin
    vao := edt_vao.text;
    ModalResult := mrOk;
  end
  else
    ModalResult := mrCancel;
end;

procedure TfrmPedidosVigaVao.dsDataChange(Sender: TObject; Field: TField);
begin
//  btn_incluir.Enabled := not mtb_lista_de_vigas.IsEmpty;
end;

end.
