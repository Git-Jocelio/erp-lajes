inherited frmRecibosAlterarValorConta: TfrmRecibosAlterarValorConta
  BorderStyle = bsNone
  BorderWidth = 2
  Caption = 'frmRecibosAlterarValorConta'
  ClientHeight = 311
  ClientWidth = 404
  ExplicitWidth = 408
  ExplicitHeight = 315
  TextHeight = 17
  object Label1: TLabel [0]
    Left = 22
    Top = 57
    Width = 146
    Height = 17
    Caption = 'N'#250'mero do Documento :'
  end
  object Label7: TLabel [1]
    Left = 174
    Top = 57
    Width = 146
    Height = 17
    Caption = 'N'#250'mero do Documento :'
  end
  inherited pnTitulo: TPanel
    Width = 404
    inherited lbl_titulo: TLabel
      Width = 404
      Height = 40
      Caption = 'ALTERA'#199#195'O DE VALOR'
      ExplicitWidth = 217
    end
    inherited lbl_sub_titulo: TLabel
      Width = 404
      Color = clGray
      ParentColor = False
    end
  end
  inherited pnDados: TPanel
    Width = 404
    Height = 217
    ExplicitWidth = 552
    ExplicitHeight = 211
    object Label2: TLabel
      Left = 14
      Top = 49
      Width = 146
      Height = 17
      Caption = 'N'#250'mero do Documento :'
    end
    object Label3: TLabel
      Left = 79
      Top = 102
      Width = 81
      Height = 17
      Caption = 'Total Parcela :'
    end
    object Label4: TLabel
      Left = 76
      Top = 129
      Width = 84
      Height = 17
      Caption = 'Saldo Aberto :'
    end
    object Label5: TLabel
      Left = 116
      Top = 174
      Width = 44
      Height = 17
      Caption = 'Baixar :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 14
      Top = 16
      Width = 48
      Height = 17
      Caption = 'Pessoa :'
    end
    object lbl_pessoa: TLabel
      Left = 69
      Top = 11
      Width = 66
      Height = 25
      Caption = 'Pessoa :'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object lbl_nr_documento: TLabel
      Left = 166
      Top = 49
      Width = 21
      Height = 17
      Caption = '000'
    end
    object lbl_total_parcela: TLabel
      Left = 166
      Top = 102
      Width = 24
      Height = 17
      Caption = '0,00'
    end
    object lbl_saldo_aberto: TLabel
      Left = 166
      Top = 129
      Width = 24
      Height = 17
      Caption = '0,00'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label8: TLabel
      Left = 101
      Top = 79
      Width = 59
      Height = 17
      Caption = 'Hist'#243'rico :'
    end
    object lbl_historico: TLabel
      Left = 166
      Top = 79
      Width = 38
      Height = 17
      Caption = 'TEXTO'
    end
    object edt_baixar: TEdit
      Left = 166
      Top = 171
      Width = 121
      Height = 29
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnExit = edt_baixarExit
      OnKeyPress = edt_baixarKeyPress
    end
  end
  inherited pnRodape: TPanel
    Top = 274
    Width = 404
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    Left = 8
    Top = 48
  end
  inherited ds: TDataSource
    Left = 16
    Top = 17
  end
end
