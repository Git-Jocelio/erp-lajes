inherited frmViga_AlteracaoPreco: TfrmViga_AlteracaoPreco
  ClientHeight = 394
  ClientWidth = 633
  ExplicitWidth = 639
  ExplicitHeight = 423
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 633
    Caption = 'Altera'#231#227'o do Pre'#231'o do metro de Viga'
    ExplicitWidth = 633
  end
  inherited pnDados: TPanel
    Width = 633
    Height = 268
    ExplicitWidth = 633
    ExplicitHeight = 268
    object Bevel1: TBevel
      Left = 16
      Top = 144
      Width = 169
      Height = 26
    end
    object DBText1: TDBText
      Left = 22
      Top = 148
      Width = 153
      Height = 17
      DataField = 'PRECO_CUSTO'
      DataSource = dsVigas
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object TLabel
      Left = 24
      Top = 104
      Width = 4
      Height = 17
    end
    object Label2: TLabel
      Left = 16
      Top = 104
      Width = 174
      Height = 34
      Caption = 'Pre'#231'o de custo dos materiais  por metro linear'
      WordWrap = True
    end
    object Label3: TLabel
      Left = 208
      Top = 104
      Width = 181
      Height = 34
      Caption = 'Informe o valor '#224' ser cobrado por metro linear do Vendedor'
      WordWrap = True
    end
    object Label1: TLabel
      Left = 431
      Top = 104
      Width = 183
      Height = 34
      Caption = 'Informe o valor '#224' ser cobrado por metro linear da Venda final'
      WordWrap = True
    end
    object edValorVendedor: TEdit
      Left = 208
      Top = 144
      Width = 121
      Height = 25
      Alignment = taRightJustify
      TabOrder = 0
      Text = '0,00'
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 633
      Height = 72
      Align = alTop
      Caption = ' Selecione uma viga '
      TabOrder = 1
      object cbxVigas: TDBLookupComboBox
        Left = 15
        Top = 24
        Width = 594
        Height = 29
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NOME_FANTASIA'
        ListSource = dsVigas
        ParentFont = False
        TabOrder = 0
      end
    end
    object mmMens: TMemo
      Left = 0
      Top = 184
      Width = 633
      Height = 84
      Align = alBottom
      TabOrder = 2
    end
    object edValorVenda: TEdit
      Left = 431
      Top = 144
      Width = 121
      Height = 25
      Alignment = taRightJustify
      TabOrder = 3
      Text = '0,00'
    end
  end
  inherited pnRodape: TPanel
    Top = 357
    Width = 633
    ExplicitTop = 357
    ExplicitWidth = 633
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
        ExplicitLeft = 0
        ExplicitTop = 0
        ExplicitHeight = 34
      end
      inherited btnFechar: TBitBtn
        ExplicitLeft = 108
        ExplicitTop = 0
        ExplicitWidth = 114
        ExplicitHeight = 34
      end
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select '
      '  P.ID,'
      '  P.NOME_FANTASIA,'
      '  P.PRECO_CUSTO, '
      '  P.PRECO_VENDEDOR, '
      '  P.PRECO_VENDA,'
      '  V.COMPRIMENTO'
      'from '
      '  PRODUTOS P, PRODUTOS_VIGAS V'
      'where '
      '  V.PRODUTO_ID = P.ID and '
      '  V.TRELICA_ALTURA= :ALTURA')
    Left = 256
    Top = 56
    ParamData = <
      item
        Name = 'ALTURA'
        DataType = ftString
        ParamType = ptInput
        Size = 80
        Value = '80'
      end>
  end
  inherited ds: TDataSource
    AutoEdit = False
    Left = 224
    Top = 57
  end
  object qryVigas: TFDQuery
    SQL.Strings = (
      
        'select P.ID, P.NOME_FANTASIA, P.PRECO_CUSTO, P.PRECO_VENDEDOR, P' +
        '.PRECO_VENDA, V.TRELICA_ALTURA'
      'from PRODUTOS P, PRODUTOS_VIGAS V'
      
        'where P.ID = V.PRODUTO_ID and P.VIGA = '#39'S'#39' and V.COMPRIMENTO = 1' +
        '000')
    Left = 497
    Top = 66
  end
  object dsVigas: TDataSource
    AutoEdit = False
    DataSet = qryVigas
    Left = 529
    Top = 66
  end
end
