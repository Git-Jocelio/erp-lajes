unit unit_atualizacao_banco_de_dados;

interface

uses
  FireDAC.Comp.Client, Vcl.Forms, udmConn, Vcl.StdCtrls, System.SysUtils,
  Vcl.Dialogs;

procedure cria_mensagem_no_memo( memo :TMemo; mensagem: string );
procedure prc_atualizar_tabelas( memo: TMemo );
procedure prc_atualiza_versao_do_banco( versao : string );

implementation



procedure cria_mensagem_no_memo( memo :TMemo; mensagem: string );
begin
   memo.Visible := true;
   memo.Lines.Add('');
   memo.Lines.Add(mensagem);
end;

procedure prc_atualiza_versao_do_banco( versao : string );
var
  loQry : TFDQuery;
begin
  {versao é composto por: ano + qtde de tabelas no banco + sequencial
  exemplo : iniciei(18/09/2024) hoje com : '2024.62.0001'}

  try
    loQry := TFDQuery.Create( application );
    loQry.Connection := dmConn.FDConnection;
    loqry.SQL.Clear;
    loqry.SQL.Add(' update BANCO_VERSAO set VERSAO = :VERSAO, NUMERO_VERSAO = :NUMERO_VERSAO, ALTERADO_EM = :ALTERADO_EM ');
    loQry.ParamByName('VERSAO').AsInteger       := 1 ;
    loQry.ParamByName('NUMERO_VERSAO').AsString := versao ;
    loQry.ParamByName('ALTERADO_EM').AsDate     := DATE ;
    loQry.ExecSQL;
    loQry.Close;
  finally
    freeandNil( loQry );
  end;

end;



procedure prc_atualizar_tabelas( memo: TMemo );
var
  loQry : TFDQuery;
begin


  try
    loQry := TFDQuery.Create( application );
    loQry.Connection := dmConn.FDConnection;

    //CRIAÇÃO DA TABELA DE CONFIGURACOES_SISTEMA
    try
      { ver a tabela de CONFIGURACOES_SISTEMA existe}
      loqry.Open('select ID from CONFIGURACOES_SISTEMA  where 1=1');
      loqry.Close;

    except

      // tabela de CONFIGURACOES_SISTEMA
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE CONFIGURACOES_SISTEMA (                   ');
      loqry.SQL.Add('    ID                               INTEGER NOT NULL, ');
      loqry.SQL.Add('    GERAL_EMPRESA                    VARCHAR(50),      ');
      loqry.SQL.Add('    PEDIDO_CONTA_COMISSAO_VEND       SMALLINT,         ');
      loqry.SQL.Add('    PEDIDO_CONTA_COMISSAO_ADM        SMALLINT,         ');
      loqry.SQL.Add('    PEDIDO_RELATORIOS_LOGO_PEDIDO    VARCHAR(255),     ');
      loqry.SQL.Add('    PEDIDO_OUTROS_MOSTRA_ID_PEDIDO   VARCHAR(1),       ');
      loqry.SQL.Add('    CUSTOS_PERC_VENDEDOR             DECIMAL(18,2),    ');
      loqry.SQL.Add('    CUSTOS_PERC_BALCAO               DECIMAL(18,2),    ');
      loqry.SQL.Add('    PEDIDO_OUTROS_FORMA_PGTO          VARCHAR(1)       ');
      loqry.SQL.Add(')                                                      ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " TABELA DE CONFIGURACOES_SISTEMA " com sucesso no Banco de Dados');

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONFIGURACOES_SISTEMA ADD CONSTRAINT PK_CONFIGURACOES_SISTEMA PRIMARY KEY (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " Primary keys na Tabela de CONFIGURACOES_SISTEMA " com sucesso no Banco de Dados');
    end;




    try
      loqry.SQL.Clear;
      { ver se o campo ATIVO existe na tabela EMPRESA}
      loqry.Open('select ATIVO from EMPRESA');
      loqry.Close;
    Except
      {2024/09/18 criar campo ATIVO tipo VARCHAR na tabela EMPRESA}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE EMPRESA ADD ATIVO VARCHAR(1)') ;
      loqry.ExecSQL;
      //cria_mensagem_no_memo( mm_atualizao_banco, 'criado campo "ATIVO"  com sucesso na tabela EMPRESA' );
      cria_mensagem_no_memo( memo, 'criado campo "ATIVO"  com sucesso na tabela EMPRESA' );
      //prc_atuliza_versao_do_banco('2024.61.0001');
    end;


    try
      loqry.SQL.Clear;
      { ver se o campo NUMERO_VERSAO existe na tabela BANCO_VERSAO}
      loqry.Open('select NUMERO_VERSAO from BANCO_VERSAO');
      loqry.Close;
    Except
      {2024/09/18 criar campo NUMERO_VERSAO tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE BANCO_VERSAO ADD NUMERO_VERSAO VARCHAR(50)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "NUMERO_VERSAO"  com sucesso na tabela BANCO_VERSAO');
      //prc_atuliza_versao_do_banco('2024.61.0002');
    end;


    try
      { ver se o campo ALTERADO_EM existe na tabela BANCO_VERSAO}
      loqry.Open('select ALTERADO_EM from BANCO_VERSAO');
      loqry.Close;

    Except
      {2024/09/18 criar campo ALTERADO_EM tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE BANCO_VERSAO ADD ALTERADO_EM DATE') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "ALTERADO_EM" com sucesso na tabela BANCO_VERSAO');
      prc_atualiza_versao_do_banco('2024.62.0003');

    end;

    //CRIAÇÃO DA TABELA DE PLANO DE CONTAS
    try
      { ver a tabela de PLANO DE CONTAS existe}
      loqry.Open('select TIPO from PLANO_CONTAS where 1=1');
      loqry.Close;

    except

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD CADASTRADO_EM DATE');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD ALTERADO_EM DATE');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD NR_CONTA VARCHAR(15)');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD TIPO  VARCHAR(1)');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD DESCRICAO VARCHAR(100)');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD CUSTO_FIXO VARCHAR(1) ');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD CUSTO_VARIAVEL VARCHAR(1)');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD VAI_PARA_DRE VARCHAR(1)');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD VAI_PARA_FLUXO_CAIXA  VARCHAR(1)');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD VAI_PARA_BALANCO  VARCHAR(1)');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PLANO_CONTAS ADD ATIVO  VARCHAR(1) ');
      loqry.ExecSQL;

    end;

    //vendedores
    try
      { ver a tabela de PLANO DE CONTAS existe}
      loqry.Open('select COMISSAO_VENDEDOR from VENDEDORES where 1=1');
      loqry.Close;

    except
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE VENDEDORES ADD COMISSAO_VENDEDOR DECIMAL(18,2)');
      loqry.ExecSQL;
    end;

    //vendedores
    try
      { ver a tabela de PLANO DE CONTAS existe}
      loqry.Open('select COMISSAO_ADM from VENDEDORES where 1=1');
      loqry.Close;

    except
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE VENDEDORES ADD COMISSAO_ADM DECIMAL(18,2)');
      loqry.ExecSQL;
    end;
//
   // MAO_OBRA
    try
      { ver a tabela de MAO_OBRA existe}
      loqry.Open('select ID from MAO_OBRA where 1=1');
      loqry.Close;

    except

      // tabela de MAO_OBRA
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE MAO_OBRA (              ');
      loqry.SQL.Add('    ID             INTEGER NOT NULL, ');
      loqry.SQL.Add('    CADASTRADO_EM  DATE,             ');
      loqry.SQL.Add('    ALTERADO_EM    DATE,             ');
      loqry.SQL.Add('    DESCRICAO      VARCHAR(100),     ');
      loqry.SQL.Add('    VALOR          DECIMAL(15,2),    ');
      loqry.SQL.Add('    UNIDADE        VARCHAR(2),       ');
      loqry.SQL.Add('    ATIVO          VARCHAR(1)        ');
      loqry.SQL.Add(')                                    ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado "TABELA DE MAO_OBRA" com sucesso no Banco de Dados');

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE MAO_OBRA ADD CONSTRAINT PK_MAO_OBRA PRIMARY KEY (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "Primary keys na Tabela de MAO_OBRA " com sucesso no Banco de Dados');

      prc_atualiza_versao_do_banco('2024.62.0004');
    end; //


//

   // PRODUTOS_VIGA_COMP_MO
    try
      { ver a tabela de PRODUTOS_VIGA_COMP_MO existe}
      loqry.Open('select ID from PRODUTOS_VIGA_COMP_MO where 1=1');
      loqry.Close;

    except

      // tabela de PRODUTOS_VIGA_COMP_MO
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE PRODUTOS_VIGA_COMP_MO (       ');
      loqry.SQL.Add('    ID                   INTEGER NOT NULL, ');
      loqry.SQL.Add('    PRODUTO_ID           INTEGER,          ');
      loqry.SQL.Add('    MAO_OBRA_ID          INTEGER,          ');
      loqry.SQL.Add('    PROD_VIGA_CONFIG_ID  INTEGER,          ');
      loqry.SQL.Add('    VALOR                DECIMAL(15,2),    ');
      loqry.SQL.Add('    COMPRIMENTO          SMALLINT,         ');
      loqry.SQL.Add('    EIXO                 SMALLINT          ');
      loqry.SQL.Add(')                                          ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado "TABELA DE PRODUTOS_VIGA_COMP_MO" com sucesso no Banco de Dados');

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUTOS_VIGA_COMP_MO ADD CONSTRAINT PK_PRODUTOS_VIGA_COMP_MO PRIMARY KEY (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "Primary keys na Tabela de PRODUTOS_VIGA_COMP_MO " com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUTOS_VIGA_COMP_MO ADD CONSTRAINT FK_PRODUTOS_VIGA_COMP_MO_1 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ');
      loqry.ExecSQL;

      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUTOS_VIGA_COMP_MO ADD CONSTRAINT FK_PRODUTOS_VIGA_COMP_MO_2 FOREIGN KEY (MAO_OBRA_ID) REFERENCES MAO_OBRA (ID) ');
      loqry.ExecSQL;

      //comentario
      loQry.SQL.Clear;
      loqry.SQL.Add(' COMMENT ON COLUMN PRODUTOS_VIGA_COMP_MO.PROD_VIGA_CONFIG_ID IS ' + QuotedStr( 'ID DA TABELA PRODUTOS_VIGAS_COMPOSICAO' ) + ' ');
      loqry.ExecSQL;
      //comentario
      loQry.SQL.Clear;
      loqry.SQL.Add(' COMMENT ON COLUMN PRODUTOS_VIGA_COMP_MO.VALOR IS ' + QuotedStr( 'VALOR VEM DA TABELA MAO_OBRA' ) + ' ');
      loqry.ExecSQL;

      prc_atualiza_versao_do_banco('2024.62.0004');
    end; //



    //19/09/2024 CRIAÇÃO DA TABELA DE COMPRAS
    try
      { ver a tabela de COMPRAS existe}
      loqry.Open('select COMPRAS_ID from COMPRAS where 1=1');
      loqry.Close;

    except
      // generator
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE GENERATOR GEN_COMPRAS_ID');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "GENERATOR GEN_COMPRAS_ID" com sucesso no Banco de Dados');

      // tabela de compras
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE COMPRAS (                  ');
      loqry.SQL.Add('    COMPRAS_ID        INTEGER NOT NULL, ');
      loqry.SQL.Add('    CADASTRADO_EM     DATE,             ');
      loqry.SQL.Add('    ALTERADO_EM       DATE,             ');
      loqry.SQL.Add('    DATA_CONTABIL     DATE,             ');
      loqry.SQL.Add('    NUMERO_DOCUMENTO  VARCHAR(50),      ');
      loqry.SQL.Add('    FORMAS_PAGTO_ID   INTEGER,          ');
      loqry.SQL.Add('    ABERTO_ENTREGUE   VARCHAR(1),       ');
      loqry.SQL.Add('    PLANO_CONTAS_ID   INTEGER,          ');
      loqry.SQL.Add('    FORNECEDOR_ID     INTEGER,          ');
      loqry.SQL.Add('    VALOR_PRODUTOS    DECIMAL(15,2),    ');
      loqry.SQL.Add('    ACRESCIMOS        DECIMAL(15,2),    ');
      loqry.SQL.Add('    DESCONTOS         DECIMAL(15,2),    ');
      loqry.SQL.Add('    VALOR_COMPRA      DECIMAL(15,2),    ');
      loqry.SQL.Add('    VALOR_PAGO        DECIMAL(15,2),    ');
      loqry.SQL.Add('    RECEBEMOS_EM      DATE,             ');
      loqry.SQL.Add('    USUARIO_ID        INTEGER,          ');
      loqry.SQL.Add('    ATIVO             VARCHAR(1)        ');
      loqry.SQL.Add(')                                       ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "TABELA DE COMPRAS" com sucesso no Banco de Dados');

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS ADD CONSTRAINT PK_COMPRAS PRIMARY KEY (COMPRAS_ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "Primary keys na Tabela de compras" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS ADD CONSTRAINT FK_COMPRAS_1 FOREIGN KEY (FORMAS_PAGTO_ID) REFERENCES FORMAS_PAGTO (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "FK_COMPRAS_1 na Tabela de compras" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS ADD CONSTRAINT FK_COMPRAS_2 FOREIGN KEY (PLANO_CONTAS_ID) REFERENCES PLANO_CONTAS (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "FK_COMPRAS_2 na Tabela de compras" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS ADD CONSTRAINT FK_COMPRAS_3 FOREIGN KEY (FORNECEDOR_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "FK_COMPRAS_3 na Tabela de compras" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS ADD CONSTRAINT FK_COMPRAS_4 FOREIGN KEY (USUARIO_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "FK_COMPRAS_4 na Tabela de compras" com sucesso no Banco de Dados');

      //trigger
      loQry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER COMPRAS_BI FOR COMPRAS  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                 ');
      loqry.SQL.Add(' as                                              ');
      loqry.SQL.Add(' begin                                           ');
      loqry.SQL.Add('   if (new.compras_id is null) then              ');
      loqry.SQL.Add('     new.compras_id = gen_id(gen_compras_id,1);  ');
      loqry.SQL.Add(' end                                             ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "trigger na Tabela de compras" com sucesso no Banco de Dados');

      //comentario
      loQry.SQL.Clear;
      loqry.SQL.Add(' COMMENT ON COLUMN COMPRAS.ABERTO_ENTREGUE IS ' + QuotedStr( 'ABERTO = A ENTREGUE = E' ) + ' ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado cometário na Tabela de compras" com sucesso no Banco de Dados');

      prc_atualiza_versao_do_banco('2024.62.0004');
      // fim da criação da tebela de compras
    end; // except da criação da tabela de compras

    //CRIAÇÃO DA TABELA COMPRAS_ITENS
    try

      { ver a tabela de COMPRAS_ITENS existe}
      loqry.Open('select COMPRAS_ITENS_ID from COMPRAS_ITENS where 1=1');
      loqry.Close;

    except
      // generator
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE GENERATOR GEN_COMPRAS_ITENS_ID');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "GENERATOR GEN_COMPRAS_ITENS_ID" com sucesso no Banco de Dados');

      // tabela de compras_itens
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE COMPRAS_ITENS (           ');
      loqry.SQL.Add('    COMPRAS_ITENS_ID INTEGER NOT NULL, ');
      loqry.SQL.Add('    COMPRAS_ID INTEGER NOT NULL,       ');
      loqry.SQL.Add('    PRODUTO_ID INTEGER,                ');
      loqry.SQL.Add('    QUANTIDADE DECIMAL(15,2),          ');
      loqry.SQL.Add('    UNITARIO   DECIMAL(15,2),          ');
      loqry.SQL.Add('    ACRESCIMO  DECIMAL(15,2),          ');
      loqry.SQL.Add('    DESCONTOS  DECIMAL(15,2),          ');
      loqry.SQL.Add('    TOTAL      DECIMAL(15,2)           ');
      loqry.SQL.Add(')                                      ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "TABELA DE COMPRAS_ITENS" com sucesso no Banco de Dados');

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS_ITENS ADD CONSTRAINT PK_COMPRAS_ITENS PRIMARY KEY (COMPRAS_ITENS_ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "Primary keys na Tabela de COMPRAS_ITENS" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS_ITENS ADD CONSTRAINT FK_COMPRAS_ITENS_1 FOREIGN KEY (COMPRAS_ID) REFERENCES COMPRAS (COMPRAS_ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "FK_COMPRAS_ITENS_1 na Tabela de COMPRAS_ITENS" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE COMPRAS_ITENS ADD CONSTRAINT FK_COMPRAS_ITENS_2 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "FK_COMPRAS_ITENS_2 na Tabela de COMPRAS_ITENS" com sucesso no Banco de Dados');

      //trigger
      loQry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER COMPRAS_ITENS_BI FOR COMPRAS_ITENS  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                             ');
      loqry.SQL.Add(' as                                                          ');
      loqry.SQL.Add(' begin                                                       ');
      loqry.SQL.Add('   if (new.compras_itens_id is null) then                    ');
      loqry.SQL.Add('     new.compras_itens_id = gen_id(gen_compras_itens_id,1);  ');
      loqry.SQL.Add(' end                                                         ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "trigger COMPRAS_ITENS_BI na Tabela de COMPRAS_ITENS" com sucesso no Banco de Dados');

    end; // except da criação da tabela de compras_itens

    // criar campo eixo
    try
      { ver se o campo eixo_laje existe na tabela configuracao_sistema}
      loqry.SQL.Clear;
      loqry.Open('select EIXO_LAJE from CONFIGURACOES_SISTEMA');
      loqry.Close;

    Except
      {2024/11/01 criar campo ALTERADO_EM tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD EIXO_LAJE SMALLINT') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "EIXO_LAJE" com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.62.0005');

    end;

    // criar campo GERAL_QTDE_FORMA_130
    try
      { ver se o campo eixo_laje existe na tabela configuracao_sistema}
      loqry.Open('select GERAL_QTDE_FORMA_130 from CONFIGURACOES_SISTEMA');
      loqry.Close;

    Except
      {2024/11/01 criar campo ALTERADO_EM tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD GERAL_QTDE_FORMA_130 INTEGER') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " GERAL_QTDE_FORMA_130 " com sucesso na tabela CONFIGURACOES_SISTEMA');

    end;

    // criar campo GERAL_QTDE_FORMA_250
    try
      { ver se o campo eixo_laje existe na tabela configuracao_sistema}
      loqry.Open('select GERAL_QTDE_FORMA_250 from CONFIGURACOES_SISTEMA');
      loqry.Close;

    Except
      {2024/11/01 criar campo ALTERADO_EM tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD GERAL_QTDE_FORMA_250 INTEGER') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " GERAL_QTDE_FORMA_250 " com sucesso na tabela CONFIGURACOES_SISTEMA');

    end;

    // criacão da tabela  ESTOQUES_MOVIMENTACAO
    try
      loqry.SQL.Clear;
      loqry.Open('select ESTOQUES_ID from ESTOQUES_MOVIMENTACAO  where 1=1');
      loqry.Close;
    Except
      // generator
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE GENERATOR GEN_ESTOQUES_MOVIMENTACAO_ID ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " GENERATOR GEN_ESTOQUES_MOVIMENTACAO_ID " com sucesso no Banco de Dados');

      // tabela de ESTOQUES_MOVIMENTACAO
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE ESTOQUES_MOVIMENTACAO (    ');
      loqry.SQL.Add('    ESTOQUES_ID       INTEGER NOT NULL, ');
      loqry.SQL.Add('    TABELA_ORIGEM     VARCHAR(100),     ');
      loqry.SQL.Add('    TABELA_ORIGEM_ID  INTEGER,          ');
      loqry.SQL.Add('    PRODUTO_ID        INTEGER,          ');
      loqry.SQL.Add('    DATA              DATE,             ');
      loqry.SQL.Add('    HISTORICO         VARCHAR(100),     ');
      loqry.SQL.Add('    ENTRADA           DECIMAL(18,2),    ');
      loqry.SQL.Add('    SAIDA             DECIMAL(18,2),    ');
      loqry.SQL.Add('    ESTOQUE_FISICO    DECIMAL(18,2),    ');
      loqry.SQL.Add('    ALTERADO_EM       DATE              ');
      loqry.SQL.Add(')                                       ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado tabela " ESTOQUES_MOVIMENTACAO " com sucesso no Banco de Dados');
      //

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE ESTOQUES_MOVIMENTACAO ADD CONSTRAINT PK_ESTOQUES_MOVIMENTACAO PRIMARY KEY (ESTOQUES_ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "Primary keys na Tabela de ESTOQUES_MOVIMENTACAO" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE ESTOQUES_MOVIMENTACAO ADD CONSTRAINT FK_ESTOQUES_MOVIMENTACAO_1 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "FK_ESTOQUES_MOVIMENTACAO_1 na Tabela de ESTOQUES_MOVIMENTACAO" com sucesso no Banco de Dados');

      //trigger
      loQry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER ESTOQUES_MOVIMENTACAO_BI FOR ESTOQUES_MOVIMENTACAO  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                               ');
      loqry.SQL.Add(' as                                                            ');
      loqry.SQL.Add(' begin                                                         ');
      loqry.SQL.Add('   if (new.estoques_id is null) then                           ');
      loqry.SQL.Add('     new.estoques_id = gen_id(gen_estoques_movimentacao_id,1); ');
      loqry.SQL.Add(' end                                                           ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "trigger ESTOQUES_MOVIMENTACAO_BI na Tabela de ESTOQUES_MOVIMENTACAO" com sucesso no Banco de Dados');

    end;// fim da criação da tabela de estoques_movimentacao

    // criacão da tabela  PRODUCAO_VIGAS
    try
      loqry.SQL.Clear;
      loqry.Open('select PRODUCAO_ID from PRODUCAO_VIGAS where 1=1');
      loqry.Close;

    Except
      // generator
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE GENERATOR GEN_PRODUCAO_VIGAS_ID ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " GENERATOR GEN_PRODUCAO_VIGAS_ID " com sucesso no Banco de Dados');

      // tabela de PRODUCAO_VIGAS
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE PRODUCAO_VIGAS (         ');
      loqry.SQL.Add('    PRODUCAO_ID     INTEGER NOT NULL, ');
      loqry.SQL.Add('    CADASTRADO_EM   DATE,             ');
      loqry.SQL.Add('    ALTERADO_EM     DATE,             ');
      loqry.SQL.Add('    TIPO_FORMA      INTEGER,          ');
      loqry.SQL.Add('    QTDE_VIGAS      INTEGER,          ');
      loqry.SQL.Add('    QTDE_PRODUZIDA  DECIMAL(15,2),    ');
      loqry.SQL.Add('    QTDE_CIMENTO    DECIMAL(15,2)     ');
      loqry.SQL.Add(')                                     ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado tabela "PRODUCAO_VIGAS" com sucesso no Banco de Dados');

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_VIGAS ADD CONSTRAINT PK_PRODUCAO_VIGAS PRIMARY KEY (PRODUCAO_ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "Primary keys na Tabela de PRODUCAO_VIGAS" com sucesso no Banco de Dados');

      //trigger
      loQry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PRODUCAO_VIGAS_BI FOR PRODUCAO_VIGAS  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                               ');
      loqry.SQL.Add(' as                                                            ');
      loqry.SQL.Add(' begin                                                         ');
      loqry.SQL.Add('   if (new.producao_id is null) then                           ');
      loqry.SQL.Add('     new.producao_id = gen_id(gen_producao_vigas_id,1);        ');
      loqry.SQL.Add(' end                                                           ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "trigger PRODUCAO_VIGAS_BI na Tabela de PRODUCAO_VIGAS" com sucesso no Banco de Dados');

      //comentario
      loQry.SQL.Clear;
      loqry.SQL.Add(' COMMENT ON COLUMN PRODUCAO_VIGAS.TIPO_FORMA IS ' + QuotedStr( '130 ou 250' ) + ' ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado cometário na Tabela de " PRODUCAO_VIGAS " com sucesso no Banco de Dados');
      //comentario
      loQry.SQL.Clear;
      loqry.SQL.Add(' COMMENT ON COLUMN PRODUCAO_VIGAS.QTDE_PRODUZIDA IS ' + QuotedStr( 'em mts lineares') + ' ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado cometário na Tabela de " PRODUCAO_VIGAS " com sucesso no Banco de Dados');
      //comentario
      loQry.SQL.Clear;
      loqry.SQL.Add(' COMMENT ON COLUMN PRODUCAO_VIGAS.QTDE_CIMENTO IS ' + QuotedStr( 'em mts lineares') + ' ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado cometário na Tabela de " PRODUCAO_VIGAS " com sucesso no Banco de Dados');

    end;// fim da criação da tabela PRODUCAO_VIGAS

    // criacão da tabela PRODUCAO_VIGAS_ITENS
    try
      loqry.SQL.Clear;
      loqry.Open('select ID from PRODUCAO_VIGAS_ITENS where 1=1');
      loqry.Close;

    Except
      // generator
      loQry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_PRODUCAO_VIGAS_ITENS_ID ');
      loqry.ExecSQL;

      cria_mensagem_no_memo( memo,'criado campo " GEN_PRODUCAO_VIGAS_ITENS_ID " com sucesso no Banco de Dados');
      // tabela de PRODUCAO_VIGAS
      loQry.SQL.Clear;
      loqry.SQL.Add('CREATE TABLE PRODUCAO_VIGAS_ITENS (      ');
      loqry.SQL.Add('    ID                 INTEGER NOT NULL, ');
      loqry.SQL.Add('    PRODUCAO_VIGAS_ID  INTEGER,          ');
      loqry.SQL.Add('    PRODUTO_ID         INTEGER,          ');
      loqry.SQL.Add('    QUANTIDADE         INTEGER           ');
      loqry.SQL.Add(')                                        ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado tabela " PRODUCAO_VIGAS_ITENS " com sucesso no Banco de Dados');

      //Primary keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_VIGAS_ITENS ADD CONSTRAINT PK_PRODUCAO_VIGAS_ITENS PRIMARY KEY (ID)');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "Primary keys na Tabela de PRODUCAO_VIGAS_ITENS" com sucesso no Banco de Dados');

      //foreing keys
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_VIGAS_ITENS ADD CONSTRAINT FK_PRODUCAO_VIGAS_ITENS_1 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " FK_PRODUCAO_VIGAS_ITENS_1 na Tabela de  PRODUCAO_VIGAS_ITENS " com sucesso no Banco de Dados');

      //trigger
      loQry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PRODUCAO_VIGAS_ITENS_BI FOR PRODUCAO_VIGAS_ITENS  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                           ');
      loqry.SQL.Add(' as                                                                        ');
      loqry.SQL.Add(' begin                                                                     ');
      loqry.SQL.Add('   if (new.id is null) then                                                ');
      loqry.SQL.Add('     new.id = gen_id(gen_producao_vigas_itens_id,1);                       ');
      loqry.SQL.Add(' end                                                                       ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "trigger PRODUCAO_VIGAS_ITENS_BI na Tabela de PRODUCAO_VIGAS_ITENS" com sucesso no Banco de Dados');

      prc_atualiza_versao_do_banco('2024.66.0006');

    end;// fim da criacão da tabela PRODUCAO_VIGAS_ITENS

    try
      loqry.SQL.Clear;
      { ver se o campo liberar_sistema existe na tabela configuracoes_sistema}
      loqry.Open('select GERAL_LIBERAR_SISTEMA from configuracoes_sistema');
      loqry.Close;
    Except
      {criar campo liberar_sistema tipo VARCHAR na tabela configuracoes_sistema}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE configuracoes_sistema ADD GERAL_LIBERAR_SISTEMA VARCHAR(255)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado campo " GERAL_LIBERAR_SISTEMA "  com sucesso na tabela configuracoes_sistema' );
      prc_atualiza_versao_do_banco('2024.66.0007');
    end;

    try
      { ver se o campo DATA_ENTREGA existe na tabela PEDIDOS_ITENS}
      loqry.Open('select DATA_ENTREGA from PEDIDOS_ITENS');
      loqry.Close;

    Except
      {2024/11/13 criar campo DATA_ENTREGA tipo VARCHAR na tabela PEDIDOS_ITENS}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE PEDIDOS_ITENS ADD DATA_ENTREGA DATE') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " DATA_ENTREGA " com sucesso na tabela PEDIDOS_ITENS');
      prc_atualiza_versao_do_banco('2024.66.0008');

    end;

    try
      loqry.SQL.Clear;
      { ver se o campo CHAVE existe na tabela EMPRESA}
      loqry.Open('select CHAVE from EMPRESA');
      loqry.Close;
    Except
      {2024/11/19 criar campo CHAVE tipo VARCHAR na tabela EMPRESA}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE EMPRESA ADD CHAVE VARCHAR(255)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado campo " CHAVE "  com sucesso na tabela EMPRESA' );
      prc_atualiza_versao_do_banco('2024.66.0009');
    end;

    try
      loqry.SQL.Clear;
      { ver se o campo PEDIDO_RELATORIOS_MOSTRAR_BOTAO_CONTRATO existe na tabela configuracoes_sistema}
      loqry.Open('select PED_REL_MOSTRAR_BTN_CONTRATO from configuracoes_sistema');
      loqry.Close;
    Except
      {22/11/2024 criar campo PEDIDO_RELATORIOS_MOSTRAR_BOTAO_CONTRATO tipo VARCHAR na tabela configuracoes_sistema}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE configuracoes_sistema ADD PED_REL_MOSTRAR_BTN_CONTRATO VARCHAR(1)') ;
      loqry.ExecSQL;
      //
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE configuracoes_sistema ADD PED_REL_MOSTRAR_BTN_COMISSAO VARCHAR(1)') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add('update configuracoes_sistema set PED_REL_MOSTRAR_BTN_CONTRATO =:PED_REL_MOSTRAR_BTN_CONTRATO') ;
      loqry.ParamByName('PED_REL_MOSTRAR_BTN_CONTRATO').AsString := 'N';
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add('update configuracoes_sistema set PED_REL_MOSTRAR_BTN_COMISSAO =:PED_REL_MOSTRAR_BTN_COMISSAO') ;
      loqry.ParamByName('PED_REL_MOSTRAR_BTN_COMISSAO').AsString := 'S';
      loqry.ExecSQL;


      cria_mensagem_no_memo( memo, 'criado campo " PED_REL_MOSTRAR_BTN_CONTRATO "  com sucesso na tabela configuracoes_sistema' );
      prc_atualiza_versao_do_banco('2024.66.0010');
    end;

    // criação da tabela de ordem de compra
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ordem_compra_id from ordem_compra where 1=1');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_ORDEM_COMPRA_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE ORDEM_COMPRA (            ') ;
      loqry.SQL.Add('     ORDEM_COMPRA_ID  INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM    DATE,             ') ;
      loqry.SQL.Add('     HORA             TIME,             ') ;
      loqry.SQL.Add('     PRODUTO_ID       INTEGER,          ') ;
      loqry.SQL.Add('     STATUS           VARCHAR(1),       ') ;
      loqry.SQL.Add('     COMPRA_ID        INTEGER           ') ;
      loqry.SQL.Add(' )                                      ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE ORDEM_COMPRA ADD CONSTRAINT PK_ORDEM_COMPRA PRIMARY KEY (ORDEM_COMPRA_ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE ORDEM_COMPRA ADD CONSTRAINT FK_ORDEM_COMPRA_1 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER ORDEM_COMPRA_BI FOR ORDEM_COMPRA ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.ordem_compra_id is null) then                  ');
      loqry.SQL.Add('     new.ordem_compra_id = gen_id(gen_ordem_compra_id,1); ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;

      cria_mensagem_no_memo( memo, 'criado tabela " ordem de compra "  com sucesso na tabela configuracoes_sistema' );
      prc_atualiza_versao_do_banco('2024.67.0010');
    end;

    // criar PEDIDO_MOSTRAR_ABA_FINANCEIRO
    try
      { ver se o campo PEDIDO_MOSTRAR_ABA_FINANCEIRO existe na tabela configuracao_sistema}
      loqry.SQL.Clear;
      loqry.Open('select PEDIDO_MOSTRAR_ABA_FINANCEIRO from CONFIGURACOES_SISTEMA');
      loqry.Close;

    Except
      {01/01/2025 criar campo PEDIDO_MOSTRAR_ABA_FINANCEIRO tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PEDIDO_MOSTRAR_ABA_FINANCEIRO VARCHAR(1)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PEDIDO_MOSTRAR_ABA_FINANCEIRO " com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.67.0011');
    end;

    // criação da tabela de prestadores de serviço
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select id from PRESTADORES_SERVICOS where 1=1');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_PRESTADORES_SERVICOS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE PRESTADORES_SERVICOS (       ') ;
      loqry.SQL.Add('     ID                  INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     PESSOA_ID           INTEGER,          ') ;
      loqry.SQL.Add('     DESCRICAO_SERVICO   VARCHAR(255),     ') ;
      loqry.SQL.Add('     CONTATO             VARCHAR(60),      ') ;
      loqry.SQL.Add('     CELULAR             VARCHAR(50),      ') ;
      loqry.SQL.Add('     ATIVO                VARCHAR(1)       ') ;
      loqry.SQL.Add(' )                                         ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRESTADORES_SERVICOS ADD CONSTRAINT PK_PRESTADORES_SERVICOS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRESTADORES_SERVICOS ADD CONSTRAINT FK_PRESTADORES_SERVICOS_PESSOA FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ON DELETE NO ACTION ON UPDATE CASCADE ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PRESTADORES_SERVICOS_BI FOR PRESTADORES_SERVICOS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                  ');
      loqry.SQL.Add('     new.id = gen_id(gen_prestadores_servicos_id,1); ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " PRESTADORES_SERVICO "  com sucesso ' );
      prc_atualiza_versao_do_banco('2024.68.0011');

    end;

    //PEDIDOS_ITENS
    try
      { incluir campo novo na tabela de pedidos}
      loqry.Open('select QTDE_REAL_LAJE from PEDIDOS_ITENS where 1=1');
      loqry.Close;

    except
      loQry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PEDIDOS_ITENS ADD QTDE_REAL_LAJE DECIMAL(15,2)');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado campo " QTDE_REAL_LAJE "  com sucesso ' );
      prc_atualiza_versao_do_banco('2024.68.0012');
    end;

    // CONFIGURACOES_SISTEMA
    try
      loqry.SQL.Clear;
      loqry.Open('select PEDIDO_CALCULAR_LAJE_POR_VIGA from CONFIGURACOES_SISTEMA');
      loqry.Close;

    Except
      {01/01/2025 criar campo PEDIDO_CALCULAR_LAJE_POR_VIGA tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PEDIDO_CALCULAR_LAJE_POR_VIGA VARCHAR(1)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PEDIDO_CALCULAR_LAJE_POR_VIGA " com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.69.0011');
    end;

    // PEDIDOS_CONCRETOS
    try
      loqry.SQL.Clear;
      loqry.Open('select FUNCIONARIO from PEDIDOS_CONCRETOS');
      loqry.Close;

    Except
      {13/01/2025 criar campo PEDIDO_CALCULAR_LAJE_POR_VIGA tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE PEDIDOS_CONCRETOS ADD FUNCIONARIO VARCHAR(60)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " FUNCIONARIO " com sucesso na tabela PEDIDOS_CONCRETOS');
      prc_atualiza_versao_do_banco('2024.70.0011');
    end;

    // PEDIDOS_CONCRETOS
    try
      loqry.SQL.Clear;
      loqry.SQL.ADD('select * from rdb$triggers where upper(rdb$trigger_name) = :TRIGGER');
      LOQRY.ParamByName('TRIGGER').AsString := 'PEDIDOS_CONCRETOS_BI';
      loqry.OPEN;

    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_PEDIDOS_CONCRETOS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PEDIDOS_CONCRETOS_BI FOR PEDIDOS_CONCRETOS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                  ');
      loqry.SQL.Add('     new.id = gen_id(gen_pedidos_concretos_id,1); ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado TRIGGER " PEDIDOS_CONCRETOS_BI "  com sucesso ' );
      prc_atualiza_versao_do_banco('2024.71.0011');
    end;

    // PEDIDOS_CONCRETO_ITENS
    try
      loqry.SQL.Clear;
      loqry.SQL.ADD('select * from rdb$triggers where upper(rdb$trigger_name) = :TRIGGER');
      LOQRY.ParamByName('TRIGGER').AsString := 'PEDIDOS_CONCRETO_ITENS_BI';
      loqry.OPEN;
    Except
     //  SHOWMESSAGE('PEDIDOS_CONCRETO_ITENS_BI');
      loqry.SQL.Clear;
      loqry.SQL.Add('CREATE GENERATOR GEN_PEDIDOS_CONCRETO_ITENS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PEDIDOS_CONCRETO_ITENS_BI for pedidos_concreto_itens ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                  ');
      loqry.SQL.Add('     new.id = gen_id(GEN_PEDIDOS_CONCRETO_ITENS_ID,1); ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado TRIGGER " pedidos_concreto_itens_bi "  com sucesso ' );
      prc_atualiza_versao_do_banco('2024.72.0011');
    end;

    // PEDIDOS
    try
      loqry.SQL.Clear;
      loqry.Open('select COMISSAO_VENDEDOR_INFORMADA from PEDIDOS where 1=1');
      loqry.Close;

    Except
      {13/01/2025 criar campo PEDIDO_CALCULAR_LAJE_POR_VIGA tipo VARCHAR na tabela BANCO_VERSAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE PEDIDOS ADD COMISSAO_VENDEDOR_INFORMADA DECIMAL(18,2)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " COMISSAO_VENDEDOR_INFORMADA " com sucesso na tabela PEDIDOS');
      prc_atualiza_versao_do_banco('2025.68.0100');
    end;

    // CONTAS_PAGAR_BAIXA
    try
      loqry.SQL.Clear;
      loqry.Open('select ID from CONTAS_PAGAR_BAIXA where 1=1');
      loqry.Close;

    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CONTAS_PAGAR_BAIXA (      ') ;
      loqry.SQL.Add('     ID               INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM    DATE,             ') ;
      loqry.SQL.Add('     CONTAS_PAGAR_ID  INTEGER,          ') ;
      loqry.SQL.Add('     HISTORICO        VARCHAR(100),     ') ;
      loqry.SQL.Add('     VALOR            DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     FORMA_PAGTO      INTEGER,          ') ;
      loqry.SQL.Add('     USUARIO_ID       INTEGER           ') ;
      loqry.SQL.Add(' )                                      ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_PAGAR_BAIXA ADD CONSTRAINT PK_CONTAS_PAGAR_BAIXA PRIMARY KEY (ID)') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_PAGAR_BAIXA ADD CONSTRAINT FK_CONTAS_PAGAR_BAIXA_1 FOREIGN KEY (FORMA_PAGTO) REFERENCES FORMAS_PAGTO (ID)');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_PAGAR_BAIXA ADD CONSTRAINT FK_CONTAS_PAGAR_BAIXA_2 FOREIGN KEY (USUARIO_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;

      cria_mensagem_no_memo( memo,'criado campo " COMISSAO_VENDEDOR_INFORMADA " com sucesso na tabela PEDIDOS');
      prc_atualiza_versao_do_banco('2025.68.0100');
    end;

    // CONTAS_PAGAR_LANCAMENTOS
    try
      loqry.SQL.Clear;
      loqry.Open('select ID from CONTAS_PAGAR_LANCAMENTOS where 1=1');
      loqry.Close;

    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CONTAS_PAGAR_LANCAMENTOS (') ;
      loqry.SQL.Add('     ID               INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM    DATE,             ') ;
      loqry.SQL.Add('     CONTAS_PAGAR_ID  INTEGER,          ') ;
      loqry.SQL.Add('     HISTORICO        VARCHAR(100),     ') ;
      loqry.SQL.Add('     VALOR            DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     DEBITO_CREDITO      VARCHAR(1)     ') ;
      loqry.SQL.Add(' )                                      ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_PAGAR_LANCAMENTOS ADD CONSTRAINT PK_CONTAS_PAGAR_LANCAMENTOS PRIMARY KEY (ID)') ;
      loqry.ExecSQL;

      cria_mensagem_no_memo( memo,'criado tabela " CONTAS_PAGAR_LANCAMENTOS " com sucesso ');
      prc_atualiza_versao_do_banco('2025.68.0100');
    end;

    // CONFIGURACOES_SISTEMA
    try
      loqry.SQL.Clear;
      loqry.Open('select PEDIDO_CONCRETO_USINADO  from CONFIGURACOES_SISTEMA');
      loqry.Close;
    Except
      {27/01/2025 criar campo PEDIDO_CONCRETO_USINADO  tipo SMALLINT}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PEDIDO_CONCRETO_USINADO SMALLINT') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PEDIDO_CONCRETO_USINADO  " com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.69.101');
    end;

    // CONFIGURACOES_SISTEMA
    try
      loqry.SQL.Clear;
      loqry.Open('select PEDIDO_BOMBA_CONCRETO from CONFIGURACOES_SISTEMA');
      loqry.Close;
    Except
      {27/01/2025 criar campo PEDIDO_CONCRETO_USINADO  tipo SMALLINT}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PEDIDO_BOMBA_CONCRETO  SMALLINT') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PEDIDO_BOMBA_CONCRETO   " com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.69.102');
    end;

    // CONFIGURACOES_SISTEMA
    try
      loqry.SQL.Clear;
      loqry.Open('select PED_REL_MOSTRAR_QTDE_LAJE from CONFIGURACOES_SISTEMA');
      loqry.Close;
    Except
      {29/01/2025 criar campo PED_REL_MOSTRAR_QTDE_LAJE}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PED_REL_MOSTRAR_QTDE_LAJE  VARCHAR(1)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PED_REL_MOSTRAR_QTDE_LAJE   " com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.69.103');
    end;

    // CONFIGURACOES_SISTEMA
    try
      loqry.SQL.Clear;
      loqry.Open('select PED_REL_MOSTRAR_CABECALHO from CONFIGURACOES_SISTEMA');
      loqry.Close;
    Except
      {30/01/2025 criar campo PED_REL_MOSTRAR_CABECALHO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PED_REL_MOSTRAR_CABECALHO  VARCHAR(1)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PED_REL_MOSTRAR_CABECALHO   " com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.69.104');
    end;

    // CONFIGURACOES_SISTEMA
    try
      loqry.SQL.Clear;
      loqry.Open('select PED_REL_MOSTRAR_CABECALHO_PED from CONFIGURACOES_SISTEMA');
      loqry.Close;
    Except
      {30/01/2025 criar campo PED_REL_MOSTRAR_CABECALHO}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PED_REL_MOSTRAR_CABECALHO_PED  VARCHAR(1)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PED_REL_MOSTRAR_CABECALHO_PED   " com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.69.105');
    end;

    // DINHEIRO_MOVIMENTACAO
    try
      loqry.SQL.Clear;
      loqry.Open('select ID from DINHEIRO_MOVIMENTACAO where 1=1');
      loqry.Close;
    Except
      {02/03/2025 criar campo DINHEIRO_MOVIMENTACAO}
      loqry.SQL.Clear;
      loqry.SQL.Add('CREATE GENERATOR GEN_DINHEIRO_MOVIMENTACAO_ID') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE DINHEIRO_MOVIMENTACAO (   ') ;
      loqry.SQL.Add('     ID               INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM    DATE,             ') ;
      loqry.SQL.Add('     HISTORICO        VARCHAR(100),     ') ;
      loqry.SQL.Add('     ENTRADA          DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     SAIDA            DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     SALDO            DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     TABELA_ORIGEM    VARCHAR(255),     ') ;
      loqry.SQL.Add('     TABELA_ORIGEM_ID INTEGER           ') ;
      loqry.SQL.Add(' )                                      ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE DINHEIRO_MOVIMENTACAO ADD CONSTRAINT PK_DINHEIRO_MOVIMENTACAO PRIMARY KEY (ID)') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER DINHEIRO_MOVIMENTACAO_BI FOR DINHEIRO_MOVIMENTACAO ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                      ');
      loqry.SQL.Add(' as                                                   ');
      loqry.SQL.Add(' begin                                                ');
      loqry.SQL.Add('   if (new.id is null) then                           ');
      loqry.SQL.Add('     new.id = gen_id(GEN_DINHEIRO_MOVIMENTACAO_ID,1); ');
      loqry.SQL.Add(' end                                                  ');
      loqry.ExecSQL;


      cria_mensagem_no_memo( memo,'criado TABELA "DINHEIRO_MOVIMENTACAO"   ');
      prc_atualiza_versao_do_banco('2024.70.106');
    end;


    // PRODUCAO_TELAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select id from PRODUCAO_TELAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_PRODUCAO_TELAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE PRODUCAO_TELAS  (           ') ;
      loqry.SQL.Add('     ID                  INTEGER NOT NULL,') ;
      loqry.SQL.Add('     CADASTRADO_EM          DATE,         ') ;
      loqry.SQL.Add('     ACO_ID                 INTEGER,      ') ;
      loqry.SQL.Add('     QTDE_ACO_UTILIZADO     DECIMAL(15,2),') ;
      loqry.SQL.Add('     QTDE_TELAS_PRODUZIDAS  INTEGER,      ') ;
      loqry.SQL.Add('     CONSUMO_POR_TELA       DECIMAL(15,2),') ;
      loqry.SQL.Add('     TIPOS_TELA             SMALLINT,     ') ;
      loqry.SQL.Add('     ESTOQUE_ACO            DECIMAL(18,2) ') ;
      loqry.SQL.Add(' )                                        ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_TELAS ADD CONSTRAINT PK_PRODUCAO_TELAS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_TELAS ADD CONSTRAINT FK_PRODUCAO_TELAS_1 FOREIGN KEY (ACO_ID) REFERENCES PRODUTOS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PRODUCAO_TELAS_BI FOR PRODUCAO_TELAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                              ');
      loqry.SQL.Add(' as                                                           ');
      loqry.SQL.Add(' begin                                                        ');
      loqry.SQL.Add('   if (new.id is null) then                                   ');
      loqry.SQL.Add('     new.id = gen_id(gen_producao_telas_id,1);                ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " PRODUCAO_TELAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.71.127');
    end;

    // PRODUCAO_TELAS_ITENS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select id from PRODUCAO_TELAS_ITENS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_PRODUCAO_TELAS_ITENS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE PRODUCAO_TELAS_ITENS  (     ') ;
      loqry.SQL.Add('     ID                  INTEGER NOT NULL,') ;
      loqry.SQL.Add('     PRODUCAO_ID  INTEGER,       ') ;
      loqry.SQL.Add('     PRODUTO_ID   INTEGER,       ') ;
      loqry.SQL.Add('     PESO_TELA    DECIMAL(15,2), ') ;
      loqry.SQL.Add('     QTDE_TELAS   INTEGER,       ') ;
      loqry.SQL.Add('     ACO_ID       INTEGER,       ') ;
      loqry.SQL.Add('     PESO_TOTAL   DECIMAL(15,2)  ') ;
      loqry.SQL.Add(' )                               ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_TELAS_ITENS ADD CONSTRAINT PK_PRODUCAO_TELAS_ITENS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_TELAS_ITENS ADD CONSTRAINT FK_PRODUCAO_TELAS_ITENS_1 FOREIGN KEY (PRODUTO_ID) REFERENCES PRODUTOS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUCAO_TELAS_ITENS ADD CONSTRAINT FK_PRODUCAO_TELAS_ITENS_2 FOREIGN KEY (ACO_ID) REFERENCES PRODUTOS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PRODUCAO_TELAS_ITENS_BI FOR PRODUCAO_TELAS_ITENS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                              ');
      loqry.SQL.Add(' as                                                           ');
      loqry.SQL.Add(' begin                                                        ');
      loqry.SQL.Add('   if (new.id is null) then                                   ');
      loqry.SQL.Add('     new.id = gen_id(gen_producao_telas_itens_id,1);          ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " PRODUCAO_TELAS_ITENS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end;


    // RECIBOS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select RECIBO_ID from RECIBOS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBOS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBOS  (              ') ;
      loqry.SQL.Add('     RECIBO_ID      INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM  DATE,             ') ;
      loqry.SQL.Add('     VALOR          DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     PESSOA_ID      INTEGER,          ') ;
      loqry.SQL.Add('     USUARIO_ID     INTEGER,          ') ;
      loqry.SQL.Add('     OBSERVACAO     VARCHAR(150),     ') ;
      loqry.SQL.Add('     VALOR_EXTENSO  VARCHAR(255)      ') ;
      loqry.SQL.Add(' )                                    ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBOS ADD CONSTRAINT PK_RECIBOS PRIMARY KEY (RECIBO_ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBOS ADD CONSTRAINT FK_RECIBOS_1 FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBOS ADD CONSTRAINT FK_RECIBOS_2 FOREIGN KEY (USUARIO_ID) REFERENCES PESSOAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBOS_BI FOR RECIBOS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                ');
      loqry.SQL.Add(' as                                             ');
      loqry.SQL.Add(' begin                                          ');
      loqry.SQL.Add('   if (new.recibo_id is null) then              ');
      loqry.SQL.Add('     new.recibo_id = gen_id(gen_recibos_id,1);  ');
      loqry.SQL.Add(' end                                            ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBOS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end;


    // BANCOS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from BANCOS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_BANCOS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE BANCOS  (           ') ;
      loqry.SQL.Add('     ID         INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     PESSOA_ID  INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     COD_BANCO  VARCHAR(10)       ') ;
      loqry.SQL.Add(' )                                ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE BANCOS ADD CONSTRAINT PK_BANCOS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE BANCOS ADD CONSTRAINT FK_BANCOS_1 FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER BANCOS_BI FOR BANCOS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0              ');
      loqry.SQL.Add(' as                                           ');
      loqry.SQL.Add(' begin                                        ');
      loqry.SQL.Add('   if (new.id is null) then                   ');
      loqry.SQL.Add('     new.id = gen_id(gen_bancos_id,1);        ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " BANCOS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM BANCOS


    // CONTAS_BANCARIAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CONTAS_BANCARIAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CONTAS_BANCARIAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CONTAS_BANCARIAS (      ') ;
      loqry.SQL.Add('     ID             INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM  DATE,             ') ;
      loqry.SQL.Add('     ALTERADO_EM    DATE,             ') ;
      loqry.SQL.Add('     BANCO_ID       INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     ATIVO          VARCHAR(1)        ') ;
      loqry.SQL.Add(' )                                    ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_BANCARIAS ADD CONSTRAINT PK_CONTAS_BANCARIAS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_BANCARIAS ADD CONSTRAINT FK_CONTAS_BANCARIAS_1 FOREIGN KEY (BANCO_ID) REFERENCES BANCOS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CONTAS_BANCARIAS_BI FOR CONTAS_BANCARIAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                 ');
      loqry.SQL.Add(' as                                              ');
      loqry.SQL.Add(' begin                                           ');
      loqry.SQL.Add('   if (new.id is null) then                      ');
      loqry.SQL.Add('     new.id = gen_id(gen_contas_bancarias_id,1); ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CONTAS_BANCARIAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM CONTAS_BANCARIAS


    // CONTAS_BANCARIAS_ITENS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CONTAS_BANCARIAS_ITENS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CONTAS_BANCARIAS_ITENS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CONTAS_BANCARIAS_ITENS ( ') ;
      loqry.SQL.Add('     ID             INTEGER NOT NULL,  ') ;
      loqry.SQL.Add('     BANCO_ID       INTEGER NOT NULL,  ') ;
      loqry.SQL.Add('     AGENCIA   VARCHAR(10),            ') ;
      loqry.SQL.Add('     NR_CONTA  VARCHAR(20),            ') ;
      loqry.SQL.Add('     ATIVO          VARCHAR(1)         ') ;
      loqry.SQL.Add(' )                                     ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_BANCARIAS_ITENS ADD CONSTRAINT PK_CONTAS_BANCARIAS_ITENS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTAS_BANCARIAS_ITENS ADD CONSTRAINT FK_CONTAS_BANCARIAS_ITENS_1 FOREIGN KEY (BANCO_ID) REFERENCES BANCOS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CONTAS_BANCARIAS_ITENS_BI FOR CONTAS_BANCARIAS_ITENS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                       ');
      loqry.SQL.Add(' as                                                    ');
      loqry.SQL.Add(' begin                                                 ');
      loqry.SQL.Add('   if (new.id is null) then                            ');
      loqry.SQL.Add('     new.id = gen_id(gen_contas_bancarias_itens_id,1); ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CONTAS_BANCARIAS_ITENS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM CONTAS_BANCARIAS_ITENS


    // INICIO DINHEIRO_ENTRADA
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from DINHEIRO_ENTRADA where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_DINHEIRO_ENTRADA_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE DINHEIRO_ENTRADA (      ') ;
      loqry.SQL.Add('     ID             INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM  DATE,             ') ;
      loqry.SQL.Add('     VALOR          DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     OBS            VARCHAR(60),      ') ;
      loqry.SQL.Add('     RECIBO_ID      INTEGER           ') ;
      loqry.SQL.Add(' )                                    ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE DINHEIRO_ENTRADA ADD CONSTRAINT PK_DINHEIRO_ENTRADA PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;


      //* Trigger: DINHEIRO_SAIDA_BI */
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER DINHEIRO_ENTRADA_BI FOR DINHEIRO_ENTRADA ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                       ');
      loqry.SQL.Add(' as                                                    ');
      loqry.SQL.Add(' begin                                                 ');
      loqry.SQL.Add('   if (new.id is null) then                            ');
      loqry.SQL.Add('     new.id = gen_id(gen_dinheiro_entrada_id,1);       ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;

      cria_mensagem_no_memo( memo, 'criado tabela " DINHEIRO_ENTRADA "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM DINHEIRO_ENTRADA

    // 27/05/2025
    // INICIO DINHEIRO_SAIDA
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from DINHEIRO_SAIDA where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_DINHEIRO_SAIDA_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE DINHEIRO_SAIDA (                 ') ;
      loqry.SQL.Add('     ID                      INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM           DATE,             ') ;
      loqry.SQL.Add('     PESSOA_ID               INTEGER,          ') ;
      loqry.SQL.Add('     PLANO_CONTAS_ID         INTEGER,          ') ;
      loqry.SQL.Add('     HISTORICO               VARCHAR(100),     ') ;
      loqry.SQL.Add('     VALOR                   DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     LANCADO_CONTAS_RECEBER  VARCHAR(1)        ') ;
      loqry.SQL.Add(' )                                             ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE DINHEIRO_SAIDA ADD CONSTRAINT PK_DINHEIRO_SAIDA PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      // Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE DINHEIRO_SAIDA ADD CONSTRAINT FK_DINHEIRO_SAIDA_1 FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ' ) ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE DINHEIRO_SAIDA ADD CONSTRAINT FK_DINHEIRO_SAIDA_2 FOREIGN KEY (PLANO_CONTAS_ID) REFERENCES PLANO_CONTAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER DINHEIRO_SAIDA_BI FOR DINHEIRO_SAIDA ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                       ');
      loqry.SQL.Add(' as                                                    ');
      loqry.SQL.Add(' begin                                                 ');
      loqry.SQL.Add('   if (new.id is null) then                            ');
      loqry.SQL.Add('     new.id = gen_id(gen_dinheiro_saida_id,1);       ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " DINHEIRO_SAIDA "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM DINHEIRO_SAIDA

    // 27/05/2025
    // CORRENTISTAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CORRENTISTAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CORRENTISTAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CORRENTISTAS (       ') ;
      loqry.SQL.Add('     ID          INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     PESSOA_ID   INTEGER           ') ;
      loqry.SQL.Add(' )                                 ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CORRENTISTAS ADD CONSTRAINT PK_CORRENTISTAS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      // Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CORRENTISTAS ADD CONSTRAINT FK_CORRENTISTAS_1 FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CORRENTISTAS_BI FOR CORRENTISTAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_correntistas_id,1);              ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CORRENTISTAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM CORRENTISTAS

    // 28/05/2025
    // CORRENTISTA_CONTAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CORRENTISTA_CONTAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CORRENTISTA_CONTAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CORRENTISTA_CONTAS ( ') ;
      loqry.SQL.Add('     ID          INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     PESSOA_ID   INTEGER,          ') ;
      loqry.SQL.Add('     BANCO_ID   INTEGER,           ') ;
      loqry.SQL.Add('     NR_AGENCIA  VARCHAR(10),      ') ;
      loqry.SQL.Add('     NR_CONTA    VARCHAR(10)       ') ;
      loqry.SQL.Add(' )                                 ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CORRENTISTA_CONTAS ADD CONSTRAINT PK_CORRENTISTA_CONTAS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      // Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CORRENTISTA_CONTAS ADD CONSTRAINT FK_CORRENTISTA_CONTAS_1 FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CORRENTISTA_CONTAS ADD CONSTRAINT FK_CORRENTISTA_CONTAS_2 FOREIGN KEY (BANCO_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CORRENTISTA_CONTAS_BI FOR CORRENTISTA_CONTAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_correntista_contas_id,1);              ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CORRENTISTA_CONTAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM CORRENTISTA_CONTAS


    // 03/06/2025
    // CARTAO_OPERADORAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CARTAO_OPERADORAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CARTAO_OPERADORAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CARTAO_OPERADORAS (           ') ;
      loqry.SQL.Add('     ID                   INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     PESSOA_ID            INTEGER,          ') ;
      loqry.SQL.Add('     NR_ESTABELECIMENTO   VARCHAR(20),      ') ;
      loqry.SQL.Add('     SENHA                VARCHAR(40)       ') ;
      loqry.SQL.Add(' )                                          ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_OPERADORAS ADD CONSTRAINT PK_CARTAO_OPERADORAS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      // Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_OPERADORAS ADD CONSTRAINT FK_CARTAO_OPERADORAS_1 FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;


      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CARTAO_OPERADORAS_BI FOR CARTAO_OPERADORAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_cartao_operadoras_id,1);         ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CARTAO_OPERADORAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM CARTAO_OPERADORAS


    // 04/06/2025
    // CARTAO_BANDEIRAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CARTAO_BANDEIRAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CARTAO_BANDEIRAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CARTAO_BANDEIRAS (            ') ;
      loqry.SQL.Add('     ID                   INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     DESCRICAO            VARCHAR(60),      ') ;
      loqry.SQL.Add('     ATIVO                VARCHAR(1)        ') ;
      loqry.SQL.Add(' )                                          ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_BANDEIRAS ADD CONSTRAINT PK_CARTAO_BANDEIRAS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CARTAO_BANDEIRAS_BI FOR CARTAO_BANDEIRAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_cartao_bandeiras_id,1);          ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CARTAO_BANDEIRAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.72.127');

    end; // FIM CARTAO_BANDEIRAS

    // 04/06/2025
    // CARTAO_MAQUINAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CARTAO_MAQUINAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CARTAO_MAQUINAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CARTAO_MAQUINAS (             ') ;
      loqry.SQL.Add('     ID                   INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM         DATE,            ') ;
      loqry.SQL.Add('     ALTERADO_EM           DATE,            ') ;
      loqry.SQL.Add('     CARTAO_OPERADORAS_ID  INTEGER,         ') ;
      loqry.SQL.Add('     PROPRIETARIO_ID       INTEGER,         ') ;
      loqry.SQL.Add('     NR_MAQUINA            VARCHAR(40),     ') ;
      loqry.SQL.Add('     VALOR_ALUGUEL         DECIMAL(15,2),   ') ;
      loqry.SQL.Add('     DIA_VENCIMENTO        INTEGER,         ') ;
      loqry.SQL.Add('     MAQUINA_EM_POSSE_DE   VARCHAR(40),     ') ;
      loqry.SQL.Add('     MAQUINA_DA_EMPRESA    VARCHAR(1),      ') ;
      loqry.SQL.Add('     ATIVO                 VARCHAR(1)       ') ;
      loqry.SQL.Add(' )                                          ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_MAQUINAS ADD CONSTRAINT PK_CARTAO_MAQUINAS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      //Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_MAQUINAS ADD CONSTRAINT FK_CARTAO_MAQUINAS_1 FOREIGN KEY (CARTAO_OPERADORAS_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_MAQUINAS ADD CONSTRAINT FK_CARTAO_MAQUINAS_2 FOREIGN KEY (PROPRIETARIO_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;



      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CARTAO_MAQUINAS_BI FOR CARTAO_MAQUINAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_cartao_maquinas_id,1);           ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CARTAO_MAQUINAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.73.127');

    end; // FIM CARTAO_MAQUINAS

    // 04/06/2025
    // CARTAO_FORMAS_PAGTO
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CARTAO_FORMAS_PAGTO where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CARTAO_FORMAS_PAGTO_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CARTAO_FORMAS_PAGTO (   ') ;
      loqry.SQL.Add('     ID             INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     DESCRICAO      VARCHAR(60),      ') ;
      loqry.SQL.Add('     DEBITO         VARCHAR(1),       ') ;
      loqry.SQL.Add('     CREDITO        VARCHAR(1),       ') ;
      loqry.SQL.Add('     QTDE_PARCELAS  INTEGER,          ') ;
      loqry.SQL.Add('     ATIVO          VARCHAR(1)        ') ;
      loqry.SQL.Add(' )                                    ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_FORMAS_PAGTO ADD CONSTRAINT PK_CARTAO_FORMAS_PAGTO PRIMARY KEY (ID) ');
      loqry.ExecSQL;


      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CARTAO_FORMAS_PAGTO_BI FOR CARTAO_FORMAS_PAGTO ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_cartao_formas_pagto_id,1);       ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CARTAO_FORMAS_PAGTO "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.74.127');

    end; // FIM CARTAO_FORMAS_PAGTO


    // 04/06/2025
    // CARTAO_TAXAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CARTAO_TAXAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CARTAO_TAXAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CARTAO_TAXAS (                      ') ;
      loqry.SQL.Add('     ID                         INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM              DATE,             ') ;
      loqry.SQL.Add('     ALTERADO_EM                DATE,             ') ;
      loqry.SQL.Add('     CARTAO_OPERADORAS_ID       INTEGER,          ') ;
      loqry.SQL.Add('     CARTAO_BANDEIRAS_ID        INTEGER,          ') ;
      loqry.SQL.Add('     BANCO_ID                   INTEGER,          ') ;
      loqry.SQL.Add('     CONTAS_BANCARIAS_ITENS_ID  INTEGER,          ') ;
      loqry.SQL.Add('     ATIVO                      VARCHAR(1)        ') ;
      loqry.SQL.Add(' )                                                ') ;
      //ShowMessage(loqry.SQL.Text);

      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_TAXAS ADD CONSTRAINT PK_CARTAO_TAXAS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      //Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_TAXAS ADD CONSTRAINT FK_CARTAO_TAXAS_1 FOREIGN KEY (CARTAO_OPERADORAS_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_TAXAS ADD CONSTRAINT FK_CARTAO_TAXAS_2 FOREIGN KEY (CARTAO_BANDEIRAS_ID) REFERENCES CARTAO_BANDEIRAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_TAXAS ADD CONSTRAINT FK_CARTAO_TAXAS_3 FOREIGN KEY (BANCO_ID) REFERENCES BANCOS (ID) ');
      loqry.ExecSQL;



      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CARTAO_TAXAS_BI FOR CARTAO_TAXAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_cartao_taxas_id,1);              ');
      loqry.SQL.Add(' end ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CARTAO_TAXAS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.75.127');

    end; // FIM CARTAO_TAXAS

    // 04/06/2025
    // CARTAO_TAXAS_ITENS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CARTAO_TAXAS_ITENS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CARTAO_TAXAS_ITENS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CARTAO_TAXAS_ITENS (            ') ;
      loqry.SQL.Add('     ID                     INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CARTAO_TAXAS_ID        INTEGER,          ') ;
      loqry.SQL.Add('     FORMAS_PAGTO_ID        INTEGER,          ') ;
      loqry.SQL.Add('     QTDE_PARCELAS          INTEGER,          ') ;
      loqry.SQL.Add('     PRIMEIRO_VENCIMENTO    INTEGER,          ') ;
      loqry.SQL.Add('     INTERVALO_DEMAIS_PARC  INTEGER,          ') ;
      loqry.SQL.Add('     TAXA                   DECIMAL(6,2)      ') ;
      loqry.SQL.Add(' )                                            ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_TAXAS_ITENS ADD CONSTRAINT PK_CARTAO_TAXAS_ITENS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      //Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_TAXAS_ITENS ADD CONSTRAINT FK_CARTAO_TAXAS_ITENS_1 FOREIGN KEY (CARTAO_TAXAS_ID) REFERENCES CARTAO_TAXAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_TAXAS_ITENS ADD CONSTRAINT FK_CARTAO_TAXAS_ITENS_2 FOREIGN KEY (FORMAS_PAGTO_ID) REFERENCES CARTAO_FORMAS_PAGTO (ID) ');
      loqry.ExecSQL;



      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CARTAO_TAXAS_ITENS_BI FOR CARTAO_TAXAS_ITENS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                          ');
      loqry.SQL.Add(' as                                                       ');
      loqry.SQL.Add(' begin                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_cartao_taxas_itens_id,1);        ');
      loqry.SQL.Add(' end                                                      ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CARTAO_TAXAS_ITENS "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.76.127');

    end; // FIM CARTAO_TAXAS_ITENS


    // 04/06/2025
    // CARTAO_VENDAS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CARTAO_VENDAS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CARTAO_VENDAS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CARTAO_VENDAS (                 ') ;
      loqry.SQL.Add('     ID                     INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM          DATE,             ') ;
      loqry.SQL.Add('     ALTERADO_EM            DATE,             ') ;
      loqry.SQL.Add('     DATA_VENDA             DATE,             ') ;
      loqry.SQL.Add('     CARTAO_OPERADORA_ID    INTEGER,          ') ;
      loqry.SQL.Add('     CARTAO_MAQUINA_ID      INTEGER,          ') ;
      loqry.SQL.Add('     CARTAO_BANDEIRA_ID     INTEGER,          ') ;
      loqry.SQL.Add('     CARTAO_FORMA_PAGTO_ID  INTEGER,          ') ;
      loqry.SQL.Add('     TAXA                   DECIMAL(6,2),     ') ;
      loqry.SQL.Add('     VALOR_VENDA            DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     VALOR_LIQUIDO          DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     CV                     VARCHAR(40)       ') ;
      loqry.SQL.Add(' )                                            ') ;
      loqry.ExecSQL;

      // PRIMARY KEY
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_VENDAS ADD CONSTRAINT PK_CARTAO_VENDAS PRIMARY KEY (ID) ');
      loqry.ExecSQL;

      //Foreign keys
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_VENDAS ADD CONSTRAINT FK_CARTAO_VENDAS_1 FOREIGN KEY (CARTAO_OPERADORA_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_VENDAS ADD CONSTRAINT FK_CARTAO_VENDAS_2 FOREIGN KEY (CARTAO_MAQUINA_ID) REFERENCES CARTAO_MAQUINAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_VENDAS ADD CONSTRAINT FK_CARTAO_VENDAS_3 FOREIGN KEY (CARTAO_BANDEIRA_ID) REFERENCES CARTAO_BANDEIRAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CARTAO_VENDAS ADD CONSTRAINT FK_CARTAO_VENDAS_4 FOREIGN KEY (CARTAO_FORMA_PAGTO_ID) REFERENCES CARTAO_FORMAS_PAGTO (ID) ');
      loqry.ExecSQL;



      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CARTAO_VENDAS_BI FOR CARTAO_VENDAS ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                            ');
      loqry.SQL.Add(' as                                                         ');
      loqry.SQL.Add(' begin                                                      ');
      loqry.SQL.Add('   if (new.id is null) then                                 ');
      loqry.SQL.Add('     new.id = gen_id(gen_cartao_vendas_id,1);               ');
      loqry.SQL.Add(' end                                                        ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CARTAO_VENDAS "  com sucesso ');
      prc_atualiza_versao_do_banco('2025.77.127');

    end; // FIM CARTAO_VENDAS


    // 19/06/2025 RECIBO_ITENS_DINHEIRO
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_ITENS_DINHEIRO where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_ITENS_DINHEIRO_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_ITENS_DINHEIRO  ( ') ;
      loqry.SQL.Add('     ID            INTEGER NOT NULL,   ') ;
      loqry.SQL.Add('     RECIBO_ID   INTEGER,              ') ;
      loqry.SQL.Add('     VALOR         DECIMAL(15,2),      ') ;
      loqry.SQL.Add('     OBSERVACAO  VARCHAR(40)           ') ;
      loqry.SQL.Add(' )                                     ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_DINHEIRO ADD CONSTRAINT PK_RECIBO_ITENS_DINHEIRO PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_DINHEIRO ADD CONSTRAINT FK_RECIBO_ITENS_DINHEIRO_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS (RECIBO_ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_ITENS_DINHEIRO_BI FOR RECIBO_ITENS_DINHEIRO ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                            ');
      loqry.SQL.Add(' as                                                                         ');
      loqry.SQL.Add(' begin                                                                      ');
      loqry.SQL.Add('   if (new.id is null) then                                             ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_itens_dinheiro_id,1);                       ');
      loqry.SQL.Add(' end                                                                        ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_ITENS_DINHEIRO "  com sucesso         ');
      prc_atualiza_versao_do_banco('2025.78.127');

    end; // FIM RECIBO_ITENS_DINHEIRO

    // 19/06/2025 RECIBO_ITENS_PIX
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_ITENS_PIX where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_ITENS_PIX_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_ITENS_PIX  (                 ') ;
      loqry.SQL.Add('     ID                         INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     RECIBO_ID                  INTEGER,          ') ;
      loqry.SQL.Add('     BANCO_PESSOA_ID            INTEGER,          ') ;
      loqry.SQL.Add('     CONTAS_BANCARIAS_ITENS_ID  INTEGER,          ') ;
      loqry.SQL.Add('     VALOR                      DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     OBSERVACAO                 VARCHAR(50)       ') ;
      loqry.SQL.Add(' )                                                ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_PIX ADD CONSTRAINT PK_RECIBO_ITENS_PIX PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_PIX ADD CONSTRAINT FK_RECIBO_ITENS_PIX_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS (RECIBO_ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_PIX ADD CONSTRAINT FK_RECIBO_ITENS_PIX_2 FOREIGN KEY (CONTAS_BANCARIAS_ITENS_ID) REFERENCES CONTAS_BANCARIAS_ITENS (ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_PIX ADD CONSTRAINT FK_RECIBO_ITENS_PIX_3 FOREIGN KEY (BANCO_PESSOA_ID) REFERENCES PESSOAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_ITENS_PIX_BI FOR RECIBO_ITENS_PIX ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                  ');
      loqry.SQL.Add(' as                                                               ');
      loqry.SQL.Add(' begin                                                            ');
      loqry.SQL.Add('   if (new.id is null) then                                    ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_itens_pix_id,1);                 ');
      loqry.SQL.Add(' end                                                              ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_ITENS_PIX "  com sucesso    ');
      prc_atualiza_versao_do_banco('2025.79.127');

    end; // FIM RECIBO_ITENS_PIX


    // 19/06/2025 RECIBO_ITENS_CHEQUE
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_ITENS_CHEQUE where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_ITENS_CHEQUE_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_ITENS_CHEQUE  (          ') ;
      loqry.SQL.Add('     ID                     INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     RECIBO_ID              INTEGER,          ') ;
      loqry.SQL.Add('     CORRENTISTA_CONTAS_ID  INTEGER,          ') ;
      loqry.SQL.Add('     BANCO                  VARCHAR(40),      ') ;
      loqry.SQL.Add('     AGENCIA                VARCHAR(4),       ') ;
      loqry.SQL.Add('     NR_CONTA               VARCHAR(40),      ') ;
      loqry.SQL.Add('     NR_CHEQUE              VARCHAR(10),      ') ;
      loqry.SQL.Add('     DATA                   DATE,             ') ;
      loqry.SQL.Add('     VALOR                  DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     HISTORICO              VARCHAR(60)       ') ;
      loqry.SQL.Add(' )                                            ') ;
      loqry.ExecSQL;

      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CHEQUE ADD CONSTRAINT PK_RECIBO_ITENS_CHEQUE PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CHEQUE ADD CONSTRAINT FK_RECIBO_ITENS_CHEQUE_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS (RECIBO_ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CHEQUE ADD CONSTRAINT FK_RECIBO_ITENS_CHEQUE_2 FOREIGN KEY (CORRENTISTA_CONTAS_ID) REFERENCES CORRENTISTA_CONTAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_ITENS_CHEQUE_BI FOR RECIBO_ITENS_CHEQUE ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                        ');
      loqry.SQL.Add(' as                                                                     ');
      loqry.SQL.Add(' begin                                                                  ');
      loqry.SQL.Add('   if (new.id is null) then                                         ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_itens_cheque_id,1);                     ');
      loqry.SQL.Add(' end                                                                    ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_ITENS_CHEQUE "  com sucesso       ');
      prc_atualiza_versao_do_banco('2025.80.127');

    end; // FIM RECIBO_ITENS_CHEQUE


    // 19/06/2025 RECIBO_ITENS_CARTAO
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_ITENS_CARTAO where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_ITENS_CARTAO_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_ITENS_CARTAO (           ') ;
      loqry.SQL.Add('     ID                     INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     DATA_VENDA             DATE,             ') ;
      loqry.SQL.Add('     RECIBO_ID              INTEGER,          ') ;
      loqry.SQL.Add('     CARTAO_OPERADORAS_ID   INTEGER,          ') ;
      loqry.SQL.Add('     BANDEIRAS_ID           INTEGER,          ') ;
      loqry.SQL.Add('     CARTAO_TAXAS_ITENS_ID  INTEGER,          ') ;
      loqry.SQL.Add('     QTDE_PARCELAS          INTEGER,          ') ;
      loqry.SQL.Add('     TAXA                   DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     VALOR_VENDA            DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     VALOR_LIQUIDO          DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     CV                     VARCHAR(40)       ') ;
      loqry.SQL.Add(' )                                            ') ;
      loqry.ExecSQL;

      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CARTAO ADD CONSTRAINT PK_RECIBO_ITENS_CARTAO PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CARTAO ADD CONSTRAINT FK_RECIBO_ITENS_CARTAO_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS (RECIBO_ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CARTAO ADD CONSTRAINT FK_RECIBO_ITENS_CARTAO_2 FOREIGN KEY (CARTAO_OPERADORAS_ID) REFERENCES PESSOAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CARTAO ADD CONSTRAINT FK_RECIBO_ITENS_CARTAO_3 FOREIGN KEY (BANDEIRAS_ID) REFERENCES CARTAO_BANDEIRAS (ID) ') ;
      loqry.ExecSQL;




      (* naõ sera possivel usar essa chave estrangeira, pois quando estiver usando maquina de terceiro não havera taxa
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CARTAO ADD CONSTRAINT FK_RECIBO_ITENS_CARTAO_3 FOREIGN KEY (CARTAO_TAXAS_ITENS_ID) REFERENCES CARTAO_TAXAS_ITENS (ID) ') ;
      loqry.ExecSQL;
      *)
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_ITENS_CARTAO_BI FOR RECIBO_ITENS_CARTAO ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                        ');
      loqry.SQL.Add(' as                                                                     ');
      loqry.SQL.Add(' begin                                                                  ');
      loqry.SQL.Add('   if (new.id is null) then                                         ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_itens_cartao_id,1);                     ');
      loqry.SQL.Add(' end                                                                    ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_ITENS_CARTAO "  com sucesso       ');
      prc_atualiza_versao_do_banco('2025.81.127');

    end; // FIM RECIBO_ITENS_CARTAO

    // 19/06/2025 RECIBO_ITENS_CONTA_PAGAR
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_ITENS_CONTA_PAGAR where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_ITENS_CONTA_PAGAR_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_ITENS_CONTA_PAGAR ( ') ;
      loqry.SQL.Add('     ID               INTEGER NOT NULL,  ') ;
      loqry.SQL.Add('     RECIBO_ID        INTEGER,           ') ;
      loqry.SQL.Add('     CONTAS_PAGAR_ID  INTEGER,           ') ;
      loqry.SQL.Add('     HISTORICO        VARCHAR(60),       ') ;
      loqry.SQL.Add('     VALOR_PARCELA    DECIMAL(15,2),     ') ;
      loqry.SQL.Add('     VALOR_PAGO       DECIMAL(15,2),     ') ;
      loqry.SQL.Add('     BAIXAR           DECIMAL(15,2)      ') ;
      loqry.SQL.Add(' )                                       ') ;
      loqry.ExecSQL;

      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CONTA_PAGAR ADD CONSTRAINT PK_RECIBO_ITENS_CONTA_PAGAR PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CONTA_PAGAR ADD CONSTRAINT FK_RECIBO_ITENS_CONTA_PAGAR_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS (RECIBO_ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CONTA_PAGAR ADD CONSTRAINT FK_RECIBO_ITENS_CONTA_PAGAR_2 FOREIGN KEY (CONTAS_PAGAR_ID) REFERENCES CONTAS_PAGAR (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_ITENS_CONTA_PAGAR_BI FOR RECIBO_ITENS_CONTA_PAGAR ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                        ');
      loqry.SQL.Add(' as                                                                     ');
      loqry.SQL.Add(' begin                                                                  ');
      loqry.SQL.Add('   if (new.id is null) then                                          ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_itens_conta_pagar_id,1);                ');
      loqry.SQL.Add(' end                                                                    ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_ITENS_CONTA_PAGAR "  com sucesso  ');
      prc_atualiza_versao_do_banco('2025.82.127');

    end; // FIM RECIBO_ITENS_CONTA_PAGAR

    // 19/06/2025 RECIBO_ITENS_CONTAS_RECEBER
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_ITENS_CONTAS_RECEBER where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_ITENS_CONTAS_RECEBER ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_ITENS_CONTAS_RECEBER (  ') ;
      loqry.SQL.Add('     ID                 INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     RECIBO_ID          INTEGER,          ') ;
      loqry.SQL.Add('     CONTAS_RECEBER_ID  INTEGER,          ') ;
      loqry.SQL.Add('     HISTORICO          VARCHAR(60),      ') ;
      loqry.SQL.Add('     VALOR_PARCELA      DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     VALOR_PAGO         DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     BAIXAR             DECIMAL(15,2)     ') ;
      loqry.SQL.Add(' )                                        ') ;
      loqry.ExecSQL;

      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CONTAS_RECEBER ADD CONSTRAINT PK_RECIBO_ITENS_CONTAS_RECEBER PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CONTAS_RECEBER ADD CONSTRAINT FK_RECIBO_CTAS_RECEBER_ID FOREIGN KEY (CONTAS_RECEBER_ID) REFERENCES CONTAS_RECEBER (ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_ITENS_CONTAS_RECEBER ADD CONSTRAINT FK_RECIBO_ITENS_CONTAS_RECEBER_ FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS (RECIBO_ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_ITENS_CONTAS_RECEBER_BI FOR RECIBO_ITENS_CONTAS_RECEBER ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                        ');
      loqry.SQL.Add(' as                                                                     ');
      loqry.SQL.Add(' begin                                                                  ');
      loqry.SQL.Add('   if (new.id is null) then                                             ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_itens_contas_receber,1);                ');
      loqry.SQL.Add(' end                                                                    ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_ITENS_CONTAS_RECEBER "  com sucesso  ');
      prc_atualiza_versao_do_banco('2025.83.127');

    end; // FIM RECIBO_ITENS_CONTAS_RECEBER


    // 02/07/2025 PIX_RECEBIDOS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from PIX_RECEBIDOS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_PIX_RECEBIDOS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE PIX_RECEBIDOS (                    ') ;
      loqry.SQL.Add('     ID                         INTEGER NOT NULL,') ;
      loqry.SQL.Add('     DATA_PIX                   date,            ') ;
      loqry.SQL.Add('     CONTAS_BANCARIAS_ITENS_ID  INTEGER,         ') ;
      loqry.SQL.Add('     VALOR                      DECIMAL(15,2),   ') ;
      loqry.SQL.Add('     OBS                        varchar(40)      ') ;
      loqry.SQL.Add(' )                                               ') ;
      loqry.ExecSQL;

      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PIX_RECEBIDOS ADD CONSTRAINT PK_PIX_RECEBIDOS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PIX_RECEBIDOS ADD CONSTRAINT FK_PIX_RECEBIDOS_1 FOREIGN KEY (CONTAS_BANCARIAS_ITENS_ID) REFERENCES CONTAS_BANCARIAS_ITENS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PIX_RECEBIDOS_BI FOR PIX_RECEBIDOS  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                             ');
      loqry.SQL.Add(' as                                                          ');
      loqry.SQL.Add(' begin                                                       ');
      loqry.SQL.Add('   if (new.id is null) then                                  ');
      loqry.SQL.Add('     new.id = gen_id(gen_pix_recebidos_id,1);                ');
      loqry.SQL.Add(' end                                                         ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " PIX_RECEBIDOS "  com sucesso  ');
      prc_atualiza_versao_do_banco('2025.84.127');

    end; // FIM PIX_RECEBIDOS


    // 03/07/2025 CHEQUES_CLIENTES
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from CHEQUES_CLIENTES where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_CHEQUES_CLIENTES_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CHEQUES_CLIENTES (             ') ;
      loqry.SQL.Add('     ID                    INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CORRENTISTA_CONTA_ID  INTEGER,          ') ;
      loqry.SQL.Add('     CADASTRADO_EM         DATE,             ') ;
      loqry.SQL.Add('     NR_CHEQUE             VARCHAR(10),      ') ;
      loqry.SQL.Add('     PRE_DATADO_PARA       DATE,             ') ;
      loqry.SQL.Add('     VALOR                 DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     RECIBO_ID             INTEGER,          ') ;
      loqry.SQL.Add('     HISTORICO             VARCHAR(100),     ') ;
      loqry.SQL.Add('     REPASSADO             VARCHAR(1)        ') ;
      loqry.SQL.Add(' )                                           ') ;
      loqry.ExecSQL;

      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CHEQUES_CLIENTES ADD CONSTRAINT PK_CHEQUES_CLIENTES PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CHEQUES_CLIENTES ADD CONSTRAINT FK_CHEQUES_CLIENTES_1 FOREIGN KEY (CORRENTISTA_CONTA_ID) REFERENCES CORRENTISTA_CONTAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER CHEQUES_CLIENTES_BI FOR CHEQUES_CLIENTES  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                             ');
      loqry.SQL.Add(' as                                                          ');
      loqry.SQL.Add(' begin                                                       ');
      loqry.SQL.Add('   if (new.id is null) then                                  ');
      loqry.SQL.Add('     new.id = gen_id(gen_cheques_clientes_id,1);             ');
      loqry.SQL.Add(' end                                                         ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " CHEQUES_CLIENTES "  com sucesso  ');
      prc_atualiza_versao_do_banco('2025.84.127');

    end; // FIM CHEQUES_CLIENTES

    // criar campo PEDIDO_COLUNA_PRECO_VEND na tabela de configuracoes_sistema
    try
      { ver se o campo PEDIDO_COLUNA_PRECO_VEND existe na tabela configuracao_sistema}
      loqry.SQL.Clear;
      loqry.Open('select PEDIDO_COLUNA_PRECO_VEND from CONFIGURACOES_SISTEMA');
      loqry.Close;

    Except
      {11/07/2025 criar campo PEDIDO_COLUNA_PRECO_VEND tipo VARCHAR(1) na tabela configuracao_sistema}
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CONFIGURACOES_SISTEMA ADD PEDIDO_COLUNA_PRECO_VEND VARCHAR(1)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo "PEDIDO_COLUNA_PRECO_VEND" com sucesso na tabela CONFIGURACOES_SISTEMA');
      prc_atualiza_versao_do_banco('2024.85.124');

    end;

    // RECIBOS_FORNECEDORES
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBOS_FORNECEDORES where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBOS_FORNECEDORES_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBOS_FORNECEDORES  ( ') ;
      loqry.SQL.Add('     ID             INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     CADASTRADO_EM  DATE,             ') ;
      loqry.SQL.Add('     VALOR          DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     PESSOA_ID      INTEGER,          ') ;
      loqry.SQL.Add('     USUARIO_ID     INTEGER,          ') ;
      loqry.SQL.Add('     OBSERVACAO     VARCHAR(100),     ') ;
      loqry.SQL.Add('     VALOR_EXTENSO  VARCHAR(255)      ') ;
      loqry.SQL.Add(' )                                    ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBOS_FORNECEDORES ADD CONSTRAINT PK_RECIBOS_FORNECEDORES PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBOS_FORNECEDORES ADD CONSTRAINT FK_RECIBOS_FORNECEDORES_1 FOREIGN KEY (PESSOA_ID) REFERENCES PESSOAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBOS_FORNECEDORES ADD CONSTRAINT FK_RECIBOS_FORNECEDORES_2 FOREIGN KEY (USUARIO_ID) REFERENCES PESSOAS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBOS_FORNECEDORES_BI FOR RECIBOS_FORNECEDORES ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                          ');
      loqry.SQL.Add(' as                                                                       ');
      loqry.SQL.Add(' begin                                                                    ');
      loqry.SQL.Add('   if (new.id is null) then                                               ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibos_fornecedores_id,1);                      ');
      loqry.SQL.Add(' end                                                                      ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBOS_FORNECEDORES "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.87.127');

    end;

    //15/07/2025 RECIBO_PAGTO_DINHEIRO
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_PAGTO_DINHEIRO where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_PAGTO_DINHEIRO_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_PAGTO_DINHEIRO ( ') ;
      loqry.SQL.Add('     ID          INTEGER NOT NULL,    ') ;
      loqry.SQL.Add('     RECIBO_ID   INTEGER,             ') ;
      loqry.SQL.Add('     VALOR       DECIMAL(15,2),       ') ;
      loqry.SQL.Add('     OBSERVACAO  VARCHAR(40)          ') ;
      loqry.SQL.Add(' )                                    ') ;
      loqry.ExecSQL;
      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_DINHEIRO ADD CONSTRAINT PK_RECIBO_PAGTO_DINHEIRO PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;
      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_DINHEIRO ADD CONSTRAINT FK_RECIBO_PAGTO_DINHEIRO_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS_FORNECEDORES (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_PAGTO_DINHEIRO_BI FOR RECIBO_PAGTO_DINHEIRO ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                            ');
      loqry.SQL.Add(' as                                                                         ');
      loqry.SQL.Add(' begin                                                                      ');
      loqry.SQL.Add('   if (new.id is null) then                                                 ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_pagto_dinheiro_id,1);                       ');
      loqry.SQL.Add(' end                                                                        ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_PAGTO_DINHEIRO "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.88.127');

    end;

    //15/07/2025 RECIBO_PAGTO_PIX
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_PAGTO_PIX where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_PAGTO_PIX_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_PAGTO_PIX (                  ') ;
      loqry.SQL.Add('     ID                         INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     RECIBO_ID                  INTEGER,          ') ;
      loqry.SQL.Add('     BANCO_PESSOA_ID            INTEGER,          ') ;
      loqry.SQL.Add('     CONTAS_BANCARIAS_ITENS_ID  INTEGER,          ') ;
      loqry.SQL.Add('     VALOR                      DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     OBSERVACAO                 VARCHAR(50)       ') ;
      loqry.SQL.Add(' )                                                ') ;
      loqry.ExecSQL;
      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_PIX ADD CONSTRAINT PK_RECIBO_PAGTO_PIX PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_PIX ADD CONSTRAINT FK_RECIBO_PAGTO_PIX_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS_FORNECEDORES (ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_PIX ADD CONSTRAINT FK_RECIBO_PAGTO_PIX_2 FOREIGN KEY (BANCO_PESSOA_ID) REFERENCES PESSOAS (ID) ');
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_PIX ADD CONSTRAINT FK_RECIBO_PAGTO_PIX_3 FOREIGN KEY (CONTAS_BANCARIAS_ITENS_ID) REFERENCES CONTAS_BANCARIAS_ITENS (ID) ');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_PAGTO_PIX_BI FOR RECIBO_PAGTO_PIX ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                  ');
      loqry.SQL.Add(' as                                                               ');
      loqry.SQL.Add(' begin                                                            ');
      loqry.SQL.Add('   if (new.id is null) then                                       ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_pagto_pix_id,1);                  ');
      loqry.SQL.Add(' end                                                              ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_PAGTO_PIX "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.89.127');

    end;

    //15/07/2025 RECIBO_PAGTO_CHEQUE
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_PAGTO_CHEQUE where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_PAGTO_CHEQUE_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_PAGTO_CHEQUE (           ') ;
      loqry.SQL.Add('     ID                     INTEGER NOT NULL, ') ;
      loqry.SQL.Add('     RECIBO_ID              INTEGER,          ') ;
      loqry.SQL.Add('     CORRENTISTA_CONTAS_ID  INTEGER,          ') ;
      loqry.SQL.Add('     BANCO                  VARCHAR(40),      ') ;
      loqry.SQL.Add('     AGENCIA                VARCHAR(4),       ') ;
      loqry.SQL.Add('     NR_CONTA               VARCHAR(40),      ') ;
      loqry.SQL.Add('     NR_CHEQUE              VARCHAR(10),      ') ;
      loqry.SQL.Add('     DATA                   DATE,             ') ;
      loqry.SQL.Add('     VALOR                  DECIMAL(15,2),    ') ;
      loqry.SQL.Add('     HISTORICO              VARCHAR(60)       ') ;
      loqry.SQL.Add(' )                                            ') ;
      loqry.ExecSQL;
      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CHEQUE ADD CONSTRAINT PK_RECIBO_PAGTO_CHEQUE PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CHEQUE ADD CONSTRAINT FK_RECIBO_PAGTO_CHEQUE_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS_FORNECEDORES (ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CHEQUE ADD CONSTRAINT FK_RECIBO_PAGTO_CHEQUE_2 FOREIGN KEY (CORRENTISTA_CONTAS_ID) REFERENCES CORRENTISTA_CONTAS (ID) ');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_PAGTO_CHEQUE_BI FOR RECIBO_PAGTO_CHEQUE ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                  ');
      loqry.SQL.Add(' as                                                               ');
      loqry.SQL.Add(' begin                                                            ');
      loqry.SQL.Add('   if (new.id is null) then                                       ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_pagto_cheque_id,1);               ');
      loqry.SQL.Add(' end                                                              ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_PAGTO_CHEQUE "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.90.127');

    end;

    //15/07/2025 RECIBO_PAGTO_CONTAS_RECEBER
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_PAGTO_CONTAS_RECEBER where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_PAGTO_CONTAS_RECEBER ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_PAGTO_CONTAS_RECEBER ( ') ;
      loqry.SQL.Add('     ID                 INTEGER NOT NULL,   ') ;
      loqry.SQL.Add('     RECIBO_ID          INTEGER,            ') ;
      loqry.SQL.Add('     CONTAS_RECEBER_ID  INTEGER,            ') ;
      loqry.SQL.Add('     HISTORICO          VARCHAR(60),        ') ;
      loqry.SQL.Add('     VALOR_PARCELA      DECIMAL(15,2),      ') ;
      loqry.SQL.Add('     VALOR_PAGO         DECIMAL(15,2),      ') ;
      loqry.SQL.Add('     BAIXAR             DECIMAL(15,2)       ') ;
      loqry.SQL.Add(' )                                          ') ;
      loqry.ExecSQL;
      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CONTAS_RECEBER ADD CONSTRAINT PK_RECIBO_PAGTO_CONTAS_RECEBER PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CONTAS_RECEBER ADD CONSTRAINT FK_RECIBO_PAGTO_CONTAS_RECEBER1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS_FORNECEDORES (ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CONTAS_RECEBER ADD CONSTRAINT FK_RECIBO_PAGTO_CONTAS_RECEBER_ FOREIGN KEY (CONTAS_RECEBER_ID) REFERENCES CONTAS_RECEBER (ID) ');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_PAGTO_CONTAS_RECEBER_BI FOR RECIBO_PAGTO_CONTAS_RECEBER ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                  ');
      loqry.SQL.Add(' as                                                               ');
      loqry.SQL.Add(' begin                                                            ');
      loqry.SQL.Add('   if (new.id is null) then                                       ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_pagto_contas_receber,1);          ');
      loqry.SQL.Add(' end                                                              ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_PAGTO_CONTAS_RECEBER "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.91.127');

    end;

    //15/07/2025 RECIBO_PAGTO_CONTA_PAGAR
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from RECIBO_PAGTO_CONTA_PAGAR where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_RECIBO_PAGTO_CONTA_PAGAR_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE RECIBO_PAGTO_CONTA_PAGAR ( ') ;
      loqry.SQL.Add('     ID                 INTEGER NOT NULL,   ') ;
      loqry.SQL.Add('     RECIBO_ID          INTEGER,            ') ;
      loqry.SQL.Add('     CONTAS_PAGAR_ID    INTEGER,            ') ;
      loqry.SQL.Add('     HISTORICO          VARCHAR(60),        ') ;
      loqry.SQL.Add('     VALOR_PARCELA      DECIMAL(15,2),      ') ;
      loqry.SQL.Add('     VALOR_PAGO         DECIMAL(15,2),      ') ;
      loqry.SQL.Add('     BAIXAR             DECIMAL(15,2)       ') ;
      loqry.SQL.Add(' )                                          ') ;
      loqry.ExecSQL;
      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CONTA_PAGAR ADD CONSTRAINT PK_RECIBO_PAGTO_CONTA_PAGAR PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CONTA_PAGAR ADD CONSTRAINT FK_RECIBO_PAGTO_CONTA_PAGAR_1 FOREIGN KEY (RECIBO_ID) REFERENCES RECIBOS_FORNECEDORES (ID) ') ;
      loqry.ExecSQL;
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE RECIBO_PAGTO_CONTA_PAGAR ADD CONSTRAINT FK_RECIBO_PAGTO_CONTA_PAGAR_2 FOREIGN KEY (CONTAS_PAGAR_ID) REFERENCES CONTAS_PAGAR (ID) ');
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER RECIBO_PAGTO_CONTA_PAGAR_BI FOR RECIBO_PAGTO_CONTA_PAGAR ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                                  ');
      loqry.SQL.Add(' as                                                               ');
      loqry.SQL.Add(' begin                                                            ');
      loqry.SQL.Add('   if (new.id is null) then                                       ');
      loqry.SQL.Add('     new.id = gen_id(gen_recibo_pagto_conta_pagar_id,1);          ');
      loqry.SQL.Add(' end                                                              ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " RECIBO_PAGTO_CONTA_PAGAR "  com sucesso ' );
      prc_atualiza_versao_do_banco('2025.91.127');

    end;

    // 15/07/2025 PIX_ENVIADOS
    try
      loqry.Close;
      loqry.SQL.Clear;
      loqry.Open('select ID from PIX_ENVIADOS where 1=1');
      loqry.Close;

    except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE GENERATOR GEN_PIX_ENVIADOS_ID ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE PIX_ENVIADOS (                     ') ;
      loqry.SQL.Add('     ID                         INTEGER NOT NULL,') ;
      loqry.SQL.Add('     DATA_PIX                   date,            ') ;
      loqry.SQL.Add('     CONTAS_BANCARIAS_ITENS_ID  INTEGER,         ') ;
      loqry.SQL.Add('     VALOR                      DECIMAL(15,2),   ') ;
      loqry.SQL.Add('     OBS                        varchar(40)      ') ;
      loqry.SQL.Add(' )                                               ') ;
      loqry.ExecSQL;

      //****                             Primary keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PIX_ENVIADOS ADD CONSTRAINT PK_PIX_ENVIADOS PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      //****                             Foreign keys                             ****/
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PIX_ENVIADOS ADD CONSTRAINT FK_PIX_ENVIADOS_1 FOREIGN KEY (CONTAS_BANCARIAS_ITENS_ID) REFERENCES CONTAS_BANCARIAS_ITENS (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE OR ALTER TRIGGER PIX_ENVIADOS_BI FOR PIX_ENVIADOS  ');
      loqry.SQL.Add(' ACTIVE BEFORE INSERT POSITION 0                           ');
      loqry.SQL.Add(' as                                                        ');
      loqry.SQL.Add(' begin                                                     ');
      loqry.SQL.Add('   if (new.id is null) then                                ');
      loqry.SQL.Add('     new.id = gen_id(gen_pix_enviados_id,1);               ');
      loqry.SQL.Add(' end                                                       ');
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo, 'criado tabela " PIX_ENVIADOS "  com sucesso  ');
      prc_atualiza_versao_do_banco('2025.92.127');

    end; // FIM PIX_RECEBIDOS

    // ALTERAÇÃO TABELA DE CHEQUES_CLIENTES
    try
      loqry.SQL.Clear;
      loqry.Open('select DATA_REPASSE from CHEQUES_CLIENTES');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CHEQUES_CLIENTES ADD DATA_REPASSE DATE') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " DATA_REPASSE " com sucesso na tabela CHEQUES_CLIENTES');
      prc_atualiza_versao_do_banco('2025.94.0154');
    end;

    // ALTERAÇÃO TABELA DE CHEQUES_CLIENTES
    try
      loqry.SQL.Clear;
      loqry.Open('select REPASSADO_PARA from CHEQUES_CLIENTES');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CHEQUES_CLIENTES ADD REPASSADO_PARA VARCHAR(60)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " REPASSADO_PARA " com sucesso na tabela CHEQUES_CLIENTES');
      prc_atualiza_versao_do_banco('2025.94.0154');
    end;

    // ALTERAÇÃO TABELA DE CHEQUES_CLIENTES
    try
      loqry.SQL.Clear;
      loqry.Open('select DEVOLVIDO from CHEQUES_CLIENTES');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CHEQUES_CLIENTES ADD DEVOLVIDO VARCHAR(1)') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " DEVOLVIDO " com sucesso na tabela CHEQUES_CLIENTES');
      prc_atualiza_versao_do_banco('2025.94.0154');
    end;

    // ALTERAÇÃO TABELA DE CHEQUES_CLIENTES
    try
      loqry.SQL.Clear;
      loqry.Open('select DATA_DEVOLUCAO from CHEQUES_CLIENTES');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CHEQUES_CLIENTES ADD DATA_DEVOLUCAO DATE') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " DATA_DEVOLUCAO " com sucesso na tabela CHEQUES_CLIENTES');
      prc_atualiza_versao_do_banco('2025.94.0154');
    end;

    // ALTERAÇÃO TABELA DE CHEQUES_CLIENTES
    try
      loqry.SQL.Clear;
      loqry.Open('select DEVEDOR_PESSOA_ID from CHEQUES_CLIENTES');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add('ALTER TABLE CHEQUES_CLIENTES ADD DEVEDOR_PESSOA_ID INTEGER') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " DEVEDOR_PESSOA_ID " com sucesso na tabela CHEQUES_CLIENTES');
      prc_atualiza_versao_do_banco('2025.94.0154');
    end;

    // CONTRATO_VENDA
    try
      loqry.SQL.Clear;
      loqry.Open('select ID from CONTRATO_VENDA ');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' CREATE TABLE CONTRATO_VENDA (                ') ;
      loqry.SQL.Add('     ID       INTEGER NOT NULL,               ') ;
      loqry.SQL.Add('     TEXTO    BLOB SUB_TYPE 0 SEGMENT SIZE 80 ') ;
      loqry.SQL.Add(' )                                            ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE CONTRATO_VENDA ADD CONSTRAINT PK_CONTRATO_VENDA PRIMARY KEY (ID) ') ;
      loqry.ExecSQL;

      loqry.SQL.Clear;
      loqry.SQL.Add(' INSERT INTO CONTRATO_VENDA (ID, TEXTO) VALUES (:ID, :TEXTO)') ;
      loQry.ParamByName('ID').AsInteger   := 1;
      loQry.ParamByName('TEXTO').AsString := 'TEXTO DO CONTRATO';
      loqry.ExecSQL;


    end;

    // 27/01/2026 PRODUTOS_TRELICA
    try
      loqry.SQL.Clear;
      loqry.Open('select TIPO_TRELICA from PRODUTOS_TRELICA ');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUTOS_TRELICA ADD TIPO_TRELICA SMALLINT ') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " TIPO_TRELICA " com sucesso na tabela PRODUTOS_TRELICA');
      prc_atualiza_versao_do_banco('2026.98.171');
    end;

    // 02/02/2026 PRODUTOS_FORMA_PAGAMENTO
    try
      loqry.SQL.Clear;
      loqry.Open('select PRECO_CUSTO from PRODUTOS_FORMA_PAGAMENTO ');
      loqry.Close;
    Except
      loqry.SQL.Clear;
      loqry.SQL.Add(' ALTER TABLE PRODUTOS_FORMA_PAGAMENTO ADD PRECO_CUSTO DECIMAL(15,2) ') ;
      loqry.ExecSQL;
      cria_mensagem_no_memo( memo,'criado campo " PRECO_CUSTO " com sucesso na tabela PRODUTOS_FORMA_PAGAMENTO');
      prc_atualiza_versao_do_banco('2026.98.175');
    end;



  finally
    freeandNil( loQry );
  end;

end;





end.
