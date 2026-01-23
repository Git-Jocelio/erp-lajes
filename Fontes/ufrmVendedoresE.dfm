inherited frmVendedoresE: TfrmVendedoresE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmVendedoresE'
  ClientHeight = 450
  ClientWidth = 472
  Font.Height = -12
  ShowHint = True
  ExplicitWidth = 478
  ExplicitHeight = 456
  TextHeight = 15
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
    Height = 287
    Font.Height = -12
    ExplicitTop = 61
    ExplicitWidth = 472
    ExplicitHeight = 287
    object Label1: TLabel
      Left = 5
      Top = 6
      Width = 17
      Height = 15
      Caption = 'ID :'
    end
    object Label7: TLabel
      Left = 148
      Top = 50
      Width = 35
      Height = 15
      Caption = 'RG / IE'
    end
    object Label8: TLabel
      Left = 365
      Top = 50
      Width = 44
      Height = 15
      Caption = 'Telefone'
    end
    object Label4: TLabel
      Left = 251
      Top = 50
      Width = 37
      Height = 15
      Caption = 'Celular'
    end
    object Label5: TLabel
      Left = 4
      Top = 108
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
    object btn_validar_cpf_cnpj: TSpeedButton
      Left = 119
      Top = 68
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
    object Label6: TLabel
      Left = 4
      Top = 35
      Width = 106
      Height = 26
      Caption = 'Informe CPF ou CNPJ e clique na lupinha'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      WordWrap = True
    end
    object Label2: TLabel
      Left = 148
      Top = 6
      Width = 30
      Height = 15
      Caption = 'Cad. :'
    end
    object lbl_cadastrado_em: TLabel
      Left = 182
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
    object Label3: TLabel
      Left = 292
      Top = 6
      Width = 18
      Height = 15
      Caption = 'Alt:'
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
      Top = 67
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
      Top = 67
      Width = 96
      Height = 23
      CharCase = ecUpperCase
      MaxLength = 15
      TabOrder = 2
    end
    object edt_telefone: TEdit
      Left = 361
      Top = 67
      Width = 102
      Height = 23
      MaxLength = 13
      TabOrder = 3
    end
    object edt_celular: TEdit
      Left = 251
      Top = 67
      Width = 101
      Height = 23
      MaxLength = 14
      TabOrder = 4
    end
    object edt_nome: TEdit
      Left = 56
      Top = 105
      Width = 407
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
    Top = 413
    Width = 472
    ExplicitTop = 413
    ExplicitWidth = 472
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object pnVendedor: TPanel [3]
    Left = 0
    Top = 352
    Width = 472
    Height = 61
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    object Label9: TLabel
      Left = 310
      Top = 2
      Width = 153
      Height = 15
      Caption = 'Comiss'#227'o Administrativa (%)'
    end
    object Label10: TLabel
      Left = 10
      Top = 2
      Width = 196
      Height = 15
      Caption = 'Comiss'#227'o sobre o lucro da venda (%)'
    end
    object edt_comissao_vendedor: TEdit
      Left = 10
      Top = 23
      Width = 121
      Height = 23
      Color = clWhite
      MaxLength = 5
      TabOrder = 0
      Text = '0,00'
      OnExit = edt_comissao_vendedorExit
      OnKeyPress = edt_comissao_vendedorKeyPress
    end
    object edt_comissao_adm: TEdit
      Left = 310
      Top = 23
      Width = 121
      Height = 23
      Color = clWhite
      MaxLength = 5
      TabOrder = 1
      Text = '0,00'
      OnExit = edt_comissao_vendedorExit
      OnKeyPress = edt_comissao_vendedorKeyPress
    end
  end
  inherited qry: TFDQuery
    Left = 256
    Top = 180
  end
  inherited ds: TDataSource
    Left = 256
    Top = 145
  end
end
