unit ufrmCategorias;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, ufrmProdutosLajes, ufrmProdutosLajotas,
  ufrmProdutoTrelica;

type
  TDBGridCracker = class(TDBGrid); // Permite acessar propriedades protegidas
  TfrmCategorias = class(TfrmBaseConexao)
    pnl_topo: TPanel;
    Label1: TLabel;
    ds_categoria: TDataSource;
    DBGrid1: TDBGrid;
    GroupBox1: TGroupBox;
    lbl_mensagem: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure ds_categoriaDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    { Private declarations }
  private
    procedure prc_abrir_formulario(formulario: string);
  public
    procedure prc_componentes;
  end;

var
  frmCategorias: TfrmCategorias;

implementation

{$R *.dfm}

uses ufrmProdutosVigas,  ufrmProdutosAdicional, ufrmProdutos,
  ufrmProdutosBomba, ufrmProdutosConcreto, ufrmProdutosEps;



procedure TfrmCategorias.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  prc_abrir_formulario(qry.FieldByName('FORMULARIO').Value);
end;

procedure TfrmCategorias.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

  // Se a linha for a ativa (onde o mouse "pousou"), destaca em laranja
  if (gdSelected in State) or (gdFocused in State) then
  begin
    // Um tom "mais leve" que o preto (Cinza grafite)
    DBGrid1.Canvas.Brush.Color := clBlack;
    DBGrid1.Canvas.Font.Color := $0000A5FF; // Laranja
    DBGrid1.Canvas.Font.Style := [fsBold];
  end
  else
  begin
    // Estilo padrão para as demais linhas
    DBGrid1.Canvas.Brush.Color := $002A2A2A;
    DBGrid1.Canvas.Font.Color := clWhite;
    DBGrid1.Canvas.Font.Style := [];
  end;
  DBGrid1.Canvas.FillRect(Rect);
  DBGrid1.Canvas.TextOut(Rect.Left + 2, Rect.Top + 2, Column.Field.AsString);


end;

procedure TfrmCategorias.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  prc_abrir_formulario(qry.FieldByName('FORMULARIO').Value);
end;

procedure TfrmCategorias.DBGrid1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  gc: TGridCoord;
begin
  gc := DBGrid1.MouseCoord(X, Y);
  // gc.Y = 0 é o título/cabeçalho. Só agimos se for > 0
  if (gc.Y > 0) then
  begin
    // Move o ponteiro do banco de dados
    DBGrid1.DataSource.DataSet.MoveBy(gc.Y - TDBGridCracker(DBGrid1).Row);
    // FORÇA o Grid a se pintar novamente na hora
    DBGrid1.Invalidate;
  end;
end;

procedure TfrmCategorias.ds_categoriaDataChange(Sender: TObject; Field: TField);
begin
  lbl_mensagem.Caption := qry.FieldByName('DESCRICAO').Value;
end;

procedure TfrmCategorias.FormCreate(Sender: TObject);
var
  Rgn: HRGN;
begin
  inherited;
  // Cria uma região arredondada (0, 0 até Largura, Altura)
  // O 20, 20 no final define o nível de arredondamento (quanto maior, mais redondo)
  Rgn := CreateRoundRectRgn(0, 0, Width, Height, 20, 20);
  // Aplica a região ao formulário
  SetWindowRgn(Handle, Rgn, True);
end;


procedure TfrmCategorias.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
end;

procedure TfrmCategorias.prc_componentes;
begin
  qry.Active := true;
end;

procedure TfrmCategorias.prc_abrir_formulario(formulario: string);
begin

  frmCategorias.Hide;

  if formulario = 'ADICIONAL' then
  begin
    ufrmProdutosAdicional.executa(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'BOMBA' then
  begin
     ufrmProdutosBomba.executa(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'CONCRETO' then
  begin
     ufrmProdutosConcreto.execute(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'ISOPOR' then
  begin
     ufrmProdutosEps.executa(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'LAJE' then
  begin
     ufrmProdutosLajes.executa(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'LAJOTA' then
  begin
     ufrmProdutosLajotas.executa(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'REVENDA' then
  begin
     ufrmProdutos.executa(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'TRELICA' then
  begin
     ufrmProdutoTrelica.executa(qry.FieldByName('ID').AsInteger);
  end;

  if formulario = 'VIGA' then
  begin
    if frmProdutosVigas = nil then
      frmProdutosVigas := TfrmProdutosVigas.Create(Application);
    frmProdutosVigas.departamento_id := qry.FieldByName('ID').AsInteger;

    frmProdutosVigas.top := 90;
    frmProdutosVigas.Left:= 185;

    frmProdutosVigas.Show;
  end;





end;



end.
