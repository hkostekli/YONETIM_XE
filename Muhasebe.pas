unit Muhasebe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, DBAccess, Ora, OraSmart, MemDS, OraError, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  DBCtrls, Mask, cxTextEdit, cxDBEdit, cxGroupBox, cxRadioGroup,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxLabel, dxSkinsCore,
  dxSkinsDefaultPainters, cxLookAndFeelPainters, cxGraphics, cxLookAndFeels;

type
  TMuhasebeParametreleri_Form = class(TForm)
    PopupMenu1: TPopupMenu;
    pmDegistir: TMenuItem;
    N1: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N2: TMenuItem;
    pmKapat: TMenuItem;
    dMuhasebe: TDataSource;
    StatusBar1: TStatusBar;
    TmDurum: TTimer;
    tMuhasebe: TOraTable;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBRadioGroup1: TcxDBRadioGroup;
    cxDBRadioGroup2: TcxDBRadioGroup;
    cxDBRadioGroup3: TcxDBRadioGroup;
    cxDBRadioGroup4: TcxDBRadioGroup;
    cxDBRadioGroup5: TcxDBRadioGroup;
    cxDBRadioGroup6: TcxDBRadioGroup;
    cxDBRadioGroup7: TcxDBRadioGroup;
    cxDBRadioGroup8: TcxDBRadioGroup;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBTextEdit7: TcxDBTextEdit;
    cxDBTextEdit8: TcxDBTextEdit;
    tMuhasebePK: TStringField;
    tMuhasebeMALI_YIL_BASLANGICI: TDateTimeField;
    tMuhasebeFIRMA_UNVAN: TStringField;
    tMuhasebeFIRMA_CADDE: TStringField;
    tMuhasebeFIRMA_SOKAK: TStringField;
    tMuhasebeFIRMA_KAPINO: TStringField;
    tMuhasebeFIRMA_ILCE: TStringField;
    tMuhasebeFIRMA_SEHIR: TStringField;
    tMuhasebeFIRMA_ULKE: TStringField;
    tMuhasebeFIRMA_POSTAKOD: TStringField;
    tMuhasebeFIRMA_TEL1: TStringField;
    tMuhasebeFIRMA_TEL2: TStringField;
    tMuhasebeFIRMA_FAX: TStringField;
    tMuhasebeFIRMA_VERGIDAIRE: TStringField;
    tMuhasebeFIRMA_VERGINO: TStringField;
    tMuhasebeFIRMA_SSKNO: TStringField;
    tMuhasebeMUSAVIR_UNVAN: TStringField;
    tMuhasebeMUSAVIR_CADDE: TStringField;
    tMuhasebeMUSAVIR_SOKAK: TStringField;
    tMuhasebeMUSAVIR_KAPINO: TStringField;
    tMuhasebeMUSAVIR_ILCE: TStringField;
    tMuhasebeMUSAVIR_SEHIR: TStringField;
    tMuhasebeMUSAVIR_ULKE: TStringField;
    tMuhasebeMUSAVIR_POSTAKOD: TStringField;
    tMuhasebeMUSAVIR_TEL1: TStringField;
    tMuhasebeMUSAVIR_TEL2: TStringField;
    tMuhasebeMUSAVIR_FAX: TStringField;
    tMuhasebeMUSAVIR_VERGIDAIRE: TStringField;
    tMuhasebeMUSAVIR_VERGINO: TStringField;
    tMuhasebeMUSAVIR_ODASICILNO: TStringField;
    tMuhasebePARA_BIRIMI: TStringField;
    tMuhasebeORANLARDA_HASSASIYET: TIntegerField;
    tMuhasebeMIKTARLARDA_HASSASIYET: TIntegerField;
    tMuhasebeTUTARLARDA_HASSASIYET: TIntegerField;
    tMuhasebeSATIS_ISKONTO_UYGULA: TStringField;
    tMuhasebeALIS_ISKONTO_UYGULA: TStringField;
    tMuhasebeMERKEZI_CALISMA: TStringField;
    tMuhasebeLIMIT_KONTROLU: TStringField;
    tMuhasebeGECERLI_KUR_GUNU: TIntegerField;
    tMuhasebeGUN1: TStringField;
    tMuhasebeGUN2: TStringField;
    tMuhasebeGUN3: TStringField;
    tMuhasebeGUN4: TStringField;
    tMuhasebeGUN5: TStringField;
    tMuhasebeGUN6: TStringField;
    tMuhasebeGUN7: TStringField;
    tMuhasebeASGARI_STOK_KONTROLU: TStringField;
    tMuhasebeAZAMI_STOK_KONTROLU: TStringField;
    tMuhasebeSATIS_NEGATIF_KONTROLU: TStringField;
    tMuhasebeSEVK_NEGATIF_KONTROLU: TStringField;
    tMuhasebeMUSTAHSIL_FON_ORANI: TFloatField;
    tMuhasebeMUSTAHSIL_BORSA_ORANI: TFloatField;
    tMuhasebeMUSTAHSIL_BAGKUR_ORANI: TFloatField;
    tMuhasebeMUSTAHSIL_KOMISYON_ORANI: TFloatField;
    tMuhasebeMUSTAHSIL_KOMISYON_KDV: TFloatField;
    tMuhasebeMUSTAHSIL_STOPAJ_ORANI: TFloatField;
    tMuhasebeSENET_PUL_ORANI: TFloatField;
    tMuhasebeTATIL_KUR: TStringField;
    tMuhasebeOTOMATIK_MUHASEBELESME: TStringField;
    tMuhasebeIMB_STOK_MK_YANSIT: TStringField;
    tMuhasebeDETAYLI_MUHASEBE: TStringField;
    tMuhasebeALIM_MUH_KDV: TStringField;
    tMuhasebeALIM_MAS_KDV: TStringField;
    tMuhasebeALIM_IADE_MUH_KDV: TStringField;
    tMuhasebeALIM_IADE_MAS_KDV: TStringField;
    tMuhasebeSATIS_MUH_KDV: TStringField;
    tMuhasebeSATIS_MAS_KDV: TStringField;
    tMuhasebeSATIS_IADE_MUH_KDV: TStringField;
    tMuhasebeSATIS_IADE_MAS_KDV: TStringField;
    tMuhasebeFINANS_KDV: TFloatField;
    tMuhasebeTOPTAN_SATIS_AKDV_UYGULA: TStringField;
    tMuhasebeSTOK_FIS_KDV_DURUMU: TStringField;
    tMuhasebeSATIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    tMuhasebeSATIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    tMuhasebeALIS_INDIRIM_MUHASEBE_DURUMU: TStringField;
    tMuhasebeALIS_MASRAF_MUHASEBE_DURUMU: TStringField;
    tMuhasebeMUSTAHSIL_FON_MUH: TStringField;
    tMuhasebeMUSTAHSIL_BORSA_MUH: TStringField;
    tMuhasebeMUSTAHSIL_BAGKUR_MUH: TStringField;
    tMuhasebeMUSTAHSIL_KOMISYON_MUH: TStringField;
    tMuhasebeMUSTAHSIL_KOMISYON_KDV_MUH: TStringField;
    tMuhasebeMUSTAHSIL_STOPAJ_MUH: TStringField;
    tMuhasebePOS_INDIRIM_KARTI: TStringField;
    tMuhasebePOS_MASRAF_KARTI: TStringField;
    tMuhasebeIMPORT_DIZINI: TStringField;
    tMuhasebeEXPORT_DIZINI: TStringField;
    tMuhasebeTERAZI_DIZINI: TStringField;
    tMuhasebeCARISATIS_DIZINI: TStringField;
    tMuhasebeTERAZI_FIYAT_BOLME: TIntegerField;
    tMuhasebeOTOMATIK_ODEME_PLAN: TStringField;
    tMuhasebeVER_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    tMuhasebeVER_HIZ_MASRAF_MUH_DURUMU: TStringField;
    tMuhasebeAL_HIZ_INDIRIM_MUH_DURUMU: TStringField;
    tMuhasebeAL_HIZ_MASRAF_MUH_DURUMU: TStringField;
    tMuhasebeHATA_KONTROLU_YAP: TStringField;
    tMuhasebeSDY: TIntegerField;
    tMuhasebeSDT: TDateTimeField;
    tMuhasebeVERSIYON: TStringField;
    tMuhasebeSEVK_FIS_KDV_DURUMU: TStringField;
    tMuhasebeTLFORMAT: TStringField;
    tMuhasebeYTLFORMAT: TStringField;
    tMuhasebeKDV_MATRAHSAL_HESAP: TStringField;
    tMuhasebeGUNDUZ_AKTARIM_SUBE: TStringField;
    tMuhasebeBIRIMFIYATFORMAT: TStringField;
    tMuhasebePROGRAMICILOGO: TStringField;
    tMuhasebeYARDIMPATH: TStringField;
    tMuhasebeODEME_PLANI_NAKIT_KASA: TStringField;
    tMuhasebeODEME_PLANI_EURO_KASA: TStringField;
    tMuhasebeODEME_PLANI_DOLAR_KASA: TStringField;
    tMuhasebeTERMINAL_VERSIYON: TStringField;
    tMuhasebeBONUS_IADE_INDIRIM_KODU: TStringField;
    tMuhasebeMASRAF_IADE_INDIRIM: TStringField;
    tMuhasebeAKTARIM_VERSIYON: TStringField;
    tMuhasebeFTP_ADRES: TStringField;
    tMuhasebeODEMEPLAN_ODEME_TIPLERI_AKTIF: TStringField;
    tMuhasebeCARI_KARTLAR_TURKCE_KARAKTER: TStringField;
    tMuhasebeODEMEPLAN_GUNTIPI: TStringField;
    tMuhasebeSATIS_ODEME_PLANI_ZORUNLUMU: TStringField;
    tMuhasebeIRS_ODEME_PLAN_EXCELDENAKTAR: TStringField;
    tMuhasebeODEME_PLN_TARIH_DEGISTIREBILIR: TStringField;
    tMuhasebeCARI_EKSTRE_DEFAULT_KUR: TStringField;
    tMuhasebeODEMEPLAN_KONSINYEDURUMU: TStringField;
    tMuhasebeKONSINYE_TARIHI: TDateTimeField;
    tMuhasebeKONSINYE_YOK_GECILMEZ_TARIH: TDateTimeField;
    tMuhasebeALIMIRS_TARIH_KB_TARIH_AYNIMI: TStringField;
    tMuhasebeSEHA_NAKIT_THSLAT_UYARI_LIMIT: TFloatField;
    tMuhasebeSUBE_CAPTION: TStringField;
    tMuhasebeKONSINYE_ALINAN_HIZMET_KODU: TStringField;
    tMuhasebeKONSINYE_VERILEN_HIZMET_KODU: TStringField;
    tMuhasebeHIZMET_BELGE_NO_ZORUNLU: TStringField;
    tMuhasebeMALALIM_BELGE_NO_ZORUNLU: TStringField;
    tMuhasebeMALALIM_IADE_BELGE_NO_ZORUNLU: TStringField;
    tMuhasebeTOPTANSTS_IADE_BELGENO_ZORUNLU: TStringField;
    tMuhasebeMAL_ALIM_STOK_EKLEME_VARMI: TStringField;
    tMuhasebeSIPARIS_FIYAT_GUNCELLEME: TStringField;
    tMuhasebePERAKENDE_EKLEME_VARMI: TStringField;
    tMuhasebeKDV_FORMAT: TStringField;
    tMuhasebeTERAZI_ETIKET_BILGILERI: TStringField;
    tMuhasebeIBM_KATSAYI_BILGILERI: TStringField;
    tMuhasebeIDLE_KONTROL: TStringField;
    tMuhasebeLOGO_USERID: TStringField;
    tMuhasebeLOGO_USERPWD: TStringField;
    tMuhasebeLOGO_SERVERIP: TStringField;
    tMuhasebeLOGO_DBNAME: TStringField;
    tMuhasebeSEHA_TAHSILAT_KULLANICILAR: TStringField;
    tMuhasebeHAKEDISTEMINATTARIHI: TDateTimeField;
    tMuhasebeUPDATE_EXE_VERSIYON: TStringField;
    tMuhasebeHIZMETTE_HAKEDIS: TStringField;
    tMuhasebeSTOK_AKTIF_MAGAZA: TIntegerField;
    procedure pmDegistirClick(Sender: TObject);
    procedure pmSilClick(Sender: TObject);
    procedure pmKaydetClick(Sender: TObject);
    procedure pmVazgecClick(Sender: TObject);
    procedure pmKapatClick(Sender: TObject);
    procedure TmDurumTimer(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure tMuhasebeAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tMuhasebeAfterEdit(DataSet: TDataSet);
    procedure tMuhasebeBeforeEdit(DataSet: TDataSet);
    procedure tMuhasebeAfterPost(DataSet: TDataSet);
    procedure cxDBTextEdit1DblClick(Sender: TObject);
    procedure cxDBTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxDBTextEdit2DblClick(Sender: TObject);
    procedure cxDBTextEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  MuhasebeParametreleri_Form: TMuhasebeParametreleri_Form;

implementation

Uses BlyLib, dModule, TMuhasebe, ErpMenu;

{$R *.DFM}

procedure TMuhasebeParametreleri_Form.TmDurumTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := LoginInfo.Isim;
  StatusBar1.Panels[1].Text := FormatDateTime('dd mmmm yyyy hh:mm:ss', Date + Time);
  if tMuhasebe.State = dsBrowse Then
     Begin
       StatusBar1.Panels[3].Text := tMuhasebe.FieldByName('SDY').AsString;
       StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tMuhasebe.FieldByName('SDT').AsDateTime);
     End
   Else
     Begin
       StatusBar1.Panels[3].Text := '...';
       StatusBar1.Panels[4].Text := '...';
     End;
end;

procedure TMuhasebeParametreleri_Form.pmDegistirClick(Sender: TObject);
begin
  tMuhasebe.Edit;
end;

procedure TMuhasebeParametreleri_Form.pmSilClick(Sender: TObject);
begin
  tMuhasebe.Delete;
end;

procedure TMuhasebeParametreleri_Form.pmKaydetClick(Sender: TObject);
begin
  tMuhasebe.Post;
end;

procedure TMuhasebeParametreleri_Form.pmVazgecClick(Sender: TObject);
begin
  tMuhasebe.Cancel;
end;

procedure TMuhasebeParametreleri_Form.pmKapatClick(Sender: TObject);
begin
  MuhasebeParametreleri_Form.Close;
end;

procedure TMuhasebeParametreleri_Form.PopupMenu1Popup(Sender: TObject);
begin
  pmDegistir.Enabled := tMuhasebe.State = dsBrowse;
  pmKaydet.Enabled   := tMuhasebe.State In [dsInsert, dsEdit];
  pmVazgec.Enabled   := tMuhasebe.State In [dsInsert, dsEdit];
  pmKapat.Enabled    := Not(tMuhasebe.State In [dsInsert, dsEdit]);
end;

procedure TMuhasebeParametreleri_Form.tMuhasebeAfterInsert(DataSet: TDataSet);
begin
  tMuhasebePARA_BIRIMI.Text                  := 'TL';
  tMuhasebeORANLARDA_HASSASIYET.Value        := 2;
  tMuhasebeMIKTARLARDA_HASSASIYET.Value      := 3;
  tMuhasebeTUTARLARDA_HASSASIYET.Value       := 0;
  tMuhasebeMERKEZI_CALISMA.Text              := 'H';
  tMuhasebeLIMIT_KONTROLU.Text               := 'H';
  tMuhasebeALIS_ISKONTO_UYGULA.Text          := 'H';
  tMuhasebeSATIS_ISKONTO_UYGULA.Text         := 'H';
  tMuhasebeGECERLI_KUR_GUNU.Text             := '6';
  tMuhasebeGUN1.Text                         := 'E';
  tMuhasebeGUN2.Text                         := 'H';
  tMuhasebeGUN3.Text                         := 'H';
  tMuhasebeGUN4.Text                         := 'H';
  tMuhasebeGUN5.Text                         := 'H';
  tMuhasebeGUN6.Text                         := 'H';
  tMuhasebeGUN7.Text                         := 'E';
  tMuhasebeASGARI_STOK_KONTROLU.Text         := 'H';
  tMuhasebeAZAMI_STOK_KONTROLU.Text          := 'H';
  tMuhasebeSATIS_NEGATIF_KONTROLU.Text       := 'H';
  tMuhasebeSEVK_NEGATIF_KONTROLU.Text        := 'H';
  tMuhasebeSENET_PUL_ORANI.Value             := 6;
  tMuhasebeOTOMATIK_MUHASEBELESME.Text       := 'H';
  tMuhasebeIMB_STOK_MK_YANSIT.Text           := 'E';
  tMuhasebeDETAYLI_MUHASEBE.Text             := 'E';
  tMuhasebeFINANS_KDV.Value                  := 17;
  tMuhasebeTOPTAN_SATIS_AKDV_UYGULA.Text     := 'H';
  tMuhasebeSTOK_FIS_KDV_DURUMU.Text          := '0';
  tMuhasebeALIS_INDIRIM_MUHASEBE_DURUMU.Text := '1';
  tMuhasebeALIS_MASRAF_MUHASEBE_DURUMU.Text  := '1';
  tMuhasebeSATIS_INDIRIM_MUHASEBE_DURUMU.Text:= '1';
  tMuhasebeSATIS_MASRAF_MUHASEBE_DURUMU.Text := '1';
  tMuhasebePK.Text                           := 'P';
  tMuhasebeSDY.Text                          := LoginInfo.Kod;
  tMuhasebeSDT.Value                         := LoginInfo.SistemTarihi;
end;

procedure TMuhasebeParametreleri_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tMuhasebe.State In [dsInsert, dsEdit] Then
     begin
       if messagedlg('Girilen  muhasebe parametreleri kaydedilmemiþ, kaydetmek istermisiniz ?', mtconfirmation, [mbyes, mbno], 0) = mryes then tMuhasebe.Post
                                                                                                                                          else tMuhasebe.Cancel;
     end;
  Action := caFree;
end;

procedure TMuhasebeParametreleri_Form.FormCreate(Sender: TObject);
begin
  tMuhasebe.Open;
end;

procedure TMuhasebeParametreleri_Form.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
    tMuhasebe.Close;
end;

procedure TMuhasebeParametreleri_Form.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
  begin
    SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
    Exit;
  end;
end;

procedure TMuhasebeParametreleri_Form.tMuhasebeAfterEdit(DataSet: TDataSet);
begin
  tMuhasebeSDY.Text     := LoginInfo.Kod;
  tMuhasebeSDT.Value    := LoginInfo.SistemTarihi;
end;

procedure TMuhasebeParametreleri_Form.tMuhasebeBeforeEdit(DataSet: TDataSet);
begin
  tMuhasebe.Refresh;
end;

procedure TMuhasebeParametreleri_Form.tMuhasebeAfterPost(DataSet: TDataSet);
begin
  tMuhasebe.Refresh;
end;

procedure TMuhasebeParametreleri_Form.cxDBTextEdit1DblClick(Sender: TObject);
begin
  if Not(tMuhasebe.State In [dsInsert, dsEdit]) Then Exit;

  mhKriter.V := TcxDBTextEdit(Sender).Text;
  if mhCreate(True) = mrOk Then
     Begin
       tMuhasebe.FieldByName(TcxDBTextEdit(Sender).DataBinding.DataField).AsString := Kart_Muhasebe.qKart.FieldByName('KOD').AsString;
       Kart_Muhasebe.Close;
     End;
end;

procedure TMuhasebeParametreleri_Form.cxDBTextEdit1KeyPress(Sender: TObject;
    var Key: Char);
begin
  if Key = '+' then  cxDBTextEdit1DblClick(Sender);
end;

procedure TMuhasebeParametreleri_Form.cxDBTextEdit2DblClick(Sender: TObject);
begin
  if not (tMuhasebe.State in [dsInsert, dsEdit]) then exit;
(*
  if mmCreate(True) = mrOk then
    begin
      tMuhasebe.FieldByName(TcxDBTextEdit(Sender).DataBinding.DataField).AsString := Kart_MasrafMerkezi.qKartKOD.AsString;
      Kart_MasrafMerkezi.Free;
    end;
*)
end;

procedure TMuhasebeParametreleri_Form.cxDBTextEdit2KeyPress(Sender: TObject;
    var Key: Char);
begin
  if Key = '+' then  cxDBTextEdit2DblClick(Sender);
end;

end.



