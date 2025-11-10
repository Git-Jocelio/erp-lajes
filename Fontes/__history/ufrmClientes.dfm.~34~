inherited frmClientes: TfrmClientes
  Caption = 'frmClientes'
  ClientHeight = 361
  ClientWidth = 915
  PrintScale = poNone
  ExplicitWidth = 915
  ExplicitHeight = 361
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 915
    Height = 110
    ExplicitWidth = 915
    ExplicitHeight = 110
    inherited btnLocalizar: TBitBtn
      Top = 50
      Cursor = crHandPoint
      ExplicitTop = 50
    end
  end
  inherited ToolBar1: TToolBar
    Width = 915
    ExplicitWidth = 915
    inherited btnIncluir: TToolButton
      Cursor = crHandPoint
    end
    inherited btnAlterar: TToolButton
      Cursor = crHandPoint
    end
    inherited btnExcluir: TToolButton
      Cursor = crHandPoint
    end
    inherited btnPesquisar: TToolButton
      Cursor = crHandPoint
    end
    inherited btnImprimir: TToolButton
      Cursor = crHandPoint
    end
  end
  inherited StatusBar: TStatusBar
    Top = 329
    Width = 915
    ExplicitTop = 329
    ExplicitWidth = 915
  end
  inherited PageControl1: TPageControl
    Top = 215
    Width = 915
    Height = 114
    ExplicitTop = 215
    ExplicitWidth = 915
    ExplicitHeight = 114
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 907
      ExplicitHeight = 104
      inherited Panel5: TPanel
        Width = 907
        Height = 104
        ExplicitWidth = 907
        ExplicitHeight = 104
        inherited DBGrid1: TDBGrid
          Width = 867
          Height = 53
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 45
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
              Width = 317
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
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 135
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Alignment = taCenter
              Title.Caption = 'Telefone'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 84
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CELULAR'
              Title.Alignment = taCenter
              Title.Caption = 'Celular'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 92
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
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 867
          ExplicitWidth = 867
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 915
    ExplicitWidth = 915
    inherited btn_fechar: TSpeedButton
      Left = 845
      ExplicitLeft = 845
    end
    inherited lbl_titulo: TLabel
      Width = 232
      Height = 56
      Caption = 'CONSULTA DE CLIENTES'
      ExplicitWidth = 232
    end
    inherited pnl_separa_topo: TPanel
      Width = 915
      ExplicitWidth = 915
    end
  end
  inherited ds: TDataSource
    Left = 768
    Top = 104
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select '
      '      C.ID, P.CPF_CNPJ, P.NOME, P.TELEFONE, P.CELULAR, P.ATIVO'
      'from '
      '   clientes C, PESSOAS P '
      ' where '
      '   P.ID = C.PESSOA_ID')
    Left = 768
    Top = 136
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCPF_CNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 18
    end
    object qryNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
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
  end
  inherited ImageList1: TImageList
    Left = 816
    Top = 0
  end
  inherited ActionList1: TActionList
    Left = 760
    Top = 0
  end
end
