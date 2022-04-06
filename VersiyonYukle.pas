unit VersiyonYukle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ipwcore, ipwftp, ExtCtrls, Gauges,Winsock;

type
  TfrmVersiyon = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    FTP: TipwFTP;
    Timer1: TTimer;
    Gosterge: TGauge;
    procedure Label1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FTPDirList(Sender: TObject; const DirEntry, FileName: string;
      IsDir: Boolean; FileSize: Int64; const FileTime: string);
    procedure FTPTransfer(Sender: TObject; Direction: Integer;
      BytesTransferred: Int64; PercentDone: Integer; Text: string);
  private
    { Private declarations }
  public
    { Public declarations }

    UpdateExeCek :Boolean;
    procedure SystemSearch;
  end;

var
  frmVersiyon: TfrmVersiyon;
  Sabit_Ilk     : Integer;
  Sabit_Segment : Integer;
implementation

{$R *.dfm}
uses ShellAPI, BlyLib;

var
 BelitDosyaUzunlugu,
 Posx               : integer;
 IPLowAddress,
 IPAddress,
 IPHighAddress      : String;


procedure TfrmVersiyon.SystemSearch;
  function IPHighClass(st: string): string;
  var
    s: string;
  begin
    posx:= pos('.', st);
    s:= copy(st, 1, posx-1);
    delete(st, 1, posx);

    posx:= pos('.', st);
    s:= s+'.'+copy(st, 1, posx-1);
    delete(st, 1, posx);

    posx:= pos('.', st);
    s:= s+'.'+copy(st, 1, posx-1);
    delete(st, 1, posx);
    IPLowAddress:= st;
    result:= s;
  end;

  function GetIPAddress: string;
  var
    wsaData : TWSAData;
  begin
    WSAStartup( 257, wsaData );
    GetIPAddress:= iNet_ntoa( PInAddr( GetHostByName(NIL )^.h_addr_list^ )^ );
  end;

  function GetWindowsVer: string;
  Var
    VerInfo : TOsversionInfo;
  begin
    VerInfo.dwOSVersionInfoSize := SizeOf(VerInfo);
    GetVersionEx(VerInfo);
    Case VerInfo.dwPlatformId Of
      VER_PLATFORM_WIN32s         : Result:= 'Windows 3.1';
      VER_PLATFORM_WIN32_WINDOWS  : Result:= 'Windows 95';
      VER_PLATFORM_WIN32_NT       : Result:= 'Windows NT';
    end;
  end;
begin
  IPAddress    := GetIPAddress;
//  FullIP       := IPAddress;
  IPHighAddress:= IPHighClass(GetIPAddress);
  Sabit_Ilk    :=StrtoInt(Copy (IpAddress,1,Pos('.',IpAddress)-1));
  Delete(IpAddress,1,Pos('.',IpAddress));
  Sabit_Segment:= StrToInt(Copy (IpAddress,1,Pos('.',IpAddress)-1));
  Delete(IpAddress,1,Pos('.',IpAddress));
  Delete(IpAddress,1,Pos('.',IpAddress));
//  if StrToInt(IpAddress)=5 Then MercekIp := True
//                           Else MercekIp := False;
end;



procedure TfrmVersiyon.FTPTransfer(Sender: TObject; Direction: Integer;
  BytesTransferred: Int64; PercentDone: Integer; Text: string);
begin
  Gosterge.Progress := BytesTransferred;
end;

procedure TfrmVersiyon.Label1Click(Sender: TObject);
Var
  St          : Array[0..255] of char;
  AFile       : TextFile;
  FtpUser,
  ftppassword ,
  RemoteHost  : String;
begin
  systemsearch;
  ftpuser    :='ftp';
  ftppassword:='ftp';

   RemoteHost := '10.1.0.211';
      if Pos('BELIT',LoginInfo.OracleKullanici)>0 then
      begin
          ParametreYeni('BELIT_FTP');
          ftp.RemoteHost := Parametreler_Yeni.Deger;
          FTP.Timeout    := 5000;
          ftpuser        := Parametreler_Yeni.Deger2;
          ftppassword    := Parametreler_Yeni.Deger3;
          Ftp.RemotePort := 21;
      end;

   if Pos('SELET',LoginInfo.OracleKullanici)>0 then
      begin
          ParametreYeni('SELET_FTP');
          ftp.RemoteHost := Parametreler_Yeni.Deger;
          FTP.Timeout    := 5000;
          ftpuser        := Parametreler_Yeni.Deger2;
          ftppassword    := Parametreler_Yeni.Deger3;
          Ftp.RemotePort := 21;
      end;

   FTP.RemoteHost := RemoteHost;
   If ((Pos('SEHA',Logininfo.OracleKullanici) > 0) or (Pos('BELYA',Logininfo.OracleKullanici) > 0) or
      (Pos('IRENT',Logininfo.OracleKullanici) > 0) or (Pos('HOLDING',Logininfo.OracleKullanici) > 0) or
      (Pos('AES',Logininfo.OracleKullanici) > 0) or (Pos('AVUKAT',Logininfo.OracleKullanici) > 0) or
      (Pos('INVITO',Logininfo.OracleKullanici) > 0) or (Pos('BIG',Logininfo.OracleKullanici) > 0) or
      (Pos('IMAS',Logininfo.OracleKullanici) > 0))
    then ftp.RemoteHost := LoginInfo.ftp_adres;
   If Pos('SELVA',LoginInfo.OracleKullanici)>0 then
   Begin
       ftp.RemoteHost := LoginInfo.ftp_adres;
       Ftpuser     := 'FTPBELIT';
       Ftppassword := 'BELITFTP';
   End;

   if Pos('IMAS',LoginInfo.OracleKullanici)>0 then
      begin
        ftp.RemoteHost := LoginInfo.ftp_adres;
        Ftpuser     := 'ftp';
        Ftppassword := 'ftp';
      end;

   FTP.Timeout    := 5000;
   FTP.User       := ftpuser;
   FTP.Password   := ftppassword;
   Ftp.RemotePort := 21;
   Ftp.RemoteFile := 'YONETIM.EXE';
   Ftp.RemotePath := '';
   Ftp.Logon;
   Ftp.ListDirectoryLong;
   FTP.LocalFile := ExtractFilePath(Application.ExeName) +  'YONETIM1.EXE';
   Ftp.Download;
   Ftp.Logoff;
   if UpdateExeCek then
   begin
     Close;
     Exit;
   end;
   AssignFile(AFile,ExtractFilePath(Application.ExeName)+'B.BAT');
   ReWrite(AFile);
   WriteLn(AFile,'ECHO OFF');
   Writeln(AFile,'');
   WriteLn(AFile,'ECHO BELÝT YÖNETÝM PROGRAMINI YUKLEMEK ICIN BIR TUSA BASIN...');
   if not FileExists(UpperCase(ExtractFilePath(Application.ExeName))+'cxADOAdaptersD6.bpl') then
   begin
     WriteLn(Afile,'DEL TEE60.BPL');
   end;
   Writeln(AFile,'');
   WriteLn(AFile,'PAUSE');
   WriteLn(AFile,'ECHO BELÝT YÖNETÝM PROGRAMINI YUKLEMEK ICIN BIR TUSA BASIN...');
   Writeln(AFile,'');
   WriteLn(AFile,'PAUSE');
   WriteLn(AFile,'ECHO BELÝT YÖNETÝM PROGRAMINI YUKLEMEK ICIN BIR TUSA BASIN...');
   Writeln(AFile,'');
   WriteLn(AFile,'PAUSE');
   WriteLn(AFile,'COPY '+pchar(UpperCase(ExtractFilePath(Application.ExeName)))+'YONETIM1.EXE '+pchar(UpperCase(ExtractFilePath(Application.ExeName)))+'YONETIM.EXE /Y');
   WriteLn(AFile,'DEL '+pchar(UpperCase(ExtractFilePath(Application.ExeName)))+'YONETIM1.EXE');
   WriteLn(AFile,pchar(UpperCase(ExtractFilePath(Application.ExeName)))+'YONETIM.EXE 0');
   WriteLn(AFile,'EXIT');
   CloseFile(AFile);
   //WinExec(PCHAR(ExtractFilePath(Application.ExeName)+'B.BAT'),SW_Show);
   ShellExecute(handle, 'OPEN', PChar(ExtractFilePath(Application.ExeName)+'B.BAT'), '', '', SW_SHOWNORMAL);
   Close;
end;

procedure TfrmVersiyon.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled := False;
  Label1Click(nil);
end;

procedure TfrmVersiyon.FTPDirList(Sender: TObject; const DirEntry,
  FileName: string; IsDir: Boolean; FileSize: Int64; const FileTime: string);
begin
  if (not isDir) and (UPPERCASE(FileName) = 'YONETIM.EXE') then
  begin
    BelitDosyaUzunlugu := FileSize;
    Gosterge.MaxValue := BelitDosyaUzunlugu;
  end;
end;

end.
