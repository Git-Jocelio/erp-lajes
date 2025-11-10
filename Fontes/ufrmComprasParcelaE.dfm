inherited frmComprasParcelaE: TfrmComprasParcelaE
  ClientHeight = 276
  ClientWidth = 454
  ExplicitWidth = 466
  ExplicitHeight = 314
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 454
    ExplicitWidth = 544
    inherited lbl_titulo: TLabel
      Width = 454
      Height = 40
      Caption = 'PARCELA DE COMPRA'
      ExplicitWidth = 211
    end
    inherited lbl_sub_titulo: TLabel
      Width = 454
      Caption = 'Edi'#231#227'o de parcela de compra'
      ExplicitWidth = 173
    end
  end
  inherited pnDados: TPanel
    Width = 454
    Height = 182
    ExplicitWidth = 544
    ExplicitHeight = 209
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 47
      Height = 17
      Caption = 'Compra'
    end
    object Label2: TLabel
      Left = 160
      Top = 6
      Width = 89
      Height = 17
      Caption = 'Nr. Documento'
    end
    object Label3: TLabel
      Left = 16
      Top = 70
      Width = 64
      Height = 17
      Caption = 'Nr. Parcela'
    end
    object Label4: TLabel
      Left = 304
      Top = 70
      Width = 76
      Height = 17
      Caption = '* Vencimento'
    end
    object Label5: TLabel
      Left = 160
      Top = 70
      Width = 76
      Height = 17
      Caption = 'Valor Parcela'
    end
    object Label6: TLabel
      Left = 32
      Top = 152
      Width = 285
      Height = 17
      Caption = '*Obs. s'#243' '#233' possivel alterar a data do vencimento'
    end
    object edt_nr_compra: TEdit
      Left = 16
      Top = 29
      Width = 121
      Height = 25
      Enabled = False
      TabOrder = 0
    end
    object edt_nr_documento: TEdit
      Left = 160
      Top = 29
      Width = 121
      Height = 25
      Enabled = False
      TabOrder = 1
    end
    object edt_nr_parcela: TEdit
      Left = 16
      Top = 93
      Width = 121
      Height = 25
      Enabled = False
      TabOrder = 2
    end
    object dtp_vencimento: TDateTimePicker
      Left = 304
      Top = 93
      Width = 129
      Height = 25
      Date = 45724.000000000000000000
      Time = 0.780990324070444300
      TabOrder = 3
    end
    object edt_valor_parcela: TEdit
      Left = 160
      Top = 93
      Width = 121
      Height = 25
      Enabled = False
      TabOrder = 4
    end
  end
  inherited pnRodape: TPanel
    Top = 239
    Width = 454
    ExplicitTop = 266
    ExplicitWidth = 544
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    Left = 344
    Top = 80
  end
  inherited ds: TDataSource
    Left = 304
    Top = 81
  end
end
