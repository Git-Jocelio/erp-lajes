inherited frmCategorias: TfrmCategorias
  BorderStyle = bsNone
  ClientHeight = 336
  ClientWidth = 333
  Position = poDesigned
  OnShow = FormShow
  ExplicitWidth = 333
  ExplicitHeight = 336
  TextHeight = 15
  object pnl_topo: TPanel [0]
    Left = 0
    Top = 0
    Width = 333
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 327
      Height = 35
      Align = alClient
      Alignment = taCenter
      Caption = 'Categorias'
      Color = clBlue
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      ExplicitWidth = 78
      ExplicitHeight = 21
    end
  end
  object DBGrid1: TDBGrid [1]
    Left = 0
    Top = 41
    Width = 333
    Height = 231
    Cursor = crHandPoint
    Align = alClient
    Color = clBlack
    DataSource = ds_categoria
    DefaultDrawing = False
    FixedColor = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [dgTitles, dgColumnResize, dgTabs, dgRowSelect, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = ANSI_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnDrawColumnCell = DBGrid1DrawColumnCell
    OnDblClick = DBGrid1DblClick
    OnKeyPress = DBGrid1KeyPress
    OnMouseMove = DBGrid1MouseMove
    Columns = <
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Duplo Click ou tecle ENTRE para selecionar'
        Width = 304
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox [2]
    Left = 0
    Top = 272
    Width = 333
    Height = 64
    Align = alBottom
    Caption = ' Legenda '
    TabOrder = 2
    object lbl_mensagem: TLabel
      AlignWithMargins = True
      Left = 10
      Top = 22
      Width = 313
      Height = 35
      Margins.Left = 8
      Margins.Top = 5
      Margins.Right = 8
      Margins.Bottom = 5
      Align = alClient
      WordWrap = True
      ExplicitWidth = 3
      ExplicitHeight = 15
    end
  end
  inherited qry: TFDQuery
    SQL.Strings = (
      
        'select ID, NOME, DESCRICAO, FORMULARIO from departamentos order ' +
        'by NOME')
    Left = 96
    Top = 136
  end
  object ds_categoria: TDataSource
    DataSet = qry
    OnDataChange = ds_categoriaDataChange
    Left = 96
    Top = 104
  end
end
