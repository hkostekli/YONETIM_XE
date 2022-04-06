unit Firma;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, DBAccess, Ora, OraSmart, MemDS, OraError, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  DBCtrls, Mask, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  cxTextEdit, cxDBEdit, cxLabel, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxRadioGroup, cxCheckBox, cxGraphics, cxLookAndFeels;

type
  TFirmaBilgileri_Form = class(TForm)
    PopupMenu1: TPopupMenu;
    pmDegistir: TMenuItem;
    N1: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N2: TMenuItem;
    pmKapat: TMenuItem;
    dFirma: TDataSource;
    StatusBar1: TStatusBar;
    TmDurum: TTimer;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    lblSicilNo: TcxLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxLabel15: TcxLabel;
    cxDBTextEdit15: TcxDBTextEdit;
    cxLabel16: TcxLabel;
    cxDBTextEdit16: TcxDBTextEdit;
    cxLabel17: TcxLabel;
    cxDBTextEdit17: TcxDBTextEdit;
    cxLabel18: TcxLabel;
    cxDBTextEdit18: TcxDBTextEdit;
    cxLabel19: TcxLabel;
    cxDBTextEdit19: TcxDBTextEdit;
    cxLabel20: TcxLabel;
    cxDBTextEdit20: TcxDBTextEdit;
    cxLabel21: TcxLabel;
    cxLabel22: TcxLabel;
    cxLabel23: TcxLabel;
    cxLabel24: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    rgbGecerliGun: TcxDBRadioGroup;
    cxGroupBox3: TcxGroupBox;
    chPazar: TcxDBCheckBox;
    chPazartesi: TcxDBCheckBox;
    chSali: TcxDBCheckBox;
    chCarsamba: TcxDBCheckBox;
    chPersembe: TcxDBCheckBox;
    chCuma: TcxDBCheckBox;
    chCumartesi: TcxDBCheckBox;
    TFIRMA: TOraQuery;
    TFIRMAPK: TStringField;
    TFIRMAMALI_YIL_BASLANGICI: TDateTimeField;
    TFIRMAFIRMA_UNVAN: TStringField;
    TFIRMAFIRMA_CADDE: TStringField;
    TFIRMAFIRMA_SOKAK: TStringField;
    TFIRMAFIRMA_KAPINO: TStringField;
    TFIRMAFIRMA_ILCE: TStringField;
    TFIRMAFIRMA_SEHIR: TStringField;
    TFIRMAFIRMA_ULKE: TStringField;
    TFIRMAFIRMA_POSTAKOD: TStringField;
    TFIRMAFIRMA_TEL1: TStringField;
    TFIRMAFIRMA_TEL2: TStringField;
    TFIRMAFIRMA_FAX: TStringField;
    TFIRMAFIRMA_VERGIDAIRE: TStringField;
    TFIRMAFIRMA_VERGINO: TStringField;
    TFIRMAFIRMA_SSKNO: TStringField;
    TFIRMAMUSAVIR_UNVAN: TStringField;
    TFIRMAMUSAVIR_CADDE: TStringField;
    TFIRMAMUSAVIR_SOKAK: TStringField;
    TFIRMAMUSAVIR_KAPINO: TStringField;
    TFIRMAMUSAVIR_ILCE: TStringField;
    TFIRMAMUSAVIR_SEHIR: TStringField;
    TFIRMAMUSAVIR_ULKE: TStringField;
    TFIRMAMUSAVIR_POSTAKOD: TStringField;
    TFIRMAMUSAVIR_TEL1: TStringField;
    TFIRMAMUSAVIR_TEL2: TStringField;
    TFIRMAMUSAVIR_FAX: TStringField;
    TFIRMAMUSAVIR_VERGIDAIRE: TStringField;
    TFIRMAMUSAVIR_VERGINO: TStringField;
    TFIRMAMUSAVIR_ODASICILNO: TStringField;
    TFIRMAPARA_BIRIMI: TStringField;
    TFIRMAORANLARDA_HASSASIYET: TIntegerField;
    TFIRMAMIKTARLARDA_HASSASIYET: TIntegerField;
    TFIRMATUTARLARDA_HASSASIYET: TIntegerField;
    TFIRMASATIS_ISKONTO_UYGULA: TStringField;
    TFIRMAALIS_ISKONTO_UYGULA: TStringField;
    TFIRMAMERKEZI_CALISMA: TStringField;
    TFIRMALIMIT_KONTROLU: TStringField;
    TFIRMAGECERLI_KUR_GUNU: TIntegerField;
    TFIRMAGUN1: TStringField;
    TFIRMAGUN2: TStringField;
    TFIRMAGUN3: TStringField;
    TFIRMAGUN4: TStringField;
    TFIRMAGUN5: TStringField;
    TFIRMAGUN6: TStringField;
    TFIRMAGUN7: TStringField;
    TFIRMAASGARI_STOK_KONTROLU: TStringField;
    TFIRMAAZAMI_STOK_KONTROLU: TStringField;
    TFIRMASATIS_NEGATIF_KONTROLU: TStringField;
    TFIRMASEVK_NEGATIF_KONTROLU: TStringField;
    TFIRMAMUSTAHSIL_FON_ORANI: TFloatField;
    TFIRMAMUSTAHSIL_BORSA_ORANI: TFloatField;
    TFIRMAMUSTAHSIL_BAGKUR_ORANI: TFloatField;
    TFIRMAMUSTAHSIL_KOMISYON_ORANI: TFloatField;
    TFIRMAMUSTAHSIL_KOMISYON_KDV: TFloatField;
    TFIRMAMUSTAHSIL_STOPAJ_ORANI: TFloatField;
    TFIRMASENET_PUL_ORANI: TFloatField;
    TFIRMATATIL_KUR: TStringField;
    TFIRMAOTOMATIK_MUHASEBELESME: TStringField;
    TFIRMAIMB_STOK_MK_YANSIT: TStringField;
    TFIRMADETAYLI_MUHASEBE: TStringField;
    TFIRMAALIM_MUH_KDV: TStringField;
    TFIRMAALIM_MAS_KDV: TStringField;
    TFIRMAALIM_IADE_MUH_KDV: TStringField;
    TFIRMAALIM_IADE_MAS_KDV: TStringField;
    TFIRMASATIS_MUH_KDV: TStringField;
    TFIRMASATIS_MAS_KDV: TStringField;
    TFIRMASATIS_IADE_MUH_KDV: TStringField;
    TFIRMASATIS_IADE_MAS_KDV: TStringField;
    TFIRMAFINANS_KDV: TFloatField;
    TFIRMATOPTAN_SATIS_AKDV_UYGULA: TStringField;
    TFIRMASTOK_FIS_KDV_DURUMU: TStringField;
    TFIRMASATIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    TFIRMASATIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    TFIRMAALIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    TFIRMAALIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    TFIRMAMUSTAHSIL_FON_MUH: TStringField;
    TFIRMAMUSTAHSIL_BORSA_MUH: TStringField;
    TFIRMAMUSTAHSIL_BAGKUR_MUH: TStringField;
    TFIRMAMUSTAHSIL_KOMISYON_MUH: TStringField;
    TFIRMAMUSTAHSIL_KOMISYON_KDV_MUH: TStringField;
    TFIRMAMUSTAHSIL_STOPAJ_MUH: TStringField;
    TFIRMAPOS_INDIRIM_KARTI: TStringField;
    TFIRMAPOS_MASRAF_KARTI: TStringField;
    TFIRMAIMPORT_DIZINI: TStringField;
    TFIRMAEXPORT_DIZINI: TStringField;
    TFIRMATERAZI_DIZINI: TStringField;
    TFIRMACARISATIS_DIZINI: TStringField;
    TFIRMATERAZI_FIYAT_BOLME: TIntegerField;
    TFIRMAOTOMATIK_ODEME_PLAN: TStringField;
    TFIRMAVER_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    TFIRMAVER_HIZ_MASRAF_MUH_DURUMU: TStringField;
    TFIRMAAL_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    TFIRMAAL_HIZ_MASRAF_MUH_DURUMU: TStringField;
    TFIRMAHATA_KONTROLU_YAP: TStringField;
    TFIRMASDY: TIntegerField;
    TFIRMASDT: TDateTimeField;
    TFIRMAVERSIYON: TStringField;
    TFIRMASEVK_FIS_KDV_DURUMU: TStringField;
    TFIRMATLFORMAT: TStringField;
    TFIRMAYTLFORMAT: TStringField;
    TFIRMAKDV_MATRAHSAL_HESAP: TStringField;
    TFIRMAGUNDUZ_AKTARIM_SUBE: TStringField;
    TFIRMABIRIMFIYATFORMAT: TStringField;
    TFIRMAPROGRAMICILOGO: TStringField;
    TFIRMAYARDIMPATH: TStringField;
    TFIRMAODEME_PLANI_NAKIT_KASA: TStringField;
    TFIRMAODEME_PLANI_EURO_KASA: TStringField;
    TFIRMAODEME_PLANI_DOLAR_KASA: TStringField;
    TFIRMATERMINAL_VERSIYON: TStringField;
    TFIRMABONUS_IADE_INDIRIM_KODU: TStringField;
    TFIRMAMASRAF_IADE_INDIRIM: TStringField;
    TFIRMAAKTARIM_VERSIYON: TStringField;
    TFIRMAFTP_ADRES: TStringField;
    TFIRMAODEMEPLAN_ODEME_TIPLERI_AKTIF: TStringField;
    TFIRMACARI_KARTLAR_TURKCE_KARAKTER: TStringField;
    TFIRMAODEMEPLAN_GUNTIPI: TStringField;
    TFIRMASATIS_ODEME_PLANI_ZORUNLUMU: TStringField;
    TFIRMAIRS_ODEME_PLAN_EXCELDENAKTAR: TStringField;
    TFIRMAODEME_PLN_TARIH_DEGISTIREBILIR: TStringField;
    TFIRMACARI_EKSTRE_DEFAULT_KUR: TStringField;
    TFIRMAODEMEPLAN_KONSINYEDURUMU: TStringField;
    TFIRMAKONSINYE_TARIHI: TDateTimeField;
    TFIRMAKONSINYE_YOK_GECILMEZ_TARIH: TDateTimeField;
    TFIRMAALIMIRS_TARIH_KB_TARIH_AYNIMI: TStringField;
    TFIRMASEHA_NAKIT_THSLAT_UYARI_LIMIT: TFloatField;
    TFIRMASUBE_CAPTION: TStringField;
    TFIRMAKONSINYE_ALINAN_HIZMET_KODU: TStringField;
    TFIRMAKONSINYE_VERILEN_HIZMET_KODU: TStringField;
    TFIRMAHIZMET_BELGE_NO_ZORUNLU: TStringField;
    TFIRMAMALALIM_BELGE_NO_ZORUNLU: TStringField;
    TFIRMAMALALIM_IADE_BELGE_NO_ZORUNLU: TStringField;
    TFIRMATOPTANSTS_IADE_BELGENO_ZORUNLU: TStringField;
    TFIRMAMAL_ALIM_STOK_EKLEME_VARMI: TStringField;
    TFIRMASIPARIS_FIYAT_GUNCELLEME: TStringField;
    TFIRMAPERAKENDE_EKLEME_VARMI: TStringField;
    TFIRMAKDV_FORMAT: TStringField;
    TFIRMATERAZI_ETIKET_BILGILERI: TStringField;
    TFIRMAIBM_KATSAYI_BILGILERI: TStringField;
    TFIRMAIDLE_KONTROL: TStringField;
    TFIRMALOGO_USERID: TStringField;
    TFIRMALOGO_USERPWD: TStringField;
    TFIRMALOGO_SERVERIP: TStringField;
    TFIRMALOGO_DBNAME: TStringField;
    TFIRMASEHA_TAHSILAT_KULLANICILAR: TStringField;
    TFIRMAHAKEDISTEMINATTARIHI: TDateTimeField;
    TFIRMAUPDATE_EXE_VERSIYON: TStringField;
    TFIRMAHIZMETTE_HAKEDIS: TStringField;
    TFIRMASTOK_AKTIF_MAGAZA: TIntegerField;
    procedure pmDegistirClick(Sender: TObject);
    procedure pmSilClick(Sender: TObject);
    procedure pmKaydetClick(Sender: TObject);
    procedure pmVazgecClick(Sender: TObject);
    procedure pmKapatClick(Sender: TObject);
    procedure TmDurumTimer(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure TFIRMAAfterEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  FirmaBilgileri_Form: TFirmaBilgileri_Form;

implementation

Uses BlyLib, dModule, ErpMenu;

{$R *.DFM}

procedure TFirmaBilgileri_Form.TmDurumTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := LoginInfo.Isim;
  StatusBar1.Panels[1].Text := FormatDateTime('dd mmmm yyyy hh:mm:ss', Date + Time);
  if tFirma.State = dsBrowse Then
     Begin
       StatusBar1.Panels[3].Text := tFirmaSDY.Text;
       StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tFirmaSDT.Value);
     End
   Else
     Begin
       StatusBar1.Panels[3].Text := '...';
       StatusBar1.Panels[4].Text := '...';
     End;
end;

procedure TFirmaBilgileri_Form.pmDegistirClick(Sender: TObject);
begin
  tFirma.Edit;
end;

procedure TFirmaBilgileri_Form.pmSilClick(Sender: TObject);
begin
  tFirma.Delete;
end;

procedure TFirmaBilgileri_Form.pmKaydetClick(Sender: TObject);
begin
  tFirma.Post;
end;

procedure TFirmaBilgileri_Form.pmVazgecClick(Sender: TObject);
begin
  tFirma.Cancel;
end;

procedure TFirmaBilgileri_Form.pmKapatClick(Sender: TObject);
begin
  FirmaBilgileri_Form.Close;
end;

procedure TFirmaBilgileri_Form.PopupMenu1Popup(Sender: TObject);
begin
  pmDegistir.Enabled := tFirma.State = dsBrowse;
  pmKaydet.Enabled   := tFirma.State In [dsInsert, dsEdit];
  pmVazgec.Enabled   := tFirma.State In [dsInsert, dsEdit];
  pmKapat.Enabled    := Not(tFirma.State In [dsInsert, dsEdit]);
end;

procedure TFirmaBilgileri_Form.TFIRMAAfterEdit(DataSet: TDataSet);
begin
  tFirmaSDY.Text                          := LoginInfo.Kod;
  tFirmaSDT.Value                         := LoginInfo.SistemTarihi;
end;

procedure TFirmaBilgileri_Form.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if tFirma.State In [dsInsert, dsEdit] Then
     begin
       if messagedlg('Girilen firma bilgileri kaydedilmemiþ, kaydetmek istermisiniz ?', mtconfirmation, [mbyes, mbno], 0) = mryes then tFirma.Post
                                                                                                                                  else tFirma.Cancel;
     end;
  Action := caFree;
end;

procedure TFirmaBilgileri_Form.FormCreate(Sender: TObject);
begin
  tFirma.Open;
  pmDegistir.Enabled := LoginInfo.Haklar[2];
end;

procedure TFirmaBilgileri_Form.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
    tFirma.Close;
end;

procedure TFirmaBilgileri_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
    Exit;
  end;
end;

end.




