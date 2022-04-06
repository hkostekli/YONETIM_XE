unit Musavir;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, DBAccess, Ora, OraSmart, MemDS, OraError, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  DBCtrls, Mask, cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  cxTextEdit, cxDBEdit, cxLabel, cxControls, cxContainer, cxEdit, cxGroupBox,
  cxGraphics, cxLookAndFeels;

type
  TMusavirBilgileri_Form = class(TForm)
    PopupMenu1: TPopupMenu;
    pmDegistir: TMenuItem;
    N1: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N2: TMenuItem;
    pmKapat: TMenuItem;
    dMusavir: TDataSource;
    StatusBar1: TStatusBar;
    TmDurum: TTimer;
    cxGroupBox1: TcxGroupBox;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
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
    cxLabel12: TcxLabel;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    cxDBTextEdit13: TcxDBTextEdit;
    cxDBTextEdit14: TcxDBTextEdit;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    tMusavir: TOraQuery;
    tMusavirPK: TStringField;
    tMusavirMALI_YIL_BASLANGICI: TDateTimeField;
    tMusavirFIRMA_UNVAN: TStringField;
    tMusavirFIRMA_CADDE: TStringField;
    tMusavirFIRMA_SOKAK: TStringField;
    tMusavirFIRMA_KAPINO: TStringField;
    tMusavirFIRMA_ILCE: TStringField;
    tMusavirFIRMA_SEHIR: TStringField;
    tMusavirFIRMA_ULKE: TStringField;
    tMusavirFIRMA_POSTAKOD: TStringField;
    tMusavirFIRMA_TEL1: TStringField;
    tMusavirFIRMA_TEL2: TStringField;
    tMusavirFIRMA_FAX: TStringField;
    tMusavirFIRMA_VERGIDAIRE: TStringField;
    tMusavirFIRMA_VERGINO: TStringField;
    tMusavirFIRMA_SSKNO: TStringField;
    tMusavirMUSAVIR_UNVAN: TStringField;
    tMusavirMUSAVIR_CADDE: TStringField;
    tMusavirMUSAVIR_SOKAK: TStringField;
    tMusavirMUSAVIR_KAPINO: TStringField;
    tMusavirMUSAVIR_ILCE: TStringField;
    tMusavirMUSAVIR_SEHIR: TStringField;
    tMusavirMUSAVIR_ULKE: TStringField;
    tMusavirMUSAVIR_POSTAKOD: TStringField;
    tMusavirMUSAVIR_TEL1: TStringField;
    tMusavirMUSAVIR_TEL2: TStringField;
    tMusavirMUSAVIR_FAX: TStringField;
    tMusavirMUSAVIR_VERGIDAIRE: TStringField;
    tMusavirMUSAVIR_VERGINO: TStringField;
    tMusavirMUSAVIR_ODASICILNO: TStringField;
    tMusavirPARA_BIRIMI: TStringField;
    tMusavirORANLARDA_HASSASIYET: TIntegerField;
    tMusavirMIKTARLARDA_HASSASIYET: TIntegerField;
    tMusavirTUTARLARDA_HASSASIYET: TIntegerField;
    tMusavirSATIS_ISKONTO_UYGULA: TStringField;
    tMusavirALIS_ISKONTO_UYGULA: TStringField;
    tMusavirMERKEZI_CALISMA: TStringField;
    tMusavirLIMIT_KONTROLU: TStringField;
    tMusavirGECERLI_KUR_GUNU: TIntegerField;
    tMusavirGUN1: TStringField;
    tMusavirGUN2: TStringField;
    tMusavirGUN3: TStringField;
    tMusavirGUN4: TStringField;
    tMusavirGUN5: TStringField;
    tMusavirGUN6: TStringField;
    tMusavirGUN7: TStringField;
    tMusavirASGARI_STOK_KONTROLU: TStringField;
    tMusavirAZAMI_STOK_KONTROLU: TStringField;
    tMusavirSATIS_NEGATIF_KONTROLU: TStringField;
    tMusavirSEVK_NEGATIF_KONTROLU: TStringField;
    tMusavirMUSTAHSIL_FON_ORANI: TFloatField;
    tMusavirMUSTAHSIL_BORSA_ORANI: TFloatField;
    tMusavirMUSTAHSIL_BAGKUR_ORANI: TFloatField;
    tMusavirMUSTAHSIL_KOMISYON_ORANI: TFloatField;
    tMusavirMUSTAHSIL_KOMISYON_KDV: TFloatField;
    tMusavirMUSTAHSIL_STOPAJ_ORANI: TFloatField;
    tMusavirSENET_PUL_ORANI: TFloatField;
    tMusavirTATIL_KUR: TStringField;
    tMusavirOTOMATIK_MUHASEBELESME: TStringField;
    tMusavirIMB_STOK_MK_YANSIT: TStringField;
    tMusavirDETAYLI_MUHASEBE: TStringField;
    tMusavirALIM_MUH_KDV: TStringField;
    tMusavirALIM_MAS_KDV: TStringField;
    tMusavirALIM_IADE_MUH_KDV: TStringField;
    tMusavirALIM_IADE_MAS_KDV: TStringField;
    tMusavirSATIS_MUH_KDV: TStringField;
    tMusavirSATIS_MAS_KDV: TStringField;
    tMusavirSATIS_IADE_MUH_KDV: TStringField;
    tMusavirSATIS_IADE_MAS_KDV: TStringField;
    tMusavirFINANS_KDV: TFloatField;
    tMusavirTOPTAN_SATIS_AKDV_UYGULA: TStringField;
    tMusavirSTOK_FIS_KDV_DURUMU: TStringField;
    tMusavirSATIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    tMusavirSATIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    tMusavirALIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    tMusavirALIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    tMusavirMUSTAHSIL_FON_MUH: TStringField;
    tMusavirMUSTAHSIL_BORSA_MUH: TStringField;
    tMusavirMUSTAHSIL_BAGKUR_MUH: TStringField;
    tMusavirMUSTAHSIL_KOMISYON_MUH: TStringField;
    tMusavirMUSTAHSIL_KOMISYON_KDV_MUH: TStringField;
    tMusavirMUSTAHSIL_STOPAJ_MUH: TStringField;
    tMusavirPOS_INDIRIM_KARTI: TStringField;
    tMusavirPOS_MASRAF_KARTI: TStringField;
    tMusavirIMPORT_DIZINI: TStringField;
    tMusavirEXPORT_DIZINI: TStringField;
    tMusavirTERAZI_DIZINI: TStringField;
    tMusavirCARISATIS_DIZINI: TStringField;
    tMusavirTERAZI_FIYAT_BOLME: TIntegerField;
    tMusavirOTOMATIK_ODEME_PLAN: TStringField;
    tMusavirVER_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    tMusavirVER_HIZ_MASRAF_MUH_DURUMU: TStringField;
    tMusavirAL_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    tMusavirAL_HIZ_MASRAF_MUH_DURUMU: TStringField;
    tMusavirHATA_KONTROLU_YAP: TStringField;
    tMusavirSDY: TIntegerField;
    tMusavirSDT: TDateTimeField;
    tMusavirVERSIYON: TStringField;
    tMusavirSEVK_FIS_KDV_DURUMU: TStringField;
    tMusavirTLFORMAT: TStringField;
    tMusavirYTLFORMAT: TStringField;
    tMusavirKDV_MATRAHSAL_HESAP: TStringField;
    tMusavirGUNDUZ_AKTARIM_SUBE: TStringField;
    tMusavirBIRIMFIYATFORMAT: TStringField;
    tMusavirPROGRAMICILOGO: TStringField;
    tMusavirYARDIMPATH: TStringField;
    tMusavirODEME_PLANI_NAKIT_KASA: TStringField;
    tMusavirODEME_PLANI_EURO_KASA: TStringField;
    tMusavirODEME_PLANI_DOLAR_KASA: TStringField;
    tMusavirTERMINAL_VERSIYON: TStringField;
    tMusavirBONUS_IADE_INDIRIM_KODU: TStringField;
    tMusavirMASRAF_IADE_INDIRIM: TStringField;
    tMusavirAKTARIM_VERSIYON: TStringField;
    tMusavirFTP_ADRES: TStringField;
    tMusavirODEMEPLAN_ODEME_TIPLERI_AKTIF: TStringField;
    tMusavirCARI_KARTLAR_TURKCE_KARAKTER: TStringField;
    tMusavirODEMEPLAN_GUNTIPI: TStringField;
    tMusavirSATIS_ODEME_PLANI_ZORUNLUMU: TStringField;
    tMusavirIRS_ODEME_PLAN_EXCELDENAKTAR: TStringField;
    tMusavirODEME_PLN_TARIH_DEGISTIREBILIR: TStringField;
    tMusavirCARI_EKSTRE_DEFAULT_KUR: TStringField;
    tMusavirODEMEPLAN_KONSINYEDURUMU: TStringField;
    tMusavirKONSINYE_TARIHI: TDateTimeField;
    tMusavirKONSINYE_YOK_GECILMEZ_TARIH: TDateTimeField;
    tMusavirALIMIRS_TARIH_KB_TARIH_AYNIMI: TStringField;
    tMusavirSEHA_NAKIT_THSLAT_UYARI_LIMIT: TFloatField;
    tMusavirSUBE_CAPTION: TStringField;
    tMusavirKONSINYE_ALINAN_HIZMET_KODU: TStringField;
    tMusavirKONSINYE_VERILEN_HIZMET_KODU: TStringField;
    tMusavirHIZMET_BELGE_NO_ZORUNLU: TStringField;
    tMusavirMALALIM_BELGE_NO_ZORUNLU: TStringField;
    tMusavirMALALIM_IADE_BELGE_NO_ZORUNLU: TStringField;
    tMusavirTOPTANSTS_IADE_BELGENO_ZORUNLU: TStringField;
    tMusavirMAL_ALIM_STOK_EKLEME_VARMI: TStringField;
    tMusavirSIPARIS_FIYAT_GUNCELLEME: TStringField;
    tMusavirPERAKENDE_EKLEME_VARMI: TStringField;
    tMusavirKDV_FORMAT: TStringField;
    tMusavirTERAZI_ETIKET_BILGILERI: TStringField;
    tMusavirIBM_KATSAYI_BILGILERI: TStringField;
    tMusavirIDLE_KONTROL: TStringField;
    tMusavirLOGO_USERID: TStringField;
    tMusavirLOGO_USERPWD: TStringField;
    tMusavirLOGO_SERVERIP: TStringField;
    tMusavirLOGO_DBNAME: TStringField;
    tMusavirSEHA_TAHSILAT_KULLANICILAR: TStringField;
    tMusavirHAKEDISTEMINATTARIHI: TDateTimeField;
    tMusavirUPDATE_EXE_VERSIYON: TStringField;
    tMusavirHIZMETTE_HAKEDIS: TStringField;
    tMusavirSTOK_AKTIF_MAGAZA: TIntegerField;
    procedure pmDegistirClick(Sender: TObject);
    procedure pmKaydetClick(Sender: TObject);
    procedure pmVazgecClick(Sender: TObject);
    procedure pmKapatClick(Sender: TObject);
    procedure TmDurumTimer(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tMusavirBeforeDelete(DataSet: TDataSet);
    procedure tMusavirAfterEdit(DataSet: TDataSet);
    procedure tMusavirAfterPost(DataSet: TDataSet);
    procedure tMusavirBeforeEdit(DataSet: TDataSet);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  MusavirBilgileri_Form: TMusavirBilgileri_Form;

implementation

Uses BlyLib, dModule, ErpMenu;

{$R *.DFM}

procedure TMusavirBilgileri_Form.TmDurumTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := LoginInfo.Isim;
  StatusBar1.Panels[1].Text := FormatDateTime('dd mmmm yyyy hh:mm:ss', Date + Time);
  if tMusavir.State = dsBrowse Then
     Begin
       StatusBar1.Panels[3].Text := tMusavirSDY.AsString;
       StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tMusavirSDT.AsDateTime);
     End
   Else
     Begin
       StatusBar1.Panels[3].Text := '...';
       StatusBar1.Panels[4].Text := '...';
     End;
end;

procedure TMusavirBilgileri_Form.pmDegistirClick(Sender: TObject);
begin
  tMusavir.Edit;
end;

procedure TMusavirBilgileri_Form.pmKaydetClick(Sender: TObject);
begin
  tMusavir.Post;
end;

procedure TMusavirBilgileri_Form.pmVazgecClick(Sender: TObject);
begin
  tMusavir.Cancel;
end;

procedure TMusavirBilgileri_Form.pmKapatClick(Sender: TObject);
begin
  MusavirBilgileri_Form.Close;
end;

procedure TMusavirBilgileri_Form.PopupMenu1Popup(Sender: TObject);
begin
  pmDegistir.Enabled := tMusavir.State = dsBrowse;
  pmKaydet.Enabled   := tMusavir.State In [dsInsert, dsEdit];
  pmVazgec.Enabled   := tMusavir.State In [dsInsert, dsEdit];
  pmKapat.Enabled    := Not(tMusavir.State In [dsInsert, dsEdit]);
end;

procedure TMusavirBilgileri_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tMusavir.State In [dsInsert, dsEdit] Then
     begin
       if messagedlg('Girilen müþavir bilgileri kaydedilmemiþ, kaydetmek istermisiniz ?', mtconfirmation, [mbyes, mbno], 0) = mryes then tMusavir.Post
                                                                                                                                    else tMusavir.Cancel;
     end;
  Action := caFree;
end;

procedure TMusavirBilgileri_Form.FormCreate(Sender: TObject);
begin
  tMusavir.Open;
end;

procedure TMusavirBilgileri_Form.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
    tMusavir.Close;
end;

procedure TMusavirBilgileri_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
    Exit;
  end;
end;

procedure TMusavirBilgileri_Form.tMusavirBeforeDelete(
  DataSet: TDataSet);
begin
  Abort;
end;

procedure TMusavirBilgileri_Form.tMusavirAfterEdit(DataSet: TDataSet);
begin
  tMusavirSDY.Text                          := LoginInfo.Kod;
  tMusavirSDT.Value                         := LoginInfo.SistemTarihi;
end;

procedure TMusavirBilgileri_Form.tMusavirAfterPost(DataSet: TDataSet);
begin
  tMusavir.Refresh;
end;

procedure TMusavirBilgileri_Form.tMusavirBeforeEdit(DataSet: TDataSet);
begin
  tMusavir.Refresh;
end;

end.




