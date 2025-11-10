inherited frmEmpresa: TfrmEmpresa
  Caption = 'Empresa'
  TextHeight = 15
  inherited GroupBoxPesquisa: TGroupBox
    inherited btnLocalizar: TBitBtn
      Visible = False
    end
  end
  inherited PageControl1: TPageControl
    inherited TabSheet1: TTabSheet
      inherited Panel5: TPanel
        inherited DBGrid1: TDBGrid
          Columns = <
            item
              Expanded = False
              FieldName = 'PESSOA_ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_FANTASIA'
              Title.Alignment = taCenter
              Title.Caption = 'Raz'#227'o Social'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 219
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Alignment = taCenter
              Title.Caption = 'CNPJ'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 115
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Title.Alignment = taCenter
              Title.Caption = 'Endere'#231'o'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 217
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'NUMERO'
              Title.Alignment = taCenter
              Title.Caption = 'N'#250'mero'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Title.Alignment = taCenter
              Title.Caption = 'Bairro'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CIDADE'
              Title.Alignment = taCenter
              Title.Caption = 'Cidade'
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 136
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'UF'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Width = 100
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'CEP'
              Title.Alignment = taCenter
              Title.Font.Charset = ANSI_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -15
              Title.Font.Name = 'Times New Roman'
              Title.Font.Style = [fsBold]
              Visible = True
            end>
        end
        inherited pnl_resultado: TPanel
          inherited lbl_resultado: TLabel
            Height = 41
          end
        end
      end
    end
  end
  inherited pnl_cabecalho: TPanel
    inherited lbl_titulo: TLabel
      Width = 201
      Height = 56
      Caption = 'CONSULTA EMPRESA'
      ExplicitWidth = 201
    end
  end
  inherited ds: TDataSource
    Left = 40
    Top = 200
  end
  inherited qry: TFDQuery
    Connection = dmConn.FDConnection
    SQL.Strings = (
      
        'select P.ID AS PESSOA_ID, P.NOME AS NOME_FANTASIA, P.CPF_CNPJ, P' +
        '.ENDERECO, P.NUMERO, P.BAIRRO, P.CIDADE, P.UF, P.CEP from EMPRES' +
        'A E, PESSOAS P where P.id = e.pessoa_id')
    Left = 72
    Top = 200
    object qryPESSOA_ID: TIntegerField
      FieldName = 'PESSOA_ID'
      Origin = 'PESSOA_ID'
      Required = True
    end
    object qryNOME_FANTASIA: TStringField
      FieldName = 'NOME_FANTASIA'
      Origin = 'NOME_FANTASIA'
      Required = True
      Size = 100
    end
    object qryCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'CPF_CNPJ'
      Required = True
      Size = 18
    end
    object qryENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'ENDERECO'
      Size = 100
    end
    object qryNUMERO: TStringField
      FieldName = 'NUMERO'
      Origin = 'NUMERO'
      Size = 10
    end
    object qryBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Origin = 'BAIRRO'
      Size = 30
    end
    object qryCIDADE: TStringField
      FieldName = 'CIDADE'
      Origin = 'CIDADE'
      Size = 30
    end
    object qryUF: TStringField
      FieldName = 'UF'
      Origin = 'UF'
      Size = 2
    end
    object qryCEP: TStringField
      FieldName = 'CEP'
      Origin = 'CEP'
      Size = 9
    end
  end
end
