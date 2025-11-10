inherited frmPedididosFerragensE: TfrmPedididosFerragensE
  Caption = 'frmPedidosFerragensE'
  ClientHeight = 317
  ClientWidth = 529
  ExplicitWidth = 541
  ExplicitHeight = 355
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 529
    ExplicitWidth = 525
    inherited lbl_titulo: TLabel
      Width = 529
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 529
    end
  end
  inherited pnDados: TPanel
    Width = 529
    Height = 226
    ExplicitWidth = 525
    ExplicitHeight = 225
    object gbDobras: TGroupBox
      Left = 0
      Top = 112
      Width = 529
      Height = 80
      Align = alTop
      Caption = ' Dobras '
      TabOrder = 0
      ExplicitWidth = 525
      object Label2: TLabel
        Left = 16
        Top = 22
        Width = 41
        Height = 17
        Caption = 'Corpo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 72
        Top = 23
        Width = 34
        Height = 17
        Caption = ' Inicio'
      end
      object Label7: TLabel
        Left = 146
        Top = 23
        Width = 26
        Height = 17
        Caption = 'Final'
      end
      object Label8: TLabel
        Left = 221
        Top = 23
        Width = 108
        Height = 17
        Caption = 'Comprimento final'
      end
      object lbPosicao: TLabel
        Left = 344
        Top = 23
        Width = 45
        Height = 17
        Caption = 'Posi'#231#227'o'
      end
      object edCorpo: TEdit
        Left = 16
        Top = 40
        Width = 46
        Height = 25
        MaxLength = 5
        TabOrder = 0
        Text = '0'
        OnEnter = edCorpoEnter
        OnExit = edCorpoExit
      end
      object edComprimento: TEdit
        Left = 221
        Top = 40
        Width = 108
        Height = 25
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        MaxLength = 5
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Text = '0'
      end
      object edInicio: TComboBox
        Left = 76
        Top = 40
        Width = 51
        Height = 25
        TabOrder = 2
        OnChange = edInicioChange
        Items.Strings = (
          '0'
          '0,05'
          '0,10'
          '0,15'
          '0,20'
          '0,25'
          '0,30'
          '0,35'
          '0,40'
          '0,45'
          '0,50')
      end
      object edFinal: TComboBox
        Left = 146
        Top = 40
        Width = 51
        Height = 25
        TabOrder = 3
        OnChange = edFinalChange
        Items.Strings = (
          '0'
          '0,05'
          '0,10'
          '0,15'
          '0,20'
          '0,25'
          '0,30'
          '0,35'
          '0,40'
          '0,45'
          '0,50')
      end
      object cbxPosicao: TComboBox
        Left = 344
        Top = 40
        Width = 173
        Height = 25
        TabOrder = 4
        Items.Strings = (
          ''
          'Posicionar no INICIO'
          'Posicionar no MEIO')
      end
    end
    object gbVergalhao: TGroupBox
      Left = 0
      Top = 0
      Width = 529
      Height = 112
      Align = alTop
      Caption = ' Descri'#231#227'o '
      TabOrder = 1
      ExplicitWidth = 525
      object Label9: TLabel
        Left = 12
        Top = 55
        Width = 29
        Height = 17
        Caption = 'Qtde'
      end
      object Label3: TLabel
        Left = 89
        Top = 55
        Width = 73
        Height = 17
        Caption = 'Custo Metro'
      end
      object Label4: TLabel
        Left = 286
        Top = 55
        Width = 73
        Height = 17
        Caption = 'Pre'#231'o Venda'
      end
      object DBText1: TDBText
        Left = 12
        Top = 29
        Width = 56
        Height = 17
        DataField = 'ID'
        DataSource = dsFerros
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 176
        Top = 55
        Width = 94
        Height = 17
        Caption = 'Pre'#231'o Vendedor'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 25
        Width = 68
        Height = 25
      end
      object cbxFerro: TDBLookupComboBox
        Left = 76
        Top = 24
        Width = 441
        Height = 27
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Times New Roman'
        Font.Style = []
        KeyField = 'ID'
        ListField = 'NOME_FANTASIA'
        ListSource = dsFerros
        ParentFont = False
        TabOrder = 0
      end
      object edQtde: TEdit
        Left = 12
        Top = 75
        Width = 67
        Height = 25
        MaxLength = 5
        NumbersOnly = True
        TabOrder = 1
      end
      object edCustoLiquido: TEdit
        Left = 89
        Top = 75
        Width = 75
        Height = 25
        Enabled = False
        MaxLength = 5
        ReadOnly = True
        TabOrder = 2
      end
      object edVendaMetro: TEdit
        Left = 286
        Top = 75
        Width = 75
        Height = 25
        MaxLength = 5
        TabOrder = 3
      end
      object edCustoFornecedor: TEdit
        Left = 176
        Top = 75
        Width = 75
        Height = 25
        MaxLength = 5
        TabOrder = 4
      end
    end
  end
  inherited pnRodape: TPanel
    Top = 283
    Width = 529
    Height = 34
    ExplicitTop = 282
    ExplicitWidth = 525
    ExplicitHeight = 34
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    Left = 40
    Top = 8
  end
  inherited ds: TDataSource
    Left = 8
    Top = 9
  end
  object qryFerros: TFDQuery
    SQL.Strings = (
      'select'
      '  ID,'
      '  NOME_FANTASIA,'
      '  PRECO_CUSTO,'
      '  PRECO_VENDA,'
      '  CUSTO_BRUTO'
      'from'
      '  PRODUTOS'
      'where'
      '  VERGALHAO = '#39'S'#39)
    Left = 377
    Top = 106
  end
  object dsFerros: TDataSource
    AutoEdit = False
    DataSet = qryFerros
    OnDataChange = dsFerrosDataChange
    Left = 417
    Top = 106
  end
end
