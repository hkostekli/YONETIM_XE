unit Kasiyer;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, Menus, DBTables, DBAccess, Ora, OraSmart, MemDS, OraError, Grids, DBGrids, ComCtrls, ExtCtrls, StdCtrls,
  DBCtrls, Mask;

type
  TErp2000_KasiyerTanim = class(TForm)
    PopupMenu1: TPopupMenu;
    pmDegistir: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N2: TMenuItem;
    pmKapat: TMenuItem;
    StatusBar1: TStatusBar;
    TmDurum: TTimer;
    DBGrid1: TDBGrid;
    tKasiyer: TOraTable;
    dKasiyer: TDataSource;
    pmEkle: TMenuItem;
    pmSil: TMenuItem;
    tKasiyerKASIYER_ID: TStringField;
    tKasiyerISIM: TStringField;
    tKasiyerSDT: TDateTimeField;
    tKasiyerSDY: TFloatField;
    procedure pmDegistirClick(Sender: TObject);
    procedure pmSilClick(Sender: TObject);
    procedure pmKaydetClick(Sender: TObject);
    procedure pmVazgecClick(Sender: TObject);
    procedure pmKapatClick(Sender: TObject);
    procedure TmDurumTimer(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure pmEkleClick(Sender: TObject);
    procedure tKasiyerBeforeDelete(DataSet: TDataSet);
    procedure tKasiyerAfterInsert(DataSet: TDataSet);
    procedure tKasiyerAfterPost(DataSet: TDataSet);
    procedure tKasiyerAfterEdit(DataSet: TDataSet);
    procedure tKasiyerBeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Var
  Erp2000_KasiyerTanim: TErp2000_KasiyerTanim;

implementation

Uses BlyLib, dModule, ErpMenu;

{$R *.DFM}

procedure TErp2000_KasiyerTanim.TmDurumTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := LoginInfo.Isim;
  StatusBar1.Panels[1].Text := FormatDateTime('dd mmmm yyyy hh:mm:ss', Date + Time);
  if tKasiyer.State = dsBrowse Then
     Begin
       StatusBar1.Panels[3].Text := tKasiyer.FieldByName('SDY').AsString;
       StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tKasiyer.FieldByName('SDT').AsDateTime);
     End
   Else
     Begin
       StatusBar1.Panels[3].Text := '...';
       StatusBar1.Panels[4].Text := '...';
     End;
end;

procedure TErp2000_KasiyerTanim.pmDegistirClick(Sender: TObject);
begin
  tKasiyer.Edit;
end;

procedure TErp2000_KasiyerTanim.pmSilClick(Sender: TObject);
begin
  tKasiyer.Delete;
end;

procedure TErp2000_KasiyerTanim.pmKaydetClick(Sender: TObject);
begin
  tKasiyer.Post;
end;

procedure TErp2000_KasiyerTanim.pmVazgecClick(Sender: TObject);
begin
  tKasiyer.Cancel;
end;

procedure TErp2000_KasiyerTanim.pmKapatClick(Sender: TObject);
begin
  Erp2000_KasiyerTanim.Close;
end;

procedure TErp2000_KasiyerTanim.PopupMenu1Popup(Sender: TObject);
begin
  pmDegistir.Enabled := tKasiyer.State = dsBrowse;
  pmKaydet.Enabled   := tKasiyer.State In [dsInsert, dsEdit];
  pmVazgec.Enabled   := tKasiyer.State In [dsInsert, dsEdit];
  pmKapat.Enabled    := Not(tKasiyer.State In [dsInsert, dsEdit]);
end;

procedure TErp2000_KasiyerTanim.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tKasiyer.State In [dsInsert, dsEdit] Then
     begin
       if messagedlg('Girilen kasiyer bilgisi kaydedilmemiþ, kaydetmek istermisiniz ?', mtconfirmation, [mbyes, mbno], 0) = mryes then tKasiyer.Post
                                                                                                                                  else tKasiyer.Cancel;
     end;
  Action := caFree;
end;

procedure TErp2000_KasiyerTanim.FormDestroy(Sender: TObject);
begin
  Yonetim_menu.mmKasiyerTanim.Enabled := True;
  tKasiyer.Close;
end;

procedure TErp2000_KasiyerTanim.pmEkleClick(Sender: TObject);
begin
  tKasiyer.Insert;
end;

procedure TErp2000_KasiyerTanim.tKasiyerBeforeDelete(DataSet: TDataSet);
begin
  if MessageDlg('Kasiyer kaydý silinecek, onaylýyormusunuz ?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes Then Abort;
end;

procedure TErp2000_KasiyerTanim.tKasiyerAfterInsert(DataSet: TDataSet);
begin
  tKasiyerSDY.Text  := LoginInfo.Kod;
  tKasiyerSDT.Value := Date + Time;
end;

procedure TErp2000_KasiyerTanim.tKasiyerAfterPost(DataSet: TDataSet);
begin
  tKasiyer.Refresh;
end;

procedure TErp2000_KasiyerTanim.tKasiyerAfterEdit(DataSet: TDataSet);
begin
  tKasiyerSDY.Text  := LoginInfo.Kod;
  tKasiyerSDT.Value := Date + Time;
end;

procedure TErp2000_KasiyerTanim.tKasiyerBeforeEdit(DataSet: TDataSet);
begin
  tKasiyer.Refresh;
end;

end.




