//SON_KULLANILAN_YETKI:3471  YENI_YETKI:3472

unit BlyLib;
interface
  Uses Menus,  DBAccess, Ora, OraSmart, MemDS, OraError, db, ComCtrls, DModule, SysUtils, forms, windows, Controls,Variants,Dialogs,ADODB,Registry,cxGridTableView,
       cxGridDBTableView,Vcl.Samples.Gauges,IdFTPCommon ;

  Type
    MenuButtons = Set Of (mEkle, mDegistir, mSil, mKopyala, mKaydet, mVazgec, mArama, mYazdir, mOdemePlani, mBarkod, mSerino, mAlternatifMal, mSubeFiyat, mEkstre, mHesap, mKapat, mKartlardanGetir, mTemizle, mKodOlustur, mBarkodluIslem, mSeriNumaraliIslem, mMalNumaraliIslem, mIstatistik, mFiyatYansit, mSiparisOneri, mEmail, mBlgDonustur, mIlk, mOnceki, mSonraki, mSon, mBos1, mBos2);
    Dosya_Tipi = Record
                    _Field : String[10];
                    _Value : String[50];
                    _Locate: String[10];
                    _OK    : Boolean;
                  End;

   TRepField = ^RRepField;
   RRepField = record // erpreportdesigner
     Field : String;
     Value : Variant;
   end;

  Const
    FreeCellHeader = '                                                                                                                                                                                                                                                              ';

  Var
    OdemePlaniKapatEnabled : Boolean;
    L_Kayit             : Dosya_Tipi;
    L_Dosya             : File Of Dosya_Tipi;
     YonetimIslemleriIzleyiciMod          : Boolean;                   

    LoginInfo: Record
                 Isim              : String[40];
                 Kod               : String[6];
                 RolTur            : String[2];
                 LOGINNAME         : String[30];
                 Satinalmaci       : String[25];
                 SirketIsmi        : String[25];
                 SubeKod           : Integer;
                 Subeler           : String;
                 Satinalmacilar    : String;
                 Cariler           : String;
                 SubeUnvan         : String[50];
                 Yil               : String[4];
                 Ay, Gun           : String[2];
                 Sifre             : String[20];
                 fmtMiktar         : String[30];
                 fmtTutar          : String[30];
                 fmtRapor          : String[30];
                 fmtOran           : String[30];
                 fmtYTL            : String[30];
                 fmtKdv            : String[10];
                 fmtBirimFiyat     : String[20];
                 KDVMatrahsalHesap : Boolean;
                 Basamak           : Char;
                 Ondalik           : Char;
                 TarihAyrac        : Char;
                 Aktif_Kur         : String[5];
                 Haklar            : Array [1..9999] of Boolean;
                 Departman         : String[25];
                 SistemTarihi      : TDateTime;
                 MalFazlasiIndirim : String[8];
                 SatirIskonto      : String[8];
                 ProgramIciLogo    : String[100];
                 OracleKullanici   : String[30];
                 OracleSifre       : String[30];
                 Roller            : String[60];
                 AnaKirim          : String[150];
                 ftp_adres : String[20];
                 StokAktifMagaza   : String[5];
                 MasrafSubeler     : String;
                 MalFazlasiAciklama: String;
                 MAC_IPNo          : string;
                 MAC_Address       : string;
                 Computer_Name     : string;
                 Computer_User     : string;
                 MagazaIsmi        : string;
                 SatinalmaciIsmi   : string;
                 StoreValue        : String;
                 FTPStatusIndicator: TGauge;
                 Konsolide         : Boolean;
               End;

    ParametreSifre: Record
                   Kullanici_Id               : Integer;
                   Sifre_Aktif                : String[1];
                   Onceki_Sifre_Engelle       : String[1];
                   KullaniciAdi_Sifre_Farkli  : String[1];
                   Sifre_Kayit_Tarihi         : TDateTime;
                   Sifre_Periyodu             : Integer;
                   Uyari_Suresi               : Integer;
                   Min_Sifre_Uzunlugu         : Integer;
                   Min_Text_Sayisi            : Integer;
                   Min_Numerik_Sayisi         : Integer;
                   Hatali_Giris_Sayisi        : Integer;
                 End;


     bkhKriter: Record
                 V: String[50];
                 Banka_ID : String[4];
               End;
     chKriter: Record
                 F: Integer;
                 V: String[50];
               End;
     skKriter: Record
                 F: Integer;
                 V: String[50];
               End;

     mhKriter: Record
                 F: Integer;
                 V: String[50];
               End;
     ckKriter: Record
                  V : String[200];
              end;
     BorcAlacakKriter : record
                          IFN : Extended;
                        end;

    Parametreler_Yeni: Record
                          Tip     : String;
                          Deger   : String;
                          Deger2  : String;
                          Deger3  : String;
                       end;

  Function _StrToNum(S: String): Variant;
  Function _NumToStr(S: Variant; L: Integer): Variant;
  Function _GetPartOfCellHeader(S, L: Integer; H: String; N: Boolean): String;
  Function _SetPartOfCellHeader(H, D: String; S, L: Integer; N: Boolean): String;
  Function _FixString(S: String; L: Integer; LJustify: Boolean): String;
  Function _UnFixString(S: String; Numeric: Boolean): String;
  Function _BakiyeHesapla(Borc, Alacak: Extended; Fmt: String): String;
  Function _Crypto(O: Boolean; S: String; N: Integer): String;
  Function _CanFormClose(S: TDataSetState): Boolean;
  Function _MakeSQLString(S: String): String;
  function _MakeManySQLString(AStr,Field: String): String;
  Function _CanClose(State: TDataSetState): Boolean;
  Function BoslukKes(Str : String) : String;
  Function SatirSonuKes(Str : String) : String;
  Function Fis_Aciklama(FisTuru: String): String;
  Function _isNumeric(S: String): Boolean;
  Function Yuvarla(R: Real; Y: Integer): Real;
  function BuyukHarf(Ac: Char): Char;
  Procedure TurEkle(Var S: String; T: String);
  function random_barkod(max: Longint): string;
  function checksum(barkod: string): Byte;
  Function SayiToYazi(N: Extended): String;
  Procedure AddToQuery(Var Sorgu: TOraQuery; Aralik: Boolean; A1, K, T2, A2, A3: String; DataType: Integer);
  Function DateReverse(TT : String) : String;
  procedure PrepareProc(var SProc: TOraStoredProc);
  Function _FormulaProcess(SS : String) : String;
  function GetMonthOfYear(AInt: Integer): String;
  Function GetWeekOfYear(ADate: TDate): Integer;
  Function _SQLString(FieldName,AStr: String; Tip: Char): String; // Tip : N:Numeric, S:String
  Function GetMuhasebeEkranIfn(Tur: String): LongInt;
  function _ParcaAl(var AStr:String; Ayrac:Char): String;
  // DonemKontrol
  function VarToInt(Value: Variant): Integer;
  Procedure SqlRecord(MySql:String);
  Function SqlRecord_A(MySql:String) : Boolean;
  Procedure SqlRecord_Ortak(MySql:String);

  Procedure SQLList_A(Queryy : TAdoQuery; SQLL : String);

  Function GetUserControl :Boolean;
  Procedure SQLList(Queryy : TOraQuery; SQLL : String);

  function StrIn(AStr:String; strlist: array of string): boolean;
  procedure PosParameterBelitPosLog;
  Function VersiyonKontroluYapicakmi(Kod : String) : Boolean;
  Function ParametreDegerVer(Parametre : String) : Variant;
  Function GetStoreNumber:String;
  Function RegisterManage(RegisterPath,RegisterName,RegisterValue,RegisterType : String) : String;
  procedure OdacUpdate_Query(Q:TOraQuery;Msj:String);
  Procedure ExcelSinirsizKaydet(AktifGrid : TcxGridDBTableView;DosyaaIsmi : String);
  Procedure AltKayitKontrol(Tablo,Kosul,Mesaj : String);
  Function MukerrerKontrol(TableName : String; SQLL : String) : Boolean;
  Function ExeccSQL(MySql:String):Boolean;
  Procedure ParametreYeni(v_Parametre:String);
  Procedure ParametreYeniSifirla;
  Procedure SQLList_New(Queryy : TOraQuery; SQLL : String;Tip:String);
  Function IndyFTP_Connect (ParamConnectName : String; Indicator : TGauge) : Boolean;
  Function IndyFTP_Download (FTPFileName,FTPPath, SaveFileName, SaveFilePath : String) : Boolean;
  Function IndyFTP_Upload (FileName, FTPFileName, FTPPath : String) : Boolean;
  Function IndyFTP_Delete (FTPFileName,FTPPath : String) : Boolean;
  Function IndyFTP_FileExist (FTPFileName,FTPPath : String) : Boolean;
  Function SQLRecordCount(SQLText : String) : Integer;
  Function SQLResult(SQLL : String) : String;




implementation

const
  Rakam: Array[1..3, 0..9] of String[10] = (('','Y�z', '�kiY�z', '��Y�z', 'D�rtY�z', 'Be�Y�z', 'Alt�Y�z', 'YediY�z', 'SekizY�z', 'DokuzY�z'),
                                            ('','On', 'Yirmi', 'Otuz', 'K�rk', 'Elli', 'Altm��', 'Yetmi�', 'Seksen', 'Doksan'),
                                            ('','Bir', '�ki', '��', 'D�rt', 'Be�', 'Alt�', 'Yedi', 'Sekiz', 'Dokuz'));

Function SQLResult(SQLL : String) : String;
Begin
    Try
       SQLList(DmGlobal.QTmp2,SQLL);
       Result := DmGlobal.QTmp2.Fields[0].AsString;
    Except
       Result := '';
    End;
End;

Function SQLRecordCount(SQLText : String) : Integer;
Begin
    Result := StrToInt(SQLResult('SELECT SUM(1) FROM ( ' + SQLText + ' )'));
End;

Function IndyFTP_Connect (ParamConnectName : String; Indicator : TGauge) : Boolean;
Begin
    If ParamConnectName = '' then // Disconnect yapdemek
    Begin
        If dmGlobal.FTPN.Connected then dmGlobal.FTPN.Disconnect;
    End
       Else
    Begin
        Try
            If dmGlobal.FTPN.Connected then dmGlobal.FTPN.Disconnect(False);
            if dmGlobal.FTPN.IOHandler <> nil then dmGlobal.FTPN.IOHandler.InputBuffer.Clear;
            ParametreYeni(ParamConnectName);
            If (Parametreler_Yeni.Deger <> '') And (Parametreler_Yeni.Deger2 <> '') then
            Begin
                LoginInfo.FTPStatusIndicator     := Indicator;
                dmGlobal.FTPN.Host     := Parametreler_Yeni.Deger;
                dmGlobal.FTPN.Username := Parametreler_Yeni.Deger2;
                dmGlobal.FTPN.Password := Parametreler_Yeni.Deger3;
                dmGlobal.FTPN.Connect;
                Result       := True;
            End
              Else
            Begin
                Result := False;
                Exit;
            End;
        Except
            Result := False;
        End;
    End;
End;

Function IndyFTP_Download (FTPFileName,FTPPath, SaveFileName, SaveFilePath : String) : Boolean;
var
  ext,
  s : String;
Begin
    If dmGlobal.FTPN.Connected Then
    Begin
        Try
            If FTPPath <> '' then dmGlobal.FTPN.ChangeDir(FTPPath);
            If dmGlobal.FTPN.Size(FTPFileName) <> -1 Then LoginInfo.FTPStatusIndicator.MaxValue := dmGlobal.FTPN.Size(FTPFileName)
                                                     Else LoginInfo.FTPStatusIndicator.MaxValue := 1;
        Except
            LoginInfo.FTPStatusIndicator.MaxValue := 1;
        End;
        ext := ExtractFilePath(SaveFilePath) +  SaveFileName;
        try
          CreateDir(pchar(UpperCase(ExtractFilePath(SaveFilePath))));
        except
        end;

        If FileExists(Ext) then DeleteFile(PChar(Ext));
        Try
            dmGlobal.FTPN.Get(FTPFileName, Ext, True, dmGlobal.FTPN.ResumeSupported);
            dmGlobal.FTPN.Quit;
            dmGlobal.FTPN.DisConnect;
            Result := True;
        Except
            Application.MessageBox('FTP Dosya indirmede sorun var. ��lem iptal edildi ...','D�KKAT !',mb_OK);
            if dmGlobal.FTPN.Connected then dmGlobal.FTPN.DisConnect;
            Result := False;
        End;
    end Else Application.MessageBox('FTP Ba�lant�s� sa�lanam�yor. ��lem iptal edildi ...','D�KKAT !',mb_OK);

    {�rnek Kullan�m
       If IndyFTP_Connect ('FTP-MRP_TK_DOKUMAN',Bly2000_Menu.Gosterge) Then
       Begin
          IndyFTP_Download ('58_1.msg','/TEKLIF', '58_1.msg', 'C:\');
       End Else Application.MessageBox('Ba�lant� Yok','D�KKAT !',mb_OK);
    }
End;

Function IndyFTP_FileExist (FTPFileName,FTPPath : String) : Boolean;
var
  ext,
  s : String;
Begin
    If dmGlobal.FTPN.Connected Then
    Begin
        Try
           Result := dmGlobal.FTPN.Size(FTPFileName) <> -1;
           dmGlobal.FTPN.Quit;
           dmGlobal.FTPN.DisConnect;
        Except
           Application.MessageBox('FTP dosya bulmada sorun var. ��lem iptal edildi ...','D�KKAT !',mb_OK);
           Result := False;
        End;
    end Else Application.MessageBox('FTP Ba�lant�s� sa�lanam�yor. ��lem iptal edildi ...','D�KKAT !',mb_OK);
End;

Function IndyFTP_Upload (FileName,FTPFileName, FTPPath : String) : Boolean;
Begin
    If dmGlobal.FTPN.Connected Then
    Begin
        Try
            If FTPPath <> '' then
            Begin
                //
                Try
                   dmGlobal.FTPN.ChangeDir(FTPPath);
                Except
                   dmGlobal.FTPN.MakeDir(FTPPath);
                   dmGlobal.FTPN.ChangeDir(FTPPath);
                End;
            End;
            dmGlobal.FTPN.TransferType := ftASCII;
            If FTPFileName = '' Then dmGlobal.FTPN.Put(FileName, ExtractFileName(FileName))
                                Else dmGlobal.FTPN.Put(FileName, FTPFileName);
            dmGlobal.FTPN.Quit;
            dmGlobal.FTPN.DisConnect;
            Result := True;
        Except
            Application.MessageBox('Y�klemede sorun var. ��lem iptal edildi ...','D�KKAT !',mb_OK);
            if dmGlobal.FTPN.Connected then dmGlobal.FTPN.DisConnect;
            Result := False;
        End;
    end Else Application.MessageBox('FTP Ba�lant�s� sa�lanam�yor. ��lem iptal edildi ...','D�KKAT !',mb_OK);
    {�rnek Kullan�m
       If IndyFTP_Connect ('FTP-MRP_TK_DOKUMAN',Bly2000_Menu.Gosterge) Then
       Begin
           IndyFTP_Upload ('c:\BELYA.jpe','/TEKLIF');
       End Else Application.MessageBox('Ba�lant� Yok','D�KKAT !',mb_OK);
    }
End;

Function IndyFTP_Delete (FTPFileName,FTPPath : String) : Boolean;
var
  ext,
  s : String;
Begin
    If dmGlobal.FTPN.Connected Then
    Begin
        Try
            If FTPPath <> '' then dmGlobal.FTPN.ChangeDir(FTPPath);
            If dmGlobal.FTPN.Size(FTPFileName) <> -1 Then LoginInfo.FTPStatusIndicator.MaxValue := dmGlobal.FTPN.Size(FTPFileName)
                                                     Else LoginInfo.FTPStatusIndicator.MaxValue := 1;
        Except
            LoginInfo.FTPStatusIndicator.MaxValue := 1;
        End;
        Try
            dmGlobal.FTPN.Delete(FTPFileName);
            dmGlobal.FTPN.Quit;
            dmGlobal.FTPN.DisConnect;
            Result := True;
        Except
            Application.MessageBox('FTP Silmede sorun var. ��lem iptal edildi ...','D�KKAT !',mb_OK);
            if dmGlobal.FTPN.Connected then dmGlobal.FTPN.DisConnect;
            Result := False;
        End;
    end Else Application.MessageBox('FTP Ba�lant�s� sa�lanam�yor. ��lem iptal edildi ...','D�KKAT !',mb_OK);

    {�rnek Kullan�m
       If IndyFTP_Connect ('FTP-MRP_TK_DOKUMAN',Bly2000_Menu.Gosterge) Then
       Begin
          IndyFTP_Delete ('58_1.msg','/TEKLIF');
       End Else Application.MessageBox('Ba�lant� Yok','D�KKAT !',mb_OK);
    }
End;

Procedure ParametreYeniSifirla;
begin
  Parametreler_Yeni.Tip    := '';
  Parametreler_Yeni.Deger  := '';
  Parametreler_Yeni.Deger2 := '';
  Parametreler_Yeni.Deger3 := '';
end;

Procedure ParametreYeni(v_Parametre:String);
begin
  ParametreYeniSifirla;
  SQLList_New(dmGlobal.qTmp2,'SELECT * FROM PARAMETRELER_YENI WHERE PARAMETRE = '''+v_Parametre+'''','O');
  if dmGlobal.qTmp2.FieldByName('PARAMETRE').AsString <> '' then
     begin
        Parametreler_Yeni.Deger   := dmGlobal.qTmp2.FieldByName('DEGER').AsString;
        Parametreler_Yeni.TIP     := dmGlobal.qTmp2.FieldByName('TIP').AsString;
        Parametreler_Yeni.Deger2  := dmGlobal.qTmp2.FieldByName('DEGER2').AsString;
        Parametreler_Yeni.Deger3  := dmGlobal.qTmp2.FieldByName('DEGER3').AsString;
     end;
  dmGlobal.qTmp2.Close;
end;

Procedure SQLList_New(Queryy : TOraQuery; SQLL : String;Tip:String);
Begin
   if Queryy.Active then Queryy.Close;
   Queryy.SQL.Clear;
   Queryy.SQL.Add(SQLL);
   if ( Tip <> '' ) then
     begin
        try
        case Tip[1] of
          'O' : begin
                  Queryy.Open;
                  Queryy.First;
                end;
          'E' : Queryy.ExecSql;
        end;
        except on E: EDataBaseError do
              begin
                 Application.MessageBox(PChar(e.message + SQLL),'Hata',mb_ok);
                 exit;
              end;
        end;
     end;
End;

Function MukerrerKontrol(TableName : String; SQLL : String) : Boolean;
Begin
    If dmGlobal.QTmp.Active Then dmGlobal.QTmp.Close;
    dmGlobal.QTmp.SQL.Clear;
    dmGlobal.QTmp.SQL.Text := 'SELECT COUNT(1) FROM ' + TableName + ' WHERE ' + sqll;
    dmGlobal.QTmp.Open;
    Result := dmGlobal.QTmp.Fields[0].AsInteger > 0;
    dmGlobal.QTmp.Close;
End;

Procedure AltKayitKontrol(Tablo,Kosul,Mesaj : String);
Begin
   If (Tablo <> '') And (Kosul <> '') And (Mesaj <> '') Then
   Begin
       SQLList(DmGlobal.QTmp,'SELECT *FROM ' + Tablo + ' WHERE ROWNUM = 1 ' +  Kosul);
       If DmGlobal.QTmp.Fields[0].AsString <> '' Then
       Begin
           Application.MessageBox(PChar(Mesaj),'D�KKAT !',mb_OK);
           Abort;
       End;
   End;
End;

  Procedure ExcelSinirsizKaydet(AktifGrid :TcxGridDBTableView;DosyaaIsmi : String);
  Var
     Dosya : TextFile;
     MyStr : String;
     DosyaIsmi : String;
     St:Array[0..255] of char;
     I : Integer;
     AktifDosya : TDataSource;

  Begin
    If Application.MessageBox(PChar(DosyaaIsmi + ' i�in, Excel Dosyas� olu�turulacakt�r. Onayl�yormusunuz ?'),'Dikkat !',Mb_YesNo) = idNo Then Abort;
    DmGlobal.SaveDialog.InitialDir := ExtractFilePath(Application.ExeName)+'\RAPORLAR\';
    DmGlobal.SaveDialog.Filter     := 'XLS Dosyalar�|*.xls';
    DmGlobal.SaveDialog.FileName   := DosyaaIsmi + '.xls';
    If DmGlobal.SaveDialog.Execute Then
    Begin
        DosyaIsmi := DmGlobal.SaveDialog.FileName;
        MyStr := ExtractFilePath(Application.ExeName);
        AssignFile(Dosya,DosyaIsmi);

        try
          Rewrite(Dosya);
        except on EInOutError do
            Rewrite(Dosya);
        End;
        MyStr := '';
        For I := 0 To AktifGrid.ColumnCount - 1 Do
        Begin
           if AktifGrid.Columns[I].Visible then
              MyStr := MyStr + AktifGrid.Columns[I].Caption  + #9;
        End;
        Writeln(Dosya,MyStr);
        Writeln(Dosya,'');
        AktifDosya := AktifGrid.DataController.DataSource;
        AktifDosya.DataSet.First;
        AktifGrid.DataController.DataSource := Nil;
        while Not(AktifDosya.DataSet.Eof) do
        Begin
            MyStr := '';
            For I := 0 To AktifGrid.ColumnCount - 1 Do
            Begin
                if AktifGrid.Columns[I].Visible then
                 MyStr := MyStr + AktifDosya.DataSet.FieldByName(AktifGrid.Columns[I].DataBinding.FieldName).AsString  + #9;
            End;
            AktifDosya.DataSet.Next;
            Writeln(Dosya,MyStr);
        End;
        AktifGrid.DataController.DataSource := AktifDosya;
        CloseFile(Dosya);
    End Else Abort;
    Application.MessageBox(PChar(DosyaIsmi+' isimli Excel Dosyas� Olu�turulmu�tur.'),'Bitti',mb_OK);
//    ShellExecute(0,'open',StrPCopy(St, DosyaIsmi),nil,nil,SW_SHOW);
  End;

procedure OdacUpdate_Query(Q:TOraQuery;Msj:String);
begin
    With dmGlobal.dbGlobal Do
    Begin
        if not(InTransaction) Then StartTransaction;
        Try
          q.ApplyUpdates;
          Commit;
          q.CommitUpdates;
        Except
          RollBack;
          q.CancelUpdates;
          MessageDlg(msj, mtError, [mbOK], 0);
        end;
    end;
end;

Function RegisterManage(RegisterPath,RegisterName,RegisterValue,RegisterType : String) : String;
Var
  myReg : TRegistry;
Begin
    Result := '';
    myreg := TRegistry.Create;
    myReg.RootKey :=HKEY_LOCAL_MACHINE;
    try
       myReg.OpenKey(RegisterPath,true);
       If RegisterType = 'O' Then Result := myReg.ReadString(RegisterName)
                             Else MyReg.WriteString(RegisterName,RegisterValue);
    Except
    End;
    myReg.Free;
End;


Function ParametreDegerVer(Parametre : String) : Variant;
Begin
    If Not(dmGlobal.qParametreYeni.Active) Then dmGlobal.qParametreYeni.Open;
    dmGlobal.qParametreYeni.First;
    While Not dmGlobal.qParametreYeni.Eof Do
    Begin
        If dmGlobal.qParametreYeni.FieldByName('Parametre').AsString = Parametre Then
        Begin
             Result := dmGlobal.qParametreYeni.FieldByName('Deger').AsString;
             Exit;
        End;
        dmGlobal.qParametreYeni.Next;
    End;
End;
                                            
Function VersiyonKontroluYapicakmi(Kod : String) : Boolean;
Begin
    SQLList(DMGlobal.QTmp,'SELECT KOD FROM KULLANICI WHERE KOD = ' + Kod + ' AND (SELECT DEGER FROM PARAMETRELER_YENI WHERE ROWNUM = 1 AND PARAMETRE = ''VERSIYON_KONTROL�_�PTAL'') LIKE ''%;''||KOD||'';%''');
    Result := Kod <> DmGlobal.QTmp.FieldByName('KOD').AsString;
    DmGlobal.QTmp.Close;
End;

procedure PosParameterBelitPosLog;
begin

   SqlRecord('INSERT INTO POS_PARAMETER_BELITPOS_LOG (IFN,PRG_ID,TARIH,SAAT,LOGIN_ID,MAC_IPNO,MAC_ADDRESS,COMPUTER_NAME,COMPUTER_USER) VALUES (BELITPOS_SQ.NEXTVAL,11,TRUNC(sysdate),to_char(sysdate,''hh24:mi:ss''),'
             + #39 + LoginInfo.Kod + #39 + ',''' + LoginInfo.MAC_IPNo + ''',''' + LoginInfo.MAC_Address + ''',''' + LoginInfo.Computer_Name + ''',''' + LoginInfo.Computer_User + ''')');

end;

function StrIn(AStr:String; strlist: array of string): boolean;
var i : Integer;
begin
  Result := false;
  for i := low(strlist) to high(strlist) do
    if strlist[i] = astr then
    begin
      Result := True;
      Exit;
    end;
end;

Procedure SQLList(Queryy : TOraQuery; SQLL : String);
Begin
     If Queryy.Active Then Queryy.Close;
     If SQLL = '' Then Queryy.Open
       Else
     Begin
        Queryy.SQL.Clear;
        Queryy.SQL.Add(SQLL);
        Queryy.Open;
     End;
End;

Procedure SQLList_A(Queryy : TAdoQuery; SQLL : String);
Begin
     If Queryy.Active Then Queryy.Close;
     If SQLL = '' Then Queryy.Open
       Else
     Begin
        Queryy.SQL.Clear;
        Queryy.SQL.Add(SQLL);
        Queryy.Open;
     End;
End;

function _ParcaAl(var AStr:String; Ayrac:Char): String;
begin
  if (AStr = '') or (Pos(Ayrac,AStr)<=0) then
  begin
    Result := AStr;
    AStr := '';
    Exit;
  end;
  Result := Copy(AStr,1,Pos(Ayrac,AStr)-1);
  Delete(AStr,1,Pos(Ayrac,AStr));
end;


function VarToInt(Value: Variant): Integer;
var
  TempStr: string;
  TempVal: Integer;
begin
  TempStr := VarToStr(Value);
  if TempStr = '' then TempStr := '0';
  try
    TempVal := StrToInt(TempStr);
  except on EConvertError do
      TempVal := 0;
  end;
  Result := TempVal;
end;

                                            
function GetMonthOfYear(AInt: Integer): String;
begin
  case AInt of
    1: Result := 'OCAK';
    2: Result := '�UBAT';
    3: Result := 'MART';
    4: Result := 'N�SAN';
    5: Result := 'MAYIS';
    6: Result := 'HAZ�RAN';
    7: Result := 'TEMMUZ';
    8: Result := 'A�USTOS';
    9: Result := 'EYL�L';
    10: Result := 'EK�M';
    11: Result := 'KASIM';
    12: Result := 'ARALIK';
  end;
end;


Procedure SqlRecord(MySql:String);
Begin
 if dmGlobal.dbGlobal.InTransaction Then dmGlobal.dbGlobal.Commit;
  dmGlobal.dbGlobal.StartTransaction;
  try
    dmGlobal.qTmp7.Close;
    dmGlobal.qTmp7.SQL.Clear;
    dmGlobal.qTmp7.SQL.Add(MySql);
    dmGlobal.qTmp7.ExecSQL;
    dmGlobal.dbGlobal.Commit;
  except On e:Exception Do
  Begin
     dmGlobal.dbGlobal.Rollback;
     if POS('Key violation',E.Message) > 0 then MessageDlg(' [ ��FT KAYIT HATASI ] . !! KAYIT YAPILMAYA �ALI�ILAN ��LEM DAHA �NCE YAPILMI�TIR. !! '+ MySql, mtError, [mbOK], 0)
                                           Else MessageDlg('    KAYIT ��LEM� SIRASINDA HATA OLU�TU.   ' +  E.Message  + MySql, mtError, [mbOK], 0);
     Exit;
  End;
  end;
End;

Procedure SqlRecord_Ortak(MySql:String);
Begin
 if dmGlobal.CONNECTION1.InTransaction Then dmGlobal.CONNECTION1.Commit;
  dmGlobal.CONNECTION1.StartTransaction;
  try
    dmGlobal.QTmpNo.Close;
    dmGlobal.QTmpNo.SQL.Clear;
    dmGlobal.QTmpNo.SQL.Add(MySql);
    dmGlobal.QTmpNo.ExecSQL;
    dmGlobal.CONNECTION1.Commit;
  except On e:Exception Do
  Begin
     dmGlobal.CONNECTION1.Rollback;
     if POS('Key violation',E.Message) > 0 then MessageDlg(' [ ��FT KAYIT HATASI ] . !! KAYIT YAPILMAYA �ALI�ILAN ��LEM DAHA �NCE YAPILMI�TIR. !! '+ MySql, mtError, [mbOK], 0)
                                           Else MessageDlg('    KAYIT ��LEM� SIRASINDA HATA OLU�TU.   ' +  E.Message  + MySql, mtError, [mbOK], 0);
     Exit;
  End;
  end;
End;


Function ExeccSQL(MySql:String):Boolean;
Begin
 if dmGlobal.dbGlobal.InTransaction Then dmGlobal.dbGlobal.Commit;
  dmGlobal.dbGlobal.StartTransaction;
  try
    dmGlobal.qTmp7.Close;
    dmGlobal.qTmp7.SQL.Clear;
    dmGlobal.qTmp7.SQL.Add(MySql);
    dmGlobal.qTmp7.ExecSQL;
    dmGlobal.dbGlobal.Commit;
    Result := True;
  except On e:Exception Do
  Begin
     dmGlobal.dbGlobal.Rollback;
     if POS('Key violation',E.Message) > 0 then MessageDlg(' [ ��FT KAYIT HATASI ] . !! KAYIT YAPILMAYA �ALI�ILAN ��LEM DAHA �NCE YAPILMI�TIR. !! '+ MySql, mtError, [mbOK], 0)
                                           Else MessageDlg('    KAYIT ��LEM� SIRASINDA HATA OLU�TU.   ' +  E.Message  + MySql, mtError, [mbOK], 0);
     Result := False;
  End;
  end;
End;

Function SqlRecord_A(MySql:String) : Boolean;
Begin
 if dmGlobal.Connection.InTransaction Then dmGlobal.Connection.CommitTrans;
{
 dmGlobal.Connection.BeginTrans;
  try
     dmGlobal.AdoCommand.CommandText := MySQL;
     dmGlobal.AdoCommand.Execute;
     Result := True;
  Except
     Result := False;
  End;
}
  If dmGlobal.Connection.Connected = False Then dmGlobal.Connection.Connected := True;
  dmGlobal.Connection.BeginTrans;
  try
    dmGlobal.AQTmp.Close;
    dmGlobal.AQTmp.SQL.Clear;
    dmGlobal.AQTmp.SQL.Add(MySql);
    dmGlobal.AQTmp.ExecSQL;
    dmGlobal.Connection.CommitTrans;
    Result := True;
  except On e:Exception Do
  Begin
     dmGlobal.Connection.RollbackTrans;
     Result := False;
     if POS('Key violation',E.Message) > 0 then MessageDlg(' [ ��FT KAYIT HATASI ] . !! KAYIT YAPILMAYA �ALI�ILAN ��LEM DAHA �NCE YAPILMI�TIR. !! '+ MySql, mtError, [mbOK], 0)
                                           Else MessageDlg('    KAYIT ��LEM� SIRASINDA HATA OLU�TU.   ' +  E.Message  + MySql, mtError, [mbOK], 0);
//     Exit;
  End;
  end;
  
End;

function GetWeekOfYear(ADate: TDate): Integer;
var FDate : TDate;
begin
  Result := -1;
  FDate := StrToDate('01.01.'+ Copy(DateToStr(ADate),7,4));
  while DayOfWeek(FDate) <> 2 do FDate := FDate + 1; 
  Result := Trunc(ADate-FDate) div 7 + 1;
end;

Function _SQLString(FieldName,AStr: String; Tip: Char): String; // Tip : N,F:Numeric, S,C:String, D,T: Tarih
  function Ch(AStr:String): String;
  begin
    while Pos('*',AStr) > 0 do AStr[Pos('*',AStr)] := '%';
    Result := AStr;
  end;
begin
  case Tip of
    'N','F' : Result := '('+FieldName+' = '+AStr+')';
    'S','C' : Result := '('+FieldName+' LIKE '''+Ch(AStr)+'%'')';
    'D','T' : Result := '(TO_CHAR('+FieldName+',''YYYYMMDD'') = '''+FormatDatetime('YYYYMMDD',StrToDate(AStr))+''')';
  end;
end;

Function GetMuhasebeEkranIfn(Tur: String): LongInt;
begin
  if dmglobal.qtmp.Active then dmGlobal.qtmp.Close;
  dmGlobal.qtmp.SQL.Clear;
  dmglobal.qtmp.SQL.Add('SELECT MAX(EKRAN_IFN) FROM FIS_MUHASEBE WHERE TUR='''+Tur+'''');
  dmglobal.qtmp.Open;
  Result := dmGlobal.qtmp.Fields[0].AsInteger + 1;
end;

Function _StrToNum(S: String): Variant;
Var
  k  : Integer;
Begin
  if S = '' then
  begin
    Result :=0;
    Exit;
  end;
  while (Pos(FormatSettings.ThousandSeparator,S) > 0) do Delete(S,Pos(FormatSettings.ThousandSeparator,S),1);
  k := 1;
  while k <= Length(S) do
  begin
    if (not (S[k] in ['0','1','2','3','4','5','6','7','8','9','.',',','+','-'])) then
    begin
      Delete(S,k,1);
      Dec(k);
    end;
    Inc(k);
  end;

  if S[1] <> '-' then S := '0'+S;
  try
    Result := StrToFloat(S);
  except
    Application.MessageBox('Say� d�zeni yanl��.','HATA',mb_OK);
    Result := 0;
  end;
End;

Function _NumToStr(S: Variant; L: Integer): Variant;
Var
  T: String;
Begin
  Str(S, T);
  while Length(T) < L Do T := ' ' + T;
  _NumToStr := T;
End;

Function _GetPartOfCellHeader(S, L: Integer; H: String; N: Boolean): String;

{
  -------------------------------
  -                             -
  -   S = Start Position        -
  -   L = Variabe Length        -
  -   H = Line Header           -
  -   N = Numeric Data Flag     -
  -                             -
  -------------------------------
}

Begin
  _GetPartOfCellHeader := _UnFixString(Copy(H, S, L), N);
End;

Function _SetPartOfCellHeader(H, D: String; S, L: Integer; N: Boolean): String;

{
  -------------------------------
  -                             -
  -   H = Line Header           -
  -   D = Header Data           -
  -   S = Start Position        -
  -   L = Variabe Length        -
  -   N = Numeric Data Flag     -
  -                             -
  -------------------------------
}

Var
  I: Integer;
Begin
  if H='' then H := FreeCellHeader;
  if N And (D = '') Then D := '0';
  D := _FixString(D, L, True);
  For I := 1 To L Do H[S + I - 1] := D[I];
  _SetPartOfCellHeader := H;
End;

Function _FixString(S: String; L: Integer; LJustify: Boolean): String;
Begin
  While Length(S) < L Do if LJustify Then S := S + ' '
                                     Else S := ' ' + S;
  _FixString := Copy(S, 1, L);
End;

Function _UnFixString(S: String; Numeric: Boolean): String;
Begin
  While (Length(S) > 0) and (S[1] = ' ') Do Delete(S, 1, 1);
  While (Length(S) > 0) and (S[Length(S)] = ' ') Do Delete(S, Length(S), 1);
  if Numeric And (S = '') Then S := '0';
  _UnFixString := S;
End;

Function _BakiyeHesapla(Borc, Alacak: Extended; Fmt: String): String;
var
  Bakiye: Extended;
  S     : String;
begin
  Bakiye := Borc - Alacak;
  if Bakiye > 0 Then S := FormatFloat(Fmt + ' B', Bakiye)
                Else if Bakiye < 0 Then S := FormatFloat(Fmt + ' A', Bakiye * (-1))
                                   Else S := '0   ';
  _BakiyeHesapla := S;
end;

Function _Crypto(O: Boolean; S: String; N: Integer): String;
Var
  I: Integer;
Begin
  Case O Of
    True: For I := 1 To Length(S) Do If S[I] <> ' ' Then S[I] := Chr(Ord(S[I]) + (N * 2) - ( N div 2) + N);
   False: For I := 1 To Length(S) Do If S[I] <> ' ' Then S[I] := Chr(Ord(S[I]) - (N * 2) + ( N div 2) - N);
  End;
  _Crypto := S;
End;

Function _CanFormClose(S: TDataSetState): Boolean;
begin
  if S In [dsInsert, dsEdit] Then
     Begin
       Application.MessageBox('Tablo �zerinde yap�lan i�lem tamamlanmam��, pencere kapat�lamaz !', 'HATA', mb_OK); _CanFormClose := False;
     End
     Else _CanFormClose := True;
end;

Function _MakeSQLString(S: String): String;
begin
  While Pos('*', S) > 0 Do S[Pos('*', S)] := '%';
  S := #39 + S + #39;
  if Pos('%', S) > 0 Then S := ' LIKE ' + S
                     Else S := ' = ' + S;
  _MakeSQLString := S;
end;

function _MakeManySQLString(AStr,Field: String): String;
    function GetPart(var PStr: String): String;
    begin
      if PStr = '' then begin Result:=''; Exit; end;
      if Pos(';',PStr) > 0 then
      begin
        Result := Copy(PStr,1,Pos(';',PStr)-1);
        Delete(PStr,1,Pos(';',PStr));
      end
      else
      begin
        Result := Copy(PStr,1,100);
        PStr := '';
      end;
    end;
var
  Str1,AStr2 : String; // ; or
  OrResultStr, NotResultStr : String; // @ not
begin
  While Pos('*', AStr) > 0 Do AStr[Pos('*', AStr)] := '%';

  OrResultStr := '';
  NotResultStr := '';
  Str1 := GetPart(AStr);
  while Str1 <> '' do
  begin
    if Str1[1] = '@' then
    begin
      Delete(Str1,1,1);
      if NotResultStr = '' then
      begin
        if Pos('%',Str1) > 0 then NotResultStr := '(NOT ('+Field+' LIKE '''+ Copy(Str1,1,100)+''' ))'
        else NotResultStr := '(NOT ('+Field+' = '''+ Copy(Str1,1,100)+''' ))';
      end
      else
      begin
        if Pos('%',Str1) > 0 then NotResultStr := NotResultStr+'AND(NOT('+Field+' LIKE '''+ Copy(Str1,1,100)+''' ))'
        else NotResultStr := NotResultStr+'AND(NOT('+Field+' = '''+ Copy(Str1,1,100)+''' ))';
      end;
    end
    else
    begin
      if OrResultStr = '' then
      begin
        if Pos('%',Str1) > 0 then OrResultStr := '('+Field+' LIKE '''+ Copy(Str1,1,100)+''' )'
        else OrResultStr := '('+Field+' = '''+ Copy(Str1,1,100)+''' )';
      end
      else
      begin
        if Pos('%',Str1) > 0 then OrResultStr := OrResultStr+'OR('+Field+' LIKE '''+ Copy(Str1,1,100)+''' )'
        else OrResultStr := OrResultStr+'OR('+Field+' = '''+ Copy(Str1,1,100)+''' )';
      end;
    end;
    Str1 := GetPart(AStr);
  end;

  if NotResultStr <> '' then
  begin
    if OrResultStr <> '' then Result := '('+OrResultStr+') AND ('+NotResultStr+')'
    else Result := NotResultStr;
  end
  else
  begin
    if OrResultStr <> '' then Result := OrResultStr
    else Result := '';
  end;
  if Result <> '' then Result := '('+Result+')';
end;

Function _CanClose(State: TDataSetState): Boolean;
begin
  if State In [dsInsert, dsEdit] Then
     Begin
       Application.MessageBox('Tablo �zerinde yap�lan i�lem tamamlanmam��, pencere kapat�lamaz !', 'HATA', mb_OK);
       _CanClose := False;
     End
     Else _CanClose := True;
end;

Function BoslukKes(Str : String) : String;
Var
   S : String;

Begin
    S := Str; Delete(S,Pos(' ',S),(Length(S) - Pos(' ',S)) + 1);
    BoslukKes := S;
End;

Function SatirSonuKes(Str : String) : String;
Var
   S : String;

Begin
    S := Str;
    Repeat
      Delete(S,Pos(#13,S),1);
      if Pos(#10,S)>0 then s[Pos(#10,S)] := '/';
      // Delete(S,Pos(#10,S),1);
    Until (Length(S) < 1) or ((Pos(#13,S)<1) and (Pos(#10,S)<1));
    Result := S;
End;

Function Fis_Aciklama(FisTuru: String): String;
Var
  T : String;
Begin
  T := FisTuru;
  if T = '01' Then Fis_Aciklama := 'ALINAN S�PAR��LER'
     Else
  if T = '02' Then Fis_Aciklama := 'VER�LEN S�PAR��LER'
     Else
  if T = '03' Then Fis_Aciklama := 'WEB S�PAR��'
     Else
  if T = '04' Then Fis_Aciklama := 'ALINAN KUR FARKI FATURASI'
     Else
  if T = '05' Then Fis_Aciklama := 'MAL ALIM �RS.'
     Else
  if T = '06' Then Fis_Aciklama := 'M�STAHS�L �RS.'
     Else
  if T = '07' Then Fis_Aciklama := 'KONS�NYE G�R�� �RS.'
     Else
  if T = '08' Then Fis_Aciklama := 'KONS�NYE �IKI� �ADE �RS.'
     Else
  if T = '09' Then Fis_Aciklama := '�RET�MDEN G�R��'
     Else
  if T = '10' Then Fis_Aciklama := 'DEV�R'
     Else
  if T = '11' Then Fis_Aciklama := 'SEVK G�R��'
     Else
  if T = '12' Then Fis_Aciklama := 'PERAKENDE SATI� �ADE �RS.'
     Else
  if T = '13' Then Fis_Aciklama := 'TOPTAN SATI� �ADE �RS.'
     Else
  if T = '14' Then Fis_Aciklama := 'MAL ALIM �ADE �RS.'
     Else
  if T = '15' Then Fis_Aciklama := 'PERAKENDE SATI� �RS.'
     Else
  if T = '16' Then Fis_Aciklama := 'TOPTAN SATI� �RS.'
     Else
  if T = '17' Then Fis_Aciklama := 'KONS�NYE G�R�� �ADE �RS.'
     Else
  if T = '18' Then Fis_Aciklama := 'KONS�NYE �IKI� �RS.'
     Else
  if T = '19' Then Fis_Aciklama := 'SARF F���.'
     Else
  if T = '20' Then Fis_Aciklama := 'F�RE F���.'
     Else
  if T = '21' Then Fis_Aciklama := 'HIRSIZLIK F���.'
     Else
  if T = '22' Then Fis_Aciklama := 'DAH�L� SEVK F���.'
     Else
  if T = '23' Then Fis_Aciklama := 'SEVK �IKI�.'
     Else
  if T = '24' Then Fis_Aciklama := '�RET�ME �IKI�.'
     Else
  if T = '27' Then Fis_Aciklama := 'NAK�T TAHS�LAT'
     Else
  if T = '28' Then Fis_Aciklama := 'NAK�T �DEME'
     Else
  if T = '29' Then Fis_Aciklama := 'ALACAK DEKONTU'
     Else
  if T = '30' Then Fis_Aciklama := 'BOR� DEKONTU'
     Else
  if T = '31' Then Fis_Aciklama := 'A�ILI� F���'
     Else
  if T = '32' Then Fis_Aciklama := 'V�RMAN F���'
     Else
  if T = '33' Then Fis_Aciklama := 'VER�LEN KUR FARKI FATURASI'
     Else
  if T = '34' Then Fis_Aciklama := 'ALINAN VADE FARKI FATURASI'
     Else
  if T = '35' Then Fis_Aciklama := 'VER�LEN VADE FARKI FATURASI'
     Else
  if T = '38' Then Fis_Aciklama := 'MAL ALIM FATURASI'
     Else
  if T = '36' Then Fis_Aciklama := 'GELEN HAVALE'
     Else
  if T = '37' Then Fis_Aciklama := 'G�NDER�LEN HAVALE'
     Else
  if T = '39' Then Fis_Aciklama := 'MAL ALIM �ADE FATURASI'
     Else
  if T = '40' Then Fis_Aciklama := 'PERAKENDE SATI� FATURASI'
     Else
  if T = '41' Then Fis_Aciklama := 'PERAKENDE SATI� �ADE FATURASI'
     Else
  if T = '42' Then Fis_Aciklama := 'TOPTAN SATI� FATURASI'
     Else
  if T = '43' Then Fis_Aciklama := 'TOPTAN SATI� �ADE FATURASI'
     Else
  if T = '44' Then Fis_Aciklama := 'M�STAHS�L FATURASI'
     Else
  if T = '45' Then Fis_Aciklama := 'ALINAN H�ZMET FATURASI'
     Else
  if T = '46' Then Fis_Aciklama := 'VER�LEN H�ZMET FATURASI'
     Else
  if T = '47' Then Fis_Aciklama := 'ALINAN F�YAT FARKI FATURASI'
     Else
  if T = '48' Then Fis_Aciklama := 'VER�LEN F�YAT FARKI FATURASI'
     Else
  if T = '49' Then Fis_Aciklama := 'ALINAN PROFORMA FATURA'
     Else
  if T = '50' Then Fis_Aciklama := 'VER�LEN PROFORMA FATURA'
     Else
  if T = '51' Then Fis_Aciklama := 'BANKA A�ILI� F���'
     Else
  if T = '52' Then Fis_Aciklama := 'BANKA ��LEM F���'
     Else
  if T = '53' Then Fis_Aciklama := 'BANKA V�RMAN F���'
     Else
  if T = '54' Then Fis_Aciklama := 'BANKAYA YATIRILAN'
     Else
  if T = '55' Then Fis_Aciklama := 'BANKADAN �EK�LEN'
     Else
  if T = '56' Then Fis_Aciklama := '�EK G�R��'
     Else
  if T = '57' Then Fis_Aciklama := '�EK �IKI� CAR� HESAP'
     Else
  if T = '58' Then Fis_Aciklama := '�EK �IKI� BANKA TAHS�L'
     Else
  if T = '59' Then Fis_Aciklama := '�EK �IKI� BANKA TEM�NATA'
     Else
  if T = '60' Then Fis_Aciklama := 'SENET G�R��'
     Else
  if T = '61' Then Fis_Aciklama := 'SENET �IKI�'
     Else
  if T = '62' Then Fis_Aciklama := 'SENET �IKI� BANKA TAHS�L'
     Else
  if T = '63' Then Fis_Aciklama := 'SENET �IKI� BANKA TEM�NAT'
     Else
  if T = '64' Then Fis_Aciklama := 'M��TER� �EK� BANKADA KAR�ILIKSIZ'
     Else
  if T = '65' Then Fis_Aciklama := 'M��TER� �EK� BANKADA TAHS�L'
     Else
  if T = '66' Then Fis_Aciklama := 'M��TER� �EK� BANKADAN PORTF�YE �ADE'
     Else
  if T = '67' Then Fis_Aciklama := 'M��TER� �EK� M��TER�DEN KAR�ILIKSIZ �ADE'
     Else
  if T = '68' Then Fis_Aciklama := 'M��TER� �EK� M��TER�DEN PORTF�YE �ADE'
     Else
  if T = '69' Then Fis_Aciklama := 'M��TER� �EK� M��TER�YE �ADE'
     Else
  if T = '70' Then Fis_Aciklama := 'M��TER� �EK� PORTF�YDE KAR�ILIKSIZ'
     Else
  if T = '71' Then Fis_Aciklama := 'M��TER� �EK� PORTF�YDEN TAHS�L'
     Else
  if T = '72' Then Fis_Aciklama := 'M��TER� SENED� BANKADA KAR�ILIKSIZ'
     Else
  if T = '73' Then Fis_Aciklama := 'M��TER� SENED� BANKADA TAHS�L'
     Else
  if T = '74' Then Fis_Aciklama := 'M��TER� SENED� BANKADAN PORTF�YE �ADE'
     Else
  if T = '75' Then Fis_Aciklama := 'M��TER� SENED� C�RODAN TAHS�L'
     Else
  if T = '76' Then Fis_Aciklama := 'M��TER� SENED� M��TER�DEN PORTF�YE �ADE'
     Else
  if T = '77' Then Fis_Aciklama := 'M��TER� SENED� M��TER�DEN PROTESTOLU'
     Else
  if T = '78' Then Fis_Aciklama := 'M��TER� SENED� M��TER�YE �ADE'
     Else
  if T = '79' Then Fis_Aciklama := 'M��TER� SENED� PORTF�YDE PROTESTOLU'
     Else
  if T = '80' Then Fis_Aciklama := 'M��TER� SENED� PORTF�YDEN TAHS�L'
     Else
  if T = '81' Then Fis_Aciklama := 'M��TER� SENED� TAHS�L ED�LEM�YOR'
     Else
  if T = '82' Then Fis_Aciklama := 'KEND� �EK�M�Z M��TER�DEN �ADE'
     Else
  if T = '83' Then Fis_Aciklama := 'KEND� �EK�M�Z M��TER�DE TAHS�L'
     Else
  if T = '84' Then Fis_Aciklama := 'KEND� �EK�M�Z PORTF�YDEN TAHS�L'
     Else
  if T = '85' Then Fis_Aciklama := 'KEND� SENED�M�Z M��TER�DEN �ADE'
     Else
  if T = '86' Then Fis_Aciklama := 'PORTF�YDEN TAHS�L'
     Else
  if T = '87' Then Fis_Aciklama := 'KEND� SENED�M�Z M��TER�DE PROTESTO'
     Else
  if T = '88' Then Fis_Aciklama := 'KEND� SENED�M�Z TAHS�L ED�LEM�YOR'
     Else
  if T = '89' Then Fis_Aciklama := 'KASA A�ILI� F���'
     Else
  if T = '90' Then Fis_Aciklama := 'KASA V�RMAN F���'
     Else
  if T = '91' Then Fis_Aciklama := 'KASA DEV�R F���'
     Else
  if T = '92' Then Fis_Aciklama := 'D�V�S ALIM/SATIM F���'
     Else
  if T = '97' Then Fis_Aciklama := 'KASA TAHS�L F���'
     Else
  if T = '98' Then Fis_Aciklama := 'KASA TED�YE F���'
     Else
  if T = '93' Then Fis_Aciklama := 'MUHASEBE A�ILI� F���'
     Else
  if T = '94' Then Fis_Aciklama := 'MUHASEBE TAHS�L F���'
     Else
  if T = '95' Then Fis_Aciklama := 'MUHASEBE TED�YE F���'
     Else
  if T = '96' Then Fis_Aciklama := 'MUHASEBE MAHSUP F���'
     Else
  if T = 'A1' Then Fis_Aciklama := 'M��TER� �EK� DEV�R'
     Else
  if T = 'A2' Then Fis_Aciklama := 'KEND� �EK�M�Z DEV�R'
     Else
  if T = 'A3' Then Fis_Aciklama := 'M��TER� SENED� DEV�R'
     Else
  if T = 'A4' Then Fis_Aciklama := 'KEND� SENED�M�Z DEV�R'
     Else Fis_Aciklama := 'Tan�ms�z...';
end;

Function _isNumeric(S: String): Boolean;
Var
  E: Extended;
  I: Integer;
Begin
  if S <> '' Then
     Begin
       Val(S, E, I);
       _isNumeric := (I = 0);
     End
     Else _isNumeric := False;
End;

Function Yuvarla(R: Real; Y: Integer): Real;
Var
  T, K: String;
  V   : Real;
Begin
  if (R <= 0) or (Y = 0) Then
     Begin
       Yuvarla := R; Exit;
     End;
  T := FormatFloat('################', Round(R));
  if Y > 1 Then
     Begin
       K := Copy(T, Length(T) - (Y - 1) + 1, Y - 1);
       V := 0;
       Case Length(K) Of
         1: V := 10;
         2: V := 100;
         3: V := 1000;
         4: V := 10000;
         5: V := 100000;
         6: V := 1000000;
         7: V := 10000000;
         8: V := 100000000;
         9: V := 1000000000;
      End;
      if (V / 2) > StrToFloat(K) Then V := -1 * StrToFloat(K)
                                 Else V := V - StrToFloat(K);
      Yuvarla := Round(R) + V;
    End
    Else Yuvarla := Round(R);
End;

function BuyukHarf(Ac: Char): Char;
begin
  case AC of
      'i' : Result := '�';
      '�' : Result := 'I';
      'I' : Result := 'I';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
      '�' : Result := '�';
    else Result := Upcase(Ac);
  end;
end;

Procedure TurEkle(Var S: String; T: String);
Begin
  if S = '' Then S := #39 + T + #39
            Else S := S + ', ' + #39 + T + #39;
End;

function random_barkod(max: Longint): string;
var
  i, len, max_len: integer;
  kod: string;
begin
  Randomize;
  kod := IntToStr(Random(max));
  len := Length(kod);
  max_len := Length(IntToStr(max));
  len := max_len - len;
  for i :=  1 to len do kod := '0' + kod;
  random_barkod := kod;
end;

function checksum(barkod: string): Byte;
var
  i, len: smallint;
  tek_toplam, cift_toplam, genel_toplam: integer;
  tekle_basla: boolean;
begin
  len :=  Length(barkod);
  tek_toplam := 0;
  cift_toplam := 0;
  if(len mod 2 = 1)then tekle_basla := True
  else tekle_basla := False;
  i := 1;
  while i <=len do begin
    try
      if(tekle_basla)then begin
        tek_toplam := tek_toplam + StrToInt(barkod[i]);
        i := i + 1;
        if(i<=len)then cift_toplam := cift_toplam + StrToInt(barkod[i]);
      end else begin
        cift_toplam := cift_toplam + StrToInt(barkod[i]);
        i := i + 1;
        if(i<=len)then tek_toplam := tek_toplam + StrToInt(barkod[i]);
      end;
    except
      Application.MessageBox('Rakam giriniz !', 'HATA', mb_Ok);
      Abort;
    end;
    i := i + 1;
  end;
  genel_toplam := tek_toplam * 3 + cift_toplam;
  checksum := ( 10 - (genel_toplam mod 10) ) mod 10 ;
end;

Function SayiToYazi(N: Extended): String;
Var
  Y: Array[1..6] of String[40];
  S: Integer;
  B: Integer;
  I: Integer;
  R: String[18];
  X: String[3];
Begin
  For S := 1 To 6 Do Y[S] := '';
  R := FormatFloat('#################0', N);
  B := 1;
  I := 0;
  X := '';
  For S := Length(R) DownTo 1 Do
      Begin
        I := I + 1;
        X := R[S] + X;
        if (I = 3) or (S = 1) Then
           Begin
             While Length(X) < 3 Do X := '0' + X;
             Y[B] := Rakam[1, StrToInt(Copy(X, 1, 1))];
             Y[B] := Y[B] + Rakam[2, StrToInt(Copy(X, 2, 1))];
             Y[B] := Y[B] + Rakam[3, StrToInt(Copy(X, 3, 1))];
 {            if Y[B] = '' then
             begin
               if StrToInt(Copy(X, 3, 1)) > 1 then Y[B] := Y[B] + Rakam[3, StrToInt(Copy(X, 3, 1))];
             end
             else Y[B] := Y[B] + Rakam[3, StrToInt(Copy(X, 3, 1))];
}             if B > 1 Then Case B of
                             2: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Bin ';
                             3: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Milyon ';
                             4: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Milyar ';
                             5: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Trilyon ';
                             6: if StrToInt(X) > 0 then Y[B] := Y[B] + 'Trilyar ';
                           End;
             B := B + 1;
             I := 0;
             X := '';
           End;
      End;
  SayiToYazi := Y[6] + Y[5] + Y[4] + Y[3] + Y[2] + Y[1] + ' TL.';
End;

Function StrSQL(S: String; Numeric: Boolean): String;
Begin
  if Not(Numeric) Then
     Begin
       While Pos('*', S) > 0 Do S[Pos('*', S)] := '%';
       S := #39 + S + #39;
       if Pos('%', S) > 0 Then S := ' LIKE ' + S
                          Else S := ' = ' + S;
     End
     Else S := ' = ' + S;
  StrSQL := S;
end;

Procedure AddToQuery(Var Sorgu: TOraQuery; Aralik: Boolean; A1, K, T2, A2, A3: String; DataType: Integer);
Var
  K1, K2, S: String;
Begin
  if Aralik Then
     Begin
       While Pos(' ', K) > 0 Do
       Begin
         Delete(K, Pos(' ', K), 1);
       End;
       K1 := Copy(K, 1, Pos('-', K) - 1);
       Delete(K, 1, Pos('-', K));
       K2 := K;
     End
   Else
     Begin
       K1 := K;
       K2 := K;
     End;

  Case DataType Of
    1: Begin
         K1 := Copy(K1, 7, 4) + Copy(K1, 4, 2) + Copy(K1, 1, 2);
         K2 := Copy(K2, 7, 4) + Copy(K2, 4, 2) + Copy(K2, 1, 2);
       End;
  End;

  if Aralik and (DataType <> 2) Then
     Begin
       K1 := #39 + K1 + #39;
       K2 := #39 + K2 + #39;
     End;

  if Sorgu.SQL.Count > 1 Then S := 'AND '
                         Else S := 'WHERE ';
  if T2 <> '' Then
     Begin
       if Aralik Then S := S + '(' + A1 + ' IN (SELECT ' + A2 + ' FROM ' + T2 + ' WHERE ' + A3 + ' BETWEEN ' + K1 + ' AND ' + K2 + '))'
                 Else S := S + '(' + A1 + ' IN (SELECT ' + A2 + ' FROM ' + T2 + ' WHERE ' + A3 + StrSql(K1, (DataType = 2)) + '))';
     End
   Else
     Begin
       if Aralik Then S := S + '(' + A1 + ' BETWEEN ' + K1 + ' AND ' + K2 + ')'
                 Else S := S + '(' + A1 + StrSql(K1, (DataType = 2)) + ')';
     End;
  Sorgu.SQL.Add(S);
End;

Function DateReverse(TT : String) : String;
Begin
  DateReverse := Copy(TT,7,4) + Copy(TT,4,2) + Copy(TT,1,2);
End;

procedure PrepareProc(var SProc: TOraStoredProc);
var i : Integer;
begin
  for i := 0 to SProc.ParamCount - 1 do SProc.Params[i].AsString := '';
end;

function GetStoreNumber:String;
begin
  Result := IntToStr(LoginInfo.SubeKod);
end;

Function GetUserControl:Boolean;
    function GetPart(var PStr: String): String;
    begin
      if PStr = '' then begin Result:=''; Exit; end;
      if Pos(';',PStr) > 0 then
      begin
        Result := Copy(PStr,1,Pos(';',PStr)-1);
        Delete(PStr,1,Pos(';',PStr));
      end
      else
      begin
        Result := Copy(PStr,1,100);
        PStr := '';
      end;
    end;
var
  Magaza,
  AraDeger     : String;
  MagazaSayisi : Integer;
begin

  Result := True;

  if ( LoginInfo.SubeKod > 0 ) and (LoginInfo.Subeler <> '') then
     begin
         Magaza        := LoginInfo.Subeler;
         MagazaSayisi := 0;
         while not (Magaza='') do
           begin
              AraDeger := GetPart(Magaza);
              if AraDeger <> '' then inc(MagazaSayisi);
           end;
         if MagazaSayisi = 1 then Result := False;
     end;
end;



Function _FormulaProcess(SS : String) : String;
Var
   I,Ilk,Son,ParantezAc,ParantezKapa : Integer;
   SToplam,SOkunan,Okunan            : String;
   Islem                             : Char;

   Procedure FormulHata;
   Begin
       Application.MessageBox('form�lde hata var','HATA',mb_OK);
       Abort;
   End;

   Function SonParantez(S : String) : Integer;
   Var
      Z : Integer;
   Begin
      SonParantez := 0;
      For z := 1 To Length(S) Do If S[z] = '(' Then SonParantez := z;
   End;

   Function SonSonParantez(S : String) : Integer;
   Var
      Z,C : Integer;
   Begin
      SonSonParantez := 0;
      For Z := 1 To Length(S) Do If S[Z] = '(' Then C := Z;

      Z := 0;
      While Z = 0 Do
      Begin
         If S[C] = ')' Then Z := C
                       Else C := C + 1;
      End;
      SonSonParantez := Z;
   End;

   Function DortIslemYap(S : String) : String;
   Var
      Son : Char;
   Begin
        SToplam  := '';
        SOkunan  := '';
        Islem    := #4;
        Son      := #4;
        While Length(S) > 0 Do
        Begin
            If (S[1] In [#48..#57]) Or (Son In [#42,#43,#45,#47]) Then SOkunan := SOkunan + S[1];
            If (S[1] In [#42,#43,#45,#47]) And (Not(Son In [#42,#43,#45,#47])) Then
            Begin
                If Length(SToplam) = 0 Then
                Begin
                    SToplam := SOkunan;
                End
                   Else
                Begin
                    Case Islem Of
                       '+' : SToplam := FloatToStr(StrToFloat(SToplam) + StrToFloat(SOkunan));
                       '-' : SToplam := FloatToStr(StrToFloat(SToplam) - StrToFloat(SOkunan));
                       '/' : SToplam := FloatToStr(StrToFloat(SToplam) / StrToFloat(SOkunan));
                       '*' : SToplam := FloatToStr(StrToFloat(SToplam) * StrToFloat(SOkunan));
                    End;
                End;
                Islem   := S[1];
                SOkunan := '';
            End;
            Son := S[1];
            Delete(S,1,1);
            If Length(S) = 0 Then
            Begin
                Case Islem Of
                   '+' : SToplam := FloatToStr(StrToFloat(SToplam) + StrToFloat(SOkunan));
                   '-' : SToplam := FloatToStr(StrToFloat(SToplam) - StrToFloat(SOkunan));
                   '/' : SToplam := FloatToStr(StrToFloat(SToplam) / StrToFloat(SOkunan));
                   '*' : SToplam := FloatToStr(StrToFloat(SToplam) * StrToFloat(SOkunan));
                   #4  : SToplam := SOkunan;
                 End;
            End;
        End;
        DortIslemYap :=  SToplam;
   End;

begin
    ParantezAc   := 0;
    ParantezKapa := 0;
//    If (Ss[1] In [#41,#42,#43,#45,#47]) Or (Ss[Length(Ss)] In [#40,#42,#43,#45,#47]) Then FormulHata;
    For I := 1 To Length(Ss) Do
    Begin
        If (I <> 1) And (I <> Length(Ss)) Then
        Begin
//            If (Ss[I] In [#40,#42,#43,#45,#47]) And (Ss[I+1] In [#41,#42,#43,#45,#47]) Then FormulHata;
//            If (Ss[I] In [#41]) And (Ss[I + 1] In [#40])     Then FormulHata;
//            If (Ss[I] = '(') And (Ss[I-1] In [#48..#57,#41]) Then FormulHata;
        End;
        If Ss[I] = '(' Then ParantezAc   := ParantezAc   + 1;
        If Ss[I] = ')' Then ParantezKapa := ParantezKapa + 1;
    End;
    If ParantezAc <> ParantezKapa Then FormulHata;

    If ParantezAc = 0 Then
    Begin // Grupsuz Direkt ��lem
       _FormulaProcess := FormatFloat('###,###,###,###0',StrToFloat(DortIslemYap(SS)));
    End
      Else
    Begin // Gruplamal� ��lem
        For I := 1 To ParantezAc Do
        Begin
            Okunan := '';
            Ilk := 0; Son := 0;
            Ilk := SonParantez(SS); Son := SonSonParantez(SS);
            Okunan   := DortIslemYap(Copy(SS,Ilk + 1,(Son-Ilk) - 1));
            Delete(SS,Ilk,(Son-Ilk) + 1);
            Insert(Okunan,SS,Ilk);
        End;
       _FormulaProcess := FormatFloat('###,###,###,###0',StrToFloat(DortIslemYap(SS)));
    End;
end;

var i : integer;
Begin
  With LoginInfo Do
  Begin
    Kod       := '0';
    Isim      := 'Erp2000';
    SubeKod   := 0;
    SubeUnvan := 'Erp2000';
    for i := 1 to 1000 do Haklar[i] := true;
    fmtTutar  := '###,###,###,##0';
    fmtMiktar := '###########0.###';
  End;

  With chKriter Do
  Begin
    F := 2;
    V := '';
  End;

  With skKriter Do
  Begin
    F := 2;
    V := '';
  End;

  With mhKriter Do
  Begin
    F := 0;
    V := '';
  End;
  BorcAlacakKriter.IFN := 0;
  OdemePlaniKapatEnabled := False;
end.

  '01' ALINAN S�PAR��LER'
  '02' VER�LEN S�PAR��LER'
  '03' WEB S�PAR��'
  '04' ALINAN KUR FARKI FATURASI'
  '05' MAL ALIM �RS.'
  '06' M�STAHS�L �RS.'
  '07' KONS�NYE G�R�� �RS.'
  '08' KONS�NYE �IKI� �ADE �RS.'
  '09' �RET�MDEN G�R��'
  '10' DEV�R'
  '11' SEVK G�R��'
  '12' PERAKENDE SATI� �ADE �RS.'
  '13' TOPTAN SATI� �ADE �RS.'
  '14' MAL ALIM �ADE �RS.'
  '15' PERAKENDE SATI� �RS.'
  '16' TOPTAN SATI� �RS.'
  '17' KONS�NYE G�R�� �ADE �RS.'
  '18' KONS�NYE �IKI� �RS.'
  '19' SARF F���.'
  '20' F�RE F���.'
  '21' HIRSIZLIK F���.'
  '22' DAH�L� SEVK F���.'
  '23' SEVK �IKI�.'
  '24' �RET�ME �IKI�.'
  '27' NAK�T TAHS�LAT'
  '28' NAK�T �DEME'
  '29' ALACAK DEKONTU'
  '30' BOR� DEKONTU'
  '31' A�ILI� F���'
  '32' V�RMAN F���'
  '33' VER�LEN KUR FARKI FATURASI'
  '34' ALINAN VADE FARKI FATURASI'
  '35' VER�LEN VADE FARKI FATURASI'
  '38' MAL ALIM FATURASI'
  '36' GELEN HAVALE'
  '37' G�NDER�LEN HAVALE'
  '39' MAL ALIM �ADE FATURASI'
  '40' PERAKENDE SATI� FATURASI'
  '41' PERAKENDE SATI� �ADE FATURASI'
  '42' TOPTAN SATI� FATURASI'
  '43' TOPTAN SATI� �ADE FATURASI'
  '44' M�STAHS�L FATURASI'
  '45' ALINAN H�ZMET FATURASI'
  '46' VER�LEN H�ZMET FATURASI'
  '47' ALINAN F�YAT FARKI FATURASI'
  '48' VER�LEN F�YAT FARKI FATURASI'
  '49' ALINAN PROFORMA FATURA'
  '50' VER�LEN PROFORMA FATURA'
  '51' BANKA A�ILI� F���'
  '52' BANKA ��LEM F���'
  '53' BANKA V�RMAN F���'
  '54' BANKAYA YATIRILAN'
  '55' BANKADAN �EK�LEN'
  '56' �EK G�R��'
  '57' �EK �IKI� CAR� HESAP'
  '58' �EK �IKI� BANKA TAHS�L'
  '59' �EK �IKI� BANKA TEM�NATA'
  '60' SENET G�R��'
  '61' SENET �IKI�'
  '62' SENET �IKI� BANKA TAHS�L'
  '63' SENET �IKI� BANKA TEM�NAT'
  '64' M��TER� �EK� BANKADA KAR�ILIKSIZ'
  '65' M��TER� �EK� BANKADA TAHS�L'
  '66' M��TER� �EK� BANKADAN PORTF�YE �ADE'
  '67' M��TER� �EK� M��TER�DEN KAR�ILIKSIZ �ADE'
  '68' M��TER� �EK� M��TER�DEN PORTF�YE �ADE'
  '69' M��TER� �EK� M��TER�YE �ADE'
  '70' M��TER� �EK� PORTF�YDE KAR�ILIKSIZ'
  '71' M��TER� �EK� PORTF�YDEN TAHS�L'
  '72' M��TER� SENED� BANKADA KAR�ILIKSIZ'
  '73' M��TER� SENED� BANKADA TAHS�L'
  '74' M��TER� SENED� BANKADAN PORTF�YE �ADE'
  '75' M��TER� SENED� C�RODAN TAHS�L'
  '76' M��TER� SENED� M��TER�DEN PORTF�YE �ADE'
  '77' M��TER� SENED� M��TER�DEN PROTESTOLU'
  '78' M��TER� SENED� M��TER�YE �ADE'
  '79' M��TER� SENED� PORTF�YDE PROTESTOLU'
  '80' M��TER� SENED� PORTF�YDEN TAHS�L'
  '81' M��TER� SENED� TAHS�L ED�LEM�YOR'
  '82' KEND� �EK�M�Z M��TER�DEN �ADE'
  '83' KEND� �EK�M�Z M��TER�DE TAHS�L'
  '84' KEND� �EK�M�Z PORTF�YDEN TAHS�L'
  '85' KEND� SENED�M�Z M��TER�DEN �ADE'
  '86' PORTF�YDEN TAHS�L'
  '87' KEND� SENED�M�Z M��TER�DE PROTESTO'
  '88' KEND� SENED�M�Z TAHS�L ED�LEM�YOR'
  '89' KASA A�ILI� F���'
  '90' KASA V�RMAN F���'
  '91' KASA DEV�R F���'
  '92' D�V�S ALIM/SATIM F���'
  '97' KASA TAHS�L F���'
  '98' KASA TED�YE F���'
  '93' MUHASEBE A�ILI� F���'
  '94' MUHASEBE TAHS�L F���'
  '95' MUHASEBE TED�YE F���'
  '96' MUHASEBE MAHSUP F���'
  'A1' M��TER� �EK� DEV�R'
  'A2' KEND� �EK�M�Z DEV�R'
  'A3' M��TER� SENED� DEV�R'
  'A4' KEND� SENED�M�Z DEV�R'



  '96' Proforma 
  '97' Bu�day Al�m Fi�i'
  '98' Y�kleme Fi�i'
  '99' Fiyat Re�etesi'

