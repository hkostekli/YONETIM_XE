unit ErpMenu;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Menus, ExtCtrls, jpeg, StdCtrls, ComCtrls, cxControls, cxContainer,
  cxTreeView, dxDockPanel, dxDockControl, ImgList, dxSkinsCore,
  dxSkinsDefaultPainters, cxPC, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsdxDockControlPainter, System.ImageList,
  cxClasses, cxEdit, cxGridBandedTableView, cxTL, cxStyles, cxGridTableView;

type
   TYonetim_Menu = class(TForm)
    DockMan: TdxDockingManager;
    Enable_New: TImageList;
    Disable_New: TImageList;
    dxDockSite1: TdxDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    DockPanel: TdxDockPanel;
    MenuTree: TcxTreeView;
    Image3: TImage;
    PopupMenu1: TPopupMenu;
    Kapat1: TMenuItem;
    Style_Fis: TcxStyleRepository;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    StyleAnaGrup: TcxStyle;
    BandHeader: TcxStyle;
    ColumnHeader: TcxStyle;
    SelectionData: TcxStyle;
    StyleButce: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    cxTreeListStyleFis: TcxTreeListStyleSheet;
    cxGridTableViewStyleSatir: TcxGridTableViewStyleSheet;
    cxTreeListStyleRapor: TcxTreeListStyleSheet;
    cxGridBandedTableViewStyleSheet2: TcxGridBandedTableViewStyleSheet;
    cxTreeView1: TcxTreeView;
    Image2: TImage;
      procedure FormActivate(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuTreeDblClick(Sender: TObject);
    procedure MenuTreeKeyPress(Sender: TObject; var Key: Char);
    procedure MenuTreeChange(Sender: TObject; Node: TTreeNode);
    procedure Kapat1Click(Sender: TObject);
   private
    { Private declarations }
   private
      FHBrush: HBRUSH;
      FHBrush1: HBRUSH;
      FCover: TBitmap;
      FCover1: TBitmap;
      FNewClientInstance: TFarProc;
      FOldClientInstance: TFarProc;
      procedure NewClientWndProc(var Message: TMessage);
   protected
      procedure CreateWnd; override;
      function AltMenuKontrol(Deger: TMenuItem): Boolean;

   public
    { Public declarations }
   end;

var
   Yonetim_Menu                         : TYonetim_Menu;
   OtomatikKullanici                    : string;
   OtomatikSifre                        : string;

const
   FromColor                            : TColor = $00BCE9FE;
   ToColor                              : TColor = $0012B0FC;
   TextColor                            : TColor = clBlack;
   ShortCutColor                        : TColor = $00CA0065;

   SelectedColor                        : TColor = clHighlight;
   SelectedFontColor                    : TColor = clWindowText;
   MenuColor                            = $00BCE9FE;

implementation

uses Kullanici,  Musavir, Firma, KdvIndex, Stok,
     Muhasebe, Login, BlyLib, dModule, RaporKullanici,
     TSifreParametre, RolRapor, YetkiTanim, Rol_Genel, VersiyonYukle;

{$R *.DFM}

function TYonetim_Menu.AltMenuKontrol(Deger: TMenuItem): Boolean;
var
   sayac          : integer;
   AltMenuVar     : Boolean;
begin
   AltMenuVar := False;
   for sayac := 0 to Deger.Count - 1 do
      begin
         if Deger.Items[Sayac].Count > 0 then Deger.Items[Sayac].Visible := AltMenuKontrol(Deger.Items[Sayac]);
         if (Deger.Items[Sayac].Visible) and
            (Deger.Items[Sayac].Caption <> '-') then AltMenuVar := True;
      end;
   Result := AltMenuvar;
end;


procedure TYonetim_Menu.NewClientWndProc(var Message: TMessage);

procedure Default;
   begin
      with Message do
         Result := CallWindowProc(FOldClientInstance, ClientHandle, Msg, wParam,
            lParam);
   end;
var
   ARect                                : TRect;
   ap                                   : TPoint;
begin
   ap.X := ClientRect.Right div 244 - 1;
   ap.Y := ClientRect.Bottom div 230 - 1;

   ap.X := ap.X - 1;
   ARect := Rect(ap.x * 244, ap.y * 230, (ap.x + 1) * 244, (ap.y + 1) * 230);
   with Message do
      begin
         case Msg of
            WM_ERASEBKGND:
               begin
                  FillRect(TWMEraseBkGnd(Message).DC, ClientRect, FHBrush);
                  FillRect(TWMEraseBkGnd(Message).DC, ARect, FHBrush1);
                  Result := 1;
               end;
            else
               Default;
         end;
      end;
end;


procedure TYonetim_Menu.CreateWnd;
begin
   inherited CreateWnd;
   if (ClientHandle <> 0) then
      begin
         if NewStyleControls then
            SetWindowLong(ClientHandle, GWL_EXSTYLE, WS_EX_CLIENTEDGE or
               GetWindowLong(ClientHandle, GWL_EXSTYLE));

         FNewClientInstance := MakeObjectInstance(NewClientWndProc);
         FOldClientInstance := Pointer(GetWindowLong(ClientHandle, GWL_WNDPROC));
         SetWindowLong(ClientHandle, GWL_WNDPROC, longint(FNewClientInstance));
      end;
end;



procedure TYonetim_Menu.FormActivate(Sender: TObject);
begin

   WindowState := wsMaximized;
   Try
      MenuTree.SetFocus;
      MenuTree.Selected := MenuTree.Items[1];
      MenuTree.Selected.MakeVisible;
   Except
   End;    
end;

procedure TYonetim_Menu.FormCreate(Sender: TObject);
var
   mr                                   : TModalResult;
   LogBrush, LogBrush1                  : TLogbrush;
   i                                    : Integer;
begin
{
    FCover := TBitmap.Create;
    FCover := Image2.Picture.Bitmap;
    with LogBrush do
    begin
        lbStyle := BS_PATTERN;
        lbHatch := FCover.Handle;
    end;
    FHBrush := CreateBrushIndirect(Logbrush);

   FCover1 := TBitmap.Create;
   FCover1 := Image3.Picture.Bitmap;
   with LogBrush1 do
      begin
         lbStyle := BS_PATTERN;
         lbHatch := FCover1.Handle;
      end;
   FHBrush1 := CreateBrushIndirect(Logbrush1);
 }
   Application.CreateForm(TLogin_Service, Login_Service);
   mr := Login_Service.ShowModAl;
   HelpKeyword := Login_Service.CbSirket.Text;
   Login_Service.Destroy;
   Scaled := True;
   if mr <> mrOk then Application.Terminate
   else
      begin
       if ((UpperCase(ExtractFilePath(Application.ExeName)) <> 'C:\BELIT\') And (UpperCase(ExtractFilePath(Application.ExeName)) <> 'D:\BELIT\')) then
        If (LoginInfo.Haklar[2776] = False) Then
          If (VersiyonKontroluYapicakmi(LoginInfo.Kod) = True) Then
            begin
                Application.MessageBox('Exe gereken yerde deðil. Belit klasörüne taþýyýnýz. Bilgi eksikliði varsa Teknik destek birimini arayýnýz.', 'Hata', mb_ok);
                Application.Terminate;
                Exit;
            end;
    If Pos('BELIT', LoginInfo.OracleKullanici) > 0 Then
    Begin // BI TABLOLARI
       Try
{
          dmGlobal.QAnaBolge.Open;
          dmGlobal.QBolge.Open;
          dmGlobal.QSehir.Open;
          dmGlobal.QIlce.Open;
          dmGlobal.QTabela.Open;
          dmGlobal.QSatinalmaci.Open;
          dmGlobal.QTedarikci.Open;
}          
       Except
       End;
    End;

    if VersiyonKontroluYapicakmi(LoginInfo.Kod) then
       If ParametreDegerVer('VERSIYON_YONETIM') <> Versiyon  then
         begin
           Application.CreateForm(TfrmVersiyon, frmVersiyon);
           frmVersiyon.ShowModal;
           frmVersiyon.Free;
           Application.Terminate;
           Exit;
         end;


        dmGlobal.QPersonel.open;
        If LoginInfo.RolTur = 'P' Then
        Begin
            Yonetim_Menu.Caption   := 'IK Yönetim Modülü ' + ' FIRMA : ' + HelpKeyword + ' - [ CALISILAN SIRKET  : ' + LoginInfo.SirketIsmi + ' ]  -  ROL : ' + LoginInfo.Roller ;
            MenuTree.Items[0].Text := 'IK Yönetim Modülü';
        End
          Else
        If LoginInfo.RolTur = 'M' Then
        Begin
            Yonetim_Menu.Caption   := 'MUAYENE Yönetim Modülü ' + ' FIRMA : ' + HelpKeyword + ' - [ CALISILAN SIRKET  : ' + LoginInfo.SirketIsmi + ' ]  -  ROL : ' + LoginInfo.Roller ;
            MenuTree.Items[0].Text := 'MUAYENE Yönetim Modülü';
        End
          Else
        If LoginInfo.RolTur = 'T' Then
        Begin
            Yonetim_Menu.Caption   := 'TERMÝNAL Yönetim Modülü ' + ' FIRMA : ' + HelpKeyword + ' - [ CALISILAN SIRKET  : ' + LoginInfo.SirketIsmi + ' ]  -  ROL : ' + LoginInfo.Roller ;
            MenuTree.Items[0].Text := 'TERMÝNAL Yönetim Modülü';
        End
          Else
        If LoginInfo.RolTur = 'K' Then
        Begin
            Yonetim_Menu.Caption   := 'KÝOSK Yönetim Modülü ' + ' FIRMA : ' + HelpKeyword + ' - [ CALISILAN SIRKET  : ' + LoginInfo.SirketIsmi + ' ]  -  ROL : ' + LoginInfo.Roller ;
            MenuTree.Items[0].Text := 'KÝOSK Yönetim Modülü';
        End
          Else
        Begin
            Yonetim_Menu.Caption := 'BELÝT Yönetim Modülü ' + ' FIRMA : ' + HelpKeyword + ' - [ CALISILAN SIRKET  : ' + LoginInfo.SirketIsmi + ' ]  -  ROL : ' + LoginInfo.Roller ;
        End;

        Yonetim_Menu.Caption := Yonetim_Menu.Caption + '  -  ' + Versiyon;
        dmGlobal.qKullaniciKodu.Open;

        if LoginInfo.RolTur = '' Then LoginInfo.RolTur := 'P' ;
       
        For I := MenuTree.Items.Count - 1 Downto 0 Do
        Begin
            If (LoginInfo.RolTur[1] In ['P','M','T']) And
               (
                 ((MenuTree.Items[I].Text = 'Firma Bilgileri') And (MenuTree.Items[I].HasChildren)) Or
                 ((MenuTree.Items[I].Text = 'Pos Yönetimi') And (MenuTree.Items[I].HasChildren)) Or
                 ((MenuTree.Items[I].Text = 'Stok') And (MenuTree.Items[I].HasChildren)) Or
                 ((MenuTree.Items[I].Text = 'Finans') And (MenuTree.Items[I].HasChildren)) Or
                 ((MenuTree.Items[I].Text = 'Parametreler') And (MenuTree.Items[I].HasChildren)) Or
                 ((MenuTree.Items[I].Text = 'Muhasebe') And (MenuTree.Items[I].HasChildren))
                )
                 Then
            Begin
                If MenuTree.Items[I].HasChildren Then MenuTree.Items[I].DeleteChildren;
                MenuTree.Items[I].Delete;
            End
               Else
            If (MenuTree.Items[I].StateIndex > 0)Then
            Begin
              //If VersiyonKontroluYapicakmi(LoginInfo.Kod) Then
              Begin
                If (LoginInfo.Haklar[MenuTree.Items[I].StateIndex] = False) And (LoginInfo.Haklar[5044] = False) Then
                Begin
                    If MenuTree.Items[I].HasChildren Then MenuTree.Items[I].DeleteChildren;
                    MenuTree.Items[I].Delete;
                End;
              End;  
            End;
        End;
        For I := MenuTree.Items.Count - 1 Downto 0 Do If MenuTree.Items[I].Text = 'Yetki Tanýmlarý' Then If (VersiyonKontroluYapicakmi(LoginInfo.Kod)) And (LoginInfo.LOGINNAME <> 'AFURKAN') And (LoginInfo.LOGINNAME <> 'HARUN') And (LoginInfo.LOGINNAME <> 'TUGRAL') Then MenuTree.Items[I].Delete;
      end;

end;

procedure TYonetim_Menu.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
   if MDIChildcount > 0 then Action := caNone
   else
      begin
         if Application.MessageBox('Çýkmak istediðinizden emin misiniz?', 'DÝKKAT', mb_YesNo + mb_DefButton2) = idYes then Action := caFree
         else Action := caNone;
      end;
   dmGlobal.QPersonel.Close;      
end;

procedure TYonetim_Menu.MenuTreeDblClick(Sender: TObject);
begin
  If (MenuTree.Selected.ImageIndex <> 61) And (Not(MenuTree.Selected.HasChildren)) Then
  Begin
    MenuTree.Selected.ImageIndex    := 61;
    MenuTree.Selected.SelectedIndex := 61;

    If MenuTree.Selected.Text = 'Yetki Tanýmlarý' Then
    Begin
        If Not (VersiyonKontroluYapicakmi(LoginInfo.Kod)) Or (LoginInfo.LOGINNAME = 'AFURKAN') Or (LoginInfo.LOGINNAME = 'HARUN') Or (LoginInfo.LOGINNAME = 'TUGRAL')  Then
        Begin
            Application.CreateForm(TYetkiTanimForm,YetkiTanimForm);
            YetkiTanimForm.Tag := MenuTree.Selected.AbsoluteIndex;
        End;
    End
       Else
    If MenuTree.Selected.Text = 'Kullanýcý Tanýmlarý' Then
    Begin
        Application.CreateForm(TErp2000_Kullanicilar, Erp2000_Kullanicilar);
        Erp2000_Kullanicilar.Tag := MenuTree.Selected.AbsoluteIndex;
        Erp2000_Kullanicilar.Caption := 'Kullanýcý Tanýmlarý';
    End
       Else
    If MenuTree.Selected.Text = 'BI Kullanýcý Tanýmlarý' Then
    Begin
        Application.CreateForm(TErp2000_Kullanicilar, Erp2000_Kullanicilar);
        Erp2000_Kullanicilar.Caption := 'BI Kullanýcý Tanýmlarý';
        Erp2000_Kullanicilar.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If MenuTree.Selected.Text = 'Rol Tanýmlarý' Then
    Begin
        Application.CreateForm(TErp2000_Roller_Genel, Erp2000_Roller_Genel);
        Erp2000_Roller_Genel.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If (MenuTree.Selected.Text = 'Þifre Sistemi Ayarlarý') And (Not(YonetimIslemleriIzleyiciMod)) Then
    Begin
        Application.CreateForm(TSifreParametre_Form, SifreParametre_Form);
        SifreParametre_Form.Tag := MenuTree.Selected.AbsoluteIndex;
//        SifreParametre_Form.ShowModal;
//        SifreParametre_Form.Free;
    End
       Else
    If MenuTree.Selected.Text = 'Özet Rapor' Then
    Begin
        Application.CreateForm(TRaporKullanici_Form, RaporKullanici_Form);
        RaporKullanici_Form.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If MenuTree.Selected.Text = 'Detay Rapor' Then
    Begin
       Application.CreateForm(TRolRaporForm,RolRaporForm);
       RolRaporForm.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If (MenuTree.Selected.Text = 'Firma Tanýmý') And (Not(YonetimIslemleriIzleyiciMod)) Then
    Begin
        Application.CreateForm(TFirmaBilgileri_Form, FirmaBilgileri_Form);
        FirmaBilgileri_Form.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If (MenuTree.Selected.Text = 'Müþavir Bilgileri') And (Not(YonetimIslemleriIzleyiciMod)) Then
    Begin
        Application.CreateForm(TMusavirBilgileri_Form, MusavirBilgileri_Form);
        MusavirBilgileri_Form.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If (MenuTree.Selected.Text = 'KDV Indeksleri') And (Not(YonetimIslemleriIzleyiciMod)) Then
    Begin
        Application.CreateForm(TKdvIndexleri_Form, KdvIndexleri_Form);
        KdvIndexleri_Form.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If (MenuTree.Selected.Text = 'Stok Parametreleri') And (Not(YonetimIslemleriIzleyiciMod)) Then
    Begin
        Application.CreateForm(TStokParametreleri_Form, StokParametreleri_Form);
        StokParametreleri_Form.Tag := MenuTree.Selected.AbsoluteIndex;
    End
       Else
    If MenuTree.Selected.Text = 'Versiyon Güncelle' Then
    Begin
        Yonetim_Menu.MenuTree.Items[MenuTree.Selected.AbsoluteIndex].ImageIndex    := 200;
        Yonetim_Menu.MenuTree.Items[MenuTree.Selected.AbsoluteIndex].SelectedIndex := 201;
        Application.CreateForm(TfrmVersiyon, frmVersiyon);
        frmVersiyon.ShowModal;
        frmVersiyon.Free;
        Application.Terminate;
        Exit;
    End
       Else
    If MenuTree.Selected.Text = 'Çalýþma Sonu' Then Yonetim_Menu.Close;
    Abort;
  End
     Else
  If MenuTree.Selected.HasChildren Then
  Begin
     If Sender = Nil Then
     Begin
         MenuTree.Selected.MakeVisible;
         If MenuTree.Selected.Expanded Then MenuTree.Selected.Collapse(True)
                                       Else MenuTree.Selected.Expand(True);
     End;
  End;
end;

procedure TYonetim_Menu.MenuTreeKeyPress(Sender: TObject; var Key: Char);
begin
    If Key = #13 Then
        MenuTreeDblClick(nil);
end;

procedure TYonetim_Menu.MenuTreeChange(Sender: TObject; Node: TTreeNode);
begin
    MenuTree.Selected := Node;
end;

procedure TYonetim_Menu.Kapat1Click(Sender: TObject);
begin
    Close;
end;

end.



