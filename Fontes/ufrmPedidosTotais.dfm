inherited frmPedidosTotais: TfrmPedidosTotais
  BorderStyle = bsNone
  ClientHeight = 510
  ClientWidth = 1075
  Position = poDesigned
  OnShow = FormShow
  ExplicitWidth = 1075
  ExplicitHeight = 510
  TextHeight = 15
  object pnl_topo: TPanel [0]
    Left = 0
    Top = 57
    Width = 1075
    Height = 60
    Align = alTop
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI Semibold'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object lbl_nome_vendedor: TLabel
      Left = 16
      Top = 37
      Width = 174
      Height = 17
      Caption = 'VENDEDOR - N'#227'o Informado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_periodo_contabil: TLabel
      Left = 18
      Top = 13
      Width = 162
      Height = 17
      Caption = 'PERIODO - N'#227'o Informado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object gb_pedidos_emitidos: TGroupBox [1]
    Left = 0
    Top = 117
    Width = 1075
    Height = 128
    Align = alTop
    Caption = '                                           '
    TabOrder = 1
    object Label2: TLabel
      Left = 22
      Top = 11
      Width = 91
      Height = 15
      Caption = 'Pedidos Emitidos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 44
      Top = 35
      Width = 113
      Height = 15
      Caption = 'Qtde Pedidos             :'
    end
    object Label13: TLabel
      Left = 44
      Top = 58
      Width = 115
      Height = 15
      Caption = 'Qtde Pedidos Pagos  :'
    end
    object Label14: TLabel
      Left = 44
      Top = 79
      Width = 115
      Height = 15
      Caption = 'Qtde Or'#231'amentos      :'
    end
    object Label16: TLabel
      Left = 327
      Top = 9
      Width = 113
      Height = 15
      Caption = 'Situa'#231#227'o dos Pedidos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 327
      Top = 33
      Width = 72
      Height = 15
      Caption = 'Aberto           :'
    end
    object Label20: TLabel
      Left = 327
      Top = 79
      Width = 72
      Height = 15
      Caption = 'Aguardando :'
    end
    object Label21: TLabel
      Left = 327
      Top = 101
      Width = 71
      Height = 15
      Caption = 'Cancelado    :'
    end
    object lbl_qtde_pedidos: TLabel
      Left = 166
      Top = 33
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qtde_pedidos_pagos: TLabel
      Left = 166
      Top = 56
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qtde_orcamentos: TLabel
      Left = 166
      Top = 77
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qtde_pedidos_abertos: TLabel
      Left = 410
      Top = 33
      Width = 24
      Height = 15
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qtde_pedidos_aguardando: TLabel
      Left = 410
      Top = 79
      Width = 24
      Height = 15
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_qtde_pedidos_cancelado: TLabel
      Left = 410
      Top = 101
      Width = 24
      Height = 15
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 532
      Top = 76
      Width = 116
      Height = 15
      Caption = 'Resta Receber        : R$'
    end
    object Label7: TLabel
      Left = 532
      Top = 53
      Width = 117
      Height = 15
      Caption = 'Valor Pago              : R$'
    end
    object Label8: TLabel
      Left = 532
      Top = 29
      Width = 118
      Height = 15
      Caption = 'Valor dos Pedidos  : R$'
    end
    object Label11: TLabel
      Left = 818
      Top = 52
      Width = 143
      Height = 15
      Caption = 'Comiss'#245'es do periodo  : R$'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl_valor_pedidos: TLabel
      Left = 720
      Top = 26
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_valor_pago: TLabel
      Left = 720
      Top = 51
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_valor_receber: TLabel
      Left = 720
      Top = 74
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_valor_comissoes: TLabel
      Left = 1025
      Top = 51
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 532
      Top = 7
      Width = 68
      Height = 15
      Caption = 'Faturamento'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 818
      Top = 8
      Width = 35
      Height = 15
      Caption = 'Custos'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 818
      Top = 29
      Width = 141
      Height = 15
      Caption = 'Custos do Produtos      : R$'
    end
    object lbl_custos_produtos: TLabel
      Left = 1025
      Top = 26
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 818
      Top = 76
      Width = 142
      Height = 15
      Caption = 'Comiss'#245'es ADM            : R$'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl_valor_comissao_adm: TLabel
      Left = 1025
      Top = 74
      Width = 24
      Height = 17
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 327
      Top = 55
      Width = 74
      Height = 15
      Caption = 'Liquidado      :'
    end
    object lbl_qtde_pedidos_liquidado: TLabel
      Left = 410
      Top = 53
      Width = 24
      Height = 15
      Alignment = taRightJustify
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 286
    Width = 1075
    Height = 224
    ActivePage = tbs_produtos
    Align = alClient
    Style = tsButtons
    TabOrder = 2
    object tbs_produtos: TTabSheet
      Caption = 'Produtos Vendidos no periodo'
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1067
        Height = 191
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbg_produtos_vendidos: TDBGrid
          AlignWithMargins = True
          Left = 20
          Top = 41
          Width = 1027
          Height = 140
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
          OnTitleClick = dbg_produtos_vendidosTitleClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PRODUTO_ID'
              Title.Alignment = taCenter
              Title.Caption = 'C'#243'digo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'QTDE'
              Title.Alignment = taCenter
              Title.Caption = 'Quantidade'
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UNIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Unidade'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_FANTASIA'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Width = 330
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUSTO'
              Title.Alignment = taCenter
              Title.Caption = 'Custo Total'
              Width = 100
              Visible = True
            end>
        end
        object pnl_resultado: TPanel
          AlignWithMargins = True
          Left = 20
          Top = 0
          Width = 1027
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
          object lbl_resultado: TLabel
            AlignWithMargins = True
            Left = 15
            Top = 0
            Width = 351
            Height = 41
            Margins.Left = 15
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'PRODUTOS VENDIDOS NO PERIODO'
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
      end
    end
    object tbs_itens_laje: TTabSheet
      Caption = 'Totais dos Itens das Lajes '
      ImageIndex = 1
      OnShow = tbs_itens_lajeShow
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1067
        Height = 191
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object dbg_itens_laje: TDBGrid
          AlignWithMargins = True
          Left = 20
          Top = 41
          Width = 1027
          Height = 140
          Hint = 'DUPLO < CLICK > PARA VISUALIZAR REGISTRO'
          Margins.Left = 20
          Margins.Top = 0
          Margins.Right = 20
          Margins.Bottom = 10
          Align = alClient
          BorderStyle = bsNone
          DataSource = ds_itens_laje
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
          OnTitleClick = dbg_itens_lajeTitleClick
          Columns = <
            item
              Expanded = False
              FieldName = 'total'
              Title.Alignment = taCenter
              Title.Caption = 'Total'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'unidade'
              Title.Alignment = taCenter
              Title.Caption = 'Unidade'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'nome_fantasia'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o'
              Visible = True
            end>
        end
        object Panel3: TPanel
          AlignWithMargins = True
          Left = 20
          Top = 0
          Width = 1027
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
          object Label1: TLabel
            AlignWithMargins = True
            Left = 15
            Top = 0
            Width = 285
            Height = 41
            Margins.Left = 15
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alLeft
            Caption = 'TOTAIS DOS ITENS DAS LAJES'
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
      end
    end
  end
  object Panel1: TPanel [3]
    Left = 0
    Top = 0
    Width = 1075
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 3
    object btn_fechar: TSpeedButton
      Left = 1005
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
    object lbl_titulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 203
      Height = 56
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'RESUMO DE VENDAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 30
    end
    object pnl_separa_topo: TPanel
      Left = 0
      Top = 56
      Width = 1075
      Height = 1
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = clNavy
      ParentBackground = False
      TabOrder = 0
    end
  end
  object pnl_botoes: TPanel [4]
    Left = 0
    Top = 245
    Width = 1075
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 4
    object sb_produtos: TSpeedButton
      Left = 0
      Top = 0
      Width = 175
      Height = 41
      Align = alLeft
      GroupIndex = 1
      Down = True
      Caption = 'Produtos'
      OnClick = sb_produtosClick
    end
    object btn_total_itens: TSpeedButton
      Left = 175
      Top = 0
      Width = 146
      Height = 41
      Align = alLeft
      GroupIndex = 1
      Caption = 'Totais Vigas e Outros'
      OnClick = btn_total_itensClick
    end
    object btn_rel_prod_vendidos: TSpeedButton
      Left = 321
      Top = 0
      Width = 232
      Height = 41
      Align = alLeft
      GroupIndex = 1
      Caption = 'Relat'#243'rio de produtos vendidos  '
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF737373696969656563929391FFFFFFAF
        AFAFAFAFAFAFAFAFFFFFFF7B7B754F4F4F545454545454FF00FFFF00FF737373
        93979793979775777590918EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7B7B755B5C
        5C787B7B606161545454FF00FF737373939797ADB5B56667665F5F5F77777777
        77777777777777777171715A5A586869697F8282707171545454FF00FF737373
        ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5ADB5B5A2A8A86AA4
        7708B518767878565757FF00FF737373D2D2D2988D91997C809A797BAA8186AA
        7F86AA7E86AD828AA77F859D7C7F8B7D7A5E9063787A7A575858FF00FF737373
        D2D2D2855A62956B6D8A6969896D6D876B6B866A6A886E6D8A706F8D6A699363
        6A9C6C819397975C5D5DFF00FF737373D2D2D26F4952583F415F4C4C74696972
        67677166667166667166665E424254393C8A72749397976C6D6DFF00FF737373
        ADB5B57E686A757272A6A8A9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9B9B9B6E5F
        61988989ADB5B56C6D6DFF00FFFF00FF7373738E81818F8485A6A8A9FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF9B9B9B8473748F85856C6D6DFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFFFFFFFFFFFFA6A8A99B9B9B9B9B9BFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A9FFFFFFFF
        FFFFFFFFFFA6A8A9FFFFFF9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFA6A8A9FFFFFFFCFCFCFFFFFFA6A8A99B9B9BFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA6A8A99B9B9B9B
        9B9B9B9B9B9B9B9BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      OnClick = btn_rel_prod_vendidosClick
    end
  end
  inherited qry: TFDQuery
    Left = 304
    Top = 96
    object qryPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
    end
    object qryNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Size = 120
    end
    object qryQTDE: TFMTBCDField
      FieldName = 'QTDE'
      DisplayFormat = '0.00'
    end
    object qryCUSTO: TBCDField
      FieldName = 'CUSTO'
      DisplayFormat = '0.00'
    end
    object qryUNIDADE: TStringField
      FieldName = 'UNIDADE'
    end
  end
  object ds: TDataSource
    AutoEdit = False
    DataSet = qry
    Left = 304
    Top = 65
  end
  object ds_itens_laje: TDataSource
    AutoEdit = False
    DataSet = FDMemTable1
    Left = 124
    Top = 369
  end
  object FDMemTable1: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'nome_fantasia'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'unidade'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'total'
        DataType = ftFloat
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 124
    Top = 401
    object FDMemTable1nome_fantasia: TStringField
      FieldName = 'nome_fantasia'
      Size = 100
    end
    object FDMemTable1unidade: TStringField
      FieldName = 'unidade'
    end
    object FDMemTable1total: TFloatField
      FieldName = 'total'
    end
  end
  object frx_rel_vendas: TfrxReport
    Version = '2022.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46048.609416782400000000
    ReportOptions.LastChange = 46048.609416782400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 488
    Top = 24
    Datasets = <
      item
        DataSet = frxDBDataset
        DataSetName = 'ProdutosVendidos'
      end
      item
        DataSet = frxDBEmpresa
        DataSetName = 'Empresa'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 66.031530240000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 105.275510000000000000
          Height = 43.070810000000000000
          OnAfterData = 'Picture1OnAfterData'
          Center = True
          Frame.Typ = []
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object EmpresaNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 3.779530000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empresa."NOME"] CNPJ: [Empresa."CPF_CNPJ"]')
          ParentFont = False
        end
        object EmpresaENDERECO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 20.456710000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Empresa."ENDERECO"],[Empresa."NUMERO"] [Empresa."BAIRRO"] [Empr' +
              'esa."CIDADE"] [Empresa."UF"]')
          ParentFont = False
        end
        object EmpresaTELEFONE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 35.795300000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Telefone : [Empresa."TELEFONE1"]  WhatsApp : [Empresa."TELEFONE2' +
              '"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object EmpresaSITE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 50.913420000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Site [Empresa."SITE"] / Email [Empresa."EMAIL"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 34.015745590000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 45.354360000000000000
          Top = 3.779527559055118000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE PRODUTOS VENDIDOS. PERIODO:')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 35.559060000000000000
          Width = 718.110236220000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 718.110236220000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 413.086890000000000000
          Top = 3.779527559055118000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATA_INICIO]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 538.031850000000000000
          Top = 3.779527559055118000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[DATA_FIM]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 507.795610000000000000
          Top = 3.779527559055118000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'at'#233)
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677167800000000000
        Top = 166.299320000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Width = 68.031518030000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 66.472480000000000000
          Width = 52.913192990000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Unid')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 538.016080000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Custo Total')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 19.456710000000000000
          Width = 718.110236220000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object ComprasNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 119.267780000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataSet = frmCompras.frxDBPesquisa
          DataSetName = 'Compras'
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset
        DataSetName = 'ProdutosVendidos'
        RowCount = 0
        object ContasPagarCADASTRADO_EM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 11.000000000000000000
          Width = 68.031496060000000000
          Height = 15.118110240000000000
          DataField = 'QTDE'
          DataSet = frxDBDataset
          DataSetName = 'ProdutosVendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[ProdutosVendidos."QTDE"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 80.133890000000000000
          Width = 49.133843620000000000
          Height = 15.118110240000000000
          DataField = 'UNIDADE'
          DataSet = frxDBDataset
          DataSetName = 'ProdutosVendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[ProdutosVendidos."UNIDADE"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 119.929190000000000000
          Width = 396.850603620000000000
          Height = 15.118110240000000000
          DataField = 'NOME_FANTASIA'
          DataSet = frxDBDataset
          DataSetName = 'ProdutosVendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[ProdutosVendidos."NOME_FANTASIA"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 522.457020000000000000
          Width = 79.370083620000000000
          Height = 15.118110240000000000
          DataField = 'CUSTO'
          DataSet = frxDBDataset
          DataSetName = 'ProdutosVendidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[ProdutosVendidos."CUSTO"]')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 328.819110000000000000
        Width = 718.110700000000000000
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Width = 740.787401570000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779527559055120000
          Width = 234.330860000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data da Impress'#227'o: [Date][Time]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 268.787570000000000000
          Top = 3.779527559055120000
          Width = 268.346630000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'SysLajes - Sistema de Gerenciamento de Lajes ')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 610.165740000000000000
          Top = 3.779527560000000000
          Width = 136.063080000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina : [Page]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBDataset: TfrxDBDataset
    UserName = 'ProdutosVendidos'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    DataSetOptions = []
    Left = 488
    Top = 56
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'Empresa'
    CloseDataSource = False
    DataSet = qryEmpresa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 528
    Top = 24
  end
  object qryEmpresa: TFDQuery
    SQL.Strings = (
      
        'select P.*, E.*  from PESSOAS P, EMPRESA E where E.PESSOA_ID = P' +
        '.ID')
    Left = 529
    Top = 54
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 560
    Top = 32
  end
end
