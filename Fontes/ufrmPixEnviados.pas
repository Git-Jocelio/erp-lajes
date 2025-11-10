unit ufrmPixEnviados;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmBaseGrade, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, System.Actions, Vcl.ActnList,
  System.ImageList, Vcl.ImgList, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.ToolWin,
  Vcl.StdCtrls, udmConn;

type
  TfrmPixEnviados = class(TfrmBaseGrade)
    qryID: TIntegerField;
    qryDATA_PIX: TDateField;
    qryCONTAS_BANCARIAS_ITENS_ID: TIntegerField;
    qryBANCO_ID: TIntegerField;
    qryNOME_BANCO: TStringField;
    qryAGENCIA: TStringField;
    qryNR_CONTA: TStringField;
    qryVALOR: TFMTBCDField;
    qryOBS: TStringField;
    procedure FormShow(Sender: TObject);
  private
    procedure prc_componentes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPixEnviados: TfrmPixEnviados;

implementation

{$R *.dfm}

procedure TfrmPixEnviados.FormShow(Sender: TObject);
begin
  inherited;
  prc_componentes;
end;

procedure TfrmPixEnviados.prc_componentes;
begin
  DBGrid1.Columns[0].Visible := false;
  DBGrid1.Columns[2].Visible := false;
  DBGrid1.Columns[3].Visible := false;

  btnIncluir.Visible := false;
  btnAlterar.Visible := false;
  btnExcluir.Visible := false;

  qry.Open;
end;


end.
