inherited frmDinheiroSaida: TfrmDinheiroSaida
  Position = poDesktopCenter
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    inherited lbl_texto: TLabel
      Left = 490
      Visible = False
      ExplicitLeft = 490
    end
    object Label1: TLabel [1]
      Left = 88
      Top = 55
      Width = 18
      Height = 17
      Caption = 'at'#233
    end
    object Label2: TLabel [2]
      Left = 362
      Top = 53
      Width = 7
      Height = 17
      Caption = #224
    end
    inherited btnLocalizar: TBitBtn
      Left = 490
      Top = 50
      ExplicitLeft = 490
      ExplicitTop = 50
    end
    inherited edt_consulta: TEdit
      Width = 66
      ExplicitWidth = 66
    end
    object cb_valor: TCheckBox
      Left = 15
      Top = 27
      Width = 146
      Height = 17
      Caption = 'Pesquisar por Valor'
      TabOrder = 2
    end
    object edt_valor_fim: TEdit
      Left = 113
      Top = 51
      Width = 82
      Height = 25
      Alignment = taRightJustify
      TabOrder = 3
      Text = '0,00'
    end
    object cb_data: TCheckBox
      Left = 261
      Top = 27
      Width = 145
      Height = 17
      Caption = 'Pesquisar por Data'
      TabOrder = 4
    end
    object dtp_data_ini: TDateTimePicker
      Left = 261
      Top = 50
      Width = 89
      Height = 25
      Date = 45775.000000000000000000
      Time = 0.529278587964654400
      TabOrder = 5
    end
    object dtp_data_fim: TDateTimePicker
      Left = 378
      Top = 50
      Width = 89
      Height = 25
      Date = 45775.000000000000000000
      Time = 0.529278587964654400
      TabOrder = 6
    end
  end
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited Panel5: TPanel
        inherited DBGrid1: TDBGrid
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Width = 42
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CADASTRADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Cadastrado em'
              Width = 109
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PESSOA_ID'
              Title.Alignment = taCenter
              Title.Caption = 'Cod Pessoa'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome'
              Width = 272
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'PLANO_CONTAS_ID'
              Title.Alignment = taCenter
              Title.Caption = 'Cod Custo'
              Width = -1
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'HISTORICO'
              Title.Alignment = taCenter
              Title.Caption = 'Hist'#243'rico'
              Width = 314
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 96
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'LANCADO_CONTAS_RECEBER'
              Title.Alignment = taCenter
              Title.Caption = 'Lan'#231'ado no Conta Receber'
              Visible = False
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
      Width = 306
      Height = 56
      Caption = 'CONSULTA SAIDA DE DINHEIRO'
      ExplicitWidth = 306
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select'
      '  d.id,'
      '  d.cadastrado_em,'
      '  d.pessoa_id,'
      '  p.nome,'
      '  d.plano_contas_id,'
      '  d.historico,'
      '  d.valor,'
      '  d.lancado_contas_receber'
      'from'
      ' dinheiro_saida d,'
      ' pessoas p'
      'where'
      ' d.pessoa_id = p.id')
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
    object qryPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
      Origin = 'PESSOA_ID'
    end
    object qryPLANO_CONTAS_ID: TIntegerField
      FieldName = 'PLANO_CONTAS_ID'
      Origin = 'PLANO_CONTAS_ID'
    end
    object qryHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HISTORICO'
      Size = 100
    end
    object qryVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qryLANCADO_CONTAS_RECEBER: TStringField
      FieldName = 'LANCADO_CONTAS_RECEBER'
      Origin = 'LANCADO_CONTAS_RECEBER'
      Size = 1
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  inherited ActionList1: TActionList
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
  end
end
