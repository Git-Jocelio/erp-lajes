inherited frmPequisa_vigas_vendidas: TfrmPequisa_vigas_vendidas
  BorderStyle = bsNone
  Caption = 'frmPequisa_vigas_vendidas'
  ClientHeight = 600
  ClientWidth = 755
  ExplicitWidth = 755
  ExplicitHeight = 600
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 755
    ExplicitWidth = 755
    inherited lbl_titulo: TLabel
      Width = 685
      Height = 40
      Caption = 'PESQUISA DE VIGAS VENDIDAS '
      ExplicitWidth = 303
    end
    inherited lbl_sub_titulo: TLabel
      Width = 755
      Caption = 'Pesquisa de vigas vendidas em um periodo determinado'
      ExplicitWidth = 334
    end
    object btn_fechar: TSpeedButton
      Left = 685
      Top = 0
      Width = 70
      Height = 40
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
      ExplicitLeft = 1030
      ExplicitHeight = 80
    end
  end
  inherited pnDados: TPanel
    Width = 755
    Height = 335
    ExplicitWidth = 755
    ExplicitHeight = 335
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 755
      Height = 113
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 16
        Top = 29
        Width = 273
        Height = 75
        Caption = '                           '
        TabOrder = 0
        object Label1: TLabel
          Left = 11
          Top = 3
          Width = 95
          Height = 17
          Caption = 'Data da entrega'
        end
        object Label2: TLabel
          Left = 11
          Top = 42
          Width = 23
          Height = 17
          Caption = 'De :'
        end
        object Label3: TLabel
          Left = 143
          Top = 42
          Width = 25
          Height = 17
          Caption = 'at'#233' :'
        end
        object dtp_entrega_ini: TDateTimePicker
          Left = 40
          Top = 41
          Width = 90
          Height = 21
          Cursor = crHandPoint
          Date = 44291.000000000000000000
          Time = 0.911467604164499800
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object dtp_entrega_fim: TDateTimePicker
          Left = 174
          Top = 41
          Width = 90
          Height = 21
          Cursor = crHandPoint
          Date = 44291.000000000000000000
          Time = 0.911635243057389700
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
      object GroupBox3: TGroupBox
        Left = 295
        Top = 29
        Width = 141
        Height = 75
        Caption = 'Situa'#231#227'o do pedido '
        TabOrder = 1
        object cbxSituacao: TComboBox
          Left = 7
          Top = 41
          Width = 120
          Height = 23
          Cursor = crHandPoint
          Style = csDropDownList
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            'ABERTO'
            'ENTREGUE'
            '< Todos >')
        end
      end
      object btn_pesquisar: TBitBtn
        Left = 447
        Top = 70
        Width = 130
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 2
        OnClick = btn_pesquisarClick
      end
    end
    object dbg_vigas: TDBGrid
      Left = 0
      Top = 113
      Width = 755
      Height = 222
      Align = alClient
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'PRODUTO_ID'
          Title.Alignment = taCenter
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'NOME_FANTASIA'
          Title.Alignment = taCenter
          Title.Caption = 'Descri'#231#227'o'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 381
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TOTAL_QTDE'
          Title.Alignment = taCenter
          Title.Caption = 'Total de vigas'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 124
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'METRO_LINEARES'
          Title.Alignment = taCenter
          Title.Caption = 'Total em mts lineares'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 185
          Visible = True
        end>
    end
  end
  inherited pnRodape: TPanel
    Top = 392
    Width = 755
    Height = 208
    ExplicitTop = 392
    ExplicitWidth = 755
    ExplicitHeight = 208
    object Label7: TLabel [0]
      Left = 533
      Top = 6
      Width = 119
      Height = 17
      Caption = 'Total Linear Vendido'
      FocusControl = edt_total_geral
    end
    object Label4: TLabel [1]
      Left = 16
      Top = 6
      Width = 54
      Height = 17
      Caption = 'Resumo :'
    end
    inherited pnl_botoes: TPanel
      Left = 300
      Top = 163
      ExplicitLeft = 300
      ExplicitTop = 163
      inherited btnOk: TBitBtn
        Caption = 'Imprimir'
        Enabled = False
        OnClick = btnOkClick
      end
    end
    object edt_total_geral: TDBEdit
      Left = 533
      Top = 29
      Width = 105
      Height = 25
      DataField = 'TOTAL_MTS_LINEARES'
      DataSource = ds_totais
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object dbg_grupos: TDBGrid
      Left = 13
      Top = 29
      Width = 500
      Height = 120
      DataSource = ds_grupo
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 2
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'FORMA_MEDIDA'
          Title.Alignment = taCenter
          Title.Caption = 'Largura da Forma'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 132
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TRELICA_ALTURA'
          Title.Alignment = taCenter
          Title.Caption = 'Altura Viga'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TOTAL_QTDE'
          Title.Alignment = taCenter
          Title.Caption = 'Total de vigas'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MTS_LINEARES'
          Title.Alignment = taCenter
          Title.Caption = 'Mts Lineares'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Visible = True
        end>
    end
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'SELECT'
      '  pil.PRODUTO_ID,'
      '  pr.nome_fantasia,'
      '  SUM(pil.QTDE) AS TOTAL_QTDE,'
      '  CAST('
      '    SUM( pil.QTDE * ( COALESCE(pv.COMPRIMENTO,0) / 1000.0 ) )'
      '    AS DECIMAL(15,2)'
      '  ) AS METRO_LINEARES'
      'FROM PEDIDOS p'
      'JOIN PEDIDOS_ITENS_LAJE pil ON p.ID = pil.PEDIDO_ID'
      'JOIN PRODUTOS pr ON pr.ID = pil.PRODUTO_ID'
      'JOIN PRODUTOS_VIGAS pv ON pv.PRODUTO_ID = pr.ID'
      'WHERE p.DATA_EMISSAO BETWEEN :DATA_INICIO AND :DATA_FIM'
      '  AND p.ORCAMENTO = '#39'N'#39
      '  AND p.SITUACAO = :SITUACAO_PEDIDO'
      '  AND pr.VIGA = '#39'S'#39
      'GROUP BY pil.PRODUTO_ID, pr.nome_fantasia'
      'ORDER BY pr.nome_fantasia;')
    Left = 352
    Top = 272
    ParamData = <
      item
        Name = 'DATA_INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA_FIM'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'SITUACAO_PEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
    object qryPRODUTO_ID: TIntegerField
      FieldName = 'PRODUTO_ID'
      Origin = 'PRODUTO_ID'
      Required = True
    end
    object qryNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Size = 100
    end
    object qryTOTAL_QTDE: TLargeintField
      FieldName = 'TOTAL_QTDE'
      Origin = 'TOTAL_QTDE'
    end
    object qryMETRO_LINEARES: TFMTBCDField
      FieldName = 'METRO_LINEARES'
      Origin = 'METRO_LINEARES'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  inherited ds: TDataSource
    OnDataChange = dsDataChange
    Left = 352
    Top = 241
  end
  object ds_grupo: TDataSource
    DataSet = qry_grupo
    Left = 152
    Top = 465
  end
  object qry_grupo: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      ''
      'SELECT'
      '    pv.FORMA_MEDIDA,'
      '    pv.TRELICA_ALTURA,'
      '    SUM(pil.QTDE) AS TOTAL_QTDE,'
      
        '    SUM(pil.QTDE * COALESCE(pv.COMPRIMENTO, 2))/1000 AS MTS_LINE' +
        'ARES'
      'FROM PEDIDOS p'
      'JOIN PEDIDOS_ITENS_LAJE pil ON p.ID = pil.PEDIDO_ID'
      'JOIN PRODUTOS pr ON pr.ID = pil.PRODUTO_ID'
      'JOIN PRODUTOS_VIGAS pv ON pv.PRODUTO_ID = pr.ID'
      'WHERE p.DATA_EMISSAO BETWEEN :DATA_INICIO AND :DATA_FIM'
      '  AND p.ORCAMENTO = '#39'N'#39
      '  AND p.SITUACAO = :SITUACAO_PEDIDO'
      '  AND pr.VIGA = '#39'S'#39
      'GROUP BY pv.FORMA_MEDIDA, pv.TRELICA_ALTURA'
      'ORDER BY pv.FORMA_MEDIDA, pv.TRELICA_ALTURA;')
    Left = 152
    Top = 497
    ParamData = <
      item
        Name = 'DATA_INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA_FIM'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'SITUACAO_PEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
    object qry_grupoFORMA_MEDIDA: TIntegerField
      FieldName = 'FORMA_MEDIDA'
      Origin = 'FORMA_MEDIDA'
    end
    object qry_grupoTRELICA_ALTURA: TIntegerField
      FieldName = 'TRELICA_ALTURA'
      Origin = 'TRELICA_ALTURA'
    end
    object qry_grupoTOTAL_QTDE: TLargeintField
      FieldName = 'TOTAL_QTDE'
      Origin = 'TOTAL_QTDE'
    end
    object qry_grupoMTS_LINEARES: TLargeintField
      FieldName = 'MTS_LINEARES'
      Origin = 'MTS_LINEARES'
      DisplayFormat = '0.00'
    end
  end
  object ds_totais: TDataSource
    DataSet = qry_totais
    Left = 640
    Top = 425
  end
  object qry_totais: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'SELECT SUM(MTS_LINEARES) AS TOTAL_MTS_LINEARES'
      'FROM ('
      
        '    SELECT SUM(pil.QTDE * COALESCE(pv.COMPRIMENTO, 2))/1000 AS M' +
        'TS_LINEARES'
      '    FROM PEDIDOS p'
      '    JOIN PEDIDOS_ITENS_LAJE pil ON p.ID = pil.PEDIDO_ID'
      '    JOIN PRODUTOS pr ON pr.ID = pil.PRODUTO_ID'
      '    JOIN PRODUTOS_VIGAS pv ON pv.PRODUTO_ID = pr.ID'
      '    WHERE p.DATA_EMISSAO BETWEEN :DATA_INICIO AND :DATA_FIM'
      '      AND p.ORCAMENTO = '#39'N'#39
      '      AND p.SITUACAO = :SITUACAO_PEDIDO'
      '      AND pr.VIGA = '#39'S'#39
      '    GROUP BY pv.FORMA_MEDIDA, pv.TRELICA_ALTURA'
      ') AS T;')
    Left = 640
    Top = 457
    ParamData = <
      item
        Name = 'DATA_INICIO'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'DATA_FIM'
        DataType = ftDate
        ParamType = ptInput
      end
      item
        Name = 'SITUACAO_PEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 15
      end>
    object qry_totaisTOTAL_MTS_LINEARES: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'TOTAL_MTS_LINEARES'
      Origin = 'TOTAL_MTS_LINEARES'
      ProviderFlags = []
      ReadOnly = True
      DisplayFormat = '0.00'
    end
  end
  object frxReport: TfrxReport
    Version = '2022.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 46000.541881122680000000
    ReportOptions.LastChange = 46000.541881122680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 600
    Top = 65
    Datasets = <
      item
        DataSet = frxDBVigas
        DataSetName = 'DBVigasVendidas'
      end
      item
        DataSet = frxDBGrupo
        DataSetName = 'DBGrupoVigas'
      end
      item
        DataSet = frxDBTotal
        DataSetName = 'DBTotalLinear'
      end>
    Variables = <
      item
        Name = ' Minhas Vari'#225'veis'
        Value = Null
      end
      item
        Name = 'Data_inicio'
        Value = ''
      end
      item
        Name = 'Data_fim'
        Value = ''
      end
      item
        Name = 'situacao_pedido'
        Value = ''
      end>
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
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Width = 359.055350000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'SYSLAJES - SISTEMA DE GERENCIAMENTO DE LAJES')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 26.456710000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE VIGAS VENDIDAS')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 52.913420000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Periodo pesquisado :')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 449.764070000000000000
          Top = 52.913420000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Situa'#231#227'o dos pedidos :')
          ParentFont = False
        end
        object memoTraco: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 75.590600000000000000
          Width = 702.992101570000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Data_inicio: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 139.842610000000000000
          Top = 52.913420000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Data_inicio]')
          ParentFont = False
        end
        object Data_fim: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 52.913420000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd/mm/yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Data_fim]')
          ParentFont = False
        end
        object situacao_pedido: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 52.913420000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[situacao_pedido]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 52.913420000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'At'#233)
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456692910000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 7.000000000000000000
          Width = 117.165430000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o da Viga')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 7.000000000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 461.102660000000000000
          Top = 7.000000000000000000
          Width = 94.488250000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Metros lineares')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Top = 25.118120000000000000
          Width = 702.992101570000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
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
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = frxDBVigas
        DataSetName = 'DBVigasVendidas'
        RowCount = 0
        object DBVigasVendidasNOME_FANTASIA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 230.551330000000000000
          Height = 18.897650000000000000
          DataField = 'NOME_FANTASIA'
          DataSet = frxDBVigas
          DataSetName = 'DBVigasVendidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DBVigasVendidas."NOME_FANTASIA"]')
          ParentFont = False
        end
        object DBVigasVendidasTOTAL_QTDE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 245.669450000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataField = 'TOTAL_QTDE'
          DataSet = frxDBVigas
          DataSetName = 'DBVigasVendidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DBVigasVendidas."TOTAL_QTDE"]')
          ParentFont = False
        end
        object DBVigasVendidasMETRO_LINEARES: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 385.512060000000000000
          Width = 151.181200000000000000
          Height = 18.897650000000000000
          DataField = 'METRO_LINEARES'
          DataSet = frxDBVigas
          DataSetName = 'DBVigasVendidas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DBVigasVendidas."METRO_LINEARES"]')
          ParentFont = False
        end
      end
      object MasterData2: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 17.007874015748030000
        Top = 317.480520000000000000
        Width = 718.110700000000000000
        DataSet = frxDBGrupo
        DataSetName = 'DBGrupoVigas'
        RowCount = 0
        object DBGrupoVigasFORMA_MEDIDA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'FORMA_MEDIDA'
          DataSet = frxDBGrupo
          DataSetName = 'DBGrupoVigas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DBGrupoVigas."FORMA_MEDIDA"]')
          ParentFont = False
        end
        object DBGrupoVigasTRELICA_ALTURA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 83.149660000000000000
          Width = 60.472480000000000000
          Height = 15.118110240000000000
          DataField = 'TRELICA_ALTURA'
          DataSet = frxDBGrupo
          DataSetName = 'DBGrupoVigas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DBGrupoVigas."TRELICA_ALTURA"]')
          ParentFont = False
        end
        object DBGrupoVigasTOTAL_QTDE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 196.535560000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          DataField = 'TOTAL_QTDE'
          DataSet = frxDBGrupo
          DataSetName = 'DBGrupoVigas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DBGrupoVigas."TOTAL_QTDE"]')
          ParentFont = False
        end
        object DBGrupoVigasMTS_LINEARES: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 313.700990000000000000
          Width = 105.826840000000000000
          Height = 15.118110240000000000
          DataField = 'MTS_LINEARES'
          DataSet = frxDBGrupo
          DataSetName = 'DBGrupoVigas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DBGrupoVigas."MTS_LINEARES"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456692910000000000
        Top = 396.850650000000000000
        Width = 718.110700000000000000
        object DBTotalLinearTOTAL_MTS_LINEARES: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 234.330860000000000000
          Top = 9.000000000000000000
          Width = 268.346630000000000000
          Height = 15.118110240000000000
          DataField = 'TOTAL_MTS_LINEARES'
          DataSet = frxDBTotal
          DataSetName = 'DBTotalLinear'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[DBTotalLinear."TOTAL_MTS_LINEARES"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 9.000000000000000000
          Width = 222.992270000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Total em metros lineares vendidos : ')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Top = 5.220470000000000000
          Width = 702.992101570000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 49.133872910000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 30.000000000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Forma')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 90.708720000000000000
          Top = 30.000000000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Altura')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 173.858380000000000000
          Top = 30.181102360000000000
          Width = 120.944960000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Qtde Total Vigas')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 302.362400000000000000
          Top = 30.181102360000000000
          Width = 154.960730000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Total em metros lineares')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 0.118120000000000000
          Width = 702.992101570000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 3.779530000000000000
          Width = 332.598640000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAIS POR TIPO DE FORMA E ALTURA DA VIGA')
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
        Height = 22.677170240000000000
        Top = 445.984540000000000000
        Width = 718.110700000000000000
        object Memo19: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Top = 3.779530000000000000
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
        object Memo20: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 602.606680000000000000
          Top = 3.779530000000000000
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
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Width = 737.008350000000000000
          Height = 3.779527560000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Verdana'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 260.787570000000000000
          Top = 3.779530000000000000
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
      end
    end
  end
  object frxDBVigas: TfrxDBDataset
    UserName = 'DBVigasVendidas'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    DataSetOptions = []
    Left = 352
    Top = 305
  end
  object frxDBGrupo: TfrxDBDataset
    UserName = 'DBGrupoVigas'
    CloseDataSource = False
    DataSet = qry_grupo
    BCDToCurrency = False
    DataSetOptions = []
    Left = 152
    Top = 528
  end
  object frxDBTotal: TfrxDBDataset
    UserName = 'DBTotalLinear'
    CloseDataSource = False
    DataSet = qry_totais
    BCDToCurrency = False
    DataSetOptions = []
    Left = 640
    Top = 488
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
    Left = 640
    Top = 65
  end
end
