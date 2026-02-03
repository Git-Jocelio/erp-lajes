inherited frmTabelaPrecosE: TfrmTabelaPrecosE
  ActiveControl = cbx_forma_pagto
  Caption = 'frmTabelaPrecosE'
  ClientHeight = 290
  ClientWidth = 462
  OnActivate = nil
  ExplicitWidth = 474
  ExplicitHeight = 328
  TextHeight = 17
  object Label13: TLabel [0]
    Left = 16
    Top = 87
    Width = 117
    Height = 15
    Caption = 'descri'#231#227'o do produto'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnTitulo: TPanel
    Width = 462
    ExplicitWidth = 522
    inherited lbl_titulo: TLabel
      Width = 462
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 462
    end
  end
  inherited pnDados: TPanel
    Width = 462
    Height = 196
    ExplicitWidth = 462
    ExplicitHeight = 208
    object lbl_Id: TLabel
      Left = 26
      Top = 3
      Width = 47
      Height = 15
      Caption = 'xx'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 8
      Top = 1
      Width = 12
      Height = 17
      Caption = 'ID'
    end
    object Label5: TLabel
      Left = 8
      Top = 28
      Width = 47
      Height = 17
      Caption = 'Produto'
    end
    object Label12: TLabel
      Left = 119
      Top = 136
      Width = 125
      Height = 17
      Caption = 'pre'#231'o para vendedor'
    end
    object lbl_descricao_produto: TLabel
      Left = 8
      Top = 46
      Width = 443
      Height = 21
      Caption = 'descri'#231#227'o do produto'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 8
      Top = 77
      Width = 219
      Height = 17
      Caption = 'selecione uma forma de pagamento :'
    end
    object Label7: TLabel
      Left = 265
      Top = 136
      Width = 92
      Height = 17
      Caption = 'pre'#231'o de venda'
    end
    object Label8: TLabel
      Left = 343
      Top = 77
      Width = 108
      Height = 17
      Caption = 'taxa parcelamento'
    end
    object Label2: TLabel
      Left = 6
      Top = 136
      Width = 88
      Height = 17
      Caption = 'pre'#231'o de custo'
    end
    object edt_preco_vendedor: TEdit
      Left = 121
      Top = 157
      Width = 80
      Height = 23
      CharCase = ecUpperCase
      Color = clCream
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 3
      Text = '0,00'
      OnExit = edt_taxaExit
      OnKeyPress = edt_taxaKeyPress
    end
    object edt_preco_venda: TEdit
      Left = 274
      Top = 157
      Width = 80
      Height = 23
      CharCase = ecUpperCase
      Color = clCream
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 4
      Text = '0,00'
      OnExit = edt_taxaExit
      OnKeyPress = edt_taxaKeyPress
    end
    object edt_taxa: TEdit
      Left = 372
      Top = 101
      Width = 80
      Height = 23
      CharCase = ecUpperCase
      Color = clCream
      Ctl3D = False
      ParentCtl3D = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      Text = '0,00'
      OnExit = edt_taxaExit
      OnKeyPress = edt_taxaKeyPress
    end
    object cbx_forma_pagto: TDBLookupComboBox
      Left = 8
      Top = 101
      Width = 346
      Height = 25
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = ds_Forma_pagto
      TabOrder = 0
    end
    object cb_ativo: TCheckBox
      Left = 399
      Top = 156
      Width = 53
      Height = 17
      Caption = 'Ativo'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object edt_preco_custo: TEdit
      Left = 8
      Top = 157
      Width = 80
      Height = 23
      CharCase = ecUpperCase
      Color = clCream
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 2
      Text = '0,00'
      OnExit = edt_taxaExit
      OnKeyPress = edt_taxaKeyPress
    end
  end
  inherited pnRodape: TPanel
    Top = 253
    Width = 462
    ExplicitTop = 296
    ExplicitWidth = 470
    inherited pnl_botoes: TPanel
      Left = 116
      ExplicitLeft = 116
      inherited btnOk: TBitBtn
        Cursor = crHandPoint
        OnClick = btnOkClick
      end
      inherited btnFechar: TBitBtn
        Cursor = crHandPoint
      end
    end
  end
  inherited qry: TFDQuery
    Left = 400
    Top = 40
  end
  inherited ds: TDataSource
    Left = 400
    Top = 9
  end
  object ds_Forma_pagto: TDataSource
    AutoEdit = False
    DataSet = qry_forma_pagto
    Left = 272
    Top = 120
  end
  object qry_forma_pagto: TFDQuery
    Left = 272
    Top = 152
  end
  object ds_produtos: TDataSource
    AutoEdit = False
    DataSet = qry_produtos
    Left = 304
    Top = 120
  end
  object qry_produtos: TFDQuery
    Left = 304
    Top = 152
  end
end
