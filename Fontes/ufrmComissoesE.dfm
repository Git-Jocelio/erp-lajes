inherited frmComissoesE: TfrmComissoesE
  Caption = 'frmComissoesE'
  ClientHeight = 327
  ClientWidth = 553
  ExplicitWidth = 559
  ExplicitHeight = 356
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 553
    Height = 66
    ExplicitWidth = 553
    ExplicitHeight = 66
    inherited lbl_titulo: TLabel
      Left = 0
      Top = 0
      Width = 553
      Height = 32
      Align = alClient
      ExplicitLeft = 0
      ExplicitTop = 0
    end
    inherited lbl_sub_titulo: TLabel
      Left = 0
      Top = 32
      Width = 553
      Height = 34
      Align = alBottom
      AutoSize = False
      Font.Height = -12
      WordWrap = True
      ExplicitLeft = 0
      ExplicitTop = 32
      ExplicitWidth = 553
      ExplicitHeight = 34
    end
  end
  inherited pnDados: TPanel
    Top = 66
    Width = 553
    Height = 224
    ExplicitTop = 66
    ExplicitWidth = 553
    ExplicitHeight = 224
    object Label32: TLabel
      Left = 4
      Top = 78
      Width = 84
      Height = 17
      Caption = 'Data contabil :'
    end
    object Label1: TLabel
      Left = 4
      Top = 16
      Width = 19
      Height = 17
      Caption = 'ID :'
    end
    object lbl_id: TLabel
      Left = 51
      Top = 16
      Width = 14
      Height = 17
      Alignment = taRightJustify
      Caption = '00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 170
      Top = 16
      Width = 93
      Height = 17
      Caption = 'Cadastrado em:'
    end
    object lbl_cadastrado_em: TLabel
      Left = 269
      Top = 16
      Width = 66
      Height = 17
      Caption = '00/00/0000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 387
      Top = 16
      Width = 79
      Height = 17
      Caption = 'Alterado em :'
    end
    object lbl_alterado_em: TLabel
      Left = 469
      Top = 16
      Width = 66
      Height = 17
      Caption = '00/00/0000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 372
      Top = 47
      Width = 64
      Height = 17
      Caption = 'Vendedor :'
    end
    object Label3: TLabel
      Left = 4
      Top = 113
      Width = 76
      Height = 17
      Caption = 'Observa'#231#245'es'
    end
    object lbl_nome_vendedor: TLabel
      Left = 453
      Top = 47
      Width = 83
      Height = 17
      Caption = 'nm_vendedor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_numero_pedido: TLabel
      Left = 85
      Top = 47
      Width = 60
      Height = 17
      Caption = 'nr_pedido'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 4
      Top = 47
      Width = 52
      Height = 17
      Caption = 'Pedido : '
    end
    object dtp_data_contabil: TDateTimePicker
      Left = 94
      Top = 78
      Width = 147
      Height = 23
      Date = 44628.000000000000000000
      Time = 0.729680138887488300
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object mm_obs: TMemo
      Left = 0
      Top = 135
      Width = 553
      Height = 89
      Align = alBottom
      BevelInner = bvNone
      BevelOuter = bvNone
      CharCase = ecUpperCase
      TabOrder = 1
    end
  end
  inherited pnRodape: TPanel
    Top = 290
    Width = 553
    ExplicitTop = 290
    ExplicitWidth = 553
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    Left = 120
    Top = 304
  end
  inherited ds: TDataSource
    Left = 120
    Top = 273
  end
  object dsComissao_itens: TDataSource
    AutoEdit = False
    DataSet = qryComissao_itens
    Left = 150
    Top = 273
  end
  object qryComissao_itens: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select '
      '  I.ID, '
      '  I.PEDIDO_ID, '
      '  I.PRODUTO_ID, '
      '  P.NOME_FANTASIA, '
      '  I.QUANTIDADE, '
      '  I.CUSTO_FORN, '
      '  I.CUSTO_VEND, '
      '  I.PRECO_VENDA, '
      '  I.DEBITO_CREDITO, '
      '  I.OBS '
      'from '
      '  COMISSAO_ITEM I,'
      '  PRODUTOS P'
      'where'
      '  I.PRODUTO_ID = P.ID and'
      '  I.PEDIDO_ID = :PEDIDO_ID')
    Left = 150
    Top = 305
    ParamData = <
      item
        Name = 'PEDIDO_ID'
        DataType = ftString
        ParamType = ptInput
        Value = ''
      end>
    object qryComissao_itensID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryComissao_itensPEDIDO_ID: TIntegerField
      FieldName = 'PEDIDO_ID'
      Origin = 'PEDIDO_ID'
      Required = True
    end
    object qryComissao_itensPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Origin = 'PRODUTO_ID'
      Required = True
    end
    object qryComissao_itensNOME_FANTASIA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryComissao_itensQUANTIDADE: TCurrencyField
      Alignment = taCenter
      FieldName = 'QUANTIDADE'
      Origin = 'QUANTIDADE'
      Required = True
      currency = False
    end
    object qryComissao_itensCUSTO_FORN: TCurrencyField
      FieldName = 'CUSTO_FORN'
      Origin = 'CUSTO_FORN'
    end
    object qryComissao_itensCUSTO_VEND: TCurrencyField
      FieldName = 'CUSTO_VEND'
      Origin = 'CUSTO_VEND'
    end
    object qryComissao_itensPRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
    end
    object qryComissao_itensDEBITO_CREDITO: TStringField
      FieldName = 'DEBITO_CREDITO'
      Origin = 'DEBITO_CREDITO'
      Size = 1
    end
    object qryComissao_itensOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 30
    end
  end
  object dsVendedor: TDataSource
    AutoEdit = False
    DataSet = qryVendedor
    Left = 296
    Top = 272
  end
  object qryVendedor: TFDQuery
    Left = 296
    Top = 304
  end
end
