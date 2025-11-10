inherited frmCartaoBandeiras: TfrmCartaoBandeiras
  Position = poDesktopCenter
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    object GroupBox1: TGroupBox
      Left = 603
      Top = 19
      Width = 294
      Height = 79
      Align = alRight
      Caption = ' Bandeira: '
      TabOrder = 2
      ExplicitLeft = 608
      object Label1: TLabel
        Left = 2
        Top = 19
        Width = 290
        Height = 58
        Align = alClient
        Caption = 
          #201' a marca do cart'#227'o que define onde ele pode ser utilizado, atua' +
          'ndo como um intermedi'#225'rio entre o usu'#225'rio e a operadora. '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitWidth = 260
        ExplicitHeight = 39
      end
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
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRICAO'
              Title.Alignment = taCenter
              Title.Caption = 'Descri'#231#227'o da Bandeira do Cart'#227'o'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 415
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ATIVO'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 75
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
      Width = 497
      Height = 56
      Caption = 'CONSULTA DE BANDEIRAS DE CART'#195'O DE CR'#201'DITO'
      ExplicitWidth = 497
    end
  end
  inherited ds: TDataSource
    Left = 536
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      'select '
      '  id,'
      '  descricao,'
      '  ativo'
      'from '
      '  cartao_bandeiras  ')
    Left = 536
    Top = 40
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'DESCRICAO'
      Size = 60
    end
    object qryATIVO: TStringField
      FieldName = 'ATIVO'
      Origin = 'ATIVO'
      Size = 1
    end
  end
end
