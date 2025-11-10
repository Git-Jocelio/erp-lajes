inherited frmProdutosConcretoE: TfrmProdutosConcretoE
  Caption = 'frmProdutosConcretoE'
  ClientHeight = 501
  ClientWidth = 630
  ExplicitWidth = 646
  ExplicitHeight = 540
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 630
    ExplicitWidth = 630
  end
  inherited pnDados: TPanel
    Width = 630
    Height = 407
    ExplicitWidth = 630
    ExplicitHeight = 407
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
      Top = 55
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
      FocusControl = edDescricao
    end
    object Label6: TLabel
      Left = 543
      Top = 55
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label7: TLabel
      Left = 13
      Top = 203
      Width = 33
      Height = 17
      Caption = 'Custo'
      FocusControl = edCusto
    end
    object Label8: TLabel
      Left = 286
      Top = 203
      Width = 36
      Height = 17
      Caption = 'Venda'
      FocusControl = edVenda
    end
    object Label19: TLabel
      Left = 10
      Top = 157
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
      Left = 395
      Top = 202
      Width = 28
      Height = 17
      Caption = 'Peso'
      FocusControl = edPeso
    end
    object Label9: TLabel
      Left = 144
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
      Left = 13
      Top = 219
      Width = 93
      Height = 25
      DataField = 'PRECO_CUSTO'
      DataSource = ds
      TabOrder = 1
    end
    object edVenda: TDBEdit
      Left = 286
      Top = 219
      Width = 87
      Height = 25
      DataField = 'PRECO_VENDA'
      DataSource = ds
      TabOrder = 2
    end
    object DBEdit19: TDBEdit
      Left = 10
      Top = 173
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
      Top = 173
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
      Left = 395
      Top = 219
      Width = 77
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 9
    end
    object GroupBox2: TGroupBox
      Left = 0
      Top = 256
      Width = 630
      Height = 76
      Align = alBottom
      Caption = ' Fiscal '
      TabOrder = 10
      object Label20: TLabel
        Left = 11
        Top = 22
        Width = 107
        Height = 17
        Caption = 'Classifica'#231#227'o fiscal'
        FocusControl = edClassFis
      end
      object Label21: TLabel
        Left = 144
        Top = 22
        Width = 108
        Height = 17
        Caption = 'Situa'#231#227'o Tribut'#225'ria'
        FocusControl = edSitTrib
      end
      object Label22: TLabel
        Left = 286
        Top = 22
        Width = 60
        Height = 17
        Caption = 'Taxa ICMS'
        FocusControl = edTxICMS
      end
      object Label23: TLabel
        Left = 395
        Top = 22
        Width = 43
        Height = 17
        Caption = 'Taxa IPI'
        FocusControl = edTxIPI
      end
      object edClassFis: TDBEdit
        Left = 11
        Top = 45
        Width = 81
        Height = 25
        CharCase = ecUpperCase
        DataField = 'CLASS_FIS'
        DataSource = ds
        TabOrder = 0
      end
      object edSitTrib: TDBEdit
        Left = 144
        Top = 45
        Width = 83
        Height = 25
        CharCase = ecUpperCase
        DataField = 'SIT_TRIB'
        DataSource = ds
        TabOrder = 1
      end
      object edTxICMS: TDBEdit
        Left = 286
        Top = 45
        Width = 77
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TX_ICMS'
        DataSource = ds
        TabOrder = 2
      end
      object edTxIPI: TDBEdit
        Left = 395
        Top = 45
        Width = 81
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TX_IPI'
        DataSource = ds
        TabOrder = 3
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 332
      Width = 630
      Height = 75
      Align = alBottom
      Caption = ' Dimens'#245'es'
      TabOrder = 11
      object Label12: TLabel
        Left = 12
        Top = 20
        Width = 22
        Height = 17
        Caption = 'FCK'
        FocusControl = DBEdit5
      end
      object DBEdit5: TDBEdit
        Left = 12
        Top = 37
        Width = 81
        Height = 25
        CharCase = ecUpperCase
        DataField = 'RESISTENCIA'
        DataSource = dsConcreto
        TabOrder = 0
      end
    end
    object edPrecoVendedor: TDBEdit
      Left = 144
      Top = 219
      Width = 130
      Height = 25
      DataField = 'PRECO_VENDEDOR'
      DataSource = ds
      ImeName = 'CUSTO_BRUTO'
      TabOrder = 12
    end
  end
  inherited pnRodape: TPanel
    Top = 464
    Width = 630
    ExplicitTop = 464
    ExplicitWidth = 630
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object dsConcreto: TDataSource
    DataSet = qryConcreto
    Left = 576
    Top = 49
  end
  object qryConcreto: TFDQuery
    Left = 576
    Top = 97
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
end
