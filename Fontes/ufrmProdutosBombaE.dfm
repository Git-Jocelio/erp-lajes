inherited frmProdutosBombaE: TfrmProdutosBombaE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmProdutosBombaE'
  ClientHeight = 413
  ClientWidth = 423
  ExplicitWidth = 429
  ExplicitHeight = 419
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 423
    ExplicitWidth = 615
    inherited lbl_titulo: TLabel
      Width = 423
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 423
    end
  end
  inherited pnDados: TPanel
    Width = 423
    Height = 319
    ExplicitLeft = -40
    ExplicitTop = 8
    ExplicitWidth = 536
    ExplicitHeight = 317
    object Bevel2: TBevel
      Left = 5
      Top = 24
      Width = 81
      Height = 25
    end
    object Label1: TLabel
      Left = 9
      Top = 6
      Width = 12
      Height = 17
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 98
      Top = 6
      Width = 53
      Height = 17
      Caption = 'Cadastro'
    end
    object Label3: TLabel
      Left = 202
      Top = 6
      Width = 55
      Height = 17
      Caption = 'Altera'#231#227'o'
    end
    object Label5: TLabel
      Left = 5
      Top = 56
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
      FocusControl = edDescricao
    end
    object Label6: TLabel
      Left = 353
      Top = 53
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label7: TLabel
      Left = 5
      Top = 162
      Width = 104
      Height = 17
      Caption = 'Pre'#231'o Fornecedor'
      FocusControl = edCusto
    end
    object Label8: TLabel
      Left = 326
      Top = 160
      Width = 92
      Height = 17
      Caption = 'Pre'#231'o de Venda'
      FocusControl = edVenda
    end
    object Label29: TLabel
      Left = 5
      Top = 109
      Width = 87
      Height = 17
      Caption = 'Nome Fantasia'
      FocusControl = edFantasia
    end
    object edID: TDBText
      Left = 5
      Top = 27
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
      Left = 102
      Top = 27
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
      Left = 204
      Top = 27
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
      Left = 353
      Top = 109
      Width = 28
      Height = 17
      Caption = 'Peso'
      FocusControl = edPeso
    end
    object Label4: TLabel
      Left = 168
      Top = 158
      Width = 94
      Height = 17
      Caption = 'Pre'#231'o Vendedor'
      FocusControl = edt_preco_vendedor
    end
    object Bevel3: TBevel
      Left = 97
      Top = 24
      Width = 90
      Height = 25
    end
    object Bevel4: TBevel
      Left = 201
      Top = 24
      Width = 90
      Height = 25
    end
    object edDescricao: TDBEdit
      Left = 5
      Top = 73
      Width = 342
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
      Left = 5
      Top = 178
      Width = 104
      Height = 25
      DataField = 'PRECO_CUSTO'
      DataSource = ds
      TabOrder = 4
    end
    object edVenda: TDBEdit
      Left = 326
      Top = 178
      Width = 92
      Height = 25
      DataField = 'PRECO_VENDA'
      DataSource = ds
      TabOrder = 6
    end
    object edFantasia: TDBEdit
      Left = 5
      Top = 127
      Width = 342
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 2
    end
    object cbAtivo: TDBCheckBox
      Left = 361
      Top = 6
      Width = 57
      Height = 17
      TabStop = False
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbxUnidade: TDBComboBox
      Left = 353
      Top = 76
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
      TabOrder = 1
    end
    object edPeso: TDBEdit
      Left = 353
      Top = 127
      Width = 65
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 3
    end
    object edt_preco_vendedor: TDBEdit
      Left = 168
      Top = 178
      Width = 94
      Height = 25
      DataField = 'PRECO_VENDEDOR'
      DataSource = ds
      ImeName = 'CUSTO_BRUTO'
      TabOrder = 5
    end
    object PageControl1: TPageControl
      Left = 0
      Top = 216
      Width = 423
      Height = 103
      ActivePage = tbs_bomba
      Align = alBottom
      TabOrder = 8
      ExplicitTop = 224
      ExplicitWidth = 536
      object tbs_bomba: TTabSheet
        Caption = 'Tipo de Bomba'
        object DBEdit5: TDBEdit
          Left = 5
          Top = 13
          Width = 409
          Height = 25
          CharCase = ecUpperCase
          DataField = 'TIPO'
          DataSource = dsConcreto
          TabOrder = 0
        end
      end
      object tbs_fiscal: TTabSheet
        Caption = 'Fiscal'
        ImageIndex = 1
        object gbx_Fical: TGroupBox
          Left = 0
          Top = 0
          Width = 415
          Height = 71
          Align = alClient
          TabOrder = 0
          ExplicitTop = 30
          ExplicitWidth = 281
          ExplicitHeight = 83
          object Label20: TLabel
            Left = 7
            Top = 9
            Width = 107
            Height = 17
            Caption = 'Classifica'#231#227'o fiscal'
            FocusControl = edClassFis
          end
          object Label21: TLabel
            Left = 130
            Top = 9
            Width = 108
            Height = 17
            Caption = 'Situa'#231#227'o Tribut'#225'ria'
            FocusControl = edSitTrib
          end
          object Label22: TLabel
            Left = 244
            Top = 9
            Width = 60
            Height = 17
            Caption = 'Taxa ICMS'
            FocusControl = edTxICMS
          end
          object Label23: TLabel
            Left = 334
            Top = 9
            Width = 43
            Height = 17
            Caption = 'Taxa IPI'
            FocusControl = edTxIPI
          end
          object edClassFis: TDBEdit
            Left = 7
            Top = 32
            Width = 81
            Height = 25
            CharCase = ecUpperCase
            DataField = 'CLASS_FIS'
            DataSource = ds
            TabOrder = 0
          end
          object edSitTrib: TDBEdit
            Left = 130
            Top = 32
            Width = 83
            Height = 25
            CharCase = ecUpperCase
            DataField = 'SIT_TRIB'
            DataSource = ds
            TabOrder = 1
          end
          object edTxICMS: TDBEdit
            Left = 244
            Top = 32
            Width = 77
            Height = 25
            CharCase = ecUpperCase
            DataField = 'TX_ICMS'
            DataSource = ds
            TabOrder = 2
          end
          object edTxIPI: TDBEdit
            Left = 333
            Top = 32
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
    Top = 376
    Width = 423
    ExplicitTop = 488
    ExplicitWidth = 615
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object dsConcreto: TDataSource
    DataSet = qryBomba
    Left = 240
    Top = 121
  end
  object qryBomba: TFDQuery
    Left = 312
    Top = 161
  end
  object dsDeptos: TDataSource
    DataSet = qryDeptos
    Left = 360
    Top = 129
  end
  object qryDeptos: TFDQuery
    Left = 365
    Top = 173
  end
end
