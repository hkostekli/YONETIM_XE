unit RaporKullanici;

interface

uses
   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
   Grids, ComCtrls, Buttons, ExtCtrls, Db, DBAccess, Ora, OraSmart, MemDS, OraError, Gauges, DBGrids,
   AdvGrid, ReportGrid, Menus, StdCtrls, Aligrid, CheckLst, cxPC, cxControls,
   cxGraphics, cxMaskEdit, cxDropDownEdit, cxTextEdit, cxContainer, cxEdit,
   cxLabel, ActnList, cxCustomData, cxStyles, cxTL, cxCalc,cxTLExportLink,cxgridexportlink,
  cxLookAndFeelPainters, cxButtons, cxInplaceContainer, cxCheckBox, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxLookAndFeels, dxBarBuiltInMenu, cxTLdxBarBuiltInMenu, System.Actions;

type
   TRaporKullanici_Form = class(TForm)
      Pano: TPanel;
      Gauge1: TGauge;
      Label1: TLabel;
      Label2: TLabel;
      Label3: TLabel;
      Label4: TLabel;
      cxPageControl1: TcxPageControl;
    pgKriter: TcxTabSheet;
    pgRapor: TcxTabSheet;
    Panel1: TPanel;
    cxLabel4: TcxLabel;
    EdNo: TcxTextEdit;
    cxLabel1: TcxLabel;
    EdKod: TcxTextEdit;
    cxLabel2: TcxLabel;
    cb01: TcxComboBox;
    cxLabel3: TcxLabel;
    EdIsim: TcxTextEdit;
    cxLabel5: TcxLabel;
    EdUnvan: TcxTextEdit;
    cxLabel6: TcxLabel;
    EdGorev: TcxTextEdit;
    cxLabel7: TcxLabel;
    EdSatinalmacilar: TcxTextEdit;
    cxLabel8: TcxLabel;
    EdSubeler: TcxTextEdit;
    cxLabel9: TcxLabel;
    EdCariKirim: TcxTextEdit;
    cxLabel10: TcxLabel;
    cb02: TcxComboBox;
    cxLabel11: TcxLabel;
    cb03: TcxComboBox;
    ActionList1: TActionList;
    actHazirla: TAction;
    actKaydet: TAction;
    actKapat: TAction;
    actMagazalar: TAction;
    actRapor: TAction;
    actKriter: TAction;
    PopupMenu1: TPopupMenu;
    pmHazirla: TMenuItem;
    pmMagazalar: TMenuItem;
    pmKaydet: TMenuItem;
    pmKapat: TMenuItem;
    pmKriterEkran: TMenuItem;
    pmRaporEkran: TMenuItem;
    sGrid: TcxTreeList;
    Col_Magaza: TcxTreeListColumn;
    Col_No: TcxTreeListColumn;
    Col_KullaniciKod: TcxTreeListColumn;
    Col_AdiSoyadi: TcxTreeListColumn;
    Col_Satinalmaci: TcxTreeListColumn;
    Col_Unvan: TcxTreeListColumn;
    Col_Gorev: TcxTreeListColumn;
    Col_Satinalmacilar: TcxTreeListColumn;
    Col_Subeler: TcxTreeListColumn;
    Col_CariKirimlar: TcxTreeListColumn;
    Col_Rol: TcxTreeListColumn;
    Col_Aktif: TcxTreeListColumn;
    Col_ElTerminali: TcxTreeListColumn;
    Col_AnaKirim: TcxTreeListColumn;
    Col_MasrafSubeler: TcxTreeListColumn;
    LblKayitTip: TcxLabel;
    cxKayitTipi: TcxComboBox;
    btnMagazalar: TcxButton;
    btnHazirla: TcxButton;
    btnKaydet: TcxButton;
    btnKapat: TcxButton;
    cxLabel12: TcxLabel;
    cb04: TcxComboBox;
      procedure FormDestroy(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure cb01KeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
      procedure cb02KeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
      procedure cb03KeyDown(Sender: TObject; var Key: Word;
         Shift: TShiftState);
    procedure actHazirlaExecute(Sender: TObject);
    procedure actKaydetExecute(Sender: TObject);
    procedure actKapatExecute(Sender: TObject);
    procedure actMagazalarExecute(Sender: TObject);
    procedure actRaporExecute(Sender: TObject);
    procedure actKriterExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
   private

   public
    { Public declarations }
   end;

var
   RaporKullanici_Form  : TRaporKullanici_Form;

implementation

uses BlyLib, DModule, ErpMenu, MagazaSecimi;

{$R *.DFM}

var
   SubeOk                 : Boolean;          // þube seçilmediði durum
   SatinAlmaciKriter      : string;
   Satir_Sql              : string;
   Magazalar              : String;

function _MakeSQLString(S: string): string;
begin
   while Pos('*', S) > 0 do S[Pos('*', S)] := '%';
   S := #39 + S + #39;
   if Pos('%', S) > 0 then S := ' LIKE ' + S
   else S := ' = ' + S;
   _MakeSQLString := S;
end;

function SubeAdiVer(ID: Integer): string;
begin
   dmGlobal.qTmp7.Close;
   dmGlobal.qTmp7.SQL.Clear;
   dmGlobal.qTmp7.SQL.Add('SELECT UNVAN FROM KART_CARI WHERE ISYERI = ''S'' AND CARI_ID='+IntToStr(ID));
   dmGlobal.qTmp7.Open;
   Result := dmGlobal.qTmp7.FieldByName('UNVAN').AsString;
   dmGlobal.qTmp7.Close;
end;        

procedure TRaporKullanici_Form.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
end;

procedure TRaporKullanici_Form.FormCreate(Sender: TObject);
begin
   Left := ((Yonetim_Menu.Width - 220) div 2) - (Width  div 2);
   Top  := ((Yonetim_Menu.Height - 80) div 2) - (Height div 2);

   cxPageControl1.ActivePage := pgKriter;
   actMagazalar.Caption      := LoginInfo.MagazaIsmi;
   Col_Magaza.Caption.Text   := LoginInfo.MagazaIsmi;

   Magazalar := '';

   dmGlobal.qTmp.SQL.Clear;
   dmGlobal.qTmp.SQL.Add('SELECT KOD FROM SATINALMACILAR ORDER BY KOD');
   dmGlobal.qTmp.Open;
   cb01.Properties.Items.Clear;
   while not dmGlobal.qTmp.Eof do
      begin
         cb01.Properties.Items.Add(dmGlobal.qTmp.FieldByName('KOD').AsString);
         dmGlobal.qTmp.Next;
      end;
   cb01.Properties.Items.Add('');

   dmGlobal.qTmp.Close;
   dmGlobal.qTmp.SQL.Clear;
   dmGlobal.qTmp.SQL.Add('SELECT KOD FROM ROLLER WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + ' ORDER BY KOD');
   dmGlobal.qTmp.Open;
   cb02.Properties.Items.Clear;
   while not dmGlobal.qTmp.Eof do
      begin
         cb02.Properties.Items.Add(dmGlobal.qTmp.FieldByName('KOD').AsString);
         dmGlobal.qTmp.Next;
      end;
end;

procedure TRaporKullanici_Form.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure TRaporKullanici_Form.cb01KeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key in [VK_DELETE, VK_BACK]) then cb01.ItemIndex := -1;
end;

procedure TRaporKullanici_Form.cb02KeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key in [VK_DELETE, VK_BACK]) then cb02.ItemIndex := -1;
end;

procedure TRaporKullanici_Form.cb03KeyDown(Sender: TObject; var Key: Word;
   Shift: TShiftState);
begin
   if (Key in [VK_DELETE, VK_BACK]) then cb03.ItemIndex := -1;
end;

procedure TRaporKullanici_Form.actHazirlaExecute(Sender: TObject);

procedure SQLEkle(var SQLStr: string; EkSql: string);
   begin
      if SQLStr = '' then SQLStr := ' Where ' + EkSql
      else SQLStr := SQLStr + ' AND ' + EkSql;
   end;

   Function MagazaVarmi(S: String) : Boolean;
   Var
     I  : Integer;
     SS : String;
   Begin
     Result := True; //06.01.2014
     if dmGlobal.qTmp.Fieldbyname('SUBELER').AsString <> '' then
     Begin
       For I := 1 to Length(S) do
       Begin
          If S[I] <> ',' Then SS := SS + S[I];
          if (I = Length(S)) Or (S[I] = ',') then
          Begin
              if (Pos(';' + SS + ';', dmGlobal.qTmp.Fieldbyname('SUBELER').AsString) > 0) then Result := True;
              //Memo1.Lines.Add(SS);
              SS := '';
          End;
       End;
     End Else Result := True;
    End;


var
   MyStr, MyStr1     : string;
   i, k              : Integer;
   ANode             : TcxTreelistNode;
begin
   Label1.Caption := TimeToStr(Now);
   Satir_Sql := '';

   //if Magazalar <> '' then             SQLEkle(Satir_Sql, '(FIRMA IN (' + Magazalar + '))');
   if edNo.Text <> '' then             SQLEkle(Satir_Sql, _MakeManySQLString(edNo.Text, 'KULLANICI.KOD'));
   if edKod.Text <> '' then            SQLEkle(Satir_Sql, _MakeManySQLString(edKod.Text, 'LOGINNAME'));
   if edIsim.Text <> '' then           SQLEkle(Satir_Sql, _MakeManySQLString(edIsim.Text, 'ISIM'));
   if cb01.Text <> '' then             SQLEkle(Satir_Sql, _MakeManySQLString(cb01.Text, 'SATINALMACI'));
   if EdUnvan.Text <> '' then          SQLEkle(Satir_Sql, _MakeManySQLString(EdUnvan.Text, 'UNVANI'));
   if EdGorev.Text <> '' then          SQLEkle(Satir_Sql, _MakeManySQLString(EdGorev.Text, 'GOREVI'));
   if EdSatinalmacilar.Text <> '' then SQLEkle(Satir_Sql, _MakeManySQLString(EdSatinalmacilar.Text, 'SATINALMACILAR'));
   if EdSubeler.Text <> '' then        SQLEkle(Satir_Sql, _MakeManySQLString(EdSubeler.Text, 'SUBELER'));
   if EdCariKirim.Text <> '' then      SQLEkle(Satir_Sql, _MakeManySQLString(EdCariKirim.Text, 'CARILER'));
   if cb02.Text <> '' then             SQLEkle(Satir_Sql, _MakeManySQLString(cb02.Text, 'ROL'));
   if cb03.Text = 'HAYIR' then         SQLEkle(Satir_Sql, '(AKTIF=''H'')');
   if cb03.Text = 'EVET' then          SQLEkle(Satir_Sql, '(AKTIF=''E'')');
   if cb04.Text = 'HAYIR' then         SQLEkle(Satir_Sql, '(AKTIF=''H'')');
   if cb04.Text = 'EVET' then          SQLEkle(Satir_Sql, '(ELTERMINALI_KULLANIR=''E'')');

    If Not((LoginInfo.LOGINNAME = 'FATASAGUN') Or (LoginInfo.LOGINNAME = 'HARUN') Or (LoginInfo.LOGINNAME = 'AFURKAN') Or (LoginInfo.LOGINNAME = 'BULU') Or (LoginInfo.LOGINNAME = 'TUGRAL')) then
       SQLEkle(Satir_Sql, 'LOGINNAME NOT IN (''AFURKAN'',''FATASAGUN'',''HARUN'',''TUGRAL'',''BULU'')');

   dmGlobal.qTmp.Close;
   dmGlobal.qTmp.Sql.Clear;
   dmGlobal.qTmp.Sql.Add('SELECT KULLANICI.KOD,ISIM,AKTIF,FIRMA,SATINALMACI,SIFRE,GOREVI,UNVANI,LOGINNAME,SATINALMACILAR,');
   dmGlobal.qTmp.Sql.Add('SUBELER,ROL,AKTIF,INTERNALID,CARILER,ELTERMINALI_KULLANIR,ANA_KIRIM,MASRAF_SUBELER');
   dmGlobal.qTmp.Sql.Add('FROM KULLANICI INNER JOIN KULLANICI_ROL ON KULLANICI_ROL.KOD = KULLANICI.KOD AND KULLANICI_ROL.TUR = ' + #39 + LoginInfo.RolTur + #39);
   if Satir_Sql <> '' then dmGlobal.qTmp.Sql.Add(Satir_Sql);
   dmGlobal.qTmp.Sql.Add('ORDER BY ISIM');
   dmGlobal.qTmp.Open;

   SGrid.BeginUpdate;
   sGrid.Clear;
   if dmGlobal.qTmp.RecordCount > 0 then Gauge1.MaxValue := dmGlobal.qTmp.RecordCount
   else Gauge1.Visible := False;

   dmGlobal.qTmp1.Close;
   dmGlobal.qTmp1.SQL.Clear;
   dmGlobal.qTmp1.SQL.Add('SELECT CARI_ID,UNVAN FROM KART_CARI WHERE ISYERI=''S'' ORDER BY CARI_ID');
   dmGlobal.qTmp1.Open;
   while not dmGlobal.qTmp.Eof do
      begin
       If MagazaVarmi(Magazalar) then
       Begin
         Anode := sGrid.Add;
         MyStr := '';
         if dmGlobal.qTmp.Fieldbyname('FIRMA').AsInteger = 0 then ANode.Values[Col_Magaza.ItemIndex] := ''
         else ANode.Values[Col_Magaza.ItemIndex]    := SubeAdiVer(dmGlobal.qTmp.Fieldbyname('FIRMA').AsInteger);
         ANode.Values[Col_No.ItemIndex]             := dmGlobal.qTmp.Fieldbyname('KOD').AsString;
         ANode.Values[Col_KullaniciKod.ItemIndex]   := dmGlobal.qTmp.Fieldbyname('LOGINNAME').AsString;
         ANode.Values[Col_AdiSoyadi.ItemIndex]      := dmGlobal.qTmp.Fieldbyname('ISIM').AsString;
         ANode.Values[Col_Satinalmaci.ItemIndex]    := dmGlobal.qTmp.Fieldbyname('SATINALMACI').AsString;
         ANode.Values[Col_Unvan.ItemIndex]          := dmGlobal.qTmp.Fieldbyname('UNVANI').AsString;
         ANode.Values[Col_Gorev.ItemIndex]          := dmGlobal.qTmp.Fieldbyname('GOREVI').AsString;
         ANode.Values[Col_Satinalmacilar.ItemIndex] := dmGlobal.qTmp.Fieldbyname('SATINALMACILAR').AsString;

        
         if dmGlobal.qTmp.Fieldbyname('SUBELER').AsString <> '' then
            begin
               dmGlobal.qTmp1.First;
               while not dmGlobal.qTmp1.Eof do
                  if (Pos(';' + dmGlobal.qtmp1.FieldByName('CARI_ID').AsString + ';', dmGlobal.qTmp.Fieldbyname('SUBELER').AsString) > 0) then
                     begin
                        if MyStr = '' then MyStr := dmGlobal.qtmp1.FieldByName('UNVAN').AsString + ';'
                        else MyStr := MyStr + dmGlobal.qtmp1.FieldByName('UNVAN').AsString + ';';
                        dmGlobal.qtmp1.Next;
                     end else dmGlobal.qTmp1.Next;
            end;

         ANode.Values[Col_Subeler.ItemIndex]       := MyStr;
         ANode.Values[Col_CariKirimlar.ItemIndex]  := dmGlobal.qTmp.Fieldbyname('CARILER').AsString;
         ANode.Values[Col_Rol.ItemIndex]           := dmGlobal.qTmp.Fieldbyname('ROL').AsString;
         ANode.Values[Col_Aktif.ItemIndex]         := dmGlobal.qTmp.Fieldbyname('AKTIF').AsString;
         ANode.Values[Col_ElTerminali.ItemIndex]   := dmGlobal.qTmp.Fieldbyname('ELTERMINALI_KULLANIR').AsString;
         ANode.Values[Col_AnaKirim.ItemIndex]      := dmGlobal.qTmp.Fieldbyname('ANA_KIRIM').AsString;
         ANode.Values[Col_MasrafSubeler.ItemIndex] := dmGlobal.qTmp.Fieldbyname('MASRAF_SUBELER').AsString;

         Gauge1.Progress := Gauge1.Progress +1;
         dmGlobal.qTmp.Next;
       End
         Else
       Begin
         Gauge1.Progress := Gauge1.Progress +1;
         dmGlobal.qTmp.Next;
       End;
      end;

   sGrid.EndUpdate;
   cxPageControl1.ActivePage := pgRapor;
   Gauge1.Progress           := 0;
   Label2.Caption            := TimeToStr(Now);
end;

procedure TRaporKullanici_Form.actKaydetExecute(Sender: TObject);
begin
  case cxKayitTipi.ItemIndex Of
    0 : begin
          dmGlobal.SaveDialog.Filter     := 'EXCEL Dosyalarý|*.xls';
          dmGlobal.SaveDialog.FileName   := 'RaporKullanici.xls';
          dmGlobal.SaveDialog.InitialDir := ExtractFilePath(Application.ExeName)+'\Raporlar';
          if dmGlobal.SaveDialog.Execute then cxExportTLToXLSX(dmGlobal.SaveDialog.FileName, SGrid, False)
          else Exit ;
        end;
    1 : begin
          dmGlobal.SaveDialog.Filter     := 'XML Dosyalarý|*.xml';
          dmGlobal.SaveDialog.FileName   := 'RaporKullanici.xml';
          dmGlobal.SaveDialog.InitialDir := ExtractFilePath(Application.ExeName)+'\Raporlar';
          if dmGlobal.SaveDialog.Execute then cxExportTLToXML(dmGlobal.SaveDialog.FileName, SGrid)
          else Exit ;
        end;
    2 : begin
          dmGlobal.SaveDialog.Filter     := 'Text Dosyalarý|*.txt';
          dmGlobal.SaveDialog.FileName   := 'RaporKullanici.txt';
          dmGlobal.SaveDialog.InitialDir := ExtractFilePath(Application.ExeName)+'\Raporlar';
          if dmGlobal.SaveDialog.Execute then cxExportTLToText(dmGlobal.SaveDialog.FileName, SGrid)
          else Exit ;
        end;
    3 : begin
          dmGlobal.SaveDialog.Filter     := 'Html Dosyalarý|*.html';
          dmGlobal.SaveDialog.FileName   := 'RaporKullanici.html';
          dmGlobal.SaveDialog.InitialDir := ExtractFilePath(Application.ExeName)+'\Raporlar';
          if dmGlobal.SaveDialog.Execute then cxExportTLToHTML(dmGlobal.SaveDialog.FileName, SGrid, True, True)
          else Exit ;
        end;
  end;
  Application.MessageBox(PChar(DmGlobal.SaveDialog.FileName+' isimli dosya kayýt edilmiþtir.'),'Bitti',mb_OK);
end;

procedure TRaporKullanici_Form.actKapatExecute(Sender: TObject);
begin
  Close ;
end;

procedure TRaporKullanici_Form.actMagazalarExecute(Sender: TObject);
begin
  if not GetUserControl then Magazalar := GetStoreNumber
  else Magazalar := SorguMagazaSec(LoginInfo.Kod,'2',Magazalar);
end;

procedure TRaporKullanici_Form.actRaporExecute(Sender: TObject);
begin
  cxPageControl1.ActivePage := pgRapor;
end;

procedure TRaporKullanici_Form.actKriterExecute(Sender: TObject);
begin
  cxPageControl1.ActivePage := pgKriter;
end;

procedure TRaporKullanici_Form.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key = #13 then
    begin
      SendMessage(Handle, WM_NEXTDLGCTL, 0, 0);
      Key := #0;
      Exit;
    end;
end;

procedure TRaporKullanici_Form.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
   btnKapat.Left     := RaporKullanici_Form.Width - 90;
   btnHazirla.Left   := RaporKullanici_Form.Width - 168;
   btnMagazalar.Left := RaporKullanici_Form.Width - 246;
   btnKaydet.Left    := RaporKullanici_Form.Width - 324;
   cxKayitTipi.Left  := RaporKullanici_Form.Width - 410;
   LblKayitTip.Left  := RaporKullanici_Form.Width - 472;
end;

end.

