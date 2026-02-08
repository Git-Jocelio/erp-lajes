inherited frmProdutosAdicionalE: TfrmProdutosAdicionalE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmProdutosAdicionalE'
  ClientHeight = 448
  ClientWidth = 569
  ExplicitWidth = 575
  ExplicitHeight = 454
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 569
    ExplicitWidth = 569
    inherited lbl_titulo: TLabel
      Width = 569
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 569
    end
  end
  inherited pnDados: TPanel
    Width = 569
    Height = 354
    ExplicitWidth = 569
    ExplicitHeight = 354
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
      Left = 452
      Top = 56
      Width = 65
      Height = 17
      Caption = 'Un Medida'
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
      Left = 452
      Top = 108
      Width = 28
      Height = 17
      Caption = 'Peso'
      FocusControl = edPeso
    end
    object edDescricao: TDBEdit
      Left = 10
      Top = 73
      Width = 436
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
    object edFantasia: TDBEdit
      Left = 10
      Top = 127
      Width = 436
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 1
    end
    object cbAtivo: TDBCheckBox
      Left = 339
      Top = 33
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbEstoqueControlado: TDBCheckBox
      Left = 415
      Top = 33
      Width = 143
      Height = 17
      Caption = 'Estoque controlado'
      DataField = 'ESTOQUE_CONTROLADO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbxUnidade: TDBComboBox
      Left = 452
      Top = 73
      Width = 106
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
      TabOrder = 4
    end
    object edPeso: TDBEdit
      Left = 452
      Top = 124
      Width = 106
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 5
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 161
      Width = 569
      Height = 193
      ActivePage = tbs_dimensoes
      Align = alBottom
      TabOrder = 6
      object tbs_dimensoes: TTabSheet
        Caption = 'Dimens'#245'es e Pre'#231'os'
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 561
          Height = 81
          Align = alTop
          TabOrder = 0
          object Label10: TLabel
            Left = 230
            Top = 7
            Width = 26
            Height = 17
            Caption = 'Tipo'
            FocusControl = DBEdit3
          end
          object Label11: TLabel
            Left = 121
            Top = 7
            Width = 80
            Height = 17
            Caption = 'Comprimento'
            FocusControl = DBEdit4
          end
          object Label12: TLabel
            Left = 12
            Top = 7
            Width = 54
            Height = 17
            Caption = 'Diametro'
            FocusControl = DBEdit5
          end
          object Label13: TLabel
            Left = 7
            Top = 53
            Width = 178
            Height = 15
            Caption = '* cadastrar as medidas em milimetros'
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentFont = False
          end
          object Label17: TLabel
            Left = 381
            Top = 7
            Width = 131
            Height = 34
            Caption = 'Custo barra de 12 mts no Fornecedor'
            FocusControl = edCusto12mts
            WordWrap = True
          end
          object DBEdit3: TDBEdit
            Left = 230
            Top = 25
            Width = 81
            Height = 25
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = dsAdicional
            TabOrder = 0
          end
          object DBEdit4: TDBEdit
            Left = 121
            Top = 25
            Width = 81
            Height = 25
            CharCase = ecUpperCase
            DataField = 'COMPRIMENTO'
            DataSource = dsAdicional
            TabOrder = 1
          end
          object DBEdit5: TDBEdit
            Left = 10
            Top = 25
            Width = 81
            Height = 25
            CharCase = ecUpperCase
            DataField = 'DIAMETRO'
            DataSource = dsAdicional
            TabOrder = 2
          end
          object edCusto12mts: TDBEdit
            Left = 473
            Top = 25
            Width = 81
            Height = 25
            CharCase = ecUpperCase
            DataField = 'PRECO_CUSTO_12MT'
            DataSource = dsAdicional
            TabOrder = 3
            OnExit = edCusto12mtsExit
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 81
          Width = 561
          Height = 80
          Align = alClient
          Caption = 'Pre'#231'os por metro linear '
          TabOrder = 1
          object Label7: TLabel
            Left = 15
            Top = 23
            Width = 104
            Height = 17
            Caption = 'Pre'#231'o Fornecedor'
            FocusControl = edCusto
          end
          object Label8: TLabel
            Left = 434
            Top = 21
            Width = 120
            Height = 17
            Caption = 'Pre'#231'o de Venda (Mt)'
            FocusControl = edVenda
          end
          object Label15: TLabel
            Left = 221
            Top = 23
            Width = 57
            Height = 17
            Caption = 'Pre'#231'o Liq.'
            FocusControl = DBEdit7
          end
          object Label16: TLabel
            Left = 139
            Top = 23
            Width = 55
            Height = 17
            Caption = 'Perca (%)'
            FocusControl = edPercentual
          end
          object Label4: TLabel
            Left = 326
            Top = 23
            Width = 94
            Height = 17
            Caption = 'Pre'#231'o Vendedor'
            FocusControl = DBEdit1
          end
          object edCusto: TDBEdit
            Left = 15
            Top = 40
            Width = 106
            Height = 25
            DataField = 'PRECO_CUSTO'
            DataSource = ds
            Enabled = False
            TabOrder = 0
          end
          object edVenda: TDBEdit
            Left = 448
            Top = 40
            Width = 106
            Height = 25
            DataField = 'PRECO_VENDA'
            DataSource = ds
            TabOrder = 1
          end
          object DBEdit7: TDBEdit
            Left = 221
            Top = 40
            Width = 90
            Height = 25
            Hint = 'Custo do produto considerando a perca'
            DataField = 'CUSTO_LIQUIDO'
            DataSource = ds
            Enabled = False
            ReadOnly = True
            TabOrder = 2
          end
          object edPercentual: TDBEdit
            Left = 139
            Top = 40
            Width = 62
            Height = 25
            Hint = 'Informe um percentual de perca'
            HelpType = htKeyword
            DataField = 'PERCA'
            DataSource = ds
            TabOrder = 3
            OnExit = edPercentualExit
          end
          object DBEdit1: TDBEdit
            Left = 326
            Top = 40
            Width = 106
            Height = 25
            Hint = 'Custo do produto considerando a perca'
            DataField = 'PRECO_VENDEDOR'
            DataSource = ds
            TabOrder = 4
          end
        end
      end
      object tbs_fiscal: TTabSheet
        Caption = 'Fiscal'
        ImageIndex = 1
        object GroupBox2: TGroupBox
          Left = 0
          Top = 0
          Width = 561
          Height = 161
          Align = alClient
          Caption = ' Fiscal '
          TabOrder = 0
          object Label20: TLabel
            Left = 11
            Top = 22
            Width = 107
            Height = 17
            Caption = 'Classifica'#231#227'o fiscal'
            FocusControl = edClassFis
          end
          object Label21: TLabel
            Left = 147
            Top = 22
            Width = 108
            Height = 17
            Caption = 'Situa'#231#227'o Tribut'#225'ria'
            FocusControl = edSitTrib
          end
          object Label22: TLabel
            Left = 284
            Top = 22
            Width = 60
            Height = 17
            Caption = 'Taxa ICMS'
            FocusControl = edTxICMS
          end
          object Label23: TLabel
            Left = 396
            Top = 22
            Width = 43
            Height = 17
            Caption = 'Taxa IPI'
            FocusControl = edTxIPI
          end
          object edClassFis: TDBEdit
            Left = 11
            Top = 40
            Width = 106
            Height = 25
            CharCase = ecUpperCase
            DataField = 'CLASS_FIS'
            DataSource = ds
            TabOrder = 0
          end
          object edSitTrib: TDBEdit
            Left = 147
            Top = 40
            Width = 106
            Height = 25
            CharCase = ecUpperCase
            DataField = 'SIT_TRIB'
            DataSource = ds
            TabOrder = 1
          end
          object edTxICMS: TDBEdit
            Left = 284
            Top = 40
            Width = 106
            Height = 25
            CharCase = ecUpperCase
            DataField = 'TX_ICMS'
            DataSource = ds
            TabOrder = 2
          end
          object edTxIPI: TDBEdit
            Left = 396
            Top = 40
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
    Top = 411
    Width = 569
    ExplicitTop = 411
    ExplicitWidth = 569
    inherited pnl_botoes: TPanel
      Left = 180
      ExplicitLeft = 180
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object qryAdicional: TFDQuery
    SQL.Strings = (
      '')
    Left = 241
    Top = 199
  end
  object dsAdicional: TDataSource
    DataSet = qryAdicional
    Left = 241
    Top = 167
  end
end
