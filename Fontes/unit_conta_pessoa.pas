
{22/05/2025
unit para pegar o id da pessoa e o id do plano de conta a ser lançado no contas
a pagar }
unit unit_conta_pessoa;

interface

type
  TConta = class
  private
    Fcusto_id: integer;
    Fpessoa_id: integer;
    Fopcao: integer;
    Fpessoa_nome: string;
    Fpessoa_endereco: string;
    Fpessoa_historico: string;

    procedure Setcusto_id(const Value: integer);
    procedure Setopcao(const Value: integer);
    procedure Setpessoa_endereco(const Value: string);
    procedure Setpessoa_historico(const Value: string);
    procedure Setpessoa_id(const Value: integer);
    procedure Setpessoa_nome(const Value: string);


  public
    property opcao : integer read Fopcao write Setopcao;
    property custo_id : integer read Fcusto_id write Setcusto_id;
    property pessoa_id : integer read Fpessoa_id write Setpessoa_id;
    property pessoa_nome : string read Fpessoa_nome write Setpessoa_nome;
    property pessoa_endereco : string read Fpessoa_endereco write Setpessoa_endereco;
    property pessoa_historico : string read Fpessoa_historico write Setpessoa_historico;

end;


implementation


{ TConta }

procedure TConta.Setcusto_id(const Value: integer);
begin
  Fcusto_id := Value;
end;

procedure TConta.Setopcao(const Value: integer);
begin
  Fopcao := Value;
end;

procedure TConta.Setpessoa_endereco(const Value: string);
begin
  Fpessoa_endereco := Value;
end;

procedure TConta.Setpessoa_historico(const Value: string);
begin
  Fpessoa_historico := Value;
end;

procedure TConta.Setpessoa_id(const Value: integer);
begin
  Fpessoa_id := Value;
end;

procedure TConta.Setpessoa_nome(const Value: string);
begin
  Fpessoa_nome := Value;
end;

end.
