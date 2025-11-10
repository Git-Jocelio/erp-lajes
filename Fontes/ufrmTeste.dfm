inherited frmTeste: TfrmTeste
  Caption = 'frmTeste'
  PixelsPerInch = 96
  TextHeight = 17
  inherited pnDados: TPanel
    object DBGrid1: TDBGrid
      Left = 0
      Top = 62
      Width = 564
      Height = 120
      Align = alBottom
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -13
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
    end
  end
  inherited pnRodape: TPanel
    inherited btnOk: TBitBtn
      Left = 188
      OnClick = btnOkClick
      ExplicitLeft = 188
    end
  end
  object cdsTeste: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 201
  end
  object DataSource1: TDataSource
    DataSet = FDMemTable1
    Left = 248
    Top = 169
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 344
    Top = 177
  end
end
