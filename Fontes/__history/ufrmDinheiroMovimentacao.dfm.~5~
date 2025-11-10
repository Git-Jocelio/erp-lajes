inherited frmDinheiroMovimentacao: TfrmDinheiroMovimentacao
  Caption = 'frmDinheiroMovimentacao'
  Position = poDesktopCenter
  OnActivate = FormActivate
  TextHeight = 15
  inherited ToolBar1: TToolBar
    ButtonWidth = 103
    inherited btnIncluir: TToolButton
      Caption = '  Nova Entrada  '
      ExplicitWidth = 103
    end
    inherited btnAlterar: TToolButton
      Left = 103
      ExplicitLeft = 103
      ExplicitWidth = 103
    end
    inherited btnExcluir: TToolButton
      Left = 206
      ExplicitLeft = 206
      ExplicitWidth = 103
    end
    inherited ToolButton4: TToolButton
      Left = 309
      ExplicitLeft = 309
    end
    inherited btnPesquisar: TToolButton
      Left = 314
      ExplicitLeft = 314
      ExplicitWidth = 103
    end
    inherited ToolButton7: TToolButton
      Left = 417
      ExplicitLeft = 417
    end
    inherited btnImprimir: TToolButton
      Left = 422
      ExplicitLeft = 422
      ExplicitWidth = 103
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
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CADASTRADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Cadastrado em'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HISTORICO'
              Title.Alignment = taCenter
              Title.Caption = 'Hist'#243'rico'
              Width = 413
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Title.Alignment = taCenter
              Title.Caption = 'Entrada'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SAIDA'
              Title.Alignment = taCenter
              Title.Caption = 'Saida'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SALDO'
              Title.Alignment = taCenter
              Title.Caption = 'Saldo'
              Width = 80
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
      Width = 410
      Height = 56
      Caption = 'MOVIMENTACAO DO CAIXA EM DINHEIRO'
      ExplicitWidth = 410
    end
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select'
      '  id,'
      '  cadastrado_em,'
      '  historico,'
      '  entrada,'
      '  saida,'
      '  saldo'
      'from'
      '  dinheiro_movimentacao'
      'order by'
      '  id')
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryCADASTRADO_EM: TDateField
      FieldName = 'CADASTRADO_EM'
      Origin = 'CADASTRADO_EM'
    end
    object qryHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 100
    end
    object qryENTRADA: TFMTBCDField
      FieldName = 'ENTRADA'
      Origin = 'ENTRADA'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qrySAIDA: TFMTBCDField
      FieldName = 'SAIDA'
      Origin = 'SAIDA'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qrySALDO: TFMTBCDField
      FieldName = 'SALDO'
      Origin = 'SALDO'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
  end
  inherited ActionList1: TActionList
    inherited actIncluir: TAction
      Caption = 'Nova Entrada'
    end
    inherited actAlterar: TAction
      Caption = 'Nova Saida'
    end
  end
end
