unit TSifreParametre;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, ComCtrls, ToolWin, Buttons, ExtCtrls,
  Grids, DBGrids, DB, DBAccess, Ora, OraSmart, MemDS, OraError, Menus, dxBarExtItems, dxBar, cxClasses,
  ActnList, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar, cxDBEdit,
  cxLabel, cxControls, cxContainer, cxEdit, cxGroupBox, cxPC,
  cxLookAndFeelPainters, kquerpnl, cxButtons, dxDockControl, dxDockPanel,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridCustomView, cxGrid, cxDBLabel, cxImageComboBox,
  cxButtonEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckBox, ImgList, cxMemo, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxLookAndFeels, dxBarBuiltInMenu,
  cxNavigator, dxSkinsdxBarPainter, System.ImageList, System.Actions;

type
  TSifreParametre_Form = class(TForm)
    qKart: TOraQuery;
    dKart: TDataSource;
    uKart: TOraUpdateSQL;
    pMenu: TPopupMenu;
    ppmSave: TMenuItem;
    ppmCancel: TMenuItem;
    ppmEdit: TMenuItem;
    N5: TMenuItem;
    ppmExit: TMenuItem;
    ActionList: TActionList;
    actInsert: TAction;
    actSave: TAction;
    actCancel: TAction;
    actEdit: TAction;
    actDelete: TAction;
    actExit: TAction;
    BarManager: TdxBarManager;
    BarManagerBar1: TdxBar;
    tbtnSave: TdxBarButton;
    tbtnCancel: TdxBarButton;
    tbtnEdit: TdxBarButton;
    tbtnExit: TdxBarButton;
    Yardm1: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarProgress: TdxBarProgressItem;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxPageControl1: TcxPageControl;
    pgList: TcxTabSheet;
    pgDetay: TcxTabSheet;
    cxGrid1: TcxGrid;
    TableView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGroupBox1: TcxGroupBox;
    cxLabel37: TcxLabel;
    edArama: TEdit;
    cbArama: TcxComboBox;
    Col_ID: TcxGridDBColumn;
    Col_AdiSoyadi: TcxGridDBColumn;
    Col_SifreAktif: TcxGridDBColumn;
    N1: TMenuItem;
    cxLabel12: TcxLabel;
    cxLabel13: TcxLabel;
    actTopluDegistir: TAction;
    qKullanici: TOraQuery;
    dKullanici: TDataSource;
    N2: TMenuItem;
    ppmTopluDegistir: TMenuItem;
    tbtnTopluDegistir: TdxBarButton;
    qRoller: TOraQuery;
    dRoller: TDataSource;
    cbRol: TcxComboBox;
    Disable_New: TImageList;
    Enable_New: TImageList;
    Panel1: TPanel;
    cxLabel4: TcxLabel;
    cxLabel3: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel5: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    cxLabel8: TcxLabel;
    cxLabel9: TcxLabel;
    cxLabel10: TcxLabel;
    cxLabel11: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxDBTextEdit2: TcxDBTextEdit;
    cxDBTextEdit4: TcxDBTextEdit;
    cxDBTextEdit5: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBCheckBox1: TcxDBCheckBox;
    cxDBCheckBox2: TcxDBCheckBox;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBTextEdit7: TcxDBTextEdit;
    cxLabel14: TcxLabel;
    cxDBCheckBox4: TcxDBCheckBox;
    cxLabel15: TcxLabel;
    cxDBCheckBox5: TcxDBCheckBox;
    qKartKULLANICI_ID: TIntegerField;
    qKartSIFRE_AKTIF: TStringField;
    qKartONCEKI_SIFRE_ENGELLE: TStringField;
    qKartKULLANICIADI_SIFRE_FARKLI: TStringField;
    qKartSIFRE_KAYIT_TARIHI: TDateTimeField;
    qKartSIFRE_PERIYODU: TIntegerField;
    qKartUYARI_SURESI: TIntegerField;
    qKartMIN_SIFRE_UZUNLUGU: TIntegerField;
    qKartMIN_TEXT_SAYISI: TIntegerField;
    qKartMIN_NUMERIK_SAYISI: TIntegerField;
    qKartHATALI_GIRIS_SAYISI: TIntegerField;
    qKartTURKCE_KARAKTER_ENGELLE: TStringField;
    qKartKUCUK_HARF_ENGELLE: TStringField;
    qKullaniciKOD: TIntegerField;
    qRollerKOD: TStringField;
    qKartISIM: TStringField;
    procedure FormDestroy(Sender: TObject);
    procedure qKartAfterCancel(DataSet: TDataSet);
    procedure qKartAfterPost(DataSet: TDataSet);
    procedure qKartAfterScroll(DataSet: TDataSet);
    procedure dKartStateChange(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actCancelExecute(Sender: TObject);
    procedure actEditExecute(Sender: TObject);
    procedure actExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure edAramaKeyPress(Sender: TObject; var Key: Char);
    procedure cxDBTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbAramaPropertiesChange(Sender: TObject);
    procedure qKartCalcFields(DataSet: TDataSet);
    procedure actTopluDegistirExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);


  private
    { Private declarations }
     procedure MngQuery(F : string);
     function KullaniciAdiGoster(Kod:Integer):String;
  public
    { Public declarations }
  end;

var
  SifreParametre_Form: TSifreParametre_Form;  

implementation

uses DModule,BlyLib, ErpMenu;

{$R *.dfm}

function TSifreParametre_Form.KullaniciAdiGoster(Kod:Integer):String;
begin
  dmGlobal.qTmp.Close;
  dmGlobal.qTmp.SQL.Clear;
  dmGlobal.qTmp.SQL.Add('Select ISIM from KULLANICI where KOD='+ IntToStr(Kod));
  dmGlobal.qTmp.Open;
  Result := dmGlobal.qTmp.FieldByName('ISIM').AsString;
  dmGlobal.qTmp.Close;
end;

procedure TSifreParametre_Form.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;

  if qKart.Active Then qKart.Close;
end;

procedure TSifreParametre_Form.qKartAfterCancel(DataSet: TDataSet);
begin
  qKartAfterScroll(Nil);
end;

procedure TSifreParametre_Form.qKartAfterPost(DataSet: TDataSet);
begin
  dmGlobal.dbGlobal.StartTransaction;
  try
    qKart.ApplyUpdates;
    dmGlobal.dbGlobal.Commit;
    qKart.CommitUpdates;
  except
    dmGlobal.dbGlobal.RollBack;
    qKart.CancelUpdates;
    Application.MessageBox('Kayýt iþlemi sýrasýnda hata oluþtu ve iþlem iptal edildi !', 'HATA!', mb_OK);
    qKartAfterScroll(nil);
  end;
  qKartAfterScroll(nil);
end;

procedure TSifreParametre_Form.qKartAfterScroll(DataSet: TDataSet);
begin
  //actInsert.Enabled       := (qKart.State = dsBrowse);
  actEdit.Enabled           := (qKart.State = dsBrowse) and (qKart.RecordCount > 0) and LoginInfo.Haklar[3394];
  actTopluDegistir.Enabled  := (qKart.State = dsBrowse) and LoginInfo.Haklar[3395];
  //actDelete.Enabled       := (qKart.State = dsBrowse) and (qKartKULLANICI_ID.AsFloat > 0);
  actSave.Enabled           := (qKart.State in [dsEdit, dsInsert]);
  actCancel.Enabled         := actSave.Enabled;
  actExit.Enabled           := qKart.State = dsBrowse;
end;

procedure TSifreParametre_Form.dKartStateChange(Sender: TObject);
begin
  qKartAfterScroll(nil);
end;

procedure TSifreParametre_Form.actSaveExecute(Sender: TObject);
begin
  ActiveControl := cxDBTextEdit7;
  if qKartKULLANICI_ID.AsString = '' then
     begin
       Application.MessageBox('Kullanýcý bilgisi eksik girilmiþ.', 'HATA', mb_OK);
       Exit;
     end;
  qKart.Post;
  cxPageControl1.ActivePage  := pgList;
end;

procedure TSifreParametre_Form.actCancelExecute(Sender: TObject);
begin
  if Application.MessageBox('Deðiþiklikleri iptal etmek istediðinizden emin misiniz?','DÝKKAT !',mb_YesNo+mb_DefButton2) = idNo then Exit;
  qKart.Cancel;
  cxPageControl1.ActivePage      := pgList;
end;

procedure TSifreParametre_Form.actEditExecute(Sender: TObject);
begin
  cxPageControl1.ActivePage:= pgDetay;
  qKart.Edit;
  ActiveControl := cxDBTextEdit7;
end;

procedure TSifreParametre_Form.actExitExecute(Sender: TObject);
begin
   Close;
end;

procedure TSifreParametre_Form.FormCreate(Sender: TObject);
begin
    Left := ((Yonetim_Menu.Width - 220) div 2) - (Width  div 2);
    Top  := ((Yonetim_Menu.Height - 80) div 2) - (Height div 2);

  cbRol.Properties.Items.Clear;
  cbRol.Properties.Items.Add('TUM KULLANICILAR');

  qRoller.Close;
  qRoller.SQL.Clear;
  qRoller.SQL.Add('SELECT KOD FROM ROLLER WHERE TUR='''+LoginInfo.RolTur+''' ORDER BY KOD');
  qRoller.Open;
  while not qRoller.Eof do
   begin
     cbRol.Properties.Items.Add(qRollerKOD.AsString);
     qRoller.Next;
   end;
  qRoller.Close;
  cbRol.ItemIndex := 0;
  MngQuery('');
  edArama.Text := '';
  cbArama.ItemIndex := 1;
  if cxPageControl1.ActivePage <> pgList then cxPageControl1.ActivePage := pgList;
  ActiveControl := edArama;
end;

procedure TSifreParametre_Form.MngQuery(F: String);
begin
  if cxPageControl1.ActivePage <> pgList Then cxPageControl1.ActivePage := pgList;
  qKart.Close;
  qKart.SQL.Clear;
  qKart.SQL.Add('SELECT * FROM PARAMETRE_SIFRE WHERE 1=1 ');
    If Not((LoginInfo.LOGINNAME = 'FATASAGUN') Or (LoginInfo.LOGINNAME = 'HARUN') Or (LoginInfo.LOGINNAME = 'BULU') Or (LoginInfo.LOGINNAME = 'AFURKAN') Or (LoginInfo.LOGINNAME = 'TUGRAL')) then
       qKart.SQL.Add(' AND KULLANICI_ID IN (SELECT KULLANICI_ID FROM KULLANICI WHERE LOGINNAME NOT IN (''AFURKAN'',''FATASAGUN'',''HARUN'',''TUGRAL'',''BULU''))');
  if ( F <> '' ) then qKart.SQL.Add(' AND ' + F);
  qKart.SQL.Add('ORDER BY KULLANICI_ID');
  qKart.Open;
  ActiveControl := edArama;
end;

procedure TSifreParametre_Form.cxPageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
   AllowChange := not (qKart.State in [dsEdit, dsInsert]);
end;

procedure TSifreParametre_Form.edAramaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      if edArama.Text = '' then MngQuery('')
      else
        begin
          case cbArama.ItemIndex Of
            0: MngQuery(_SQLString('KULLANICI_ID', edArama.Text, 'S'));
            1: MngQuery('KULLANICI_ID IN (SELECT K.KOD FROM KULLANICI K WHERE '+ _SQLString('K.ISIM', edArama.Text, 'S') +')');
            2: MngQuery('KULLANICI_ID IN (SELECT KOD FROM KULLANICI_ROL R WHERE '+ _SQLString('R.ROL', edArama.Text, 'S') +')');
            3: MngQuery(_SQLString('SIFRE_AKTIF', edArama.Text, 'S'));
          end;
        end;
      Key               := #0;
      edArama.SetFocus;
      edArama.SelStart  := 0;
      edArama.SelLength := Length(edArama.Text);
      ActiveControl     := edArama;
    end;
end;

procedure TSifreParametre_Form.cxDBTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if (qKart.State in [dsEdit,dsInsert]) and not (Key in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', logininfo.Ondalik, #8, #13]) then Key := #0;
end;

procedure TSifreParametre_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if qKart.State in [dsInsert, dsEdit] then
    begin
       CanClose :=
          Application.MessageBox(PChar('Þifre Sistemi Ayarlarý Üzerinde Yapýlan Deðiþiklikler Kaydedilmemiþ'#13'Gerçekten Çýkmak Ýstiyormusunuz ?'), 'UYARI', mb_YesNo) = idYes;
       if CanClose then
          qKart.Cancel;
    end
  else
    CanClose := True;
end;

procedure TSifreParametre_Form.cbAramaPropertiesChange(Sender: TObject);
begin
   ActiveControl := edArama;
end;

procedure TSifreParametre_Form.qKartCalcFields(DataSet: TDataSet);
begin
 if qKartKULLANICI_ID.AsInteger <> -1 then
    qKartISIM.AsString := KullaniciAdiGoster(qKartKULLANICI_ID.AsInteger)
  else
    qKartISIM.AsString := 'TUM KULLANICILAR';
end;

procedure TSifreParametre_Form.actTopluDegistirExecute(Sender: TObject);
begin
 If Application.MessageBox('Tüm kullanýclarýn þifre sistemi ayarlarý deðiþtirilecektir. Onaylýyormusunuz ?','Dikkat !',Mb_YesNo) = idNo Then Abort;
 if cbRol.Text = 'TUM KULLANICILAR' then
   begin
     SqlRecord('DELETE FROM PARAMETRE_SIFRE WHERE KULLANICI_ID<>'+ IntToStr(-1));
     qKullanici.Open;
     qKullanici.First;
     while not qKullanici.Eof do
       begin
         SqlRecord('INSERT INTO PARAMETRE_SIFRE SELECT '+ qKullaniciKOD.AsString +',SIFRE_AKTIF,ONCEKI_SIFRE_ENGELLE,KULLANICIADI_SIFRE_FARKLI,'+
                   'TRUNC(SYSDATE),SIFRE_PERIYODU,UYARI_SURESI,MIN_SIFRE_UZUNLUGU,MIN_TEXT_SAYISI,MIN_NUMERIK_SAYISI,HATALI_GIRIS_SAYISI, '+
                   'TURKCE_KARAKTER_ENGELLE,KUCUK_HARF_ENGELLE FROM PARAMETRE_SIFRE WHERE KULLANICI_ID='+ IntToStr(-1));
         qKullanici.Next;
       end;
     qKullanici.Close;
     Application.MessageBox('Tüm kullanýcýlar [TUM KULLANICILAR] kullanýcýsý ayarlarýna göre düzenlenmiþtir.', 'BÝLGÝ', mb_OK);
   end
 else
   begin
     SqlRecord('DELETE FROM PARAMETRE_SIFRE WHERE KULLANICI_ID<>'+ IntToStr(-1) +' AND KULLANICI_ID IN (SELECT KOD FROM KULLANICI_ROL WHERE ROL ='''+ cbRol.Text +''')');
     qKullanici.Close;
     qKullanici.SQL.Clear;
     qKullanici.SQL.Add('SELECT KOD FROM KULLANICI WHERE  KOD IN (SELECT KOD FROM KULLANICI_ROL WHERE ROL ='''+ cbRol.Text +''')');
     qKullanici.Open;
     qKullanici.First;
     while not qKullanici.Eof do
       begin
         SqlRecord('INSERT INTO PARAMETRE_SIFRE SELECT '+ qKullaniciKOD.AsString +',SIFRE_AKTIF,ONCEKI_SIFRE_ENGELLE,KULLANICIADI_SIFRE_FARKLI,'+
                   'TRUNC(SYSDATE),SIFRE_PERIYODU,UYARI_SURESI,MIN_SIFRE_UZUNLUGU,MIN_TEXT_SAYISI,MIN_NUMERIK_SAYISI,HATALI_GIRIS_SAYISI, '+
                   'TURKCE_KARAKTER_ENGELLE,KUCUK_HARF_ENGELLE FROM PARAMETRE_SIFRE WHERE KULLANICI_ID='+ IntToStr(-1));
         qKullanici.Next;
       end;
     qKullanici.Close;
     Application.MessageBox('Seçilen roldeki kullanýcýlar [TUM KULLANICILAR] kullanýcýsý ayarlarýna göre düzenlenmiþtir.', 'BÝLGÝ', mb_OK);
   end;
  MngQuery('');
  edArama.Text := '';
  cbArama.ItemIndex := 1;

  if cxPageControl1.ActivePage <> pgList then cxPageControl1.ActivePage := pgList;
  ActiveControl := edArama;
end;

procedure TSifreParametre_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := CaFree;
end;

end.

