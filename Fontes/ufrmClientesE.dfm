inherited frmClientesE: TfrmClientesE
  ActiveControl = edt_cpf_cnpj
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmClientesE'
  ClientHeight = 540
  ClientWidth = 472
  ShowHint = True
  ExplicitWidth = 478
  ExplicitHeight = 546
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 472
    Height = 65
    ExplicitWidth = 472
    ExplicitHeight = 65
    inherited lbl_titulo: TLabel
      Width = 472
      Height = 48
      Layout = tlCenter
    end
    inherited lbl_sub_titulo: TLabel
      Top = 48
      Width = 472
      Layout = tlCenter
      ExplicitTop = 48
    end
  end
  inherited pnDados: TPanel
    Top = 65
    Width = 472
    Height = 281
    Font.Height = -12
    ExplicitTop = 65
    ExplicitWidth = 472
    ExplicitHeight = 281
    object Label1: TLabel
      Left = 5
      Top = 6
      Width = 17
      Height = 15
      Caption = 'ID :'
    end
    object Label2: TLabel
      Left = 91
      Top = 6
      Width = 53
      Height = 15
      Caption = 'Cadastro :'
    end
    object Label3: TLabel
      Left = 257
      Top = 6
      Width = 56
      Height = 15
      Caption = 'Altera'#231#227'o :'
    end
    object Label6: TLabel
      Left = 5
      Top = 34
      Width = 59
      Height = 15
      Caption = 'CPF / CNPJ'
    end
    object Label7: TLabel
      Left = 148
      Top = 34
      Width = 35
      Height = 15
      Caption = 'RG / IE'
    end
    object Label8: TLabel
      Left = 365
      Top = 31
      Width = 44
      Height = 15
      Caption = 'Telefone'
    end
    object Label9: TLabel
      Left = 251
      Top = 34
      Width = 37
      Height = 15
      Caption = 'Celular'
    end
    object Label10: TLabel
      Left = 5
      Top = 86
      Width = 33
      Height = 15
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 5
      Top = 136
      Width = 49
      Height = 15
      Caption = 'Endere'#231'o'
    end
    object Label12: TLabel
      Left = 398
      Top = 136
      Width = 44
      Height = 15
      Caption = 'N'#250'mero'
    end
    object Label13: TLabel
      Left = 5
      Top = 185
      Width = 31
      Height = 15
      Caption = 'Bairro'
    end
    object Label14: TLabel
      Left = 177
      Top = 185
      Width = 37
      Height = 15
      Caption = 'Cidade'
    end
    object Label15: TLabel
      Left = 357
      Top = 185
      Width = 14
      Height = 15
      Caption = 'UF'
    end
    object Label16: TLabel
      Left = 393
      Top = 185
      Width = 21
      Height = 15
      Caption = 'CEP'
    end
    object Label17: TLabel
      Left = 5
      Top = 233
      Width = 29
      Height = 15
      Caption = 'email'
    end
    object lbl_id: TLabel
      Left = 25
      Top = 6
      Width = 21
      Height = 15
      Caption = '000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_cadastrado_em: TLabel
      Left = 148
      Top = 6
      Width = 66
      Height = 15
      Caption = '00/00/0000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lbl_alterado_em: TLabel
      Left = 316
      Top = 6
      Width = 66
      Height = 15
      Caption = '00/00/0000'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_validar_cpf_cnpj: TSpeedButton
      Left = 119
      Top = 52
      Width = 23
      Height = 22
      Hint = 'Validar CPF/CNPJ'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FF314B62
        AC7D7EFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FF5084B20F6FE1325F8CB87E7AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF32A0FE37A1FF
        106FE2325F8BB67D79FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF37A4FE379FFF0E6DDE355F89BB7F79FF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        37A4FE359EFF0F6FDE35608BA67B7FFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF38A5FE329DFF156DCE444F5BFF
        00FF9C6B65AF887BAF887EAA8075FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FF3BABFFA1CAE7AD8679A98373E0CFB1FFFFDAFFFFDDFCF8CFCCB2
        9FA1746BFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFC0917DFC
        E9ACFFFFCCFFFFCFFFFFD0FFFFDEFFFFFAE3D3D1996965FF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFB08978FAD192FEF4C2FFFFD0FFFFDAFFFFF6FFFF
        FCFFFFFCB69384FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFB08978FEDA97ED
        B478FBEEBBFFFFD3FFFFDCFFFFF4FFFFF4FFFFE2E9DDBCA67B73FF00FFFF00FF
        FF00FFFF00FFFF00FFB18A78FFDE99E9A167F4D199FEFCCCFFFFD5FFFFDAFFFF
        DCFFFFD7EFE6C5A97E75FF00FFFF00FFFF00FFFF00FFFF00FFAA7F73FAE0A4F0
        B778EEBA7BF6DDA6FEFBCCFFFFD3FFFFD1FFFFD7D9C5A7A3756CFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFCEB293FFFEDDF4D1A5EEBA7BF2C78FF8E1ABFCF0
        BAFCFACAA3776FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFA1746BE1
        D4D3FFFEEEF7CC8CF0B473F7C788FCE3A5C2A088A5776CFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF986865BA9587EAD7A4EAD59EE0C097A577
        6CA5776CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFA77E70A98073A4786EFF00FFFF00FFFF00FFFF00FF}
      OnClick = btn_validar_cpf_cnpjClick
    end
    object cb_ativo: TCheckBox
      Left = 414
      Top = 6
      Width = 51
      Height = 17
      Caption = 'Ativo'
      TabOrder = 0
    end
    object edt_cpf_cnpj: TEdit
      Left = 4
      Top = 52
      Width = 109
      Height = 23
      Hint = 'digite somente n'#250'meros'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      MaxLength = 14
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
    object edt_rg_ie: TEdit
      Left = 148
      Top = 52
      Width = 96
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 2
    end
    object edt_telefone: TEdit
      Left = 361
      Top = 52
      Width = 102
      Height = 23
      MaxLength = 13
      TabOrder = 4
    end
    object edt_celular: TEdit
      Left = 251
      Top = 52
      Width = 101
      Height = 23
      MaxLength = 14
      TabOrder = 3
    end
    object edt_nome: TEdit
      Left = 5
      Top = 105
      Width = 458
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 5
    end
    object edt_endereco: TEdit
      Left = 5
      Top = 155
      Width = 385
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 6
    end
    object edt_numero: TEdit
      Left = 398
      Top = 155
      Width = 65
      Height = 23
      MaxLength = 10
      TabOrder = 7
    end
    object edt_bairro: TEdit
      Left = 4
      Top = 204
      Width = 167
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 8
    end
    object edt_cidade: TEdit
      Left = 177
      Top = 203
      Width = 177
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 9
    end
    object edt_uf: TEdit
      Left = 358
      Top = 203
      Width = 32
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 10
      Text = 'SP'
    end
    object edt_cep: TEdit
      Left = 393
      Top = 203
      Width = 70
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 9
      TabOrder = 11
    end
    object edt_email: TEdit
      Left = 5
      Top = 253
      Width = 458
      Height = 23
      CharCase = ecLowerCase
      TabOrder = 12
    end
  end
  inherited pnRodape: TPanel
    Top = 502
    Width = 472
    Height = 38
    TabOrder = 3
    ExplicitTop = 502
    ExplicitWidth = 472
    ExplicitHeight = 38
    inherited pnl_botoes: TPanel
      Left = 128
      ExplicitLeft = 128
      inherited btnOk: TBitBtn
        Cursor = crHandPoint
        OnClick = btnOkClick
      end
      inherited btnFechar: TBitBtn
        Cursor = crHandPoint
      end
    end
  end
  object pnCliente: TPanel [3]
    Left = 0
    Top = 346
    Width = 472
    Height = 156
    Align = alBottom
    Color = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 2
    object Label18: TLabel
      Left = 8
      Top = 9
      Width = 89
      Height = 15
      Caption = 'Limite de cr'#233'dito'
    end
    object Label19: TLabel
      Left = 116
      Top = 9
      Width = 136
      Height = 15
      Caption = 'Vendedor / Representante'
      FocusControl = DBEdit19
    end
    object Label20: TLabel
      Left = 361
      Top = 9
      Width = 66
      Height = 15
      Caption = 'Cond. pagto'
    end
    object Label22: TLabel
      Left = 8
      Top = 56
      Width = 44
      Height = 15
      Caption = 'Cr'#233'ditos'
    end
    object Label23: TLabel
      Left = 116
      Top = 56
      Width = 93
      Height = 15
      Caption = 'Pedidos a receber'
    end
    object Label24: TLabel
      Left = 230
      Top = 56
      Width = 78
      Height = 15
      Caption = 'Outros d'#233'bitos'
    end
    object Label4: TLabel
      Left = 8
      Top = 103
      Width = 258
      Height = 15
      Caption = 'Observa'#231#227'o padr'#227'o que deve aparecer no pedido'
    end
    object DBEdit19: TDBEdit
      Left = 116
      Top = 25
      Width = 33
      Height = 23
      DataField = 'ID'
      DataSource = dsVendedores
      Enabled = False
      TabOrder = 1
    end
    object cbxVendedor: TDBLookupComboBox
      Left = 151
      Top = 25
      Width = 169
      Height = 23
      KeyField = 'ID'
      ListField = 'NOME'
      ListSource = dsVendedores
      TabOrder = 2
    end
    object cbxFormaPagto: TDBLookupComboBox
      Left = 361
      Top = 25
      Width = 102
      Height = 23
      KeyField = 'ID'
      ListField = 'DESCRICAO'
      ListSource = dsFormaPagto
      TabOrder = 4
    end
    object btn_incluir_vendedor: TBitBtn
      Left = 324
      Top = 25
      Width = 32
      Height = 25
      Cursor = crHandPoint
      Hint = 'cadastrar um novo vendedor'
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        A46769A46769A46769A46769A46769A46769A46769A46769A46769A46769A467
        69A46769A46769FF00FFFF00FFFF00FFB79184FEE9C7F4DAB5F3D5AAF2D0A0EF
        CB96EFC68BEDC182EBC17FEBC180EBC180F2C782A46769FF00FFFF00FFFF00FF
        B79187FCEACEF3DABCF2D5B1F0D0A7EECB9EEDC793EDC28BE9BD81E9BD7FE9BD
        7FEFC481A46769FF00FFFF00FFFF00FFB7938AFEEFDAF6E0C6F2DABCF2D5B2EF
        D0A9EECB9EEDC796EBC28CE9BD82E9BD7FEFC481A46769FF00FFFF00FFFF00FF
        BA978FFFF4E5F7E5CFF4E0C5F3DABBF2D5B1F0D0A6EECB9EEDC795EBC28AEABF
        81EFC480A46769FF00FFFF00FFFF00FFC09E95FFFBF0F8EADCF6E3CFF4E0C6F2
        D9BCF2D5B1F0D0A9EDCB9EEDC695EBC28AEFC583A46769FF00FFFF00FFFF00FF
        C6A49AFFFFFCFAF0E6F8EADAF7E5CFF4E0C5F2DABAF2D5B1F0D0A7EECB9DEBC7
        93F2C98CA46769FF00FFFF00FFFF00FFCBA99EFFFFFFFEF7F2FAEFE6F8EAD9F7
        E3CFF6E0C5F2DABBF2D4B1F0D0A7EECC9EF3CE97A46769FF00FFFF00FFFF00FF
        CFAC9FFFFFFFFFFEFCFCF6F0FAEFE6F7EADAF6E3CFF4E0C5F3D9BBF3D4B0F0D0
        A6F6D3A0A46769FF00FFFF00FFFF00FFD4B0A1FFFFFFFFFFFFFFFEFCFEF7F0FA
        EFE5F8EAD9F7E5CEF6DEC4F3D9B8F4D8B1EBCFA4A46769FF00FFFF00FFFF00FF
        D9B5A1FFFFFFFFFFFFFFFFFFFFFEFCFCF7F0FAEFE5F8E9D9F8E7D1FBEACEDECE
        B4B6AA93A46769FF00FFFF00FFFF00FFDDB7A4FFFFFFFFFFFFFFFFFFFFFFFFFF
        FEFCFCF6EFFCF3E6EDD8C9B68A7BA17B6F9C7667A46769FF00FFFF00FFFF00FF
        E2BCA5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFBFFFEF7DAC1BAAD735BE19E
        55E68F31B56D4DFF00FFFF00FFFF00FFE6BFA7FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFDCC7C5B88265F8B55CBF7A5CFF00FFFF00FFFF00FFFF00FF
        E4BCA4FBF4F0FBF4EFFAF3EFFAF3EFF8F2EFF7F2EFF7F2EFD8C2C0B77F62C183
        6CFF00FFFF00FFFF00FFFF00FFFF00FFE8C4ADEBCBB7EBCBB7EACBB7EACAB6EA
        CAB6EACAB6EACAB6E3C2B1A56B5FFF00FFFF00FFFF00FFFF00FF}
      TabOrder = 3
      OnClick = btn_incluir_vendedorClick
    end
    object edt_limite_credito: TEdit
      Left = 8
      Top = 25
      Width = 102
      Height = 23
      TabOrder = 0
    end
    object edt_creditos: TEdit
      Left = 8
      Top = 73
      Width = 97
      Height = 23
      TabOrder = 5
    end
    object edt_pedidos_receber: TEdit
      Left = 116
      Top = 73
      Width = 102
      Height = 23
      TabOrder = 6
    end
    object edt_outros_debitos: TEdit
      Left = 230
      Top = 73
      Width = 90
      Height = 23
      TabOrder = 7
    end
    object edt_obs: TEdit
      Left = 8
      Top = 120
      Width = 457
      Height = 23
      CharCase = ecUpperCase
      TabOrder = 8
    end
    object cb_mostra_tela_pagto: TCheckBox
      Left = 361
      Top = 62
      Width = 105
      Height = 38
      Caption = 'Mostrar tela de pagtos'
      TabOrder = 9
      WordWrap = True
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      '')
    Left = 288
    Top = 200
  end
  inherited ds: TDataSource
    AutoEdit = False
    Left = 288
    Top = 169
  end
  object qryVendedores: TFDQuery
    Left = 320
    Top = 201
  end
  object dsVendedores: TDataSource
    AutoEdit = False
    DataSet = qryVendedores
    Left = 320
    Top = 167
  end
  object qryFormaPagto: TFDQuery
    Left = 352
    Top = 200
  end
  object dsFormaPagto: TDataSource
    DataSet = qryFormaPagto
    Left = 352
    Top = 168
  end
end
