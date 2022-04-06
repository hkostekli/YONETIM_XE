unit BlyLib;

interface
  Uses Menus, dbTables, DBAccess, Ora, OraSmart, MemDS, OraError, db, ComCtrls, SysUtils, forms, windows;

  Type
    MenuButtons = Set Of (mEkle, mDegistir, mSil, mKopyala, mKaydet, mVazgec, mArama, mYazdir, mOdemePlani, mBarkod, mSerino, mAlternatifMal, mSubeFiyat, mEkstre, mHesap, mKapat, mKartlardanGetir, mTemizle, mKodOlustur, mBarkodluIslem, mSeriNumaraliIslem, mMalNumaraliIslem, mIstatistik, mFiyatYansit, mSiparisOneri, mEmail, mBlgDonustur, mIlk, mOnceki, mSonraki, mSon, mBos1, mBos2);
    Dosya_Tipi = Record
                    _Field : String[10];
                    _Value : String[50];
                    _Locate: String[10];
                    _OK    : Boolean;
                  End;

  Const
    FreeCellHeader = '                                                                                                                                                                                                                                                              ';

  Var
    L_Kayit             : Dosya_Tipi;
    L_Dosya             : File Of Dosya_Tipi;

    LoginInfo: Record
                 Isim     : String[40];
                 Kod      : String[6];
                 SubeKod  : String[8];
                 SubeUnvan: String[50];
                 Haklar   : Array[1..9999] of Boolean;
                 Yil      : String[4];
                 Sifre    : String[20];
                 fmtMiktar: String[30];
                 fmtTutar : String[30];
                 fmtOran  : String[30];
                 Basamak  : Char;
                 Ondalik  : Char;
                 Aktif_Kur: String[5];
                 Satinalmaci: String[25];                 
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


  Function _StrToNum(S: String): Variant;
  Function _NumToStr(S: Variant; L: Integer): Variant;
  Function _GetPartOfCellHeader(S, L: Integer; H: String; N: Boolean): String;
  Function _SetPartOfCellHeader(H, D: String; S, L: Integer; N: Boolean): String;
  Function _FixString(S: String; L: Integer; LJustify: Boolean): String;
  Function _UnFixString(S: String; Numeric: Boolean): String;
  Function _BakiyeHesapla(Borc, Alacak: Extended; Fmt: String): String;
  Function _Crypto(O: Boolean; S: String; N: Integer): String;  Function _CanFormClose(S: TDataSetState): Boolean;
  Function _MakeSQLString(S: String): String;
  Function _CanClose(State: TDataSetState): Boolean;
  Function BoslukKes(Str : String) : String;
  Function Fis_Aciklama(T: String): String;
  Function _isNumeric(S: String): Boolean;
  Function Yuvarla(R: Real; Y: Integer): Real;
  function BuyukHarf(Ac: Char): Char;
  Procedure TurEkle(Var S: String; T: String);
  function random_barkod(max: Longint): string;
  function checksum(barkod: string): Byte;
  Function SayiToYazi(N: Extended): String;

implementation

const
  Rakam: Array[1..3, 0..9] of String[10] = (('','yüz', 'ikiyüz', 'üçyüz', 'dörtyüz', 'beþyüz', 'altýyüz', 'yediyüz', 'sekizyüz', 'dokuzyüz'),
                                            ('','on', 'yirmi', 'otuz', 'kýrk', 'elli', 'altmýþ', 'yetmiþ', 'seksen', 'doksan'),
                                            ('','bir', 'iki', 'üç', 'dört', 'beþ', 'altý', 'yedi', 'sekiz', 'dokuz'));

Function _StrToNum(S: String): Variant;
Var
  I: Extended;
  J: Integer;
Begin
  S := '0' + S;
  J := 1;
  I := 0;
  While J > 0 Do
  Begin
    {$I-}
    Val(S, I, J);
    {$I+}
    if J > 0 Then Delete(S, J, 1);
  End;
  _StrToNum := I;
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
    True: For I := 1 To Length(S) Do S[I] := Chr(Ord(S[I]) + (N * 2) - ( N div 2) + N);
   False: For I := 1 To Length(S) Do S[I] := Chr(Ord(S[I]) - (N * 2) + ( N div 2) - N);
  End;
  _Crypto := S;
End;

Function _CanFormClose(S: TDataSetState): Boolean;
begin
  if S In [dsInsert, dsEdit] Then
     Begin
       Application.MessageBox('Tablo üzerinde yapýlan iþlem tamamlanmamýþ, pencere kapatýlamaz !', 'HATA', mb_OK); _CanFormClose := False;
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


Function _CanClose(State: TDataSetState): Boolean;
begin
  if State In [dsInsert, dsEdit] Then
     Begin
       Application.MessageBox('Tablo üzerinde yapýlan iþlem tamamlanmamýþ, pencere kapatýlamaz !', 'HATA', mb_OK);
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

Function Fis_Aciklama(T: String): String;
Begin
  if T = '01' Then Fis_Aciklama := 'ALINAN SÝPARÝÞLER'
     Else
  if T = '02' Then Fis_Aciklama := 'VERÝLEN SÝPARÝÞLER'
     Else
  if T = '03' Then Fis_Aciklama := 'WEB SÝPARÝÞ'
     Else
  if T = '04' Then Fis_Aciklama := 'ALINAN KUR FARKI FÝÞÝ'
     Else
  if T = '05' Then Fis_Aciklama := 'MAL ALIM ÝRS.'
     Else
  if T = '06' Then Fis_Aciklama := 'MÜSTAHSÝL ÝRS.'
     Else
  if T = '07' Then Fis_Aciklama := 'KONSÝNYE GÝRÝÞ ÝRS.'
     Else
  if T = '08' Then Fis_Aciklama := 'KONSÝNYE ÇIKIÞ ÝADE ÝRS.'
     Else
  if T = '09' Then Fis_Aciklama := 'ÜRETÝMDEN GÝRÝÞ'
     Else
  if T = '10' Then Fis_Aciklama := 'DEVÝR'
     Else
  if T = '11' Then Fis_Aciklama := 'SEVK GÝRÝÞ'
     Else
  if T = '12' Then Fis_Aciklama := 'PERAKENDE SATIÞ ÝADE ÝRS.'
     Else
  if T = '13' Then Fis_Aciklama := 'TOPTAN SATIÞ ÝADE ÝRS.'
     Else
  if T = '14' Then Fis_Aciklama := 'MAL ALIM ÝADE ÝRS.'
     Else
  if T = '15' Then Fis_Aciklama := 'PERAKENDE SATIÞ ÝRS.'
     Else
  if T = '16' Then Fis_Aciklama := 'TOPTAN SATIÞ ÝRS.'
     Else
  if T = '17' Then Fis_Aciklama := 'KONSÝNYE GÝRÝÞ ÝADE ÝRS.'
     Else
  if T = '18' Then Fis_Aciklama := 'KONSÝNYE ÇIKIÞ ÝRS.'
     Else
  if T = '19' Then Fis_Aciklama := 'SARF FÝÞÝ.'
     Else
  if T = '20' Then Fis_Aciklama := 'FÝRE FÝÞÝ.'
     Else
  if T = '21' Then Fis_Aciklama := 'HIRSIZLIK FÝÞÝ.'
     Else
  if T = '22' Then Fis_Aciklama := 'DAHÝLÝ SEVK FÝÞÝ.'
     Else
  if T = '23' Then Fis_Aciklama := 'SEVK ÇIKIÞ.'
     Else
  if T = '24' Then Fis_Aciklama := 'ÜRETÝME ÇIKIÞ.'
     Else
  if T = '27' Then Fis_Aciklama := 'NAKÝT TAHSÝLAT'
     Else
  if T = '28' Then Fis_Aciklama := 'NAKÝT ÖDEME'
     Else
  if T = '29' Then Fis_Aciklama := 'ALACAK DEKONTU'
     Else
  if T = '30' Then Fis_Aciklama := 'BORÇ DEKONTU'
     Else
  if T = '31' Then Fis_Aciklama := 'AÇILIÞ FÝÞÝ'
     Else
  if T = '32' Then Fis_Aciklama := 'VÝRMAN FÝÞÝ'
     Else
  if T = '33' Then Fis_Aciklama := 'VERÝLEN KUR FARKI FÝÞÝ'
     Else
  if T = '34' Then Fis_Aciklama := 'ALINAN VADE FARKI FATURASI'
     Else
  if T = '35' Then Fis_Aciklama := 'VERÝLEN VADE FARKI FATURASI'
     Else
  if T = '38' Then Fis_Aciklama := 'MAL ALIM FATURASI'
     Else
  if T = '36' Then Fis_Aciklama := 'GELEN HAVALE'
     Else
  if T = '37' Then Fis_Aciklama := 'GÖNDERÝLEN HAVALE'
     Else
  if T = '39' Then Fis_Aciklama := 'MAL ALIM ÝADE FATURASI'
     Else
  if T = '40' Then Fis_Aciklama := 'PERAKENDE SATIÞ FATURASI'
     Else
  if T = '41' Then Fis_Aciklama := 'PERAKENDE SATIÞ ÝADE FATURASI'
     Else
  if T = '42' Then Fis_Aciklama := 'TOPTAN SATIÞ FATURASI'
     Else
  if T = '43' Then Fis_Aciklama := 'TOPTAN SATIÞ ÝADE FATURASI'
     Else
  if T = '44' Then Fis_Aciklama := 'MÜSTAHSÝL FATURASI'
     Else
  if T = '45' Then Fis_Aciklama := 'ALINAN HÝZMET FATURASI'
     Else
  if T = '46' Then Fis_Aciklama := 'VERÝLEN HÝZMET FATURASI'
     Else
  if T = '47' Then Fis_Aciklama := 'ALINAN FÝYAT FARKI FATURASI'
     Else
  if T = '48' Then Fis_Aciklama := 'VERÝLEN FÝYAT FARKI FATURASI'
     Else
  if T = '49' Then Fis_Aciklama := 'ALINAN PROFORMA FATURA'
     Else
  if T = '50' Then Fis_Aciklama := 'VERÝLEN PROFORMA FATURA'
     Else
  if T = '51' Then Fis_Aciklama := 'BANKA AÇILIÞ FÝÞÝ'
     Else
  if T = '52' Then Fis_Aciklama := 'BANKA ÝÞLEM FÝÞÝ'
     Else
  if T = '53' Then Fis_Aciklama := 'BANKA VÝRMAN FÝÞÝ'
     Else
  if T = '54' Then Fis_Aciklama := 'BANKAYA YATIRILAN'
     Else
  if T = '55' Then Fis_Aciklama := 'BANKADAN ÇEKÝLEN'
     Else
  if T = '56' Then Fis_Aciklama := 'ÇEK GÝRÝÞ'
     Else
  if T = '57' Then Fis_Aciklama := 'ÇEK ÇIKIÞ CARÝ HESAP'
     Else
  if T = '58' Then Fis_Aciklama := 'ÇEK ÇIKIÞ BANKA TAHSÝL'
     Else
  if T = '59' Then Fis_Aciklama := 'ÇEK ÇIKIÞ BANKA TEMÝNATA'
     Else
  if T = '60' Then Fis_Aciklama := 'SENET GÝRÝÞ'
     Else
  if T = '61' Then Fis_Aciklama := 'SENET ÇIKIÞ'
     Else
  if T = '62' Then Fis_Aciklama := 'SENET ÇIKIÞ BANKA TAHSÝL'
     Else
  if T = '63' Then Fis_Aciklama := 'SENET ÇIKIÞ BANKA TEMÝNAT'
     Else
  if T = '64' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ BANKADA KARÞILIKSIZ'
     Else
  if T = '65' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ BANKADA TAHSÝL'
     Else
  if T = '66' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ BANKADAN PORTFÖYE ÝADE'
     Else
  if T = '67' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ MÜÞTERÝDEN KARÞILIKSIZ ÝADE'
     Else
  if T = '68' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ MÜÞTERÝDEN PORTFÖYE ÝADE'
     Else
  if T = '69' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ MÜÞTERÝYE ÝADE'
     Else
  if T = '70' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ PORTFÖYDE KARÞILIKSIZ'
     Else
  if T = '71' Then Fis_Aciklama := 'MÜÞTERÝ ÇEKÝ PORTFÖYDEN TAHSÝL'
     Else
  if T = '72' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ BANKADA KARÞILIKSIZ'
     Else
  if T = '73' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ BANKADA TAHSÝL'
     Else
  if T = '74' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ BANKADAN PORTFÖYE ÝADE'
     Else
  if T = '75' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ CÝRODAN TAHSÝL'
     Else
  if T = '76' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ MÜÞTERÝDEN PORTFÖYE ÝADE'
     Else
  if T = '77' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ MÜÞTERÝDEN PROTESTOLU'
     Else
  if T = '78' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ MÜÞTERÝYE ÝADE'
     Else
  if T = '79' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ PORTFÖYDE PROTESTOLU'
     Else
  if T = '80' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ PORTFÖYDEN TAHSÝL'
     Else
  if T = '81' Then Fis_Aciklama := 'MÜÞTERÝ SENEDÝ TAHSÝL EDÝLEMÝYOR'
     Else
  if T = '82' Then Fis_Aciklama := 'KENDÝ ÇEKÝMÝZ MÜÞTERÝDEN ÝADE'
     Else
  if T = '83' Then Fis_Aciklama := 'KENDÝ ÇEKÝMÝZ MÜÞTERÝDE TAHSÝL'
     Else
  if T = '84' Then Fis_Aciklama := 'KENDÝ ÇEKÝMÝZ PORTFÖYDEN TAHSÝL'
     Else
  if T = '85' Then Fis_Aciklama := 'KENDÝ SENEDÝMÝZ MÜÞTERÝDEN ÝADE'
     Else
  if T = '86' Then Fis_Aciklama := 'PORTFÖYDEN TAHSÝL'
     Else
  if T = '87' Then Fis_Aciklama := 'KENDÝ SENEDÝMÝZ MÜÞTERÝDE PROTESTO'
     Else
  if T = '88' Then Fis_Aciklama := 'KENDÝ SENEDÝMÝZ TAHSÝL EDÝLEMÝYOR'
     Else
  if T = '89' Then Fis_Aciklama := 'KASA AÇILIÞ FÝÞÝ'
     Else
  if T = '90' Then Fis_Aciklama := 'KASA VÝRMAN FÝÞÝ'
     Else
  if T = '91' Then Fis_Aciklama := 'KASA DEVÝR FÝÞÝ'
     Else
  if T = '92' Then Fis_Aciklama := 'DÖVÝS ALIM/SATIM FÝÞÝ'
     Else
  if T = '97' Then Fis_Aciklama := 'TAHSÝL FÝÞÝ'
     Else
  if T = '98' Then Fis_Aciklama := 'TEDÝYE FÝÞÝ'
     Else
  if T = '93' Then Fis_Aciklama := 'MUHASEBE AÇILIÞ FÝÞÝ'
     Else
  if T = '94' Then Fis_Aciklama := 'MUHASEBE TAHSÝL FÝÞÝ'
     Else
  if T = '95' Then Fis_Aciklama := 'MUHASEBE TEDÝYE FÝÞÝ'
     Else
  if T = '96' Then Fis_Aciklama := 'MUHASEBE MAHSUP FÝÞÝ'
     Else Fis_Aciklama := 'Tanýmsýz...';
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
      'i' : Result := 'Ý';
      'ý' : Result := 'I';
      'I' : Result := 'I';
      'Ý' : Result := 'Ý';
      'ü' : Result := 'Ü';
      'Ü' : Result := 'Ü';
      'ö' : Result := 'Ö';
      'Ö' : Result := 'Ö';
      'þ' : Result := 'Þ';
      'Þ' : Result := 'Þ';
      'ç' : Result := 'Ç';
      'Ç' : Result := 'Ç';
      'ð' : Result := 'Ð';
      'Ð' : Result := 'Ð';
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
             if B > 1 Then Case B of
                             2: Y[B] := Y[B] + 'bin ';
                             3: Y[B] := Y[B] + 'milyon ';
                             4: Y[B] := Y[B] + 'milyar ';
                             5: Y[B] := Y[B] + 'trilyon ';
                             6: Y[B] := Y[B] + 'trilyar ';
                           End;
             B := B + 1;
             I := 0;
             X := '';
           End;
      End;
  SayiToYazi := Y[6] + Y[5] + Y[4] + Y[3] + Y[2] + Y[1] + ' TL.';
End;

Begin
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

end.


