inherited frmProdutosEps: TfrmProdutosEps
  Caption = 'frmProdutosEps'
  ClientHeight = 441
  ClientWidth = 984
  Position = poMainFormCenter
  ExplicitWidth = 984
  ExplicitHeight = 441
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 984
    ExplicitWidth = 984
    inherited btnLocalizar: TBitBtn
      Top = 50
      Visible = False
      ExplicitTop = 50
    end
  end
  inherited ToolBar1: TToolBar
    Width = 984
    ExplicitWidth = 984
  end
  inherited StatusBar: TStatusBar
    Top = 409
    Width = 984
    ExplicitTop = 409
    ExplicitWidth = 984
  end
  inherited PageControl1: TPageControl
    Width = 984
    Height = 204
    ExplicitWidth = 984
    ExplicitHeight = 204
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 976
      ExplicitHeight = 194
      inherited Panel5: TPanel
        Width = 976
        Height = 194
        ExplicitWidth = 976
        ExplicitHeight = 194
        inherited DBGrid1: TDBGrid
          Width = 936
          Height = 143
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_FANTASIA'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 387
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Un'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 71
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRECO_CUSTO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Fornecedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 146
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRECO_VENDEDOR'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Vendedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 126
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRECO_VENDA'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o de Venda'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 130
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ESTOQUE_FISICO'
              Title.Alignment = taCenter
              Title.Caption = 'Fisico'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PEDIDO_ABERTO'
              Title.Alignment = taCenter
              Title.Caption = 'Aberto'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ESTOQUE_DISPONIVEL'
              Title.Alignment = taCenter
              Title.Caption = 'Disponivel'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PEDIDO_AGUARDANDO'
              Title.Alignment = taCenter
              Title.Caption = 'Aguardando'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ESTOQUE_LIQUIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Liquido'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = False
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 936
          ExplicitWidth = 936
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 984
    ExplicitWidth = 984
    inherited btn_fechar: TSpeedButton
      Left = 914
      ExplicitLeft = 914
    end
    inherited lbl_titulo: TLabel
      Width = 282
      Height = 56
      Caption = 'CONSULTA DE EPS ( ISOPOR )'
      ExplicitWidth = 282
    end
    inherited pnl_separa_topo: TPanel
      Width = 984
      ExplicitWidth = 984
    end
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      ' select'
      '   P.ID, P.NOME_FANTASIA, P.UNIDADE, '
      '   P.PRECO_CUSTO, P.PRECO_VENDEDOR, P.PRECO_VENDA,'
      
        '   P.ESTOQUE_FISICO, P.PEDIDO_ABERTO, P.ESTOQUE_DISPONIVEL, P.PE' +
        'DIDO_AGUARDANDO, P.ESTOQUE_LIQUIDO'
      'from'
      '   PRODUTOS P, PRODUTOS_EPS E'
      'where'
      '   P.ID = E.PRODUTO_ID AND REVENDA = '#39'S'#39
      '')
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 100
    end
    object qryUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 2
    end
    object qryPRECO_CUSTO: TCurrencyField
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
    end
    object qryPRECO_VENDEDOR: TCurrencyField
      FieldName = 'PRECO_VENDEDOR'
      Origin = 'PRECO_VENDEDOR'
    end
    object qryPRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
    end
    object qryESTOQUE_FISICO: TCurrencyField
      FieldName = 'ESTOQUE_FISICO'
      Origin = 'ESTOQUE_FISICO'
    end
    object qryPEDIDO_ABERTO: TCurrencyField
      FieldName = 'PEDIDO_ABERTO'
      Origin = 'PEDIDO_ABERTO'
    end
    object qryESTOQUE_DISPONIVEL: TCurrencyField
      FieldName = 'ESTOQUE_DISPONIVEL'
      Origin = 'ESTOQUE_DISPONIVEL'
    end
    object qryPEDIDO_AGUARDANDO: TCurrencyField
      FieldName = 'PEDIDO_AGUARDANDO'
      Origin = 'PEDIDO_AGUARDANDO'
    end
    object qryESTOQUE_LIQUIDO: TCurrencyField
      FieldName = 'ESTOQUE_LIQUIDO'
      Origin = 'ESTOQUE_LIQUIDO'
    end
  end
  inherited ImageList1: TImageList
    Left = 728
  end
  inherited ActionList1: TActionList
    Left = 696
  end
end
