inherited frmDepartamentos: TfrmDepartamentos
  Caption = 'frmDepartamentos'
  ClientWidth = 820
  ExplicitWidth = 820
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 820
    Height = 113
    ExplicitWidth = 820
    ExplicitHeight = 113
    inherited btnLocalizar: TBitBtn
      Left = 484
      Top = 66
      ExplicitLeft = 484
      ExplicitTop = 66
    end
    inherited edt_consulta: TEdit
      Left = 281
      Top = 65
      Width = 197
      TabOrder = 4
      ExplicitLeft = 281
      ExplicitTop = 65
      ExplicitWidth = 197
    end
    object cbNome: TCheckBox
      Left = 16
      Top = 43
      Width = 97
      Height = 17
      Caption = 'Nome'
      TabOrder = 1
    end
    object edNome: TEdit
      Left = 15
      Top = 66
      Width = 255
      Height = 25
      CharCase = ecUpperCase
      TabOrder = 2
    end
    object rgSituacao: TRadioGroup
      Left = 621
      Top = 29
      Width = 89
      Height = 78
      Caption = ' Situa'#231#227'o '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Times New Roman'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Ativo'
        'Inativo'
        'Todos')
      ParentFont = False
      TabOrder = 3
    end
  end
  inherited ToolBar1: TToolBar
    Width = 820
    ExplicitWidth = 820
  end
  inherited StatusBar: TStatusBar
    Width = 820
    ExplicitWidth = 820
  end
  inherited PageControl1: TPageControl
    Top = 218
    Width = 820
    Height = 185
    ExplicitTop = 218
    ExplicitWidth = 820
    ExplicitHeight = 185
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 812
      ExplicitHeight = 175
      inherited Panel5: TPanel
        Width = 812
        Height = 175
        ExplicitWidth = 812
        ExplicitHeight = 175
        inherited DBGrid1: TDBGrid
          Width = 772
          Height = 124
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
          Width = 772
          ExplicitWidth = 772
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 820
    ExplicitWidth = 820
    inherited btn_fechar: TSpeedButton
      Left = 750
    end
    inherited lbl_titulo: TLabel
      Height = 56
    end
    inherited pnl_separa_topo: TPanel
      Width = 820
      ExplicitWidth = 820
    end
  end
  inherited ActionList1: TActionList
    Left = 672
    Top = 72
    inherited actLocalizar: TAction
      OnExecute = actLocalizarExecute
    end
  end
end
