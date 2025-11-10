inherited frmPesquisaProdutos: TfrmPesquisaProdutos
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'Pesquisa de Produtos '
  ClientHeight = 552
  ClientWidth = 1044
  OnActivate = FormActivate
  OnShow = FormShow
  ExplicitWidth = 1050
  ExplicitHeight = 558
  TextHeight = 15
  object pnRodape: TPanel [0]
    Left = 0
    Top = 434
    Width = 1044
    Height = 66
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 440
    ExplicitWidth = 1058
    object gbQtde: TGroupBox
      Left = 0
      Top = 0
      Width = 145
      Height = 66
      Align = alLeft
      Caption = ' Quantidade '
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 0
      object edt_unidade: TDBText
        Left = 80
        Top = 29
        Width = 55
        Height = 23
        DataField = 'UNIDADE'
        DataSource = ds
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object bv_unidade: TBevel
        Left = 75
        Top = 25
        Width = 66
        Height = 33
      end
      object edQtde: TEdit
        Left = 4
        Top = 25
        Width = 67
        Height = 33
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        MaxLength = 6
        NumbersOnly = True
        ParentFont = False
        TabOrder = 0
        Text = '1'
        OnEnter = edQtdeEnter
        OnExit = edQtdeExit
        OnKeyPress = edQtdeKeyPress
      end
    end
    object gbPrecoVenda: TGroupBox
      Left = 338
      Top = 0
      Width = 98
      Height = 66
      Align = alLeft
      Caption = ' Pr Venda '
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 1
      object edVenda: TEdit
        Left = 7
        Top = 25
        Width = 80
        Height = 33
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        OnEnter = edQtdeEnter
        OnExit = edt_preco_vendedorExit
        OnKeyPress = edQtdeKeyPress
      end
    end
    object gbItemPedido: TGroupBox
      Left = 436
      Top = 0
      Width = 608
      Height = 66
      Align = alClient
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 2
      ExplicitWidth = 622
      object lbNivel: TLabel
        Left = 58
        Top = 0
        Width = 105
        Height = 15
        Caption = 'Nivel / Observa'#231#245'es'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbLocal: TLabel
        Left = 379
        Top = 0
        Width = 28
        Height = 15
        Caption = 'Local'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbSituacao: TLabel
        Left = 440
        Top = 0
        Width = 46
        Height = 15
        Caption = 'Situa'#231#227'o'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 3
        Top = 0
        Width = 25
        Height = 15
        Caption = 'Item'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object cbxLocal: TComboBox
        Left = 378
        Top = 25
        Width = 59
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        Items.Strings = (
          'L-1'
          'L-2'
          'L-3'
          'L-4'
          'L-5'
          'L-6'
          'L-7'
          'L-8'
          'L-9'
          'L-10')
      end
      object cbxNivel: TComboBox
        Left = 58
        Top = 25
        Width = 314
        Height = 23
        CharCase = ecUpperCase
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 60
        ParentFont = False
        TabOrder = 1
        Items.Strings = (
          'SUB SOLO'
          'T'#201'RREO'
          '1'#186' PAVIMENTO'
          '2'#186' PAVIMENTO'
          '3'#186' PAVIMENTO'
          '4'#186' PAVIMENTO'
          '5'#186' PAVIMENTO'
          '6'#186' PAVIMENTO'
          '7'#186' PAVIMENTO'
          '8'#186' PAVIMENTO'
          '8'#186' PAVIMENTO')
      end
      object edItemPedido: TPanel
        Left = 3
        Top = 25
        Width = 52
        Height = 29
        BevelInner = bvLowered
        Color = clWhite
        ParentBackground = False
        TabOrder = 0
      end
      object cbxSituacao: TComboBox
        Left = 440
        Top = 25
        Width = 153
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ItemIndex = 0
        ParentFont = False
        TabOrder = 3
        Text = 'ABERTO'
        Items.Strings = (
          'ABERTO'
          'ENTREGUE')
      end
    end
    object gb_Preco_vendedor: TGroupBox
      Left = 243
      Top = 0
      Width = 95
      Height = 66
      Align = alLeft
      Caption = ' Pr Vendedor'
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 3
      object edt_preco_vendedor: TEdit
        Left = 7
        Top = 25
        Width = 80
        Height = 33
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        OnEnter = edQtdeEnter
        OnExit = edt_preco_vendedorExit
        OnKeyPress = edQtdeKeyPress
      end
    end
    object gb_preco_fornecedor: TGroupBox
      Left = 145
      Top = 0
      Width = 98
      Height = 66
      Align = alLeft
      Caption = ' Pr Fornecedor'
      Color = clWhite
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      object edt_preco_fornecedor: TEdit
        Left = 7
        Top = 25
        Width = 80
        Height = 33
        Alignment = taRightJustify
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        Text = '0,00'
        OnEnter = edQtdeEnter
        OnExit = edt_preco_vendedorExit
        OnKeyPress = edQtdeKeyPress
      end
    end
  end
  object pnl_cabecalho: TPanel [1]
    Left = 0
    Top = 0
    Width = 1044
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 1
    ExplicitWidth = 1058
    object lbl_titulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 251
      Height = 56
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'CONSULTA DE PRODUTOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 30
    end
    object SpeedButton1: TSpeedButton
      Left = 974
      Top = 0
      Width = 70
      Height = 56
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Align = alRight
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F6F6FFFFFFFFFFFFF8F8F88F8F8F5D5D5DABABABFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDCDCDC717171696969D3D3D3FFFFFFECECEC6D6D6D6767675E5E5EA4A4
        A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD4D4D46E6E6E666666606060AFAFAFFFFFFFFFFFFFB9B9B9
        5F5F5F6C6C6C626262969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD6363636969696262627D7D7DF4F4F4FF
        FFFFFFFFFFFFFFFFBEBEBE5C5C5C6B6B6B5E5E5E979797FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D16969696969696464647A7A
        7AFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C06969696B6B6B6161618F
        8F8FF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C26666666A6A6A
        6363638E8E8EFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBD
        BD5858586B6B6B636363848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA5E
        5E5E6A6A6A5D5D5D808080F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2E2E2636363696969606060797979F1F1F1FFFFFFFFFF
        FFB3B3B35A5A5A6C6C6C616161929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB676767686868656565
        868686FDFDFDBCBCBC6565656C6C6C606060959595FDFDFDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7
        D7D76E6E6E6767676868687272726868686B6B6B5B5B5BA4A4A4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE9E9E96D6D6D6C6C6C6C6C6C6D6D6D6A6A6AA1A1A1FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393936767676E6E6E6C6C
        6C727272E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A75E5E5E
        6C6C6C6868686969696A6A6A646464F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE97
        97976161616B6B6B686868B4B4B48282826666666767676D6D6DDBDBDBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9595956262626C6C6C595959B2B2B2FFFFFFE7E7E770707062626269
        69696C6C6CEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7F7F78484845D5D5D6A6A6A5E5E5ED8D8D8FFFFFFFFFFFFFFFF
        FFFBFBFB8E8E8E6161616A6A6A515151D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFDFD9090906363636A6A6A656565BFBFBFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFBFBFB7B7B7B6060606A6A6A6B6B6BCFCFCFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7C7C636363696969686868D0
        D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F38F8F8F636363
        696969666666C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFF2F2F27F7F7F6161616969
        69636363DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFE9494945F5F5F6B6B6B5B5B5BC5C5C5FFFFFFFFFFFFF8F8F8888888
        6363636868686D6D6DD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B6060606B6B6B646464CFCFCFFF
        FFFFEDEDED6F6F6F5E5E5E6F6F6FDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9999995F5F
        5F5D5D5DB1B1B1FFFFFFFFFFFFCFCFCFA0A0A0E9E9E9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB9B9B9ABABABF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_fecharClick
      ExplicitLeft = 1035
      ExplicitHeight = 80
    end
    object pnl_separa_topo: TPanel
      Left = 0
      Top = 56
      Width = 1044
      Height = 1
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 1058
    end
  end
  object Panel5: TPanel [2]
    Left = 0
    Top = 57
    Width = 1044
    Height = 377
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 1058
    ExplicitHeight = 383
    object dbgProdutos: TDBGrid
      AlignWithMargins = True
      Left = 20
      Top = 136
      Width = 1004
      Height = 231
      Hint = 'DUPLO < CLICK > PARA VISUALIZAR REGISTRO'
      Margins.Left = 20
      Margins.Top = 0
      Margins.Right = 20
      Margins.Bottom = 10
      Align = alClient
      BorderStyle = bsNone
      DataSource = ds
      DrawingStyle = gdsClassic
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      Options = [dgTitles, dgRowSelect, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI Semibold'
      TitleFont.Style = []
      OnKeyPress = dbgProdutosKeyPress
      OnTitleClick = dbgProdutosTitleClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME_FANTASIA'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Width = 307
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'UNIDADE'
          Title.Alignment = taCenter
          Title.Caption = 'Un'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_CUSTO'
          Title.Alignment = taCenter
          Title.Caption = 'P. Custo'
          Width = 118
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDEDOR'
          Title.Alignment = taCenter
          Title.Caption = 'P. Vendedor'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO_VENDA'
          Title.Alignment = taCenter
          Title.Caption = 'P. Venda'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE_FISICO'
          Title.Alignment = taCenter
          Title.Caption = 'Est. Fisico'
          Width = 79
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDO_ABERTO'
          Title.Alignment = taCenter
          Title.Caption = 'Ped Aberto'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTOQUE_DISPONIVEL'
          Title.Alignment = taCenter
          Title.Caption = 'Est. Disponivel'
          Width = 95
          Visible = True
        end>
    end
    object pnl_resultado: TPanel
      AlignWithMargins = True
      Left = 20
      Top = 95
      Width = 1004
      Height = 41
      Margins.Left = 20
      Margins.Top = 0
      Margins.Right = 20
      Margins.Bottom = 0
      Align = alTop
      BevelOuter = bvNone
      Color = 8404992
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 1018
      object lbl_resultado: TLabel
        AlignWithMargins = True
        Left = 15
        Top = 0
        Width = 213
        Height = 41
        Margins.Left = 15
        Margins.Top = 0
        Margins.Right = 0
        Margins.Bottom = 0
        Align = alLeft
        Caption = 'Resultado da Consulta'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 15395562
        Font.Height = -21
        Font.Name = 'Segoe UI Semibold'
        Font.Style = []
        ParentFont = False
        Layout = tlCenter
        ExplicitHeight = 30
      end
    end
    object pnTopo: TPanel
      AlignWithMargins = True
      Left = 20
      Top = 3
      Width = 1004
      Height = 89
      Margins.Left = 20
      Margins.Right = 20
      Align = alTop
      BevelOuter = bvNone
      Color = clGradientInactiveCaption
      ParentBackground = False
      TabOrder = 2
      ExplicitWidth = 1018
      object rgFiltrar: TRadioGroup
        Left = 0
        Top = 0
        Width = 413
        Height = 89
        Align = alLeft
        Caption = ' Filtrar '
        Color = clWhite
        Columns = 3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        Items.Strings = (
          'Lajes'
          'Vigas'
          'Lajotas'
          'Isopor'
          'Revenda'
          'Concreto Usinado'
          'Bomba de Concreto'
          'Todos'
          'Mat Prima ( Lajes )')
        ParentBackground = False
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        OnClick = rgFiltrarClick
      end
      object Panel2: TPanel
        Left = 413
        Top = 0
        Width = 591
        Height = 89
        Align = alClient
        BevelOuter = bvNone
        Color = clWhite
        ParentBackground = False
        TabOrder = 1
        ExplicitWidth = 605
        object rgTipoForma: TRadioGroup
          Left = 3
          Top = 0
          Width = 112
          Height = 89
          Caption = ' Largura da viga '
          Color = clWhite
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            '130 mm'
            '250 mm'
            'TRELIFACIL')
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 0
          Visible = False
          OnClick = rgTipoFormaClick
        end
        object rgAltura: TRadioGroup
          Left = 118
          Top = 0
          Width = 120
          Height = 89
          Caption = ' Altura '
          Color = clWhite
          Columns = 2
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          Items.Strings = (
            'H-8'
            'H-12'
            'H-16'
            'H-20'
            'H-25'
            'H-30')
          ParentBackground = False
          ParentColor = False
          ParentFont = False
          TabOrder = 1
          Visible = False
          OnClick = rgAlturaClick
        end
        object gbx_qtde_vigas: TGroupBox
          Left = 240
          Top = 0
          Width = 78
          Height = 89
          Caption = 'Qtde Vigas'
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 2
          Visible = False
          object edt_qtde_vigas: TEdit
            AlignWithMargins = True
            Left = 5
            Top = 54
            Width = 68
            Height = 30
            Align = alBottom
            Alignment = taCenter
            BevelInner = bvNone
            BevelOuter = bvNone
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clRed
            Font.Height = -19
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            NumbersOnly = True
            ParentFont = False
            TabOrder = 0
          end
        end
        object btnBuscar: TBitBtn
          Left = 486
          Top = 0
          Width = 111
          Height = 89
          Caption = 'Buscar'
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FF00FF314B62
            AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
            106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
            00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
            FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
            00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
            FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
            9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
            E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
            FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
            B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
            FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
            DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
            B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
            BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
            D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
            FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
            6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
            00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
          TabOrder = 3
          OnClick = btnBuscarClick
        end
        object gbTamanho: TGroupBox
          Left = 320
          Top = -1
          Width = 164
          Height = 89
          Caption = ' Tamanho '
          Color = clWhite
          ParentBackground = False
          ParentColor = False
          TabOrder = 4
          Visible = False
          object edTamanho: TEdit
            AlignWithMargins = True
            Left = 5
            Top = 54
            Width = 154
            Height = 30
            Align = alBottom
            Alignment = taCenter
            BevelInner = bvNone
            BevelOuter = bvNone
            CharCase = ecUpperCase
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Times New Roman'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            OnEnter = edTamanhoEnter
            OnExit = edTamanhoExit
            OnKeyPress = edTamanhoKeyPress
          end
        end
      end
    end
  end
  object gbBotoes: TGroupBox [3]
    Left = 0
    Top = 500
    Width = 1044
    Height = 52
    Align = alBottom
    Color = clBtnFace
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    ExplicitTop = 506
    ExplicitWidth = 1058
    DesignSize = (
      1044
      52)
    object lbl_forma_pagamento: TLabel
      Left = 16
      Top = 6
      Width = 112
      Height = 15
      Caption = 'forma de pagamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnConfirma: TBitBtn
      AlignWithMargins = True
      Left = 354
      Top = 10
      Width = 185
      Height = 31
      Anchors = [akTop]
      Caption = 'CONFIRMAR'
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnConfirmaClick
      ExplicitLeft = 360
    end
    object btn_fechar: TBitBtn
      AlignWithMargins = True
      Left = 542
      Top = 10
      Width = 185
      Height = 31
      Anchors = [akTop]
      Caption = 'FECHAR '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btn_fecharClick
      ExplicitLeft = 551
    end
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    SQL.Strings = (
      'select'
      '  P.ID, '
      '  P.DESCRICAO, '
      '  P.NOME_FANTASIA,'
      '  P.UNIDADE,'
      '  P.PRECO_CUSTO,'
      '  P.PRECO_VENDEDOR,'
      '  P.PRECO_VENDA,'
      '  P.ESTOQUE_FISICO,'
      '  P.PEDIDO_ABERTO,'
      '  P.ESTOQUE_DISPONIVEL, '
      '  P.REVENDA,'
      '  P.MATERIA_PRIMA,'
      '  P.LAJE,'
      '  P.VIGA,'
      '  P.LAJOTA,'
      '  P.ISOPOR,'
      '  P.CONCRETO,'
      '  P.BOMBA,'
      '  P.VERGALHAO,'
      '  P.TRELICA,'
      '  P.NEGATIVO_DE_LAJE,'
      '  P.REFORCO_DE_VIGA,'
      '  P.ESTOQUE_CONTROLADO'
      'from '
      '  PRODUTOS P,'
      '  PRODUTOS_LAJES L '
      'where'
      '  L.PRODUTO_ID = P.ID')
    Left = 321
    Top = 292
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
    object qryLAJE: TStringField
      FieldName = 'LAJE'
      Origin = 'LAJE'
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
    object qryREVENDA: TStringField
      FieldName = 'REVENDA'
      Origin = 'REVENDA'
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
    object qryVIGA: TStringField
      FieldName = 'VIGA'
      Origin = 'VIGA'
      Size = 1
    end
    object qryMATERIA_PRIMA: TStringField
      FieldName = 'MATERIA_PRIMA'
      Origin = 'MATERIA_PRIMA'
      Size = 1
    end
    object qryREFORCO_DE_VIGA: TStringField
      FieldName = 'REFORCO_DE_VIGA'
      Origin = 'REFORCO_DE_VIGA'
      Size = 1
    end
    object qryESTOQUE_CONTROLADO: TStringField
      FieldName = 'ESTOQUE_CONTROLADO'
      Origin = 'ESTOQUE_CONTROLADO'
      Size = 1
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = qry
    OnDataChange = dsDataChange
    Left = 320
    Top = 264
  end
end
