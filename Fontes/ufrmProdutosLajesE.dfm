inherited frmProdutosLajesE: TfrmProdutosLajesE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmProdutosLajesE'
  ClientHeight = 587
  ClientWidth = 645
  ExplicitTop = -29
  ExplicitWidth = 651
  ExplicitHeight = 593
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 645
    Height = 65
    ExplicitWidth = 645
    ExplicitHeight = 65
    inherited lbl_titulo: TLabel
      Width = 645
      Height = 48
    end
    inherited lbl_sub_titulo: TLabel
      Top = 48
      Width = 645
      ExplicitTop = 48
    end
  end
  inherited pnDados: TPanel
    Top = 65
    Width = 645
    Height = 240
    Align = alTop
    ExplicitTop = 65
    ExplicitWidth = 645
    ExplicitHeight = 240
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
      Top = 49
      Width = 57
      Height = 17
      Caption = 'Descri'#231#227'o'
      FocusControl = edDescricao
    end
    object Label6: TLabel
      Left = 572
      Top = 49
      Width = 49
      Height = 17
      Caption = 'Unidade'
    end
    object Label19: TLabel
      Left = 361
      Top = 100
      Width = 84
      Height = 17
      Caption = 'Departamento'
    end
    object Label29: TLabel
      Left = 10
      Top = 100
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
      Left = 114
      Top = 33
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
    object edDescricao: TDBEdit
      Left = 10
      Top = 66
      Width = 556
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
      Top = 118
      Width = 345
      Height = 25
      CharCase = ecUpperCase
      DataField = 'NOME_FANTASIA'
      DataSource = ds
      TabOrder = 1
    end
    object cbAtivo: TDBCheckBox
      Left = 378
      Top = 22
      Width = 97
      Height = 17
      Cursor = crHandPoint
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      TabOrder = 2
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbEstoqueControlado: TDBCheckBox
      Left = 510
      Top = 22
      Width = 127
      Height = 17
      Cursor = crHandPoint
      Caption = 'Controlar estoque'
      DataField = 'ESTOQUE_CONTROLADO'
      DataSource = ds
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object cbxUnidade: TDBComboBox
      Left = 572
      Top = 66
      Width = 65
      Height = 25
      Cursor = crHandPoint
      DataField = 'UNIDADE'
      DataSource = ds
      Items.Strings = (
        'M2'
        '')
      TabOrder = 4
    end
    object cbxDepartamentos: TDBLookupComboBox
      Left = 361
      Top = 118
      Width = 277
      Height = 25
      DataField = 'DEPARTAMENTO_ID'
      DataSource = ds
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsDeptos
      TabOrder = 5
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 148
      Width = 645
      Height = 92
      Align = alBottom
      Caption = ' Dimens'#245'es em milimetros'
      TabOrder = 6
      object Label12: TLabel
        Left = 12
        Top = 26
        Width = 32
        Height = 15
        Caption = 'Altura'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label10: TLabel
        Left = 129
        Top = 26
        Width = 111
        Height = 15
        Caption = 'Sobre Carga(Kgs/M'#178')'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label28: TLabel
        Left = 259
        Top = 26
        Width = 56
        Height = 15
        Caption = ' Peso (M2)'
        FocusControl = edPeso
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object rgEnchimento: TRadioGroup
        Left = 363
        Top = 19
        Width = 140
        Height = 71
        Cursor = crHandPoint
        Align = alRight
        Caption = ' Enchimento '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'Lajota'
          'Isopor'
          'Mista')
        ParentFont = False
        TabOrder = 0
        OnClick = rgEnchimentoClick
      end
      object edCarga: TDBEdit
        Left = 128
        Top = 44
        Width = 81
        Height = 23
        CharCase = ecUpperCase
        DataField = 'CARGA'
        DataSource = dsLajes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object rgForma: TDBRadioGroup
        Left = 503
        Top = 19
        Width = 140
        Height = 71
        Cursor = crHandPoint
        Align = alRight
        Caption = 'Tipo de forma '
        DataField = 'FORMA'
        DataSource = dsLajes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          '130 mm'
          '250 mm'
          'TRELIFACIL')
        ParentFont = False
        TabOrder = 2
        Values.Strings = (
          '130'
          '250'
          '120')
        OnClick = rgFormaClick
      end
      object edAltura: TDBComboBox
        Left = 12
        Top = 44
        Width = 88
        Height = 23
        Style = csDropDownList
        DataField = 'ALTURA'
        DataSource = dsLajes
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          '80'
          '120'
          '160'
          '200'
          '250'
          '300')
        ParentFont = False
        TabOrder = 3
      end
      object edPeso: TDBEdit
        Left = 259
        Top = 44
        Width = 83
        Height = 23
        DataField = 'PESO'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
    end
  end
  inherited pnRodape: TPanel
    Top = 550
    Width = 645
    ExplicitTop = 550
    ExplicitWidth = 645
    inherited pnl_botoes: TPanel
      Width = 280
      ExplicitWidth = 280
      inherited btnOk: TBitBtn
        Width = 170
        Cursor = crHandPoint
        OnClick = btnOkClick
        ExplicitWidth = 170
      end
      inherited btnFechar: TBitBtn
        Left = 170
        Width = 110
        Cursor = crHandPoint
        ExplicitLeft = 169
        ExplicitWidth = 110
      end
    end
  end
  object pc_precos: TPageControl [3]
    Left = 0
    Top = 305
    Width = 645
    Height = 245
    ActivePage = tbs_precos
    Align = alClient
    TabOrder = 3
    object tbs_precos: TTabSheet
      Caption = 'Pre'#231'os'
      object Label7: TLabel
        Left = 8
        Top = 3
        Width = 92
        Height = 15
        Caption = 'Custo Mat. Prima'
        FocusControl = edCusto
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label13: TLabel
        Left = 220
        Top = 3
        Width = 114
        Height = 15
        Caption = 'Mat. Prima com M.O.'
        FocusControl = edt_custo_liquido
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 117
        Top = 3
        Width = 80
        Height = 17
        Caption = 'M'#227'o-de-obra'
      end
      object edCusto: TDBEdit
        Left = 8
        Top = 22
        Width = 88
        Height = 23
        Hint = 'calcula o custo da laje automaticamente'
        Color = clGradientInactiveCaption
        DataField = 'PRECO_CUSTO'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
        OnEnter = edCustoEnter
      end
      object gb_formas_pagto: TGroupBox
        Left = 0
        Top = 45
        Width = 637
        Height = 168
        Align = alBottom
        TabOrder = 1
        object btn_incluir: TSpeedButton
          Left = -4
          Top = 7
          Width = 256
          Height = 26
          Cursor = crHandPoint
          Margins.Left = 10
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
          Width = 633
          Height = 127
          Cursor = crHandPoint
          Hint = 'Duplo click para alterar uma forma de pagamento j'#225' cadastrada'
          Align = alBottom
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
              Width = 24
              Visible = True
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
              Title.Caption = 'Forma de Pagamento'
              Width = 159
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
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ATIVO'
              Title.Caption = 'Ativo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              Title.Alignment = taCenter
              Title.Caption = 'A'#231#245'es'
              Visible = True
            end>
        end
      end
      object edt_custo_liquido: TDBEdit
        Left = 220
        Top = 22
        Width = 83
        Height = 23
        Hint = 'calcula o custo da laje automaticamente'
        Color = clGradientInactiveCaption
        DataField = 'CUSTO_LIQUIDO'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
        OnEnter = edCustoEnter
      end
      object edt_mao_obra: TEdit
        Left = 117
        Top = 21
        Width = 81
        Height = 25
        Color = clGradientInactiveCaption
        ReadOnly = True
        TabOrder = 3
        Text = 'edt_mao_obra'
      end
    end
    object tbs_fiscal: TTabSheet
      Caption = 'Fiscal'
      ImageIndex = 1
      object GroupBox2: TGroupBox
        Left = 0
        Top = 0
        Width = 637
        Height = 213
        Align = alClient
        TabOrder = 0
        object Label20: TLabel
          Left = 12
          Top = 9
          Width = 107
          Height = 17
          Caption = 'Classifica'#231#227'o fiscal'
          FocusControl = edClassFis
        end
        object Label21: TLabel
          Left = 132
          Top = 9
          Width = 108
          Height = 17
          Caption = 'Situa'#231#227'o Tribut'#225'ria'
          FocusControl = edSitTrib
        end
        object Label22: TLabel
          Left = 264
          Top = 9
          Width = 60
          Height = 17
          Caption = 'Taxa ICMS'
          FocusControl = edTxICMS
        end
        object Label23: TLabel
          Left = 362
          Top = 9
          Width = 43
          Height = 17
          Caption = 'Taxa IPI'
          FocusControl = edTxIPI
        end
        object edClassFis: TDBEdit
          Left = 12
          Top = 29
          Width = 81
          Height = 25
          CharCase = ecUpperCase
          DataField = 'CLASS_FIS'
          DataSource = ds
          TabOrder = 0
        end
        object edSitTrib: TDBEdit
          Left = 132
          Top = 29
          Width = 83
          Height = 25
          CharCase = ecUpperCase
          DataField = 'SIT_TRIB'
          DataSource = ds
          TabOrder = 1
        end
        object edTxICMS: TDBEdit
          Left = 264
          Top = 29
          Width = 77
          Height = 25
          CharCase = ecUpperCase
          DataField = 'TX_ICMS'
          DataSource = ds
          TabOrder = 2
        end
        object edTxIPI: TDBEdit
          Left = 355
          Top = 29
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
  inherited qry: TFDQuery
    Left = 360
    Top = 53
  end
  inherited ds: TDataSource
    Left = 360
    Top = 25
  end
  object dsLajes: TDataSource
    DataSet = qryLajes
    Left = 388
    Top = 25
  end
  object qryLajes: TFDQuery
    Left = 388
    Top = 53
  end
  object dsDeptos: TDataSource
    DataSet = qryDeptos
    Left = 416
    Top = 25
  end
  object qryDeptos: TFDQuery
    Left = 416
    Top = 53
  end
  object ds_lista_precos: TDataSource
    AutoEdit = False
    DataSet = mt_lista_precos
    OnDataChange = ds_lista_precosDataChange
    Left = 444
    Top = 25
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
    Left = 444
    Top = 53
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
  object ds_precos_deletados: TDataSource
    AutoEdit = False
    DataSet = mt_precos_deletados
    Left = 472
    Top = 25
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
    Left = 472
    Top = 53
    object mt_precos_deletadosID: TIntegerField
      FieldName = 'ID'
    end
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
  object ImageList1: TImageList
    Left = 548
    Top = 474
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
end
