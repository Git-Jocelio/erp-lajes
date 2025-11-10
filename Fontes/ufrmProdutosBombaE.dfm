inherited frmProdutosBombaE: TfrmProdutosBombaE
  Caption = 'frmProdutosBombaE'
  ClientHeight = 526
  ClientWidth = 619
  ExplicitWidth = 635
  ExplicitHeight = 565
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 619
    ExplicitWidth = 619
  end
  inherited pnDados: TPanel
    Width = 619
    Height = 432
    ExplicitWidth = 619
    ExplicitHeight = 432
    object Bevel1: TBevel
      Left = 5
      Top = 177
      Width = 66
      Height = 25
    end
    object Bevel2: TBevel
      Left = 5
      Top = 25
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
      Left = 193
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
      Left = 537
      Top = 55
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label7: TLabel
      Left = 9
      Top = 213
      Width = 104
      Height = 17
      Caption = 'Pre'#231'o Fornecedor'
      FocusControl = edCusto
    end
    object Label8: TLabel
      Left = 292
      Top = 213
      Width = 92
      Height = 17
      Caption = 'Pre'#231'o de Venda'
      FocusControl = edVenda
    end
    object Label19: TLabel
      Left = 6
      Top = 159
      Width = 84
      Height = 17
      Caption = 'Departamento'
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
      Left = 192
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
      Left = 574
      Top = 107
      Width = 28
      Height = 17
      Caption = 'Peso'
      FocusControl = edPeso
    end
    object Label4: TLabel
      Left = 141
      Top = 213
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
      Left = 192
      Top = 24
      Width = 90
      Height = 25
    end
    object DBText1: TDBText
      Left = 6
      Top = 180
      Width = 65
      Height = 17
      Alignment = taCenter
      DataField = 'DEPARTAMENTO_ID'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edDescricao: TDBEdit
      Left = 5
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
      Left = 9
      Top = 229
      Width = 110
      Height = 25
      DataField = 'PRECO_CUSTO'
      DataSource = ds
      TabOrder = 5
    end
    object edVenda: TDBEdit
      Left = 296
      Top = 229
      Width = 129
      Height = 25
      DataField = 'PRECO_VENDA'
      DataSource = ds
      TabOrder = 7
    end
    object edFantasia: TDBEdit
      Left = 5
      Top = 127
      Width = 527
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 2
    end
    object cbAtivo: TDBCheckBox
      Left = 297
      Top = 6
      Width = 97
      Height = 17
      TabStop = False
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbEstoqueControlado: TDBCheckBox
      Left = 296
      Top = 21
      Width = 143
      Height = 17
      TabStop = False
      Caption = 'Estoque controlado'
      DataField = 'ESTOQUE_CONTROLADO'
      DataSource = ds
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbxUnidade: TDBComboBox
      Left = 538
      Top = 72
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
    object cbxDepartamento: TDBLookupComboBox
      Left = 75
      Top = 178
      Width = 457
      Height = 25
      DataField = 'DEPARTAMENTO_ID'
      DataSource = ds
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsDeptos
      TabOrder = 4
    end
    object edPeso: TDBEdit
      Left = 538
      Top = 127
      Width = 65
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 3
    end
    object gbx_Fical: TGroupBox
      Left = 0
      Top = 274
      Width = 619
      Height = 83
      Align = alBottom
      Caption = ' Fiscal '
      TabOrder = 10
      object Label20: TLabel
        Left = 5
        Top = 22
        Width = 107
        Height = 17
        Caption = 'Classifica'#231#227'o fiscal'
        FocusControl = edClassFis
      end
      object Label21: TLabel
        Left = 171
        Top = 22
        Width = 108
        Height = 17
        Caption = 'Situa'#231#227'o Tribut'#225'ria'
        FocusControl = edSitTrib
      end
      object Label22: TLabel
        Left = 295
        Top = 22
        Width = 60
        Height = 17
        Caption = 'Taxa ICMS'
        FocusControl = edTxICMS
      end
      object Label23: TLabel
        Left = 425
        Top = 22
        Width = 43
        Height = 17
        Caption = 'Taxa IPI'
        FocusControl = edTxIPI
      end
      object edClassFis: TDBEdit
        Left = 5
        Top = 45
        Width = 81
        Height = 25
        CharCase = ecUpperCase
        DataField = 'CLASS_FIS'
        DataSource = ds
        TabOrder = 0
      end
      object edSitTrib: TDBEdit
        Left = 171
        Top = 45
        Width = 83
        Height = 25
        CharCase = ecUpperCase
        DataField = 'SIT_TRIB'
        DataSource = ds
        TabOrder = 1
      end
      object edTxICMS: TDBEdit
        Left = 295
        Top = 45
        Width = 77
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TX_ICMS'
        DataSource = ds
        TabOrder = 2
      end
      object edTxIPI: TDBEdit
        Left = 425
        Top = 45
        Width = 81
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TX_IPI'
        DataSource = ds
        TabOrder = 3
      end
    end
    object DBCheckBox1: TDBCheckBox
      Left = 448
      Top = 6
      Width = 112
      Height = 17
      TabStop = False
      Caption = 'Mat'#233'ria Prima'
      DataField = 'MATERIA_PRIMA'
      DataSource = ds
      TabOrder = 11
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 448
      Top = 21
      Width = 112
      Height = 17
      TabStop = False
      Caption = 'Agregado'
      DataField = 'AGREGADO'
      DataSource = ds
      TabOrder = 12
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object edt_preco_vendedor: TDBEdit
      Left = 141
      Top = 229
      Width = 130
      Height = 25
      DataField = 'PRECO_VENDEDOR'
      DataSource = ds
      ImeName = 'CUSTO_BRUTO'
      TabOrder = 6
    end
    object cbRevenda: TDBCheckBox
      Left = 297
      Top = 36
      Width = 143
      Height = 17
      TabStop = False
      Caption = 'Material de revenda'
      DataField = 'REVENDA'
      DataSource = ds
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object gbx_tipo_bomba: TGroupBox
      Left = 0
      Top = 357
      Width = 619
      Height = 75
      Align = alBottom
      Caption = 'Descri'#231#227'o da Bomba'
      TabOrder = 14
      object Label12: TLabel
        Left = 12
        Top = 20
        Width = 90
        Height = 17
        Caption = 'Tipo de Bomba'
        FocusControl = DBEdit5
      end
      object DBEdit5: TDBEdit
        Left = 12
        Top = 37
        Width = 494
        Height = 25
        CharCase = ecUpperCase
        DataField = 'TIPO'
        DataSource = dsConcreto
        TabOrder = 0
      end
    end
  end
  inherited pnRodape: TPanel
    Top = 489
    Width = 619
    ExplicitTop = 489
    ExplicitWidth = 619
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object dsConcreto: TDataSource
    DataSet = qryBomba
    Left = 576
    Top = 49
  end
  object qryBomba: TFDQuery
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
