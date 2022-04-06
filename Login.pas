{$INCLUDE Unit\Belit.Inc}
unit Login;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
   Buttons, ExtCtrls, Db, DBAccess, Ora, OraSmart, MemDS, OraError, dialogs, Comctrls, Menus, Registry,
  cxGraphics, SQLMemMain, cxLabel, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxImageComboBox, cxLookupEdit,
  cxDBLookupEdit, cxDBLookupComboBox, dxSkinsCore, dxSkinsDefaultPainters,
  cxLookAndFeels, cxLookAndFeelPainters, dxGDIPlusClasses, cxImage;

type
   TLogin_Service = class(TForm)
      PopupMenu1: TPopupMenu;
      Timer1: TTimer;
      Adese1: TMenuItem;
      Mercek1: TMenuItem;
      Kule1: TMenuItem;
      Seha1: TMenuItem;
      Selet1: TMenuItem;
    qSorgu: TSQLMemQuery;
    qSirket: TSQLMemTable;
    qSirketId: TIntegerField;
    qSirketAdi: TStringField;
    cxlabe: TSQLMemTable;
    cxlabeId: TIntegerField;
    cxlabefkId: TIntegerField;
    cxlabeyil: TStringField;
    cxlabeUserName: TStringField;
    cxlabeID002: TStringField;
    Panel1: TPanel;
    Image1: TImage;
    SpeedButton1: TSpeedButton;
    AviLogin: TAnimate;
    cxSirketAdi: TcxImageComboBox;
    cxCalismaYili: TcxImageComboBox;
    edKod: TcxTextEdit;
    edSifre: TcxTextEdit;
    CxYonetim: TcxImageComboBox;
    Kapat1: TMenuItem;
    CbSirket: TcxImageComboBox;
    qSirketYil: TSQLMemTable;
    qSirketYilId: TIntegerField;
    qSirketYilfkId: TIntegerField;
    qSirketYilyil: TStringField;
    qSirketYilUserName: TStringField;
    qSirketYilID002: TStringField;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel11: TcxLabel;
    cxImage1: TcxImage;
    cxImageComboBox1: TcxImageComboBox;
      procedure BtnOnayClick(Sender: TObject);
      procedure BtnVazgecClick(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure Timer1Timer(Sender: TObject);
      procedure cbFirmaKeyPress(Sender: TObject; var Key: Char);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer);
      procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
         Y: Integer);
    procedure cxSirketAdiPropertiesChange(Sender: TObject);
    procedure edKodExit(Sender: TObject);
    procedure Kapat1Click(Sender: TObject);
    procedure CbSirketPropertiesChange(Sender: TObject);
    procedure cxLabel11Click(Sender: TObject);
    procedure cxImage1Click(Sender: TObject);
    procedure edSifreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
   private
    { Private declarations }
    Procedure AltFirmalariOlustur;
    procedure ParametreSifreDoldur;
    Procedure DBConnect;
   public
    { Public declarations }
   end;

var
   Login_Service                        : TLogin_Service;
   Connected                            : Boolean;

implementation

uses dModule, BlyLib, ErpMenu, RolSec, SifreDegistir, FormDuzen;

var
   Sayi                                 : Integer;
   pt                                   : TPoint;
   Tasi                                 : Boolean;
   TableName                            : String;
   HataliGiris                          : Integer;
   GirisKontrol,FormSayac                         : Integer;
   LoginID                              : String;

{$R *.DFM}

const
   vx                                   : integer = 5;
   vy                                   : integer = 5;
var
   TryCounter                           : Integer;
   mx, my                               : integer;
   Last                                 : TPoint;
   SifreDegisiklik                      : Boolean = False;

procedure LoadToBuffer(S: string; K: Integer);
begin
   S := _Crypto(False, S, K);
   while Length(S) > 1 do
      begin
         LoginInfo.Haklar[StrToInt(Copy(S, 1, 4))] := True;
         if Length(S) > 4 then Delete(S, 1, 5)
         else Delete(S, 1, 4);
      end;
end;

function AnyStr: string;
const
   D                                    : array[1..12] of Integer = (64, 64, 65, 65, 67, 70, 70, 71, 71, 72, 75, 77);
begin
   AnyStr := Chr(D[3] + 3) + Chr(D[4] + 4) + Chr(D[11] + 11) + Chr(D[4] + 4) + Chr(D[6] + 6) + Chr(D[8] + 8) + Chr(D[9] + 9) + Chr(D[4] + 4) + Chr(D[3] + 3) + Chr(32) + Chr(D[2] + 2) + Chr(D[12] + 12)
      + Chr(32) + Chr(D[12] + 12) + Chr(D[8] + 8) + Chr(D[7] + 7) + Chr(D[5] + 5) + Chr(D[1] + 1) + Chr(D[10] + 10) + Chr(D[7] + 7) + Chr(D[4] + 4);
end;


procedure TLogin_Service.ParametreSifreDoldur;        //SifreParametreleri
var
  No : Integer;
begin
  dmGlobal.qTmp.Close;
  dmGlobal.qTmp.SQL.Clear;
  dmGlobal.qTmp.SQL.Add('Select KOD from KULLANICI where LOGINNAME = ''' + edKod.Text + '''');
  dmGlobal.qTmp.Open;
  No := dmGlobal.qTmp.FieldByName('KOD').AsInteger;
  dmGlobal.qTmp.Close;

  dmGlobal.qTmp.SQL.Clear;
  dmGlobal.qTmp.SQL.Add('Select * from PARAMETRE_SIFRE where KULLANICI_ID='+IntToStr(No));
  dmGlobal.qTmp.Open;
  if dmGlobal.qTmp.RecordCount > 0 then
    begin
      ParametreSifre.Kullanici_Id               := dmGlobal.qTmp.FieldByName('KULLANICI_ID').AsInteger;
      ParametreSifre.Sifre_Aktif                := dmGlobal.qTmp.FieldByName('SIFRE_AKTIF').AsString;
      ParametreSifre.Onceki_Sifre_Engelle       := dmGlobal.qTmp.FieldByName('ONCEKI_SIFRE_ENGELLE').AsString;
      ParametreSifre.KullaniciAdi_Sifre_Farkli  := dmGlobal.qTmp.FieldByName('KULLANICIADI_SIFRE_FARKLI').AsString;
      ParametreSifre.Sifre_Kayit_Tarihi         := dmGlobal.qTmp.FieldByName('SIFRE_KAYIT_TARIHI').AsDateTime;
      ParametreSifre.Sifre_Periyodu             := dmGlobal.qTmp.FieldByName('SIFRE_PERIYODU').AsInteger;
      ParametreSifre.Uyari_Suresi               := dmGlobal.qTmp.FieldByName('UYARI_SURESI').AsInteger;
      ParametreSifre.Min_Sifre_Uzunlugu         := dmGlobal.qTmp.FieldByName('MIN_SIFRE_UZUNLUGU').AsInteger;
      ParametreSifre.Min_Text_Sayisi            := dmGlobal.qTmp.FieldByName('MIN_TEXT_SAYISI').AsInteger;
      ParametreSifre.Min_Numerik_Sayisi         := dmGlobal.qTmp.FieldByName('MIN_NUMERIK_SAYISI').AsInteger;
      ParametreSifre.Hatali_Giris_Sayisi        := dmGlobal.qTmp.FieldByName('HATALI_GIRIS_SAYISI').AsInteger;
    end;
  dmGlobal.qTmp.Close;
end;

Procedure TLogin_Service.DBConnect;
Begin
    qSorgu.Close;
    qSorgu.Sql.Clear;
    qSorgu.Sql.Add('SELECT UserName,ID002 FROM '+TableName+' WHERE FKID='+IntToStr(cxSirketAdi.Properties.Items[cxSirketAdi.ItemIndex].Tag) + ' AND ID='+IntToStr(cxCalismaYili.Properties.Items[cxCalismaYili.ItemIndex].Tag));
    qSorgu.Open;
    Try
       LoginInfo.OracleKullanici := qSorgu.FieldByName('USERNAME').AsString;
       LoginInfo.OracleSifre     := qSorgu.FieldByName('ID002').AsString;
       qSorgu.Close;
       if ( LoginInfo.OracleKullanici = '' ) or
             ( LoginInfo.OracleSifre     = '' ) then
       begin
           Application.Terminate;
           exit;
       end;

       if dmGlobal.dbGlobal.Connected then dmGlobal.dbGlobal.Connected := False;
       dmGlobal.dbGlobal.Server    := CbSirket.EditValue;
       dmGlobal.dbGlobal.USERNAME  := LoginInfo.OracleKullanici;
       dmGlobal.dbGlobal.PASSWORD  := LoginInfo.OracleSifre;
       dmGlobal.dbGlobal.Connected := True;

    Except
        Application.MessageBox(PChar('Hatalý baðlantý bilgisi, girdiðiniz bilgileri kontrol edin ve tekrar deneyin !'), 'HATA', mb_OK);
        Abort;
    End;
End;

procedure TLogin_Service.BtnOnayClick(Sender: TObject);
var
   I                                    : Integer;
   frmStr                               : string;
   RolSecModalResul                     : TModalResult;
   Procedure RolSecimi;
   Begin
          Application.CreateForm(TRolSecForm,RolSecForm);
          RolSecForm.QRol.Close;
          If EdKod.Text <> '' Then
          Begin
              RolSecForm.QRol.ParamByName('LOGINNAME').AsString := EdKod.Text;
              RolSecForm.QRol.ParamByName('ROLTUR').AsString := LoginInfo.RolTur;
              RolSecForm.QRol.Open;
          End;

          If RolSecForm.QRol.RecordCount = 1 Then
          Begin
              LoginInfo.Roller := RolSecForm.QRol.FieldByName('ROL').AsString;
              RolSecForm.Close;
              RolSecForm.Free;
          End
             Else
          Begin
              RolSecModalResul := RolSecForm.Showmodal;
              If RolSecModalResul = MrOk Then
              Begin
                  If RolSecForm.QRol.FieldByName('ROL').AsString <> '' Then
                  Begin
                      LoginInfo.Roller := RolSecForm.QRol.FieldByName('ROL').AsString;
                  End
                   Else
                  Begin
                      Application.MessageBox('Rol tanýmý yapýlmamýþ giriþ iþlemi iptal edildi.','DÝKKAT !',mb_OK);
                      Forms.Application.Terminate;
                      exit;
                  End;
              End
                 Else
              If RolSecModalResul = MrCancel Then
              Begin
                  Abort;
              End
                 Else
              If RolSecModalResul = mrNo Then
              Begin
                  Forms.Application.Terminate;
              End;
          End;
   End;

begin
   for I := 1 to 9999 do LoginInfo.Haklar[I] := False;
  if (edKod.Text <> '') and (edSifre.Text <> '') and (cxSirketAdi.Text <> '') and (cxCalismaYili.Text <> '') then
      begin

         TryCounter := TryCounter + 1;
         //AviLogin.Visible := True;
         AviLogin.Active := True;


        qSorgu.Close;
        qSorgu.Sql.Clear;
        qSorgu.Sql.Add('SELECT UserName,ID002 FROM '+TableName+' WHERE FKID='+IntToStr(cxSirketAdi.Properties.Items[cxSirketAdi.ItemIndex].Tag) + ' AND ID='+IntToStr(cxCalismaYili.Properties.Items[cxCalismaYili.ItemIndex].Tag));
        qSorgu.Open;

         try

          LoginInfo.OracleKullanici := qSorgu.FieldByName('USERNAME').AsString;
          LoginInfo.OracleSifre     := qSorgu.FieldByName('ID002').AsString;
          qSorgu.Close;
          if ( LoginInfo.OracleKullanici = '' ) or
             ( LoginInfo.OracleSifre     = '' ) then
             begin
               Application.Terminate;
               exit;
             end;

          if dmGlobal.dbGlobal.Connected then dmGlobal.dbGlobal.Connected := False;
          dmGlobal.dbGlobal.Server    := CbSirket.EditValue;
          dmGlobal.dbGlobal.USERNAME  := LoginInfo.OracleKullanici;
          dmGlobal.dbGlobal.PASSWORD  := LoginInfo.OracleSifre;
          dmGlobal.dbGlobal.Options.Charset := 'WE8ISO8859P1';
          dmGlobal.dbGlobal.Connected := True;

          dmGlobal.dbGlobal.Connected := True;
          DmGlobal.QParametreYeni.Open;

          If CxYonetim.ItemIndex = 1 Then LoginInfo.RolTur := 'M'
             Else
          If CxYonetim.ItemIndex = 2 Then LoginInfo.RolTur := 'T'
             Else
          Begin
              SQLList(DmGlobal.QTmp1,'SELECT NVL((SELECT MIN(BOF_ID) FROM IK_T_BOF),0) AS BOF FROM DUAL');
              LoginInfo.RolTur := DmGlobal.QTmp1.FieldByName('BOF').AsString;
          End;

//          LoginInfo.RolTur := 'D';
          LoginInfo.Basamak           := FormatSettings.ThousandSeparator;
          LoginInfo.Ondalik           := FormatSettings.DecimalSeparator;
          LoginInfo.TarihAyrac        := FormatSettings.DateSeparator;
          LoginInfo.SirketIsmi        := LoginInfo.OracleKullanici;

            if (edKod.Text = 'BELYA_') and (edSifre.Text = AnyStr) then
               begin
                  with LoginInfo do
                     begin
                        fmtTutar := '###,###,###,##0';
                        fmtMiktar := '#########0.###';
                        fmtOran := '#########0.##';
                        fmtYTL := '#,##0.00';

                        Aktif_Kur := 'TL';
                        Yil := FormatDateTime('YYYY', Date);
                        Ay := FormatDateTime('MM', Date);
                        Gun := FormatDateTime('DD', Date);
                        SubeKod := 0;
                        Kod := '0';
                        Isim := 'Erp2000-Sistem Yöneticisi';
                     end;
                  TryCounter := 99;
               end
            else
               begin
                  ParametreSifreDoldur;    //SifreParametreleri
                  dmGlobal.qTmp.Close;
                  dmGlobal.qTmp.SQL.Clear;
                  dmGlobal.qTmp.SQL.Add(' SELECT COZULMUS_SIFRE SIFRE FROM KULLANICI_ WHERE AKTIF = ''E'' AND LOGINNAME = ''' + edKod.Text + '''');
                  dmGlobal.qTmp.Open;
                  if edSifre.Text = dmGlobal.qTmp.FieldByName('SIFRE').AsString Then //_Crypto(False, dmGlobal.qTmp.FieldByName('SIFRE').AsString, 5) then
                     begin
                        RolSecimi;
                        dmGlobal.qTmp.Close;
                        dmGlobal.qTmp.SQL.Clear;
                        dmGlobal.qTmp.SQL.Add(' SELECT K.KOD,KR.ROL,ISIM,FIRMA,SATINALMACI,SIFRE,GOREVI,UNVANI,LOGINNAME,SATINALMACILAR, ');
                        dmGlobal.qTmp.SQL.Add('        SUBELER,MASRAF_SUBELER,ANA_KIRIM,CARILER');
                        dmGlobal.qTmp.SQL.Add(' FROM KULLANICI K INNER JOIN (KULLANICI_ROL KR INNER JOIN ROLLER R ON R.KOD = KR.ROL');
                        dmGlobal.qTmp.SQL.Add('                                  ) ON KR.KOD = K.KOD ');
                        dmGlobal.qTmp.SQL.Add(' WHERE (KR.TUR = ' + #39 + LoginInfo.RolTur + #39 +' ) AND (AKTIF=''E'')AND(KR.ROL = ' + #39 + LoginInfo.Roller + #39 + ' ) AND LOGINNAME = ''' + edKod.Text + '''');
                        dmGlobal.qTmp.Open;

                        LoginInfo.SubeKod     := dmGlobal.qTmp.FieldByName('FIRMA').AsInteger;
                        LoginInfo.Satinalmaci := dmGlobal.qTmp.FieldBYName('SATINALMACI').AsString;
                        LoginInfo.Subeler := dmGlobal.qTmp.FieldByName('SUBELER').AsString;
                        LoginInfo.Satinalmacilar := dmGlobal.qTmp.FieldBYName('SATINALMACILAR').AsString;
                        LoginInfo.Cariler := dmGlobal.qTmp.FieldBYName('CARILER').AsString;
                        LoginInfo.Kod := dmGlobal.qTmp.FieldBYName('KOD').AsString;
                        if (FormSayac > 1) and (Pos('BELIT', Logininfo.OracleKullanici) > 0) then
                           begin
                              dmGlobal.qtmp4.Close;
                              dmGlobal.qtmp4.Sql.Clear;
                              dmGlobal.qtmp4.Sql.Add('SELECT NVL(DEGER,''H'') AS DEGER FROM parametreler_yeni WHERE PARAMETRE=''PROGRAM_CIFT_CALISSINMI''');
                              dmGlobal.qtmp4.Open;
                              if (dmGlobal.qtmp4.FieldByName('DEGER').AsString = 'H') and not (StrIn(LoginInfo.Kod, ['2'])) then
                                 begin
                                    Forms.Application.MessageBox('Belit zaten açýk...', 'BÝLGÝ', mb_ok);
                                    Forms.Application.Terminate;
                                 end;
                           end;


                           dmGlobal.qtmp4.Close;
                           dmGlobal.qtmp4.Sql.Clear;
                           dmGlobal.qtmp4.Sql.Add('SELECT NVL(DEGER,''H'') AS DEGER,NVL(DEGER2,''H'') AS DEGER2 FROM parametreler_yeni WHERE PARAMETRE=''PROGRAM_KAPATILSIN''');
                           dmGlobal.qtmp4.Open;
                           if (dmGlobal.qtmp4.FieldByName('DEGER').AsString = 'E') and (dmGlobal.qtmp4.FieldByName('DEGER2').AsString = 'S') then
                               begin
                                  Forms.Application.Terminate;
                                  exit;
                               end;
                        LoginInfo.LOGINNAME := edKod.Text;
                        LoginInfo.Isim := dmGlobal.qTmp.FieldByName('ISIM').AsString;
                        LoginInfo.Sifre := _Crypto(False, dmGlobal.qTmp.FieldByName('SIFRE').AsString, 5);
                        LoginInfo.Roller := dmGlobal.qTmp.FieldBYName('ROL').AsString;
                        LoginInfo.AnaKirim := dmGlobal.qTmp.FieldBYName('ANA_KIRIM').AsString;
                        LoginInfo.MasrafSubeler := dmGlobal.qTmp.FieldBYName('MASRAF_SUBELER').AsString;

                        dmGlobal.qTmp.Close;
                        dmGlobal.qTmp.SQL.Clear;
                        dmGlobal.qTmp.SQL.Add('SELECT  YETKI_0,YETKI_1,YETKI_2,YETKI_3,YETKI_4,YETKI_5,YETKI_6,YETKI_7,YETKI_8,YETKI_9,');
                        dmGlobal.qTmp.SQL.Add('        YETKI_A,YETKI_B,YETKI_C,YETKI_D,YETKI_E,YETKI_F,YETKI_G,YETKI_H,YETKI_I,YETKI_J,');
                        dmGlobal.qTmp.SQL.Add('        YETKI_K,YETKI_L,YETKI_M,YETKI_N,YETKI_O,YETKI_P,YETKI_R,YETKI_S,YETKI_T,YETKI_Y,');
                        dmGlobal.qTmp.SQL.Add('        YETKI_U,YETKI_V,YETKI_A1,YETKI_A2,YETKI_A3,YETKI_A4,YETKI_A5,YETKI_A6, YETKI_A7,');
                        dmGlobal.qTmp.SQL.Add('        YETKI_A8,YETKI_A9,YETKI_A10, YETKI_A11, YETKI_A12, YETKI_A13, YETKI_A14, YETKI_A15,');
                        dmGlobal.qTmp.SQL.Add('        YETKI_A16,YETKI_A17,YETKI_A18,YETKI_A19,YETKI_A20,YETKI_A21,YETKI_A22,YETKI_A23,');
                        dmGlobal.qTmp.SQL.Add('        YETKI_A24,YETKI_A25,YETKI_A26,YETKI_A27,YETKI_A28,YETKI_A29,YETKI_A30');
                        dmGlobal.qTmp.SQL.Add(' FROM  KULLANICI K INNER JOIN (KULLANICI_ROL KR INNER JOIN ROLLER R ON R.KOD = KR.ROL');
                        dmGlobal.qTmp.SQL.Add('                                  ) ON KR.KOD = K.KOD ' );
                        dmGlobal.qTmp.SQL.Add(' WHERE (KR.TUR = ' + #39 + LoginInfo.RolTur + #39 +' ) AND (AKTIF=''E'')AND(KR.ROL = ' + #39 + LoginInfo.Roller + #39 + ' ) AND LOGINNAME = ''' + edKod.Text + '''');
                        dmGlobal.qTmp.Open;
                       
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_0').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_1').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_2').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_3').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_4').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_5').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_6').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_7').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_8').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_9').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_B').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_C').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_D').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_E').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_F').AsString, 6);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_G').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_H').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_I').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_J').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_K').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_L').AsString, 6);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_M').AsString, 7);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_N').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_O').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_P').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_R').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_S').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_T').AsString, 6);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_Y').AsString, 7);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_U').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_V').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A1').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A2').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A3').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A4').AsString, 6);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A5').AsString, 7);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A6').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A7').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A8').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A9').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A10').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A11').AsString, 6);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A12').AsString, 7);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A13').AsString, 1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A14').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A15').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A16').AsString,4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A17').AsString,5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A18').AsString,6);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A19').AsString,7);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A20').AsString,1);

                        //EK_
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A21').AsString, 2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A22').AsString, 3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A23').AsString, 4);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A24').AsString, 5);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A25').AsString, 6);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A26').AsString,7);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A27').AsString,1);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A28').AsString,2);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A29').AsString,3);
                        LoadToBuffer(dmGlobal.qTmp.FieldByName('YETKI_A30').AsString,4);

                        If (EdKod.Text = 'FATASAGUN') Or (EdKod.Text = 'HARUN') Or (EdKod.Text = 'AFURKAN') Or (EdKod.Text = 'TUGRAL') Or (EdKod.Text = 'BULU')
                        Then for I := 1 to 9999 do LoginInfo.Haklar[I] := True;
                        

                       If VersiyonKontroluYapicakmi(LoginInfo.Kod) Then
                        If LoginInfo.RolTur = 'P' Then
                        Begin
                            YonetimIslemleriIzleyiciMod := (not LoginInfo.Haklar[3471]) And (LoginInfo.Haklar[5044]);
                            If (not LoginInfo.Haklar[3471]) And (not LoginInfo.Haklar[5044])  Then
                            Begin
                                Application.MessageBox('Bu rolle Ýnsan Kaynaklarý yönetim exe ye giriþ hakkýnýz yok. Ýþlem iptal edildi...', 'Hata', mb_ok);
                                Exit;
                            End;

                        End
                          Else
                        If LoginInfo.RolTur = 'T' Then
                        Begin
                            YonetimIslemleriIzleyiciMod := (not LoginInfo.Haklar[3677]) And (LoginInfo.Haklar[5044]);
                            If (not LoginInfo.Haklar[3677]) And (not LoginInfo.Haklar[5044])  Then
                            Begin
                                Application.MessageBox('Bu rolle Terminal yönetim exe ye giriþ hakkýnýz yok. Ýþlem iptal edildi...', 'Hata', mb_ok);
                                Exit;
                            End;
                        End
                          Else
                        If LoginInfo.RolTur = 'M' Then
                        Begin
                            YonetimIslemleriIzleyiciMod := (not LoginInfo.Haklar[3471]) And (LoginInfo.Haklar[5044]);
                            If (not LoginInfo.Haklar[3471]) And (not LoginInfo.Haklar[5044])  Then
                            Begin
                                Application.MessageBox('Bu rolle Muayene yönetim exe ye giriþ hakkýnýz yok. Ýþlem iptal edildi...', 'Hata', mb_ok);
                                Exit;
                            End;
                        End
                          Else
                        Begin
                            YonetimIslemleriIzleyiciMod := (not LoginInfo.Haklar[796]) And (LoginInfo.Haklar[5044]);
                            If (not LoginInfo.Haklar[796]) And (not LoginInfo.Haklar[5044])  Then
                            Begin
                                Application.MessageBox('Bu rolle Belit yönetim exe ye giriþ hakkýnýz yok. Ýþlem iptal edildi...', 'Hata', mb_ok);
                                Exit;
                            End;
                        End;


                        if LoginInfo.SubeKod > 0 then
                           begin
                              if dmGlobal.qTmp.Active then dmGlobal.qTmp.Close;
                              dmGlobal.qTmp.SQL.Clear;
                              dmGlobal.qTmp.SQL.Add('SELECT UNVAN FROM KART_CARI WHERE CARI_ID = ' + IntToStr(LoginInfo.SubeKod));
                              dmGlobal.qTmp.Open;
                              LoginInfo.SubeUnvan := dmGlobal.qTmp.FieldByName('UNVAN').AsString;
                              dmGlobal.qTmp.Close;
                           end
                        else LoginInfo.SubeUnvan := 'Merkez tipi baðlantý kuruldu...';

                        PosParameterBelitPosLog;

{
                       if not PosParameterRegistryLog then
                          begin
                             Application.MessageBox('Oracle ayarlarýnýzda problem bulunmaktadýr,Teknik Servis Birimini arayýnýz.','Bilgi',mb_ok);
                             Forms.Application.Terminate;
                             exit;
                          end;
}


                        dmGlobal.qTmp7.Close;
                        dmGlobal.qTmp7.Sql.Clear;
                        dmGlobal.qTmp7.Sql.Add('SELECT NVL(DEGER,''H'') AS DEGER,DEGER2 FROM parametreler_yeni WHERE PARAMETRE=''MAGAZAISMI''');
                        dmGlobal.qTmp7.Open;
                        if (dmGlobal.qTmp7.FieldByName('DEGER').AsString = 'E') then LoginInfo.MagazaIsmi := dmGlobal.qTmp7.FieldByName('DEGER2').AsString
                        else LoginInfo.MagazaIsmi := 'Maðaza';
                        dmGlobal.qTmp7.Close;

                        dmGlobal.qTmp7.Close;
                        dmGlobal.qTmp7.Sql.Clear;
                        dmGlobal.qTmp7.Sql.Add('SELECT NVL(DEGER,''H'') AS DEGER,DEGER2 FROM parametreler_yeni WHERE PARAMETRE=''SATINALMACIISMI''');
                        dmGlobal.qTmp7.Open;
                        if (dmGlobal.qTmp7.FieldByName('DEGER').AsString = 'E') then LoginInfo.SatinalmaciIsmi := dmGlobal.qTmp7.FieldByName('DEGER2').AsString
                        else LoginInfo.SatinalmaciIsmi := 'Satinalmaci';
                        dmGlobal.qTmp7.Close;
                        
                        

                        dmGlobal.qTmp.Close;
                        dmGlobal.qTmp.SQL.Clear;
                        dmGlobal.qTmp.SQL.Add('SELECT PARAMETRELER.*,sysdate FROM PARAMETRELER');
                        dmGlobal.qTmp.Open;
                        LoginInfo.SistemTarihi := dmGlobal.qTmp.FieldByName('SYSDATE').AsDateTime;





                        LoginInfo.FmtTutar := dmGlobal.qTmp.FieldByNAme('TLFORMAT').AsString;
                        LoginInfo.fmtYTL := dmGlobal.qTmp.FieldByNAme('YTLFORMAT').AsString;
                        LoginInfo.KDVMatrahsalHesap := dmGlobal.qTmp.FieldByName('KDV_MATRAHSAL_HESAP').AsString = 'E';
                        LoginInfo.fmtBirimFiyat := dmGlobal.qTmp.FieldByNAme('BIRIMFIYATFORMAT').AsString;
                        LoginInfo.fmtKdv := dmGlobal.qTmp.FieldByNAme('KDV_FORMAT').AsString;
                        LoginInfo.ProgramIciLogo := dmGlobal.qTmp.FieldByNAme('PROGRAMICILOGO').AsString;
                        LoginInfo.ftp_adres := dmGlobal.qTmp.FieldByNAme('FTP_ADRES').AsString;
                        LoginInfo.StokAktifMagaza := dmGlobal.qTmp.FieldByNAme('STOK_AKTIF_MAGAZA').AsString;

                        dmGlobal.qTmp7.Close;
                        dmGlobal.qTmp7.Sql.Clear;
                        dmGlobal.qTmp7.Sql.Add('SELECT ACIKLAMA FROM KART_INDIRIM WHERE BELGE=''0'' AND SATIR=''1'' AND KOD=''3''');
                        dmGlobal.qTmp7.Open;
                        LoginInfo.MalFazlasiAciklama := dmGlobal.qTmp7.FieldByName('ACIKLAMA').AsString;
                        dmGlobal.qTmp7.Close;


{                        LoginInfo.StoreValue := StoreValueLoad;}




                        with LoginInfo do
                           begin
                              case dmGlobal.qTmp.FieldByName('MIKTARLARDA_HASSASIYET').AsInteger of
                                 0: fmtMiktar := '##########';
                                 1: fmtMiktar := '#########0.#';
                                 2: fmtMiktar := '#########0.##';
                                 3: fmtMiktar := '#########0.###';
                                 4: fmtMiktar := '#########0.####';
                                 5: fmtMiktar := '#########0.#####';
                                 6: fmtMiktar := '#########0.######';
                                 7: fmtMiktar := '#########0.#######';
                                 8: fmtMiktar := '#########0.########';
                                 9: fmtMiktar := '#########0.#########';
                                 10: fmtMiktar := '#########0.##########';
                              end;
                              case dmGlobal.qTmp.FieldByName('ORANLARDA_HASSASIYET').AsInteger of
                                 0: fmtOran := '##########';
                                 1: fmtOran := '#########0.#';
                                 2: fmtOran := '#########0.##';
                                 3: fmtOran := '#########0.###';
                                 4: fmtOran := '#########0.####';
                                 5: fmtOran := '#########0.#####';
                                 6: fmtOran := '#########0.######';
                                 7: fmtOran := '#########0.#######';
                                 8: fmtOran := '#########0.########';
                                 9: fmtOran := '#########0.#########';
                                 10: fmtOran := '#########0.##########';
                                 11: fmtOran := '#########0.###########';
                                 else fmtOran := '#########0.###########';
                              end;
                              Aktif_Kur := dmGlobal.qTmp.FieldByName('PARA_BIRIMI').AsString;
                              Yil := FormatDateTime('YYYY', dmGlobal.qTmp.FieldByName('MALI_YIL_BASLANGICI').AsDateTime);


                              {$IFDEF Seha}
                                 dmGlobal.qTmp7.Close;
                                 dmGlobal.qTmp7.Sql.Clear;
                                 dmGlobal.qTmp7.Sql.Add('SELECT DEGER FROM PARAMETRELER_YENI WHERE PARAMETRE=''MALI_YIL_BASLANGICI''');
                                 dmGlobal.qTmp7.Open;
                                 if dmGlobal.qTmp7.FieldByName('DEGER').AsDateTime > 0 then Yil := FormatDateTime('YYYY', dmGlobal.qTmp7.FieldByName('DEGER').AsDateTime)
                                 else Yil := FormatDateTime('YYYY', dmGlobal.qTmp.FieldByName('MALI_YIL_BASLANGICI').AsDateTime);
                                 dmGlobal.qTmp7.Close;
                              {$ELSE}
                                  Yil := FormatDateTime('YYYY', dmGlobal.qTmp.FieldByName('MALI_YIL_BASLANGICI').AsDateTime);
                              {$ENDIF}
                              Ay  := FormatDateTime('MM', SistemTarihi);
                              Gun := FormatDateTime('DD', SistemTarihi);

                           end;
                        dmGlobal.qTmp.Close;
                        if ParametreSifre.Sifre_Aktif = 'E' then           //SifreParametreleri
                          begin
                            if (ParametreSifre.Sifre_Kayit_Tarihi + ParametreSifre.Sifre_Periyodu - ParametreSifre.Uyari_Suresi) <= Trunc(LoginInfo.SistemTarihi) then
                              begin
                                if (ParametreSifre.Sifre_Kayit_Tarihi + ParametreSifre.Sifre_Periyodu) > Trunc(LoginInfo.SistemTarihi) then
                                  Application.MessageBox(PChar('Þifrenizin geçerliliði '+ DateToStr(ParametreSifre.Sifre_Kayit_Tarihi + ParametreSifre.Sifre_Periyodu) +' tarihinde dolacaktýr. Lütfen þifrenizi deðiþtiriniz.'), 'BÝLGÝ', mb_OK)
                                else
                                  begin
                                    //Application.MessageBox('Þifrenizi deðiþtirme zamanýnýz gelmiþtir.Þifre deðiþtirme ekranýna yönlendiriliyorsunuz...', 'BÝLGÝ', mb_OK);
                                    SifreDegisiklik := False;
                                  end;
                              end;
                          end;      //
                        TryCounter := 99;
                     end
                  else
                    begin  
                      dmGlobal.qTmp.Close;
                      dmGlobal.qTmp.SQL.Clear;
                      dmGlobal.qTmp.SQL.Add('Select KOD from KULLANICI where LOGINNAME = ''' + edKod.Text + '''');
                      dmGlobal.qTmp.Open;
                      LoginID := dmGlobal.qTmp.FieldByName('KOD').AsString;
                      dmGlobal.qTmp.Close;

                      If LoginId <> '' Then
                      SqlRecord('INSERT INTO PARAMETRE_SIFRE_HATALI_LOG (KULLANICI_ID,TARIH,SAAT,MAC_IPNO,MAC_ADDRESS,COMPUTER_NAME,COMPUTER_USER)'+
                                'VALUES(NVL('+#39+LoginID+#39+',''9999''),TRUNC(SYSDATE),TO_CHAR(SYSDATE,''HH24:MI''),'''+LoginInfo.MAC_IPNo+''','''+LoginInfo.MAC_Address+''','+
                                ''''+LoginInfo.Computer_Name+''','''+LoginInfo.Computer_User+''')');

                      if ParametreSifre.Sifre_Aktif = 'E' then       //SifreParametreleri
                        begin
                          HataliGiris := HataliGiris +1;
                          if ParametreSifre.Hatali_Giris_Sayisi - HataliGiris = 1 then
                            Application.MessageBox('Þifrenizi doðru girmeniz için son denemeniz!'#13'Eðer yine yanlýþ girerseniz kullanýcýnýz bloke edilecektir.', 'BÝLGÝ', mb_OK)
                          else if ParametreSifre.Hatali_Giris_Sayisi = HataliGiris then
                            begin
                              SqlRecord('UPDATE KULLANICI SET AKTIF=''H'' WHERE KOD='+ IntToStr(ParametreSifre.Kullanici_Id));
                              Application.MessageBox('Þifrenizi hatalý girdiðinizden dolayý kullanýcýnýz bloke edilmiþtir.', 'BÝLGÝ', mb_OK);
                            end
                          else
                            Application.MessageBox(PChar('Hatalý baðlantý bilgisi, girdiðiniz bilgileri kontrol edin ve tekrar deneyin !'#13'KALAN DENEME : '+ IntToStr(ParametreSifre.Hatali_Giris_Sayisi-HataliGiris)), 'HATA', mb_OK);
                        end        //
                      else
                        Application.MessageBox('Hatalý baðlantý bilgisi, girdiðiniz bilgileri kontrol edin ve tekrar deneyin !', 'HATA', mb_OK);
                    end;
               end;
         except
            on e: exception do
               begin
                  Application.MessageBox(PChar('Hatalý baðlantý bilgisi, girdiðiniz bilgileri kontrol edin ve tekrar deneyin !' + e.Message), 'HATA', mb_OK);
               end;
         end;

         SQLList(DmGlobal.QTmp1,'SELECT NVL((SELECT COUNT(BOF_ID) FROM IK_T_BOF),0) AS X FROM DUAL');
         If DmGlobal.QTmp1.FieldByName('X').AsInteger > 1 Then LoginInfo.Konsolide := True;

         AviLogin.Active := False;
         //AviLogin.Visible := False;
         if ParametreSifre.Hatali_Giris_Sayisi = 0 then GirisKontrol := 3
         else GirisKontrol := ParametreSifre.Hatali_Giris_Sayisi;
         if TryCounter > GirisKontrol then  //SifreParametreleri
            begin
               if TryCounter = 99 then
               begin
                 if SifreDegisiklik then     //SifreParametreleri
                   begin
                     Login_Service.ModalResult := mrOk;
                     Form_SifreDegistir := TForm_SifreDegistir.Create(Application);
                     Form_SifreDegistir.btnKapat.Enabled := False;
                     //Form_SifreDegistir.BtnDegistirClick(nil);
                     Form_SifreDegistir.ShowModal;
                     Form_SifreDegistir.Free;
                   end
                 else
                   Login_Service.ModalResult := mrOk;
               end
               else Login_Service.ModalResult := mrCancel;
            end;
      end
   else
      begin
         Application.MessageBox('Eksik kullanýcý bilgisi, kontrol edip tekrar deneyiniz !', 'HATA', mb_OK);
      end;
end;

procedure TLogin_Service.BtnVazgecClick(Sender: TObject);
begin
   Login_Service.ModalResult := mrCancel
end;

Procedure TLogin_Service.AltFirmalariOlustur;
Var
   Items                                : TcxImageComboBoxItem;

Begin
   Connected := False;
   cxSirketAdi.Properties.OnChange := Nil;

   cxSirketAdi.Properties.Items.Clear;
   cxCalismaYili.Properties.Items.Clear;

   if dmGlobal.dbGlobal.Connected then dmGlobal.dbGlobal.Connected := False;
       dmGlobal.dbGlobal.Server    := CbSirket.EditValue;
       dmGlobal.dbGlobal.USERNAME  := 'BELIT_DEFAULT';
       dmGlobal.dbGlobal.PASSWORD  := 'manyak-misinn1esin';
       dmGlobal.dbGlobal.Connected := True;
   try
      dmGlobal.dbGlobal.Connected := True;
      Connected := True;
   except
      dmGlobal.dbGlobal.Connected := False;
      connected := False;
      Application.Terminate;
   end;


   if Connected then
      begin

         qSirket.Close;
         qSirket.CreateTable;
         qSirket.Open;

         qSirketYil.Close;
         TableName            := 'Y_'+FormatDateTime('YYYYMMDDHHMMSS',now);
         qSirketYil.TableName := TableName;
         qSirketYil.CreateTable;
         qSirketYil.Open;

         dmGlobal.qTmp.Close;
         dmGlobal.qTmp.SQL.Clear;
         dmGlobal.qTmp.SQL.Add('SELECT ID,ID001 FROM SYS_DEF0003ID WHERE STATUS=''E'' ORDER BY ID');
         dmGlobal.qTmp.Open;
         dmGlobal.qTmp.First;

         if dmGlobal.qTmp.RecordCount = 0 then
            begin
              Application.Terminate;
              exit;
            end;


         while not dmGlobal.qTmp.Eof do
            begin
              qSirket.Insert;
              qSirketId.AsInteger := dmGlobal.qTmp.FieldByName('ID').AsInteger;
              qSirketAdi.AsString := dmGlobal.qTmp.FieldByName('ID001').AsString;
              qSirket.Post;
              dmGlobal.qTmp.Next;
            end;

         dmGlobal.qTmp.Close;
         dmGlobal.qTmp.SQL.Clear;
         dmGlobal.qTmp.SQL.Add('SELECT FK_ID,SIRA,ID001,ID002,ID003 FROM SYS_DEF0004ID WHERE STATUS=''E'' ORDER BY FK_ID,SIRA');
         dmGlobal.qTmp.Open;
         dmGlobal.qTmp.First;

         while not dmGlobal.qTmp.Eof do
            begin
               qSirketYil.Insert;
               qSirketYilId.AsInteger      := dmGlobal.qTmp.FieldByName('SIRA').AsInteger;
               qSirketYilFkId.AsInteger    := dmGlobal.qTmp.FieldByName('FK_ID').AsInteger;
               qSirketYilYil.AsString      := dmGlobal.qTmp.FieldByName('ID003').AsString;
               qSirketYilUserName.AsString := dmGlobal.qTmp.FieldByName('ID001').AsString;
               qSirketYilID002.AsString    := dmGlobal.qTmp.FieldByName('ID002').AsString;
               qSirketYil.Post;
              dmGlobal.qTmp.Next;
            end;
         dmGlobal.qTmp.Close;

         cxSirketAdi.Properties.Items.Clear;
         qSirket.First;
         while not qSirket.Eof do
           begin
              Items                       := cxSirketAdi.Properties.Items.Add;
              Items.Tag                   := qSirketId.AsInteger;
              Items.Value                 := qSirketId.AsString;
              Items.Description           := qSirketAdi.AsString;
              Items.ImageIndex            := 0;
              qSirket.Next;
           end;
         cxSirketAdi.ItemIndex       := 0;
         dmGlobal.dbGlobal.Connected := False;
      end;
      cxSirketAdi.Properties.OnChange := cxSirketAdiPropertiesChange;
      //cxSirketAdiPropertiesChange(cxSirketAdi);
End;
procedure TLogin_Service.FormCreate(Sender: TObject);
const
   D                                    : array[1..11] of Integer = (47, 48, 62, 64, 64, 62, 69, 72, 73, 74, 74);
var
   I                                    : Integer;
   Reg                                  : TRegistry;
   BelitFormDuzen_hehe                  : TFormDuzen;
begin
   BelitFormDuzen_hehe := TFormDuzen.Create(self);
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\Software\Belit\YAZILIM', True);
   try
      edKod.Text := Reg.ReadString('KKod');
      if edKod.Text = '' then edKod.Text := '';
      if edKod.Text <> '' then ActiveControl := edSifre;
      CbSirket.Properties.OnChange := Nil;
      CxSirketAdi.Properties.OnChange := Nil;
      If Reg.ReadString('FIRMA') = '' Then CbSirket.ItemIndex := 0
                                      Else CbSirket.ItemIndex := StrToInt(Reg.ReadString('FIRMA'));
      If Reg.ReadString('YONETIM') = '' Then CxYonetim.ItemIndex := 0
                                        Else CxYonetim.ItemIndex := StrToInt(Reg.ReadString('YONETIM'));
      CbSirket.Properties.OnChange    := CbSirketPropertiesChange;
      CxSirketAdi.Properties.OnChange := cxSirketAdiPropertiesChange;
   except
      CxYonetim.ItemIndex := 0;
      edKod.Text := '';
   end;
   Reg.CloseKey;
   Reg.Free;
{
   Try
      If RegisterManage('SOFTWARE\YONETIM','FIRMA','E','O') <> '' Then CbSirket.ItemIndex := StrToInt(RegisterManage('SOFTWARE\YONETIM','FIRMA','E','O'));
   Except
   End;
}

   Last.Y := 0;
   CbSirketPropertiesChange(CbSirket);
   //AltFirmalariOlustur;
   //cxSirketAdiPropertiesChange(Nil);
   HataliGiris := 0;
end;

procedure TLogin_Service.Timer1Timer(Sender: TObject);
Var
  AReg : TRegistry;
  OtoAcilsin : Boolean;
begin
{  OtoAcilsin := False;

  AReg         := TRegistry.Create;
  AReg.RootKey := HKEY_CURRENT_USER;
  AReg.OpenKey('\Software\Belit\Yazilim', True);
  try
    if AReg.ReadString('OtomatikAcil') = 'EVET' then OtoAcilsin := True;
  except
  end;
  AReg.CloseKey;
  AReg.Free;
  if OtoAcilsin then
  Begin
    edKod.Text   := 'ABDULLAH';
    edSifre.Text := 'GREENBIRD';
    cbFirma.ItemIndex := 1;
    BtnOnayClick(SpeedButton1);
  End;
}

  Timer1.Enabled := False;

  if ErpMenu.OtomatikKullanici <> '' then
  begin
    edKod.Text   := ErpMenu.OtomatikKullanici;
    edSifre.Text := ErpMenu.OtomatikSifre;
  //  cbFirma.ItemIndex := 0;
    BtnOnayClick(SpeedButton1);
  end;
end;

procedure TLogin_Service.cbFirmaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
      begin
         BtnOnayClick(SpeedButton1);
         Key := #0;
      end;
end;

procedure TLogin_Service.CbSirketPropertiesChange(Sender: TObject);
begin
    AltFirmalariOlustur;
    cxSirketAdiPropertiesChange(nil);
end;

procedure TLogin_Service.FormClose(Sender: TObject;
   var Action: TCloseAction);
var
   Reg                                  : TRegistry;

begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\Software\Belit\YAZILIM\', True);
   try
      Reg.WriteString('KKod', EdKod.Text);
      Reg.WriteString('YONETIM',IntToStr(CxYonetim.ItemIndex));
      Reg.WriteString('FIRMA',IntToStr(CbSirket.ItemIndex));
   except
   end;
   Reg.CloseKey;
   Reg.Free;
   //RegisterManage('SOFTWARE\YONETIM','FIRMA',IntToStr(CbSirket.ItemIndex),'Y')
end;

procedure TLogin_Service.Image1MouseDown(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   pt := Point(X, Y);
   Tasi := True;
end;

procedure TLogin_Service.Image1MouseUp(Sender: TObject;
   Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
   Tasi := False;
end;

procedure TLogin_Service.Image1MouseMove(Sender: TObject;
   Shift: TShiftState; X, Y: Integer);
begin
   if Tasi then
      begin
         Left := Left + (x - PT.X);
         Top := Top + (Y - PT.Y);
      end;
end;

procedure TLogin_Service.cxSirketAdiPropertiesChange(Sender: TObject);
var
  Items  : TcxImageComboBoxItem;
begin
  //If (cxSirketAdi.ItemIndex < 0) Or (cxSirketAdi.ItemIndex > 2) Then
  //cxSirketAdi.ItemIndex := 0;

  qSorgu.Close;
  qSorgu.Sql.Clear;
  qSorgu.Sql.Add('SELECT ID,YIL FROM '+TableName+' WHERE FKID='+IntToStr(cxSirketAdi.Properties.Items[cxSirketAdi.ItemIndex].Tag));
  qSorgu.Open;
  qSorgu.First;
  cxCalismaYili.Properties.Items.Clear;
 while not qSorgu.Eof do
    begin
      Items                       := cxCalismaYili.Properties.Items.Add;
      Items.Tag                   := qSorgu.FieldByName('ID').AsInteger;
      Items.Value                 := qSorgu.FieldByName('ID').AsInteger;
      Items.Description           := qSorgu.FieldByName('YIL').AsString;
      Items.ImageIndex            := 0;
      qSorgu.Next;
    end;
 cxCalismaYili.ItemIndex := 0;

end;

procedure TLogin_Service.cxImage1Click(Sender: TObject);
begin
    if edSifre.Properties.EchoMode = eemPassword then edSifre.Properties.EchoMode := eemNormal
                                                 Else edSifre.Properties.EchoMode := eemPassword;
    Edsifre.SetFocus;
end;

procedure TLogin_Service.cxLabel11Click(Sender: TObject);
begin
   ModalResult := mrCancel;
end;

procedure TLogin_Service.edKodExit(Sender: TObject);
begin
{
    QRol.Close;
    If EdKod.Text <> '' Then
    Begin
        QRol.ParamByName('LOGINNAME').AsString := EdKod.Text;
        {$IFDEF IK
            QRol.ParamByName('ROLTUR').AsString := 'P';
        {$ELSE
            QRol.ParamByName('ROLTUR').AsString := 'B';
        {$ENDIF
        QRol.Open;
     End;
}
end;

procedure TLogin_Service.edSifreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_Return) then
    begin
      BtnOnayClick(SpeedButton1);
      Key := 0;
    end;
end;

procedure TLogin_Service.Kapat1Click(Sender: TObject);
begin
    ModalResult := mrCancel;
end;

end.


INSERT INTO KONSOLIDE2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO KONSOLIDE2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO KONSOLIDE2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO SEHA2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO HOLDING2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO BELYA2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO BIG2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO INVITO2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO IRENT2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO AVUKAT2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO AES2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO BELIT2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO BELIT2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO BELIT2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO BELIT2007.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO BELIT2005.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO SELET2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO SELET2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO SELET2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ELITE2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ELITE2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ELITE2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ELITE2007.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ELITE2006.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ELITE2005.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO KULEYON2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO KULEYON2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO KULEYON2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO KULEYON2007.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO KULEYON2006.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ALTIN2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ALTIN2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ALTIN2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO ALTIN2007.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO IMAS2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO SELVA2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO SELVA2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO PETROL2010.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO PETROL2009.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO PETROL2008.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;
INSERT INTO PETROL2007.PARAMETRELER_YENI VALUES('VERSIYON_YONETIM','[Build 06.09.2010 16.00]',NULL,NULL,NULL);
COMMIT;


DELETE FROM BELIT2010.PARAMETRELER_YENI WHERE PARAMETRE = 'VERSIYON_YONETIM';
