inherited frmProdutosEpsE: TfrmProdutosEpsE
  Caption = 'frmProdutosEpsE'
  ClientHeight = 547
  ClientWidth = 617
  ExplicitTop = -21
  ExplicitWidth = 629
  ExplicitHeight = 585
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 617
    ExplicitWidth = 598
    inherited lbl_titulo: TLabel
      Width = 617
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 617
    end
  end
  inherited pnDados: TPanel
    Width = 617
    Height = 453
    ExplicitWidth = 598
    ExplicitHeight = 428
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 12
      Height = 17
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 114
      Top = 10
      Width = 53
      Height = 17
      Caption = 'Cadastro'
    end
    object Label3: TLabel
      Left = 242
      Top = 10
      Width = 55
      Height = 17
      Caption = 'Altera'#231#227'o'
    end
    object Label5: TLabel
      Left = 10
      Top = 56
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
      FocusControl = edDescricao
    end
    object Label6: TLabel
      Left = 543
      Top = 56
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label7: TLabel
      Left = 10
      Top = 202
      Width = 104
      Height = 17
      Caption = 'Pre'#231'o Fornecedor'
      FocusControl = edCusto
    end
    object Label8: TLabel
      Left = 320
      Top = 202
      Width = 92
      Height = 17
      Caption = 'Pre'#231'o de Venda'
      FocusControl = edVenda
    end
    object Label19: TLabel
      Left = 10
      Top = 155
      Width = 84
      Height = 17
      Caption = 'Departamento'
      FocusControl = DBEdit19
    end
    object Label29: TLabel
      Left = 10
      Top = 109
      Width = 87
      Height = 17
      Caption = 'Nome Fantasia'
      FocusControl = edFantasia
    end
    object edID: TDBText
      Left = 12
      Top = 32
      Width = 65
      Height = 17
      DataField = 'ID'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edCadastro: TDBText
      Left = 112
      Top = 32
      Width = 73
      Height = 17
      DataField = 'DATA_CAD'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edAlteracao: TDBText
      Left = 240
      Top = 32
      Width = 79
      Height = 17
      DataField = 'DATA_ALT'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label28: TLabel
      Left = 478
      Top = 202
      Width = 52
      Height = 17
      Caption = 'Peso(KG)'
      FocusControl = edPeso
    end
    object Label9: TLabel
      Left = 168
      Top = 202
      Width = 94
      Height = 17
      Caption = 'Pre'#231'o Vendedor'
      FocusControl = edPrecoVendedor
    end
    object edDescricao: TDBEdit
      Left = 10
      Top = 73
      Width = 527
      Height = 30
      CharCase = ecUpperCase
      DataField = 'DESCRICAO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object edCusto: TDBEdit
      Left = 10
      Top = 223
      Width = 130
      Height = 25
      DataField = 'PRECO_CUSTO'
      DataSource = ds
      TabOrder = 1
    end
    object edVenda: TDBEdit
      Left = 320
      Top = 223
      Width = 130
      Height = 25
      DataField = 'PRECO_VENDA'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit19: TDBEdit
      Left = 10
      Top = 171
      Width = 47
      Height = 25
      DataField = 'DEPARTAMENTO_ID'
      DataSource = ds
      TabOrder = 3
    end
    object edFantasia: TDBEdit
      Left = 10
      Top = 127
      Width = 598
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 4
    end
    object cbAtivo: TDBCheckBox
      Left = 339
      Top = 33
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbEstoqueControlado: TDBCheckBox
      Left = 442
      Top = 33
      Width = 143
      Height = 17
      Caption = 'Estoque controlado'
      DataField = 'ESTOQUE_CONTROLADO'
      DataSource = ds
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbxUnidade: TDBComboBox
      Left = 543
      Top = 73
      Width = 65
      Height = 25
      DataField = 'UNIDADE'
      DataSource = ds
      Items.Strings = (
        'PC'
        'MT'
        'M2'
        'M3'
        'LT'
        'KG'
        'UN')
      TabOrder = 7
    end
    object cbxDepartamentos: TDBLookupComboBox
      Left = 60
      Top = 171
      Width = 548
      Height = 25
      DataField = 'DEPARTAMENTO_ID'
      DataSource = ds
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsDeptos
      TabOrder = 8
    end
    object edPeso: TDBEdit
      Left = 478
      Top = 223
      Width = 130
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 9
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 260
      Width = 617
      Height = 76
      Align = alBottom
      Caption = ' Fiscal '
      TabOrder = 10
      ExplicitTop = 247
      ExplicitWidth = 598
      object Label20: TLabel
        Left = 11
        Top = 22
        Width = 107
        Height = 17
        Caption = 'Classifica'#231#227'o fiscal'
        FocusControl = edClassFis
      end
      object Label21: TLabel
        Left = 168
        Top = 22
        Width = 108
        Height = 17
        Caption = 'Situa'#231#227'o Tribut'#225'ria'
        FocusControl = edSitTrib
      end
      object Label22: TLabel
        Left = 320
        Top = 22
        Width = 60
        Height = 17
        Caption = 'Taxa ICMS'
        FocusControl = edTxICMS
      end
      object Label23: TLabel
        Left = 478
        Top = 22
        Width = 43
        Height = 17
        Caption = 'Taxa IPI'
        FocusControl = edTxIPI
      end
      object edClassFis: TDBEdit
        Left = 11
        Top = 45
        Width = 130
        Height = 25
        CharCase = ecUpperCase
        DataField = 'CLASS_FIS'
        DataSource = ds
        TabOrder = 0
      end
      object edSitTrib: TDBEdit
        Left = 168
        Top = 45
        Width = 130
        Height = 25
        CharCase = ecUpperCase
        DataField = 'SIT_TRIB'
        DataSource = ds
        TabOrder = 1
      end
      object edTxICMS: TDBEdit
        Left = 320
        Top = 45
        Width = 130
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TX_ICMS'
        DataSource = ds
        TabOrder = 2
      end
      object edTxIPI: TDBEdit
        Left = 478
        Top = 45
        Width = 130
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TX_IPI'
        DataSource = ds
        TabOrder = 3
      end
    end
    object gbDimensoes: TGroupBox
      Left = 0
      Top = 336
      Width = 617
      Height = 117
      Align = alBottom
      Caption = ' Dimens'#245'es em milimetros'
      TabOrder = 11
      object Label4: TLabel
        Left = 168
        Top = 26
        Width = 45
        Height = 17
        Caption = 'Largura'
        FocusControl = edLargura
      end
      object Label11: TLabel
        Left = 320
        Top = 26
        Width = 80
        Height = 17
        Caption = 'Comprimento'
        FocusControl = edComprimento
      end
      object Label12: TLabel
        Left = 11
        Top = 26
        Width = 43
        Height = 17
        Caption = '*Altura '
      end
      object Label13: TLabel
        Left = 12
        Top = 87
        Width = 230
        Height = 17
        Caption = '*Altuta da treli'#231'a que vai usar esse isopor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = [fsItalic]
        ParentFont = False
      end
      object edLargura: TDBEdit
        Left = 168
        Top = 49
        Width = 130
        Height = 25
        CharCase = ecUpperCase
        DataField = 'LARGURA'
        DataSource = dsEps
        TabOrder = 0
      end
      object edComprimento: TDBEdit
        Left = 320
        Top = 49
        Width = 130
        Height = 25
        CharCase = ecUpperCase
        DataField = 'COMPRIMENTO'
        DataSource = dsEps
        TabOrder = 1
      end
      object edAltura: TDBComboBox
        Left = 11
        Top = 49
        Width = 130
        Height = 25
        DataField = 'ALTURA'
        DataSource = dsEps
        Items.Strings = (
          '80'
          '120'
          '160'
          '200'
          '250'
          '300')
        TabOrder = 2
      end
    end
    object edPrecoVendedor: TDBEdit
      Left = 168
      Top = 223
      Width = 130
      Height = 25
      DataField = 'PRECO_VENDEDOR'
      DataSource = ds
      ImeName = 'CUSTO_BRUTO'
      TabOrder = 12
    end
  end
  inherited pnRodape: TPanel
    Top = 510
    Width = 617
    ExplicitTop = 485
    ExplicitWidth = 598
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object dsDeptos: TDataSource
    DataSet = qryDeptos
    Left = 568
    Top = 177
  end
  object qryDeptos: TFDQuery
    Left = 573
    Top = 221
  end
  object qryEps: TFDQuery
    Left = 576
    Top = 97
  end
  object dsEps: TDataSource
    DataSet = qryEps
    Left = 576
    Top = 49
  end
end
