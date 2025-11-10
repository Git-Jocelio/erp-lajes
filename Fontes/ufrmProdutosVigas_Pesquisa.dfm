inherited frmProdutosVigas_Pesquisa: TfrmProdutosVigas_Pesquisa
  Caption = 'frmProdutosVigas_Pesquisa'
  ClientHeight = 441
  ClientWidth = 984
  ExplicitWidth = 996
  ExplicitHeight = 499
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 984
    Height = 97
    ExplicitWidth = 980
    ExplicitHeight = 97
    inherited btnLocalizar: TBitBtn
      Left = 393
      Width = 120
      Height = 30
      ExplicitLeft = 393
      ExplicitWidth = 120
      ExplicitHeight = 30
    end
    object rgAltura: TRadioGroup
      Left = 2
      Top = 19
      Width = 391
      Height = 76
      Align = alLeft
      Caption = '  Filtrar Vigas : '
      Columns = 3
      Items.Strings = (
        'H-8'
        'H-12'
        'H-16'
        'H-20'
        'H-25'
        'H-30')
      TabOrder = 1
    end
  end
  inherited ToolBar1: TToolBar
    Width = 984
    ExplicitWidth = 980
    inherited dbn_principal: TDBNavigator
      Width = 120
      Hints.Strings = ()
      ExplicitWidth = 120
    end
  end
  inherited StatusBar: TStatusBar
    Top = 422
    Width = 984
    ExplicitTop = 421
    ExplicitWidth = 980
  end
  inherited PageControl1: TPageControl
    Top = 145
    Width = 984
    Height = 277
    ExplicitTop = 145
    ExplicitWidth = 980
    ExplicitHeight = 276
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 976
      ExplicitHeight = 267
      inherited Panel5: TPanel
        Width = 976
        Height = 267
        ExplicitWidth = 972
        ExplicitHeight = 266
        inherited DBGrid1: TDBGrid
          Width = 976
          Height = 267
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
              Width = 321
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Unidade'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 66
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_CUSTO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o de Custo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 131
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUSTO_LIQUIDO'
              Title.Caption = 'Custo MP e MO'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 96
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
              Width = 141
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
              Width = 140
              Visible = True
            end>
        end
      end
    end
  end
  inherited ds: TDataSource
    Top = 208
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select '
      ' P.ID,'
      ' P.NOME_FANTASIA,'
      ' P.UNIDADE,'
      ' P.PRECO_CUSTO,'
      ' P.CUSTO_LIQUIDO,'
      ' P.PRECO_VENDEDOR,'
      ' P.PRECO_VENDA'
      ''
      'from '
      ' PRODUTOS P,'
      ' PRODUTOS_VIGAS V'
      'where'
      ' P.ID = V.PRODUTO_ID and'
      ' V.TRELICA_ALTURA = 120')
    Left = 104
    Top = 216
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
    object qryCUSTO_LIQUIDO: TCurrencyField
      FieldName = 'CUSTO_LIQUIDO'
      Origin = 'CUSTO_LIQUIDO'
    end
  end
  inherited mainmenu1: TMainMenu
    Left = 712
    Top = 8
  end
  inherited ImageList1: TImageList
    Left = 776
    Top = 8
  end
  inherited ActionList1: TActionList
    Left = 744
    Top = 8
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
  end
end
