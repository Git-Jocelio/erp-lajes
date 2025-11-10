inherited frmContasPagar_Baixa: TfrmContasPagar_Baixa
  Caption = 'frmContasPagar_Baixa'
  ClientHeight = 433
  ClientWidth = 434
  ExplicitWidth = 446
  ExplicitHeight = 471
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 434
    ExplicitWidth = 430
    inherited lbl_titulo: TLabel
      Width = 434
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 434
    end
  end
  inherited pnDados: TPanel
    Width = 434
    Height = 339
    ExplicitWidth = 430
    ExplicitHeight = 338
    object Label3: TLabel
      Left = 4
      Top = 191
      Width = 24
      Height = 15
      Caption = 'Data'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 177
      Top = 192
      Width = 26
      Height = 15
      Caption = 'Valor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label6: TLabel
      Left = 4
      Top = 240
      Width = 190
      Height = 15
      Caption = 'Hist'#243'rico ( Descrever o pagamento )'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnl_id_transacao: TPanel
      Left = 0
      Top = 0
      Width = 434
      Height = 28
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 430
      object Label1: TLabel
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 86
        Height = 20
        Align = alLeft
        Caption = 'ID Lan'#231'amento :'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        ExplicitHeight = 15
      end
      object edt_ID: TPanel
        Left = 93
        Top = 1
        Width = 53
        Height = 26
        Align = alLeft
        Alignment = taRightJustify
        BevelInner = bvLowered
        Caption = 'edt_ID'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 0
      Top = 28
      Width = 434
      Height = 87
      Align = alTop
      Caption = ' Pessoa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 430
      object lbl_nome_pessoa: TLabel
        Left = 4
        Top = 16
        Width = 61
        Height = 17
        Caption = 'lbl_pessoa'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 4
        Top = 39
        Width = 66
        Height = 15
        Caption = 'Saldo aberto'
      end
      object lbl_saldo_aberto: TLabel
        Left = 46
        Top = 60
        Width = 24
        Height = 17
        Alignment = taRightJustify
        Caption = '0.00'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Segoe UI Semibold'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rg_forma_pagto: TRadioGroup
      Left = 0
      Top = 115
      Width = 434
      Height = 70
      Align = alTop
      Caption = ' Forma de pagamento'
      Columns = 3
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      Items.Strings = (
        'Dinheiro'
        'Cheque'
        'Cart'#227'o de cr'#233'dito'
        'Acerto'
        'Pix'
        'Outros')
      ParentFont = False
      TabOrder = 2
      ExplicitWidth = 430
    end
    object edt_valor: TEdit
      Left = 177
      Top = 209
      Width = 81
      Height = 23
      Alignment = taRightJustify
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = '0.00'
    end
    object dtp_data: TDateTimePicker
      Left = 4
      Top = 209
      Width = 105
      Height = 23
      Date = 44720.000000000000000000
      Time = 0.883855462961946600
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object mm_historico: TMemo
      Left = 0
      Top = 259
      Width = 434
      Height = 80
      Align = alBottom
      CharCase = ecUpperCase
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      ExplicitTop = 258
      ExplicitWidth = 430
    end
  end
  inherited pnRodape: TPanel
    Top = 396
    Width = 434
    ExplicitTop = 395
    ExplicitWidth = 430
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    Left = 232
    Top = 136
  end
  inherited ds: TDataSource
    Left = 232
    Top = 105
  end
end
