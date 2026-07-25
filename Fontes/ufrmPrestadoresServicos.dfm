inherited frmPrestadoresServicos: TfrmPrestadoresServicos
  ClientWidth = 1047
  Position = poDesktopCenter
  ExplicitWidth = 1047
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 1047
    ExplicitWidth = 1047
    inherited btnLocalizar: TBitBtn
      Top = 50
      Visible = False
      ExplicitTop = 50
    end
  end
  inherited ToolBar1: TToolBar
    Width = 1047
    ExplicitWidth = 1047
  end
  inherited StatusBar: TStatusBar
    Width = 1047
    ExplicitWidth = 1047
  end
  inherited PageControl1: TPageControl
    Width = 1047
    ExplicitWidth = 1047
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 1039
      inherited Panel5: TPanel
        Width = 1039
        ExplicitWidth = 1039
        inherited DBGrid1: TDBGrid
          Width = 999
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Width = 520
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTATO'
              Width = 223
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CELULAR'
              Width = 215
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 999
          ExplicitWidth = 999
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 1047
    ExplicitWidth = 1047
    inherited btn_fechar: TSpeedButton
      Left = 977
      ExplicitLeft = 977
    end
    inherited lbl_titulo: TLabel
      Width = 268
      Height = 56
      Caption = 'PRESTADORES DE SERVI'#199'OS'
      ExplicitWidth = 268
    end
    inherited pnl_separa_topo: TPanel
      Width = 1047
      ExplicitWidth = 1047
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      ' select'
      '   P.*,  S.*'
      ' from'
      '   PESSOAS P, PRESTADORES_SERVICOS S'
      ' where'
      '   P.ID = S.PESSOA_ID')
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
    object qryCONTATO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTATO'
      Origin = 'CONTATO'
      ProviderFlags = []
      ReadOnly = True
      Size = 60
    end
    object qryCELULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
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
    object qryATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
    object qryDATA_ALT: TDateField
      FieldName = 'DATA_ALT'
      Origin = 'DATA_ALT'
    end
    object qryID_1: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'ID_1'
      Origin = 'ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryPESSOA_ID: TIntegerField
      AutoGenerateValue = arDefault
      FieldName = 'PESSOA_ID'
      Origin = 'PESSOA_ID'
      ProviderFlags = []
      ReadOnly = True
    end
    object qryDESCRICAO_SERVICO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'DESCRICAO_SERVICO'
      Origin = 'DESCRICAO_SERVICO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryATIVO_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO_1'
      Origin = 'ATIVO'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
    object qryCELULAR_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULAR_1'
      Origin = 'CELULAR'
      ProviderFlags = []
      ReadOnly = True
    end
  end
  inherited ActionList1: TActionList
    inherited actImprimir: TAction
      OnExecute = actImprimirExecute
    end
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
    Left = 720
    Top = 8
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
    Left = 752
    Top = 8
    Datasets = <
      item
        DataSet = frxDBVendedores
        DataSetName = 'Prestador'
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
          Left = 158.740260000000000000
          Top = 3.779530000000000000
          Width = 433.495980000000000000
          Height = 30.236240000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RELAT'#211'RIO DE PRESTADORES DE SERVI'#199'O')
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
        DataSetName = 'Prestador'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 5.559060000000000000
          Width = 45.354360000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome :')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 489.732220000000000000
          Top = 5.559060000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF/CNPJ  :')
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
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 66.133890000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
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
        object PrestadorNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 51.542980000000000000
          Top = 5.559060000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Prestador."NOME"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 44.354360000000000000
          Top = 25.456710000000000000
          Width = 653.708720000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Prestador."ENDERECO"], [Prestador."NUMERO"], [Prestador."BAIRRO' +
              '"], [Prestador."CIDADE"], [Prestador."UF"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 71.811070000000000000
          Top = 43.574830000000000000
          Width = 260.787570000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Prestador."TELEFONE"], [Prestador."CELULAR"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 78.220160000000000000
          Top = 66.252010000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Prestador."DATA_CAD"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 562.000000000000000000
          Top = 4.559060000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Prestador."CPF_CNPJ"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 268.346630000000000000
          Top = 67.031540000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Servi'#231'os Prestados :')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 391.921150000000000000
          Top = 67.149660000000000000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataSet = frxDBVendedores
          DataSetName = 'Prestador'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Prestador."DESCRICAO_SERVICO"]')
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
    UserName = 'Prestador'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    DataSetOptions = []
    Left = 752
    Top = 40
  end
end
