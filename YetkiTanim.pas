unit YetkiTanim;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, Ora, OraSmart, MemDS, OraError, DB, cxGraphics, cxCustomData, cxStyles, cxTL,
  cxControls, cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCalendar,
  dxBarExtItems, dxBar, cxClasses, ActnList, ImgList, Menus, cxRadioGroup,
  cxBarEditItem, cxTextEdit, ExtCtrls, cxContainer, cxEdit, cxDBEdit,
  Grids, DBGrids, cxGridTableView, cxHeader, ADODB, SqlExpr,
  cxCheckComboBox, cxCheckListBox, cxPC, cxCheckBox, dxSkinsCore,
  dxSkinsDefaultPainters, StdCtrls, cxLookAndFeels,
  cxLookAndFeelPainters, cxTLdxBarBuiltInMenu, dxSkinsdxBarPainter,
  System.Actions, System.ImageList;

type
  TYetkiTanimForm = class(TForm)
    qRol: TOraQuery;
    dRol: TDataSource;
    uRol: TOraUpdateSQL;
    PopupMenu1: TPopupMenu;
    PmEkle: TMenuItem;
    PmDegistirr: TMenuItem;
    PmSill: TMenuItem;
    PmKaydett: TMenuItem;
    PmVazgecc: TMenuItem;
    N5: TMenuItem;
    pmKapatt: TMenuItem;
    ShowPopUp1: TMenuItem;
    Enable_New: TImageList;
    Disable_New: TImageList;
    Artist: TActionList;
    YeniEkle: TAction;
    YeniDegistir: TAction;
    YeniSil: TAction;
    YeniKaydet: TAction;
    YeniVazgec: TAction;
    YeniIlk: TAction;
    YeniGeri: TAction;
    YeniIleri: TAction;
    YeniSon: TAction;
    YeniKapat: TAction;
    dxBar: TdxBarManager;
    dxBarBar1: TdxBar;
    dxEkle: TdxBarButton;
    dxIlk: TdxBarButton;
    dxFiyat: TdxBarButton;
    dxSil: TdxBarButton;
    dxKapat: TdxBarButton;
    dxBarButton1: TdxBarButton;
    dxBarStatic1: TdxBarStatic;
    YeniYetki: TAction;
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    dxBarCombo1: TdxBarCombo;
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
    DetayGridHeader: TcxStyle;
    DetayBackRound: TcxStyle;
    DetayGridSatirKoyu: TcxStyle;
    DetayGridSatirAcik: TcxStyle;
    DetaySatirSecme: TcxStyle;
    Detay1Header: TcxStyle;
    Detay1BackRound: TcxStyle;
    Detay1SatirKoyu: TcxStyle;
    Detay1SatirAcik: TcxStyle;
    Detay1SatirSecme: TcxStyle;
    GridSatirAcik: TcxStyle;
    GridSatirKoyu: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxCheckListBox1: TcxCheckListBox;
    cxHeader1: TcxHeader;
    Tree: TcxDBTreeList;
    cxDBTreeList1YETKI_ACIKLAMA: TcxDBTreeListColumn;
    YETKI_NO: TcxDBTreeListColumn;
    PARENT_ID: TcxDBTreeListColumn;
    ID: TcxDBTreeListColumn;
    CxSirketler: TcxCheckListBox;
    cxHeader2: TcxHeader;
    cxCheckBox1: TcxCheckBox;
    qRolID: TFloatField;
    qRolPARENT_ID: TFloatField;
    qRolYETKI_NO: TIntegerField;
    qRolYETKI_ACIKLAMA: TStringField;
    qRolTUR: TStringField;
    qRolSDY: TIntegerField;
    qRolSDT: TDateTimeField;
    Panel1: TPanel;
    Label1: TLabel;
    EdArama: TEdit;
    procedure qRolAfterPost(DataSet: TDataSet);
    procedure qRolAfterDelete(DataSet: TDataSet);
    procedure YeniDegistirExecute(Sender: TObject);
    procedure qRolAfterInsert(DataSet: TDataSet);
    procedure qRolAfterScroll(DataSet: TDataSet);
    procedure YeniVazgecExecute(Sender: TObject);
    procedure YeniSilExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure YeniEkleExecute(Sender: TObject);
    procedure qRolBeforePost(DataSet: TDataSet);
    procedure YeniKapatExecute(Sender: TObject);
    procedure qRolBeforeCancel(DataSet: TDataSet);
    procedure YeniKaydetExecute(Sender: TObject);
    procedure qRolBeforeOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure TreeCustomDrawCell(Sender: TObject; ACanvas: TcxCanvas;
      AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
    procedure qRolBeforeInsert(DataSet: TDataSet);
    procedure qRolBeforeEdit(DataSet: TDataSet);
    procedure qRolBeforeDelete(DataSet: TDataSet);
    procedure qRolAfterCancel(DataSet: TDataSet);
    procedure dRolStateChange(Sender: TObject);
    procedure EdAramaKeyPress(Sender: TObject; var Key: Char);
    procedure TreeNodeChanged(Sender: TcxCustomTreeList; ANode: TcxTreeListNode;
      AColumn: TcxTreeListColumn);
    procedure TreeCustomDrawDataCell(Sender: TcxCustomTreeList;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
    Function UzakVTBaglan(VT,TNS : String):Boolean;
    Function NumaraAlma : Integer;

  public
    { Public declarations }
  end;

var
  YetkiTanimForm: TYetkiTanimForm;

implementation
Uses DModule,BlyLib, ErpMenu;

{$R *.dfm}

var
  ParentNodee  : LongInt;
  FocusedNodee : TcxTreeListNode;
  DosyaKonumu : TDataSetState;



Function TYetkiTanimForm.UzakVTBaglan(VT,TNS : String):Boolean;
Begin
    DmGlobal.Connection1.Connected := False;
    Try
{
      // Önce Belit Defaulttan þifreyi al.
      ShowMessage('1');
      DmGlobal.Connection.ConnectionString := 'Provider=MSDAORA.1;Password=manyak-misinn1esin;User ID=BELIT_DEFAULT;Data Source=(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)' +
                                              '(HOST = yavuz-scan.adese.com.tr)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = ORCL)));Persist Security Info=True';
      //DmGlobal.Connection.ConnectionString := 'Provider=MSDAORA.1;Password=manyak-misinn1esin;User ID=BELIT_DEFAULT;Data Source=' + TNS + ';Persist Security Info=True';
      DmGlobal.Connection.Connected        := True;
      ShowMessage('2');
      If DmGlobal.AQTmp.Active Then DmGlobal.AQTmp.Close;
      DmGlobal.AQTmp.Close;
      DmGlobal.AQTmp.SQL.Clear;
      DmGlobal.AQTmp.SQL.Add('SELECT FK_ID,SIRA,ID001,ID002,ID003 FROM SYS_DEF0004ID WHERE ID001 = ' + #39 + VT +#39 + ' AND STATUS=''E'' ORDER BY FK_ID,SIRA');
      DmGlobal.AQTmp.Open;
      DmGlobal.AQTmp.First;
      DmGlobal.AQTmp.Filter := DmGlobal.AQTmp.FieldByName('ID002').AsString;
      DmGlobal.AQTmp.Close;
      DmGlobal.Connection.Connected := False;
      ShowMessage('3');
      DmGlobal.Connection.ConnectionString := 'Provider=MSDAORA.1;Password=' + DmGlobal.AQTmp.Filter + ';User ID='+VT+';Data Source=(DESCRIPTION =(ADDRESS = (PROTOCOL = TCP)(HOST = yavuz-scan.adese.com.tr)(PORT = 1521)) (CONNECT_DATA = (SERVER = DEDICATED) (SERVICE_NAME = ORCL)));Persist Security Info=True';
      //DmGlobal.Connection.ConnectionString := 'Provider=MSDAORA.1;Password=' + DmGlobal.AQTmp.Filter + ';User ID='+VT+';Data Source=' + TNS + ';Persist Security Info=True';
      DmGlobal.AQTmp.Filter := '';
}
      DmGlobal.Connection1.Connected        := True;
      Result    := True;
   except
      Result    := False;
   end;
End;


Function TYetkiTanimForm.NumaraAlma : Integer;
Begin
    Try
       UzakVTBaglan('BELIT2010','ADESENNN.WORLD');
{
       If LoginInfo.RolTur = 'P' Then SQLList_A(DmGlobal.AQTmp,'SELECT NVL((SELECT NVL(DEGER,''1'') FROM PARAMETRELER_YENI WHERE PARAMETRE = ''YETKI_NO_IK''),''1'') + 1 AS DEGER FROM DUAL')
                                 Else SQLList_A(DmGlobal.AQTmp,'SELECT NVL((SELECT NVL(DEGER,''1'') FROM PARAMETRELER_YENI WHERE PARAMETRE = ''YETKI_NO_BELIT''),''1'') + 1 AS DEGER FROM DUAL');
}
       SQLList(DmGlobal.QTmpNo,'SELECT NVL((SELECT NVL(DEGER,''1'') FROM BELIT2010.PARAMETRELER_YENI WHERE PARAMETRE = ''YETKI_NO_BELIT''),''1'') + 1 AS DEGER FROM DUAL');
       Result := DmGlobal.QTmpNo.FieldByName('DEGER').AsInteger;
    Except
       Application.MessageBox('Baðlantýda sorunla karþýlaþýldý iþlem iptal edildi...', 'Dikkat', MB_OK);
       Result := -1;
    End;
End;

procedure TYetkiTanimForm.qRolAfterPost(DataSet: TDataSet);
begin
 dmGlobal.dbGlobal.StartTransaction;
 try
  QRol.ApplyUpdates;
  dmGlobal.dbGlobal.Commit;
  QRol.CommitUpdates;
 except on E:Exception do
   begin
     dmGlobal.dbGlobal.Rollback;
     MessageDlg('Kayýt iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi !'+e.message, mtError, [mbOK], 0);
     exit;
   end;
 End;
{
   If (LoginInfo.RolTur = 'P') And (DosyaKonumu = DsInsert) Then
   Begin
       SQLRecord_A('UPDATE PARAMETRELER_YENI SET DEGER = (SELECT NVL((SELECT TO_CHAR(MAX(YETKI_NO)) FROM TANIM_YETKI WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + '),''1'') FROM DUAL) ' +
              ' WHERE PARAMETRE = ''YETKI_NO_IK''')
   End
      Else
}
    QRol.Locate('ID', IntToStr(ParentNodee), [loPartialKey]);
end;

procedure TYetkiTanimForm.qRolAfterDelete(DataSet: TDataSet);
begin
 dmGlobal.dbGlobal.StartTransaction;
 try
  QRol.ApplyUpdates;
  dmGlobal.dbGlobal.Commit;
  QRol.CommitUpdates;

 except on E:Exception do
   begin
     dmGlobal.dbGlobal.Rollback;
     MessageDlg('Silme iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi !'+e.message, mtError, [mbOK], 0);
     exit;
   end;
 End;
{
   If LoginInfo.RolTur = 'P' Then SQLRecord('UPDATE PARAMETRELER_YENI SET DEGER = (SELECT NVL((SELECT TO_CHAR(MAX(YETKI_NO)) FROM TANIM_YETKI WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + '),''1'') FROM DUAL) ' +
              ' WHERE PARAMETRE = ''YETKI_NO_IK''')
     Else
   SQLRecord('UPDATE PARAMETRELER_YENI SET DEGER = (SELECT NVL((SELECT TO_CHAR(MAX(YETKI_NO)) FROM TANIM_YETKI WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + '),''1'') FROM DUAL) ' +
              ' WHERE PARAMETRE = ''YETKI_NO_BELIT''');
}

    QRol.Locate('ID', IntToStr(ParentNodee), [loPartialKey]);

end;

procedure TYetkiTanimForm.YeniDegistirExecute(Sender: TObject);
begin
    QRol.Edit;
end;

procedure TYetkiTanimForm.qRolAfterInsert(DataSet: TDataSet);
begin
    qRolPARENT_ID.AsString := Tree.Hint;
    SQLList(DmGlobal.QTmp,'SELECT SQ_TANIM_YETKI.NEXTVAL AS NO FROM DUAL');
    qRolID.AsString := DmGlobal.QTmp.FieldByName('NO').AsString;
    qRolTUR.AsString := LoginInfo.RolTur;
    If dxBarCombo1.ItemIndex = 0 Then  qRolPARENT_ID.AsString := '0';

    If (dxBarCombo1.ItemIndex = 0) Or (dxBarCombo1.ItemIndex = 1) Then
    Begin
        qRolYETKI_NO.AsString := '0';
        YETKI_NO.Options.Editing := False;
    End
       Else
    Begin
{
        If LoginInfo.RolTur = 'P' Then SQLList(DmGlobal.QTmp,'SELECT NVL((SELECT NVL(DEGER,''1'') FROM PARAMETRELER_YENI WHERE PARAMETRE = ''YETKI_NO_IK''),''1'') + 1 AS DEGER FROM DUAL')
                                  Else SQLList(DmGlobal.QTmp,'SELECT NVL((SELECT NVL(DEGER,''1'') FROM PARAMETRELER_YENI WHERE PARAMETRE = ''YETKI_NO_BELIT''),''1'') + 1 AS DEGER FROM DUAL');
}

        qRolYETKI_NO.AsInteger := NumaraAlma; //DmGlobal.QTmp.FieldByName('DEGER').AsString;
        YETKI_NO.Options.Editing := True;
    End;
    ActiveControl      := Tree;
    Tree.FocusedColumn := cxDBTreeList1YETKI_ACIKLAMA;

end;

procedure TYetkiTanimForm.qRolAfterScroll(DataSet: TDataSet);
begin
    dxBarCombo1.Enabled  := Not(QRol.State In [DsEdit,DsInsert]);
    YeniEkle.Enabled     := Not(QRol.State In [DsEdit,DsInsert]);
    YeniYetki.Enabled    := Not(QRol.State In [DsEdit,DsInsert]);
    YeniDegistir.Enabled := Not(QRol.State In [DsEdit,DsInsert]) And (qRolID.AsString <> '');
    YeniKaydet.Enabled   := QRol.State In [DsEdit,DsInsert];
    YeniVazgec.Enabled   := QRol.State In [DsEdit,DsInsert];
    YeniSil.Enabled      := Not(QRol.State In [DsEdit,DsInsert]);
    YeniKapat.Enabled    := Not(QRol.State In [DsEdit,DsInsert]);
    Tree.OptionsData.Inserting := Not(YeniEkle.Enabled);
    Tree.OptionsData.Editing   := Not(YeniDegistir.Enabled);
    dxBarCombo1.Enabled  := Not(QRol.State In [DsEdit,DsInsert]);
    YETKI_NO.Options.Editing  := (QRol.State In [DsInsert]) And (Pos('Grup',dxBarCombo1.Text) < 1 ); 
end;

procedure TYetkiTanimForm.YeniVazgecExecute(Sender: TObject);
begin
    QRol.Cancel;
end;

procedure TYetkiTanimForm.YeniSilExecute(Sender: TObject);
begin
    If Tree.FocusedNode.HasChildren Then
    Begin
        Application.MessageBox('Alt Grup veya yetkileri silmeden bu kaydý silemezsiniz...','DÝKKAT !',mb_OK);
        Abort;
    End;
    If Application.MessageBox('Kayýt Silinecektir . Onaylýyormusunuz ?','Dikkat !',Mb_YesNo) = idYes Then QRol.Delete;
end;

procedure TYetkiTanimForm.FormCreate(Sender: TObject);
begin
    YeniEkle.Visible      := Not(YonetimIslemleriIzleyiciMod);
    YeniDegistir.Visible  := Not(YonetimIslemleriIzleyiciMod);
    YeniSil.Visible       := Not(YonetimIslemleriIzleyiciMod);
    YeniKaydet.Visible    := Not(YonetimIslemleriIzleyiciMod);
    YeniVazgec.Visible    := Not(YonetimIslemleriIzleyiciMod);

    QRol.open;
    Tree.FullCollapse;
end;

procedure TYetkiTanimForm.YeniEkleExecute(Sender: TObject);
begin
    Tree.Hint := qRolID.Text;
    QRol.Insert;
end;

procedure TYetkiTanimForm.qRolBeforePost(DataSet: TDataSet);
begin
    DosyaKonumu := DataSet.State;
    If (qRolParent_Id.AsString = '') And (QRol.RecordCount = 0)then qRolParent_Id.AsString := '0';

    If qRolParent_Id.AsString = '' Then
    Begin
        Application.MessageBox('Üst yetki boþ býrakýlmýþ. Ýþlem iptal edildi','DÝKKAT !',mb_OK);
        Abort;
    End;

    If qRolYETKI_ACIKLAMA.AsString = '' Then
    Begin
        Application.MessageBox('Yetki açýklama iþlemi boþ býrakýlmýþ. Ýþlem iptal edildi','DÝKKAT !',mb_OK);
        Abort;
    End;

    If (dxBarCombo1.Text = 'Yetki') And ((qRolYETKI_NO.AsString = '0') Or (qRolYETKI_NO.AsString = '')) Then
    Begin
        Application.MessageBox('Yetki Numarasý verilmemiþ iþlem iptal edildi.','DÝKKAT !',mb_OK);
        Abort;
    End;
    
    If (Qrol.State = DsInsert) And (Pos('Grup',dxBarCombo1.Text) < 1 ) Then
    Begin
        SQLList(DmGlobal.QTmp,'SELECT NVL((SELECT YETKI_NO FROM TANIM_YETKI WHERE TUR = ' +#39 + LoginInfo.RolTur + #39 + ' AND ROWNUM = 1 AND YETKI_NO > 0 AND YETKI_NO = ' + QRolYetki_No.AsString + '),0) AS DURUM FROM DUAL');
        If qRolYETKI_NO.AsString = DmGlobal.QTmp.FieldByName('DURUM').AsString Then
        Begin                                                                                                                                                        
             Application.MessageBox('Ayný yetki numarasý daha önceden verilmiþ ! Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
             Abort;
        End;
    End;
    qRolSDY.AsString := LoginInfo.Kod;
    QrolSDT.Value    := Now;

    If Application.MessageBox('Yapýlan iþlem kaydedilecektir. Onaylýyormusunuz ?','Dikkat !',Mb_YesNo) = idNo Then Abort;
    Tree.HelpKeyword := qRolID.AsString;
    FocusedNodee := Tree.FocusedNode;

    If (QRol.State = DsInsert) And (CxCheckBox1.Checked) Then
    Begin
        If UzakVTBaglan('BELIT2010','OWG8.WORLD') Then
        Begin
            SQLRecord_Ortak('UPDATE PARAMETRELER_YENI SET DEGER = ' + qRolYETKI_NO.AsString + ' WHERE DEGER < ' + qRolYETKI_NO.AsString + ' AND   PARAMETRE = ''YETKI_NO_BELIT''');
            //If LoginInfo.RolTur = 'P' Then SQLRecord_A('UPDATE PARAMETRELER_YENI SET DEGER = ' + qRolYETKI_NO.AsString + ' WHERE DEGER < ' + qRolYETKI_NO.AsString + ' AND   PARAMETRE = ''YETKI_NO_IK''')
            //                          Else SQLRecord_A('UPDATE PARAMETRELER_YENI SET DEGER = ' + qRolYETKI_NO.AsString + ' WHERE DEGER < ' + qRolYETKI_NO.AsString + ' AND   PARAMETRE = ''YETKI_NO_BELIT''');
        End Else Application.MessageBox('Yetki Numarasý merkeze güncellenemedi. Manuel update yapýnýz.', 'Dikkat', MB_OK);
    End;
end;

procedure TYetkiTanimForm.YeniKapatExecute(Sender: TObject);
begin
    Close;
end;

procedure TYetkiTanimForm.qRolBeforeCancel(DataSet: TDataSet);
begin
    If Application.MessageBox('Yapýlan iþlemden vazgeçilecektir. Onaylýyormusunuz ?','Dikkat !',Mb_YesNo) = idNo Then Abort;
end;

procedure TYetkiTanimForm.YeniKaydetExecute(Sender: TObject);
begin
    QRol.Post;
end;

procedure TYetkiTanimForm.qRolBeforeOpen(DataSet: TDataSet);
begin
    qRol.ParamByName('RT').AsString := LoginInfo.RolTur;
end;

procedure TYetkiTanimForm.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
end;

procedure TYetkiTanimForm.EdAramaKeyPress(Sender: TObject; var Key: Char);
begin
    if Key = #13 then
    Begin
        QRol.Locate('YETKI_NO',EdArama.Text,[loCaseInsensitive]);
        edArama.SelStart                  := 0;
        edArama.SelLength                 := Length(edArama.Text);
        edArama.SetFocus;
        Abort;
    End;
End;

procedure TYetkiTanimForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    If DmGlobal.Connection.Connected Then DmGlobal.Connection.Connected := True;
    Action := CaFree;
end;

procedure TYetkiTanimForm.FormShow(Sender: TObject);
begin
    Left := ((Yonetim_Menu.Width - 220) div 2) - (Width  div 2);
    Top  := ((Yonetim_Menu.Height - 80) div 2) - (Height div 2);
    Tree.SetFocus;
end;

procedure TYetkiTanimForm.TreeCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
  Var
    S : String;
begin
    If (AViewInfo.DisplayValue <> '0') And (AViewInfo.Column.ItemIndex = 1) Then
       If AViewInfo.Selected Then ACanvas.Font.Color := ClWhite
                             Else ACanvas.Font.Color := ClRed;
end;

procedure TYetkiTanimForm.TreeCustomDrawDataCell(Sender: TcxCustomTreeList;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
    If (AViewInfo.DisplayValue <> '0') And (AViewInfo.Column.ItemIndex = 1) Then
       If AViewInfo.Selected Then ACanvas.Font.Color := ClWhite
                             Else ACanvas.Font.Color := ClRed;
end;

procedure TYetkiTanimForm.TreeNodeChanged(Sender: TcxCustomTreeList;
  ANode: TcxTreeListNode; AColumn: TcxTreeListColumn);
begin
   // Tree.Select(ANode);
end;

procedure TYetkiTanimForm.qRolBeforeInsert(DataSet: TDataSet);
begin
    Tree.Hint := qRolID.Text;
    If Tree.FocusedNode <> Nil Then ParentNodee  := Tree.FocusedNode.Values[ID.ItemIndex];
end;

procedure TYetkiTanimForm.qRolBeforeEdit(DataSet: TDataSet);
begin
    ParentNodee  := Tree.FocusedNode.Values[ID.ItemIndex];
end;

procedure TYetkiTanimForm.qRolBeforeDelete(DataSet: TDataSet);
begin
    ParentNodee  := Tree.FocusedNode.Values[PARENT_ID.ItemIndex];
end;

procedure TYetkiTanimForm.qRolAfterCancel(DataSet: TDataSet);
begin
//    Tree.FocusedNode := FocusedNodee;
end;

procedure TYetkiTanimForm.dRolStateChange(Sender: TObject);
begin
   qRolAfterScroll(QRol);
end;

end.
