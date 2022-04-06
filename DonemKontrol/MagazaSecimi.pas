unit MagazaSecimi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, Menus, cxLookAndFeelPainters, StdCtrls,
  cxButtons, cxControls, cxContainer, cxEdit, cxGroupBox, cxGraphics,
  CheckLst, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckBox,
  cxCustomData, cxStyles, cxTL, cxInplaceContainer, DB, DBAccess, Ora, OraSmart, MemDS, OraError,
  cxGridTableView, cxClasses, SQLMemMain, ActnList, cxLabel, dxSkinsCore,
  dxSkinsDefaultPainters, cxLookAndFeels, cxTLdxBarBuiltInMenu, System.Actions;

type
  TMagazaSecForm = class(TForm)
    cxGroupBox2: TcxGroupBox;
    btnOk: TcxButton;
    btnCancel: TcxButton;
    qTmp: TOraQuery;
    StyleList: TcxStyleRepository;
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
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    stBandHeader: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    GroupStyle1: TcxStyle;
    GroupStyle2: TcxStyle;
    GroupStyle3: TcxStyle;
    GroupStyle4: TcxStyle;
    GroupStyle5: TcxStyle;
    LineStyle1: TcxStyle;
    LineStyle2: TcxStyle;
    LineStyle3: TcxStyle;
    LineStyle4: TcxStyle;
    LineStyle5: TcxStyle;
    TreeListStyleDevEx: TcxTreeListStyleSheet;
    GridStyleDevEx: TcxGridTableViewStyleSheet;
    DataGrid: TcxTreeList;
    Col_KirimSec: TcxTreeListColumn;
    Col_Kirim: TcxTreeListColumn;
    Col_KirimAciklama: TcxTreeListColumn;
    Col_Bos: TcxTreeListColumn;
    KirimSec: TSQLMemTable;
    KirimUst: TSQLMemTable;
    qTmpUst: TOraQuery;
    cxLabel1: TcxLabel;
    edAranan: TcxTextEdit;
    ActionList1: TActionList;
    actTamam: TAction;
    pMenu: TPopupMenu;
    ppmTamam: TMenuItem;
    actVazgec: TAction;
    actBul: TAction;
    ppmIptal: TMenuItem;
    ppmBul: TMenuItem;
    actTumunuSec: TAction;
    actTumunuKaldir: TAction;
    mnSe1: TMenuItem;
    mnKaldr1: TMenuItem;
    qMagaza: TSQLMemQuery;
    cxBul: TcxButton;
    procedure DataGridEditing(Sender: TObject; AColumn: TcxTreeListColumn;
      var Allow: Boolean);
    procedure Col_KirimSecPropertiesEditValueChanged(Sender: TObject);
    procedure actTamamExecute(Sender: TObject);
    procedure actVazgecExecute(Sender: TObject);
    procedure actBulExecute(Sender: TObject);
    procedure actTumunuSecExecute(Sender: TObject);
    procedure actTumunuKaldirExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DataGridStylesGetContentStyle(Sender, AItem: TObject;
      ANode: TcxTreeListNode; var AStyle: TcxStyle);
  private
     procedure StoreState(LoginId,Firmalar,Magazalar : String);
     procedure Preview;
  public
  end;

var
  MagazaSecForm: TMagazaSecForm;

function SorguMagazaSec(xLogID,xLogTip,xSec: String):String;


implementation

{$R *.dfm}
uses BlyLib, DModule, ErpMenu;

var
  MagazaSayisi,
  SonSayac  : Integer;
  CanReturn ,
  LogId     ,
  LogTip    ,
  LogSec    ,
  SonAranan ,
  AraDeger  ,
  AnaKirim  ,
  RoluNeBuArkadasin,
  MagNo     : String;




function SorguMagazaSec(xLogID,xLogTip,xSec: String):String;
begin
  CanReturn := '';
  LogId     := xLogId;
  LogTip    := xLogTip;
  LogSec    := xSec;
  If LogId = '9999' Then
  Begin
      SQLList(DmGlobal.QTmp2,'SELECT ROL FROM KULLANICI_ROL WHERE ROWNUM = 1 AND KOD = 9999 AND TUR <> ''P''');
      If DmGlobal.QTmp2.FieldByName('ROL').AsString = '' Then RoluNeBuArkadasin := LoginInfo.Roller
                                                         Else RoluNeBuArkadasin := DmGlobal.QTmp2.FieldByName('ROL').AsString;
  End Else RoluNeBuArkadasin := LoginInfo.Roller;

  MagazaSecForm := TMagazaSecForm.Create(Application);
  MagazaSecForm.Caption := LoginInfo.MagazaIsmi + ' Se�';
  MagazaSecForm.ShowModal;
  MagazaSecForm.Free;
  Result := CanReturn;
end;




procedure TMagazaSecForm.DataGridEditing(Sender: TObject;
  AColumn: TcxTreeListColumn; var Allow: Boolean);
begin
  if AColumn.Tag in [3] then
     begin
       Allow := False;
       Exit;
     end;

end;

procedure TMagazaSecForm.Col_KirimSecPropertiesEditValueChanged(
  Sender: TObject);
var
  aNode : TcxTreeListNode;

  procedure CheckPosition(ANode:TcxTreeListNode);
  begin
    while anode <> nil do
      begin
        if aNode.HasChildren then CheckPosition(ANode.getFirstChild);
        aNode.Values[col_Kirimsec.itemIndex] := TcxCheckBox(Sender).EditValue;
        aNode := aNode.getNextSibling;
      end;
  end;

begin
  aNode := DataGrid.FocusedNode;
  if aNode.HasChildren then CheckPosition(ANode.getFirstChild);
end;

procedure TMagazaSecForm.actTamamExecute(Sender: TObject);
var
  i        : Integer;
  TableName,
  SqlEkle  : String;
    procedure CheckEkle( MyStr : String);
      begin
       if  SqlEkle = '' then SqlEkle := MyStr +','
       else SqlEkle := SqlEkle + MyStr + ',';
      end;
begin
  SqlEkle            := '';
  TableName          := 'Bos_'+FormatDateTime('YYYYMMDDHH24MMNN',now);
  KirimSec.Close;
  KirimSec.TableName := TableName;
  KirimSec.CreateTable;
  KirimSec.Open;

  for i := 0 to DataGrid.Count - 1 do
    begin
       if ( DataGrid.AbsoluteItems[i].Values[Col_KirimSec.ItemIndex])  and
          ( VarToInt(DataGrid.AbsoluteItems[i].Values[Col_Bos.ItemIndex])>0) then
            begin
                KirimSec.Insert;
                KirimSec.FieldByName('BOS').AsString := VarToStr(DataGrid.AbsoluteItems[i].Values[Col_Bos.ItemIndex]);
                KirimSec.Post;
            end;
    end;

  qMagaza.Close;
  qMagaza.Sql.Clear;
  qMagaza.Sql.Add('SELECT BOS FROM '+TableName + ' ORDER BY BOS');
  qMagaza.Open;
  qMagaza.First;

  while not qMagaza.Eof do
    begin
       CheckEkle(qMagaza.FieldByName('BOS').AsString);
       qMagaza.Next;
    end;

  Delete(SqlEkle, Length(SqlEkle), 1);
  CanReturn := SqlEkle;
  Close;
end;

procedure TMagazaSecForm.actVazgecExecute(Sender: TObject);
begin
  CanReturn := '';
  Close;                                                                  
end;

procedure TMagazaSecForm.actBulExecute(Sender: TObject);
var
  i : Integer;
  Found   : Boolean;
  Aranan  : String;
  TempStr : String;
begin
  DataGrid.FullExpand;
  DataGrid.FocusedNode := DataGrid.AbsoluteItems[0];;
  DataGrid.SetFocus;
  Found := False;

  if ( SonAranan = '') or
     ( EdAranan.Text <> SonAranan )then SonSayac := -1;

  for i := SonSayac + 1 to DataGrid.Count - 1 do
    begin
        Aranan := EdAranan.Text;
        TempStr := VarToStr(DataGrid.AbsoluteItems[i].Values[Col_KirimAciklama.ItemIndex]);
        if Pos(Aranan, TempStr) > 0 then
           begin
             DataGrid.FocusedNode := DataGrid.AbsoluteItems[i];
             DataGrid.FocusedColumn := Col_KirimAciklama;
             SonSayac := i;
             Break;
           end;
    end;
  SonAranan := EdAranan.Text;
end;

procedure TMagazaSecForm.actTumunuSecExecute(Sender: TObject);
var
 i : Integer;
begin
  DataGrid.BeginUpdate;
  for i := 0 to DataGrid.Count -1   do DataGrid.AbsoluteItems[i].Values[Col_KirimSec.ItemIndex] := True;
  DataGrid.EndUpdate;
end;

procedure TMagazaSecForm.actTumunuKaldirExecute(Sender: TObject);
var
 i : Integer;
begin
  DataGrid.BeginUpdate;
  for i := 0 to DataGrid.Count -1   do DataGrid.AbsoluteItems[i].Values[Col_KirimSec.ItemIndex] := False;
  DataGrid.EndUpdate;
end;

procedure TMagazaSecForm.FormCreate(Sender: TObject);
var
 Subeler : String;
begin
//  StoreState(LoginInfo.Kod,IntToStr(LoginInfo.SubeKod),LoginInfo.Subeler);
  if LogId = '9999' then Subeler := ''
  else Subeler := LoginInfo.Subeler;
  StoreState(LogId,IntToStr(LoginInfo.SubeKod),Subeler);
  Preview;
end;


procedure TMagazaSecForm.StoreState(LoginId,Firmalar,Magazalar : String);
var
  KartCari      ,
  BolgeStore    ,
  MagazaCount   : Integer;

  SqlYukle      ,
  InsertStore   ,
  DeleteStore   ,
  KirimAciklama : String;

  procedure SqlEkle(Str,Tip : String);
    begin
      if SqlYukle = '' then sqlYukle := Str + Tip
      else sqlYukle := SqlYukle + Str + Tip;
      inc(MagazaSayisi)
    end;


  function GetPart(var PStr: String): String;
    begin
      if PStr = '' then begin Result:=''; Exit; end;
      if Pos(';',PStr) > 0 then
        begin
          Result := Copy(PStr,1,Pos(';',PStr)-1);
          Delete(PStr,1,Pos(';',PStr));
        end
      else
        begin
          Result := Copy(PStr,1,100);
          PStr := '';
        end;
    end;


begin
  qTmp.Close;
  qTmp.Sql.Clear;
  qTmp.Sql.Add('select deger2,deger3 from parametreler_yeni where parametre=''MAGAZAGRUPTANIMLAMA''');
  qTmp.Open;
  AnaKirim      := qTmp.FieldByName('DEGER2').AsString;
  KirimAciklama := qTmp.FieldByName('DEGER3').AsString;
  MagazaSayisi := 0;
  if AnaKirim = '' then
     begin
        Application.MessageBox('Parametre bilgileri eksik','Bilgi',mb_ok);
        exit;
     end
  else
     begin
        qTmp.Close;
        qTmp.Sql.Clear;
        qTmp.Sql.Add('SELECT COUNT(*) FROM BOLGE_TANIMI where  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND LOGINID='+LoginId);
        qTmp.Open;
        if qTmp.Fields[0].AsInteger = 0 then
           begin
              SqlRecord('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +','+'1'+','+''''+AnaKirim + ''''+','+''''+KirimAciklama + ''',sysdate ,' +#39 + RoluNeBuArkadasin + #39 + ' )');
              SqlRecord('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +','+'2'+','+''''+AnaKirim + ''''+','+''''+KirimAciklama + ''',sysdate ,' +#39 + RoluNeBuArkadasin + #39 + ' )');
           end;

        qTmp.Close;
        qTmp.Sql.Clear;
        qTmp.Sql.Add('SELECT COUNT(*) FROM KART_CARI WHERE ISYERI=''S''');
        if LoginInfo.StoreValue <> '' then qTmp.Sql.Add('AND NOT(CARI_ID IN ('+LoginInfo.StoreValue+'))');

        qTmp.Open;
        KartCari := qTmp.Fields[0].AsInteger;

        qTmp.Close;
        qTmp.Sql.Clear;
        qTmp.Sql.Add('SELECT COUNT(*) FROM BOLGE_STORE WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND TIP='+LogTip+' AND LOGINID='+LoginId);
        qTmp.Open;
        BolgeStore := qTmp.Fields[0].AsInteger;

        if Magazalar = '' then MagazaCount := KartCari
        else
           begin
              MagNo    := Magazalar;
              while not (MagNo = '') do
                 begin
                   AraDeger := GetPart(MagNo);
                   if AraDeger <> '' then inc(MagazaSayisi);
                 end;
              MagazaCount := MagazaSayisi;
           end;

         if (BolgeStore = KartCari) and (KartCari=MagazaCount) then exit
         else
            begin
              KirimSec.Close;
              KirimSec.TableName := 'Sec_'+FormatDateTime('YYYYMMDDHH24MMNN',now);
              KirimSec.CreateTable;
              KirimSec.Open;

              qTmp.Close;
              qTmp.Sql.Clear;
              qTmp.Sql.Add('SELECT BOS FROM BOLGE_STORE WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND TIP='+LogTip+' AND LOGINID='+LoginId + ' ORDER BY BOS');
              qTmp.Open;
              qTmp.First;

              while not qTmp.Eof do
                 begin
                    KirimSec.Insert;
                    KirimSec.FieldByName('BOS').AsInteger := qTmp.FieldByName('BOS').AsInteger;
                    KirimSec.FieldByName('EKLE').AsString := 'H';
                    KirimSec.FieldByName('SIL').AsString  := 'H';
                    KirimSec.Post;
                    qTmp.Next;
                 end;

              if Magazalar = '' then
                 begin
                    SqlYukle := '';
                    qTmp.Close;
                    qTmp.Sql.Clear;
                    qTmp.Sql.Add('SELECT CARI_ID FROM KART_CARI WHERE ISYERI=''S''');
                    if LoginInfo.StoreValue <> '' then qTmp.Sql.Add('AND NOT(CARI_ID IN ('+LoginInfo.StoreValue+'))');
                    qTmp.Sql.Add(' ORDER BY CARI_ID');
                    qTmp.Open;
                    qTmp.First;
                    while not qTmp.Eof do
                       begin
                         SqlEkle(qTmp.FieldByName('CARI_ID').AsString,';');
                         qTmp.Next;
                       end;
                    Magazalar := SqlYukle;
                 end;

                 MagNo    := Magazalar;
                 SqlYukle := '';

                 while not (MagNo = '') do
                   begin
                     AraDeger := GetPart(MagNo);
                     if AraDeger <> '' then
                        begin
                           KirimSec.SetKey;
                           KirimSec.FieldByName('BOS').AsFloat      := StrToFloat(AraDeger);
                           if KirimSec.GotoKey then
                              begin
                                KirimSec.Edit;
                                KirimSec.FieldByName('SIL').AsString := 'E';
                                KirimSec.Post;
                              end
                           else
                              begin
                                KirimSec.Insert;
                                KirimSec.FieldByName('BOS').AsFloat      := StrToFloat(AraDeger);
                                KirimSec.FieldByName('SIL').AsString     := 'E';
                                KirimSec.FieldByName('EKLE').AsString    := 'E';
                                KirimSec.Post;
                              end;
                           SqlEkle(AraDeger,',');
                        end;
                   end;

                   DeleteStore  := '';
                   SqlYukle     := '';
                   KirimSec.First;
                   while not KirimSec.Eof do
                     begin
                       if KirimSec.FieldByName('SIL').AsString = 'H' then SqlEkle(KirimSec.FieldByName('BOS').AsString,',');
                       KirimSec.Next;
                     end;
                   DeleteStore  := SqlYukle;
                   InsertStore  := '';
                   SqlYukle     := '';
                   KirimSec.First;

                   while not KirimSec.Eof do
                      begin
                         if KirimSec.FieldByName('EKLE').AsString = 'E' then SqlEkle(KirimSec.FieldByName('BOS').AsString,',');
                         KirimSec.Next;
                      end;
                   InsertStore  := SqlYukle;
                   KirimSec.Close;

                   Delete(InsertStore, Length(InsertStore), 1);
                   Delete(DeleteStore, Length(DeleteStore), 1);

                   if DeleteStore <> '' then SqlRecord('DELETE FROM BOLGE_STORE WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND LOGINID='+LoginId + ' AND BOS IN ('+DeleteStore +')');
                   if InsertStore <> '' then
                      begin
                         if ( LoginInfo.StoreValue <> '' ) then
                            begin
                               SqlRecord('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,'''+AnaKirim +''',SYSDATE,' +#39 + RoluNeBuArkadasin + #39 + ' FROM KART_CARI WHERE NOT (CARI_ID IN ('+LoginInfo.StoreValue + ')) AND CARI_ID IN ('+InsertStore +') AND ISYERI=''S''');
                               SqlRecord('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,'''+AnaKirim +''',SYSDATE,' +#39 + RoluNeBuArkadasin + #39 + ' FROM KART_CARI WHERE NOT (CARI_ID IN ('+LoginInfo.StoreValue + ')) AND CARI_ID IN ('+InsertStore +') AND ISYERI=''S''');
                            end
                         else
                            begin
                               SqlRecord('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,'''+AnaKirim +''',SYSDATE,' +#39 + RoluNeBuArkadasin + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+InsertStore +') AND ISYERI=''S''');
                               SqlRecord('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,'''+AnaKirim +''',SYSDATE,' +#39 + RoluNeBuArkadasin + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+InsertStore +') AND ISYERI=''S''');
                            end;
                      end;
            end;
     end;
end;


procedure TMagazaSecForm.Preview;
var
  aNode   : TcxTreeListNode;
         i: Integer;

  function GetPart(var PStr: String): String;
    begin
      if PStr = '' then begin Result:=''; Exit; end;
      if Pos(',',PStr) > 0 then
      begin
        Result := Copy(PStr,1,Pos(',',PStr)-1);
        Delete(PStr,1,Pos(',',PStr));
      end
      else
      begin
        Result := Copy(PStr,1,100);
        PStr := '';
      end;
    end;


  function PNode(S:String): TcxTreeListNode;
  var
    i : Integer;
  begin
    for i := 0 to DataGrid.AbsoluteCount-1 do
      if (Pos(VarToStr(DataGrid.AbsoluteItems[i].Values[col_Kirim.ItemIndex]),S)=1) and
         (Length(VarToStr(DataGrid.AbsoluteItems[i].Values[col_Kirim.ItemIndex]))= Length(S)-3) then
         begin
           Result := DataGrid.AbsoluteItems[i];
           exit;
         end;
  end;
  function PSubeNode(S:String): TCxTreeListNode;
  var i : Integer;
  begin
    for i := 0 to DataGrid.AbsoluteCount-1 do
      if VarToStr(DataGrid.AbsoluteItems[i].Values[col_Kirim.ItemIndex])= S then
         begin
           Result := DataGrid.AbsoluteItems[i];
           exit;
         end;
  end;
  function Nokta: String;
  var
    i,j : Integer;
    astr: String;
  begin
    j := 0;
    for i := 1 to Length(qTmp.FieldByName('KOD').AsString) do
      if qTmp.FieldByName('KOD').AsString[i] = '.' then Inc(j);
    astr := '';
    for i := 1 to j do
    begin
      AStr := AStr+'   ';
    end;
    Result := AStr;
  end;
begin



   DataGrid.Clear;
   qTmp.Close;
   qTmp.Sql.Clear;
   qTmp.Sql.Add('SELECT KOD,ACIKLAMA FROM BOLGE_TANIMI WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND LOGINID='+LogId+' AND TIP='+LogTip + ' ORDER BY KOD');
   qTmp.Open;
   DataGrid.beginupdate;
   qTmp.First;
   while not qTmp.EOF do
     begin
       ANode := DataGrid.Add;
       ANode.Values[col_Kirim.ItemIndex]         := qTmp.FieldByName('KOD').AsString;
       ANode.Values[col_KirimAciklama.ItemIndex] := Nokta+qTmp.FieldByName('ACIKLAMA').AsString;
       ANode.Values[col_Bos.ItemIndex]           := 0;
       ANode.Values[col_KirimSec.ItemIndex]      := False;
       aNode.MoveTo(PNode(qTmp.FieldByName('KOD').AsString),tlamAddChild);
       qTmp.Next;
     end;

   SqlRecord('UPDATE BOLGE_STORE A SET KOD='''+AnaKirim + ''' WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND LOGINID='+LogId+' AND TIP=''2'' AND NOT(KOD IN (SELECT KOD FROM BOLGE_TANIMI B WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND LOGINID='+LogId+' AND TIP=''2'' AND A.KOD=B.KOD))');
   SqlRecord('UPDATE BOLGE_STORE A SET KOD='''+AnaKirim + ''' WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND LOGINID='+LogId+' AND TIP=''1'' AND NOT(KOD IN (SELECT KOD FROM BOLGE_TANIMI B WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND LOGINID='+LogId+' AND TIP=''1'' AND A.KOD=B.KOD))');


   qTmp.Close;
   qTmp.SQL.Clear;
   qTmp.Sql.Add('SELECT KOD,BOS,UNVAN FROM BOLGE_STORE,KART_CARI  WHERE  ROL = ' +#39 + RoluNeBuArkadasin + #39 + ' AND ISYERI=''S'' AND BOS=CARI_ID AND LOGINID='+LogId+' AND TIP='+LogTip+'  ORDER BY KOD,UNVAN');
   qTmp.Open;
   while not qTmp.EOF do
   begin
     ANode := DataGrid.Add;
     ANode.Values[col_Kirim.ItemIndex]         := qTmp.FieldByName('KOD').AsString;
     ANode.Values[col_KirimAciklama.ItemIndex] := Nokta+'   '+qTmp.FieldByName('UNVAN').AsString;
     ANode.Values[col_Bos.ItemIndex]           := qTmp.FieldByName('BOS').AsString;
     ANode.Values[col_KirimSec.ItemIndex]      := False;
     aNode.MoveTo(PSubeNode(qTmp.FieldByName('KOD').AsString),tlamAddChild);
     qTmp.Next;
   end;


   if LogSec <> '' then
      begin
        KirimSec.Close;
        KirimSec.TableName := 'LogSec_'+FormatDateTime('YYYYMMDDHH24MMNN',now);
        KirimSec.CreateTable;
        KirimSec.Open;
        MagNo        := LogSec;
        while not (MagNo = '') do
           begin
              AraDeger := GetPart(MagNo);
              if AraDeger <> '' then
                 begin
                    KirimSec.Insert;
                    KirimSec.FieldByName('BOS').AsString := AraDeger;
                    KirimSec.Post;
                 end;
           end;

        for i := 0 to DataGrid.AbsoluteCount -1   do
          begin
             KirimSec.SetKey;
             KirimSec.FieldByName('BOS').AsFloat      := VarToInt(DataGrid.AbsoluteItems[i].Values[Col_Bos.ItemIndex]);
             if KirimSec.GotoKey then DataGrid.AbsoluteItems[i].Values[Col_KirimSec.ItemIndex] := True;
          end;
      end;


     DataGrid.EndUpdate;
     DataGrid.FullExpand;
     ActiveControl := edAranan;
end;



procedure TMagazaSecForm.DataGridStylesGetContentStyle(Sender,
  AItem: TObject; ANode: TcxTreeListNode; var AStyle: TcxStyle);
var
  Data     : String;
begin
  Data := VarToStr(ANode.Values[Col_Bos.ItemIndex]);
  if Data = '0' then begin AStyle := LineStyle2; Exit; end;
end;

end.


