inherited frmVendedores: TfrmVendedores
  Caption = 'frmVendedores'
  ClientHeight = 445
  ClientWidth = 918
  ExplicitWidth = 918
  ExplicitHeight = 445
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 918
    Height = 113
    ExplicitWidth = 918
    ExplicitHeight = 113
    inherited btnLocalizar: TBitBtn
      Top = 48
      Visible = False
      ExplicitTop = 48
    end
  end
  inherited ToolBar1: TToolBar
    Width = 918
    ExplicitWidth = 918
  end
  inherited StatusBar: TStatusBar
    Top = 413
    Width = 918
    ExplicitTop = 413
    ExplicitWidth = 918
  end
  inherited PageControl1: TPageControl
    Top = 218
    Width = 918
    Height = 195
    ExplicitTop = 218
    ExplicitWidth = 918
    ExplicitHeight = 195
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 910
      ExplicitHeight = 185
      inherited Panel5: TPanel
        Width = 910
        Height = 185
        ExplicitWidth = 910
        ExplicitHeight = 185
        inherited DBGrid1: TDBGrid
          Width = 870
          Height = 134
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Caption = 'C'#243'digo'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 311
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Alignment = taCenter
              Title.Caption = 'CPF / CNPJ'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 146
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMISSAO_VENDEDOR'
              Title.Alignment = taCenter
              Title.Caption = 'Comiss'#227'o sobre o lucro (%)'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 170
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMISSAO_ADM'
              Title.Alignment = taCenter
              Title.Caption = 'Comiss'#227'o ADM'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -13
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 116
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
              Title.Font.Height = -13
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 49
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 870
          ExplicitWidth = 870
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 918
    ExplicitWidth = 918
    inherited btn_fechar: TSpeedButton
      Left = 848
      ExplicitLeft = 848
    end
    inherited lbl_titulo: TLabel
      Width = 274
      Height = 56
      Caption = 'CONSULTA DE VENDEDORES'
      ExplicitWidth = 274
    end
    inherited pnl_separa_topo: TPanel
      Width = 918
      ExplicitWidth = 918
    end
  end
  inherited ds: TDataSource
    Left = 48
    Top = 312
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select '
      '  P.* , V.COMISSAO_VENDEDOR, V.COMISSAO_ADM '
      'FROM '
      '  PESSOAS P,  vendedores V'
      'where '
      '  p.id = v.pessoa_id  ')
    Left = 48
    Top = 280
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object qryCOMISSAO_VENDEDOR: TFMTBCDField
      Alignment = taCenter
      FieldName = 'COMISSAO_VENDEDOR'
      Origin = 'COMISSAO_VENDEDOR'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qryCOMISSAO_ADM: TFMTBCDField
      Alignment = taCenter
      FieldName = 'COMISSAO_ADM'
      Origin = 'COMISSAO_ADM'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qryATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryRG_IE: TStringField
      FieldName = 'RG_IE'
      Origin = 'RG_IE'
      Size = 15
    end
    object qryENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object qryNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
      Origin = 'COMPLEMENTO'
      Size = 60
    end
    object qryBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object qryCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object qryUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
    object qryTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 13
    end
    object qryCELULAR: TStringField
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      Size = 14
    end
    object qryDATA_CAD: TDateField
      FieldName = 'DATA_CAD'
      Origin = 'DATA_CAD'
    end
    object qryEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 60
    end
    object qryFIS_JUR: TStringField
      FieldName = 'FIS_JUR'
      Origin = 'FIS_JUR'
      Size = 1
    end
    object qryDATA_ALT: TDateField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
  end
  inherited ImageList1: TImageList
    Left = 768
    Top = 64
  end
  inherited ActionList1: TActionList
    Left = 736
    Top = 64
    inherited actImprimir: TAction
      OnExecute = actImprimirExecute
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
    ReportOptions.CreateDate = 46225.817527175900000000
    ReportOptions.LastChange = 46225.817527175900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 600
    Top = 8
    Datasets = <
      item
        DataSet = frxDBVendedores
        DataSetName = 'Vendedores'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      VGuides.Strings = (
        '562')
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795300000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object lblTitulo: TfrxMemoView
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 3.779530000000000000
          Width = 343.937230000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RELAT'#211'RIO DE VENDEDORES')
          ParentFont = False
        end
        object Line: TfrxMemoView
          AllowVectorExport = True
          Top = 34.346630000000000000
          Width = 718.110236220472000000
          Height = 3.779527559055120000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
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
        Height = 90.708720000000000000
        Top = 117.165430000000000000
        Width = 718.110700000000000000
        DataSet = frxDBVendedores
        DataSetName = 'Vendedores'
        RowCount = 0
        object FornecedoresCPF_CNPJ: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 557.000000000000000000
          Top = 5.559060000000000000
          Width = 143.622140000000000000
          Height = 15.118110240000000000
          DataField = 'CPF_CNPJ'
          DataSet = frxDBVendedores
          DataSetName = 'Vendedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vendedores."CPF_CNPJ"]')
          ParentFont = False
        end
        object FornecedoresNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 78.558750000000000000
          Top = 5.559060000000000000
          Width = 400.630180000000000000
          Height = 15.118110240000000000
          DataSet = frxDBVendedores
          DataSetName = 'Vendedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vendedores."NOME"]')
          ParentFont = False
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 5.559060000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fornecedor :')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 523.747990000000000000
          Top = 5.559060000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF  :')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Top = 84.811070000000000000
          Width = 718.110236220000000000
          Height = 3.779527560000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftBottom]
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 26.456710000000000000
          Width = 37.795300000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'End. :')
          ParentFont = False
        end
        object FornecedoresENDERECO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 43.763450000000000000
          Top = 26.456710000000000000
          Width = 658.858690000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Vendedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Vendedores."ENDERECO"], [Vendedores."NUMERO"], [Vendedores."BAI' +
              'RRO"], [Vendedores."CIDADE"], [Vendedores."UF"], ')
          ParentFont = False
        end
        object VendedoresCOMISSAO_VENDEDOR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 79.235930000000000000
          Top = 66.133890000000000000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          DataField = 'DATA_CAD'
          DataSet = frxDBVendedores
          DataSetName = 'Vendedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vendedores."DATA_CAD"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 66.133890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Vendedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Castrado em :')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 45.133890000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Contato :')
          ParentFont = False
        end
        object VendedoresCELULAR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 180.606060000000000000
          Top = 44.354360000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'CELULAR'
          DataSet = frxDBVendedores
          DataSetName = 'Vendedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vendedores."CELULAR"]')
          ParentFont = False
        end
        object VendedoresTELEFONE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 71.220160000000000000
          Top = 44.354360000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'TELEFONE'
          DataSet = frxDBVendedores
          DataSetName = 'Vendedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vendedores."TELEFONE"]')
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
        Height = 26.456710000000000000
        Top = 268.346630000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 713.181200000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          Memo.UTF8W = (
            '[Date]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBVendedores: TfrxDBDataset
    UserName = 'Vendedores'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    DataSetOptions = []
    Left = 600
    Top = 40
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
    Left = 552
    Top = 8
  end
end
