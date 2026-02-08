inherited frmProdutosBomba: TfrmProdutosBomba
  Caption = 'frmProdutosBomba'
  ClientHeight = 436
  ClientWidth = 913
  Position = poMainFormCenter
  ExplicitWidth = 913
  ExplicitHeight = 436
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 913
    ExplicitWidth = 913
    inherited btnLocalizar: TBitBtn
      Top = 51
      ExplicitTop = 51
    end
  end
  inherited ToolBar1: TToolBar
    Width = 913
    ExplicitWidth = 913
  end
  inherited StatusBar: TStatusBar
    Top = 404
    Width = 913
    ExplicitTop = 404
    ExplicitWidth = 913
  end
  inherited PageControl1: TPageControl
    Width = 913
    Height = 199
    ExplicitWidth = 913
    ExplicitHeight = 199
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 905
      ExplicitHeight = 189
      inherited Panel5: TPanel
        Width = 905
        Height = 189
        ExplicitWidth = 905
        ExplicitHeight = 189
        inherited DBGrid1: TDBGrid
          Width = 865
          Height = 138
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 54
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
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Unidade'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_CUSTO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Fornecedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDEDOR'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Vendedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDA'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o de Venda'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 865
          ExplicitWidth = 865
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 913
    ExplicitWidth = 913
    inherited btn_fechar: TSpeedButton
      Left = 843
      ExplicitLeft = 843
    end
    inherited lbl_titulo: TLabel
      Width = 364
      Height = 56
      Caption = 'CONSULTA DE BOMBA DE CONCRETO'
      ExplicitWidth = 364
    end
    inherited pnl_separa_topo: TPanel
      Width = 913
      ExplicitWidth = 913
    end
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select'
      '   P.ID,'
      '   P.NOME_FANTASIA,'
      '   P.UNIDADE,      '
      '   P.PRECO_CUSTO,  '
      '   P.PRECO_VENDEDOR, '
      '   P.CUSTO_LIQUIDO,  '
      '   P.PRECO_VENDA     '
      'from'
      '   PRODUTOS P, PRODUTOS_BOMBA B'
      'where'
      '   P.ID = B.PRODUTO_ID')
    Left = 632
    Top = 40
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
      EditFormat = '0.00'
    end
    object qryPRECO_VENDEDOR: TCurrencyField
      FieldName = 'PRECO_VENDEDOR'
      Origin = 'PRECO_VENDEDOR'
      EditFormat = '0.00'
    end
    object qryCUSTO_LIQUIDO: TCurrencyField
      FieldName = 'CUSTO_LIQUIDO'
      Origin = 'CUSTO_LIQUIDO'
      EditFormat = '0.00'
    end
    object qryPRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      EditFormat = '0.00'
    end
  end
end
