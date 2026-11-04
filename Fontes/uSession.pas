unit uSession;

interface

type
  TUsuarioLogado = record
    ID: integer;
    PessoaId: Integer;
    Nome: string;
    Login: string;
  end;

var
  UsuarioLogado: TUsuarioLogado;

implementation

end.
