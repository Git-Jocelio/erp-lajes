unit unit_seguranca_sistema;

interface

uses
  Vcl.StdCtrls, Vcl.Dialogs, Vcl.Forms, System.SysUtils, unit_funcoes,
  System.UITypes, FireDAC.Comp.Client;

procedure prc_validar_sistema( MemoSeguranca: TMemo );

implementation

uses udmConn, unit_mensagem;

procedure prc_validar_sistema( MemoSeguranca: TMemo );
var sdata, senha, codigo: string;
    dia,mes,ano: string;
    loQry : TFDQuery;
begin
  // texto no campo chave na tabela empresa
  (*
  #EndMemAtached4857$010#!#$02056$Embebed
  #UnlocksafeAddress45780x54755
  *)


  //ShowMessage('SEGURANCA');
  sdata := '';
  ano   := '';
  MemoSeguranca.Lines.Clear;


  {segurança do sistema}
  (*
  {verifica se o arquivo winmaker existe}
  try
    //MemoSeguranca.Lines.LoadFromFile('C:\Windows_Systema\winmaker3.ini');
    MemoSeguranca.Lines.LoadFromFile('C:\Program Files\Common Files\System\winmaker3.ini');
  except
    {não encontrou o arquivo! significa pode ser uma instalação clandestina}
    messagedlg('wm - Esta cópia não está autorizada!'+ #13 + #13 +'Entre em contato com a Administração.' ,mterror,[mbok],0);
    Application.Terminate;
  end;
  *)

  // verificar se o banco de dados existe
  try
    // buscar dados do campo chave na tabela EMPRESA (substituto do arquivo winmaker)
    loQry := TFDQuery.Create(application);
    loqry.Connection := dmConn.FDConnection;
    loQry.SQL.Clear;
    loQry.SQL.Add('select chave from empresa');
    loqry.Open;
    MemoSeguranca.Lines.Add(loQry.FieldByName('chave').AsString);
    loqry.Close;
    //ShowMessage(MemoSeguranca.lines.Text);
  except
    {significa que não encontrou a tabela de configuração ou a tabela esta com problemas}
    CriarMensagem('AVISO','Chave não foi encontrada!'+ #13 + #13 +'Chave de validação não encontrada ou violada');
    Application.Terminate;
  end;

  try
    {se passar, verifica a data}
    sdata := copy(MemoSeguranca.Lines.Strings[0],29,2) + '/' +         //dia
             copy(MemoSeguranca.Lines.Strings[0],27,2) + '/' +         //mes
             criptografia (copy(MemoSeguranca.Lines.Strings[0],23,4)); //ano
    //ShowMessage(sdata);
    if (strtodate(sdata) <= date) or (MemoSeguranca.Text[1] <> '#') then
    begin
      {significa que expirou, trocar o simbolo inicial da string}
      if MemoSeguranca.Text[1] = '#' then
      begin
        {primeiro caracter = #, substituir por }
        {# cod char dele = 35}
        {substitui o primeiro caracter # por outro qualquer}
        {roda apenas na primeira vez que expira a data}
        {ou seja mesmo que altere a data do windows vai cair no if acima "(MemoSeguranca.Text[1] <> '#')" }
        randomize;
        MemoSeguranca.lines.strings[0] :=  chr(random(219) + 36) + copy(MemoSeguranca.lines.strings[0],2,length(MemoSeguranca.lines.strings[0])-1);
        //MemoSeguranca.Lines.SaveToFile('C:\Windows_Systema\winmaker3.ini');
        //MemoSeguranca.Lines.SaveToFile('C:\Program Files\Common Files\System\winmaker3.ini');
        loqry.SQL.Clear;
        loqry.SQL.Add('update empresa set chave =:chave');
        loqry.ParamByName('chave').AsString := MemoSeguranca.Lines.Text;
        loqry.ExecSQL;
      end;
      //showmessage('aqui');
      codigo := '';
      if inputquery('Cópia Expirada! em : ' + sdata,
                    'Esta cópia está expirada!'+ #13 + #13 +
                    'Entre com o código de ativação ('+ inttostr(Ord(MemoSeguranca.Text[1])) +')' + #13 +
                    'ou entre em contato com a Administração.' +#13+#13+#13+
                    'Codigo de Ativação:',codigo
                    ) then
      begin
        { formação da senha }
        {  ((dia*13*ano -mês*dia +mês*150) div 3 )*(CaracterRandomico div 2)   //// e os 3 primeiros e os 4 últimos são independentes}
        senha := inttostr(((   strtoint(copy(MemoSeguranca.Lines.Strings[0],29,2)) * 13 * strtoint(criptografia(copy(MemoSeguranca.Lines.Strings[0],23,4)))
                            - (strtoint(copy(MemoSeguranca.Lines.Strings[0],29,2)) * strtoint(copy(MemoSeguranca.Lines.Strings[0],27,2)) )
                            + strtoint(copy(MemoSeguranca.Lines.Strings[0],27,2)) * 150 ) div 3) * (Ord(MemoSeguranca.Text[1]) div 2) );
        //ShowMessage('senha ' + senha);
        {verifica a validação do código passado}
        if (senha = copy(codigo,4,length(codigo)-3-4)) then
        begin
          {foi validado - adiciona três meses de utilização}
          sdata:= formatdatetime('dd/mm/yyyy',strtodate(sdata) + 30 + 30 + 30 );

          ano := formatdatetime('yyyy',strtodate(sdata));
          mes := formatdatetime('mm'  ,strtodate(sdata));
          dia := formatdatetime('dd'  ,strtodate(sdata));

          MemoSeguranca.Clear;
          //MemoSeguranca.Lines.Add('#EndMemAtached4857$0x010'+ criptografia (formatdatetime('yyyy',strtodate(sdata)))+ formatdatetime('mm',strtodate(sdata))+ formatdatetime('dd',strtodate(sdata))+ 'Embebed');
          MemoSeguranca.Lines.Add('#EndMemAtached4857$010'+ criptografia( ano ) + mes + dia + '6$Embebed');
          MemoSeguranca.Lines.Add('#UnlocksafeAddress45780x54755');

          {salva a nova data de bloqueio}
          //MemoSeguranca.Lines.SaveToFile('C:\Windows_Systema\winmaker3.ini');
          //MemoSeguranca.Lines.SaveToFile('C:\Program Files\Common Files\System\winmaker3.ini');
          loqry.SQL.Clear;
          loqry.SQL.Add('update empresa set chave =:chave');
          loqry.ParamByName('chave').AsString := MemoSeguranca.Lines.Text;
          loqry.ExecSQL;

          CriarMensagem('AVISO','Código de ativação aceito.');
        end
        else
        begin
          CriarMensagem('AVISO','Código de ativação inválido.');
          Application.Terminate;
        end;
      end
      else
        Application.Terminate;
    end;

    if strtodate(sdata) - 7 <= date then
       CriarMensagem('AVISO','O sistema será bloqueado no dia ' + formatdatetime('d',strtodate(sdata)) +
                                                     ' do mês '+formatdatetime('m',strtodate(sdata))+'.'+#13 +
                                                     'Providencie o código de ativação.');
  except
  //  on e :exception do
 //     raise e.Create(E.Message);
    {encontrou o arquivo winmaker porém o mesmo pode ter sido alterado indevidamente, na tentativa de burlar o sistema}
   CriarMensagem('AVISO',' VIOLAÇÃO DE DADOS! - ESTA CÓPIA NÃO ESTA AUTORIZADA!'+ #13 + #13 +'Entre em contato com o programador!.');
   Application.Terminate;
  end;

  loQry.Close;
  FreeAndNil( loQry );

end;

end.
