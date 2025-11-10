inherited frmCartaoOperadoras: TfrmCartaoOperadoras
  ClientHeight = 516
  ClientWidth = 904
  Position = poDesktopCenter
  ExplicitWidth = 904
  ExplicitHeight = 516
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 904
    ExplicitWidth = 902
    inherited edt_consulta: TEdit
      Width = 445
    end
    object GroupBox1: TGroupBox
      Left = 608
      Top = 19
      Width = 294
      Height = 79
      Align = alRight
      Caption = ' Fun'#231#245'es das Operadoras: '
      TabOrder = 2
      object Label1: TLabel
        Left = 2
        Top = 19
        Width = 290
        Height = 58
        Align = alClient
        Caption = 
          'Emiss'#227'o e gerenciamento de cart'#245'es:  Respons'#225'veis pela an'#225'lise d' +
          'e cr'#233'dito, emiss'#227'o do cart'#227'o e defini'#231#227'o dos termos e condi'#231#245'es ' +
          'de uso'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        WordWrap = True
        ExplicitWidth = 289
        ExplicitHeight = 39
      end
    end
  end
  inherited ToolBar1: TToolBar
    Width = 904
    ExplicitWidth = 902
  end
  inherited StatusBar: TStatusBar
    Top = 484
    Width = 904
    ExplicitWidth = 902
  end
  inherited PageControl1: TPageControl
    Width = 904
    Height = 279
    ExplicitWidth = 902
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 896
      ExplicitHeight = 269
      inherited Panel5: TPanel
        Width = 896
        Height = 269
        ExplicitWidth = 894
        inherited DBGrid1: TDBGrid
          Width = 856
          Height = 218
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
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME'
              Title.Alignment = taCenter
              Title.Caption = 'Nome da Operadora'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 292
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NR_ESTABELECIMENTO'
              Title.Alignment = taCenter
              Title.Caption = 'N. Estabelecimento'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 124
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE'
              Title.Alignment = taCenter
              Title.Caption = 'Telefone de contato'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 153
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Title.Alignment = taCenter
              Title.Caption = 'e-mail'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 140
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SENHA'
              Title.Alignment = taCenter
              Title.Caption = 'Senha'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 856
          ExplicitWidth = 854
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 904
    ExplicitWidth = 902
    inherited btn_fechar: TSpeedButton
      Left = 834
      ExplicitLeft = 832
    end
    inherited lbl_titulo: TLabel
      Width = 519
      Height = 56
      Caption = 'CONSULTA DE OPERADORAS DE CART'#195'O DE CR'#201'DITO'
      ExplicitWidth = 519
    end
    inherited pnl_separa_topo: TPanel
      Width = 904
      ExplicitWidth = 902
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select'
      '  P.ID,'
      '  P.NOME,'
      '  O.NR_ESTABELECIMENTO,'
      '  P.TELEFONE,'
      '  P.EMAIL,'
      '  O.SENHA'
      'from'
      '  CARTAO_OPERADORAS  O,'
      '  PESSOAS P'
      'where'
      '  O.PESSOA_ID = P.ID')
    Left = 632
    Top = 40
    object qryID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 100
    end
    object qryNR_ESTABELECIMENTO: TStringField
      FieldName = 'NR_ESTABELECIMENTO'
      Origin = 'NR_ESTABELECIMENTO'
    end
    object qryTELEFONE: TStringField
      FieldName = 'TELEFONE'
      Origin = 'TELEFONE'
      Size = 13
    end
    object qryEMAIL: TStringField
      FieldName = 'EMAIL'
      Origin = 'EMAIL'
      Size = 60
    end
    object qrySENHA: TStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Size = 40
    end
  end
end
