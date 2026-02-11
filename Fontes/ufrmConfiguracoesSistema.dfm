inherited frmConfiguracoesSistema: TfrmConfiguracoesSistema
  Caption = 'frmConfiguracoesSistema'
  ClientHeight = 513
  ClientWidth = 836
  ExplicitWidth = 848
  ExplicitHeight = 551
  TextHeight = 17
  inherited pnTitulo: TPanel
    Width = 836
    ExplicitWidth = 832
    inherited lbl_titulo: TLabel
      Width = 836
      Height = 40
      OnDblClick = lbl_tituloDblClick
    end
    inherited lbl_sub_titulo: TLabel
      Width = 836
    end
  end
  inherited pnDados: TPanel
    Width = 836
    Height = 419
    ExplicitWidth = 832
    ExplicitHeight = 418
    object PageControl1: TPageControl
      Left = 0
      Top = 0
      Width = 836
      Height = 419
      ActivePage = tbs_pedido
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 832
      ExplicitHeight = 418
      object tbs_geral: TTabSheet
        Caption = 'Geral'
        ImageIndex = 1
        object Label3: TLabel
          Left = 24
          Top = 16
          Width = 51
          Height = 17
          Caption = 'Empresa'
        end
        object Label4: TLabel
          Left = 24
          Top = 104
          Width = 334
          Height = 17
          Caption = 'Quantidade de formas de 130 mm ( em metros lineares )'
        end
        object Label10: TLabel
          Left = 24
          Top = 167
          Width = 334
          Height = 17
          Caption = 'Quantidade de formas de 250 mm ( em metros lineares )'
        end
        object lbl_senha: TLabel
          Left = 24
          Top = 238
          Width = 225
          Height = 17
          Caption = 'Senha para uso vitalicio ( visible false )'
          Visible = False
        end
        object edt_empresa: TEdit
          Left = 24
          Top = 35
          Width = 313
          Height = 25
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object edt_qtde_130: TEdit
          Left = 24
          Top = 123
          Width = 105
          Height = 25
          NumbersOnly = True
          TabOrder = 1
        end
        object edt_qtde_250: TEdit
          Left = 24
          Top = 190
          Width = 105
          Height = 25
          NumbersOnly = True
          TabOrder = 2
        end
        object edt_senha_uso_vitalicio: TEdit
          Left = 24
          Top = 259
          Width = 334
          Height = 25
          TabOrder = 3
          Visible = False
        end
      end
      object tbs_pedido: TTabSheet
        Caption = 'Pedido'
        ImageIndex = 2
        object pgc_pedidos: TPageControl
          Left = 0
          Top = 0
          Width = 828
          Height = 387
          ActivePage = tbs_pedido_relatorios
          Align = alClient
          TabOrder = 0
          ExplicitWidth = 824
          ExplicitHeight = 386
          object tbs_pedido_comissoes: TTabSheet
            Caption = 'Comiss'#245'es / Contas '#224' pagar'
            object Label5: TLabel
              Left = 0
              Top = 5
              Width = 271
              Height = 17
              Caption = 'Lan'#231'ar comiss'#245'es de VENDEDORES na conta...'
            end
            object Label6: TLabel
              Left = 0
              Top = 66
              Width = 288
              Height = 17
              Caption = 'Lan'#231'ar comiss'#245'es de ADMINISTRATIVA na conta...'
            end
            object Label13: TLabel
              Left = 0
              Top = 128
              Width = 280
              Height = 17
              Caption = 'Lan'#231'ar Compra de Concreto Usinado na conta...'
            end
            object Label14: TLabel
              Left = 0
              Top = 192
              Width = 315
              Height = 17
              Caption = 'Lan'#231'ar Contrata'#231#227'o de bomba de concreto na conta...'
            end
            object cbx_comissao_vendedor: TDBLookupComboBox
              Left = 0
              Top = 26
              Width = 545
              Height = 25
              KeyField = 'ID'
              ListField = 'DESCRICAO'
              ListSource = ds_comissao_vendedor
              TabOrder = 0
            end
            object cbx_comissao_adm: TDBLookupComboBox
              Left = 0
              Top = 87
              Width = 545
              Height = 25
              KeyField = 'ID'
              ListField = 'DESCRICAO'
              ListSource = ds_comissao_adm
              TabOrder = 1
            end
            object cbx_concreto_usinado: TDBLookupComboBox
              Left = 0
              Top = 149
              Width = 545
              Height = 25
              KeyField = 'ID'
              ListField = 'DESCRICAO'
              ListSource = ds_concreto_usinado
              TabOrder = 2
            end
            object cbx_bomba_concreto: TDBLookupComboBox
              Left = 0
              Top = 213
              Width = 545
              Height = 25
              KeyField = 'ID'
              ListField = 'DESCRICAO'
              ListSource = ds_bomba_concreto
              TabOrder = 3
            end
          end
          object tbs_pedido_relatorios: TTabSheet
            Caption = 'Relat'#243'rios'
            ImageIndex = 1
            object Label7: TLabel
              Left = 95
              Top = 14
              Width = 125
              Height = 17
              Caption = 'Imagem topo pedido'
            end
            object img_logo: TImage
              Left = 16
              Top = 14
              Width = 73
              Height = 67
              DragCursor = crHandPoint
              Picture.Data = {
                0954506E67496D61676589504E470D0A1A0A0000000D49484452000000440000
                00440806000000381393B2000000017352474200AECE1CE90000000467414D41
                0000B18F0BFC6105000000097048597300000EC400000EC401952B0E1B00000E
                434944415478DAED9B75AC944717C6E7622D5E8A168A84E26E451A824B8004F8
                03491320C182BB176F71D7A0810241030910282E813F70B7E0EE0EC5A5DFF79B
                7C677376EEFBEEDDBDC807CD9D64B3F6EEBC33CF3CE73932B351FFFCB799B816
                6851718004B738409C160788D3E20071DA6705E4EAD5ABE6F1E3C7E6D6AD5BE6
                C68D1BE6CE9D3BE6C99327E6F5EBD7262A2ACA244A94C8A44C99D2A44F9FDE64
                CA94C9A44D9BD67CF7DD77F6F5BF0690CB972F9B2D5BB6982B57AE98DBB76F9B
                870F1F9AF7EFDF9B8409139A0409129878F1E25930687CCEE3EDDBB7F6C1F700
                922143069339736653B9726593254B96AF0F90972F5F9A3D7BF698A54B979A7B
                F7EE99C489139BF8F1E30700E0C1C469DC5E860030020ED7F0F9BB77EFEC0380
                E8F7FBEFBF370D1A343065CA9431DF7EFBED970FC8EAD5AB038C489D3AB50541
                1A136352CF9F3FB7EF6149B264C902D730E9BFFFFEDB9A108000E437DF7C13D4
                07D73C78F0C0FCF8E38FA652A54AA66EDDBA5F262067CF9E3513274EB4834D92
                24899D2C0D000408E85FA8502153B264493B213443584313730110F466DFBE7D
                E6E8D1A35667B8963E7986455CF3E2C50BDB67A74E9D4CAE5CB9BE0C4098EC8C
                1933CC860D1B4CBA74E9AC6930415800083FFDF4932950A080A956AD9A654C6C
                1A206FDAB4C91C3F7EDC028FA9003A430740C4B96AD5AAA66DDBB60170FF2F80
                3C7AF4C88C1A35CA0E92C9B272324056AC7EFDFAA658B16201CA732B58203AC1
                B3BEBDFB5E3E93EB01FFD0A14366C58A15E6C48913566C59001A5AC53D7BF4E8
                6159F3D901B974E992E9DAB5AB49912285B575BA79FAF4A9D584E6CD9B5BB390
                A6859326A22A00B8EF0500F9AD0B0CEDE0C18366E6CC995673B8A7B012F31A37
                6E9CC9962DDBE703E4F4E9D366E0C08101416432B8D45AB56A99C68D1B070072
                27A427A927EFC712AF6B343068C8FCF9F3CDBA75EB2C5BF8FCCD9B37E6D9B367
                E6F7DF7F373973E6FCF480C08C3E7DFA98A449935A30A0310368D9B2A5A958B1
                62102364E5FD18216CD1E0B9BFF1EB437E4BDBBC79B359B870A1F54862B63067
                F8F0E1113325224008AA9A356B66F502C517A5673572E4C8112DA67057DE8B31
                5EEC08F5AC59A641E9DFBFBF8D80B50BBF7FFFBE9933674E449A12362030819B
                1272A3F2DC109BEDDEBDBB154E5971AFC9C6A419A134C4658EBE46AEEBD7AF9F
                75D3781E9A308AC522EC67C1447C3F1A2053A64C31DBB76FB7F905E040C92143
                8698ECD9B307798E70F520361AA2EF21CCE8D2A58BD52F72202F10EFDEBD6BCA
                972F6FDAB76FFFF100C1ADC2841F7EF8C1BE879A9D3B7736152A5488E646635A
                79F759FFC6AB0F2FE0048CC183079B73E7CE5971D74D722109ED61F5E8D1A3C3
                0ADEC202A45DBB76E6D5AB575637706B88678B162D82C450AF5E6CD9A019E6F7
                5B01A35BB76E9619C993270F1A2B66025B480609E4F078781E0477EAD4A91F0E
                C8CA952BCDB265CB6CBC81A9608B13264CB0E87BD97DA8897BD97F384DEE231E
                045385B58C49DF1B4D635CC4212C9E9809636621091463CA7D420202DA3D7BF6
                B4372287B87EFDBA8D3F8A172F1E4D44FD02287752720D512E0920AB27693F9F
                C30009FF595D97E67DFBF6B525056186000283F9CDD0A1436D3D8546C63D6CD8
                302BACA411840A44D6F41B2B4010D1499326D91B000EB90A1D8A7B75D921CFB8
                3B549F01A2FCDA25F319811D66C80A0B085EE0514CAA5EBDBAD52FD82960B86E
                94B1D1F7BC79F3029FC9B87AF7EE6D4D0B10D0BE0E1D3A04E2A5880169D3A68D
                5D417C3B2B4AA84E482EECF07293BC26A426E163108049EEA1DBAA55ABCCE2C5
                8B6D6DC3EFF6F4235932131D346890155057338885181FCCCD98316334269231
                8F1D3BD6A44A95CACE05539A366D5AE480B0C208174118838276DC940E5D4FC2
                C0A5F2C56744AE620A8899AC180D900063FDFAF5411AA041D660D360E6850B17
                2C187A01A47884A6C9779A1D022AE3BE79F3A6357B32E7912347FA46B0BE80CC
                9D3BD76CDBB6CD529E09D6AC59D3FCFAEBAF9E3187DC1CEA62B344B43AC375B3
                5C56557B0C5784F577BCE67A1758F90D138619F5EAD533050B168CC65EFAC129
                AC59B3C66A0873215C20E28E0810A23BF21641159AC116AF1881C68DC940891A
                29FE848A25042C61069E434F84EF434596AE99A259087DAF5EBDA2E53D22E0AD
                5AB5B2260AB8D465614DD8805CBB76CDAE3403959BA30B5E62AAE9B97BF76E1B
                0011CDC614DE3060A25D560D73C4C669981A2288A0EAD2A1FB5BCD1498993B77
                6E2BBA5E0B01400022DF0136D7B270610142F105F7858D43310ABA54A334ED35
                B5253EA178839B16B72783F76214264095AB5CB9721610DD2FD9344526D8A91B
                0BA48BD61AD85F7EF925C010D70C192341196E9805006C00C99F3F7F7880E06E
                C5441818AEAB4489129E80E89BC7B67C476109DD619293274FB60CD5DE44B482
                107DFCF8F1BEFD7865DBC2DEBD7BF7DA90018106543CA897FBF50484DAC2DAB5
                6B6D080C200CD275691A1059056EB46BD7AE40D6E936561873223B96F798E299
                33676CD0877D63E7EEF602F785A9B56BD7B6F914D7E9C67B0A44458B168D5633
                1140E8BF63C78E96BD30A4468D1AA651A346E101C22A407F26C68F01244D9A34
                81C179256F3C44545905B75BDE13F10ADB10EADF7EFBCDD21D00D00BAF085726
                CF35FC5E47C8D2F89C3E5D51D5CF2C16A13C411DD7172952C4C65561013260C0
                001B564BCC416043475E0CD1E000087906ABE08A2EB14C9E3C79ECA0114EB406
                EF804D6BB6E9FE61105A43E961E7CE9D964D988D9B27C19EC2850BDBB8C92B68
                144FC3F7002F9E866C392C4024DC05103AC3F6301FAF55D780ECDFBFDF96EDC4
                CBE8EFD089264D9AD8ED881D3B7658168AF8FA05666242782E34063069DA250B
                F3D8EF21C477FB91FBC37461100BC2BD478C1811392074C60FFD18228DEB0893
                B9969B49F42A946542047B7808F21818E37A1117681EE42E4B962CB122CB8459
                69D7BC60087B3FB0CEAFEEFA418088C93060263666CC181B27C41487C0106EE2
                3284673483BD5E1A112F130CA7AC87A8E386D108CC91105EA2560D082ED42B30
                13867C90C9A019478E1CB1A24A47D830A2EA0788ACC48103073C4D8667F48210
                9AC66635A6E0D6505C86D02801B2F954AA5429F3C71F7F988B172F46030493C9
                972F5F0010AFC0EC834475C1820581E48B15A20440F0E4E631AE9D6A51750786
                37418BFEFCF34FEB66B56BF50384074C5DB46891D530268016B9CC2252CD9B37
                AF3575BFC08C3222A93F1E906251446E97A48EC00C560088AC905F854C6E7AF8
                F061BB8A30444F4C923B3489C1BB895AB441A924108AE35DD02026EC556E60C5
                B5C9788D4D9B336C8D2830A31649E8CEAA609F8001DDFCC270594D76EA499A74
                E8AE27A06396505B96D21838FD2198940C0816C5EDEA3E00844C978573011151
                257427D7C2CDC3908842776A21247708AA7C3D6BD6AC18013976EC989D00B474
                01F1AAB0D11FA53FD97113F7CB7D892C5BB76E6D6BA0BC2739A3C1989800D126
                23FD7E50724773D3FFE9D3A70755B8BC44D58B212E756550B85D3C0DE5C553A7
                4E05D548F89CAD515941CE7FE036FD74C78B211A0CCC0D40C8CD58008A437852
                4F73F503842D40923C3C0D374484A440A4A91D4A43FC5842044ABF045CA22727
                4F9EB42091939037D18885A886C15877EFC505440766EE4211C7FCF5D75F81B9
                A01D4D9B368D0C10D49D1B485185A40ABF2DBBFD6E954BDC2EA6A601F1322F71
                DFAC1447275C4601CCF2E5CBCDC68D1B6DBFC20C3FF3D36E54E73AFC16F07509
                11B6E0EDB266CD1A192034941830F00E50966D4329327B6908A2450CA34F0AF9
                55E7453F1820420738808D7B8419B87C5811CEE11A17101D7F5003214D20FE00
                9C58179969EE3604CF1468BDEA0EDC9C0C19EF2499B16EBA54E8DAB89C3294F2
                22A2E70210AA113C522072459507E13CA1032903405302A0A61A2B40A02E1D12
                5461EB283F27007EFEF9E7A06AB9B836C48F6BE5C09DEE8701457A562354042B
                EF79A00D981E8CD2E321B742D3082A6123DF632EA18E73C6B895C91E0A2137CA
                2F091B146410FAE6DC980854D27969308BDFA2EADA1D7F8AA60FE1604698389F
                C138225C52863A75EA84EC23A2CD6EE80C03CA962D6B630469882FA2E56E2249
                464B848838EB41CBC0FDBC96FB7D38EFA51F1E6C94514381155257F9289BDD34
                B61EB14F71874C1E5BE4A83526C48E9A7B3E0366C8C633ACD1BA23038F2974F7
                3A19E057A0D25AB675EB567B6696F1F219428DD88773E62CEC0333882B882398
                980E3505223DEA156E0D1536710DCC1010FDCE98457ADAC8EF5895982F8BC322
                4979812C97CA3E895D382D6C40A01D3A00DA08A4780D574061069FCD9E3D3B30
                E87099E15E13EEB380829723D883918081C9B220E8DB473F5245D387EEBC3691
                1800B64AD82F25807026E832C58F1D5EEFE5FAF3E7CF5B6660A6E8961CBAA34A
                F7490EDD49D3C732F5C63726C260885465E3D92B83F502C00F90984E20898723
                5E4244115098001864E99FFC58A634F7E0AEB083220DAE8E15F24A0263624628
                3605061C157C70976216798A9CB347DBF084A4196C6F46DA627DB49B521E9387
                8E12E8889BC5AC4A972E1DC48A7098A101D100B805631A3B7124A072B49B8698
                13B5122745CA8C0F06844659001143D9257F9163DEECC1704481DD34F76884BC
                D6A798FDE210ED59587D8493C40F96A25302127A412981C85A36CE3F3B2034EC
                958007DF4F962B5B04448AAC187F0FA156C17E8C0467B1019ECC970214E0EBBF
                870012AEB54A952A3619F53B31F0D90091C68A11AB405951FA7FFE77D845FE1E
                267F20624B816D00AE91037622CC12E310FC913D53FDC7BBC976A7FC8108B079
                7C717F20721BC738610B3BF85057C72972664C0EC9F11DDE4A36ACE49F0CB29F
                4BBCA38F3EC835308673A85FF45FCC7463D2AC2E49A13ECF210F5D247205573F
                E418843CE817AD6AD8B0A12D7C7F157F42741B9537FEBE411990639198149383
                FEFA5F9A028CFE9B2AE0611254EBBEEABFA9FA35CC084028D8E83F32337940C2
                74A89421CED430A8AF92347A55C7FF15807C0D2D0E10A7C501E2B438409C1607
                88D3FE032A9FA5F8F466C19C0000000049454E44AE426082}
              Stretch = True
            end
            object SpeedButton1: TSpeedButton
              Left = 558
              Top = 32
              Width = 23
              Height = 22
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
              OnClick = SpeedButton1Click
            end
            object Label11: TLabel
              Left = 36
              Top = 291
              Width = 418
              Height = 15
              Caption = 
                '1 -  quando desmarcado oculta a aba comiss'#245'es da tela de emissao' +
                ' de pedidos.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
            end
            object Label12: TLabel
              Left = 36
              Top = 314
              Width = 527
              Height = 30
              Caption = 
                '2 - quando desmarcado, mostra o campo "Comiss'#227'o do vendedor" na ' +
                'tela de emiss'#227'o de pedidos e o valor digitado ser'#225' lancado somen' +
                'te na tabela de contas a pagar.'
              Font.Charset = ANSI_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'Segoe UI'
              Font.Style = []
              ParentFont = False
              WordWrap = True
            end
            object edt_pedido_relatorios_img_pedido: TEdit
              Left = 95
              Top = 32
              Width = 457
              Height = 25
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object cb_mostrar_botao_contrato: TCheckBox
              Left = 16
              Top = 203
              Width = 257
              Height = 17
              Caption = 'Mostrar BOT'#195'O IMPRIMIR CONTRATO'
              TabOrder = 1
            end
            object cb_mostrar_botao_comissao: TCheckBox
              Left = 16
              Top = 235
              Width = 753
              Height = 25
              Caption = 'Mostrar BOT'#195'O IMPRIMIR COMISS'#195'O'
              TabOrder = 2
              WordWrap = True
            end
            object cb_mostrar_qtde_laje_ordem_entrega: TCheckBox
              Left = 16
              Top = 167
              Width = 417
              Height = 17
              Caption = 'Mostrar a quantidade vendida da Laje na ORDEM DE ENTREGA'
              TabOrder = 3
            end
            object cb_ordem_entrega_com_cabecalho: TCheckBox
              Left = 16
              Top = 130
              Width = 625
              Height = 17
              Caption = 
                'Imprimir ORDEM DE ENTREGA com cabe'#231'alho( se desmarcado n'#227'o mostr' +
                'a os dados da empresa)'
              TabOrder = 4
            end
            object cb_pedido_com_cabecalho: TCheckBox
              Left = 16
              Top = 95
              Width = 625
              Height = 17
              Caption = 
                'Imprimir PEDIDO com cabe'#231'alho( se desmarcado n'#227'o mostra os dados' +
                ' da empresa)'
              TabOrder = 5
            end
            object BitBtn1: TBitBtn
              Left = 292
              Top = 203
              Width = 289
              Height = 25
              Caption = 'Editar contrato de presta'#231#227'o de servi'#231'o ...'
              TabOrder = 6
              OnClick = BitBtn1Click
            end
          end
          object TabSheet1: TTabSheet
            Caption = 'Outras configura'#231#245'es no pedido'
            ImageIndex = 2
            object GroupBox2: TGroupBox
              Left = 0
              Top = 0
              Width = 820
              Height = 355
              Align = alClient
              Caption = 'Configura'#231#227'o da Tela de Pedidos'
              TabOrder = 0
              object GroupBox4: TGroupBox
                Left = 16
                Top = 20
                Width = 270
                Height = 285
                Caption = 'Grade de Pedidos'
                TabOrder = 0
                object cb_mostrar_coluna_id_pedido: TCheckBox
                  Left = 13
                  Top = 40
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "ID PEDIDO"'
                  TabOrder = 0
                end
                object cb_mostrar_coluna_nosso_numero: TCheckBox
                  Left = 13
                  Top = 162
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "NOSSO NUMERO"'
                  TabOrder = 1
                end
                object cb_mostrar_coluna_valor_pedido: TCheckBox
                  Left = 13
                  Top = 190
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "VALOR PEDIDO"'
                  TabOrder = 2
                end
                object cb_mostrar_coluna_valor_pago: TCheckBox
                  Left = 13
                  Top = 220
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "VALOR PAGO"'
                  TabOrder = 3
                end
                object cb_mostrar_coluna_resta_pagar: TCheckBox
                  Left = 13
                  Top = 248
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "RESTA PAGAR"'
                  TabOrder = 4
                end
                object cb_mostrar_coluna_data_emissao: TCheckBox
                  Left = 13
                  Top = 72
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "DATA EMISS'#195'O"'
                  TabOrder = 5
                end
                object cb_mostrar_coluna_data_contabil: TCheckBox
                  Left = 13
                  Top = 104
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "DATA CONT'#193'BIL"'
                  TabOrder = 6
                end
                object cb_mostrar_coluna_data_entrega: TCheckBox
                  Left = 13
                  Top = 133
                  Width = 250
                  Height = 17
                  Caption = 'mostrar coluna "DATA ENTREGA"'
                  TabOrder = 7
                end
              end
              object GroupBox5: TGroupBox
                Left = 292
                Top = 20
                Width = 485
                Height = 285
                Caption = 'Tela de emiss'#227'o de pedidos'
                TabOrder = 1
                object cb_pedir_forma_pagto: TCheckBox
                  Left = 3
                  Top = 72
                  Width = 250
                  Height = 17
                  Caption = 'pedir forma de pagamento'
                  TabOrder = 0
                end
                object cb_pedido_mostrar_aba_financeiro: TCheckBox
                  Left = 3
                  Top = 29
                  Width = 250
                  Height = 17
                  Caption = 'mostrar aba "Financeiro"'
                  TabOrder = 1
                end
                object cb_calculo_laje: TCheckBox
                  Left = 3
                  Top = 104
                  Width = 342
                  Height = 57
                  BiDiMode = bdLeftToRight
                  Caption = 
                    'na Aba Finaceiro, calcular custo da laje pelo custos da vigas. S' +
                    'e desmarcado, calcula por metragem real da laje x preco da laje'
                  Ctl3D = True
                  ParentBiDiMode = False
                  ParentCtl3D = False
                  TabOrder = 2
                  WordWrap = True
                end
                object cb_pedido_preco_vendedor: TCheckBox
                  Left = 3
                  Top = 184
                  Width = 446
                  Height = 17
                  Caption = 'mostrar coluna "Pre'#231'o Vendedor" na grade de itens no pedido'
                  TabOrder = 3
                end
              end
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Custos de lajes'
        ImageIndex = 2
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 828
          Height = 201
          Align = alTop
          Caption = 'Rejuste de pre'#231'os'
          TabOrder = 0
          object Label8: TLabel
            Left = 16
            Top = 84
            Width = 152
            Height = 17
            Caption = 'percentual para vendedor'
          end
          object Label9: TLabel
            Left = 16
            Top = 127
            Width = 143
            Height = 17
            Caption = 'percentual venda bal'#231#227'o'
          end
          object Label2: TLabel
            Left = 16
            Top = 50
            Width = 685
            Height = 17
            Caption = 
              '* percentual a ser acrescido sobre o PRE'#199'O DE CUSTO  dos materia' +
              's que comp'#245'es as vigas e lajes cadastradas do sistema '
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Segoe UI'
            Font.Style = [fsItalic]
            ParentFont = False
          end
          object edt_custos_lajes_vendedor: TEdit
            Left = 174
            Top = 81
            Width = 57
            Height = 25
            TabOrder = 0
            OnExit = edt_custos_lajes_vendedorExit
            OnKeyPress = edt_custos_lajes_vendedorKeyPress
          end
          object edt_custos_lajes_balcao: TEdit
            Left = 174
            Top = 124
            Width = 57
            Height = 25
            TabOrder = 1
            OnExit = edt_custos_lajes_vendedorExit
            OnKeyPress = edt_custos_lajes_vendedorKeyPress
          end
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 201
          Width = 828
          Height = 186
          Align = alClient
          Caption = ' Configura'#231#245'es de Lajes '
          TabOrder = 1
          object Label1: TLabel
            Left = 16
            Top = 44
            Width = 190
            Height = 51
            Caption = 
              'Eixo a ser considerado em lajes ( Viga + Lajota ou Isopor) Ex.: ' +
              '0.42 , 0.43 etc'
            WordWrap = True
          end
          object cbx_eixo_laje: TComboBox
            Left = 215
            Top = 48
            Width = 145
            Height = 25
            TabOrder = 0
            Items.Strings = (
              '0.37'
              '0,38'
              '0.42'
              '0.43'
              '0.49'
              '0.50')
          end
        end
      end
    end
  end
  inherited pnRodape: TPanel
    Top = 476
    Width = 836
    ExplicitTop = 475
    ExplicitWidth = 832
    inherited pnl_botoes: TPanel
      inherited btnOk: TBitBtn
        OnClick = btnOkClick
      end
    end
  end
  inherited qry: TFDQuery
    Left = 605
    Top = 164
  end
  inherited ds: TDataSource
    Left = 605
    Top = 137
  end
  object ds_comissao_vendedor: TDataSource
    AutoEdit = False
    DataSet = qry_comissao_vendedor
    Left = 632
    Top = 137
  end
  object ds_comissao_adm: TDataSource
    AutoEdit = False
    DataSet = qry_comissao_adm
    Left = 659
    Top = 137
  end
  object qry_comissao_vendedor: TFDQuery
    SQL.Strings = (
      'select * from PLANO_CONTAS order by DESCRICAO')
    Left = 632
    Top = 164
  end
  object qry_comissao_adm: TFDQuery
    Left = 659
    Top = 164
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 520
    Top = 9
  end
  object ds_concreto_usinado: TDataSource
    AutoEdit = False
    DataSet = qry_concreto_usinado
    Left = 686
    Top = 137
  end
  object qry_concreto_usinado: TFDQuery
    Left = 686
    Top = 164
  end
  object ds_bomba_concreto: TDataSource
    AutoEdit = False
    DataSet = qry_bomba_concreto
    Left = 713
    Top = 137
  end
  object qry_bomba_concreto: TFDQuery
    Left = 713
    Top = 164
  end
end
