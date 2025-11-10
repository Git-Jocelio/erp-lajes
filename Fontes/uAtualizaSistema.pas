unit uAtualizaSistema;

interface

uses
  Winapi.Windows,
  Vcl.Forms,
  System.SysUtils,
  Vcl.Dialogs,
  Winapi.Messages,
  Winapi.ShellAPI,
  System.Classes;


{cria o nome de um caminho temporario chamado de UpdateLive
dentro da pasta Temp do windows}
function GetWindowsTemp : string;

{cria no do disco o diretorio updateLive}
function CriarDiretorio(diretorioTemp : string) : boolean;

function GetTmpDir: string;

function ExtractName(const FileName: string): string;

function GetTmpFileName(ext : string): string;

procedure KillProcess( hWindowHandle: HWnd; nome: string);



implementation





function CriarDiretorio(diretorioTemp: string): boolean;
var
  SHFileOpStruct : TSHFileOpStruct;// precisa da biblioteca ShellApi
  DirBuf : array [0..255] of char;
begin
  result := false;
  if DirectoryExists(diretorioTemp) then
  begin
    try
      FillChar(SHFileOpStruct, sizeof(SHFileOpstruct), 0);
      FillChar(DirBuf, sizeof(DirBuf), 0);
      StrPCopy(DirBuf, diretorioTemp);
      with SHFileOpstruct do
      begin
        wnd    := 0;
        pFrom  := @DirBuf;
        wFunc  := FO_DELETE;
        fFlags := FOF_ALLOWUNDO;
        fFlags := fFlags or FOF_NOCONFIRMATION;
        fFlags := fFlags or FOF_SILENT;

      end;
      Application.ProcessMessages;
      Result := ( SHFileOperation(SHFileOpStruct) = 0);
      System.SysUtils.CreateDir(diretorioTemp);
      Application.ProcessMessages;
    except
      result := false;
    end;
  end
  else
  begin

    System.SysUtils.CreateDir(diretorioTemp);
    Application.ProcessMessages;
    result := false;

  end;
end;


function ExtractName(const FileName: string) : string;
var
  aExt : string;
  aPos : integer;
begin
  Application.ProcessMessages;
  aExt   := ExtractFileExt(FileName);
  Result := ExtractFileName(FileName);
//ShowMessage('result extractName ' + Result);
  if aExt <> '' then
  begin
    aPos := pos(aExt, Result);
    if aPos > 0 then
    begin
      delete(Result, aPos, length(aExt));
    end;
  end;
  Application.ProcessMessages;

end;


function GetTmpDir: string;
var
  pc : PChar;
begin

  Application.ProcessMessages;
  pc := StrAlloc(MAX_PATH + 1 );
  GetTempPath(MAX_PATH, pc);
  result := string(pc);
  StrDispose(pc);

end;


function GetWindowsTemp: string;
var
  Buffer : array[0.. Max_path] of Char;
begin

  FillChar(Buffer, max_path + 1, 0);
  GetTempPath(MAX_PATH, Buffer);
  Result := String(buffer);

  if result [length(result)] <> '\'then
    result := Result + '\';

  Result := Result + 'UpDateLive\';

end;

function GetTmpFileName(ext: string): string;
var
  pc : PChar;
begin

  Application.ProcessMessages;
  pc := StrAlloc(MAX_PATH +1 );
  GetTempFileName(PChar(GetTmpDir), 'EZC', 0, pc);
  result := string(pc);
  result := ChangeFileExt(result, ext);
  StrDispose(pc);

end;

procedure KillProcess( hWindowHandle : HWnd; nome : string);
var
  hprocessId : integer;
  processHandle : THandle;
  DWResult : DWORD;
  dir : string;
  EXE : string;
begin
  SendMessageTimeout(hWindowHandle, WM_CLOSE, 0,0,SMTO_ABORTIFHUNG OR SMTO_NORMAL, 5000, DWResult);

  if IsWindow(hWindowHandle) then
  begin

    GetWindowThreadProcessId(hWindowHandle, @hprocessId);
    if hprocessId <> 0 then
    begin

      processHandle := OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, false, hprocessId);
      if processHandle <> 0 then
      begin

        dir := ExtractFilePath(nome);

        EXE := ExtractFileName(nome);

        ShellExecute(0,nil,pwidechar(EXE), NIL,PWIDECHAR(dir), sw_hide);
        TerminateProcess(processHandle,0);
        CloseHandle(processHandle);
      end;

    end;

  end;

end;



end.
