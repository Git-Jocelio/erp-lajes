inherited frmProdutosConcretoE: TfrmProdutosConcretoE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmProdutosConcretoE'
  ClientHeight = 413
  ClientWidth = 510
  ExplicitWidth = 516
  ExplicitHeight = 419
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 510
    ExplicitWidth = 506
    inherited lbl_titulo: TLabel
      Width = 510
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 510
    end
  end
  inherited pnDados: TPanel
    Width = 510
    Height = 319
    ExplicitWidth = 506
    ExplicitHeight = 360
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
      Left = 426
      Top = 55
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label7: TLabel
      Left = 10
      Top = 163
      Width = 33
      Height = 17
      Caption = 'Custo'
      FocusControl = edCusto
    end
    object Label8: TLabel
      Left = 286
      Top = 163
      Width = 36
      Height = 17
      Caption = 'Venda'
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
      Left = 10
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
      Left = 414
      Top = 163
      Width = 28
      Height = 17
      Caption = 'Peso'
      FocusControl = edPeso
    end
    object Label9: TLabel
      Left = 135
      Top = 163
      Width = 94
      Height = 17
      Caption = 'Pre'#231'o Vendedor'
      FocusControl = edPrecoVendedor
    end
    object edDescricao: TDBEdit
      Left = 10
      Top = 73
      Width = 410
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
      Top = 183
      Width = 93
      Height = 25
      DataField = 'PRECO_CUSTO'
      DataSource = ds
      TabOrder = 1
    end
    object edVenda: TDBEdit
      Left = 286
      Top = 183
      Width = 87
      Height = 25
      DataField = 'PRECO_VENDA'
      DataSource = ds
      TabOrder = 2
    end
    object edFantasia: TDBEdit
      Left = 10
      Top = 127
      Width = 481
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 3
    end
    object cbAtivo: TDBCheckBox
      Left = 355
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
      Left = 355
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
      Left = 426
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
      Left = 414
      Top = 183
      Width = 77
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 7
    end
    object edPrecoVendedor: TDBEdit
      Left = 135
      Top = 183
      Width = 130
      Height = 25
      DataField = 'PRECO_VENDEDOR'
      DataSource = ds
      ImeName = 'CUSTO_BRUTO'
      TabOrder = 8
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 216
      Width = 510
      Height = 103
      ActivePage = tbs_dimensoes
      Align = alBottom
      TabOrder = 9
      ExplicitTop = 257
      ExplicitWidth = 506
      object tbs_dimensoes: TTabSheet
        Caption = 'Dimens'#245'es'
        object Label12: TLabel
          Left = 12
          Top = 4
          Width = 22
          Height = 17
          Caption = 'FCK'
          FocusControl = DBEdit5
        end
        object DBEdit5: TDBEdit
          Left = 8
          Top = 21
          Width = 81
          Height = 25
          CharCase = ecUpperCase
          DataField = 'RESISTENCIA'
          DataSource = dsConcreto
          TabOrder = 0
        end
      end
      object tbs_fiscal: TTabSheet
        Caption = 'Fiscal '
        ImageIndex = 1
        object Label20: TLabel
          Left = 6
          Top = 6
          Width = 107
          Height = 17
          Caption = 'Classifica'#231#227'o fiscal'
          FocusControl = edClassFis
        end
        object Label21: TLabel
          Left = 145
          Top = 6
          Width = 108
          Height = 17
          Caption = 'Situa'#231#227'o Tribut'#225'ria'
          FocusControl = edSitTrib
        end
        object edClassFis: TDBEdit
          Left = 6
          Top = 29
          Width = 81
          Height = 25
          CharCase = ecUpperCase
          DataField = 'CLASS_FIS'
          DataSource = ds
          TabOrder = 0
        end
        object edSitTrib: TDBEdit
          Left = 145
          Top = 29
          Width = 83
          Height = 25
          CharCase = ecUpperCase
          DataField = 'SIT_TRIB'
          DataSource = ds
          TabOrder = 1
        end
      end
    end
  end
  inherited pnRodape: TPanel
    Top = 376
    Width = 510
    ExplicitTop = 417
    ExplicitWidth = 506
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object dsConcreto: TDataSource
    DataSet = qryConcreto
    Left = 272
    Top = 121
  end
  object qryConcreto: TFDQuery
    Left = 224
    Top = 121
  end
end
