inherited frmTabelaPrecos: TfrmTabelaPrecos
  Caption = 'frmTabelaPrecos'
  ClientWidth = 1034
  ExplicitWidth = 1034
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 1034
    ExplicitWidth = 1034
    inherited btnLocalizar: TBitBtn
      Left = 483
      ExplicitLeft = 483
    end
    inherited edt_consulta: TEdit
      TabOrder = 2
    end
    object gbPessoa: TGroupBox
      Left = 36
      Top = 14
      Width = 422
      Height = 80
      Caption = '                                             '
      TabOrder = 1
      object cbx_produtos: TDBLookupComboBox
        Left = 5
        Top = 31
        Width = 412
        Height = 25
        KeyField = 'ID'
        ListField = 'DESCRICAO'
        ListSource = dsProdutos
        TabOrder = 0
      end
    end
  end
  inherited ToolBar1: TToolBar
    Width = 1034
    ExplicitWidth = 1034
  end
  inherited StatusBar: TStatusBar
    Width = 1034
    ExplicitWidth = 1034
  end
  inherited PageControl1: TPageControl
    Width = 1034
    ExplicitWidth = 1034
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 1026
      inherited Panel5: TPanel
        Width = 1026
        ExplicitWidth = 1026
        inherited DBGrid1: TDBGrid
          Width = 986
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 30
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CADASTRADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Cadastro'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 77
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ALTERADO_EM'
              Title.Alignment = taCenter
              Title.Caption = 'Alterado'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              Title.Alignment = taCenter
              Title.Caption = 'Usu'#225'rio'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Title.Alignment = taCenter
              Title.Caption = 'Empresa'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 144
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUTO'
              Title.Alignment = taCenter
              Title.Caption = 'Produto'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 204
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMA_PAGTO'
              Title.Alignment = taCenter
              Title.Caption = 'Forma PAgto'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 141
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_VENDEDOR'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Vend.'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_FINAL'
              Title.Alignment = taCenter
              Title.Caption = 'Valor Final'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI'
              Title.Font.Style = [fsBold]
              Width = 78
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 986
          ExplicitWidth = 986
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 1034
    ExplicitWidth = 1034
    inherited btn_fechar: TSpeedButton
      Left = 964
    end
    inherited lbl_titulo: TLabel
      Height = 56
    end
    inherited pnl_separa_topo: TPanel
      Width = 1034
      ExplicitWidth = 1034
    end
  end
  inherited ds: TDataSource
    Left = 168
    Top = 272
  end
  inherited qry: TFDQuery
    Left = 168
    Top = 304
  end
  inherited ImageList1: TImageList
    Left = 872
  end
  inherited ActionList1: TActionList
    Left = 840
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
  end
  object dsProdutos: TDataSource
    AutoEdit = False
    DataSet = qryProdutos
    Left = 296
    Top = 72
  end
  object qryProdutos: TFDQuery
    Left = 296
    Top = 104
  end
end
