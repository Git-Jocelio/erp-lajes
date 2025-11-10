unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.jpeg, Vcl.ExtCtrls, Vcl.ComCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Buttons, Vcl.ToolWin,
  ufrmConfiguracaoServidor, ufrmProdutosBomba, FireDAC.Stan.StorageBin,
  ufrmEmpresa, Vcl.ExtDlgs, ufrmContasReceber, ufrmUsuarios,
  ufrmComissaoFechamento, IdBaseComponent, IdComponent, IdIPWatch, midas,
  ufrmTeste, uAtualizaSistema, ufrmProducaoVigas, ufrmPlanoContas,
  ufrmContasPagar, ufrmTabelaPrecos, ufrmConfiguracoesSistema, ufrmFornecedores,
  ufrmCompras, ufrmMaoObra, Winapi.ShellAPI, ufrmCartaoOperadoras,
  ufrmCartaoBandeiras, ufrmCartaoFormasPagto, ufrmCartaoMaquinas,
  ufrmContasBancarias, ufrmCartaoVendas, ufrmCartaoTaxas, ufrmBancos;

type
  TfrmPrincipal = class(TForm)
    ActionList1: TActionList;
    actArquivo_Pessoas: TAction;
    actArquivo_Sair: TAction;
    qryEmpresa: TFDQuery;
    actArquivo_Vendedores: TAction;
    actArquivo_Clientes: TAction;
    actFinanceiro_FormaPagto: TAction;
    actArquivo_Departamentos: TAction;
    actSistema_Configuracoes: TAction;
    actArquivo_Produtos: TAction;
    actArquino_ProdutosTrelica: TAction;
    actArquivo_ProdutosEps: TAction;
    actArquivo_ProdutosAdicionais: TAction;
    actArquivo_ProdutosLajotas: TAction;
    actArquivo_Concreto: TAction;
    actArquivo_ProdutosLajes: TAction;
    actFaturamento_Pedidos: TAction;
    actArquivo_ProdutosVigas: TAction;
    actArquivo_Transportadoras: TAction;
    actEstoque_PesquisaVigas: TAction;
    pnl_fundo: TPanel;
    actArquivo_VigasAltercaoPreco: TAction;
    actFinanceiro_Comissoes: TAction;
    pnl_topo: TPanel;
    pnl_barra: TPanel;
    btn_fechar: TSpeedButton;
    btn_minimizar: TSpeedButton;
    img_logo: TImage;
    lbl_nome_empresa: TLabel;
    pnl_menu: TPanel;
    btn_suporte: TSpeedButton;
    btn_opcoes_sistema: TSpeedButton;
    btn_configuracoes: TSpeedButton;
    pnl_opcoes: TPanel;
    btn_cadastros: TSpeedButton;
    btn_estoque: TSpeedButton;
    btn_faturamento: TSpeedButton;
    btn_sistema: TSpeedButton;
    btn_financeiro: TSpeedButton;
    btn_sobre: TSpeedButton;
    btn_sair: TSpeedButton;
    pnl_Configuracoes_servidor: TPanel;
    btn_configuracoes_servidor: TSpeedButton;
    ImageList1: TImageList;
    pnl_suporte_contato: TPanel;
    btn_suorte_contato: TSpeedButton;
    actArquivo_Bomba: TAction;
    pnl_subMenu_opcoes: TPanel;
    lbl_titulo_opcoes: TLabel;
    mtb_opcoes_sistema: TFDMemTable;
    mtb_opcoes_sistemaid_opcao_sistema: TIntegerField;
    mtb_opcoes_sistemaid_coluna: TIntegerField;
    mtb_opcoes_sistemaid_linha: TIntegerField;
    mtb_opcoes_sistemads_descricao: TStringField;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    actSistema_Empresa: TAction;
    OpenPictureDialog1: TOpenPictureDialog;
    IdIPWatch1: TIdIPWatch;
    Label2: TLabel;
    lbl_ip_local: TLabel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure actArquivo_SairExecute(Sender: TObject);
    procedure actArquivo_PessoasExecute(Sender: TObject);
    procedure actArquivo_VendedoresExecute(Sender: TObject);
    procedure actArquivo_ClientesExecute(Sender: TObject);
    procedure actFinanceiro_FormaPagtoExecute(Sender: TObject);
    procedure actArquivo_DepartamentosExecute(Sender: TObject);
    procedure actArquivo_ProdutosExecute(Sender: TObject);
    procedure actArquino_ProdutosTrelicaExecute(Sender: TObject);
    procedure actArquivo_ProdutosEpsExecute(Sender: TObject);
    procedure actArquivo_ProdutosAdicionaisExecute(Sender: TObject);
    procedure actArquivo_ProdutosLajotasExecute(Sender: TObject);
    procedure actArquivo_ConcretoExecute(Sender: TObject);
    procedure actArquivo_ProdutosLajesExecute(Sender: TObject);
    procedure actFaturamento_PedidosExecute(Sender: TObject);
    procedure actArquivo_ProdutosVigasExecute(Sender: TObject);
    procedure actArquivo_TransportadorasExecute(Sender: TObject);
    procedure actEstoque_PesquisaVigasExecute(Sender: TObject);
    procedure actArquivo_VigasAltercaoPrecoExecute(Sender: TObject);
    procedure actFinanceiro_ComissoesExecute(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure btn_minimizarClick(Sender: TObject);
    procedure btn_opcoes_sistemaMouseEnter(Sender: TObject);
    procedure pnl_fundoMouseEnter(Sender: TObject);
    procedure actSistema_ConfiguracoesExecute(Sender: TObject);
    procedure actArquivo_BombaExecute(Sender: TObject);
    procedure btn_cadastrosMouseEnter(Sender: TObject);
    procedure pnl_opcoesMouseEnter(Sender: TObject);
    procedure btn_opcoes_sistemaClick(Sender: TObject);

    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure btn_sobreClick(Sender: TObject);
    procedure actSistema_EmpresaExecute(Sender: TObject);
    procedure img_logoDblClick(Sender: TObject);
    procedure btn_suporteClick(Sender: TObject);


  private
    { Private declarations }
    procedure prc_controlar_menu( Botao: TSpeedButton; ativar: boolean );
    procedure prc_controlar_submenu_opcoes( Botao: TSpeedButton );
    procedure prc_criar_opcao_menu(titulo: string; posLeft, posTop: integer);
    procedure prc_destruir_opçoes_menu;

    procedure OpcaoMouseEnter(sender: TObject);
    procedure OpcaoMouseLeave(sender: TObject);

    {fazer a chamada do form}
    procedure opcaoClick(sender: TObject);

    function fnc_atualiza_sistema( origem: string ): boolean;
    procedure prc_atualizar_versao_no_banco(versao : integer);

  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;
  b_expandido : boolean;

implementation



{$R *.dfm}

uses udmConn, ufrmPessoas, ufrmVendedores, ufrmClientes, ufrmFormaPagto,
  ufrmDepartamentos, ufrmProdutos, ufrmProdutoTrelica, ufrmProdutosEps,
  ufrmProdutosAdicional, ufrmProdutosLajotas, ufrmProdutosConcreto,
  ufrmProdutosLajes, ufrmPedidos, ufrmProdutosVigas, ufrmTransportadoras,
  uBiblioteca, ufrmViga_AlteracaoPreco, ufrmProdutosVigas_Pesquisa,
  ufrmComissoes;

procedure TfrmPrincipal.actArquino_ProdutosTrelicaExecute(Sender: TObject);
begin
  ufrmProdutoTrelica.executa;
end;

procedure TfrmPrincipal.actArquivo_BombaExecute(Sender: TObject);
begin
   ufrmProdutosBomba.executa;
end;

procedure TfrmPrincipal.actArquivo_ClientesExecute(Sender: TObject);
begin
  ufrmClientes.executa();
end;

procedure TfrmPrincipal.actArquivo_ConcretoExecute(Sender: TObject);
begin
  ufrmProdutosConcreto.execute;
end;

procedure TfrmPrincipal.actArquivo_DepartamentosExecute(Sender: TObject);
begin
  ufrmDepartamentos.executa();

end;

procedure TfrmPrincipal.actArquivo_PessoasExecute(Sender: TObject);
begin
  //ufrmPessoas.executa(); mudei
end;

procedure TfrmPrincipal.actArquivo_ProdutosAdicionaisExecute(Sender: TObject);
begin
  ufrmProdutosAdicional.executa;
end;

procedure TfrmPrincipal.actArquivo_ProdutosEpsExecute(Sender: TObject);
begin
  ufrmProdutosEps.executa;
end;

procedure TfrmPrincipal.actArquivo_ProdutosExecute(Sender: TObject);
begin
  ufrmProdutos.executa;

end;

procedure TfrmPrincipal.actArquivo_ProdutosLajesExecute(Sender: TObject);
begin
  ufrmProdutosLajes.executa;
end;

procedure TfrmPrincipal.actArquivo_ProdutosLajotasExecute(Sender: TObject);
begin
  ufrmProdutosLajotas.executa;
end;

procedure TfrmPrincipal.actArquivo_ProdutosVigasExecute(Sender: TObject);
begin
  if frmProdutosVigas = nil then
  begin
    frmProdutosVigas :=TfrmProdutosVigas.Create(Application);
    try
      frmProdutosVigas.ShowModal;
    finally
      FreeAndNil(frmProdutosVigas);
    end;
  end;

end;

procedure TfrmPrincipal.actArquivo_SairExecute(Sender: TObject);
begin
  uBiblioteca.fnc_criar_mensagem('SAUDAÇÕES',
                                 'ESPERO QUE TENHA GOSTADO',
                                 'Obrigado por usar o SisLajes',
                                 ExtractFilePath(Application.ExeName) + '\Icones\information.ico' ,
                                 'OK');
  freeandnil(frmPrincipal);
  application.Terminate;
end;

procedure TfrmPrincipal.actArquivo_TransportadorasExecute(Sender: TObject);
begin
  ufrmTransportadoras.executa;
end;

procedure TfrmPrincipal.actArquivo_VendedoresExecute(Sender: TObject);
begin
  ufrmVendedores.executa;
end;

procedure TfrmPrincipal.actArquivo_VigasAltercaoPrecoExecute(Sender: TObject);
begin
  if frmViga_AlteracaoPreco = nil then
   frmViga_AlteracaoPreco := TfrmViga_AlteracaoPreco.Create(self);
  try
   frmViga_AlteracaoPreco.ShowModal;
  finally
    FreeAndNil(frmViga_AlteracaoPreco);
  end;

end;

procedure TfrmPrincipal.actEstoque_PesquisaVigasExecute(Sender: TObject);
begin
  ufrmProdutosVigas_Pesquisa.executa;
end;

procedure TfrmPrincipal.actFinanceiro_ComissoesExecute(Sender: TObject);
begin
  ufrmComissoes.executa;
end;

procedure TfrmPrincipal.actFinanceiro_FormaPagtoExecute(Sender: TObject);
begin
  ufrmFormaPagto.executa;
end;

procedure TfrmPrincipal.actSistema_ConfiguracoesExecute(Sender: TObject);
begin
  if frmConfiguracaoServidor = nil then
  try
    frmConfiguracaoServidor := TfrmConfiguracaoServidor.Create( self );
    frmConfiguracaoServidor.ShowModal;
  finally
    FreeAndNil( frmConfiguracaoServidor );
  end;
end;

procedure TfrmPrincipal.actSistema_EmpresaExecute(Sender: TObject);
begin
  ufrmempresa.executa;
end;

procedure TfrmPrincipal.btn_cadastrosMouseEnter(Sender: TObject);
var
  Altura, Largura: integer;
begin

  pnl_opcoes.Width := 193;

  prc_controlar_submenu_opcoes((TComponent(sender) as TSpeedButton));

  prc_destruir_opçoes_menu;
  largura := 0;
  altura := 50;

  mtb_opcoes_sistema.DisableControls;
  mtb_opcoes_sistema.first;
  while not mtb_opcoes_sistema.eof do
  begin
    {propriedade tag dos botões do menu lateral }
    if (TComponent(sender) as TSpeedButton).Tag = mtb_opcoes_sistema.FieldByName('id_opcao_sistema').AsInteger then
    begin
      case mtb_opcoes_sistema.FieldByName('id_coluna').AsInteger of

        1: largura := 10;  // btnCadastros
        2: largura := 210; // btnFaturamento
        3: largura := 410; // btnEstoque
        4: largura := 610; // btnFinanceiro
        5: largura := 810; // btnSistema
        6: largura := 810; // btnSobre
        7: largura := 810; // btncomissões vendedor

      end;

      prc_criar_opcao_menu(
                           mtb_opcoes_sistema.FieldByName('ds_descricao').AsString,
                           Largura,
                           Altura* mtb_opcoes_sistema.FieldByName('id_linha').AsInteger
                           );
    end;

    mtb_opcoes_sistema.Next;
  end;

  mtb_opcoes_sistema.EnableControls;


end;

procedure TfrmPrincipal.btn_fecharClick(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmPrincipal.btn_opcoes_sistemaClick(Sender: TObject);
begin
  if b_expandido then
     pnl_opcoes.Width := 40
  else
     pnl_opcoes.Width := 193;

  b_expandido := not b_expandido;
end;

procedure TfrmPrincipal.btn_opcoes_sistemaMouseEnter(Sender: TObject);
begin
  prc_controlar_menu( (TComponent(sender) as TSpeedButton), true );

  pnl_subMenu_opcoes.Visible := false;

end;

procedure TfrmPrincipal.btn_sobreClick(Sender: TObject);
begin
{teste pra descobrir o erro que tava dando no frmPedidoE que nao
roda no windows 7. conclusão não aceita o TclientDataSet, não
sei o pq!  }
//   ufrmTeste.executa;
end;

procedure TfrmPrincipal.btn_suporteClick(Sender: TObject);
//var
//  servidor_ : WideChar;
Var
Path: String;

begin
(*  ShowMessage( Application.ExeName);
//  servidor_ := chdir('\\192.168.100.32\C:\LAJES TRIUNFO\LAJESTRIUNFO.EXE');

  //if FileExists('192.168.100.32:' + Application.ExeName, true) then   //verifica se o arquivo existe no servidor
  if FileExists('\\192.168.100.32:C:\LAJES TRIUNFO\LAJESTRIUNFO.EXE') then
  begin
     ShowMessage(' achei ');
  end else
  begin
     ShowMessage(' NÃO achei ');

  end;
*)
//***
  Path := ExtractFilePath(ParamStr(0));
  ShowMessage(ParamStr(0));
  //result := false;
  if FileExists( Path+'LAJESTRIUNFO.EXE') then
     ShowMessage(' achei ')
  else
  ShowMessage('Arquivo não existe');
//***


end;

procedure TfrmPrincipal.btn_minimizarClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmPrincipal.actFaturamento_PedidosExecute(Sender: TObject);
begin
  ufrmPedidos.executa;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryEmpresa.Close;
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  versao_app_banco : integer;
  loQry : TFDQuery;
  script: string;

begin
  b_expandido := true;
  qryEmpresa.Connection := dmConn.FDConnection;
  qryEmpresa.Open('select p.*, e.* from empresa e, pessoas p where e.pessoa_id = p.id');

  {ler do ini}
  //self.Caption := qryEmpresa.FieldByName('NOME_FANTASIA').AsString +
  self.Caption :=
   {'VERSÃO ' + ' 13/05/2021 - ' + '23:06';
   'VERSÃO ' + ' 25/05/2021 - ' + '23:06';  gera contas receber a partir do pedido
   'VERSÃO ' + ' 07/06/2021 - ' + '23:06';  pedido concreto ok
   'VERSÃO ' + ' 08/06/2021 - ' + '21:40';  frmPedidosE, inicio da implementação da laje H16, frmProdutosLajes implementação do metodo validar
   'VERSÃO ' + ' 09/06/2021 - ' + '22:27'; // frmPedidosE, continuação da implementação da laje H16, btnADDViga e BtnExcViga e frmProdutosEps implementação do metodo validar
   'VERSÃO ' + ' 14/06/2021 - ' + '22:33'; // frmPedidosE, final da implementação da laje H16
   'VERSÃO ' + ' 15/06/2021 - ' + '21:33'; // frmPedidosE, aba da laje H20  completo
   'VERSÃO ' + ' 16/06/2021 - ' + '21:33'; // frmPedidosE, aba da laje H25  completo
   'VERSÃO ' + ' 17/06/2021 - ' + '22:20'; // frmPedidosE, aba da laje H30  completo
   'VERSÃO ' + ' 22/06/2021 - ' + '22:20'; // frmPedidosE, retirada de bugs
   'VERSÃO ' + ' 01/07/2021 - ' + '22:20'; // frmPedidosE, retirada de bugs  e relatório pedido pronto
   'VERSÃO ' + ' 09/07/2021 - ' + '22:20'; // frmPedidosE, retirada de bugs  e relatório Ordem de produção prte i
   ' - VERSÃO ' + ' 22/07/2021 - ' + '22:20'; // primeira versão para produção
}
  // ' - VERSÃO ' + ' 03/09/2021 - ' + '20:43'; // primeira versão para produção
  {resolvi parar como esta ate aqui, nao estou conseguindo fazer todas as
  tratamentos que a ferragem adicional exige... então tive a ideia de fazer com os
  itens de laje , criar um produto reforço adicional de viga e um produto ferragens
  e criar uma nova aba ... vamos lá que DEus clarei minhas ideias }
  // 21/09 DEU CERTO
  // ' - VERSÃO ' + ' 19/10/2021 - ' + '12:57'; // primeira versão para produção
  // ' - VERSÃO ' + ' 28/10/2021 - ' + '23:12'; // retirada de bugs
  // ' - VERSÃO ' + ' 29/10/2021 - ' + '16:41'; // retirada de bugs
  // ' - versão :' + ' 14/03/2022 - ' + '22:24'; // retirada de bugs
  // ' - versão :' + ' 16/03/2022 - ' + '15:09'; // retirada de bugs
  // ' - versão :' + ' 17/03/2022 - ' + '22:38'; // retirada de bugs
  // ' - versão :' + ' 18/03/2022 - ' + '13:59'; // retirada de bugs
  // ' - versão :' + ' 18/03/2022 - ' + '15:18'; // FINAL ANA
  // ' - versão :' + ' 23/03/2022 - ' + '13:24'; // FINAL ANA
  // ' - versão :' + ' 23/03/2022 - ' + '16:19'; // Implemetando fechamento comissao
  // ' - versão :' + ' 23/03/2022 - ' + '22:00'; // fechamento comissao
  // ' - versão :' + ' 25/03/2022 - ' + '16:11'; // fechamento comissao a tela pronta
  // ' - versão :' + ' 26/03/2022 - ' + '11:27'; // fechamento comissao salvando no banco ok
  // ' - versão :' + ' 04/04/2022 - ' + '11:42';   // fechamento comissao 1.a versão produção
  // ' - versão :' + ' 05/04/2022 - ' + '22:36';   // troca dos clients data sets por mem tables
  // ' - versão :' + ' 08/04/2022 - ' + '15:55';   // form frmComissoesItensE , altera valores e qtdes
  // ' - versão :' + ' 09/04/2022 - ' + '00:01';   // fim rel fechamento comissoes
  // ' - versão :' + ' 10/04/2022 - ' + '21:12';   // aba financeira no rodape
  // ' - versão :' + ' 11/04/2022 - ' + '19:56';   // rodar no servidor
   ' - versão : [ ' + IntToStr(versao_app) + ' ]'; // ver descrição na variavel


   lbl_nome_empresa.Caption := qryEmpresa.FieldByName('NOME_FANTASIA').AsString
   + self.Caption;

   img_logo.Picture.LoadFromFile(qryEmpresa.FieldByName('img_logo').AsString);


 //ShowMessage( dmConn.conexao.servidor );

  {busca a versão do app no banco de dados}
  versao_app_banco := Sistema.versaoAtual;

  {versao_app = "valor da const declarada em uDmConn"}
  if versao_app < versao_app_banco then
  begin

    ShowMessage('Existe uma nova versão do sistema disponivel no servidor...' + sLineBreak +
    'por favor aguarde ...');

    (* exemplo de atualização no banco de dados
    loQry :=  TFDQuery.Create(self);

    loqry.Connection := dmConn.FDConnection;
    loqry.SQL.Add('select * from banco_versao');
    loqry.Open;
    ShowMessage(loqry.SQL.Text);
    script := loqry.FieldByName('script').AsString;
    ShowMessage(script);
    loqry.SQL.Clear;
    loqry.SQL.Add(script);
    loqry.ExecSQL;
*)


    {Derruba a aplicação syslajes}
    Application.Terminate;

    {chama o atualizador, após atualizar sobe a aplicação syslajes novamente}
    ShellExecute( Handle,'open', 'project1.exe', nil, 'C:\lajes triunfo', SW_SHOWNORMAL );

  end;


(*
  versao_banco := Sistema.versaoBAnco;

  if versao_neste_app > versao_no_banco then
  begin
    ShowMessage('A versão que vc está usando é incompativel com a base de dados:' + sLineBreak+
    'Versão no banco de dados : ' + versao_no_banco.ToString + sLineBreak +
    'Versão do Aplicativo     : ' +  versao_neste_app.ToString);
    {roda script de atualização do banco e atualiza o campo versao do banco + 1}

    prc_atualizar_versao_no_banco(versao_neste_app);

    //Application.Terminate;
  end;

*)

end;




procedure TfrmPrincipal.img_logoDblClick(Sender: TObject);
var
  var_endereco: string;
begin

  if OpenPictureDialog1.Execute then
     begin
       {seleciona uma imagem}
       var_endereco := OpenPictureDialog1.FileName;

       {mudo para um sql simples pra poder alterar e salvar...}
       qryEmpresa.Close;
       qryEmpresa.SQL.Clear;
       qryEmpresa.SQL.Add('select * from empresa');
       qryEmpresa.Open;


       {edita a tabela onde contem o endereço da última imagem selecionada}
       qryEmpresa.edit;
       {recebe o novo endereço}
       qryEmpresa.FieldByName('img_logo').asstring:=  var_endereco;

       //ShowMessage(var_endereco);

       {grava a alteração}
       qryEmpresa.post;

       {o componente image1 recebe e mostra a nova imagem}
       img_logo.Picture.LoadFromFile(var_endereco);

       {volta pro sql padrão}
       qryEmpresa.Close;
       qryEmpresa.SQL.Clear;
       qryEmpresa.SQL.Add('select e.*, p.* from empresa e, pessoas p where e.pessoa_id = p.id');
       qryEmpresa.Open;

     end;
end;

procedure TfrmPrincipal.pnl_fundoMouseEnter(Sender: TObject);
begin
  prc_controlar_menu(nil,false);

  pnl_subMenu_opcoes.Visible := false;

end;

procedure TfrmPrincipal.pnl_opcoesMouseEnter(Sender: TObject);
begin
  pnl_subMenu_opcoes.Visible := false;
end;

procedure TfrmPrincipal.prc_atualizar_versao_no_banco(versao : integer);
var
  qry : TFDQuery;
begin
  try
    dmConn.FDConnection.StartTransaction;
    qry := TFDQuery.Create(Self);
    try
      with qry, qry.Sql do
      begin
        connection := dmConn.FDConnection;
        Add('UPDATE            ');
        Add('  VERSAO_APP      ');
        Add('SET               ');
        Add('  VERSAO = :VERSAO');

        ParamByName('VERSAO').AsInteger   := versao;
        ExecSQL;
        dmConn.FDConnection.Commit;

      end; // with

    finally
      FreeAndNil(qry);
    end; // try/finnaly
  except
    on E : Exception do
    begin
       dmConn.FDConnection.Rollback;
       Raise Exception.Create(E.Message + Self.Name +'.Alterar');
    end;
  end; //try/exception

end;

procedure TfrmPrincipal.prc_controlar_menu(Botao: TSpeedButton; ativar : boolean);
var
 i : integer;
begin
  if ativar then
  begin
    for I := 0 to frmPrincipal.ComponentCount-1 do
    begin
      {testa se o componente é um panel e se for tag dif 0 então é um panel de menu}
      if ((frmPrincipal.Components[i] is TPanel) and
            (( frmPrincipal.Components[i] as TPanel).Tag <> 0)) then
      begin
         {testafrmPrincipal.Components[i] as TPanel).Tag se o paneil é associado com o botao passado como parametro}
         if (frmPrincipal.Components[i] as TPanel).Tag = Botao.Tag then
         begin

           {mostra o paneil associado e alinha com o botao}
           (frmPrincipal.Components[i] as TPanel).Visible := true;
           (frmPrincipal.Components[i] as TPanel).Left := botao.Left;

         end else
         begin

           {se não for o painel associado ao botao que o mouse esta, entao eu escondo}
           (frmPrincipal.Components[i] as TPanel).Visible := false;

         end;

      end;

    end;
  end else {fim do ativar = true}
  begin
    for I := 0 to frmPrincipal.ComponentCount-1 do
    begin
      {esconde todos os panels associados}
      {testa se o componente é um panel e se for tag dif 0 então é um panel de menu}
      if ((frmPrincipal.Components[i] is TPanel) and
            (( frmPrincipal.Components[i] as TPanel).Tag <> 0)) then
      (frmPrincipal.Components[i] as TPanel).Visible := false;


    end; { fim do ativar = false}
  end;
end;


procedure TfrmPrincipal.prc_controlar_submenu_opcoes(Botao: TSpeedButton);
begin
  pnl_subMenu_opcoes.Visible := true;
  lbl_titulo_opcoes.Caption := 'Opções relacionadas : ' +  botao.Caption;
end;

procedure TfrmPrincipal.prc_criar_opcao_menu(titulo: string; posLeft,
  posTop: integer);
var
  item_label: TLabel;
begin

   item_label := TLabel.Create(frmPrincipal);
   item_label.OnMouseEnter := OpcaoMouseEnter;
   item_label.OnMouseLeave := OpcaoMouseLeave;
   item_label.OnClick      := opcaoClick;

   item_label.Parent     := pnl_subMenu_opcoes;
   item_label.Font.Color := clBlue;
   item_label.Font.Size  := 9;
   item_label.Font.Style := [];

   item_label.Left       := posLeft;
   item_label.Top        := posTop;
   item_label.Caption    := titulo;

   {essa tag = 5 vai indicar que esse label foi criado dinamicamente,
   assim consigo destruir ele na prc_destruir_opçoes_menu}
   item_label.tag     := 5;// poderia usar qq numero

end;

procedure TfrmPrincipal.OpcaoMouseEnter(sender: TObject);
begin

   (TComponent(sender) as TLabel).Font.Style := [fsBold, fsUnderline];
   (TComponent(sender) as TLabel).Font.Size  := 10;
   (TComponent(sender) as TLabel).Font.color := clNavy;
   (TComponent(sender) as TLabel).Cursor     := crHandPoint;

end;

procedure TfrmPrincipal.OpcaoMouseLeave(sender: TObject);
begin

   (TComponent(sender) as TLabel).Font.Style := [];
   (TComponent(sender) as TLabel).Font.Size  := 9;
   (TComponent(sender) as TLabel).Font.color := clBlue;
   (TComponent(sender) as TLabel).Cursor     := crArrow;

end;

procedure TfrmPrincipal.opcaoClick(sender: TObject);
begin
  {chamadas dos formularios}
  {obs. incluir a descrição no memtable mtb_opcoes_sistema}
  {menu cadastros}
//  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Pessoas' ) then ufrmPessoas.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Vendedores' ) then ufrmVendedores.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Clientes' ) then ufrmClientes.executa;
  //if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Fornecedores' ) then ufrmFornecedores.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Transportadoras' ) then ufrmTransportadoras.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Departamentos' ) then ufrmDepartamentos.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cad Produtos de Revenda' ) then ufrmProdutos.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Lajotas' ) then ufrmProdutosLajotas.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de EPS' ) then ufrmProdutosEps.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Treliças' ) then ufrmProdutoTrelica.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Vergalhões' ) then ufrmProdutosAdicional.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Lajes' ) then ufrmProdutosLajes.executa;

  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Vigas' ) then
  begin
    if frmProdutosVigas = nil then
    begin
      frmProdutosVigas :=TfrmProdutosVigas.Create(Application);
      try
        frmProdutosVigas.ShowModal;
      finally
        FreeAndNil(frmProdutosVigas);
      end;
    end;
  end;

  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Alteração de Preços de Vigas' ) then
  begin
    if frmViga_AlteracaoPreco = nil then
      frmViga_AlteracaoPreco := TfrmViga_AlteracaoPreco.Create(self);
    try
      frmViga_AlteracaoPreco.ShowModal;
    finally
      FreeAndNil(frmViga_AlteracaoPreco);
     end;
  end;

  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Concreto Usinado' ) then ufrmProdutosConcreto.execute;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Bomba de Concreto' ) then ufrmProdutosBomba.executa;

  {menu faturamento}
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Pedidos' ) then ufrmPedidos.executa;

  {menu estoque}
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Pesquisa de Vigas' ) then ufrmProdutosVigas_Pesquisa.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Produção de Vigas' ) then ufrmProducaoVigas.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Compras') then ufrmCompras.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Mão-de-Obra') then ufrmMaoObra.prc_executa;

  {menu financeiro}
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Formas de Pagamento do Pedido' )then ufrmFormaPagto.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Plano de Contas') then ufrmPlanoContas.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Contas a Receber' ) then
  begin
    if frmContasReceber = nil then
      frmContasReceber := TfrmContasReceber.Create(self);
    try
      frmContasReceber.ShowModal;
    finally
      FreeAndNil(frmContasReceber);
     end;
  end;

  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Operadoras de Cartão') then ufrmCartaoOperadoras.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Bandeiras de Cartão') then ufrmCartaoBandeiras.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Formas de Pagamento Cartão') then ufrmCartaoFormasPagto.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Máquininhas') then ufrmCartaoMaquinas.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Contas Bancárias') then ufrmContasBancarias.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Taxas de Cartão') then ufrmCartaoTaxas.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Bancos') then ufrmBancos.prc_executa;


  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Venda Cartão de Crédito') then ufrmCartaoVendas.prc_executa;


  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Contas a Pagar') then ufrmContasPagar.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Tabela de Preços') then ufrmTabelaPrecos.prc_executa;

  {menu comissões de vendedor}
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Comissões de Vendedores') then ufrmComissoes.executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Fechamento de Comissões') then ufrmComissaoFechamento.prc_executa;

  {menu sistema}
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Cadastro de Usuários') then ufrmUsuarios.prc_executa;
  if uppercase((TComponent(sender) as TLabel).Caption) = uppercase('Configurações do Sistema') then ufrmConfiguracoesSistema.prc_executa;

end;

procedure TfrmPrincipal.prc_destruir_opçoes_menu;
var
 I : integer;
begin

    for I := frmPrincipal.ComponentCount-1 downto 0 do
    begin

      {esconde todos os TLabes}
      {testa se o componente é um label e se for tag = 5 então destroy da memória}
      if ((frmPrincipal.Components[i] is TLabel) and
            (( frmPrincipal.Components[i] as TLabel).Tag = 5)) then
      (frmPrincipal.Components[i] as TLabel).Free;

    end;

    lbl_ip_local.Caption :=  IdIPWatch1.LocalIP;

end;

function TfrmPrincipal.fnc_atualiza_sistema( origem: string ): boolean;
var
  dirTemp : string;
  lista   : TStrings;
  nomeBAT : string;
  nomeDOS : string;


begin
  result := false;

  {origem = '\\DESKTOP-JOCELIO\LAJES TRIUNFO\LajesTriunfo.Exe' }

  {cria o caminho do diretorio na pasta temp}
  dirTemp := uAtualizaSistema.GetWindowsTemp;

  {cria uma pasta no diretorio temp do windows}
  uAtualizaSistema.CriarDiretorio(dirTemp);

  {exemplo que deu certo}
  //origem := '\\DESKTOP-JOCELIO\update\APP.exe';

  {verifica se o arquivo existe na pasta local}
  if FileExists('C:\LAJES TRIUNFO\LajesTriunfo.Exe') then
  begin
    {origem "servidor" / destino "diretorio temporario local"}
    CopyFile( pchar( '\\DESKTOP-JOCELIO\LAJES TRIUNFO\LajesTriunfo.Exe' ),
              pchar( dirTemp + 'LajesTriunfo.Exe' ), true );

    if FileExists(  dirTemp + 'LajesTriunfo.Exe' ) then
    begin
      {origem  " diretorio temporario local "
       destino " diretorio local do sistema " }

      {copia trocando a extensão}
      CopyFile(
              PChar( dirTemp + 'LajesTriunfo.Exe' ),
              PChar( ChangeFileExt('C:\LAJES TRIUNFO\' + 'LajesTriunfo.Exe' , '.tmp') ),
              true
               );

      {atualizar o executavel através de um arquivo BAT, crido na pasta windows/ temp}
      nomeDOS := 'C:\LAJES TRIUNFO\' + 'LajesTriunfo.Exe'; // exe a ser atualizado

      lista := TStringList.Create;
      try

        try
          lista.Clear;
          nomeBAT := GetTmpFileName('.bat');
          lista.Add(':Label1');
          lista.Add('@echo off');
          lista.Add('del ' + nomeDOS);
          lista.Add('if Exist ' + nomeDOS + ' goto Label1');
          lista.Add('Move ' + ExtractFilePath( nomeDOS ) + ExtractName( nomeDOS ) + '.tmp' + ' ' + nomeDOS );
          lista.Add('TIMEOUT  5');
          lista.Add('Call ' + nomeDOS);
          lista.Add('del ' + nomeBAT);
          lista.SaveToFile(nomeBAT);
          Application.ProcessMessages;
          ChDir(uAtualizaSistema.GetTmpDir);
          KillProcess(  Application.Handle, nomeBAT);
          Application.Terminate;
          Abort;
        finally
          result := true;
          FreeAndNil( lista );
        end;

      except
        ShowMessage('Erro ao atualizar sistema');
      end;
    end
    else
    begin
      ShowMessage('Arquivo .exe não encontrado na pasta de temporarios');
    end;
  end
  else
  begin
    ShowMessage('NÃO foi possivel atualizar o sistema' + sLineBreak +
                'Arquivo executável não encontrado na pasta local  ');
  end;

end;


end.
