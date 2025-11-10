inherited frmTransportadorasE: TfrmTransportadorasE
  Caption = 'frmTransportadorasE'
  ClientHeight = 555
  ClientWidth = 606
  ExplicitWidth = 618
  ExplicitHeight = 593
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 606
    ExplicitWidth = 602
    inherited lbl_titulo: TLabel
      Width = 606
      Height = 40
    end
    inherited lbl_sub_titulo: TLabel
      Width = 606
    end
  end
  inherited pnDados: TPanel
    Width = 606
    Height = 396
    ExplicitWidth = 602
    ExplicitHeight = 395
    object Label1: TLabel
      Left = 10
      Top = 16
      Width = 12
      Height = 17
      Caption = 'ID'
      FocusControl = edID
    end
    object Label2: TLabel
      Left = 10
      Top = 165
      Width = 36
      Height = 17
      Caption = 'Nome'
      FocusControl = edNome
    end
    object Label3: TLabel
      Left = 10
      Top = 69
      Width = 63
      Height = 17
      Caption = 'CPF / CNPJ'
      FocusControl = edCpfCnpj
    end
    object Label4: TLabel
      Left = 9
      Top = 117
      Width = 40
      Height = 17
      Caption = 'RG / IE'
      FocusControl = edRgIe
    end
    object Label5: TLabel
      Left = 10
      Top = 218
      Width = 55
      Height = 17
      Caption = 'Endere'#231'o'
      FocusControl = edEndereco
    end
    object Label6: TLabel
      Left = 522
      Top = 218
      Width = 48
      Height = 17
      Caption = 'N'#250'mero'
      FocusControl = edNumero
    end
    object Label7: TLabel
      Left = 92
      Top = 16
      Width = 53
      Height = 17
      Caption = 'Cadastro'
      FocusControl = eddataCad
    end
    object Label8: TLabel
      Left = 219
      Top = 16
      Width = 95
      Height = 17
      Caption = #218'ltima altera'#231#227'o'
      FocusControl = edDataAlt
    end
    object Label13: TLabel
      Left = 278
      Top = 114
      Width = 40
      Height = 17
      Caption = 'Celular'
      FocusControl = edCelular
    end
    object Label12: TLabel
      Left = 133
      Top = 117
      Width = 49
      Height = 17
      Caption = 'Telefone'
      FocusControl = edTelefone
    end
    object Label14: TLabel
      Left = 10
      Top = 269
      Width = 35
      Height = 17
      Caption = 'Bairro'
      FocusControl = edBairro
    end
    object Label15: TLabel
      Left = 219
      Top = 269
      Width = 41
      Height = 17
      Caption = 'Cidade'
      FocusControl = edCidade
    end
    object Label16: TLabel
      Left = 425
      Top = 269
      Width = 15
      Height = 17
      Caption = 'UF'
    end
    object Label17: TLabel
      Left = 488
      Top = 264
      Width = 22
      Height = 17
      Caption = 'CEP'
      FocusControl = edCep
    end
    object Label18: TLabel
      Left = 10
      Top = 314
      Width = 31
      Height = 17
      Caption = 'email'
      FocusControl = edEmail
    end
    object edID: TDBEdit
      Left = 10
      Top = 32
      Width = 70
      Height = 25
      Color = clInactiveCaption
      DataField = 'ID'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object edNome: TDBEdit
      Left = 10
      Top = 180
      Width = 585
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'NOME'
      DataSource = ds
      ReadOnly = True
      TabOrder = 1
    end
    object edCpfCnpj: TDBEdit
      Left = 10
      Top = 85
      Width = 111
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'CPF_CNPJ'
      DataSource = ds
      TabOrder = 2
    end
    object edRgIe: TDBEdit
      Left = 9
      Top = 133
      Width = 118
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'RG_IE'
      DataSource = ds
      ReadOnly = True
      TabOrder = 3
    end
    object edEndereco: TDBEdit
      Left = 10
      Top = 235
      Width = 500
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'ENDERECO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 4
    end
    object edNumero: TDBEdit
      Left = 522
      Top = 235
      Width = 73
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'NUMERO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 5
    end
    object eddataCad: TDBEdit
      Left = 92
      Top = 32
      Width = 103
      Height = 25
      Color = clInactiveCaption
      DataField = 'DATA_CAD'
      DataSource = ds
      ReadOnly = True
      TabOrder = 6
    end
    object edDataAlt: TDBEdit
      Left = 219
      Top = 32
      Width = 103
      Height = 25
      Color = clInactiveCaption
      DataField = 'DATA_ALT'
      DataSource = ds
      ReadOnly = True
      TabOrder = 7
    end
    object edCelular: TDBEdit
      Left = 278
      Top = 130
      Width = 107
      Height = 25
      Color = clInactiveCaption
      DataField = 'CELULAR'
      DataSource = ds
      ReadOnly = True
      TabOrder = 8
    end
    object edTelefone: TDBEdit
      Left = 133
      Top = 133
      Width = 127
      Height = 25
      Color = clInactiveCaption
      DataField = 'TELEFONE'
      DataSource = ds
      ReadOnly = True
      TabOrder = 9
    end
    object edBairro: TDBEdit
      Left = 10
      Top = 285
      Width = 200
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'BAIRRO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 10
    end
    object edCidade: TDBEdit
      Left = 219
      Top = 285
      Width = 200
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'CIDADE'
      DataSource = ds
      ReadOnly = True
      TabOrder = 11
    end
    object edCep: TDBEdit
      Left = 490
      Top = 285
      Width = 105
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'CEP'
      DataSource = ds
      ReadOnly = True
      TabOrder = 12
    end
    object edEmail: TDBEdit
      Left = 10
      Top = 337
      Width = 585
      Height = 25
      CharCase = ecLowerCase
      Color = clInactiveCaption
      DataField = 'EMAIL'
      DataSource = ds
      ReadOnly = True
      TabOrder = 13
    end
    object cbAtivo: TDBCheckBox
      Left = 355
      Top = 32
      Width = 97
      Height = 17
      Caption = 'Ativo'
      DataField = 'ATIVO'
      DataSource = ds
      ReadOnly = True
      TabOrder = 14
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object rgPessoa: TDBRadioGroup
      Left = 425
      Top = 4
      Width = 170
      Height = 47
      Caption = ' Pessoa '
      Columns = 2
      DataField = 'FIS_JUR'
      DataSource = ds
      Items.Strings = (
        'Fisica'
        'Juridica')
      ReadOnly = True
      TabOrder = 15
      Values.Strings = (
        'F'
        'J')
    end
    object edUF: TDBComboBox
      Left = 425
      Top = 285
      Width = 54
      Height = 25
      CharCase = ecUpperCase
      Color = clInactiveCaption
      DataField = 'UF'
      DataSource = ds
      Items.Strings = (
        'SP')
      ReadOnly = True
      TabOrder = 16
    end
    object btnBuscaPessoa: TBitBtn
      Left = 123
      Top = 85
      Width = 34
      Height = 25
      Glyph.Data = {
        560A0000424D560A0000000000003600000028000000200000001B0000000100
        180000000000200A0000120B0000120B00000000000000000000666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        66662666C540669F666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666660666F26
        66C50066FF0066FF40669F666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666660666F1366E200
        66FF0066FF0066FF2666C5666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666666666666666666666666666666666666666665366821366E20066FF00
        66FF0066FF3966A9666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666666666666666666666666666666666665366820666F50066FF0066FF00
        66FF4066A0666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666640669F0666F50066FF0066FF0666F553
        6683666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666668F857C978C819D91848F85
        7B66666666666666666666666640669F0066FF0066FF0066FF0666F553668366
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666667D7772AA9E939A9A99A19E9AA49F9AA19E9A9F9C
        99A19D99AA9D90716E6B2D66BC0066FF0066FF0066FF1366E260667066666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666666666666666978D83A29E9AB5AA9FE7C9ABFDD8B2FFD8B1FFD7AFFBD3
        A9E3C3A2B1A59AA19D996D7E9C0066FF0066FF1A66D960667066666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666668F867E9B9A99DAC2AAFFDCB9FFDEBDFFDFBFFFDFBEFFDDBBFFDB
        B6FFD7AFFFD3A7CCB39B9A9A996D7D9B2666C566666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666716F6CA49F9ACBB9A7FFDFBEFFE2C5FFE5CAFFE5CCFFE5CBFFE3C7FFE0
        C1FFDCB9FFD7AFFDD1A5C5AF99A49E9766666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666A2978CABA59EFFDFBEFFE3C8FFE7D0FFEBD6FFECD9FFEBD7FFE9D2FFE5
        CAFFE0C1FFDBB7FFD5ACFFD0A1A59F999D8F8166666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666A9A29AD7C1ACFFE2C5FFE7D0FFECD9FFF0E1FFF2E5FFF1E3FFEEDDFFE9
        D3FFE3C8FFDEBDFFD8B1FFD2A5CAB299A99E9466666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666669A9A99F7D8BAFFE4C9FFEAD5FFF0E1FFF5ECFFF8F1FFF7EEFFF2E5FFEC
        D9FFE6CDFFE0C1FFD9B4FFD3A8E3BF9AA19C9866666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666669A9A99FBDCBCFFE5CBFFEBD7FFF1E4FFF8F1FFFEFDFFFAF5FFF3E8FFED
        DCFFE7CFFFE1C2FFDAB5FFD4A9EBC39B9A9A9966666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666A19E9BE7CEB5FFE4C9FFEAD5FFF0E1FFF6EDFFF9F4FFF7F0FFF2E5FFEC
        D9FFE6CDFFE0C1FFDAB5FFD3A8DBBA9AA89F9566666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666AAA097C3B4A6FFE2C5FFE8D1FFEDDBFFF1E3FFF3E7FFF2E5FFEEDDFFE9
        D4FFE4C9FFDEBDFFD8B1FFD2A5B7A899AA9D8F66666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666668F887FA4A09CF1D6BAFFE4C9FFE8D1FFEBD8FFEDDAFFECD9FFE9D4FFE5
        CCFFE1C2FFDBB8FFD6ADEEC7A09F9C998F847966666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666666666ABA299B4ABA1FBDDBFFFE3C6FFE5CCFFE6CDFFE6CDFFE4C9FFE1
        C2FFDCB9FFD8B1F8CFA5AFA49AAA9D9066666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        66666666666672706DA8A19AB5ABA1F2D4B7FFDFBFFFE0C1FFDFC0FFDEBDFFDB
        B7FFD7B0EDC9A5B2A69AA89F96726F6B66666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666666666666666726F6DAAA0969D9B9ABAAEA1E5C9ADF8D4B2F7D3AFE0C3
        A6B7AA9D9C9B99AA9E91726F6B66666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        666666666666666666666666666666878079AAA095A8A199999999999999A8A0
        98A89C907D777266666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666666666666666
        6666666666666666666666666666666666666666666666666666}
      TabOrder = 17
      OnClick = btnBuscaPessoaClick
    end
    object btnIncluirPessoa: TBitBtn
      Left = 160
      Top = 85
      Width = 35
      Height = 25
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
      TabOrder = 18
      OnClick = btnIncluirPessoaClick
    end
  end
  inherited pnRodape: TPanel
    Top = 518
    Width = 606
    ExplicitTop = 517
    ExplicitWidth = 602
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  object pnVendedor: TPanel [3]
    Left = 0
    Top = 453
    Width = 606
    Height = 65
    Align = alBottom
    Color = clSilver
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 452
    ExplicitWidth = 602
    object Label9: TLabel
      Left = 136
      Top = 8
      Width = 83
      Height = 17
      Caption = 'Percentual (%)'
    end
    object Label10: TLabel
      Left = 8
      Top = 8
      Width = 72
      Height = 17
      Caption = 'C'#243'd. Pessoa'
    end
    object DBEdit1: TDBEdit
      Left = 9
      Top = 31
      Width = 121
      Height = 25
      DataField = 'PESSOA_ID'
      DataSource = dsTransportadoras
      Enabled = False
      ReadOnly = True
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 136
      Top = 31
      Width = 90
      Height = 25
      CharCase = ecUpperCase
      DataField = 'PERCENTUAL'
      DataSource = dsTransportadoras
      TabOrder = 1
    end
  end
  inherited qry: TFDQuery
    Left = 400
    Top = 160
  end
  inherited ds: TDataSource
    Left = 400
    Top = 105
  end
  object qryTransportadoras: TFDQuery
    CachedUpdates = True
    Left = 472
    Top = 161
  end
  object dsTransportadoras: TDataSource
    AutoEdit = False
    DataSet = qryTransportadoras
    Left = 472
    Top = 105
  end
end
