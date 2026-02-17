inherited frmPedidos: TfrmPedidos
  Left = 218
  Top = 74
  Caption = 'frmPedidos'
  ClientHeight = 541
  ClientWidth = 1105
  Position = poDefault
  OnActivate = FormActivate
  ExplicitWidth = 1105
  ExplicitHeight = 541
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    Width = 1105
    Height = 167
    ExplicitWidth = 1105
    ExplicitHeight = 167
    object pcPesquisa: TPageControl [1]
      Left = 2
      Top = 19
      Width = 1032
      Height = 146
      ActivePage = tbs_customizado
      Align = alClient
      DragCursor = crHandPoint
      TabOrder = 2
      object tbs_numero_Pedido: TTabSheet
        Caption = 'Pelo N'#250'mero'
        OnShow = tbs_numero_PedidoShow
        object btnFitrarNumero: TSpeedButton
          Left = 235
          Top = 30
          Width = 31
          Height = 29
          Cursor = crHandPoint
          Hint = 'clique para filtrar'
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
          ParentShowHint = False
          ShowHint = True
          OnClick = btnFitrarNumeroClick
        end
        object Label2: TLabel
          Left = 5
          Top = 10
          Width = 217
          Height = 15
          Caption = 'Digite o n'#250'mero do pedido e tecle ENTER'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
        end
        object edNumeroPedido: TEdit
          Left = 3
          Top = 30
          Width = 226
          Height = 29
          Hint = 'Informe o n'#250'mero do pedido'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI Semibold'
          Font.Style = [fsBold]
          NumbersOnly = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnKeyPress = edNumeroPedidoKeyPress
        end
      end
      object tbs_endereco: TTabSheet
        Caption = 'Endere'#231'o Cliente'
        ImageIndex = 4
        OnShow = tbs_enderecoShow
        object btn_filtrar_endereço_cliente: TSpeedButton
          Left = 944
          Top = 26
          Width = 28
          Height = 26
          Cursor = crHandPoint
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
          OnClick = btn_filtrar_endereço_clienteClick
        end
        object Label3: TLabel
          Left = 5
          Top = 57
          Width = 689
          Height = 15
          Caption = 
            '1. Marque o checkbox a op'#231#227'o que deseja filtrar  2. Digite no ca' +
            'mpo correspondente o texto '#224' pesquisar. 3. Clique no bot'#227'o (lupi' +
            'nha)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object cb_endereco_cliente: TCheckBox
          Left = 195
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por endere'#231'o'
          Caption = 'Endere'#231'o'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edt_endereco_cliente: TEdit
          Left = 195
          Top = 26
          Width = 246
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object cb_bairro_cliente: TCheckBox
          Left = 447
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por bairro'
          Caption = 'Bairro'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object edt_bairro_cliente: TEdit
          Left = 447
          Top = 26
          Width = 194
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object cb_cidade_cliente: TCheckBox
          Left = 647
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por cidade'
          Caption = 'Cidade'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object edt_cidade_cliente: TEdit
          Left = 647
          Top = 26
          Width = 188
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object cb_cep_cliente: TCheckBox
          Left = 841
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por cep'
          Caption = 'CEP'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object edt_cep_cliente: TEdit
          Left = 841
          Top = 26
          Width = 97
          Height = 25
          CharCase = ecUpperCase
          NumbersOnly = True
          TabOrder = 7
        end
        object edt_nome_cliente: TEdit
          Left = 5
          Top = 26
          Width = 182
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 8
        end
        object cb_nome_cliente: TCheckBox
          Left = 5
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por nome'
          Caption = 'Nome'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
        end
      end
      object tbs_cpf_cnpj: TTabSheet
        Caption = 'CPF / CNPJ'
        ImageIndex = 3
        OnShow = tbs_cpf_cnpjShow
        object Label1: TLabel
          Left = 2
          Top = 39
          Width = 134
          Height = 17
          Caption = 'Digite somente n'#250'meros'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -13
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object btnFiltrarCPF_CNPJ: TSpeedButton
          Left = 183
          Top = 14
          Width = 27
          Height = 27
          Cursor = crHandPoint
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
          OnClick = btnFiltrarCPF_CNPJClick
        end
        object edCpfCnpj: TEdit
          Left = 0
          Top = 14
          Width = 177
          Height = 25
          Hint = 'Informe o n'#250'mero do cpf ou cnpj'
          NumbersOnly = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
      end
      object tbs_customizado: TTabSheet
        Caption = 'Custumizada'
        ImageIndex = 2
        OnShow = tbs_customizadoShow
        object btnFiltrarCustomizado: TSpeedButton
          Left = 878
          Top = 88
          Width = 85
          Height = 25
          Cursor = crHandPoint
          Caption = 'Filtrar'
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
          OnClick = btnFiltrarCustomizadoClick
        end
        object GroupBox1: TGroupBox
          Left = 302
          Top = 2
          Width = 436
          Height = 111
          Caption = '                    '
          TabOrder = 0
          object cbEmissao: TCheckBox
            Left = 11
            Top = 1
            Width = 70
            Height = 17
            Cursor = crHandPoint
            Caption = 'Emiss'#227'o'
            DragCursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnClick = cbEmissaoClick
          end
          object dtpEmissaoIni: TDateTimePicker
            Left = 11
            Top = 24
            Width = 90
            Height = 21
            Cursor = crHandPoint
            Date = 44291.000000000000000000
            Time = 0.911467604164499800
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object dtpEmissaoFim: TDateTimePicker
            Left = 119
            Top = 23
            Width = 90
            Height = 21
            Cursor = crHandPoint
            Date = 44291.000000000000000000
            Time = 0.911635243057389700
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object cb_contabil: TCheckBox
            Left = 11
            Top = 58
            Width = 97
            Height = 17
            Caption = 'Data Cont'#225'bil'
            DragCursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
            OnClick = cb_contabilClick
          end
          object dtp_contabil_fim: TDateTimePicker
            Left = 119
            Top = 81
            Width = 90
            Height = 21
            Cursor = crHandPoint
            Date = 44291.000000000000000000
            Time = 0.911635243057389700
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object dtp_contabil_ini: TDateTimePicker
            Left = 11
            Top = 81
            Width = 90
            Height = 21
            Cursor = crHandPoint
            Date = 44291.000000000000000000
            Time = 0.911467604164499800
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object cb_entrega: TCheckBox
            Left = 230
            Top = 58
            Width = 67
            Height = 17
            Cursor = crHandPoint
            Caption = 'Entrega'
            DragCursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            OnClick = cbEmissaoClick
          end
          object dtp_entrega_ini: TDateTimePicker
            Left = 230
            Top = 81
            Width = 90
            Height = 21
            Cursor = crHandPoint
            Date = 44291.000000000000000000
            Time = 0.911467604164499800
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object dtp_entrega_fim: TDateTimePicker
            Left = 338
            Top = 81
            Width = 90
            Height = 21
            Cursor = crHandPoint
            Date = 44291.000000000000000000
            Time = 0.911635243057389700
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
        end
        object GroupBox2: TGroupBox
          Left = -2
          Top = 2
          Width = 295
          Height = 111
          Caption = '                    '
          TabOrder = 1
          object cbCliente: TCheckBox
            Left = 6
            Top = 0
            Width = 59
            Height = 17
            Cursor = crHandPoint
            Caption = 'Cliente'
            DragCursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object cbxCliente: TDBLookupComboBox
            Left = 6
            Top = 23
            Width = 283
            Height = 23
            Cursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = dsCliente
            ParentFont = False
            TabOrder = 1
          end
          object cbVendedor: TCheckBox
            Left = 6
            Top = 58
            Width = 97
            Height = 17
            Cursor = crHandPoint
            Caption = 'Vendedor'
            DragCursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object cbxVendedor: TDBLookupComboBox
            Left = 6
            Top = 81
            Width = 283
            Height = 23
            Cursor = crHandPoint
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            KeyField = 'ID'
            ListField = 'NOME'
            ListSource = dsVendedor
            ParentFont = False
            TabOrder = 3
          end
        end
        object GroupBox3: TGroupBox
          Left = 742
          Top = 2
          Width = 130
          Height = 111
          Caption = 'Situa'#231#227'o '
          TabOrder = 2
          object cbxTipoVenda: TComboBox
            Left = 4
            Top = 23
            Width = 120
            Height = 23
            Cursor = crHandPoint
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Items.Strings = (
              '< Pedido >'
              '< Or'#231'amento>'
              '< Todos >')
          end
          object cbxSituacao: TComboBox
            Left = 4
            Top = 52
            Width = 120
            Height = 23
            Cursor = crHandPoint
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Items.Strings = (
              'ABERTO'
              'ENTREGUE'
              'RETIROU'
              'AGUARDANDO'
              'PARCIAL'
              '< Todos >')
          end
          object cbxFinanceiro: TComboBox
            Left = 4
            Top = 81
            Width = 120
            Height = 23
            Cursor = crHandPoint
            Style = csDropDownList
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Segoe UI'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
            Items.Strings = (
              '< Pago >'
              '< Receber >'
              '< Todos >')
          end
        end
      end
      object tbs_obra: TTabSheet
        Caption = 'Dados da Obra'
        ImageIndex = 1
        OnShow = tbs_obraShow
        object btnFiltrarDadosObra: TSpeedButton
          Left = 944
          Top = 26
          Width = 27
          Height = 26
          Cursor = crHandPoint
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
          OnClick = btnFiltrarDadosObraClick
        end
        object Label4: TLabel
          Left = 3
          Top = 57
          Width = 689
          Height = 15
          Caption = 
            '1. Marque o checkbox a op'#231#227'o que deseja filtrar  2. Digite no ca' +
            'mpo correspondente o texto '#224' pesquisar. 3. Clique no bot'#227'o (lupi' +
            'nha)'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsItalic]
          ParentFont = False
        end
        object cbNome: TCheckBox
          Left = 5
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por nome'
          Caption = 'Nome'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object edNome: TEdit
          Left = 5
          Top = 26
          Width = 182
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 1
        end
        object cbEndereco: TCheckBox
          Left = 193
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por endere'#231'o'
          Caption = 'Endere'#231'o'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object edEndereco: TEdit
          Left = 195
          Top = 26
          Width = 246
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 3
        end
        object cbBairro: TCheckBox
          Left = 447
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por bairro'
          Caption = 'Bairro'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
        end
        object edBairro: TEdit
          Left = 447
          Top = 26
          Width = 194
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 5
        end
        object cbCidade: TCheckBox
          Left = 647
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por cidade'
          Caption = 'Cidade'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
        end
        object edCidade: TEdit
          Left = 647
          Top = 26
          Width = 188
          Height = 25
          CharCase = ecUpperCase
          TabOrder = 7
        end
        object cbCEP: TCheckBox
          Left = 841
          Top = 8
          Width = 97
          Height = 17
          Hint = 'Marque para filtrar por cep'
          Caption = 'CEP'
          DragCursor = crHandPoint
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
        end
        object edCep: TEdit
          Left = 841
          Top = 26
          Width = 97
          Height = 25
          CharCase = ecUpperCase
          NumbersOnly = True
          TabOrder = 9
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Concreto'
        ImageIndex = 5
        object btn_pesquisar_concreto: TBitBtn
          Left = 463
          Top = 11
          Width = 267
          Height = 57
          Caption = 'Pesquisar vendas de concreto'
          Glyph.Data = {
            8E0E0000424D8E0E000000000000360000002800000024000000220000000100
            180000000000580E000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFEFEFEF7F7F7E7E7E7DFDFDFDADADADEDEDEEEEEEEFBFBFBFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9D8D8D89E9E9E8383837777778282
            82B0B0B0E4E4E4FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7E7E78989
            89757575676768AB878D7B6767686868A9A9A9E3E3E3FBFBFBFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFC0C0C0888888616B7A616DA58B7FA3BE939B786565676767A9
            A9A9E3E3E3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C26679863E8FE64573C361
            6EAA8B7FA3BE939B786565676767A9A9A9E3E3E3FBFBFBFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBA
            CDDD5DBDF549AFFF3A91EE4573C3616EAA8B7FA3BE939B786565676767A9A9A9
            E3E3E3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFDAEDFE55B4FE5DC3FF49AFFF3A91EE4474C4616FAB
            8B7FA3BE939B786565676767A9A9A9E3E3E3FBFBFBFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8ECFD55B4FE
            5DC3FF49AFFF3A91EE4475C6616FAB8B7FA3BE939B786565676767A9A9A9E3E3
            E3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFD8ECFD55B4FE5DC3FF49AFFF3A91EE4475C6616FAB8B7F
            A3BE939B786565676767A9A9A9E3E3E3FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8ECFD55B4FE5DC3
            FF49AFFF3993F24475C6616FAB8B7FA3BE939B7865656B6B6BB6B6B6F0F0F0FF
            FFFFFFFFFFFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFEFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFD8ECFD55B4FE5DC3FF49AFFF3994F34475C6616FAB8B7FA3BA
            929C816E6E9B9B9BE8E8E8FCFCFCF5F5F5E6E6E6DCDCDCD7D7D7D5D5D5D5D5D5
            D7D7D7E0E0E0EFEFEFFAFAFAFEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8ECFD55B4FE5DC3FF49
            AFFF3994F34475C6616FAB8B7FA38C787F8B8B8BCBCBCBD8D8D8BDBDBD969696
            7A7A7A6D6D6D6A6A6A6A6A6A707070888888ACACACCFCFCFEAEAEAFBFBFBFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFD8ECFD55B4FE5DC3FF49AFFF3994F34475C6636C906C6C6C5D5D5D
            777777847A7A8D6D6D9568689A6767AC7A7AC69393CA9797A47E7E766363615E
            5E767676A7A7A7DDDDDDF9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD8ECFD55B4FE5DC3FF49AFFF
            87ABCF8282829B9B9BA3A1A1977575B6857FD8B295EDD2A8FFF1BEFFFAC7FFFE
            CCFCF8CCEDDDBDD6B6A5B08181755F5F606060989898D8D8D8F9F9F9FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFD7EAFD52B1FEA4CAE0BDBDBDACACAC857B7BB48484D8AA91FFDEABFFEB
            BCFFF7CAFFFDD2FFFFD3FFFFD6FFFFD6FFFFDAFFFFD9F2E8C9BF978F8566665C
            5C5C999999E0E0E0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1F7FEFDFDFDE0E0E0C0B6B6B888
            88E4B494FFDBAAFFF5CAFFFCCCFFFDCAFFFFCFFFFFD6FFFFDCFFFFE0FFFFDEFF
            FFE9FFFFF6FAF7ECC09A93816161646464B1B1B1EFEFEFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFD5D5D5BC9292E3B194FFD9AAFFFCD0FFF2BFFFF1BEFFFECCFFFFD4FF
            FFDBFFFFE3FFFFE9FFFFECFFFFFEFFFFFFFFFFFFFAF7E7B58C846555557E7E7E
            D5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFED3C1C1D2A295FFD3A2FFF8CEFFF1BEFF
            E9B6FFF5C2FFFFCEFFFFD7FFFFDFFFFFE7FFFFEFFFFFF5FFFFFFFFFFFFFFFFFF
            FFFFEEE8DBBE9265655E5E5EB0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F9F9C79D9DF0
            C8A2FFE8BCFFF7C4FFE2AFFFEAB7FFF6C3FFFFD0FFFFD9FFFFE0FFFFEBFFFFF3
            FFFFFAFFFFFCFFFFFCFFFFF9FFFFDDFFFFD7B790856B5858909090FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFEEE8E8CB9996FFDBA8FFFCD0FFE7B4FFDFACFFEAB7FFF6C3FFFFD0
            FFFFD8FFFFE0FFFFE9FFFFF1FFFFF8FFFFF8FFFFF1FFFFE8FFFFDBFFFFD8DAC7
            AA7F5D5D7D7D7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEE4D7D7D6A99CFFE6B9FFFACAFFDDAA
            FFDEABFFE8B5FFF3C0FFFFCDFFFFD6FFFFDEFFFFE5FFFFEBFFFFEEFFFFEEFFFF
            EBFFFFE5FFFFDCFFFFD5EDE3BA885F5F6E6E6EFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFEDCC2C2
            E4BDA4FFEEC4FFF9C6FFD6A3FFDBA8FFE4B1FFEEBBFFFDCAFFFFD1FFFFDAFFFF
            DFFFFFE4FFFFE6FFFFE6FFFFE4FFFFDFFFFFD9FFFFD1FFFBC89A67676E6E6EFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDFC5C5E4BFA5FFF2C9FFF9C6FFD5A2FFD7A4FFE0ADFFEA
            B7FFF4C1FFFECCFFFFD3FFFFD9FFFFDDFFFFDFFFFFDFFFFFDDFFFFD8FFFFD2FF
            FECEFFF3C09A67677D7D7DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEEE1E1D6AB9FFFECBFFFF9
            C8FFDEADFFEBC3FFEFC2FFEAB8FFF5C2FFFAC7FFFECCFFFFD0FFFFD4FFFFD5FF
            FFD5FFFFD4FFFFD0FFFFCCFFF8CAEDD4AA8C6262909090FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFF7F1F1CEA099FFEBBAFFFDD1FFF9D8FFE3B9FFDBACFFDBABFFE4B1FFF2BFFF
            F4C1FFFAC7FFFDCAFFFFCDFFFFCDFFFDCAFFF9C6FFFBC9FFF0C3DAB797866363
            B0B0B0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCEA5A5F0D6B0FFF7CEFFFCE7FFF0D3FF
            F2DBFFE4BCFFDBACFFE3B0FFF3C0FFEBB8FFF0BDFFF0BDFFF0BDFFEFBCFFF0BD
            FFFCCFFFE3B0B7887C897676D5D5D5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE7D3D3D2
            A79BFFF1C2FFFFFCFFFFFFFFFFFFFFF9EDFFE1B5FFDAA8FFF0C0FFE2AFFFE4B1
            FFE5B2FFE5B2FFE7B4FFFBC9FFE8B9E8BF99986B6BB1B1B1EFEFEFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFCBA2A2E3C3A6FFFFF9FFFFFFFFFFFFFFF9EEFFE6BB
            FFE6BBFFDFAFFFD8A5FFDAA7FFDCA9FFE8B5FFFAC8FFEFC5FACE9EB5847A9B8B
            8BE0E0E0FBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF1E7E7BF8F8FE4CFC4
            FFFFFFFFFFFFFFFCEDFFF6D7FFF8D4FFDFACFFDDAAFFE8B5FFF5C2FFFDCFFFE6
            BAFAC899C08D81A08080D8D8D8F9F9F9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFEFE6E6B98989D8BAA6FFF7D8FFF6DAFFFCD8FFFDD2FFFCCFFFFD
            D1FFFBCFFFF1C7FFDBABF2C69CBF8F85AA8B8BDDDDDDF9F9F9FFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F6F6C5A2A2B68781D8B8
            9CEDD3AAFFE8B5FFE4B1FFE2AFFCDCACEDC6A3D6A996B78787C1ABABEAEAEAFB
            FBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFECE3E3C3A3A3A87B7B9A6767AC7A7AC69393CA9797C8A2A2D0
            BABAE9E6E6F9F9F9FEFEFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          TabOrder = 0
          OnClick = btn_pesquisar_concretoClick
        end
      end
    end
    inherited btnLocalizar: TBitBtn
      Left = 1034
      Top = 19
      Width = 69
      Height = 146
      Align = alRight
      Visible = False
      ExplicitLeft = 1034
      ExplicitTop = 19
      ExplicitWidth = 69
      ExplicitHeight = 146
    end
    inherited edt_consulta: TEdit
      Left = 967
      Width = 26
      Visible = False
      ExplicitLeft = 967
      ExplicitWidth = 26
    end
  end
  inherited ToolBar1: TToolBar
    Width = 1105
    ButtonWidth = 114
    ExplicitWidth = 1105
    inherited btnIncluir: TToolButton
      Cursor = crHandPoint
      ExplicitWidth = 114
    end
    inherited btnAlterar: TToolButton
      Left = 114
      Cursor = crHandPoint
      Hint = 'Visualizar ou alterar o registro selecionado'
      Caption = '&Visualizar / Alterar'
      ExplicitLeft = 114
      ExplicitWidth = 114
    end
    inherited btnExcluir: TToolButton
      Left = 228
      Cursor = crHandPoint
      Hint = 'Excluir o registro selecionado'
      ExplicitLeft = 228
      ExplicitWidth = 114
    end
    inherited ToolButton4: TToolButton
      Left = 342
      ExplicitLeft = 342
    end
    inherited btnPesquisar: TToolButton
      Left = 347
      Cursor = crHandPoint
      Caption = 'Pesquisar >>'
      ExplicitLeft = 347
      ExplicitWidth = 114
    end
    inherited ToolButton7: TToolButton
      Left = 461
      ExplicitLeft = 461
    end
    inherited btnImprimir: TToolButton
      Left = 466
      Cursor = crHandPoint
      Caption = '&Imprimir...'
      ExplicitLeft = 466
      ExplicitWidth = 114
    end
  end
  inherited StatusBar: TStatusBar
    Top = 514
    Width = 1105
    Height = 27
    Font.Height = -13
    Panels = <
      item
        Width = 1000
      end>
    ExplicitTop = 514
    ExplicitWidth = 1105
    ExplicitHeight = 27
  end
  inherited PageControl1: TPageControl
    Top = 272
    Width = 1105
    Height = 242
    ExplicitTop = 272
    ExplicitWidth = 1105
    ExplicitHeight = 242
    inherited TabSheet1: TTabSheet
      ExplicitWidth = 1097
      ExplicitHeight = 232
      inherited Panel5: TPanel
        Width = 1097
        Height = 232
        ExplicitWidth = 1097
        ExplicitHeight = 232
        inherited DBGrid1: TDBGrid
          Width = 1057
          Height = 181
          PopupMenu = ppm_financeiro
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'ID'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'ID Pedido'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Visible = False
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_EMISSAO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Emiss'#227'o'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_CONTABIL'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Data Cont'#225'bil'
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NOSSO_NUMERO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'N'#250'mero do Pedido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLIENTE'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Cliente / Empresa'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 320
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'SITUACAO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Situa'#231#227'o'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 123
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_VENDEDOR'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Vendedor'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 149
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'DATA_ENTREGA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Entrega'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -12
              Title.Font.Name = 'Segoe UI Semibold'
              Title.Font.Style = [fsBold]
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_TOTAL_PEDIDO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Valor do Pedido'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_PAGO'
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Valor Pago'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESTA'
              Font.Charset = ANSI_CHARSET
              Font.Color = clRed
              Font.Height = -13
              Font.Name = 'Segoe UI'
              Font.Style = []
              Title.Alignment = taCenter
              Title.Caption = 'Resta'
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          Width = 1057
          ExplicitWidth = 1057
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    Width = 1105
    ExplicitWidth = 1105
    inherited btn_fechar: TSpeedButton
      Left = 1035
      ExplicitLeft = 1035
    end
    inherited lbl_titulo: TLabel
      Width = 231
      Height = 56
      Caption = 'CONTROLE DE PEDIDOS'
      ExplicitWidth = 231
    end
    inherited pnl_separa_topo: TPanel
      Width = 1105
      ExplicitWidth = 1105
    end
  end
  inherited ds: TDataSource
    Left = 647
    Top = 196
  end
  inherited qry: TFDQuery
    Filtered = True
    FormatOptions.AssignedValues = [fvFmtDisplayNumeric]
    Left = 647
    Top = 223
    object qryID: TIntegerField
      FieldName = 'ID'
    end
    object qryORCAMENTO: TStringField
      FieldName = 'ORCAMENTO'
    end
    object qryNOSSO_NUMERO: TStringField
      FieldName = 'NOSSO_NUMERO'
    end
    object qryCLIENTE_ID: TIntegerField
      FieldName = 'CLIENTE_ID'
    end
    object qryNOME_CLIENTE: TStringField
      FieldName = 'NOME_CLIENTE'
      Size = 120
    end
    object qryENDERECO: TStringField
      FieldName = 'ENDERECO'
    end
    object qryNUMERO: TStringField
      FieldName = 'NUMERO'
    end
    object qryBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qryCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object qryCEP: TStringField
      FieldName = 'CEP'
    end
    object qryVENDEDOR_ID: TIntegerField
      FieldName = 'VENDEDOR_ID'
    end
    object qryNOME_VENDEDOR: TStringField
      FieldName = 'NOME_VENDEDOR'
      Size = 30
    end
    object qryDATA_EMISSAO: TDateField
      FieldName = 'DATA_EMISSAO'
    end
    object qryDATA_CONTABIL: TDateField
      FieldName = 'DATA_CONTABIL'
    end
    object qryDATA_ENTREGA: TDateField
      FieldName = 'DATA_ENTREGA'
    end
    object qrySITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 15
    end
    object qryVALOR_TOTAL_PEDIDO: TCurrencyField
      FieldName = 'VALOR_TOTAL_PEDIDO'
      DisplayFormat = '0.00'
    end
    object qryVALOR_PAGO: TCurrencyField
      FieldName = 'VALOR_PAGO'
      DisplayFormat = '0.00'
    end
    object qryPAGO: TStringField
      FieldName = 'PAGO'
    end
    object qryRESTA: TFMTBCDField
      FieldName = 'RESTA'
      DisplayFormat = '0.00'
    end
  end
  inherited ImageList1: TImageList
    Left = 624
  end
  inherited ActionList1: TActionList
    Left = 592
    inherited actIncluir: TAction
      Caption = '&Novo Pedido'
    end
    inherited actPesquisar: TAction
      Caption = '&Pesquisa >>'
    end
    inherited actImprimir: TAction
      OnExecute = actImprimirExecute
    end
    inherited actLocalizar: TAction
      Caption = ''
    end
  end
  object qryCliente: TFDQuery
    SQL.Strings = (
      'select'
      '  P.ID,'
      '  P.NOME,'
      '  P.ENDERECO, '
      'P.NUMERO,'
      'P.BAIRRO,'
      'P.CIDADE'
      'from'
      '  PESSOAS P, CLIENTES C'
      'where'
      '  P.ID = C.pessoa_id'
      'order by'
      '  P.nome')
    Left = 674
    Top = 223
  end
  object dsCliente: TDataSource
    AutoEdit = False
    DataSet = qryCliente
    Left = 674
    Top = 196
  end
  object qryVendedor: TFDQuery
    SQL.Strings = (
      'select'
      '  P.ID,'
      '  P.NOME'
      'from'
      '  PESSOAS P, VENDEDORES V'
      'where'
      '  P.ID = V.PESSOA_ID'
      'order by'
      '  P.NOME')
    Left = 701
    Top = 223
  end
  object dsVendedor: TDataSource
    AutoEdit = False
    DataSet = qryVendedor
    Left = 701
    Top = 196
  end
  object qryQtde: TFDQuery
    Left = 593
    Top = 223
  end
  object qrySistema: TFDQuery
    Left = 620
    Top = 223
  end
  object ppm_financeiro: TPopupMenu
    Images = ImageList1
    Left = 620
    Top = 196
    object mn_conta_receber: TMenuItem
      Caption = 'CONTA A RECEBER'
      OnClick = mn_conta_receberClick
    end
    object CUSTOS1: TMenuItem
      Caption = '-'
      SubMenuImages = ImageList1
    end
    object mn_custo_comissao: TMenuItem
      Caption = 'CUSTO / COMISS'#195'O'
      OnClick = mn_custo_comissaoClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mn_totais: TMenuItem
      Caption = 'TOTAIS ( Pesquisa selecionada )'
      OnClick = mn_totaisClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object menu_imprimir: TMenuItem
      Caption = 'IMPRIMIR PESQUISA'
      OnClick = menu_imprimirClick
    end
  end
  object frx_rel_pedidos: TfrxReport
    Version = '2022.2'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Padr'#227'o'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 45749.813682719910000000
    ReportOptions.LastChange = 45749.813682719910000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      '   '
      'end.')
    Left = 656
    Top = 8
    Datasets = <
      item
        DataSet = frxDBEmpresa
        DataSetName = 'Empresa'
      end
      item
        DataSet = frxDBPedidos
        DataSetName = 'Pedidos'
      end
      item
        DataSet = frxDBImagem
        DataSetName = 'Imagem'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 66.031530240000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Picture1: TfrxPictureView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779530000000000000
          Width = 105.275510000000000000
          Height = 43.070810000000000000
          OnAfterData = 'Picture1OnAfterData'
          Center = True
          Frame.Typ = []
          Stretched = False
          HightQuality = False
          Transparent = False
          TransparentColor = clWhite
        end
        object EmpresaNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 3.779530000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Empresa."NOME"] CNPJ: [Empresa."CPF_CNPJ"]')
          ParentFont = False
        end
        object EmpresaENDERECO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 20.456710000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              '[Empresa."ENDERECO"],[Empresa."NUMERO"] [Empresa."BAIRRO"] [Empr' +
              'esa."CIDADE"] [Empresa."UF"]')
          ParentFont = False
        end
        object EmpresaTELEFONE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 35.795300000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Telefone : [Empresa."TELEFONE1"]  WhatsApp : [Empresa."TELEFONE2' +
              '"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
        object EmpresaSITE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 132.283550000000000000
          Top = 50.913420000000000000
          Width = 544.252320000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Site [Empresa."SITE"] / Email [Empresa."EMAIL"]')
          ParentFont = False
          Formats = <
            item
            end
            item
            end>
        end
      end
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 37.795275590000000000
        Top = 109.606370000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 181.417440000000000000
          Top = 11.338590000000000000
          Width = 362.834880000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'RELAT'#211'RIO DE PEDIDOS')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Top = 35.559060000000000000
          Width = 718.110236220000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Top = 3.779530000000000000
          Width = 718.110236220000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
      end
      object ColumnHeader1: TfrxColumnHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677167800000000000
        Top = 170.078850000000000000
        Width = 718.110700000000000000
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Width = 49.133868030000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nr Ped.')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 51.354360000000000000
          Width = 52.913192990000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 284.787570000000000000
          Width = 71.811070000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Situa'#231#227'o')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Top = 19.456710000000000000
          Width = 718.110236220000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object ComprasNOME: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 130.606370000000000000
          Width = 75.590600000000000000
          Height = 15.118110240000000000
          DataSet = frmCompras.frxDBPesquisa
          DataSetName = 'Compras'
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 382.173470000000000000
          Width = 83.149432990000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Dt Entrega')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 467.102660000000000000
          Width = 83.149432990000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Vr Pedido')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 550.252320000000000000
          Width = 83.149432990000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Vr Pago')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 637.181510000000000000
          Width = 83.149432990000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Resta')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 18.897650000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        DataSet = frxDBPedidos
        DataSetName = 'Pedidos'
        RowCount = 0
        object ContasPagarCADASTRADO_EM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Width = 49.133843620000000000
          Height = 15.118110240000000000
          DataSet = frmContasPagar.frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[Pedidos."ID"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 49.913420000000000000
          Width = 71.811023620000000000
          Height = 15.118110240000000000
          DataSet = frmContasPagar.frxDBContasPagar
          DataSetName = 'ContasPagar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[Pedidos."DATA_EMISSAO"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 124.047310000000000000
          Width = 151.181153620000000000
          Height = 15.118110240000000000
          DataField = 'NOME_CLIENTE'
          DataSet = frxDBPedidos
          DataSetName = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Pedidos."NOME_CLIENTE"]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 278.346630000000000000
          Width = 98.267733620000000000
          Height = 15.118110240000000000
          DataField = 'SITUACAO'
          DataSet = frxDBPedidos
          DataSetName = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[Pedidos."SITUACAO"]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 380.716760000000000000
          Width = 79.370083620000000000
          Height = 15.118110240000000000
          DataField = 'DATA_ENTREGA'
          DataSet = frxDBPedidos
          DataSetName = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haBlock
          Memo.UTF8W = (
            '[Pedidos."DATA_ENTREGA"]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 465.425480000000000000
          Width = 79.370083620000000000
          Height = 15.118110240000000000
          DataField = 'VALOR_TOTAL_PEDIDO'
          DataSet = frxDBPedidos
          DataSetName = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Pedidos."VALOR_TOTAL_PEDIDO"]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 549.134200000000000000
          Width = 79.370083620000000000
          Height = 15.118110240000000000
          DataField = 'VALOR_PAGO'
          DataSet = frxDBPedidos
          DataSetName = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Pedidos."VALOR_PAGO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 633.063390000000000000
          Width = 79.370083620000000000
          Height = 15.118110240000000000
          DataField = 'RESTA'
          DataSet = frxDBPedidos
          DataSetName = 'Pedidos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Pedidos."RESTA"]')
          ParentFont = False
        end
      end
      object ReportSummary1: TfrxReportSummary
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 60.472480000000000000
        Top = 332.598640000000000000
        Width = 718.110700000000000000
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 619.291338580000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<PEDIDOS."VALOR_TOTAL_PEDIDO">,MasterData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 449.763725830000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR DOS PEDIDOS R$')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Width = 718.110236220000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 620.291682750000000000
          Top = 17.897650000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<PEDIDOS."VALOR_PAGO">,MasterData1)]')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 502.677490000000000000
          Top = 18.897650000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR PAGO R$')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 620.291682750000000000
          Top = 35.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<PEDIDOS."RESTA">,MasterData1)]')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 546.031850000000000000
          Top = 37.795300000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RESTA R$')
          ParentFont = False
        end
      end
      object PageFooter1: TfrxPageFooter
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677165350000000000
        Top = 415.748300000000000000
        Width = 718.110700000000000000
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Width = 740.787401570000000000
          Height = 0.377952760000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = [ftTop]
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 3.779527559055120000
          Width = 234.330860000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data da Impress'#227'o: [Date][Time]')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 268.787570000000000000
          Top = 3.779527559055120000
          Width = 268.346630000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'SysLajes - Sistema de Gerenciamento de Lajes ')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 610.165740000000000000
          Top = 3.779527560000000000
          Width = 136.063080000000000000
          Height = 15.118110240000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'P'#225'gina : [Page]')
          ParentFont = False
        end
      end
    end
  end
  object frxDBEmpresa: TfrxDBDataset
    UserName = 'Empresa'
    CloseDataSource = False
    DataSet = qryEmpresa
    BCDToCurrency = False
    DataSetOptions = []
    Left = 688
    Top = 8
  end
  object qryEmpresa: TFDQuery
    SQL.Strings = (
      
        'select P.*, E.*  from PESSOAS P, EMPRESA E where E.PESSOA_ID = P' +
        '.ID')
    Left = 689
    Top = 38
  end
  object frxDBPedidos: TfrxDBDataset
    UserName = 'Pedidos'
    CloseDataSource = False
    DataSet = qry
    BCDToCurrency = False
    DataSetOptions = []
    Left = 720
    Top = 8
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Transparency = False
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 560
    Top = 16
  end
  object frxDBImagem: TfrxDBDataset
    UserName = 'Imagem'
    CloseDataSource = False
    DataSet = qryImagemRelatorio
    BCDToCurrency = False
    DataSetOptions = []
    Left = 792
    Top = 8
  end
  object qryImagemRelatorio: TFDQuery
    SQL.Strings = (
      'select PEDIDO_RELATORIOS_LOGO_PEDIDO from CONFIGURACOES_SISTEMA')
    Left = 796
    Top = 38
  end
end
