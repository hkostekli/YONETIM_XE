unit KdvIndex;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, DBAccess, Ora, OraSmart, MemDS, OraError, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  DBCtrls, Mask, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxControls,
  cxGridCustomView, cxGrid, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TKdvIndexleri_Form = class(TForm)
    StatusBar1: TStatusBar;
    TmDurum: TTimer;
    dKdv: TDataSource;
    cxGrid1: TcxGrid;
    TableView: TcxGridDBTableView;
    Col_SIRA_NO: TcxGridDBColumn;
    Col_KDV_ORANI: TcxGridDBColumn;
    Col_ACIKLAMA: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    tKdv: TOraQuery;
    uKdv: TOraUpdateSQL;
    PopupMenu1: TPopupMenu;
    pmEkle: TMenuItem;
    pmDegistir: TMenuItem;
    pmSil: TMenuItem;
    N1: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N2: TMenuItem;
    pmKapat: TMenuItem;
    tKdvSIRA_NO: TIntegerField;
    tKdvKDV_ORANI: TFloatField;
    tKdvACIKLAMA: TStringField;
    tKdvSDT: TDateTimeField;
    tKdvSDY: TIntegerField;
    procedure pmEkleClick(Sender: TObject);
    procedure pmDegistirClick(Sender: TObject);
    procedure pmSilClick(Sender: TObject);
    procedure pmKaydetClick(Sender: TObject);
    procedure pmVazgecClick(Sender: TObject);
    procedure pmKapatClick(Sender: TObject);
    procedure TmDurumTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tKdvBeforeDelete(DataSet: TDataSet);
    procedure tKdvAfterInsert(DataSet: TDataSet);
    procedure tKdvAfterEdit(DataSet: TDataSet);
    procedure tKdvAfterPost(DataSet: TDataSet);
    procedure tKdvAfterScroll(DataSet: TDataSet);
    procedure dKdvStateChange(Sender: TObject);
    procedure tKdvAfterDelete(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  KdvIndexleri_Form: TKdvIndexleri_Form;

implementation

Uses BlyLib, dModule, ErpMenu;

{$R *.DFM}

procedure TKdvIndexleri_Form.TmDurumTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := LoginInfo.Isim;
  StatusBar1.Panels[1].Text := FormatDateTime('dd mmmm yyyy hh:mm:ss', Date + Time);
  if tKdv.State = dsBrowse Then
     Begin
       StatusBar1.Panels[3].Text := tkdv.FieldByName('SDY').AsString;
       StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tKdv.FieldByName('SDT').AsDateTime);
     End
   Else
     Begin
       StatusBar1.Panels[3].Text := '...';
       StatusBar1.Panels[4].Text := '...';
     End;
end;

procedure TKdvIndexleri_Form.pmEkleClick(Sender: TObject);
begin
  tKdv.Append;
end;

procedure TKdvIndexleri_Form.pmDegistirClick(Sender: TObject);
begin
  tKdv.Edit;
end;

procedure TKdvIndexleri_Form.pmSilClick(Sender: TObject);
begin
  tKdv.Delete;
end;

procedure TKdvIndexleri_Form.pmKaydetClick(Sender: TObject);
begin
  tKdv.Post;
end;

procedure TKdvIndexleri_Form.pmVazgecClick(Sender: TObject);
begin
  tKdv.Cancel;
end;

procedure TKdvIndexleri_Form.pmKapatClick(Sender: TObject);
begin
  KdvIndexleri_Form.Close;
end;

procedure TKdvIndexleri_Form.tKdvAfterScroll(DataSet: TDataSet);
begin
  pmEkle.Enabled     := (tKdv.State = dsBrowse) And (LoginInfo.Haklar[2]);
  pmDegistir.Enabled := (tKdv.State = dsBrowse) and (tKdv.RecordCount>0) And (LoginInfo.Haklar[2]);
  pmSil.Enabled      := (tKdv.State = dsBrowse) and (tKdv.RecordCount>0) And (LoginInfo.Haklar[2]);
  pmKaydet.Enabled   := tKdv.State In [dsInsert, dsEdit];
  pmVazgec.Enabled   := tKdv.State In [dsInsert, dsEdit];
  pmKapat.Enabled    := Not(tKdv.State In [dsInsert, dsEdit]);
end;

procedure TKdvIndexleri_Form.dKdvStateChange(Sender: TObject);
begin
  tKdvAfterScroll(nil);
end;

procedure TKdvIndexleri_Form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tKdv.State In [dsInsert, dsEdit] Then
     begin
       if messagedlg('Girilen KDV bilgisi kaydedilmemiþ, kaydetmek istermisiniz ?', mtconfirmation, [mbyes, mbno], 0) = mryes then tKdv.Post
                                                                                                                              else tKdv.Cancel;
     end;
  Action := caFree;
end;

procedure TKdvIndexleri_Form.FormCreate(Sender: TObject);
begin
  tKdv.Open;
end;

procedure TKdvIndexleri_Form.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
    tKdv.Close;
end;

procedure TKdvIndexleri_Form.tKdvBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('KDV kaydý silinecek, onaylýyormusunuz ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then Abort;
end;

procedure TKdvIndexleri_Form.tKdvAfterInsert(DataSet: TDataSet);
begin
  tKdvSDY.Text  := LoginInfo.Kod;
 // tKdvSDT.Value := LoginInfo.SistemTarihi;
end;

procedure TKdvIndexleri_Form.tKdvAfterEdit(DataSet: TDataSet);
begin
  tKdvSDY.Text  := LoginInfo.Kod;
 // tKdvSDT.Value := LoginInfo.SistemTarihi;
end;

procedure TKdvIndexleri_Form.tKdvAfterPost(DataSet: TDataSet);
begin
  dmGlobal.dbGlobal.StartTransaction;
  Try
    tKdv.ApplyUpdates;
    dmGlobal.dbGlobal.Commit;
    tKdv.CommitUpdates;
  Except
    dmGlobal.dbGlobal.RollBack;
    tKdv.CancelUpdates;
    Application.MessageBox('Kayýt iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi !', 'HATA!', mb_OK);
    tKdvAfterScroll(nil);
  End;
  tKdvAfterScroll(nil);
end;

procedure TKdvIndexleri_Form.tKdvAfterDelete(DataSet: TDataSet);
begin
  dmGlobal.dbGlobal.StartTransaction;
  Try
    tKdv.ApplyUpdates;
    dmGlobal.dbGlobal.Commit;
    tKdv.CommitUpdates;
  Except
    dmGlobal.dbGlobal.RollBack;
    tKdv.CancelUpdates;
    Application.MessageBox('Silme iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi !', 'HATA!', mb_OK);
    tKdvAfterScroll(nil);
  End;
  tKdvAfterScroll(nil);
end;


end.




