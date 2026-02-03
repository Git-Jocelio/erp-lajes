inherited frmProdutosE: TfrmProdutosE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmProdutosE'
  ClientHeight = 480
  ClientWidth = 574
  ExplicitWidth = 580
  ExplicitHeight = 486
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 574
    Height = 49
    ExplicitWidth = 574
    ExplicitHeight = 49
    inherited lbl_titulo: TLabel
      Width = 574
      Height = 32
    end
    inherited lbl_sub_titulo: TLabel
      Top = 32
      Width = 574
      ExplicitTop = 32
    end
  end
  inherited pnDados: TPanel
    Top = 49
    Width = 574
    Height = 159
    ExplicitTop = 49
    ExplicitWidth = 574
    ExplicitHeight = 159
    object Bevel2: TBevel
      Left = 5
      Top = 25
      Width = 60
      Height = 25
    end
    object Label1: TLabel
      Left = 5
      Top = 6
      Width = 12
      Height = 17
      Caption = 'ID'
    end
    object Label2: TLabel
      Left = 74
      Top = 6
      Width = 53
      Height = 17
      Caption = 'Cadastro'
    end
    object Label3: TLabel
      Left = 169
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
      Left = 431
      Top = 56
      Width = 65
      Height = 17
      Caption = 'Un Medida'
    end
    object Label19: TLabel
      Left = 352
      Top = 109
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
      Width = 49
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
      Left = 79
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
      Left = 174
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
      Left = 518
      Top = 56
      Width = 28
      Height = 17
      Caption = 'Peso'
      FocusControl = edPeso
    end
    object Bevel3: TBevel
      Left = 74
      Top = 24
      Width = 90
      Height = 25
    end
    object Bevel4: TBevel
      Left = 170
      Top = 24
      Width = 90
      Height = 25
    end
    object edDescricao: TDBEdit
      Left = 5
      Top = 73
      Width = 419
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
      Left = 5
      Top = 127
      Width = 341
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 2
    end
    object cbAtivo: TDBCheckBox
      Left = 281
      Top = 10
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
    end
    object cbEstoqueControlado: TDBCheckBox
      Left = 281
      Top = 31
      Width = 143
      Height = 17
      Cursor = crHandPoint
      Caption = 'Estoque controlado'
      DataField = 'ESTOQUE_CONTROLADO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
    end
    object cbxUnidade: TDBComboBox
      Left = 430
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
      TabOrder = 1
    end
    object cbxDepartamento: TDBLookupComboBox
      Left = 352
      Top = 127
      Width = 215
      Height = 25
      DataField = 'DEPARTAMENTO_ID'
      DataSource = ds
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsDeptos
      TabOrder = 4
    end
    object edPeso: TDBEdit
      Left = 502
      Top = 73
      Width = 65
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      TabOrder = 3
    end
    object DBCheckBox1: TDBCheckBox
      Left = 352
      Top = 8
      Width = 94
      Height = 17
      Cursor = crHandPoint
      Caption = 'Mat'#233'ria Prima'
      DataField = 'MATERIA_PRIMA'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
    end
    object DBCheckBox2: TDBCheckBox
      Left = 460
      Top = 6
      Width = 77
      Height = 17
      Cursor = crHandPoint
      Caption = 'Agregado'
      DataField = 'AGREGADO'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
    end
    object cbRevenda: TDBCheckBox
      Left = 416
      Top = 29
      Width = 131
      Height = 17
      Cursor = crHandPoint
      Caption = 'Material de revenda'
      DataField = 'REVENDA'
      DataSource = ds
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      Visible = False
    end
  end
  inherited pnRodape: TPanel
    Top = 443
    Width = 574
    ExplicitTop = 443
    ExplicitWidth = 574
    inherited pnl_botoes: TPanel
      Width = 280
      ExplicitWidth = 280
      inherited btnOk: TBitBtn
        Width = 170
        OnClick = btnOkClick
        ExplicitWidth = 170
      end
      inherited btnFechar: TBitBtn
        Left = 170
        Width = 110
        ExplicitLeft = 170
        ExplicitWidth = 110
      end
    end
  end
  object pc_precos: TPageControl [3]
    Left = 0
    Top = 208
    Width = 574
    Height = 235
    ActivePage = tbs_precos
    Align = alBottom
    TabOrder = 3
    object tbs_precos: TTabSheet
      Caption = 'Pre'#231'os'
      object gb_formas_pagto: TGroupBox
        Left = 0
        Top = 0
        Width = 566
        Height = 203
        Align = alClient
        TabOrder = 0
        object btn_incluir: TSpeedButton
          Left = 7
          Top = 5
          Width = 256
          Height = 29
          Cursor = crHandPoint
          Margins.Left = 10
          Align = alCustom
          Caption = 'Incluir pre'#231'o e condi'#231#227'o de pagamento'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Glyph.Data = {
            16080000424D160800000000000036000000280000001B000000180000000100
            180000000000E0070000C30E0000C30E00000000000000000000BFBFBFBFBFBF
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7FBFBFBF000000BFBFBF7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F
            7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7F7FBFBFBF00
            0000BFBFBF000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00
            FFFFFFFFFF00FFFF00000000000000000000FFFFFFFFFF00FFFFFFFFFF00FFFF
            FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007F7F
            7F7F7F7FBFBFBF000000BFBFBF00000000FFFFFFFFFF00FFFF00000000000000
            FF0000000000000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
            00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7FBFBFBF000000BFBF
            BF000000FFFFFF00FFFF00000000000000000000FF0000000000000000000000
            FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
            FFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF00000000FFFF0000000000
            0000000000FF0000FF0000FF0000000000000000000000FFFFFFFFFF00FFFFFF
            FFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7F
            BFBFBF000000BFBFBF000000FFFFFF00000000000000FF0000FF0000FF0000FF
            0000FF00000000000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
            FFFFFFFFFF00FFFFFFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000
            00FFFF00000000FF0000FF0000000000FF0000000000FF0000FF0000000000FF
            FFFFFFFF00FFFF00007F00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF00
            00007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00000000FF0000FF00
            00000000FF0000000000FF0000FF00000000FFFFFF00007F00007F0000FF0000
            FF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007F7F7F7F7F7FBFBFBF00
            0000BFBFBF00000000FFFF00000000000000000000000000FF0000FF0000FF00
            00FF0000000000007F0000FF0000FF0000FF0000FFFFFFFF00FFFFFFFFFF00FF
            FFFFFFFF00FFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00
            FFFF00000000000000FF0000FF0000FF0000FF0000007F00007F0000FF0000FF
            0000FF0000FF0000FF0000FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF0000007F7F
            7F7F7F7FBFBFBF000000BFBFBF00000000FFFF00000000000000FF0000FF0000
            FF0000007F00007F0000FF0000FF0000FF0000FF0000FFFFFFFF0000FF0000FF
            00FFFFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7FBFBFBF000000BFBF
            BF000000FFFFFF00000000FF0000FF0000FF0000FF000000000000FF0000FF00
            00FF0000FF0000FFFFFFFF00FFFFFFFFFF0000FF0000FF00FFFFFFFFFF00FFFF
            FFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF00000000FFFF00000000FF
            0000FF0000000000FF000000000000000000000000FF0000FFFFFFFF00FFFFFF
            FFFF00FFFF0000FF0000FFFFFFFF00FFFFFFFFFF00FFFF0000007F7F7F7F7F7F
            BFBFBF000000BFBFBF000000FFFFFF00000000FF0000FF0000000000FF000000
            0000FF0000FF00000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF00
            00FFFFFFFF00FFFFFFFFFF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000
            00FFFF00000000000000FF0000FF0000FF0000FF0000FF0000000000000000FF
            FFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF0000FFFFFFFF00FFFF00
            00007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00FFFF000000000000
            00FF0000FF0000FF0000000000000000FFFFFFFFFF00FFFFFFFFFF00FFFFFFFF
            FF00FFFFFFFFFF00FFFF0000FF0000FFFFFFFF0000007F7F7F7F7F7FBFBFBF00
            0000BFBFBF00000000FFFFFFFFFF00FFFF00000000000000FF00000000000000
            00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FF
            FF0000FF0000FF0000007F7F7F7F7F7FBFBFBF000000BFBFBF000000FFFFFF00
            FFFFFFFFFF00FFFF00000000FF0000000000FFFFFFFFFF00FFFFFFFFFF00FFFF
            FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF0000FF7F7F
            7F7F7F7FBFBFBF000000BFBFBF00000000FFFFFFFFFF00FFFFFFFFFF00000000
            0000000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF
            00FFFFFFFFFF00FFFFFFFFFF00FFFF0000FF0000FF7F7F7FBFBFBF000000BFBF
            BF000000FFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00
            FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFFFFFFFF00FFFF
            FFFFFF0000007F7F7F0000FFBFBFBF000000BFBFBF0000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000BFBFBFBFBFBF
            BFBFBF000000BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF
            BFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBFBF000000}
          ParentFont = False
          OnClick = btn_incluirClick
        end
        object dbg_condicoes_pagto: TDBGrid
          Left = 2
          Top = 39
          Width = 562
          Height = 162
          Hint = 'Duplo click para alterar uma forma de pagamento j'#225' cadastrada'
          Align = alBottom
          Color = clYellow
          DataSource = ds_lista_precos
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -13
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          OnDrawColumnCell = dbg_condicoes_pagtoDrawColumnCell
          OnDblClick = dbg_condicoes_pagtoDblClick
          OnMouseUp = dbg_condicoes_pagtoMouseUp
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRODUTO_ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FORMA_PAGTO_ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMA_PAGTO_DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'Forma de Pagamento'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 159
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRECO_CUSTO'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Custo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDEDOR'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Vendedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECO_VENDA'
              Title.Alignment = taCenter
              Title.Caption = 'Pre'#231'o Venda'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TAXA_PARCELAMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Taxa(%)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 70
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ATIVO'
              Title.Alignment = taCenter
              Title.Caption = 'Ativo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 40
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = 'A'#231#245'es'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 45
              Visible = True
            end>
        end
      end
    end
    object tbs_fiscal: TTabSheet
      Caption = 'Fiscal'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 566
        Height = 203
        Align = alClient
        Caption = ' Fiscal '
        TabOrder = 0
        object Label20: TLabel
          Left = 5
          Top = 22
          Width = 107
          Height = 17
          Caption = 'Classifica'#231#227'o fiscal'
          FocusControl = edClassFis
        end
        object Label21: TLabel
          Left = 146
          Top = 22
          Width = 108
          Height = 17
          Caption = 'Situa'#231#227'o Tribut'#225'ria'
          FocusControl = edSitTrib
        end
        object Label22: TLabel
          Left = 278
          Top = 22
          Width = 60
          Height = 17
          Caption = 'Taxa ICMS'
          FocusControl = edTxICMS
        end
        object Label23: TLabel
          Left = 380
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
          Left = 146
          Top = 45
          Width = 83
          Height = 25
          CharCase = ecUpperCase
          DataField = 'SIT_TRIB'
          DataSource = ds
          TabOrder = 1
        end
        object edTxICMS: TDBEdit
          Left = 278
          Top = 45
          Width = 77
          Height = 25
          CharCase = ecUpperCase
          DataField = 'TX_ICMS'
          DataSource = ds
          TabOrder = 2
        end
        object edTxIPI: TDBEdit
          Left = 380
          Top = 45
          Width = 81
          Height = 25
          CharCase = ecUpperCase
          DataField = 'TX_IPI'
          DataSource = ds
          TabOrder = 3
        end
      end
    end
    object tbs_estoques: TTabSheet
      Caption = 'Estoques'
      ImageIndex = 2
      object gbx_estoques: TGroupBox
        Left = 0
        Top = 0
        Width = 566
        Height = 203
        Align = alClient
        Caption = ' Estoques '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object Label14: TLabel
          Left = 238
          Top = 20
          Width = 55
          Height = 15
          Caption = 'Disponivel'
          FocusControl = edEstDisponivel
        end
        object Label18: TLabel
          Left = 363
          Top = 76
          Width = 90
          Height = 15
          Caption = 'Tempo reposi'#231#227'o'
          FocusControl = edTempoReposicao
        end
        object Label16: TLabel
          Left = 509
          Top = 20
          Width = 85
          Height = 15
          Caption = 'Estoque Liquido'
          FocusControl = edEstLiquido
        end
        object Label15: TLabel
          Left = 364
          Top = 20
          Width = 106
          Height = 15
          Caption = 'Pedido Aguardando'
          FocusControl = edPedAguardando
        end
        object Label13: TLabel
          Left = 114
          Top = 20
          Width = 76
          Height = 15
          Caption = 'Pedido Aberto'
          FocusControl = edPedAberto
        end
        object Label12: TLabel
          Left = 5
          Top = 20
          Width = 30
          Height = 15
          Caption = 'Fisico'
          FocusControl = edEstFisico
        end
        object Label11: TLabel
          Left = 5
          Top = 76
          Width = 88
          Height = 15
          Caption = 'Ponto de pedido'
          FocusControl = edPontoPedido
        end
        object Label10: TLabel
          Left = 238
          Top = 76
          Width = 72
          Height = 15
          Caption = 'Qtde M'#225'xima'
          FocusControl = edQtdeMax
        end
        object Label9: TLabel
          Left = 120
          Top = 76
          Width = 70
          Height = 15
          Caption = 'Qtde Minima'
          FocusControl = edQtdeMin
        end
        object edTempoReposicao: TDBEdit
          Left = 364
          Top = 93
          Width = 81
          Height = 23
          DataField = 'TEMPO_REPOSICAO'
          DataSource = ds
          TabOrder = 8
        end
        object edEstLiquido: TDBEdit
          Left = 509
          Top = 38
          Width = 97
          Height = 23
          DataField = 'ESTOQUE_LIQUIDO'
          DataSource = ds
          Enabled = False
          TabOrder = 4
        end
        object edPedAguardando: TDBEdit
          Left = 364
          Top = 38
          Width = 117
          Height = 23
          DataField = 'PEDIDO_AGUARDANDO'
          DataSource = ds
          Enabled = False
          TabOrder = 3
        end
        object edEstDisponivel: TDBEdit
          Left = 237
          Top = 38
          Width = 107
          Height = 23
          DataField = 'ESTOQUE_DISPONIVEL'
          DataSource = ds
          Enabled = False
          TabOrder = 2
        end
        object edPedAberto: TDBEdit
          Left = 114
          Top = 38
          Width = 102
          Height = 23
          DataField = 'PEDIDO_ABERTO'
          DataSource = ds
          Enabled = False
          TabOrder = 1
        end
        object edEstFisico: TDBEdit
          Left = 3
          Top = 38
          Width = 85
          Height = 23
          DataField = 'ESTOQUE_FISICO'
          DataSource = ds
          Enabled = False
          TabOrder = 0
        end
        object edPontoPedido: TDBEdit
          Left = 3
          Top = 93
          Width = 85
          Height = 23
          DataField = 'PONTO_PEDIDO'
          DataSource = ds
          TabOrder = 5
        end
        object edQtdeMax: TDBEdit
          Left = 238
          Top = 93
          Width = 106
          Height = 23
          DataField = 'QTDE_MAX'
          DataSource = ds
          TabOrder = 7
        end
        object edQtdeMin: TDBEdit
          Left = 114
          Top = 93
          Width = 102
          Height = 23
          DataField = 'QTDE_MIN'
          DataSource = ds
          TabOrder = 6
        end
      end
    end
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select * from produtos')
    Left = 232
    Top = 136
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Required = True
      Size = 1
    end
    object qryDATA_CAD: TDateField
      FieldName = 'DATA_CAD'
      Origin = 'DATA_CAD'
    end
    object qryDATA_ALT: TDateField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object qryDEPARTAMENTO_ID: TIntegerField
      FieldName = 'DEPARTAMENTO_ID'
      Origin = 'DEPARTAMENTO_ID'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Required = True
      Size = 100
    end
    object qryNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 100
    end
    object qryUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Origin = 'UNIDADE'
      Required = True
      Size = 2
    end
    object qryPRECO_CUSTO: TCurrencyField
      FieldName = 'PRECO_CUSTO'
      Origin = 'PRECO_CUSTO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPERCA: TCurrencyField
      FieldName = 'PERCA'
      Origin = 'PERCA'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryCUSTO_LIQUIDO: TCurrencyField
      FieldName = 'CUSTO_LIQUIDO'
      Origin = 'CUSTO_LIQUIDO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPRECO_VENDEDOR: TCurrencyField
      FieldName = 'PRECO_VENDEDOR'
      Origin = 'PRECO_VENDEDOR'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPRECO_VENDA: TCurrencyField
      FieldName = 'PRECO_VENDA'
      Origin = 'PRECO_VENDA'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryESTOQUE_CONTROLADO: TStringField
      FieldName = 'ESTOQUE_CONTROLADO'
      Origin = 'ESTOQUE_CONTROLADO'
      Size = 1
    end
    object qryTEMPO_REPOSICAO: TSmallintField
      FieldName = 'TEMPO_REPOSICAO'
      Origin = 'TEMPO_REPOSICAO'
    end
    object qryQTDE_MIN: TCurrencyField
      FieldName = 'QTDE_MIN'
      Origin = 'QTDE_MIN'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryQTDE_MAX: TCurrencyField
      FieldName = 'QTDE_MAX'
      Origin = 'QTDE_MAX'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPONTO_PEDIDO: TCurrencyField
      FieldName = 'PONTO_PEDIDO'
      Origin = 'PONTO_PEDIDO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryESTOQUE_FISICO: TCurrencyField
      FieldName = 'ESTOQUE_FISICO'
      Origin = 'ESTOQUE_FISICO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPEDIDO_ABERTO: TCurrencyField
      FieldName = 'PEDIDO_ABERTO'
      Origin = 'PEDIDO_ABERTO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryESTOQUE_DISPONIVEL: TCurrencyField
      FieldName = 'ESTOQUE_DISPONIVEL'
      Origin = 'ESTOQUE_DISPONIVEL'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryPEDIDO_AGUARDANDO: TCurrencyField
      FieldName = 'PEDIDO_AGUARDANDO'
      Origin = 'PEDIDO_AGUARDANDO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryESTOQUE_LIQUIDO: TCurrencyField
      FieldName = 'ESTOQUE_LIQUIDO'
      Origin = 'ESTOQUE_LIQUIDO'
      DisplayFormat = '0.00'
      currency = False
    end
    object qryCLASS_FIS: TStringField
      FieldName = 'CLASS_FIS'
      Origin = 'CLASS_FIS'
      Size = 2
    end
    object qrySIT_TRIB: TStringField
      FieldName = 'SIT_TRIB'
      Origin = 'SIT_TRIB'
      Size = 2
    end
    object qryTX_IPI: TCurrencyField
      FieldName = 'TX_IPI'
      Origin = 'TX_IPI'
    end
    object qryPESO: TCurrencyField
      FieldName = 'PESO'
      Origin = 'PESO'
      currency = False
    end
    object qryTX_ICMS: TCurrencyField
      FieldName = 'TX_ICMS'
      Origin = 'TX_ICMS'
    end
    object qryREVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'REVENDA'
      Size = 1
    end
    object qryMATERIA_PRIMA: TStringField
      FieldName = 'MATERIA_PRIMA'
      Origin = 'MATERIA_PRIMA'
      Size = 1
    end
    object qryAGREGADO: TStringField
      FieldName = 'AGREGADO'
      Origin = 'AGREGADO'
      Size = 1
    end
    object qryLAJE: TStringField
      FieldName = 'LAJE'
      Origin = 'LAJE'
      Size = 1
    end
    object qryVIGA: TStringField
      FieldName = 'VIGA'
      Origin = 'VIGA'
      Size = 1
    end
    object qryLAJOTA: TStringField
      FieldName = 'LAJOTA'
      Origin = 'LAJOTA'
      Size = 1
    end
    object qryISOPOR: TStringField
      FieldName = 'ISOPOR'
      Origin = 'ISOPOR'
      Size = 1
    end
    object qryCONCRETO: TStringField
      FieldName = 'CONCRETO'
      Origin = 'CONCRETO'
      Size = 1
    end
    object qryBOMBA: TStringField
      FieldName = 'BOMBA'
      Origin = 'BOMBA'
      Size = 1
    end
    object qryVERGALHAO: TStringField
      FieldName = 'VERGALHAO'
      Origin = 'VERGALHAO'
      Size = 1
    end
    object qryTRELICA: TStringField
      FieldName = 'TRELICA'
      Origin = 'TRELICA'
      Size = 1
    end
    object qryNEGATIVO_DE_LAJE: TStringField
      FieldName = 'NEGATIVO_DE_LAJE'
      Origin = 'NEGATIVO_DE_LAJE'
      Size = 1
    end
    object qryREFORCO_DE_VIGA: TStringField
      FieldName = 'REFORCO_DE_VIGA'
      Origin = 'REFORCO_DE_VIGA'
      Size = 1
    end
  end
  inherited ds: TDataSource
    Left = 232
    Top = 105
  end
  object qryDeptos: TFDQuery
    Left = 261
    Top = 133
  end
  object dsDeptos: TDataSource
    DataSet = qryDeptos
    Left = 264
    Top = 105
  end
  object ds_lista_precos: TDataSource
    AutoEdit = False
    DataSet = mt_lista_precos
    OnDataChange = ds_lista_precosDataChange
    Left = 308
    Top = 329
  end
  object ds_precos_deletados: TDataSource
    AutoEdit = False
    DataSet = mt_precos_deletados
    Left = 440
    Top = 369
  end
  object mt_lista_precos: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end
      item
        Name = 'PRODUTO_ID'
        DataType = ftInteger
      end
      item
        Name = 'FORMA_PAGTO_ID'
        DataType = ftInteger
      end
      item
        Name = 'FORMA_PAGTO_DESCRICAO'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PRECO_CUSTO'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_VENDEDOR'
        DataType = ftFloat
      end
      item
        Name = 'PRECO_VENDA'
        DataType = ftFloat
      end
      item
        Name = 'TAXA_PARCELAMENTO'
        DataType = ftFloat
      end
      item
        Name = 'ATIVO'
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 308
    Top = 357
    object mt_lista_precosID: TIntegerField
      FieldName = 'ID'
    end
    object mt_lista_precosPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object mt_lista_precosFORMA_PAGTO_ID: TIntegerField
      FieldName = 'FORMA_PAGTO_ID'
    end
    object mt_lista_precosFORMA_PAGTO_DESCRICAO: TStringField
      FieldName = 'FORMA_PAGTO_DESCRICAO'
    end
    object mt_lista_precosPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
      DisplayFormat = '0.00'
    end
    object mt_lista_precosPRECO_VENDEDOR: TFloatField
      FieldName = 'PRECO_VENDEDOR'
      currency = True
    end
    object mt_lista_precosPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
      currency = True
    end
    object mt_lista_precosTAXA_PARCELAMENTO: TFloatField
      FieldName = 'TAXA_PARCELAMENTO'
    end
    object mt_lista_precosATIVO: TStringField
      FieldName = 'ATIVO'
      Size = 1
    end
  end
  object mt_precos_deletados: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'ID'
        DataType = ftInteger
      end>
    IndexDefs = <>
    AggregatesActive = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 440
    Top = 397
    object mt_precos_deletadosID: TIntegerField
      FieldName = 'ID'
    end
  end
  object ImageList1: TImageList
    Left = 488
    Top = 209
    Bitmap = {
      494C010101000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFEFEFEFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF0D0D0DFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFEFEFEFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF121212FF1212
      12FF121212FF121212FF121212FF121212FF121212FF121212FF121212FF1212
      12FF121212FF121212FF0C0C0CFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF0E0E0EFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFEFEFEFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF121212FF1313
      13FF131313FF131313FF131313FF131313FF131313FF131313FF131313FF1313
      13FF131313FF131313FF0C0C0CFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFF0F0F0FFF000000FF0000
      00FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF0000
      00FF000000FF000000FF000000FFEFEFEFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF111111FF1212
      12FF121212FF121212FF121212FF121212FF121212FF121212FF121212FF1212
      12FF121212FF121212FF0D0D0DFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object PopupMenu1: TPopupMenu
    Left = 412
    Top = 368
    object mn_alterar: TMenuItem
      Caption = 'Alterar forma de pagamento'
      OnClick = mn_alterarClick
    end
    object mn_excluir: TMenuItem
      Caption = 'Excluir forma de pagamento'
      OnClick = mn_excluirClick
    end
  end
end
