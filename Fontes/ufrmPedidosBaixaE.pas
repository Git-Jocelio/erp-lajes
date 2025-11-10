unit ufrmPedidosBaixaE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseEdicao, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmPedidosBaixaE = class(TfrmBaseEdicao)
    DBGrid1: TDBGrid;
    dsItens: TDataSource;
    mtb_pedido_itens: TFDMemTable;
    mtb_pedido_itensID: TIntegerField;
    mtb_pedido_itensITEM: TIntegerField;
    mtb_pedido_itensNOME_FANTASIA: TStringField;
    mtb_pedido_itensQTDE: TFloatField;
    mtb_pedido_itensUNIDADE: TStringField;
    pnl_situacao: TPanel;
    pnl_situacao_topo: TPanel;
    rg_opcao: TRadioGroup;
    btn_confirma: TButton;
    btn_cancelar: TButton;
    mtb_pedido_itensSITUACAO_ATUAL: TStringField;
    mtb_pedido_itensSITUACAO_NOVA: TStringField;
    Label6: TLabel;
    Panel1: TPanel;
    DBText1: TDBText;
    Label1: TLabel;
    Label2: TLabel;
    DBText2: TDBText;
    Label3: TLabel;
    DBText3: TDBText;
    Label4: TLabel;
    Label5: TLabel;
    dtp_data_entrega: TDateTimePicker;
    pnl_titulo_itens: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    DBText4: TDBText;
    mtb_pedido_itensIDPRODUTO: TIntegerField;
    mtb_pedido_itensESTOQUE_CONTROLADO: TStringField;
    mtb_pedido_itensLAJE: TStringField;
    lbl_endereco: TLabel;
    Panel2: TPanel;
    btn_baixar_todos: TBitBtn;
    btn_baixar_item: TBitBtn;

    procedure btn_confirmaClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_baixar_todosClick(Sender: TObject);
    procedure btn_baixar_itemClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);

    procedure dsItensDataChange(Sender: TObject; Field: TField);
    procedure DBGrid1DblClick(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    var // ENTREGUE ou RETIROU
      situacao_item : string;
      pedido_modificado : boolean;
    Fcodigo: integer;
    procedure prc_componentes;
    procedure prc_inicializar;
    procedure prc_ler_dados;
    procedure prc_atualizar_situacao_pedido(situacao: string);
    { Private declarations }
  public
    { Public declarations }
    property codigo : integer read Fcodigo write Fcodigo;
  end;

var
  frmPedidosBaixaE: TfrmPedidosBaixaE;

implementation

{$R *.dfm}

uses udmConn, unit_funcoes, unit_controle_estoques, uTipos,
  unit_movimenta_estoques;

procedure TfrmPedidosBaixaE.btnOkClick(Sender: TObject);
var
  loQry : TFDQuery;
begin
  inherited;
  try

    loQry := TFDQuery.Create(application);
    loqry.Connection := Conexao;

    if CriarMensagem('CONFIRMACAO','CONFIRMA A BAIXA DOS ITENS ?') then
    begin
      try
        //inicia uma transacao
        if not conexao.InTransaction then conexao.StartTransaction;

        // baixar item a item do pedido
        mtb_pedido_itens.First;
        while not mtb_pedido_itens.eof do
        begin
          if ((mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString <> '')
             and
             ( mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString <>
               mtb_pedido_itens.FieldByName('SITUACAO_ATUAL').AsString )) then
          begin
            // se o item for uma laje, baixa seus itens (vigas, lajotas/isopor)
            if mtb_pedido_itens.FieldByName('LAJE').AsString = 'S' then
            begin
              // filtra itens da laje e baixa o estoque
              loQry.sql.clear;
              loqry.SQL.Add(' select I.ID, I.PRODUTO_ID, I.QTDE, P.ESTOQUE_CONTROLADO from PEDIDOS_ITENS_LAJE I, PRODUTOS P ' );
              loqry.SQL.Add(' where P.ID = I.PRODUTO_ID and PEDIDO_ID =:PEDIDO_ID and ITEM =:ITEM' );

              loQry.ParamByName('PEDIDO_ID').AsInteger := qry.FieldByName('PEDIDO_ID').AsInteger;
              loQry.ParamByName('ITEM').AsInteger      := mtb_pedido_itens.FieldByName('ITEM').AsInteger;
              loqry.open;
              //ShowMessage('qtde itens ' + inttostr(loqry.RecordCount));
              //baixar os itens de laje encontrados
              loqry.First;
              while not loQry.Eof do
              begin
                // só da baixa os itens da laje se a viga ou isopor ou lajota estiver
                // com o campo estoque controlado = S na tabela de produtos
                if loQry.FieldByName('ESTOQUE_CONTROLADO').AsString = 'S' then
                begin
                  {atualizar estoques na tabela de produtos}
                  unit_movimenta_estoques.prc_atualizar_estoque(loQry.FieldByName('PRODUTO_ID').AsInteger,
                                        'SAIDA',
                                         mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString,
                                         loQry.FieldByName('QTDE').AsFloat);

                  // salvar movimento na tabela movimentacao de estoque
                  //(ja altera o estoque fisico)
                  prc_incluir_alterar(
                                      OpIncluir,
                                      'SAIDA',
                                      'PEDIDOS_ITENS_LAJE',
                                      //'PEDIDOS',
                                      loQry.FieldByName('ID').AsInteger,
                                      //qry.FieldByName('ID').AsInteger,
                                      loQry.FieldByName('PRODUTO_ID').AsInteger,
                                      'VENDA DO PEDIDO N.' + qry.FieldByName('PEDIDO_ID').AsString + ' ITEM : ' + mtb_pedido_itens.FieldByName('ITEM').AsString ,
                                      loQry.FieldByName('QTDE').AsFloat
                                     );
                end;
                {estoque controlado ou não altera a situacao}
                prc_mudar_situacao_dos_itens_da_laje(
                                                     loQry.FieldByName('ID').AsInteger,
                                                     mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString
                                                    );

                // proximo item de laje
                loQry.Next;
              end;

            end else
            {Se for um item diferente de laje}
            if mtb_pedido_itens.FieldByName('ESTOQUE_CONTROLADO').AsString = 'S' then
            begin

              {atualizar estoques na tabela de produtos}
               unit_movimenta_estoques.prc_atualizar_estoque(
                                    mtb_pedido_itens.FieldByName('IDPRODUTO').AsInteger,
                                    'SAIDA',
                                    mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString,
                                    mtb_pedido_itens.FieldByName('QTDE').AsFloat
                                    );

              // salvar movimento na tabela movimentacao de estoque(ja altera o estoque fisico)
              prc_incluir_alterar(
                                  OpIncluir,
                                  'SAIDA',
                                  'PEDIDOS_ITENS',
                                  mtb_pedido_itens.FieldByName('ID').AsInteger,
                                  mtb_pedido_itens.FieldByName('IDPRODUTO').AsInteger,
                                  'VENDA DO PEDIDO N.' + qry.FieldByName('PEDIDO_ID').AsString + ' ITEM : ' + mtb_pedido_itens.FieldByName('ITEM').AsString ,
                                  mtb_pedido_itens.FieldByName('QTDE').AsFloat
                                  );

            end;
            // altera o campo situacao na tabela pedido_itens
            //marcar entregue/retirou no item do pedido correspondente
            prc_mudar_situacao_dos_itens_do_pedido( mtb_pedido_itens.FieldByName('ID').AsInteger,
                                          mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString );

          end;


          mtb_pedido_itens.next;
        end;// fim do while

        {atualizar a situação do pedido}
        prc_atualizar_situacao_do_pedido(qry.FieldByName('PEDIDO_ID').AsInteger);

      except
        conexao.Rollback;
       // on E : Exception do
       //    Raise Exception.Create(E.Message );
      end;

      CriarMensagem('AVISO', 'PEDIDO BAIXADO COM SUCESSO!');

    end;
  finally
    FreeAndNil(loQry);
  end;

  close;

end;

procedure TfrmPedidosBaixaE.btn_baixar_itemClick(Sender: TObject);
begin
  if mtb_pedido_itens.IsEmpty then exit;

  btn_baixar_todos.Enabled := false;
  btn_baixar_item.Enabled  := false;
  btnOk.Enabled            := false;

  //abrir outro form onde o usuario vai escolher entre ENTREGUE e RETIROU
  //pois futuramente haverá um controle de fre
  pnl_situacao.Visible := true;
  pnl_situacao_topo.Caption := 'MARCAR O ITEM SELECIONADO DO PEDIDO COMO :';

end;

procedure TfrmPedidosBaixaE.btn_baixar_todosClick(Sender: TObject);
begin
  if mtb_pedido_itens.IsEmpty then exit;

  btn_baixar_todos.Enabled := false;
  btn_baixar_item.Enabled  := false;
  btnOk.Enabled            := false;

  //abrir outro form onde o usuario vai escolher entre ENTREGUE e RETIROU
  //pois futuramente haverá um controle de frete
  pnl_situacao.Visible := true;
  pnl_situacao_topo.Caption := 'MARCAR TODOS OS ITENS DO PEDIDO COMO :';



end;

procedure TfrmPedidosBaixaE.prc_atualizar_situacao_pedido(situacao: string);
begin
  if mtb_pedido_itens.FieldByName('SITUACAO_ATUAL').AsString <> mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString then
  begin
    mtb_pedido_itens.Edit;
    mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString := situacao;
    mtb_pedido_itens.Post;
  end;
end;


procedure TfrmPedidosBaixaE.btn_cancelarClick(Sender: TObject);
begin
  inherited;
  // volta pro default
  rg_opcao.ItemIndex       := -1;
  pnl_situacao.Visible     := false;
  btn_baixar_todos.Enabled := true;
  btn_baixar_item.Enabled  := true;
  btnOk.Enabled            := true;

  // VOLTA PRA CONDIÇÃO DO PEDIDO
  // marcar TODOS na grid no campo situação
  mtb_pedido_itens.First;
  while not mtb_pedido_itens.Eof do
  begin
    // marcar na grid no campo situação ENTREGUE OU RETROU
    prc_atualizar_situacao_pedido('');
    mtb_pedido_itens.Next;
  end;

  pedido_modificado := FALSE;
  btnOk.Enabled     := FALSE;

end;

procedure TfrmPedidosBaixaE.btn_confirmaClick(Sender: TObject);
begin
  inherited;
  situacao_item := '';

  {situação escolhida pelo usuário}
  if rg_opcao.ItemIndex = -1 then
  begin
    ShowMessage('Selecione uma opção');
    rg_opcao.SetFocus;
    exit;
  end else
  if rg_opcao.ItemIndex = 0 then
  begin
    situacao_item := 'ENTREGUE';
  end else
  if rg_opcao.ItemIndex = 1 then
  begin
    situacao_item := 'RETIROU';
  end;

  // MARCAR APENAS UM ITEM
  if pnl_situacao_topo.Caption = 'MARCAR O ITEM SELECIONADO DO PEDIDO COMO :' then
  begin
    // marcar na grid no campo situação ENTREGUE OU RETROU
    prc_atualizar_situacao_pedido(situacao_item);
  end
  else if pnl_situacao_topo.Caption = 'MARCAR TODOS OS ITENS DO PEDIDO COMO :' then
  begin

    // marcar TODOS na grid no campo situação
    mtb_pedido_itens.First;
    while not mtb_pedido_itens.Eof do
    begin
      // marcar na grid no campo situação ENTREGUE OU RETROU
      prc_atualizar_situacao_pedido(situacao_item);
      mtb_pedido_itens.Next;
    end;

  end;

  btn_baixar_todos.Enabled := true;
  btn_baixar_item.Enabled  := true;
  btnOk.Enabled            := true;


  // volta pro default
  rg_opcao.ItemIndex   := -1;
  pnl_situacao.Visible := false;

  pedido_modificado := TRUE;
  btnOk.Enabled     := TRUE;
end;

procedure TfrmPedidosBaixaE.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  btn_baixar_item.Click;
end;

procedure TfrmPedidosBaixaE.dsItensDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  // habilita/desabilita botão baixar item
  btn_baixar_item.Enabled := ( mtb_pedido_itensSITUACAO_ATUAL.AsString = 'ABERTO') or
                             ( mtb_pedido_itensSITUACAO_ATUAL.AsString = 'AGUARDANDO');
  btn_baixar_todos.Enabled := ( mtb_pedido_itensSITUACAO_ATUAL.AsString = 'ABERTO') or
                             ( mtb_pedido_itensSITUACAO_ATUAL.AsString = 'AGUARDANDO');
end;

procedure TfrmPedidosBaixaE.FormCreate(Sender: TObject);
begin
  inherited;
  pedido_modificado := FALSE;
end;

procedure TfrmPedidosBaixaE.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
  prc_inicializar;
end;

procedure TfrmPedidosBaixaE.prc_componentes;
begin

  lbl_titulo.Caption := 'BAIXA DE PEDIDO N. ' + INTTOSTR(CODIGO);  ;
  DBGrid1.Columns[0].Visible := FALSE;// ID
  DBGrid1.Columns[2].Visible := FALSE;// IDPRODUTO
  //DBGrid1.Columns[7].Visible := FALSE;// NOVA SITUACAO
  DBGrid1.Columns[8].Visible := FALSE;// ESTOQUE_CONTROLADO
  DBGrid1.Columns[9].Visible := FALSE;// LAJE

  btnok.Enabled := FALSE;
end;

procedure TfrmPedidosBaixaE.prc_inicializar;
begin
  prc_ler_dados;
end;


procedure TfrmPedidosBaixaE.prc_ler_dados;
var
  loqry: TFDQuery;
begin
  qry.Close;
  qry.ParamByName('PEDIDO_ID').AsInteger := codigo;
  qry.Open;
  lbl_endereco.Caption := qry.FieldByName('endereco').AsString + ' N. ' +
                          qry.FieldByName('numero').AsString + ', ' +
                          qry.FieldByName('bairro').AsString + ', ' +
                          qry.FieldByName('cidade').AsString + ', ' +
                          qry.FieldByName('uf').AsString;


  dtp_data_entrega.Date := qry.FieldByName('data_entrega').AsDateTime;

  try
    loqry:= TFDQuery.Create(application);
    loqry.Connection := conexao;
    loqry.SQL.Add('select                                          ') ;
    loqry.SQL.Add('  I.ID, I.ITEM, P.ID AS IDPRODUTO, P.NOME_FANTASIA, P.UNIDADE, I.QTDE, I.SITUACAO, ') ;
    loqry.SQL.Add('  P.ESTOQUE_CONTROLADO, P.LAJE                  ') ;
    loqry.SQL.Add('from                                            ') ;
    loqry.SQL.Add('  PEDIDOS_ITENS I, PRODUTOS P                   ') ;
    loqry.SQL.Add('where                                           ') ;
    loqry.SQL.Add('  I.PRODUTO_ID = P.ID and PEDIDO_ID =:PEDIDO_ID ') ;
    loqry.SQL.Add('  AND I.SITUACAO <> :SITUACAO                   ') ;

    loqry.ParamByName('PEDIDO_ID').AsInteger := codigo;
    // lista somente os itens ABERTO e ou AGUARDANDO
    loqry.ParamByName('SITUACAO').AsString   := 'ENTREGUE';
    loqry.Open;
    // carregar o memTable com os itens do pedido
    loqry.First;
    while not loqry.eof do
    begin
      mtb_pedido_itens.Insert;
      mtb_pedido_itens.FieldByName('ID').AsInteger           :=  loqry.FieldByName('ID').AsInteger;
      mtb_pedido_itens.FieldByName('ITEM').AsInteger         :=  loqry.FieldByName('ITEM').AsInteger;
      mtb_pedido_itens.FieldByName('IDPRODUTO').AsInteger    :=  loqry.FieldByName('IDPRODUTO').AsInteger;
      mtb_pedido_itens.FieldByName('NOME_FANTASIA').AsString :=  loqry.FieldByName('NOME_FANTASIA').AsString;
      mtb_pedido_itens.FieldByName('QTDE').AsFloat           :=  loqry.FieldByName('QTDE').AsFloat;
      mtb_pedido_itens.FieldByName('UNIDADE').AsString       :=  loqry.FieldByName('UNIDADE').AsString;
      mtb_pedido_itens.FieldByName('SITUACAO_ATUAL').AsString:=  loqry.FieldByName('SITUACAO').AsString;
      mtb_pedido_itens.FieldByName('ESTOQUE_CONTROLADO').AsString:=  loqry.FieldByName('ESTOQUE_CONTROLADO').AsString;
      mtb_pedido_itens.FieldByName('LAJE').AsString          :=  loqry.FieldByName('LAJE').AsString;
      if ( loqry.FieldByName('SITUACAO').AsString = 'ENTREGUE' ) or
         ( loqry.FieldByName('SITUACAO').AsString = 'RETIROU' ) then
      mtb_pedido_itens.FieldByName('SITUACAO_NOVA').AsString:=  loqry.FieldByName('SITUACAO').AsString;

      mtb_pedido_itens.post;

      loqry.next;
    end;
  finally
    loqry.Close;
    FreeAndNil( loqry ) ;
  end;

end;

end.
