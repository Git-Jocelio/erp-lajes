inherited frmProducaoTelasPesquisa: TfrmProducaoTelasPesquisa
  Caption = ''
  ClientHeight = 266
  ClientWidth = 524
  ExplicitWidth = 536
  ExplicitHeight = 304
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 524
    ExplicitWidth = 534
    inherited lbl_titulo: TLabel
      Width = 524
      Height = 40
      Caption = 'PRODU'#199#195'O DE TELAS'
      ExplicitWidth = 209
    end
    inherited lbl_sub_titulo: TLabel
      Width = 524
      Caption = 'Informe os parametros e confirme os dados '
      ExplicitWidth = 264
    end
  end
  inherited pnDados: TPanel
    Width = 524
    Height = 172
    ExplicitLeft = -8
    ExplicitTop = 52
    ExplicitWidth = 684
    ExplicitHeight = 237
    object Label3: TLabel
      Left = 16
      Top = 48
      Width = 200
      Height = 17
      Caption = 'Selecione a tela que foi produzida'
    end
    object Label4: TLabel
      Left = 16
      Top = 111
      Width = 99
      Height = 17
      Caption = 'Qtde Produzida :'
    end
    object Label6: TLabel
      Left = 360
      Top = 48
      Width = 49
      Height = 17
      Caption = 'Unidade'
    end
    object Label1: TLabel
      Left = 444
      Top = 48
      Width = 74
      Height = 17
      Caption = 'Peso da Tela'
    end
    object edt_qtde_tela: TEdit
      Left = 16
      Top = 134
      Width = 99
      Height = 25
      NumbersOnly = True
      TabOrder = 1
    end
    object cbx_tipo_tela: TDBLookupComboBox
      Left = 16
      Top = 71
      Width = 337
      Height = 25
      KeyField = 'ID'
      ListField = 'NOME_FANTASIA'
      ListSource = ds
      TabOrder = 0
    end
    object edt_quantidade_tela: TDBEdit
      Left = 360
      Top = 71
      Width = 74
      Height = 25
      DataField = 'UNIDADE'
      DataSource = ds
      Enabled = False
      TabOrder = 2
    end
    object DBEdit1: TDBEdit
      Left = 444
      Top = 71
      Width = 74
      Height = 25
      DataField = 'PESO'
      DataSource = ds
      Enabled = False
      TabOrder = 3
    end
  end
  inherited pnRodape: TPanel
    Top = 229
    Width = 524
    ExplicitTop = 183
    ExplicitWidth = 534
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      
        'select p.id, p.nome_fantasia, p.unidade, p.peso from produtos p,' +
        ' departamentos d'
      'where  p.departamento_id = d.id and d.id = 2'
      'order by p.nome_fantasia')
    Left = 416
    Top = 56
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
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
    object qryPESO: TCurrencyField
      FieldName = 'PESO'
      Origin = 'PESO'
      DisplayFormat = '0.00'
    end
  end
  inherited ds: TDataSource
    AutoEdit = False
    Left = 416
    Top = 25
  end
end
