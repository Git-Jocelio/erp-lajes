//*************************************************************
//* Unit BaseGrade (base - ufrmOperadorasTaxas)
//*  Desenvolvida em inicio : 12/12/2020
//*                     fim :
//*  Por : Jocelio G. da Siva
//*  Obrigado meu DEUS por tudo!
//*************************************************************}


unit ufrmBaseGrade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseConexao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, Vcl.Menus, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.DBCtrls, unit_funcoes;

type
  TfrmBaseGrade = class(TfrmBaseConexao)
    ds: TDataSource;
    ToolBar1: TToolBar;
    btnIncluir: TToolButton;
    btnAlterar: TToolButton;
    btnExcluir: TToolButton;
    ToolButton4: TToolButton;
    btnImprimir: TToolButton;
    ToolButton7: TToolButton;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actIncluir: TAction;
    actAlterar: TAction;
    actImprimir: TAction;
    actExcluir: TAction;
    actSair: TAction;
    actPesquisar: TAction;
    btnPesquisar: TToolButton;
    StatusBar: TStatusBar;
    GroupBoxPesquisa: TGroupBox;
    btnLocalizar: TBitBtn;
    actLocalizar: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel5: TPanel;
    DBGrid1: TDBGrid;
    pnl_cabecalho: TPanel;
    btn_fechar: TSpeedButton;
    lbl_titulo: TLabel;
    pnl_separa_topo: TPanel;
    pnl_resultado: TPanel;
    lbl_resultado: TLabel;
    lbl_texto: TLabel;
    edt_consulta: TEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);

    procedure actPesquisarExecute(Sender: TObject);
    procedure actSairExecute(Sender: TObject);

    procedure dsDataChange(Sender: TObject; Field: TField);
    procedure btn_fecharClick(Sender: TObject);
    procedure actAlterarExecute(Sender: TObject);
    procedure edt_consultaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure actIncluirExecute(Sender: TObject);
    procedure actExcluirExecute(Sender: TObject);
  private

    FTabela: string;
    FTitulo: string;
    {sql inicial}
    FsSql  : string;
    NomeCampo : String;
    TipoCampo : TFieldType;


    procedure ControlaBotoes;
  public

    property Tabela : string read FTabela write FTabela;
    property Titulo : string read FTitulo write FTitulo;
    property sSql   : string read FsSql write FsSql;

  end;


implementation

{$R *.dfm}

uses uBiblioteca;

procedure TfrmBaseGrade.actAlterarExecute(Sender: TObject);
begin
  inherited;


  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );

end;

procedure TfrmBaseGrade.actExcluirExecute(Sender: TObject);
begin
  inherited;
  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );

end;

procedure TfrmBaseGrade.actIncluirExecute(Sender: TObject);
begin
  inherited;

  //ajustas as colunas do dbgrid
  prc_ajustar_colunas_grid( DBGrid1 );

  //aumenta o tamanho da linha do ddgrid
  prc_ajusta_tamanho_linha( DBGrid1 );


end;

procedure TfrmBaseGrade.actPesquisarExecute(Sender: TObject);
begin
  inherited;
  if btnPesquisar.Caption = 'Pesquisa >>' then
  begin
    btnPesquisar.Caption := '<< Ocultar Pesquisa';
    GroupBoxPesquisa.Height := 110;

  end
  else
   begin
     btnPesquisar.Caption := 'Pesquisa >>';
     GroupBoxPesquisa.Height := 0;
   end;

end;

procedure TfrmBaseGrade.actSairExecute(Sender: TObject);
begin
  inherited;
  self.close;
end;

procedure TfrmBaseGrade.btn_fecharClick(Sender: TObject);
begin
  inherited;
  self.Close;
end;

procedure TfrmBaseGrade.FormCreate(Sender: TObject);
begin
  inherited;
 // self.Position := poDesigned;


  if ds.DataSet <> nil then
  begin
    sSQL := ( ds.DataSet as TFDQuery ).SQL.text;

    //ordena inicialmente pela coluna numero 1, ou seja, a primeira coluna do dbgrid
    dbgrid1TitleClick( DBGrid1.Columns[1] );

  end;


end;

procedure TfrmBaseGrade.FormShow(Sender: TObject);
begin
  inherited;
  GroupBoxPesquisa.Height := 0;
end;

procedure TfrmBaseGrade.ControlaBotoes;
begin

  btnAlterar.Enabled  := not ds.DataSet.IsEmpty;
  btnExcluir.Enabled  := not ds.DataSet.IsEmpty;
  btnImprimir.Enabled := not ds.DataSet.IsEmpty;
end;



procedure TfrmBaseGrade.DBGrid1TitleClick(Column: TColumn);
var
  Key : Word;

begin
  //quando clica no titulo da coluna do dbgrid muda a ordenação e
  //o campo que a consulta é feita

  //se trocou a coluna de busca entao tem que limpar query e chamar o metodo
  //edt_consultaKeyDown manualmente que é onde a consulta é montada
  if ( NomeCampo <> '' ) and ( NomeCampo <> Column.FieldName ) then
  begin
    edt_consulta.Clear;
    Key := VK_RETURN;
    edt_consultaKeyDown( edt_consulta, Key, [] );
  end;

  //pega o nome do campo dessa coluna
  NomeCampo := Column.FieldName ;
  // pega o tipo do campo da coluna (integer, string, etc)
  TipoCampo := Column.Field.DataType;

  //pinta o titulo da coluna que foi clicada
  prc_pintar_titulo_coluna( DBGrid1, Column );

  //trocar o texto do edt_consulta
  lbl_texto.Caption := 'Digite o(a) '+ uppercase( Column.Title.Caption )+
                       ' que dejesa encontrar e aperte ENTER.';


  if ( not ( ds.DataSet.IsEmpty ) ) then
  begin
    //ao inves de usar o order by, pode ser ordenado usando a propriedade
    // IndexFieldNames nos componentes TFDQuery - :D corresponde ao decrescente
    if ( ds.DataSet as TFDQuery ).IndexFieldNames = Column.FieldName Then
      ( ds.DataSet as TFDQuery ).IndexFieldNames := Column.FieldName + ':D'
    else
      ( ds.DataSet as TFDQuery ).IndexFieldNames := Column.FieldName;

    //apos realizar a ordenação, coloca o cursor no primeiro campo
    ( ds.DataSet as TFDQuery ).First;

    //ajustas as colunas do dbgrid
    prc_ajustar_colunas_grid( DBGrid1 );

    //aumenta o tamanho da linha do ddgrid
    prc_ajusta_tamanho_linha( DBGrid1 );
  end;

end;

procedure TfrmBaseGrade.dsDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  ControlaBotoes;

end;

procedure TfrmBaseGrade.edt_consultaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sWhere,
  sFiltro : String;

begin
  //se for pressionada a tecla enter dentro do edtConsulta
  if ( key = VK_RETURN ) and ( ds.DataSet <> nil ) then
  begin

    //limpa o sql existente na query da ultima consulta realizada
    //e atribui o sql Padrao Salvo na Variavel
    ( ds.DataSet as TFDQuery ).Close;
    ( ds.DataSet as TFDQuery ).SQL.Clear;
    ( ds.DataSet as TFDQuery ).SQL.AddStrings( sSql );

    //remove os caracteres do edt_consulta.text se o campo escolhido for do tipo inteiro
    if ( TipoCampo = ftInteger ) then
      edt_consulta.Text := SomenteNumeros( edt_consulta.Text );

    //se for diferente de vazio tenho que buscar utilizando parametros
    if Trim ( edt_consulta.Text ) <> '' then
    begin
      //testo pra ver se já existe um where no sql (AnsiUpperCase passa pra maiusculo o texto do sql(varias linhas) se fosse uma unica palavra usaria o upperCase)
      if Pos ('WHERE', AnsiUpperCase( ( ds.DataSet as TFDQuery ).SQL.Text ) ) > 0 then
        sWhere := ' AND '
      else
        sWhere :=  ' WHERE ';

      if ( TipoCampo = ftInteger ) or  ( TipoCampo = ftDate ) then
        sFiltro := sWhere + NomeCampo + ' = :TEXTO '
      else
        sFiltro := sWhere + NomeCampo + ' LIKE ''%'' || :TEXTO || ''%''  ';

      //Adiciona o Filtro montado ao sql da query
      ( ds.DataSet as TFDQuery ).SQL.Add ( sFiltro );

      //manda o parametro texto receber o conteudo do edit que deve ser encontrado
      ( ds.DataSet as TFDQuery ).ParamByName('TEXTO').AsString := edt_consulta.Text;
    end;
    // ShowMessage(qry.SQL.text);
    //abre a consulta apos a manipulação do sql
    ( ds.DataSet as TFDQuery ).open;
    ( ds.DataSet as TFDQuery ).IndexFieldNames := NomeCampo;
    ( ds.DataSet as TFDQuery ).First;


    //ajustas as colunas do dbgrid
    prc_ajustar_colunas_grid( DBGrid1 );

    //aumenta o tamanho da linha do ddgrid
    prc_ajusta_tamanho_linha( DBGrid1 );
  end;

  // mensagem para o usuario
  StatusBar.Panels[0].Text := 'Encontrado(s) : ' + inttostr(qry.RecordCount) + ' registro(s)';

end;

end.
