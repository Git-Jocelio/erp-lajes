inherited frmCompras: TfrmCompras
  ClientHeight = 494
  ClientWidth = 1108
  ExplicitWidth = 1108
  ExplicitHeight = 494
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 1108
    Height = 88
    Caption = ''
    ExplicitWidth = 1108
    ExplicitHeight = 88
    inherited lbl_texto: TLabel
      Left = 879
      Top = 6
      Width = 148
      Caption = 'Selecione um Fornecedor'
      Visible = False
      ExplicitLeft = 879
      ExplicitTop = 6
      ExplicitWidth = 148
    end
    inherited btnLocalizar: TBitBtn
      Left = 994
      Top = 47
      Width = 103
      Cursor = crHandPoint
      ExplicitLeft = 994
      ExplicitTop = 47
      ExplicitWidth = 103
    end
    inherited edt_consulta: TEdit
      Left = 1059
      Top = 6
      Width = 25
      Visible = False
      ExplicitLeft = 1059
      ExplicitTop = 6
      ExplicitWidth = 25
    end
    object gb_fornecedor: TGroupBox
      Left = 2
      Top = 19
      Width = 505
      Height = 67
      Hint = 'MARQUE O CHECKBOX E SELECIONE UM FORNECEDOR'
      Align = alLeft
      Caption = '                              '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      object cb_fornecedor: TCheckBox
        Left = 6
        Top = 0
        Width = 91
        Height = 17
        Cursor = crHandPoint
        Caption = ' Fornecedor '
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object cbx_fornecedor: TDBLookupComboBox
        Left = 6
        Top = 28
        Width = 493
        Height = 25
        Cursor = crHandPoint
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        KeyField = 'ID'
        ListField = 'NOME'
        ListSource = ds_fornecedor
        ParentFont = False
        TabOrder = 1
      end
    end
    object gb_data_compra: TGroupBox
      Left = 507
      Top = 19
      Width = 296
      Height = 67
      Hint = 'MARQUE O CHECKBOX E INFORME UM PERIODO.'
      Align = alLeft
      Caption = '                                           '
      TabOrder = 3
      object Label1: TLabel
        Left = 136
        Top = 29
        Width = 18
        Height = 17
        Caption = 'at'#233
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8404992
        Font.Height = -13
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object cb_data_compra: TCheckBox
        Left = 11
        Top = 2
        Width = 174
        Height = 17
        Cursor = crHandPoint
        Caption = ' Data da Compra ( Cont'#225'bil )'
        DragCursor = crHandPoint
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object dtp_data_ini: TDateTimePicker
        Left = 24
        Top = 28
        Width = 97
        Height = 25
        Date = 45575.000000000000000000
        Time = 0.801080081015243200
        DragCursor = crHandPoint
        TabOrder = 1
      end
      object dtp_data_fim: TDateTimePicker
        Left = 160
        Top = 28
        Width = 97
        Height = 25
        Date = 45575.000000000000000000
        Time = 0.801080081015243200
        DragCursor = crHandPoint
        TabOrder = 2
      end
    end
    object rg_situacao: TRadioGroup
      Left = 803
      Top = 19
      Width = 185
      Height = 67
      Cursor = crHandPoint
      Hint = 'INFORME A SITUA'#199#195'O DO PEDIDO'
      Align = alLeft
      Caption = '  Situa'#231#227'o  '
      Columns = 2
      Items.Strings = (
        'Aberto'
        'Entregue'
        'Todos')
      TabOrder = 4
    end
  end
  inherited ToolBar1: TToolBar
    Width = 1108
    ExplicitWidth = 1108
  end
  inherited StatusBar: TStatusBar
    Top = 462
    Width = 1108
    ExplicitTop = 462
    ExplicitWidth = 1108
  end
  inherited PageControl1: TPageControl
    Top = 193
    Width = 1108
    Height = 269
    ExplicitTop = 193
    ExplicitWidth = 1108
    ExplicitHeight = 269
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 1100
      ExplicitHeight = 259
      inherited Panel5: TPanel
        Width = 1100
        Height = 259
        ExplicitWidth = 1100
        ExplicitHeight = 259
        inherited DBGrid1: TDBGrid
          Width = 1060
          Height = 208
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'COMPRAS_ID'
              Title.Alignment = taCenter
              Width = 103
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_CONTABIL'
              Title.Alignment = taCenter
              Title.Caption = 'Data'
              Width = 95
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'FORNECEDOR_ID'
              Title.Alignment = taCenter
              Title.Caption = 'Cod Fornecedor'
              Width = 85
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome do Fornecedor'
              Width = 325
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMERO_DOCUMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Nr Documento'
              Width = 117
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ABERTO_ENTREGUE'
              Title.Alignment = taCenter
              Title.Caption = 'Situa'#231#227'o'
              Width = 95
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_COMPRA'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Compra'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RECEBEMOS_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Recebemos em'
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 1060
          ExplicitWidth = 1060
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 1108
    ExplicitWidth = 1108
    inherited btn_fechar: TSpeedButton
      Left = 1038
      ExplicitLeft = 981
    end
    inherited lbl_titulo: TLabel
      Width = 243
      Height = 56
      Caption = 'CONTROLE DE COMPRAS'
      ExplicitWidth = 243
    end
    inherited pnl_separa_topo: TPanel
      Width = 1108
      ExplicitWidth = 1108
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select'
      '    C.COMPRAS_ID,'
      '    C.DATA_CONTABIL     ,'
      '    C.NUMERO_DOCUMENTO  ,'
      '    C.ABERTO_ENTREGUE   ,'
      '    C.FORNECEDOR_ID     ,'
      '    P.NOME,'
      '    C.VALOR_COMPRA    ,'
      '    C.RECEBEMOS_EM'
      'from'
      '  PESSOAS P, COMPRAS C'
      'where'
      '  P.ID = C.FORNECEDOR_ID')
    Left = 632
    Top = 40
    object qryCOMPRAS_ID: TIntegerField
      FieldName = 'COMPRAS_ID'
      Origin = 'COMPRAS_ID'
      Required = True
    end
    object qryDATA_CONTABIL: TDateField
      FieldName = 'DATA_CONTABIL'
      Origin = 'DATA_CONTABIL'
    end
    object qryNUMERO_DOCUMENTO: TStringField
      FieldName = 'NUMERO_DOCUMENTO'
      Origin = 'NUMERO_DOCUMENTO'
      Size = 50
    end
    object qryABERTO_ENTREGUE: TStringField
      FieldName = 'ABERTO_ENTREGUE'
      Origin = 'ABERTO_ENTREGUE'
      OnGetText = qryABERTO_ENTREGUEGetText
      Size = 1
    end
    object qryFORNECEDOR_ID: TIntegerField
      FieldName = 'FORNECEDOR_ID'
      Origin = 'FORNECEDOR_ID'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryVALOR_COMPRA: TFMTBCDField
      FieldName = 'VALOR_COMPRA'
      Origin = 'VALOR_COMPRA'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qryRECEBEMOS_EM: TDateField
      FieldName = 'RECEBEMOS_EM'
      Origin = 'RECEBEMOS_EM'
    end
  end
  inherited ActionList1: TActionList
    inherited actImprimir: TAction
      OnExecute = actImprimirExecute
    end
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
  end
  object ds_fornecedor: TDataSource
    AutoEdit = False
    DataSet = qry_fornecedores
    Left = 664
    Top = 9
  end
  object qry_fornecedores: TFDQuery
    SQL.Strings = (
      'select '
      '  P.ID,'
      '  P.NOME'
      'from'
      ' PESSOAS P, FORNECEDORES F'
      'where '
      '  P.ID = F.PESSOA_ID'
      'order by '
      ' P. NOME')
    Left = 664
    Top = 40
  end
  object frx_rel_compras: TfrxReport
    Version = '2022.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45691.841388287000000000
    ReportOptions.LastChange = 45691.841388287000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Picture1OnAfterData(Sender: TfrxComponent);'
      'begin'
      
        '   picture1.Picture.LoadFromFile ( <imagem."REL_PEDIDO_IMG_TOPO"' +
        '>  );  '
      'end;'
      ''
      'begin'
      ''
      'end.')
    Left = 816
    Top = 8
    Datasets = <
      item
        DataSet = frxDBEmpresa
        DataSetName = 'Empresa'
      end
      item
        DataSet = frxDBImagem
        DataSetName = 'Imagem'
      end
      item
        DataSet = frxDBPesquisa
        DataSetName = 'Compras'
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
        Height = 37.795275590000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 57.031540000000000000
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
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 11.338590000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RELAT'#211'RIO DE COMPRAS - POR PERIODO')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 718.110236220472000000
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
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677167800000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Width = 90.708698030000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Recebido em:')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 100.708720000000000000
          Width = 102.047082990000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'N. Documento')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 638.842920000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Valor')
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
          Left = 207.756030000000000000
          Width = 400.630180000000000000
          Height = 15.118110240000000000
          DataSet = frxDBPesquisa
          DataSetName = 'Compras'
          Frame.Typ = []
          Memo.UTF8W = (
            'Fornecedor')
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
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        DataSet = frxDBPesquisa
        DataSetName = 'Compras'
        RowCount = 0
        object ContasPagarCADASTRADO_EM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          DataSet = frmContasPagar.frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[Compras."RECEBEMOS_EM"]')
          ParentFont = False
        end
        object ContasPagarNR_DOCUMENTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 76.724409450000000000
          Width = 102.047244090000000000
          Height = 15.118110240000000000
          DataSet = frmContasPagar.frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[Compras."NUMERO_DOCUMENTO"]')
          ParentFont = False
        end
        object ContasPagarDESCRICAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 183.307086610000000000
          Width = 343.937230000000000000
          Height = 15.118110240000000000
          DataSet = frmContasPagar.frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Compras."NOME"]')
          ParentFont = False
        end
        object ContasPagarTOTAL_PARCELA: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 629.212598430000000000
          Width = 86.929133860000000000
          Height = 15.118110240000000000
          DataSet = frmContasPagar.frxDBContasPagar
          DataSetName = 'ContasPagar'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Compras."VALOR_COMPRA"]')
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
        Height = 22.677180000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 629.291338580000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<COMPRAS."VALOR_COMPRA">,MasterData1)]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 532.913385830000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAL R$ ')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
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
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 377.953000000000000000
        Width = 718.110700000000000000
        object Memo27: TfrxMemoView
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
        object Memo4: TfrxMemoView
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
        object Memo5: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 610.165740000000000000
          Top = 3.779527559055120000
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
  object qryEmpresa: TFDQuery
    SQL.Strings = (
      
        'select P.*, E.*  from PESSOAS P, EMPRESA E where E.PESSOA_ID = P' +
        '.ID')
    Left = 889
    Top = 38
  end
  object qryImagemRelatorio: TFDQuery
    SQL.Strings = (
      'select rel_pedido_img_topo from configuracoes')
    Left = 916
    Top = 38
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'Empresa'
    CloseDataSource = False
    DataSet = qryEmpresa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 888
    Top = 8
  end
  object frxDBImagem: TfrxDBDataset
    UserName = 'Imagem'
    CloseDataSource = False
    DataSet = qryImagemRelatorio
    BCDToCurrency = False
    DataSetOptions = []
    Left = 920
    Top = 8
  end
  object frxDBPesquisa: TfrxDBDataset
    UserName = 'Compras'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    DataSetOptions = []
    Left = 952
    Top = 8
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
    Left = 528
    Top = 8
  end
end
