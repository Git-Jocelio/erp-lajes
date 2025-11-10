object Form1: TForm1
  Left = 0
  Top = 0
  ActiveControl = edPath
  Caption = 'Form1'
  ClientHeight = 489
  ClientWidth = 1035
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 448
    Width = 1035
    Height = 41
    Align = alBottom
    TabOrder = 0
    object lb: TLabel
      Left = 688
      Top = 13
      Width = 82
      Height = 16
      Caption = 'Retornado : '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object btnOpen: TBitBtn
      Left = 16
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnOpenClick
    end
    object btnExec: TBitBtn
      Left = 97
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Exec'
      TabOrder = 1
      OnClick = btnExecClick
    end
    object btnSair: TBitBtn
      Left = 176
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Sair'
      TabOrder = 2
      OnClick = btnSairClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 1035
    Height = 448
    Align = alClient
    TabOrder = 1
    ExplicitWidth = 785
    object Splitter1: TSplitter
      Left = 1
      Top = 202
      Width = 1033
      Height = 6
      Cursor = crVSplit
      Align = alTop
      Color = clYellow
      ParentColor = False
      ExplicitWidth = 751
    end
    object edPath: TEdit
      Left = 1
      Top = 1
      Width = 1033
      Height = 24
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = 'C:\LAJES TRIUNFO\BD\TRINFO.FDB'
      OnExit = edPathExit
      ExplicitWidth = 783
    end
    object mm: TMemo
      Left = 1
      Top = 25
      Width = 1033
      Height = 177
      Align = alTop
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      ExplicitWidth = 783
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 208
      Width = 1033
      Height = 239
      Align = alClient
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
    end
  end
  object Memo1: TMemo
    Left = 766
    Top = 313
    Width = 291
    Height = 48
    Lines.Strings = (
      '#EndMemAtached4857$010#!#$01016$Embebed'
      '#UnlocksafeAddress45780x54755')
    TabOrder = 2
    Visible = False
  end
  object Button1: TButton
    Left = 832
    Top = 367
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 3
    Visible = False
    OnClick = Button1Click
  end
  object Conn: TFDConnection
    Params.Strings = (
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Port=3050'
      'CharacterSet=ISO8859_1'
      'RoleName=PT_BR'
      'DriverID=FB')
    LoginPrompt = False
    Left = 64
    Top = 72
  end
  object q1: TFDQuery
    Connection = Conn
    Left = 176
    Top = 80
  end
  object ds: TDataSource
    DataSet = q1
    Left = 176
    Top = 48
  end
end
