inherited frmPesquisaPessoa: TfrmPesquisaPessoa
  Caption = 'Pesquisa Pessoa'
  ClientWidth = 520
  ExplicitWidth = 532
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 520
    ExplicitWidth = 516
    inherited edLocalizar: TLabeledEdit
      Left = 160
      Top = 74
      EditLabel.ExplicitLeft = 160
      EditLabel.ExplicitTop = 54
      Enabled = False
      ExplicitLeft = 160
      ExplicitTop = 74
    end
    inherited btnFiltrar: TBitBtn
      Left = 447
      Top = 74
      TabOrder = 2
      Visible = False
      ExplicitLeft = 447
      ExplicitTop = 74
    end
    object rgTipo: TRadioGroup
      Left = 0
      Top = 18
      Width = 154
      Height = 81
      Caption = ' Localizar por '
      Items.Strings = (
        'CNPJ / CPF'
        'NOME')
      TabOrder = 1
      OnClick = rgTipoClick
    end
  end
  inherited db: TDBGrid
    Width = 520
    DataSource = ds
  end
  inherited pnl_rodape: TPanel
    Width = 520
    ExplicitWidth = 516
    inherited btnConfirma: TBitBtn
      OnClick = btnConfirmaClick
    end
  end
  inherited qry: TFDQuery
    Left = 160
    Top = 128
  end
  inherited ds: TDataSource
    Left = 120
    Top = 128
  end
end
