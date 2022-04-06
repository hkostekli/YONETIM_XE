unit Stok;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, DBAccess, Ora, OraSmart, MemDS, OraError, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  DBCtrls, Mask, cxGroupBox, cxRadioGroup, cxDBEdit, cxCheckBox,
  cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxLookAndFeelPainters, cxGraphics, cxLookAndFeels;

type
  TStokParametreleri_Form = class(TForm)
    PopupMenu1: TPopupMenu;
    pmDegistir: TMenuItem;
    N1: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N2: TMenuItem;
    pmKapat: TMenuItem;
    dStok: TDataSource;
    StatusBar1: TStatusBar;
    TmDurum: TTimer;
    tStok: TOraTable;
    cxLabel1: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBRadioGroup1: TcxDBRadioGroup;
    cxLabel2: TcxLabel;
    cxDBCheckBox2: TcxDBCheckBox;
    cxLabel3: TcxLabel;
    cxDBCheckBox3: TcxDBCheckBox;
    cxLabel4: TcxLabel;
    cxDBCheckBox4: TcxDBCheckBox;
    cxLabel5: TcxLabel;
    cxDBCheckBox5: TcxDBCheckBox;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxDBRadioGroup2: TcxDBRadioGroup;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    cxLabel14: TcxLabel;
    cxLabel15: TcxLabel;
    cxLabel16: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    cxDBTextEdit9: TcxDBTextEdit;
    cxDBTextEdit10: TcxDBTextEdit;
    cxDBTextEdit11: TcxDBTextEdit;
    cxDBTextEdit12: TcxDBTextEdit;
    tStokPK: TStringField;
    tStokMALI_YIL_BASLANGICI: TDateTimeField;
    tStokFIRMA_UNVAN: TStringField;
    tStokFIRMA_CADDE: TStringField;
    tStokFIRMA_SOKAK: TStringField;
    tStokFIRMA_KAPINO: TStringField;
    tStokFIRMA_ILCE: TStringField;
    tStokFIRMA_SEHIR: TStringField;
    tStokFIRMA_ULKE: TStringField;
    tStokFIRMA_POSTAKOD: TStringField;
    tStokFIRMA_TEL1: TStringField;
    tStokFIRMA_TEL2: TStringField;
    tStokFIRMA_FAX: TStringField;
    tStokFIRMA_VERGIDAIRE: TStringField;
    tStokFIRMA_VERGINO: TStringField;
    tStokFIRMA_SSKNO: TStringField;
    tStokMUSAVIR_UNVAN: TStringField;
    tStokMUSAVIR_CADDE: TStringField;
    tStokMUSAVIR_SOKAK: TStringField;
    tStokMUSAVIR_KAPINO: TStringField;
    tStokMUSAVIR_ILCE: TStringField;
    tStokMUSAVIR_SEHIR: TStringField;
    tStokMUSAVIR_ULKE: TStringField;
    tStokMUSAVIR_POSTAKOD: TStringField;
    tStokMUSAVIR_TEL1: TStringField;
    tStokMUSAVIR_TEL2: TStringField;
    tStokMUSAVIR_FAX: TStringField;
    tStokMUSAVIR_VERGIDAIRE: TStringField;
    tStokMUSAVIR_VERGINO: TStringField;
    tStokMUSAVIR_ODASICILNO: TStringField;
    tStokPARA_BIRIMI: TStringField;
    tStokORANLARDA_HASSASIYET: TIntegerField;
    tStokMIKTARLARDA_HASSASIYET: TIntegerField;
    tStokTUTARLARDA_HASSASIYET: TIntegerField;
    tStokSATIS_ISKONTO_UYGULA: TStringField;
    tStokALIS_ISKONTO_UYGULA: TStringField;
    tStokMERKEZI_CALISMA: TStringField;
    tStokLIMIT_KONTROLU: TStringField;
    tStokGECERLI_KUR_GUNU: TIntegerField;
    tStokGUN1: TStringField;
    tStokGUN2: TStringField;
    tStokGUN3: TStringField;
    tStokGUN4: TStringField;
    tStokGUN5: TStringField;
    tStokGUN6: TStringField;
    tStokGUN7: TStringField;
    tStokASGARI_STOK_KONTROLU: TStringField;
    tStokAZAMI_STOK_KONTROLU: TStringField;
    tStokSATIS_NEGATIF_KONTROLU: TStringField;
    tStokSEVK_NEGATIF_KONTROLU: TStringField;
    tStokMUSTAHSIL_FON_ORANI: TFloatField;
    tStokMUSTAHSIL_BORSA_ORANI: TFloatField;
    tStokMUSTAHSIL_BAGKUR_ORANI: TFloatField;
    tStokMUSTAHSIL_KOMISYON_ORANI: TFloatField;
    tStokMUSTAHSIL_KOMISYON_KDV: TFloatField;
    tStokMUSTAHSIL_STOPAJ_ORANI: TFloatField;
    tStokSENET_PUL_ORANI: TFloatField;
    tStokTATIL_KUR: TStringField;
    tStokOTOMATIK_MUHASEBELESME: TStringField;
    tStokIMB_STOK_MK_YANSIT: TStringField;
    tStokDETAYLI_MUHASEBE: TStringField;
    tStokALIM_MUH_KDV: TStringField;
    tStokALIM_MAS_KDV: TStringField;
    tStokALIM_IADE_MUH_KDV: TStringField;
    tStokALIM_IADE_MAS_KDV: TStringField;
    tStokSATIS_MUH_KDV: TStringField;
    tStokSATIS_MAS_KDV: TStringField;
    tStokSATIS_IADE_MUH_KDV: TStringField;
    tStokSATIS_IADE_MAS_KDV: TStringField;
    tStokFINANS_KDV: TFloatField;
    tStokTOPTAN_SATIS_AKDV_UYGULA: TStringField;
    tStokSTOK_FIS_KDV_DURUMU: TStringField;
    tStokSATIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    tStokSATIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    tStokALIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    tStokALIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    tStokMUSTAHSIL_FON_MUH: TStringField;
    tStokMUSTAHSIL_BORSA_MUH: TStringField;
    tStokMUSTAHSIL_BAGKUR_MUH: TStringField;
    tStokMUSTAHSIL_KOMISYON_MUH: TStringField;
    tStokMUSTAHSIL_KOMISYON_KDV_MUH: TStringField;
    tStokMUSTAHSIL_STOPAJ_MUH: TStringField;
    tStokPOS_INDIRIM_KARTI: TStringField;
    tStokPOS_MASRAF_KARTI: TStringField;
    tStokIMPORT_DIZINI: TStringField;
    tStokEXPORT_DIZINI: TStringField;
    tStokTERAZI_DIZINI: TStringField;
    tStokCARISATIS_DIZINI: TStringField;
    tStokTERAZI_FIYAT_BOLME: TIntegerField;
    tStokOTOMATIK_ODEME_PLAN: TStringField;
    tStokVER_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    tStokVER_HIZ_MASRAF_MUH_DURUMU: TStringField;
    tStokAL_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    tStokAL_HIZ_MASRAF_MUH_DURUMU: TStringField;
    tStokHATA_KONTROLU_YAP: TStringField;
    tStokSDY: TIntegerField;
    tStokSDT: TDateTimeField;
    tStokVERSIYON: TStringField;
    tStokSEVK_FIS_KDV_DURUMU: TStringField;
    tStokTLFORMAT: TStringField;
    tStokYTLFORMAT: TStringField;
    tStokKDV_MATRAHSAL_HESAP: TStringField;
    tStokGUNDUZ_AKTARIM_SUBE: TStringField;
    tStokBIRIMFIYATFORMAT: TStringField;
    tStokPROGRAMICILOGO: TStringField;
    tStokYARDIMPATH: TStringField;
    tStokODEME_PLANI_NAKIT_KASA: TStringField;
    tStokODEME_PLANI_EURO_KASA: TStringField;
    tStokODEME_PLANI_DOLAR_KASA: TStringField;
    tStokTERMINAL_VERSIYON: TStringField;
    tStokBONUS_IADE_INDIRIM_KODU: TStringField;
    tStokMASRAF_IADE_INDIRIM: TStringField;
    tStokAKTARIM_VERSIYON: TStringField;
    tStokFTP_ADRES: TStringField;
    tStokODEMEPLAN_ODEME_TIPLERI_AKTIF: TStringField;
    tStokCARI_KARTLAR_TURKCE_KARAKTER: TStringField;
    tStokODEMEPLAN_GUNTIPI: TStringField;
    tStokSATIS_ODEME_PLANI_ZORUNLUMU: TStringField;
    tStokIRS_ODEME_PLAN_EXCELDENAKTAR: TStringField;
    tStokODEME_PLN_TARIH_DEGISTIREBILIR: TStringField;
    tStokCARI_EKSTRE_DEFAULT_KUR: TStringField;
    tStokODEMEPLAN_KONSINYEDURUMU: TStringField;
    tStokKONSINYE_TARIHI: TDateTimeField;
    tStokKONSINYE_YOK_GECILMEZ_TARIH: TDateTimeField;
    tStokALIMIRS_TARIH_KB_TARIH_AYNIMI: TStringField;
    tStokSEHA_NAKIT_THSLAT_UYARI_LIMIT: TFloatField;
    tStokSUBE_CAPTION: TStringField;
    tStokKONSINYE_ALINAN_HIZMET_KODU: TStringField;
    tStokKONSINYE_VERILEN_HIZMET_KODU: TStringField;
    tStokHIZMET_BELGE_NO_ZORUNLU: TStringField;
    tStokMALALIM_BELGE_NO_ZORUNLU: TStringField;
    tStokMALALIM_IADE_BELGE_NO_ZORUNLU: TStringField;
    tStokTOPTANSTS_IADE_BELGENO_ZORUNLU: TStringField;
    tStokMAL_ALIM_STOK_EKLEME_VARMI: TStringField;
    tStokSIPARIS_FIYAT_GUNCELLEME: TStringField;
    tStokPERAKENDE_EKLEME_VARMI: TStringField;
    tStokKDV_FORMAT: TStringField;
    tStokTERAZI_ETIKET_BILGILERI: TStringField;
    tStokIBM_KATSAYI_BILGILERI: TStringField;
    tStokIDLE_KONTROL: TStringField;
    tStokLOGO_USERID: TStringField;
    tStokLOGO_USERPWD: TStringField;
    tStokLOGO_SERVERIP: TStringField;
    tStokLOGO_DBNAME: TStringField;
    tStokSEHA_TAHSILAT_KULLANICILAR: TStringField;
    tStokHAKEDISTEMINATTARIHI: TDateTimeField;
    tStokUPDATE_EXE_VERSIYON: TStringField;
    tStokHIZMETTE_HAKEDIS: TStringField;
    tStokSTOK_AKTIF_MAGAZA: TIntegerField;
    procedure pmDegistirClick(Sender: TObject);
    procedure pmSilClick(Sender: TObject);
    procedure pmKaydetClick(Sender: TObject);
    procedure pmVazgecClick(Sender: TObject);
    procedure pmKapatClick(Sender: TObject);
    procedure TmDurumTimer(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure tStokAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tStokAfterEdit(DataSet: TDataSet);
    procedure tStokAfterPost(DataSet: TDataSet);
    procedure tStokBeforeEdit(DataSet: TDataSet);
    procedure cxDBTextEdit7DblClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  StokParametreleri_Form: TStokParametreleri_Form;

implementation

Uses BlyLib, dModule,  ErpMenu, TMuhasebe;

{$R *.DFM}

procedure TStokParametreleri_Form.TmDurumTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := LoginInfo.Isim;
  StatusBar1.Panels[1].Text := FormatDateTime('dd mmmm yyyy hh:mm:ss', Date + Time);
  if tStok.State = dsBrowse Then
     Begin
       StatusBar1.Panels[3].Text := tStok.FieldByName('SDY').AsString;
       StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tStok.FieldByName('SDT').AsDateTime);
     End
   Else
     Begin
       StatusBar1.Panels[3].Text := '...';
       StatusBar1.Panels[4].Text := '...';
     End;
end;

procedure TStokParametreleri_Form.pmDegistirClick(Sender: TObject);
begin
  tStok.Edit;
end;

procedure TStokParametreleri_Form.pmSilClick(Sender: TObject);
begin
  tStok.Delete;
end;

procedure TStokParametreleri_Form.pmKaydetClick(Sender: TObject);
begin
  tStok.Post;
end;

procedure TStokParametreleri_Form.pmVazgecClick(Sender: TObject);
begin
  tStok.Cancel;
end;

procedure TStokParametreleri_Form.pmKapatClick(Sender: TObject);
begin
  StokParametreleri_Form.Close;
end;

procedure TStokParametreleri_Form.PopupMenu1Popup(Sender: TObject);
begin
  pmDegistir.Enabled := tStok.State = dsBrowse;
  pmKaydet.Enabled   := tStok.State In [dsInsert, dsEdit];
  pmVazgec.Enabled   := tStok.State In [dsInsert, dsEdit];
  pmKapat.Enabled    := Not(tStok.State In [dsInsert, dsEdit]);
end;

procedure TStokParametreleri_Form.tStokAfterInsert(DataSet: TDataSet);
begin
  tStokPARA_BIRIMI.Text                  := 'TL';
  tStokORANLARDA_HASSASIYET.Value        := 2;
  tStokMIKTARLARDA_HASSASIYET.Value      := 3;
  tStokTUTARLARDA_HASSASIYET.Value       := 0;
  tStokMERKEZI_CALISMA.Text              := 'H';
  tStokLIMIT_KONTROLU.Text               := 'H';
  tStokALIS_ISKONTO_UYGULA.Text          := 'H';
  tStokSATIS_ISKONTO_UYGULA.Text         := 'H';
  tStokGECERLI_KUR_GUNU.Text             := '6';
  tStokGUN1.Text                         := 'E';
  tStokGUN2.Text                         := 'H';
  tStokGUN3.Text                         := 'H';
  tStokGUN4.Text                         := 'H';
  tStokGUN5.Text                         := 'H';
  tStokGUN6.Text                         := 'H';
  tStokGUN7.Text                         := 'E';
  tStokASGARI_STOK_KONTROLU.Text         := 'H';
  tStokAZAMI_STOK_KONTROLU.Text          := 'H';
  tStokSATIS_NEGATIF_KONTROLU.Text       := 'H';
  tStokSEVK_NEGATIF_KONTROLU.Text        := 'H';
  tStokSENET_PUL_ORANI.Value             := 6;
  tStokOTOMATIK_MUHASEBELESME.Text       := 'H';
  tStokIMB_STOK_MK_YANSIT.Text           := 'E';
  tStokDETAYLI_MUHASEBE.Text             := 'E';
  tStokFINANS_KDV.Value                  := 17;
  tStokTOPTAN_SATIS_AKDV_UYGULA.Text     := 'H';
  tStokSTOK_FIS_KDV_DURUMU.Text          := '0';
  tStokALIS_INDIRIM_MUHASEBE_DURUMU.Text := '1';
  tStokALIS_MASRAF_MUHASEBE_DURUMU.Text  := '1';
  tStokSATIS_INDIRIM_MUHASEBE_DURUMU.Text:= '1';
  tStokSATIS_MASRAF_MUHASEBE_DURUMU.Text := '1';
  tStokPK.Text                           := 'P';
  tStokSDY.Text                          := LoginInfo.Kod;
  tStokSDT.Value                         := LoginInfo.SistemTarihi;
end;

procedure TStokParametreleri_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tStok.State In [dsInsert, dsEdit] Then
     begin
       if messagedlg('Girilen stok parametre bilgileri kaydedilmemiþ, kaydetmek istermisiniz ?', mtconfirmation, [mbyes, mbno], 0) = mryes then tStok.Post
                                                                                                                                           else tStok.Cancel;
     end;
  Action := caFree;
end;

procedure TStokParametreleri_Form.FormCreate(Sender: TObject);
begin
  tStok.Open;
end;

procedure TStokParametreleri_Form.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
    tStok.Close;
end;

procedure TStokParametreleri_Form.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
    Exit;
  end;
end;

procedure TStokParametreleri_Form.tStokAfterEdit(DataSet: TDataSet);
begin
  tStokSDY.Text   := LoginInfo.Kod;
  tStokSDT.Value  := LoginInfo.SistemTarihi;
end;

procedure TStokParametreleri_Form.tStokAfterPost(DataSet: TDataSet);
begin
  tStok.Refresh;
end;

procedure TStokParametreleri_Form.tStokBeforeEdit(DataSet: TDataSet);
begin
  tStok.Refresh;
end;

procedure TStokParametreleri_Form.cxDBTextEdit7DblClick(Sender: TObject);
var
  Tag : Integer;
begin
  if Not(tStok.State In [dsInsert, dsEdit]) Then Exit;

  Tag := TcxDBTextEdit(Sender).Tag;
  if mhCreate(True) = mrOk Then
     Begin
       case Tag of
         1: tStok.FieldByName('MUSTAHSIL_FON_MUH').AsString          := Kart_Muhasebe.qKart.FieldByName('KOD').AsString;
         2: tStok.FieldByName('MUSTAHSIL_STOPAJ_MUH').AsString       := Kart_Muhasebe.qKart.FieldByName('KOD').AsString;
         3: tStok.FieldByName('MUSTAHSIL_BORSA_MUH').AsString        := Kart_Muhasebe.qKart.FieldByName('KOD').AsString;
         4: tStok.FieldByName('MUSTAHSIL_BAGKUR_MUH').AsString       := Kart_Muhasebe.qKart.FieldByName('KOD').AsString;
         5: tStok.FieldByName('MUSTAHSIL_KOMISYON_MUH').AsString     := Kart_Muhasebe.qKart.FieldByName('KOD').AsString;
         6: tStok.FieldByName('MUSTAHSIL_KOMISYON_KDV_MUH').AsString := Kart_Muhasebe.qKart.FieldByName('KOD').AsString;
       end; //case

       Kart_Muhasebe.Close;
     End;
end;

end.




