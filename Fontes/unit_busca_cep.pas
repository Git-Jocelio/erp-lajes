unit unit_busca_cep;

interface

uses
  System.SysUtils,
  RESTRequest4D,
  DataSet.Serialize.Adapter.RESTRequest4D,
  FireDAC.Comp.Client;

type
  TViaCEPService = class
  public
    class function ConsultarCEP(const ACEP: string; AMemTable: TFDMemTable): Boolean;
  end;

implementation

uses
  uBiblioteca; // onde está SomenteNumeros

class function TViaCEPService.ConsultarCEP(const ACEP: string;
  AMemTable: TFDMemTable): Boolean;
var
  Resp: IResponse;
begin
  Result := False;

  Resp := TRequest.New
    .BaseURL('https://viacep.com.br/ws')
    .Resource(SomenteNumeros(ACEP) + '/json')
    .Accept('application/json')
    .Adapters(TDataSetSerializeAdapter.New(AMemTable))
    .Get;

  if Resp.StatusCode <> 200 then
    Exit;

  if Resp.Content.Contains('"erro"') then
    Exit;

  Result := True;
end;

end.
