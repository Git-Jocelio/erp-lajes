inherited frmProdutosLajotasE: TfrmProdutosLajotasE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmProdutosLajotasE'
  ClientHeight = 474
  ClientWidth = 493
  ExplicitWidth = 499
  ExplicitHeight = 480
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 493
    ExplicitWidth = 621
    inherited lbl_titulo: TLabel
      Width = 493
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 493
    end
  end
  inherited pnDados: TPanel
    Width = 493
    Height = 380
    Caption = #39#39
    ExplicitTop = 52
    ExplicitWidth = 625
    ExplicitHeight = 441
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 12
      Height = 17
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 92
      Top = 10
      Width = 53
      Height = 17
      Caption = 'Cadastro'
    end
    object Label3: TLabel
      Left = 197
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
      Left = 412
      Top = 56
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label7: TLabel
      Left = 12
      Top = 203
      Width = 104
      Height = 17
      Caption = 'Pre'#231'o Fornecedor'
      FocusControl = edCusto
    end
    object Label8: TLabel
      Left = 283
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
      Left = 90
      Top = 32
      Width = 79
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
      Left = 195
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
      Left = 401
      Top = 203
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
      Width = 397
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
      Left = 12
      Top = 219
      Width = 93
      Height = 25
      DataField = 'PRECO_CUSTO'
      DataSource = ds
      TabOrder = 1
    end
    object edVenda: TDBEdit
      Left = 283
      Top = 219
      Width = 87
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
      Top = 124
      Width = 468
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 4
    end
    object cbAtivo: TDBCheckBox
      Left = 340
      Top = 10
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
      Left = 340
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
      Left = 413
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
    object cbxDepartamento: TDBLookupComboBox
      Left = 60
      Top = 171
      Width = 418
      Height = 25
      DataField = 'DEPARTAMENTO_ID'
      DataSource = ds
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsDeptos
      TabOrder = 8
    end
    object edPeso: TDBEdit
      Left = 401
      Top = 219
      Width = 77
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 9
    end
    object edPrecoVendedor: TDBEdit
      Left = 141
      Top = 219
      Width = 130
      Height = 25
      DataField = 'PRECO_VENDEDOR'
      DataSource = ds
      ImeName = 'CUSTO_BRUTO'
      TabOrder = 10
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 253
      Width = 493
      Height = 127
      ActivePage = tbs_fiscal
      Align = alBottom
      TabOrder = 11
      ExplicitTop = 336
      ExplicitWidth = 488
      object tbs_dimensoes: TTabSheet
        Caption = ' Dimens'#245'es'
        object Label4: TLabel
          Left = 121
          Top = 14
          Width = 45
          Height = 17
          Caption = 'Largura'
          FocusControl = edLargura
        end
        object Label11: TLabel
          Left = 214
          Top = 14
          Width = 80
          Height = 17
          Caption = 'Comprimento'
          FocusControl = edComprimento
        end
        object Label12: TLabel
          Left = 12
          Top = 14
          Width = 34
          Height = 17
          Caption = 'Altura'
        end
        object Label13: TLabel
          Left = 12
          Top = 72
          Width = 221
          Height = 17
          Caption = '* cadastrar as medidas em milimetros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -15
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentFont = False
        end
        object edLargura: TDBEdit
          Left = 119
          Top = 35
          Width = 81
          Height = 25
          CharCase = ecUpperCase
          DataField = 'LARGURA'
          DataSource = dsLajotas
          TabOrder = 0
        end
        object edComprimento: TDBEdit
          Left = 214
          Top = 35
          Width = 81
          Height = 25
          CharCase = ecUpperCase
          DataField = 'COMPRIMENTO'
          DataSource = dsLajotas
          TabOrder = 1
        end
        object edAltura: TDBComboBox
          Left = 12
          Top = 35
          Width = 94
          Height = 25
          DataField = 'ALTURA'
          DataSource = dsLajotas
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
      object tbs_fiscal: TTabSheet
        Caption = 'Fiscal'
        ImageIndex = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 485
          Height = 95
          Align = alClient
          TabOrder = 0
          ExplicitLeft = -266
          ExplicitTop = 85
          ExplicitWidth = 547
          ExplicitHeight = 76
          object Label20: TLabel
            Left = 12
            Top = 14
            Width = 107
            Height = 17
            Caption = 'Classifica'#231#227'o fiscal'
            FocusControl = edClassFis
          end
          object Label21: TLabel
            Left = 150
            Top = 14
            Width = 108
            Height = 17
            Caption = 'Situa'#231#227'o Tribut'#225'ria'
            FocusControl = edSitTrib
          end
          object Label22: TLabel
            Left = 279
            Top = 14
            Width = 60
            Height = 17
            Caption = 'Taxa ICMS'
            FocusControl = edTxICMS
          end
          object Label23: TLabel
            Left = 397
            Top = 14
            Width = 43
            Height = 17
            Caption = 'Taxa IPI'
            FocusControl = edTxIPI
          end
          object edClassFis: TDBEdit
            Left = 12
            Top = 37
            Width = 81
            Height = 25
            CharCase = ecUpperCase
            DataField = 'CLASS_FIS'
            DataSource = ds
            TabOrder = 0
          end
          object edSitTrib: TDBEdit
            Left = 151
            Top = 37
            Width = 83
            Height = 25
            CharCase = ecUpperCase
            DataField = 'SIT_TRIB'
            DataSource = ds
            TabOrder = 1
          end
          object edTxICMS: TDBEdit
            Left = 279
            Top = 37
            Width = 77
            Height = 25
            CharCase = ecUpperCase
            DataField = 'TX_ICMS'
            DataSource = ds
            TabOrder = 2
          end
          object edTxIPI: TDBEdit
            Left = 392
            Top = 37
            Width = 81
            Height = 25
            CharCase = ecUpperCase
            DataField = 'TX_IPI'
            DataSource = ds
            TabOrder = 3
          end
        end
      end
    end
  end
  inherited pnRodape: TPanel
    Top = 437
    Width = 493
    ExplicitLeft = -8
    ExplicitTop = 442
    ExplicitWidth = 488
    inherited pnl_botoes: TPanel
      Left = 118
      ExplicitLeft = 118
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object dsLajotas: TDataSource
    DataSet = qryLajotas
    Left = 408
    Top = 49
  end
  object qryLajotas: TFDQuery
    Left = 408
    Top = 89
  end
  object dsDeptos: TDataSource
    DataSet = qryDeptos
    Left = 328
    Top = 161
  end
  object qryDeptos: TFDQuery
    Left = 333
    Top = 197
  end
end
