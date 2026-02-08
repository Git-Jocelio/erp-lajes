inherited frmProdutosEpsE: TfrmProdutosEpsE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmProdutosEpsE'
  ClientHeight = 431
  ClientWidth = 511
  ExplicitWidth = 517
  ExplicitHeight = 437
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 511
    ExplicitWidth = 506
    inherited lbl_titulo: TLabel
      Width = 511
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 511
    end
  end
  inherited pnDados: TPanel
    Width = 511
    Height = 337
    ExplicitLeft = -112
    ExplicitTop = 8
    ExplicitWidth = 511
    ExplicitHeight = 337
    object Label1: TLabel
      Left = 10
      Top = 10
      Width = 12
      Height = 17
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 82
      Top = 10
      Width = 53
      Height = 17
      Caption = 'Cadastro'
    end
    object Label3: TLabel
      Left = 194
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
      Left = 431
      Top = 56
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label7: TLabel
      Left = 10
      Top = 160
      Width = 104
      Height = 17
      Caption = 'Pre'#231'o Fornecedor'
      FocusControl = edCusto
    end
    object Label8: TLabel
      Left = 325
      Top = 160
      Width = 92
      Height = 17
      Caption = 'Pre'#231'o de Venda'
      FocusControl = edVenda
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
      Left = 80
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
      Left = 192
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
      Left = 431
      Top = 106
      Width = 52
      Height = 17
      Caption = 'Peso(KG)'
      FocusControl = edPeso
    end
    object Label9: TLabel
      Left = 171
      Top = 160
      Width = 94
      Height = 17
      Caption = 'Pre'#231'o Vendedor'
      FocusControl = edPrecoVendedor
    end
    object edDescricao: TDBEdit
      Left = 10
      Top = 73
      Width = 415
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
      Top = 181
      Width = 100
      Height = 25
      DataField = 'PRECO_CUSTO'
      DataSource = ds
      TabOrder = 1
    end
    object edVenda: TDBEdit
      Left = 325
      Top = 181
      Width = 100
      Height = 25
      DataField = 'PRECO_VENDA'
      DataSource = ds
      TabOrder = 2
    end
    object edFantasia: TDBEdit
      Left = 10
      Top = 127
      Width = 415
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 3
    end
    object cbAtivo: TDBCheckBox
      Left = 357
      Top = 10
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbEstoqueControlado: TDBCheckBox
      Left = 357
      Top = 33
      Width = 143
      Height = 17
      Caption = 'Estoque controlado'
      DataField = 'ESTOQUE_CONTROLADO'
      DataSource = ds
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbxUnidade: TDBComboBox
      Left = 431
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
      TabOrder = 6
    end
    object edPeso: TDBEdit
      Left = 431
      Top = 127
      Width = 65
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 7
    end
    object edPrecoVendedor: TDBEdit
      Left = 171
      Top = 181
      Width = 100
      Height = 25
      DataField = 'PRECO_VENDEDOR'
      DataSource = ds
      ImeName = 'CUSTO_BRUTO'
      TabOrder = 8
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 216
      Width = 511
      Height = 121
      ActivePage = tbs_fiscal
      Align = alBottom
      TabOrder = 9
      ExplicitTop = 260
      ExplicitWidth = 506
      object tbs_dimensoes: TTabSheet
        Caption = ' Dimens'#245'es em milimetros'
        object gbDimensoes: TGroupBox
          Left = 0
          Top = 0
          Width = 503
          Height = 89
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 498
          object Label4: TLabel
            Left = 164
            Top = 6
            Width = 45
            Height = 17
            Caption = 'Largura'
            FocusControl = edLargura
          end
          object Label11: TLabel
            Left = 316
            Top = 6
            Width = 80
            Height = 17
            Caption = 'Comprimento'
            FocusControl = edComprimento
          end
          object Label12: TLabel
            Left = 7
            Top = 6
            Width = 43
            Height = 17
            Caption = '*Altura '
          end
          object Label13: TLabel
            Left = 8
            Top = 67
            Width = 231
            Height = 17
            Caption = '*Altura da treli'#231'a que vai usar esse isopor'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object edLargura: TDBEdit
            Left = 164
            Top = 29
            Width = 130
            Height = 25
            CharCase = ecUpperCase
            DataField = 'LARGURA'
            DataSource = dsEps
            TabOrder = 0
          end
          object edComprimento: TDBEdit
            Left = 316
            Top = 29
            Width = 130
            Height = 25
            CharCase = ecUpperCase
            DataField = 'COMPRIMENTO'
            DataSource = dsEps
            TabOrder = 1
          end
          object edAltura: TDBComboBox
            Left = 7
            Top = 29
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
      end
      object tbs_fiscal: TTabSheet
        Caption = 'Fiscal'
        ImageIndex = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 503
          Height = 89
          Align = alClient
          Caption = ' Fiscal '
          TabOrder = 0
          ExplicitWidth = 498
          object Label20: TLabel
            Left = 11
            Top = 22
            Width = 107
            Height = 17
            Caption = 'Classifica'#231#227'o fiscal'
            FocusControl = edClassFis
          end
          object Label21: TLabel
            Left = 150
            Top = 22
            Width = 108
            Height = 17
            Caption = 'Situa'#231#227'o Tribut'#225'ria'
            FocusControl = edSitTrib
          end
          object Label22: TLabel
            Left = 307
            Top = 22
            Width = 60
            Height = 17
            Caption = 'Taxa ICMS'
            FocusControl = edTxICMS
          end
          object Label23: TLabel
            Left = 414
            Top = 22
            Width = 43
            Height = 17
            Caption = 'Taxa IPI'
            FocusControl = edTxIPI
          end
          object edClassFis: TDBEdit
            Left = 11
            Top = 45
            Width = 107
            Height = 25
            CharCase = ecUpperCase
            DataField = 'CLASS_FIS'
            DataSource = ds
            TabOrder = 0
          end
          object edSitTrib: TDBEdit
            Left = 150
            Top = 45
            Width = 108
            Height = 25
            CharCase = ecUpperCase
            DataField = 'SIT_TRIB'
            DataSource = ds
            TabOrder = 1
          end
          object edTxICMS: TDBEdit
            Left = 307
            Top = 45
            Width = 73
            Height = 25
            CharCase = ecUpperCase
            DataField = 'TX_ICMS'
            DataSource = ds
            TabOrder = 2
          end
          object edTxIPI: TDBEdit
            Left = 414
            Top = 45
            Width = 78
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
    Top = 394
    Width = 511
    ExplicitTop = 438
    ExplicitWidth = 506
    inherited pnl_botoes: TPanel
      Left = 146
      ExplicitLeft = 146
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object qryEps: TFDQuery
    Left = 304
    Top = 81
  end
  object dsEps: TDataSource
    DataSet = qryEps
    Left = 296
    Top = 41
  end
end
