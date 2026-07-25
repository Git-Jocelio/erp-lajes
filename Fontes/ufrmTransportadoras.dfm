inherited frmTransportadoras: TfrmTransportadoras
  Caption = 'frmTransportadoras'
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    inherited btnLocalizar: TBitBtn
      Top = 48
      Visible = False
      ExplicitTop = 48
    end
  end
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited Panel5: TPanel
        inherited DBGrid1: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 328
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Alignment = taCenter
              Title.Caption = 'CPF / CNPJ'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 157
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Alignment = taCenter
              Title.Caption = 'Telefone'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 119
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CELULAR'
              Title.Alignment = taCenter
              Title.Caption = 'Celular'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 125
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Title.Alignment = taCenter
              Title.Caption = 'Ativo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    inherited lbl_titulo: TLabel
      Width = 342
      Height = 56
      Caption = 'CONSULTA DE TRANSPORTADORAS'
      ExplicitWidth = 342
    end
  end
  inherited ds: TDataSource
    Top = 24
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select '
      '  P.* '
      'from TRANSPORTADORAS T, PESSOAS P '
      'where P.ID = T.PESSOA_ID ')
    Top = 24
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryTELEFONE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      ProviderFlags = []
      ReadOnly = True
      Size = 13
    end
    object qryCELULAR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CELULAR'
      Origin = 'CELULAR'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object qryATIVO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      ProviderFlags = []
      ReadOnly = True
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
    Left = 720
    Top = 24
  end
  inherited ActionList1: TActionList
    Left = 752
    Top = 24
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
    Left = 552
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
    Left = 600
    Top = 8
    Datasets = <
      item
        DataSet = frxDBFornecedores
        DataSetName = 'Transpotadoras'
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
            'RELAT'#211'RIO DE TRANSPORTADORAS')
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
        DataSet = frxDBFornecedores
        DataSetName = 'Transpotadoras'
        RowCount = 0
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779527560000000000
          Width = 98.267780000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Transportadora :')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 47.015770000000000000
          Width = 52.913420000000000000
          Height = 15.118110240000000000
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
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 523.747990000000000000
          Top = 3.779527559055118000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CNPJ :')
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
          Top = 24.456710000000000000
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
        object TranspotadorasDATA_CAD: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 2.629560000000000000
          Top = 68.031540000000000000
          Width = 298.582870000000000000
          Height = 18.897650000000000000
          DataSet = frxDBFornecedores
          DataSetName = 'Transpotadoras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cadastrado em : [Transpotadoras."DATA_CAD"]')
          ParentFont = False
        end
        object TranspotadorasNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 95.440630000000000000
          Top = 3.779530000000000000
          Width = 400.630180000000000000
          Height = 18.897650000000000000
          DataField = 'NOME'
          DataSet = frxDBFornecedores
          DataSetName = 'Transpotadoras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Transpotadoras."NOME"]')
          ParentFont = False
        end
        object TranspotadorasCPF_CNPJ: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 562.000000000000000000
          Top = 3.779527559055118000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'CPF_CNPJ'
          DataSet = frxDBFornecedores
          DataSetName = 'Transpotadoras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Transpotadoras."CPF_CNPJ"]')
          ParentFont = False
        end
        object TranspotadorasENDERECO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 44.204390000000000000
          Top = 22.677180000000000000
          Width = 551.811380000000000000
          Height = 18.897650000000000000
          DataSet = frxDBFornecedores
          DataSetName = 'Transpotadoras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Transpotadoras."ENDERECO"], [Transpotadoras."NUMERO"], [Transpo' +
              'tadoras."BAIRRO"], [Transpotadoras."CIDADE"]')
          ParentFont = False
        end
        object TranspotadorasCELULAR: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 59.322510000000000000
          Top = 45.354360000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          DataField = 'CELULAR'
          DataSet = frxDBFornecedores
          DataSetName = 'Transpotadoras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Transpotadoras."CELULAR"]')
          ParentFont = False
        end
        object TranspotadorasTELEFONE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 177.267470000000000000
          Top = 43.574830000000000000
          Width = 105.826840000000000000
          Height = 18.897650000000000000
          DataField = 'TELEFONE'
          DataSet = frxDBFornecedores
          DataSetName = 'Transpotadoras'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Transpotadoras."TELEFONE"]')
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
  object frxDBFornecedores: TfrxDBDataset
    UserName = 'Transpotadoras'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    DataSetOptions = []
    Left = 600
    Top = 40
  end
end
