inherited frmFornecedores: TfrmFornecedores
  Caption = 'frmFornecedores'
  ClientHeight = 499
  ClientWidth = 991
  ExplicitWidth = 991
  ExplicitHeight = 499
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 991
    ExplicitWidth = 991
    inherited btnLocalizar: TBitBtn
      Top = 50
      ExplicitTop = 50
    end
    inherited edt_consulta: TEdit
      Width = 520
      ExplicitWidth = 520
    end
  end
  inherited ToolBar1: TToolBar
    Width = 991
    ExplicitWidth = 991
  end
  inherited StatusBar: TStatusBar
    Top = 467
    Width = 991
    ExplicitTop = 467
    ExplicitWidth = 991
  end
  inherited PageControl1: TPageControl
    Width = 991
    Height = 262
    ExplicitWidth = 991
    ExplicitHeight = 262
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 983
      ExplicitHeight = 252
      inherited Panel5: TPanel
        Width = 983
        Height = 252
        ExplicitWidth = 983
        ExplicitHeight = 252
        inherited DBGrid1: TDBGrid
          Width = 943
          Height = 201
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 58
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              ImeName = 'NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 425
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              ImeName = 'CPF_CNPJ'
              Title.Alignment = taCenter
              Title.Caption = 'CPF/CNPJ'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTATOS'
              Title.Alignment = taCenter
              Title.Caption = 'Contato'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 175
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONES_CONTATO'
              Title.Alignment = taCenter
              Title.Caption = 'Telefones'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 156
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUTOS'
              Title.Alignment = taCenter
              Title.Caption = 'Produtos'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ATIVO'
              Title.Alignment = taCenter
              Title.Caption = 'Ativo'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = False
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 943
          ExplicitWidth = 943
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 991
    ExplicitWidth = 991
    inherited btn_fechar: TSpeedButton
      Left = 921
      ExplicitLeft = 844
    end
    inherited lbl_titulo: TLabel
      Width = 299
      Height = 56
      Caption = 'CONSULTA DE FORNECEDORES'
      ExplicitWidth = 299
    end
    inherited pnl_separa_topo: TPanel
      Width = 991
      ExplicitWidth = 991
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select '
      '   P.*,'
      '   F.*'
      'from  '
      '   PESSOAS P, FORNECEDORES F'
      'where'
      '   P.ID = F.PESSOA_ID')
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
    object qryCONTATOS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CONTATOS'
      Origin = 'CONTATOS'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryTELEFONES_CONTATO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'TELEFONES_CONTATO'
      Origin = 'TELEFONES_CONTATO'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryPRODUTOS: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTOS'
      Origin = 'PRODUTOS'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object qryRAMO_ATIVIDADE: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'RAMO_ATIVIDADE'
      Origin = 'RAMO_ATIVIDADE'
      ProviderFlags = []
      ReadOnly = True
      Size = 25
    end
    object qryATIVO_1: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'ATIVO_1'
      Origin = 'ATIVO'
      ProviderFlags = []
      ReadOnly = True
      Size = 1
    end
  end
  inherited ImageList1: TImageList
    Left = 744
  end
  inherited ActionList1: TActionList
    Left = 712
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
        DataSet = frxDBFornecedores
        DataSetName = 'Fornecedores'
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
            'RELAT'#211'RIO DE FORNECEDORES')
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
        DataSetName = 'Fornecedores'
        RowCount = 0
        object FornecedoresCPF_CNPJ: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 557.000000000000000000
          Top = 5.559060000000000000
          Width = 143.622140000000000000
          Height = 15.118110240000000000
          DataField = 'CPF_CNPJ'
          DataSet = frxDBFornecedores
          DataSetName = 'Fornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Fornecedores."CPF_CNPJ"]')
          ParentFont = False
        end
        object FornecedoresNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 78.558750000000000000
          Top = 5.559060000000000000
          Width = 400.630180000000000000
          Height = 15.118110240000000000
          DataField = 'NOME'
          DataSet = frxDBFornecedores
          DataSetName = 'Fornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Fornecedores."NOME"]')
          ParentFont = False
        end
        object FornecedoresTELEFONES_CONTATO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 59.558750000000000000
          Top = 48.015770000000000000
          Width = 264.567100000000000000
          Height = 15.118110240000000000
          DataSet = frxDBFornecedores
          DataSetName = 'Fornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Fornecedores."TELEFONES_CONTATO"]')
          ParentFont = False
        end
        object FornecedoresCONTATOS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 425.936920000000000000
          Top = 48.015770000000000000
          Width = 219.212740000000000000
          Height = 15.118110240000000000
          DataSet = frxDBFornecedores
          DataSetName = 'Fornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Contato : [Fornecedores."CONTATOS"]')
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
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 48.015770000000000000
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
          Left = 517.747990000000000000
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
          DataSet = frxDBFornecedores
          DataSetName = 'Fornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Fornecedores."ENDERECO"], [Fornecedores."NUMERO"], [Fornecedore' +
              's."BAIRRO"], CIDADE [Fornecedores."CIDADE"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end
            item
            end
            item
            end>
        end
        object Memo7: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 108.558750000000000000
          Top = 68.031540000000000000
          Width = 264.567100000000000000
          Height = 15.118110240000000000
          DataSet = frxDBFornecedores
          DataSetName = 'Fornecedores'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Fornecedores."DATA_CAD"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 68.031540000000000000
          Width = 102.047310000000000000
          Height = 15.118110240000000000
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Cadastrado em :')
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
    UserName = 'Fornecedores'
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
