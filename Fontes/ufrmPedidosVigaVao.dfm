inherited frmPedidosVigaVao: TfrmPedidosVigaVao
  BorderStyle = bsNone
  Caption = 'frmPedidosVigaVao'
  ClientHeight = 534
  ClientWidth = 690
  ExplicitTop = -83
  ExplicitWidth = 690
  ExplicitHeight = 534
  TextHeight = 15
  object pnl_cabecalho: TPanel [0]
    Left = 0
    Top = 0
    Width = 690
    Height = 57
    Align = alTop
    BevelOuter = bvNone
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 676
    object btn_fechar: TSpeedButton
      Left = 620
      Top = 0
      Width = 70
      Height = 56
      Cursor = crHandPoint
      Hint = 'FECHAR FORMUL'#193'RIO'
      Align = alRight
      Flat = True
      Glyph.Data = {
        F6060000424DF606000000000000360000002800000018000000180000000100
        180000000000C006000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFF2F2F2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFF6F6F6FFFFFFFFFFFFF8F8F88F8F8F5D5D5DABABABFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFDCDCDC717171696969D3D3D3FFFFFFECECEC6D6D6D6767675E5E5EA4A4
        A4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFD4D4D46E6E6E666666606060AFAFAFFFFFFFFFFFFFB9B9B9
        5F5F5F6C6C6C626262969696FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFDDDDDD6363636969696262627D7D7DF4F4F4FF
        FFFFFFFFFFFFFFFFBEBEBE5C5C5C6B6B6B5E5E5E979797FFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1D1D16969696969696464647A7A
        7AFDFDFDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC0C0C06969696B6B6B6161618F
        8F8FF8F8F8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC2C2C26666666A6A6A
        6363638E8E8EFBFBFBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBDBD
        BD5858586B6B6B636363848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDADADA5E
        5E5E6A6A6A5D5D5D808080F5F5F5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFE2E2E2636363696969606060797979F1F1F1FFFFFFFFFF
        FFB3B3B35A5A5A6C6C6C616161929292FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFCBCBCB676767686868656565
        868686FDFDFDBCBCBC6565656C6C6C606060959595FDFDFDFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD7
        D7D76E6E6E6767676868687272726868686B6B6B5B5B5BA4A4A4FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFE9E9E96D6D6D6C6C6C6C6C6C6D6D6D6A6A6AA1A1A1FF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9393936767676E6E6E6C6C
        6C727272E9E9E9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA7A7A75E5E5E
        6C6C6C6868686969696A6A6A646464F3F3F3FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFEFE97
        97976161616B6B6B686868B4B4B48282826666666767676D6D6DDBDBDBFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFF9595956262626C6C6C595959B2B2B2FFFFFFE7E7E770707062626269
        69696C6C6CEAEAEAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFF7F7F78484845D5D5D6A6A6A5E5E5ED8D8D8FFFFFFFFFFFFFFFF
        FFFBFBFB8E8E8E6161616A6A6A515151D8D8D8FFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFDFDFD9090906363636A6A6A656565BFBFBFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFBFBFB7B7B7B6060606A6A6A6B6B6BCFCFCFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7C7C7C636363696969686868D0
        D0D0FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3F3F38F8F8F636363
        696969666666C5C5C5FFFFFFFFFFFFFFFFFFFFFFFFF2F2F27F7F7F6161616969
        69636363DADADAFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFEFEFE9494945F5F5F6B6B6B5B5B5BC5C5C5FFFFFFFFFFFFF8F8F8888888
        6363636868686D6D6DD4D4D4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8B8B8B6060606B6B6B646464CFCFCFFF
        FFFFEDEDED6F6F6F5E5E5E6F6F6FDEDEDEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9999995F5F
        5F5D5D5DB1B1B1FFFFFFFFFFFFCFCFCFA0A0A0E9E9E9FFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFB9B9B9ABABABF4F4F4FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      ParentShowHint = False
      ShowHint = True
      OnClick = btn_fecharClick
      ExplicitLeft = 928
      ExplicitHeight = 80
    end
    object lbl_titulo: TLabel
      AlignWithMargins = True
      Left = 15
      Top = 0
      Width = 315
      Height = 56
      Margins.Left = 15
      Margins.Top = 0
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alLeft
      Caption = 'INCLUS'#195'O DE VIGAS AO PEDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 8404992
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = []
      ParentFont = False
      Layout = tlCenter
      ExplicitHeight = 30
    end
    object pnl_separa_topo: TPanel
      Left = 0
      Top = 56
      Width = 690
      Height = 1
      Margins.Left = 10
      Margins.Top = 0
      Margins.Right = 10
      Margins.Bottom = 0
      Align = alBottom
      BevelOuter = bvNone
      Color = clSilver
      ParentBackground = False
      TabOrder = 0
      ExplicitWidth = 676
    end
  end
  object pnl_rodape: TPanel [1]
    Left = 0
    Top = 493
    Width = 690
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitWidth = 676
    object Label5: TLabel
      Left = 15
      Top = 13
      Width = 82
      Height = 15
      Caption = 'Qtde de Vigas : '
    end
    object lbl_qtde_vigas: TLabel
      Left = 101
      Top = 13
      Width = 7
      Height = 15
      Caption = '0'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btn_incluir: TBitBtn
      Left = 219
      Top = 6
      Width = 134
      Height = 25
      Cursor = crHandPoint
      Caption = 'Incluir no pedido'
      TabOrder = 0
      OnClick = btn_incluirClick
    end
    object btn_fechar2: TBitBtn
      Left = 359
      Top = 6
      Width = 75
      Height = 25
      Cursor = crHandPoint
      Caption = 'Fechar'
      TabOrder = 1
      OnClick = btn_fechar2Click
    end
  end
  object pnl_principal: TPanel [2]
    Left = 0
    Top = 57
    Width = 690
    Height = 436
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitWidth = 676
    object GroupBox2: TGroupBox
      Left = 0
      Top = 0
      Width = 690
      Height = 95
      Align = alTop
      TabOrder = 0
      ExplicitWidth = 676
      object Label1: TLabel
        Left = 322
        Top = 17
        Width = 60
        Height = 15
        Caption = 'Menor viga'
      end
      object Label2: TLabel
        Left = 391
        Top = 17
        Width = 56
        Height = 15
        Caption = 'Maior viga'
      end
      object Label3: TLabel
        Left = 463
        Top = 17
        Width = 19
        Height = 15
        Caption = 'V'#227'o'
      end
      object Label4: TLabel
        Left = 527
        Top = 22
        Width = 28
        Height = 15
        Caption = 'Local'
      end
      object edt_menor_viga: TEdit
        Left = 322
        Top = 38
        Width = 60
        Height = 23
        Hint = 'Digite o tamanho da menor viga'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnExit = edt_menor_vigaExit
        OnKeyPress = edt_menor_vigaKeyPress
      end
      object edt_maior_viga: TEdit
        Left = 391
        Top = 38
        Width = 60
        Height = 23
        Hint = 'Digite o tamanho da maior  viga'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnExit = edt_menor_vigaExit
        OnKeyPress = edt_menor_vigaKeyPress
      end
      object edt_vao: TEdit
        Left = 463
        Top = 38
        Width = 57
        Height = 23
        Hint = 'Digite o v'#227'o'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnExit = edt_menor_vigaExit
        OnKeyPress = edt_menor_vigaKeyPress
      end
      object btn_calcular: TBitBtn
        Left = 598
        Top = 38
        Width = 75
        Height = 25
        Cursor = crHandPoint
        Hint = 'Calcula o tamanho das vigas'
        Caption = 'Calcular'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btn_calcularClick
      end
      object rg_inicio: TRadioGroup
        Left = 2
        Top = 17
        Width = 143
        Height = 76
        Cursor = crHandPoint
        Align = alLeft
        Caption = ' Iniciar montagem com : '
        ItemIndex = 0
        Items.Strings = (
          'Viga'
          'Lajota/Eps')
        TabOrder = 4
      end
      object rg_arredondamento: TRadioGroup
        Left = 145
        Top = 17
        Width = 168
        Height = 76
        Cursor = crHandPoint
        Align = alLeft
        Caption = 'Arredondar medidas a cada:'
        ItemIndex = 2
        Items.Strings = (
          '  5 cm'
          '10 cm'
          '20 cm')
        TabOrder = 5
      end
      object edt_local: TComboBox
        Left = 527
        Top = 38
        Width = 64
        Height = 23
        Hint = 'Selecione um local'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 6
        Items.Strings = (
          'L-1'
          'L-2'
          'L-3'
          'L-4'
          'L-5'
          'L-6'
          'L-7'
          'L-8'
          'L-9'
          'L-10')
      end
    end
    object dbg_vigas: TDBGrid
      Left = 0
      Top = 95
      Width = 690
      Height = 341
      Align = alClient
      DataSource = ds
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = ANSI_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnKeyPress = edt_menor_vigaKeyPress
      Columns = <
        item
          Alignment = taCenter
          Color = 11270394
          Expanded = False
          FieldName = 'quantidade'
          Title.Alignment = taCenter
          Title.Caption = 'Quantidade'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 101
          Visible = True
        end
        item
          Alignment = taCenter
          Color = 10157461
          Expanded = False
          FieldName = 'tamanho_real'
          Title.Alignment = taCenter
          Title.Caption = 'Tamanho real'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 104
          Visible = True
        end
        item
          Alignment = taCenter
          Color = 4783167
          Expanded = False
          FieldName = 'tamanho_ajustado'
          Title.Alignment = taCenter
          Title.Caption = 'Tamanho ajustado'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Segoe UI Semibold'
          Title.Font.Style = [fsBold]
          Width = 132
          Visible = True
        end>
    end
  end
  inherited qry: TFDQuery
    Left = 416
    Top = 280
  end
  object ds: TDataSource
    DataSet = mtb_lista_de_vigas
    OnDataChange = dsDataChange
    Left = 264
    Top = 241
  end
  object mtb_vigas_agrupadas: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 264
    Top = 313
    object mtb_vigas_agrupadasQuantidade: TIntegerField
      FieldName = 'Quantidade'
    end
    object mtb_vigas_agrupadasTamanho_Real: TFloatField
      FieldName = 'Tamanho_Real'
      DisplayFormat = '0.00'
    end
    object mtb_vigas_agrupadasTamanho_ajustado: TFloatField
      FieldName = 'Tamanho_ajustado'
      DisplayFormat = '0.00'
    end
  end
  object mtb_lista_de_vigas: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 264
    Top = 273
    object mtb_lista_de_vigasquantidade: TIntegerField
      FieldName = 'quantidade'
    end
    object mtb_lista_de_vigastamanho_real: TFloatField
      FieldName = 'tamanho_real'
      DisplayFormat = '0.00'
    end
    object mtb_lista_de_vigastamanho_ajustado: TFloatField
      FieldName = 'tamanho_ajustado'
      DisplayFormat = '0.00'
    end
  end
end
