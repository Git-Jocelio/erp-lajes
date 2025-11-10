inherited frmDinheiroEntrada: TfrmDinheiroEntrada
  Caption = 'frmDinheiroEntrada'
  ClientWidth = 777
  Position = poDesktopCenter
  ExplicitWidth = 777
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 777
    ExplicitWidth = 777
    inherited lbl_texto: TLabel
      Left = 615
      Top = 20
      Width = 115
      Caption = 'Pesquisar por Valor'
      Visible = False
      ExplicitLeft = 615
      ExplicitTop = 20
      ExplicitWidth = 115
    end
    object Label1: TLabel [1]
      Left = 127
      Top = 55
      Width = 18
      Height = 17
      Caption = 'at'#233
    end
    object Label2: TLabel [2]
      Left = 401
      Top = 53
      Width = 7
      Height = 17
      Caption = #224
    end
    inherited btnLocalizar: TBitBtn
      Left = 533
      Top = 51
      ExplicitLeft = 533
      ExplicitTop = 51
    end
    inherited edt_consulta: TEdit
      Left = 39
      Top = 51
      Width = 82
      Alignment = taRightJustify
      Text = '0,00'
      OnExit = edt_consultaExit
      OnKeyPress = edt_consultaKeyPress
      ExplicitLeft = 39
      ExplicitTop = 51
      ExplicitWidth = 82
    end
    object edt_valor_fim: TEdit
      Left = 152
      Top = 51
      Width = 82
      Height = 25
      Alignment = taRightJustify
      TabOrder = 2
      Text = '0,00'
      OnExit = edt_consultaExit
      OnKeyPress = edt_consultaKeyPress
    end
    object cb_valor: TCheckBox
      Left = 39
      Top = 27
      Width = 146
      Height = 17
      Caption = 'Pesquisar por Valor'
      TabOrder = 3
    end
    object cb_data: TCheckBox
      Left = 300
      Top = 27
      Width = 145
      Height = 17
      Caption = 'Pesquisar por Data'
      TabOrder = 4
    end
    object dtp_data_ini: TDateTimePicker
      Left = 300
      Top = 50
      Width = 89
      Height = 25
      Date = 45775.000000000000000000
      Time = 0.529278587964654400
      TabOrder = 5
    end
    object dtp_data_fim: TDateTimePicker
      Left = 417
      Top = 50
      Width = 89
      Height = 25
      Date = 45775.000000000000000000
      Time = 0.529278587964654400
      TabOrder = 6
    end
  end
  inherited ToolBar1: TToolBar
    Width = 777
    ExplicitWidth = 777
  end
  inherited StatusBar: TStatusBar
    Width = 777
    ExplicitWidth = 777
  end
  inherited PageControl1: TPageControl
    Width = 777
    ExplicitWidth = 777
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 769
      inherited Panel5: TPanel
        Width = 769
        ExplicitWidth = 769
        inherited DBGrid1: TDBGrid
          Width = 729
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CADASTRADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Cadastrado em'
              Width = 121
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'VALOR'
              Title.Alignment = taCenter
              Title.Caption = 'Valor'
              Width = 78
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBS'
              Title.Alignment = taCenter
              Title.Caption = 'Observa'#231#227'o'
              Width = 339
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'RECIBO_ID'
              Title.Alignment = taCenter
              Width = 91
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 729
          ExplicitWidth = 729
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 777
    ExplicitWidth = 777
    inherited btn_fechar: TSpeedButton
      Left = 707
      ExplicitLeft = 707
    end
    inherited lbl_titulo: TLabel
      Width = 341
      Height = 56
      Caption = 'CONSULTA ENTRADA DE DINHEIRO'
      ExplicitWidth = 341
    end
    inherited pnl_separa_topo: TPanel
      Width = 777
      ExplicitWidth = 777
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select'
      '  id,'
      '  cadastrado_em,'
      '  valor,'
      '  obs,'
      '  recibo_id'
      'from'
      ' dinheiro_entrada')
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
    object qryVALOR: TFMTBCDField
      FieldName = 'VALOR'
      Origin = 'VALOR'
      DisplayFormat = '0.00'
      Precision = 18
      Size = 2
    end
    object qryOBS: TStringField
      FieldName = 'OBS'
      Origin = 'OBS'
      Size = 60
    end
    object qryRECIBO_ID: TIntegerField
      FieldName = 'RECIBO_ID'
      Origin = 'RECIBO_ID'
    end
  end
  inherited ActionList1: TActionList
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
  end
end
