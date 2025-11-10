inherited frmCorrentistasContas: TfrmCorrentistasContas
  Caption = 'frmCorrentistasContas'
  ClientHeight = 232
  ClientWidth = 408
  ExplicitWidth = 420
  ExplicitHeight = 270
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 408
    ExplicitWidth = 404
    inherited lbl_titulo: TLabel
      Width = 408
      Height = 40
      Caption = ''
      ExplicitWidth = 6
    end
    inherited lbl_sub_titulo: TLabel
      Width = 408
    end
  end
  inherited pnDados: TPanel
    Width = 408
    Height = 138
    ExplicitWidth = 404
    ExplicitHeight = 137
    object Label1: TLabel
      Left = 5
      Top = 9
      Width = 116
      Height = 17
      Caption = 'Selecione um Banco'
    end
    object Label2: TLabel
      Left = 5
      Top = 67
      Width = 46
      Height = 17
      Caption = 'Ag'#234'ncia'
    end
    object Label3: TLabel
      Left = 136
      Top = 67
      Width = 190
      Height = 17
      Caption = 'Conta (n'#227'o digite pontos tra'#231'os)'
    end
    object cbx_bancos: TDBLookupComboBox
      Left = 56
      Top = 29
      Width = 256
      Height = 25
      KeyField = 'COD_BANCO'
      ListField = 'NOME'
      ListSource = ds
      TabOrder = 0
      OnCloseUp = cbx_bancosCloseUp
    end
    object edt_agencia: TEdit
      Left = 5
      Top = 87
      Width = 121
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 4
      NumbersOnly = True
      TabOrder = 1
    end
    object edt_nr_conta: TEdit
      Left = 133
      Top = 87
      Width = 267
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 10
      TabOrder = 2
    end
    object btn_novo_banco: TBitBtn
      Left = 317
      Top = 29
      Width = 83
      Height = 25
      Caption = 'Novo Banco'
      TabOrder = 3
      OnClick = btn_novo_bancoClick
    end
    object edt_cod_banco: TDBEdit
      Left = 8
      Top = 29
      Width = 45
      Height = 25
      DataField = 'COD_BANCO'
      DataSource = ds
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited pnRodape: TPanel
    Top = 195
    Width = 408
    ExplicitTop = 194
    ExplicitWidth = 404
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      'select '
      '  b.id,'
      '  b.pessoa_id,'
      '  p.nome,'
      '  b.cod_banco'
      'from'
      '  bancos b,'
      '  pessoas p  '
      'where'
      '  b.pessoa_id = p.id'
      'order by'
      '  p.nome    ')
    Left = 248
    Top = 48
  end
  inherited ds: TDataSource
    Left = 278
    Top = 47
  end
end
