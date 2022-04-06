program Yonetim;

uses
  Forms,
  ErpMenu in 'ErpMenu.pas' {Yonetim_Menu},
  Kullanici in 'Kullanici.pas' {Erp2000_Kullanicilar},
  dModule in 'dModule.pas' {dmGlobal: TDataModule},
  BlyLib in 'BlyLib.pas',
  Musavir in 'Musavir.pas' {MusavirBilgileri_Form},
  KdvIndex in 'KdvIndex.pas' {KdvIndexleri_Form},
  Firma in 'Firma.pas' {Erp2000_FirmaBilgileri},
  TMuhasebe in 'TMuhasebe.pas' {Kart_Muhasebe},
  Stok in 'Stok.pas' {Erp2000_StokParametreleri},
  Login in 'Login.pas' {Login_Service},
  RaporKullanici in 'RaporKullanici.pas' {Rapor_MagazalarSatis},
  MagazaSecimi in 'DonemKontrol\MagazaSecimi.pas' {MagazaSecForm},
  Rol_Genel in 'Rol_Genel.pas' {Erp2000_Roller_Genel},
  TSifreParametre in 'TSifreParametre.pas' {SifreParametre_Form},
  RolSec in 'RolSec.pas' {RolSecForm},
  YetkiTanim in 'YetkiTanim.pas' {YetkiTanimForm},
  RolRapor in 'RolRapor.pas' {RolRaporForm},
  SifreDegistir in 'SifreDegistir.pas' {Form_SifreDegistir},
  VersiyonYukle in 'VersiyonYukle.pas' {frmVersiyon},
  FormDuzen in 'FormDuzen.pas';

{$R *.RES}

begin
  ErpMenu.OtomatikKullanici := '';
  ErpMenu.OtomatikSifre     := '';    

  if ParamCount > 0 then
  begin
    if ParamStr (2) <> '' then
       ErpMenu.OtomatikKullanici := ParamStr(2);
    if ParamStr (3) <> '' then
       ErpMenu.OtomatikSifre := ParamStr(3);
  end;


  Application.Initialize;
  Application.Title := 'Belit Yönetim';
  Application.CreateForm(TdmGlobal, dmGlobal);
  Application.CreateForm(TYonetim_Menu, Yonetim_Menu);
  Application.CreateForm(TForm_SifreDegistir, Form_SifreDegistir);
  Application.Run;
end.
