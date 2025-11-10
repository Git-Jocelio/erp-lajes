inherited frmCartaoMaquinas: TfrmCartaoMaquinas
  Caption = 'frmCartaoMaquinas'
  ClientWidth = 784
  Position = poDesktopCenter
  ExplicitWidth = 784
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 784
    ExplicitWidth = 1294
    inherited btnLocalizar: TBitBtn
      Top = 50
      ExplicitTop = 50
    end
    inherited edt_consulta: TEdit
      Width = 0
    end
  end
  inherited ToolBar1: TToolBar
    Width = 784
    ExplicitWidth = 1294
  end
  inherited StatusBar: TStatusBar
    Width = 784
    ExplicitWidth = 1294
  end
  inherited PageControl1: TPageControl
    Width = 784
    ExplicitWidth = 1294
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 776
      inherited Panel5: TPanel
        Width = 776
        ExplicitWidth = 1286
        inherited DBGrid1: TDBGrid
          Width = 736
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CADASTRADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Cadastrado em'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 101
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ALTERADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Alterado em'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = -1
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NM_OPERADORA'
              Title.Alignment = taCenter
              Title.Caption = 'Operadora'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 102
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Dono da M'#225'quina'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 178
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NR_MAQUINA'
              Title.Alignment = taCenter
              Title.Caption = 'N. da M'#225'quininha'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 111
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_ALUGUEL'
              Title.Alignment = taCenter
              Title.Caption = 'Valor do Aluguel'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = -1
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DIA_VENCIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'Vencimento'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = -1
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'MAQUINA_EM_POSSE_DE'
              Title.Alignment = taCenter
              Title.Caption = 'M'#225'quininha em posse de ...'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 216
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
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = False
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 736
          ExplicitWidth = 1246
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 784
    ExplicitWidth = 1294
    inherited btn_fechar: TSpeedButton
      Left = 714
      ExplicitLeft = 1224
    end
    inherited lbl_titulo: TLabel
      Width = 498
      Height = 56
      Caption = 'CONTROLE DE M'#193'QUINAS DE CART'#195'O DE CR'#201'DITO'
      ExplicitWidth = 498
    end
    inherited pnl_separa_topo: TPanel
      Width = 784
      ExplicitWidth = 1294
    end
  end
  inherited ds: TDataSource
    Left = 536
    Top = 40
  end
  inherited qry: TFDQuery
    OnCalcFields = qryCalcFields
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select                             '
      '  M.ID,                            '
      '  M.CADASTRADO_EM,                 '
      '  M.ALTERADO_EM,                   '
      '  P2.NOME AS NM_OPERADORA,         '
      '  P1.NOME,                         '
      '  M.NR_MAQUINA,                    '
      '  M.VALOR_ALUGUEL,                 '
      '  M.DIA_VENCIMENTO,                '
      '  M.MAQUINA_EM_POSSE_DE,           '
      '  M.ATIVO                          '
      'from                               '
      ' CARTAO_MAQUINAS M,                '
      ' CARTAO_OPERADORAS O,              '
      ' PESSOAS P1, PESSOAS P2            '
      'where                              '
      ' M.CARTAO_OPERADORAS_ID = O.PESSOA_ID  and'
      ' M.PROPRIETARIO_ID      = P1.ID and'
      ' O.PESSOA_ID            = P2.ID    ')
    Left = 536
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
    object qryALTERADO_EM: TDateField
      FieldName = 'ALTERADO_EM'
      Origin = 'ALTERADO_EM'
    end
    object qryNM_OPERADORA: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NM_OPERADORA'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryNOME: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'NOME'
      Origin = 'NOME'
      ProviderFlags = []
      ReadOnly = True
      Size = 100
    end
    object qryNR_MAQUINA: TStringField
      FieldName = 'NR_MAQUINA'
      Origin = 'NR_MAQUINA'
      Size = 40
    end
    object qryVALOR_ALUGUEL: TFMTBCDField
      FieldName = 'VALOR_ALUGUEL'
      Origin = 'VALOR_ALUGUEL'
      Precision = 18
      Size = 2
    end
    object qryDIA_VENCIMENTO: TIntegerField
      FieldName = 'DIA_VENCIMENTO'
      Origin = 'DIA_VENCIMENTO'
    end
    object qryMAQUINA_EM_POSSE_DE: TStringField
      FieldName = 'MAQUINA_EM_POSSE_DE'
      Origin = 'MAQUINA_EM_POSSE_DE'
      Size = 40
    end
    object qryATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
  end
end
