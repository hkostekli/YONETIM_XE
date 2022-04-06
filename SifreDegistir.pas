unit SifreDegistir;

interface

uses 
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Db, DBAccess, Ora, OraSmart, MemDS, OraError, Menus;

type
  TForm_SifreDegistir = class(TForm)      
    Label1 : TLabel;
    Label2 : TLabel;
    Label3 : TLabel;
    Edit1  : TEdit;
    Edit2  : TEdit;
    Edit3  : TEdit;
    Panel1 : TPanel;
    BtnKaydet  : TBitBtn;
    BtnKapat   : TBitBtn;
    BtnDegistir: TBitBtn;
    qkullanici: TOraQuery;
    uKullanici: TOraUpdateSQL;
    PopupMenu1: TPopupMenu;
    Yardm1: TMenuItem;
    procedure BtnDegistirClick(Sender: TObject);
    procedure BtnKaydetClick(Sender: TObject);
    procedure BtnKapatClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    function NumericSayisi(Str:string):Integer;
  public
    { Public declarations }
  end;

var
  Form_SifreDegistir: TForm_SifreDegistir;

implementation

uses DModule,BlyLib;

{$R *.DFM}


function TForm_SifreDegistir.NumericSayisi(Str:string):Integer;
var
   Bas,Uzunluk,i,Code : Integer;
   Sonuc, Karakter    : String;
begin
   Sonuc   := '';
   Bas     := 0;
   Uzunluk := Length(Str);
   repeat
       Bas := Bas + 1;
       Karakter := Copy(Str,Bas,1);
       Val(Karakter,i, Code);
       if Code = 0 then Sonuc := Sonuc + Karakter;
   until(Bas >= Uzunluk);
   Code   := i;
   Result := Length(Sonuc);
end;

procedure TForm_SifreDegistir.BtnDegistirClick(Sender: TObject);
begin
  BtnDegistir.Enabled := False;
  BtnKaydet.Enabled   := True;
  Edit1.ReadOnly := False;
  Edit2.ReadOnly := False;
  Edit3.ReadOnly := False;
  Edit1.SetFocus;
end;

procedure TForm_SifreDegistir.BtnKaydetClick(Sender: TObject);
var i : integer;
begin
  if qKullanici.Active then qKullanici.Close;
  qKullanici.Sql.Clear;
  qKullanici.Sql.Add('SELECT KOD,SIFRE FROM KULLANICI WHERE KOD = '+ LoginInfo.Kod);
  qKullanici.Open;
  if qKullanici.FieldByName('KOD').AsString <> LoginInfo.Kod then
  begin
    Application.MessageBox('Hatalý Kullanýcý Bilgisi. Program satýcýnýzla görüþünüz.','DÝKKAT',mb_OK);
    qKullanici.close;
    Exit;
  end;
  if _Crypto(False, qKullanici.FieldByName('SIFRE').AsString, 5) <> Edit1.Text then
  begin
    Application.MessageBox('Eski þifrenizi yanlýþ girdiniz. Tekrar giriniz.','DÝKKAT',mb_OK);
    Edit1.SetFocus;
    qKullanici.Close;
    Exit;
  end;
  if Edit2.Text <> Edit3.Text then
  begin
    Application.MessageBox('Yeni Parolanýz Yanlýþ.','DÝKKAT',mb_OK);
    Edit2.SetFocus;
    qKullanici.Close;
    Exit;
  end;
  if ParametreSifre.Sifre_Aktif = 'E' then          //SifreParametreleri
    begin
      if ParametreSifre.Onceki_Sifre_Engelle = 'E' then
        begin
          dmGlobal.qTmp.SQL.Clear;
          dmGlobal.qTmp.SQL.Add('Select DISTINCT(SIFRE) from KULLANICI_LOG where KOD='+IntToStr(ParametreSifre.Kullanici_Id));
          dmGlobal.qTmp.Open;
          while not dmGlobal.qTmp.EOF do
          begin
            if Edit2.Text = _Crypto(False, dmGlobal.qTmp.Fields[0].AsString, 5) then
            begin
              Application.MessageBox('Daha önce kullandýðýnýz þifrelerden birini tekrar kullanamazsýnýz.','Bilgi',mb_ok);
              Edit2.SetFocus;
              qKullanici.Close;
              Exit;
            end;
            dmGlobal.qTmp.Next;
          end;
        end;
      if ParametreSifre.KullaniciAdi_Sifre_Farkli = 'E' then
        begin
          if LoginInfo.LOGINNAME = Edit2.Text then
            begin
              Application.MessageBox('Kullanýcý adýnýz ve þifreniz ayný olamaz.','Bilgi',mb_ok);
              Edit2.SetFocus;
              qKullanici.Close;
              Exit;
            end;
        end;
      if Length(Edit2.Text)< ParametreSifre.Min_Sifre_Uzunlugu then
        begin
          Application.MessageBox(PChar('Þifreniz en az '+ IntToStr(ParametreSifre.Min_Sifre_Uzunlugu) +' karakter olmalýdýr.'),'DÝKKAT',mb_OK);
          Edit2.SetFocus;
          qKullanici.Close;
          Exit;
        end;
      if Length(Edit2.Text) - NumericSayisi(Edit2.Text) < ParametreSifre.Min_Text_Sayisi then
        begin
          Application.MessageBox(PChar('Þifrenizde en az '+ IntToStr(ParametreSifre.Min_Text_Sayisi) +' text karakter olmalýdýr.'),'DÝKKAT',mb_OK);
          Edit2.SetFocus;
          qKullanici.Close;
          Exit;
        end;
      if NumericSayisi(Edit2.Text) < ParametreSifre.Min_Numerik_Sayisi then
        begin
          Application.MessageBox(PChar('Þifrenizde en az '+ IntToStr(ParametreSifre.Min_Numerik_Sayisi) +' nümerik karakter olmalýdýr.'),'DÝKKAT',mb_OK);
          Edit2.SetFocus;
          qKullanici.Close;
          Exit;
        end;
    end
  else if Length(Edit2.Text)< 4 then
     begin
       Application.MessageBox('Þifreniz en az 4 karakter olmalýdýr.','DÝKKAT',mb_OK);
       Edit2.SetFocus;
       qKullanici.Close;
       Exit;
     end;

  qKullanici.Edit;
  qKullanici.FieldByName('SIFRE').AsString    := _Crypto(True, Edit2.Text, 5);
  qKullanici.Post;
  With dmGlobal Do
  Begin
    dbGlobal.StartTransaction;
    Try
      qKullanici.ApplyUpdates;
      dbGlobal.Commit;
      qKullanici.CommitUpdates;
    Except
      dbGlobal.RollBack;
      qKullanici.CancelUpdates;
      Application.MessageBox('Kayýt Sýrasýnda Hata Oluþtu ve Kayýt Ýptal Edildi','HATA !',mb_OK);
    End;
  End;

  SqlRecord('UPDATE PARAMETRE_SIFRE SET SIFRE_KAYIT_TARIHI=TRUNC(SYSDATE) WHERE KULLANICI_ID='+ IntToStr(ParametreSifre.Kullanici_Id));
  // Belit.Net için
  SqlRecord('UPDATE KULLANICI_WEBYETKI SET WEBYETKI='''+Edit2.Text+''' WHERE KOD='+ LoginInfo.Kod);

  BtnDegistir.Enabled := True;
  BtnKaydet.Enabled   := False;
  Edit1.ReadOnly := True;
  Edit2.ReadOnly := True;
  Edit3.ReadOnly := True;
  Close;
end;

procedure TForm_SifreDegistir.BtnKapatClick(Sender: TObject);
begin
  Close;
end;

procedure TForm_SifreDegistir.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TForm_SifreDegistir.FormCreate(Sender: TObject);
begin
  BtnDegistir.Enabled := (LoginInfo.Haklar[902]);
end;

end.
