inherited frmProdutosAdicional: TfrmProdutosAdicional
  Caption = 'frmProdutosAdicional'
  ClientHeight = 441
  ClientWidth = 1055
  Position = poMainFormCenter
  ExplicitWidth = 1055
  ExplicitHeight = 441
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 1055
    ExplicitWidth = 1055
    inherited btnLocalizar: TBitBtn
      Top = 49
      ExplicitTop = 49
    end
  end
  inherited ToolBar1: TToolBar
    Width = 1055
    ExplicitWidth = 1055
  end
  inherited StatusBar: TStatusBar
    Top = 409
    Width = 1055
    ExplicitTop = 409
    ExplicitWidth = 1055
  end
  inherited PageControl1: TPageControl
    Width = 1055
    Height = 204
    ExplicitWidth = 1055
    ExplicitHeight = 204
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 1047
      ExplicitHeight = 194
      inherited Panel5: TPanel
        Width = 1047
        Height = 194
        ExplicitWidth = 1047
        ExplicitHeight = 194
        inherited DBGrid1: TDBGrid
          Width = 1007
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
              Width = 41
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
              Width = 281
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRECO_CUSTO_12MT'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Custo (12Mts)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 163
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CUSTO_METRO'
              Title.Alignment = taCenter
              Title.Caption = 'Custo (Mt)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 102
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PERCA'
              Title.Alignment = taCenter
              Title.Caption = 'Perca (%)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 69
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CUSTO_LIQUIDO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Liq.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 85
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRECO_VENDEDOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -15
              Font.Name = 'Times New Roman'
              Font.Style = [fsBold]
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Vendedor'
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
              FieldName = 'PRECO_VENDA'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o de Venda'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 118
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 1007
          ExplicitWidth = 1007
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 1055
    ExplicitWidth = 1055
    inherited btn_fechar: TSpeedButton
      Left = 985
      ExplicitLeft = 985
    end
    inherited lbl_titulo: TLabel
      Width = 271
      Height = 56
      Caption = 'CONSULTA DE VERGALH'#213'ES'
      ExplicitWidth = 271
    end
    inherited pnl_separa_topo: TPanel
      Width = 1055
      ExplicitWidth = 1055
    end
  end
  inherited ds: TDataSource
    Left = 688
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    FormatOptions.FmtDisplayNumeric = '0.00'
    SQL.Strings = (
      'select'
      '  P.ID,'
      '  P.NOME_FANTASIA,'
      '  A.PRECO_CUSTO_12MT,'
      '  A.PRECO_CUSTO_12MT/12 AS CUSTO_METRO,'
      '  P.PERCA,'
      '  P.CUSTO_LIQUIDO,'
      '  P.PRECO_VENDEDOR,'
      '  P.PRECO_VENDA,'
      '  P.ATIVO'
      'from '
      '  PRODUTOS P,'
      '  PRODUTOS_ADICIONAL A '
      'where'
      '  P.ID = A.PRODUTO_ID')
    Left = 688
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
    object qryPRECO_CUSTO_12MT: TCurrencyField
      AutoGenerateValue = arDefault
      FieldName = 'PRECO_CUSTO_12MT'
      Origin = 'PRECO_CUSTO_12MT'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPERCA: TCurrencyField
      FieldName = 'PERCA'
      Origin = 'PERCA'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryCUSTO_LIQUIDO: TCurrencyField
      FieldName = 'CUSTO_LIQUIDO'
      Origin = 'CUSTO_LIQUIDO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPRECO_VENDEDOR: TCurrencyField
      FieldName = 'PRECO_VENDEDOR'
      Origin = 'PRECO_VENDEDOR'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryCUSTO_METRO: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'CUSTO_METRO'
      Origin = 'CUSTO_METRO'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qryATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
  end
  inherited ImageList1: TImageList
    Left = 656
  end
  inherited ActionList1: TActionList
    Left = 624
  end
end
