inherited frmEmpresaE: TfrmEmpresaE
  BorderStyle = bsNone
  BorderWidth = 3
  Caption = 'frmEmpresaE'
  ClientHeight = 573
  ClientWidth = 469
  ExplicitTop = -15
  ExplicitWidth = 475
  ExplicitHeight = 579
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 469
    ExplicitWidth = 597
    inherited lbl_titulo: TLabel
      Width = 469
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 469
    end
  end
  inherited pnDados: TPanel
    Width = 469
    Height = 294
    ExplicitWidth = 476
    ExplicitHeight = 288
    object Label1: TLabel
      Left = 5
      Top = 6
      Width = 19
      Height = 17
      Caption = 'ID :'
    end
    object Label2: TLabel
      Left = 148
      Top = 6
      Width = 33
      Height = 17
      Caption = 'Cad. :'
    end
    object Label3: TLabel
      Left = 292
      Top = 6
      Width = 18
      Height = 17
      Caption = 'Alt:'
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
    object Label7: TLabel
      Left = 148
      Top = 49
      Width = 40
      Height = 17
      Caption = 'RG / IE'
    end
    object Label8: TLabel
      Left = 365
      Top = 46
      Width = 49
      Height = 17
      Caption = 'Telefone'
    end
    object Label9: TLabel
      Left = 256
      Top = 49
      Width = 40
      Height = 17
      Caption = 'Celular'
    end
    object Label10: TLabel
      Left = 4
      Top = 108
      Width = 36
      Height = 17
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 5
      Top = 136
      Width = 55
      Height = 17
      Caption = 'Endere'#231'o'
    end
    object Label12: TLabel
      Left = 398
      Top = 136
      Width = 48
      Height = 17
      Caption = 'N'#250'mero'
    end
    object Label13: TLabel
      Left = 5
      Top = 185
      Width = 35
      Height = 17
      Caption = 'Bairro'
    end
    object Label14: TLabel
      Left = 177
      Top = 185
      Width = 41
      Height = 17
      Caption = 'Cidade'
    end
    object Label15: TLabel
      Left = 357
      Top = 185
      Width = 15
      Height = 17
      Caption = 'UF'
    end
    object Label16: TLabel
      Left = 393
      Top = 185
      Width = 22
      Height = 17
      Caption = 'CEP'
    end
    object Label17: TLabel
      Left = 5
      Top = 233
      Width = 31
      Height = 17
      Caption = 'email'
    end
    object lbl_id: TLabel
      Left = 25
      Top = 8
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
      Left = 182
      Top = 8
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
      Top = 8
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
      Top = 67
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
      Left = 256
      Top = 67
      Width = 96
      Height = 25
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
    object Edit1: TEdit
      Left = 148
      Top = 67
      Width = 98
      Height = 23
      MaxLength = 14
      TabOrder = 4
    end
    object edt_nome: TEdit
      Left = 43
      Top = 105
      Width = 420
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 100
      TabOrder = 5
    end
    object edt_endereco: TEdit
      Left = 5
      Top = 155
      Width = 385
      Height = 25
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
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 8
    end
    object edt_cidade: TEdit
      Left = 177
      Top = 203
      Width = 177
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 30
      TabOrder = 9
    end
    object edt_uf: TEdit
      Left = 358
      Top = 203
      Width = 32
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 2
      TabOrder = 10
      Text = 'SP'
    end
    object edt_cep: TEdit
      Left = 393
      Top = 203
      Width = 70
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 9
      TabOrder = 11
    end
    object edt_email: TEdit
      Left = 5
      Top = 253
      Width = 458
      Height = 25
      CharCase = ecLowerCase
      TabOrder = 12
    end
  end
  inherited pnRodape: TPanel
    Top = 536
    Width = 469
    ExplicitTop = 553
    ExplicitWidth = 597
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object pnCliente: TPanel [3]
    Left = 0
    Top = 351
    Width = 469
    Height = 185
    Align = alBottom
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 3
    ExplicitLeft = 8
    ExplicitTop = 346
    object Label18: TLabel
      Left = 6
      Top = 2
      Width = 87
      Height = 17
      Caption = 'Nome Fantasia'
    end
    object Label19: TLabel
      Left = 224
      Top = 1
      Width = 21
      Height = 17
      Caption = 'Site'
    end
    object Label20: TLabel
      Left = 396
      Top = 3
      Width = 27
      Height = 17
      Caption = 'Crea'
    end
    object Label22: TLabel
      Left = 209
      Top = 51
      Width = 31
      Height = 17
      Caption = 'Frase'
    end
    object Label23: TLabel
      Left = 6
      Top = 51
      Width = 40
      Height = 17
      Caption = 'Celular'
    end
    object Label24: TLabel
      Left = 104
      Top = 51
      Width = 76
      Height = 17
      Caption = 'Telefone Fixo'
    end
    object Label4: TLabel
      Left = 89
      Top = 111
      Width = 313
      Height = 17
      Caption = 'Selecione o logotipo para o cabe'#231'alho dos relat'#243'rios'
    end
    object img_logo: TImage
      Left = 8
      Top = 111
      Width = 73
      Height = 67
      Picture.Data = {
        07544269746D617036030000424D360300000000000036000000280000001000
        000010000000010018000000000000030000C40E0000C40E0000000000000000
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF00009A00009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A174AFD103B
        F400009AFF00FFFF00FFFF00FFFF00FF00009A002CF80030FC00009AFF00FFFF
        00FFFF00FFFF00FF00009A1A47F81A4CFF123BF100009AFF00FFFF00FF00009A
        012DF60132FF002AF300009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A1C47
        F61B4DFF143EF400009A00009A002DF80134FF032BF200009AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FF00009A1D48F61D50FF103DFB0431FE0132FF
        002CF600009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FF00009A1A48F91342FF0C3CFF0733F600009AFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A214EFC1D4BFF1847FF1743F6
        00009AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF0000
        9A2E5BF92C5FFF224DF8204BF82355FF1B46F600009AFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FF00009A3664FA386BFF2D59F400009A00009A224CF4
        2558FF1D49F600009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A4071FA4274
        FF325DF100009AFF00FFFF00FF00009A224DF1275AFF204CF800009AFF00FFFF
        00FFFF00FFFF00FF00009A497AFC3B66F300009AFF00FFFF00FFFF00FFFF00FF
        00009A2550F42655FA00009AFF00FFFF00FFFF00FFFF00FFFF00FF00009A0000
        9AFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00009A00009AFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FF}
      Stretch = True
    end
    object btn_buscar_logo: TSpeedButton
      Left = 91
      Top = 134
      Width = 50
      Height = 41
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
      OnClick = btn_buscar_logoClick
    end
    object edt_nome_fantasia: TEdit
      Left = 5
      Top = 21
      Width = 210
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 60
      TabOrder = 0
    end
    object edt_site: TEdit
      Left = 219
      Top = 20
      Width = 173
      Height = 25
      CharCase = ecLowerCase
      MaxLength = 100
      TabOrder = 1
    end
    object edt_celular: TEdit
      Left = 6
      Top = 70
      Width = 92
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 2
    end
    object edt_telefone_fixo: TEdit
      Left = 104
      Top = 70
      Width = 100
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 3
    end
    object edt_crea: TEdit
      Left = 396
      Top = 20
      Width = 67
      Height = 25
      CharCase = ecUpperCase
      MaxLength = 20
      TabOrder = 4
    end
    object edt_frase: TEdit
      Left = 209
      Top = 70
      Width = 254
      Height = 25
      MaxLength = 150
      TabOrder = 5
    end
    object edt_imagem: TEdit
      Left = 347
      Top = 134
      Width = 55
      Height = 25
      Enabled = False
      ReadOnly = True
      TabOrder = 6
      Visible = False
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 305
    Top = 440
  end
end
