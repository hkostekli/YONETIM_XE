unit TMuhasebe;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, Buttons, ComCtrls, ExtCtrls, Grids, DBGrids, DBCtrls,
  ToolWin, Db, DBAccess, Ora, OraSmart, MemDS, OraError;

type
  TKart_Muhasebe = class(TForm)
    Panel2: TPanel;
    edArama: TEdit;
    Label1: TLabel;
    cbArama: TComboBox;
    BtnSec: TBitBtn;
    BtnKapat: TBitBtn;
    dKart: TDataSource;
    qKart: TOraQuery;
    PopupMenu1: TPopupMenu;
    pmIlk: TMenuItem;
    pmOnceki: TMenuItem;
    pmSonraki: TMenuItem;
    pmSon: TMenuItem;
    N3: TMenuItem;
    pmKapat: TMenuItem;
    DBGrid1: TDBGrid;
    ShowPopUp1: TMenuItem;
    qKartKOD: TStringField;
    qKartACIKLAMA_1: TStringField;
    qKartACIKLAMA_2: TStringField;
    qKartOZEL_KOD_1: TStringField;
    qKartOZEL_KOD_2: TStringField;
    qKartBORC: TFloatField;
    qKartALACAK: TFloatField;
    qKartMASRAF_MERKEZI: TStringField;
    qKartSDY: TIntegerField;
    qKartSDT: TDateTimeField;
    qKartBAKIYE: TFloatField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure qKartAfterScroll(DataSet: TDataSet);
    procedure qKartCalcFields(DataSet: TDataSet);
    procedure pmIlkClick(Sender: TObject);
    procedure pmOncekiClick(Sender: TObject);
    procedure pmSonrakiClick(Sender: TObject);
    procedure pmSonClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnSecClick(Sender: TObject);
    procedure pmKapatClick(Sender: TObject);
    procedure dKartStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure edAramaChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edAramaKeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure ShowPopUp1Click(Sender: TObject);
  private
    Function  TestAltHesap: Boolean;
    procedure MngQuery(F, V, L: String);
  public

  end;

  Var
    Kart_Muhasebe: TKart_Muhasebe;

  Function mhCreate(Search: Boolean): TModalResult;

implementation

Uses DModule, BlyLib;

{$R *.DFM}

Function TKart_Muhasebe.TestAltHesap: Boolean;
Begin
  With dmGlobal Do
  Begin
    if qTmp.Active Then qTmp.Close;
    qTmp.SQL.Clear;
    qTmp.SQL.Add('SELECT KOD FROM KART_MUHASEBE WHERE KOD LIKE ' + #39 + qKartKOD.Text + '%' + #39 + ' ORDER BY KOD');
    qTmp.Open;
    if qTmp.RecordCount > 1 Then TestAltHesap := True
                            Else TestAltHesap := False;
    qTmp.Close;
  End;
End;

Function mhCreate(Search: Boolean): TModalResult;
Begin
  Application.CreateForm(TKart_Muhasebe, Kart_Muhasebe);
  With Kart_Muhasebe Do
  Begin
    BtnSec.Visible := Search;
    if Search Then
       Begin
         cbArama.ItemIndex := mhKriter.F;
         edArama.Text      := mhKriter.V;
         ActiveControl := DBGrid1;
         if cbArama.Text = 'KOD'      Then MngQuery('KOD', edArama.Text, '')
            Else
         if cbArama.Text = 'ACIKLAMA' Then MngQuery('ACIKLAMA_1', edArama.Text, '')
            Else
         if cbArama.Text = '2.ACIKLAMA' Then MngQuery('ACIKLAMA_2', edArama.Text, '')
            Else
         if cbArama.Text = 'ÖZEL KOD' Then MngQuery('OZEL_KOD_1', edArama.Text, '');
       End
     Else
       Begin
         MngQuery('', '', '');
         cbArama.ItemIndex := 0;
       End;
  End;
  mhCreate := Kart_Muhasebe.ShowModAl;
End;

Procedure TKart_Muhasebe.MngQuery(F, V, L: String);
Begin
  if qKart.Active Then qKart.Close;
  qKart.SQL.Clear;
  qKart.SQL.Add('SELECT * FROM KART_MUHASEBE');
  if V <> '' Then
     Begin
       if Pos('*', V) = 0 Then V := V + '*';
       qKart.SQL.Add('WHERE ' + F + _MakeSQLString(V));
     End;
  qKart.SQL.Add('ORDER BY KOD');
  qKart.Open;
  if L <> '' Then qKart.Locate('KOD', L, [loCaseInsensitive]);
End;

procedure TKart_Muhasebe.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if ModalResult <> mrOK Then Action := caFree;
end;

procedure TKart_Muhasebe.qKartAfterScroll(DataSet: TDataSet);
begin
  btnKapat.Enabled := Not(qKart.State In [dsInsert, dsEdit]);
  if qKart.State = dsBrowse Then
     Begin
       if BtnSec.Visible Then btnSec.Enabled := Not(qKart.State In [dsInsert, dsEdit]) and (qKartKOD.Text <> '');
       pmIlk.Enabled        := Not(qKart.BOF);
       pmOnceki.Enabled     := Not(qKart.BOF);
       pmSonraki.Enabled    := Not(qKart.EOF);
       pmSon.Enabled        := Not(qKart.EOF);
     End
   Else
     Begin
       if BtnSec.Visible Then btnSec.Enabled := False;
       pmIlk.Enabled        := False;
       pmOnceki.Enabled     := False;
       pmSonraki.Enabled    := False;
       pmSon.Enabled        := False;
     End;
  pmKapat.Enabled     := BtnKapat.Enabled;
end;

procedure TKart_Muhasebe.qKartCalcFields(DataSet: TDataSet);
begin
  qKartBAKIYE.Text := _BakiyeHesapla(qKartBORC.Value, qKartALACAK.Value, LoginInfo.fmtTutar);
end;

procedure TKart_Muhasebe.pmIlkClick(Sender: TObject);
begin
  qKart.First;
end;

procedure TKart_Muhasebe.pmOncekiClick(Sender: TObject);
begin
  qKart.Prior;
end;

procedure TKart_Muhasebe.pmSonrakiClick(Sender: TObject);
begin
  qKart.Next;
end;

procedure TKart_Muhasebe.pmSonClick(Sender: TObject);
begin
  qKart.Last;
end;

procedure TKart_Muhasebe.FormDestroy(Sender: TObject);
begin
  if qKart.Active Then qKart.Close;
end;

procedure TKart_Muhasebe.BtnSecClick(Sender: TObject);
begin
  if TestAltHesap = False Then
     Begin
       With skKriter Do
       Begin
         F := cbArama.ItemIndex;
         V := edArama.Text;
       End;
       Kart_Muhasebe.ModalResult := mrOK;
     End
     Else Application.MessageBox('[UYARI]: Alt hesabý olan hesap planý kartlarý seçilemez !', 'BLY2000', 0);
end;

procedure TKart_Muhasebe.pmKapatClick(Sender: TObject);
begin
  Kart_Muhasebe.Close;
end;

procedure TKart_Muhasebe.dKartStateChange(Sender: TObject);
begin
  qKartAfterScroll(Nil);
end;

procedure TKart_Muhasebe.FormCreate(Sender: TObject);
begin
  With LoginInfo Do
  Begin
    qKartBORC.DisplayFormat   := fmtTutar;
    qKartALACAK.DisplayFormat := fmtTutar;
  End;
end;

procedure TKart_Muhasebe.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var
  Renk: TColor;
begin
  Renk := $00FF8000;
  Case Length(qKartKOD.Text) Of
    6: Renk := $004080FF;
    9: Renk := clGreen;
   12: Renk := clRed;
   15: Renk := clTeal;
   18: Renk := clOlive;
  End;
  if State = [gdFocused, gdSelected] Then dbGrid1.Canvas.Font.Color := clWhite
                                     Else dbGrid1.Canvas.Font.Color := Renk;
  dbGrid1.canvas.TextOut(Rect.Left + 2, Rect.Top + 3, Column.Field.AsString);
end;

procedure TKart_Muhasebe.edAramaChange(Sender: TObject);
begin
  if cbArama.Text = 'KOD'      Then MngQuery('KOD', edArama.Text, '')
     Else
  if cbArama.Text = 'ACIKLAMA' Then MngQuery('ACIKLAMA_1', edArama.Text, '')
     Else
  if cbArama.Text = '2.ACIKLAMA' Then MngQuery('ACIKLAMA_2', edArama.Text, '')
     Else
  if cbArama.Text = 'ÖZEL KOD' Then MngQuery('OZEL_KOD_1', edArama.Text, '');
  ActiveControl := edArama;
end;

procedure TKart_Muhasebe.DBGrid1DblClick(Sender: TObject);
begin
  if BtnSec.Visible Then BtnSecClick(Nil);
end;

procedure TKart_Muhasebe.edAramaKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    begin
      ActiveControl := DBGrid1;
      Key := #0;
    end;
end;

procedure TKart_Muhasebe.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if qKartKOd.AsString <> '' then
    if Key = #13 then
       BtnSecClick(btnSec);
end;

procedure TKart_Muhasebe.ShowPopUp1Click(Sender: TObject);
begin
  PopupMenu1.Popup(Left+width-20,top+20);
end;

end.
