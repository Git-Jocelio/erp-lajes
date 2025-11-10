inherited frmEstoquesProducao: TfrmEstoquesProducao
  BorderStyle = bsDialog
  Caption = 'SYSLAJES - SISTEMA DE GERENCIAMENTO DE LAJES '
  ClientHeight = 509
  ClientWidth = 552
  ExplicitWidth = 564
  ExplicitHeight = 547
  TextHeight = 15
  object pnl_fundo: TPanel [0]
    Left = 0
    Top = 0
    Width = 552
    Height = 509
    Align = alClient
    TabOrder = 0
    ExplicitLeft = -24
    ExplicitTop = 24
    DesignSize = (
      552
      509)
    object pnl_topo: TPanel
      Left = 1
      Top = 1
      Width = 550
      Height = 56
      Align = alTop
      TabOrder = 0
      ExplicitLeft = -31
      ExplicitTop = 136
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 167
        Height = 17
        Caption = 'Listar vigas '#224' produzir at'#233' : '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dtp_data: TDateTimePicker
        Left = 201
        Top = 16
        Width = 168
        Height = 25
        CalAlignment = dtaRight
        Date = 45597.000000000000000000
        Time = 0.653582569444552100
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
    end
    object BitBtn1: TBitBtn
      Left = 132
      Top = 472
      Width = 107
      Height = 25
      Anchors = [akBottom]
      Caption = 'Consultar'
      TabOrder = 1
      OnClick = BitBtn1Click
      ExplicitLeft = 131
      ExplicitTop = 471
    end
    object BitBtn3: TBitBtn
      Left = 349
      Top = 472
      Width = 91
      Height = 25
      Anchors = [akBottom]
      Caption = 'Fechar'
      TabOrder = 2
      OnClick = BitBtn3Click
    end
    object Panel1: TPanel
      Left = 1
      Top = 57
      Width = 550
      Height = 409
      Align = alTop
      TabOrder = 3
      object lb: TListBox
        Left = 1
        Top = 1
        Width = 548
        Height = 407
        Align = alClient
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Courier New'
        Font.Style = []
        ItemHeight = 17
        ParentFont = False
        TabOrder = 0
        ExplicitLeft = 2
        ExplicitTop = 17
        ExplicitHeight = 312
      end
    end
    object btn_imprimir: TBitBtn
      Left = 245
      Top = 472
      Width = 98
      Height = 25
      Caption = 'IMPRIMIR'
      Enabled = False
      TabOrder = 4
      OnClick = btn_imprimirClick
    end
  end
  inherited qry: TFDQuery
    Left = 40
    Top = 208
  end
  object ds: TDataSource
    DataSet = qry
    OnDataChange = dsDataChange
    Left = 40
    Top = 240
  end
  object qry_lista_itens_pedido: TFDQuery
    SQL.Strings = (
      'select i.pedido_id, i.produto_id, p.data_entrega, i.qtde, c.nome'
      'from pedidos_itens i, pedidos p, pessoas c'
      'where p.id = i.pedido_id and'
      '      p.cliente_id = c.id and'
      '      p.situacao = '#39'ABERTO'#39' and'
      ''
      '      p.data_entrega <= :data_entrega and'
      '      i.produto_id = :produto_id')
    Left = 121
    Top = 209
    ParamData = <
      item
        Name = 'DATA_ENTREGA'
        ParamType = ptInput
      end
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end>
  end
  object qry_lista_itens_laje: TFDQuery
    SQL.Strings = (
      'select i.pedido_id, i.produto_id, p.data_entrega, i.qtde, c.nome'
      'from pedidos_itens_laje i, pedidos p, pessoas c'
      'where p.id = i.pedido_id and'
      '      p.cliente_id = c.id and'
      '      p.situacao = '#39'ABERTO'#39' and'
      ''
      '      p.data_entrega <= :data_entrega and'
      '      i.produto_id = :produto_id')
    Left = 81
    Top = 209
    ParamData = <
      item
        Name = 'DATA_ENTREGA'
        ParamType = ptInput
      end
      item
        Name = 'PRODUTO_ID'
        ParamType = ptInput
      end>
  end
end
