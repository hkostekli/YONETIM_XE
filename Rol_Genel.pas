unit Rol_Genel;
{$INCLUDE Unit\Belit.Inc}
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, StdCtrls, ImgList, ToolWin, Db, DBAccess, Ora, OraSmart, MemDS, OraError, ExtCtrls, DBCtrls,
  FileCtrl, Grids, DBGrids, Mask, Buttons, cxContainer, cxEdit, cxLabel,
  cxPC, cxControls, cxLookAndFeelPainters, cxCheckBox, cxButtons,
  cxGroupBox, cxRadioGroup, cxTextEdit, CheckLst, cxGraphics, cxCustomData,
  cxStyles, cxTL, cxMaskEdit, cxInplaceContainer, cxDBTL, cxTLData,
  cxTreeView, dxtree, dxdbtree, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, cxClasses, dxBar, dxBarExtItems, ActnList,
  dxSkinsCore, dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxCheckListBox, cxLookAndFeels, dxBarBuiltInMenu, cxNavigator,
  dxSkinsdxBarPainter, System.Actions, System.ImageList;

type
  TErp2000_Roller_Genel = class(TForm)
    uRol: TOraUpdateSQL;
    dRol: TDataSource;
    PageControl1: TcxPageControl;
    TabSheet1: TcxTabSheet;
    TabSheet2: TcxTabSheet;
    PopupMenu1: TPopupMenu;
    pmEkle: TMenuItem;
    pmDegistir: TMenuItem;
    pmSil: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N1: TMenuItem;
    pmVer: TMenuItem;
    pmAl: TMenuItem;
    N2: TMenuItem;
    pmIlk: TMenuItem;
    pmOnceki: TMenuItem;
    pmSonraki: TMenuItem;
    pmSon: TMenuItem;
    N3: TMenuItem;
    pmKapat: TMenuItem;
    pmAgac: TMenuItem;
    ShowPopUp1: TMenuItem;
    AcImages: TImageList;
    StatusBar1: TStatusBar;
    TmDurum: TTimer;
    N4: TMenuItem;
    pmRol: TMenuItem;
    Panel1: TPanel;
    EdArama: TEdit;
    Panel2: TPanel;
    btnOnceki: TSpeedButton;
    btnSonraki: TSpeedButton;
    RolKaydet1: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    FiltreYetki: TMenuItem;
    QRol1: TOraQuery;
    SRol1: TDataSource;
    Panel6: TPanel;
    Bevel1: TBevel;
    cxLabel21: TcxLabel;
    cxButton9: TcxButton;
    cxButton8: TcxButton;
    cxRadioGroup1: TcxRadioGroup;
    chRol: TCheckListBox;
    cxLabel2: TcxLabel;
    cxCheckBox7: TcxCheckBox;
    cxGroupBox1: TcxGroupBox;
    CxIncele: TcxCheckBox;
    CxEkle: TcxCheckBox;
    CxDegistir: TcxCheckBox;
    CxSil: TcxCheckBox;
    CxTumu: TcxCheckBox;
    CxIcindeEdit: TcxTextEdit;
    CxIcinde: TcxCheckBox;
    cxLabel3: TcxLabel;
    QTree: TOraQuery;
    STree: TDataSource;
    DbRolTree: TdxDBTreeView;
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
    cxGrid1: TcxGrid;
    CxV: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    CxVKOD: TcxGridDBColumn;
    Enable_New: TImageList;
    Disable_New: TImageList;
    Artist: TActionList;
    YeniEkle: TAction;
    YeniDegistir: TAction;
    YeniSil: TAction;
    YeniKaydet: TAction;
    YeniVazgec: TAction;
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
    dxBarButton2: TdxBarButton;
    dxBarButton3: TdxBarButton;
    Panel3: TPanel;
    cxLabel1: TcxLabel;
    DBEdit2: TDBEdit;
    RolTree: TTreeView;
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    YeniYetkiVer: TAction;
    YeniYetkiAl: TAction;
    Pb: TProgressBar;
    Label1: TLabel;
    QRol: TOraQuery;
    QTreeID: TFloatField;
    QTreePARENT_ID: TFloatField;
    QTreeYETKI_NO: TIntegerField;
    QTreeYETKI_ACIKLAMA: TStringField;
    QTreeTUR: TStringField;
    QTreeSDY: TIntegerField;
    QTreeSDT: TDateTimeField;
    QTreeSTATE: TStringField;
    QTreeYETKI: TStringField;
    QRol1KOD: TStringField;
    QRol1YETKI_0: TStringField;
    QRol1YETKI_1: TStringField;
    QRol1YETKI_2: TStringField;
    QRol1YETKI_3: TStringField;
    QRol1YETKI_4: TStringField;
    QRol1YETKI_5: TStringField;
    QRol1YETKI_6: TStringField;
    QRol1YETKI_7: TStringField;
    QRol1YETKI_8: TStringField;
    QRol1YETKI_9: TStringField;
    QRol1YETKI_A: TStringField;
    QRol1YETKI_B: TStringField;
    QRol1YETKI_C: TStringField;
    QRol1YETKI_D: TStringField;
    QRol1YETKI_E: TStringField;
    QRol1YETKI_F: TStringField;
    QRol1SDY: TIntegerField;
    QRol1SDT: TDateTimeField;
    QRol1YETKI_G: TStringField;
    QRol1YETKI_H: TStringField;
    QRol1YETKI_I: TStringField;
    QRol1YETKI_J: TStringField;
    QRol1YETKI_K: TStringField;
    QRol1YETKI_L: TStringField;
    QRol1YETKI_M: TStringField;
    QRol1YETKI_N: TStringField;
    QRol1YETKI_O: TStringField;
    QRol1YETKI_P: TStringField;
    QRol1YETKI_R: TStringField;
    QRol1YETKI_S: TStringField;
    QRol1YETKI_T: TStringField;
    QRol1YETKI_Y: TStringField;
    QRol1YETKI_U: TStringField;
    QRol1YETKI_V: TStringField;
    QRol1YETKI_A1: TStringField;
    QRol1YETKI_A2: TStringField;
    QRol1YETKI_A3: TStringField;
    QRol1YETKI_A4: TStringField;
    QRol1YETKI_A5: TStringField;
    QRol1YETKI_A6: TStringField;
    QRol1YETKI_A7: TStringField;
    QRol1YETKI_A8: TStringField;
    QRol1YETKI_A9: TStringField;
    QRol1YETKI_A10: TStringField;
    QRol1YETKI_A11: TStringField;
    QRol1YETKI_A12: TStringField;
    QRol1YETKI_A13: TStringField;
    QRol1YETKI_A14: TStringField;
    QRol1YETKI_A15: TStringField;
    QRol1YETKI_A16: TStringField;
    QRol1YETKI_A17: TStringField;
    QRol1YETKI_A18: TStringField;
    QRol1YETKI_A19: TStringField;
    QRol1YETKI_A20: TStringField;
    QRol1YETKI_A21: TStringField;
    QRol1YETKI_A22: TStringField;
    QRol1YETKI_A23: TStringField;
    QRol1YETKI_A24: TStringField;
    QRol1YETKI_A25: TStringField;
    QRol1YETKI_A26: TStringField;
    QRol1YETKI_A27: TStringField;
    QRol1YETKI_A28: TStringField;
    QRol1YETKI_A29: TStringField;
    QRol1YETKI_A30: TStringField;
    QRol1TUR: TStringField;
    QRolKOD: TStringField;
    QRolYETKI_0: TStringField;
    QRolYETKI_1: TStringField;
    QRolYETKI_2: TStringField;
    QRolYETKI_3: TStringField;
    QRolYETKI_4: TStringField;
    QRolYETKI_5: TStringField;
    QRolYETKI_6: TStringField;
    QRolYETKI_7: TStringField;
    QRolYETKI_8: TStringField;
    QRolYETKI_9: TStringField;
    QRolYETKI_A: TStringField;
    QRolYETKI_B: TStringField;
    QRolYETKI_C: TStringField;
    QRolYETKI_D: TStringField;
    QRolYETKI_E: TStringField;
    QRolYETKI_F: TStringField;
    QRolSDY: TIntegerField;
    QRolSDT: TDateTimeField;
    QRolYETKI_G: TStringField;
    QRolYETKI_H: TStringField;
    QRolYETKI_I: TStringField;
    QRolYETKI_J: TStringField;
    QRolYETKI_K: TStringField;
    QRolYETKI_L: TStringField;
    QRolYETKI_M: TStringField;
    QRolYETKI_N: TStringField;
    QRolYETKI_O: TStringField;
    QRolYETKI_P: TStringField;
    QRolYETKI_R: TStringField;
    QRolYETKI_S: TStringField;
    QRolYETKI_T: TStringField;
    QRolYETKI_Y: TStringField;
    QRolYETKI_U: TStringField;
    QRolYETKI_V: TStringField;
    QRolYETKI_A1: TStringField;
    QRolYETKI_A2: TStringField;
    QRolYETKI_A3: TStringField;
    QRolYETKI_A4: TStringField;
    QRolYETKI_A5: TStringField;
    QRolYETKI_A6: TStringField;
    QRolYETKI_A7: TStringField;
    QRolYETKI_A8: TStringField;
    QRolYETKI_A9: TStringField;
    QRolYETKI_A10: TStringField;
    QRolYETKI_A11: TStringField;
    QRolYETKI_A12: TStringField;
    QRolYETKI_A13: TStringField;
    QRolYETKI_A14: TStringField;
    QRolYETKI_A15: TStringField;
    QRolYETKI_A16: TStringField;
    QRolYETKI_A17: TStringField;
    QRolYETKI_A18: TStringField;
    QRolYETKI_A19: TStringField;
    QRolYETKI_A20: TStringField;
    QRolYETKI_A21: TStringField;
    QRolYETKI_A22: TStringField;
    QRolYETKI_A23: TStringField;
    QRolYETKI_A24: TStringField;
    QRolYETKI_A25: TStringField;
    QRolYETKI_A26: TStringField;
    QRolYETKI_A27: TStringField;
    QRolYETKI_A28: TStringField;
    QRolYETKI_A29: TStringField;
    QRolYETKI_A30: TStringField;
    QRolTUR: TStringField;
    Panel4: TPanel;
    cxButton1: TcxButton;
    cxLabel4: TcxLabel;
    VTSec: TcxCheckListBox;
    cxButton2: TcxButton;
    cxLabel5: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    CxYetkiler: TcxCheckBox;
    cxTextEdit2: TcxTextEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Panel5: TPanel;
    Label4: TLabel;
    Edit3: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure pmIlkClick(Sender: TObject);
    procedure pmOncekiClick(Sender: TObject);
    procedure pmSonrakiClick(Sender: TObject);
    procedure pmSonClick(Sender: TObject);
    procedure qRolAfterDelete(DataSet: TDataSet);
    procedure qRolAfterPost(DataSet: TDataSet);
    procedure qRolBeforePost(DataSet: TDataSet);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure qRolBeforeEdit(DataSet: TDataSet);
    procedure pmAgacClick(Sender: TObject);
    procedure qRolAfterScroll(DataSet: TDataSet);
    procedure RolTree1KeyPress(Sender: TObject; var Key: Char);
    procedure qRolAfterInsert(DataSet: TDataSet);
    procedure FormActivate(Sender: TObject);
    procedure TmDurumTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure pmRolClick(Sender: TObject);
    procedure EdAramaKeyPress(Sender: TObject; var Key: Char);
    procedure RolKaydet1Click(Sender: TObject);
    procedure RolTree222KeyPress(Sender: TObject; var Key: Char);
    procedure cxButton8Click(Sender: TObject);
    procedure FiltreYetkiClick(Sender: TObject);
    procedure cxButton9Click(Sender: TObject);
    procedure chRolClickCheck(Sender: TObject);
    procedure cxCheckBox7PropertiesChange(Sender: TObject);
    procedure CxTumuPropertiesChange(Sender: TObject);
    procedure CxIncelePropertiesChange(Sender: TObject);
    procedure qRolAfterCancel(DataSet: TDataSet);
    procedure RolTreeKeyPress(Sender: TObject; var Key: Char);
    procedure YeniEkleExecute(Sender: TObject);
    procedure YeniDegistirExecute(Sender: TObject);
    procedure YeniSilExecute(Sender: TObject);
    procedure YeniVazgecExecute(Sender: TObject);
    procedure YeniYetkiVerExecute(Sender: TObject);
    procedure YeniYetkiAlExecute(Sender: TObject);
    procedure YeniKapatExecute(Sender: TObject);
    procedure qRolAfterEdit(DataSet: TDataSet);
    procedure RolTreeChange(Sender: TObject; Node: TTreeNode);
    procedure dxBarButton2Click(Sender: TObject);
    procedure YeniKaydetExecute(Sender: TObject);
    procedure PageControl1PageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure dRolDataChange(Sender: TObject; Field: TField);
    procedure dRolStateChange(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private

      Procedure MngQuery;
      Procedure ManagePrivillegsEkBuffer(Node: TTreeNode; Operation: Char; Index : Integer);
      Procedure BufferYukle;
  public
    { Public declarations }
  end;

var
  Erp2000_Roller_Genel: TErp2000_Roller_Genel;

implementation

Uses BlyLib, dModule,ErpMenu;

Var
  Buffer     : Array[1..9999] Of Boolean;
  Buffer_Tur_Yetki   : Array[1..9999] Of Boolean;
  EkBuffer : Array of Array Of Boolean;  // 1.Rol ItemIndex, 2.RolYetki
  EkBufferdeDegisiklik : Array Of Boolean;
  EkBufferAcildi      : Boolean;

{$R *.DFM}

Procedure TErp2000_Roller_Genel.MngQuery;
Begin
 if qRol.Active Then qRol.Close;
    qRol.Sql.Clear;
    qRol.SQL.Add('SELECT * FROM ROLLER WHERE TUR = ' + #39 + LoginInfo.RolTur + #39);

 if EdArama.Text <> '' Then qRol.SQL.Add(' AND ' + _SQLString('KOD',EdArama.Text,'S'));
    qRol.SQL.Add('ORDER BY KOD');
//    QRol.SQL.SaveToFile('c:\rol.txt');
    Try
       qRol.Open;
    Except
    End;
End;

Procedure AvaiblePrivillegs(S: String);
Begin
  Buffer[StrToInt('0' + Copy(S, 2, Pos(')', S) - 2))] := True;
End;

Procedure DisablePrivillegs(S: String);
Begin
  Buffer[StrToInt('0' + Copy(S, 2, Pos(')', S) - 2))] := False;
End;

Function StatePrivillegs(S: String): Integer;
Begin
  if Buffer[StrToInt('0' + Copy(S, 2, Pos(')', S) - 2))] Then StatePrivillegs := 2
                                                         Else StatePrivillegs := 1;
End;

Procedure ManagePrivillegs(Node: TTreeNode; Operation: Char);
Var
  I: Integer;
  Function FiltreyeUygunmu(S : String) : Boolean;
  Begin
      If (Erp2000_Roller_Genel.CxTumu.Checked) Or (Erp2000_Roller_Genel.Panel6.Visible = False) Or (Not(Erp2000_Roller_Genel.QRol.State In [DsEdit,DsInsert])) Then Result := True
        Else
      Begin
          Result := False;
          If (Result = False) And (Erp2000_Roller_Genel.CxIncele.Checked)   Then If (Pos('Ýncele',S) > 0) Or (Pos('Ýzleme',S) > 0)        Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxEkle.Checked)     Then If (Pos('Ekle',S) > 0) Or (Pos('Ekleme',S) > 0)          Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxYetkiler.Checked) Then If (Pos(  ','+ Copy(S, 2, Pos(')', S) - 2)+',',Erp2000_Roller_Genel.CxTextEdit2.Text) > 0) Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxDegistir.Checked) Then If (Pos('Deðiþtir',S) > 0) Or (Pos('Deðiþtirme',S) > 0)  Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxSil.Checked)      Then If (Pos('Sil',S) > 0) Or (Pos('Silme',S) > 0)            Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxIcinde.Checked)   Then If (Pos(Erp2000_Roller_Genel.CxIcindeEdit.Text,S) > 0)   Then Result := True;
      End;
  End;

Begin
  if Node.HasChildren Then
     Begin
       Node.SelectedIndex := -1;
       Node.StateIndex    := -1;
       Node.ImageIndex    := -1;
       For I := 0 To (Node.Count - 1) Do ManagePrivillegs(Node.Item[I], Operation);
     End
     Else
        If FiltreyeUygunmu(Node.Text) Then
        Begin
         Case Operation Of
            '+': Begin
                   Node.SelectedIndex := 2;
                   Node.ImageIndex    := 2;
                   Node.StateIndex    := 2;
                   AvaiblePrivillegs(Node.Text);
                 End;
            '-': Begin
                   Node.SelectedIndex := 1;
                   Node.ImageIndex    := 1;
                   Node.StateIndex    := 1;
                   DisablePrivillegs(Node.Text);
                 End;
            Else Begin
                   Node.SelectedIndex := StatePrivillegs(Node.Text);
                   Node.ImageIndex    := StatePrivillegs(Node.Text);
                   Node.StateIndex    := StatePrivillegs(Node.Text);
                 End;
        End;
     End;
End;

Procedure LoadToBuffer(F: String; K: Integer);
Var
  S: String;
Begin
  S := _Crypto(False, Erp2000_Roller_Genel.qRol.FieldByName(F).AsString, K);
  While Length(S) > 1 Do
  Begin
    If Buffer_Tur_Yetki[StrToInt(Copy(S, 1, 4))] Then Buffer[StrToInt(Copy(S, 1, 4))] := True;
    if Length(S) > 4 Then Delete(S, 1, 5)
                     Else Delete(S, 1, 4);
  End;
End;

Procedure TErp2000_Roller_Genel.BufferYukle;
Var
  I: Integer;
begin
 If PageControl1.ActivePage = TabSheet2 Then
 Begin
  For I := 1 To 9999 Do Buffer[I] := False;
  For I := 1 To 9999 Do Buffer_Tur_Yetki[I] := False;

  SQLList(DmGlobal.QTmp,'SELECT YETKI_NO FROM TANIM_YETKI WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + ' AND YETKI_NO > 0 ORDER BY YETKI_NO');
  DmGlobal.QTmp.First;
  While Not(DmGlobal.QTmp.Eof) Do
  Begin
      Buffer_Tur_Yetki[DmGlobal.QTmp.FieldByName('YETKI_NO').AsInteger] := True;
      DmGlobal.QTmp.Next;
  End;

  LoadToBuffer('YETKI_0', 1);
  LoadToBuffer('YETKI_1', 2);
  LoadToBuffer('YETKI_2', 3);
  LoadToBuffer('YETKI_3', 4);
  LoadToBuffer('YETKI_4', 5);
  LoadToBuffer('YETKI_5', 5);
  LoadToBuffer('YETKI_6', 4);
  LoadToBuffer('YETKI_7', 3);
  LoadToBuffer('YETKI_8', 2);
  LoadToBuffer('YETKI_9', 1);
  LoadToBuffer('YETKI_A', 1);
  LoadToBuffer('YETKI_B', 2);
  LoadToBuffer('YETKI_C', 3);
  LoadToBuffer('YETKI_D', 4);
  LoadToBuffer('YETKI_E', 5);
  LoadToBuffer('YETKI_F', 6);
  LoadToBuffer('YETKI_G', 1);
  LoadToBuffer('YETKI_H', 2);
  LoadToBuffer('YETKI_I', 3);
  LoadToBuffer('YETKI_J', 4);
  LoadToBuffer('YETKI_K', 5);
  LoadToBuffer('YETKI_L', 6);
  LoadToBuffer('YETKI_M', 7);
  LoadToBuffer('YETKI_N', 1);
  LoadToBuffer('YETKI_O', 2);
  LoadToBuffer('YETKI_P', 3);
  LoadToBuffer('YETKI_R', 4);
  LoadToBuffer('YETKI_S', 5);
  LoadToBuffer('YETKI_T', 6);
  LoadToBuffer('YETKI_Y', 7);
  LoadToBuffer('YETKI_U', 1);
  LoadToBuffer('YETKI_V', 2);
  LoadToBuffer('YETKI_A1', 3);
  LoadToBuffer('YETKI_A2', 4);
  LoadToBuffer('YETKI_A3', 5);
  LoadToBuffer('YETKI_A4', 6);
  LoadToBuffer('YETKI_A5', 7);
  LoadToBuffer('YETKI_A6', 1);
  LoadToBuffer('YETKI_A7', 2);
  LoadToBuffer('YETKI_A8', 3);
  LoadToBuffer('YETKI_A9', 4);
  LoadToBuffer('YETKI_A10',5);
  LoadToBuffer('YETKI_A11',6);
  LoadToBuffer('YETKI_A12',7);
  LoadToBuffer('YETKI_A13',1);
  LoadToBuffer('YETKI_A14',2);
  LoadToBuffer('YETKI_A15',3);
  LoadToBuffer('YETKI_A16',4);
  LoadToBuffer('YETKI_A17',5);
  LoadToBuffer('YETKI_A18',6);
  LoadToBuffer('YETKI_A19',7);
  LoadToBuffer('YETKI_A20',1);
  LoadToBuffer('YETKI_A21',2);
  LoadToBuffer('YETKI_A22',3);
  LoadToBuffer('YETKI_A23',4);
  LoadToBuffer('YETKI_A24',5);
  LoadToBuffer('YETKI_A25',6);
  LoadToBuffer('YETKI_A26',7);
  LoadToBuffer('YETKI_A27',1);
  LoadToBuffer('YETKI_A28',2);
  LoadToBuffer('YETKI_A29',3);
  LoadToBuffer('YETKI_A30',4);
  If RolTree.Items.Count > 0 Then ManagePrivillegs(RolTree.Items[0], #32);
  EkBufferAcildi := False;
 End;
End;


procedure TErp2000_Roller_Genel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action := caFree;
end;

procedure TErp2000_Roller_Genel.FormDestroy(Sender: TObject);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;

  if qRol.State In [dsInsert, dsEdit] Then qRol.Cancel;
  if qRol.Active Then qRol.Close;
end;

procedure TErp2000_Roller_Genel.pmIlkClick(Sender: TObject);
begin
    qRol.First;
    BufferYukle;
end;

procedure TErp2000_Roller_Genel.pmOncekiClick(Sender: TObject);
begin
  qRol.Prior;
  BufferYukle;
end;

procedure TErp2000_Roller_Genel.pmSonrakiClick(Sender: TObject);
begin
  qRol.Next;
  BufferYukle;
end;

procedure TErp2000_Roller_Genel.pmSonClick(Sender: TObject);
begin
  qRol.Last;
  BufferYukle;
end;

procedure TErp2000_Roller_Genel.pmAgacClick(Sender: TObject);
begin
  RolTree.FullExpand;
end;

procedure TErp2000_Roller_Genel.qRolAfterDelete(DataSet: TDataSet);
begin
  dmGlobal.dbGlobal.StartTransaction;
  Try
    qRol.ApplyUpdates;
    dmGlobal.dbGlobal.Commit;
    qRol.CommitUpdates;
  Except
   On E : Exception do
   Begin
     dmGlobal.dbGlobal.Rollback;
     MessageDlg('Kullanýcý ROL tanýmý silme iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi ! Hata Mesajý : ' + E.Message , mtError, [mbOK], 0);
   End;
  End;
  qRolAfterScroll(Nil);
  BufferYukle;
end;

Function GetFromEkBuffer(RolIndex : Integer): String;
Var
  S: String;
  T: String;
  I: Integer;
Begin
  S := '';
  For I := 1 To 9999 Do
      Begin
        if EkBuffer[RolIndex,I] and (Length(S) < 251) Then
           Begin
             T := IntToStr(I);
             While Length(T) < 4 Do T := '0' + T;
             if Length(S) > 0 Then S := S + ';' + T
                              Else S := T;
             EkBuffer[RolIndex,I] := False;
           End;
      End;
  GetFromEkBuffer := S;
End;

procedure TErp2000_Roller_Genel.qRolAfterPost(DataSet: TDataSet);
Var
   I : Integer;
   Kod : String;
begin
  dmGlobal.dbGlobal.StartTransaction;
  Try
    qRol.ApplyUpdates;
    dmGlobal.dbGlobal.Commit;
    qRol.CommitUpdates;

  If EkBufferAcildi Then
  Begin
    Pb.Visible  := True;
    Pb.Max      := ChRol.Items.Count - 1;
    Pb.Position := 0;
    For I := 0 To ChRol.Items.Count - 1 Do
    Begin
        If (ChRol.Checked[I]) And (ChRol.Items.Strings[I] <> qRolKOD.AsString) And (EkBufferdeDegisiklik[I]) Then
           SQLRecord('UPDATE ROLLER SET ' +
                                    'YETKI_0  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_1  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_2  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_3  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_4  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_5  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_6  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_7  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_8  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_9  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_A  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_B  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_C  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_D  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_E  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_F  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),6) + #39 + ','' ''),' +
                                    'YETKI_G  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_H  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_I  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_J  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_K  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_L  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),6) + #39 + ','' ''),' +
                                    'YETKI_M  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),7) + #39 + ','' ''),' +
                                    'YETKI_N  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_O  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_P  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_R  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_S  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_T  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),6) + #39 + ','' ''),' +
                                    'YETKI_Y  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),7) + #39 + ','' ''),' +
                                    'YETKI_U  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_V  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_A1  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_A2  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_A3  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_A4  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),6) + #39 + ','' ''),' +
                                    'YETKI_A5  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),7) + #39 + ','' ''),' +
                                    'YETKI_A6  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_A7  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_A8  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_A9  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_A10  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_A11  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),6) + #39 + ','' ''),' +
                                    'YETKI_A12  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),7) + #39 + ','' ''),' +
                                    'YETKI_A13  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_A14  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_A15  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_A16  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_A17  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_A18  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),6) + #39 + ','' ''),' +
                                    'YETKI_A19  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),7) + #39 + ','' ''),' +
                                    'YETKI_A20  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_A21  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_A22  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_A23  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' ''),' +
                                    'YETKI_A24  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),5) + #39 + ','' ''),' +
                                    'YETKI_A25  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),6) + #39 + ','' ''),' +
                                    'YETKI_A26  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),7) + #39 + ','' ''),' +
                                    'YETKI_A27  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),1) + #39 + ','' ''),' +
                                    'YETKI_A28  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),2) + #39 + ','' ''),' +
                                    'YETKI_A29  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),3) + #39 + ','' ''),' +
                                    'YETKI_A30  = NVL('  +  #39 + _Crypto(True, GetFromEkBuffer(I),4) + #39 + ','' '')' +
                   ' WHERE KOD = ' + #39 + ChRol.Items.Strings[I] + #39);
       Pb.Position := Pb.Position + 1;
    End;
   End;
   Pb.Visible := False;
   EkBufferAcildi := False;
  Except
  On E : Exception do
  Begin
    dmGlobal.dbGlobal.Rollback;
    EkBufferAcildi := False;
    MessageDlg('Kullanýcý ROL tanýmý kayýt iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi ! [ Hata Mesajý : ' + E.Message + ' ]', mtError, [mbOK], 0);
  End;
  End;
  EkBufferAcildi := False;
  Kod := qRolKOD.AsString;
  QRol.Close;
  QRol.Open;
  QRol.Locate('KOD', KOD, [loPartialKey]);
  qRolAfterScroll(Nil);
  PageControl1.ActivePage := TabSheet1;
end;


Function GetFromBuffer: String;
Var
  S: String;
  T: String;
  I: Integer;
Begin
  S := '';
  For I := 1 To 9999 Do
      Begin
        if Buffer[I] and (Length(S) < 251) Then
           Begin
             T := IntToStr(I);
             While Length(T) < 4 Do T := '0' + T;
             if Length(S) > 0 Then S := S + ';' + T
                              Else S := T;
             Buffer[I] := False;
           End;
      End;
  GetFromBuffer := S;
End;

procedure TErp2000_Roller_Genel.qRolBeforePost(DataSet: TDataSet);
Var
   I: Integer;
   YetkiVar : Boolean;
begin
  qRol.FieldByName('SDY').AsString := LoginInfo.Kod;
  qRol.FieldByName('SDT').AsString := DateToStr(Now);

  YetkiVar := False;
  If qRolKOD.AsString = '' Then
  Begin
      Application.MessageBox('[Rol Açýklama ] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
      DBEdit2.SelStart               := 0;
      DBEdit2.SelLength              := Length(DBEdit2.Text);
      DBEdit2.SetFocus;
      Abort;
  End;

  if MessageDlg('ROL tanýmý kaydedilecek, iþlemi onaylýyormusunuz ?', mtError, [mbYes, mbNo], 0) = mrYes Then
     Begin
       qRol.FieldByName('YETKI_0').AsString  := _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_1').AsString  := _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_2').AsString  := _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_3').AsString  := _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_4').AsString  := _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_5').AsString  := _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_6').AsString  := _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_7').AsString  := _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_8').AsString  := _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_9').AsString  := _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_A').AsString  := _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_B').AsString  := _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_C').AsString  := _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_D').AsString  := _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_E').AsString  := _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_F').AsString  := _Crypto(True, GetFromBuffer,6);
       qRol.FieldByName('YETKI_G').AsString  := _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_H').AsString  := _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_I').AsString  := _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_J').AsString  := _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_K').AsString  := _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_L').AsString  := _Crypto(True, GetFromBuffer,6);
       qRol.FieldByName('YETKI_M').AsString  := _Crypto(True, GetFromBuffer,7);
       qRol.FieldByName('YETKI_N').AsString  := _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_O').AsString  := _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_P').AsString  := _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_R').AsString  := _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_S').AsString  := _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_T').AsString  := _Crypto(True, GetFromBuffer,6);
       qRol.FieldByName('YETKI_Y').AsString  := _Crypto(True, GetFromBuffer,7);
       qRol.FieldByName('YETKI_U').AsString  := _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_V').AsString  := _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_A1').AsString := _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_A2').AsString := _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_A3').AsString := _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_A4').AsString := _Crypto(True, GetFromBuffer,6);
       qRol.FieldByName('YETKI_A5').AsString := _Crypto(True, GetFromBuffer,7);
       qRol.FieldByName('YETKI_A6').AsString := _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_A7').AsString := _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_A8').AsString := _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_A9').AsString := _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_A10').AsString:= _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_A11').AsString:= _Crypto(True, GetFromBuffer,6);
       qRol.FieldByName('YETKI_A12').AsString:= _Crypto(True, GetFromBuffer,7);
       qRol.FieldByName('YETKI_A13').AsString:= _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_A14').AsString:= _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_A15').AsString:= _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_A16').AsString:= _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_A17').AsString:= _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_A18').AsString:= _Crypto(True, GetFromBuffer,6);
       qRol.FieldByName('YETKI_A19').AsString:= _Crypto(True, GetFromBuffer,7);
       qRol.FieldByName('YETKI_A20').AsString:= _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_A21').AsString:= _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_A22').AsString:= _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_A23').AsString:= _Crypto(True, GetFromBuffer,4);
       qRol.FieldByName('YETKI_A24').AsString:= _Crypto(True, GetFromBuffer,5);
       qRol.FieldByName('YETKI_A25').AsString:= _Crypto(True, GetFromBuffer,6);
       qRol.FieldByName('YETKI_A26').AsString:= _Crypto(True, GetFromBuffer,7);
       qRol.FieldByName('YETKI_A27').AsString:= _Crypto(True, GetFromBuffer,1);
       qRol.FieldByName('YETKI_A28').AsString:= _Crypto(True, GetFromBuffer,2);
       qRol.FieldByName('YETKI_A29').AsString:= _Crypto(True, GetFromBuffer,3);
       qRol.FieldByName('YETKI_A30').AsString:= _Crypto(True, GetFromBuffer,4);
       For I := 0 To QRol.FieldCount - 1 Do If (Pos('YETKI',qRol.Fields[I].FieldName) > 0) And (qRol.Fields[I].AsString <> '') Then YetkiVar := True;
       If YetkiVar = False Then
       Begin
           Application.MessageBox('Rol tanýmýnda hiç yetki iþaretlenmemiþ. Ýþlem iptal edildi.','DÝKKAT !',mb_OK);
           Abort;
       End;
     End
     Else Abort;
end;

procedure TErp2000_Roller_Genel.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Not(qRol.State In [dsInsert, dsEdit]);
end;

procedure TErp2000_Roller_Genel.qRolBeforeEdit(DataSet: TDataSet);
begin
  if PageControl1.ActivePage = TabSheet1 Then PageControl1.ActivePage := TabSheet2;
end;

procedure TErp2000_Roller_Genel.qRolAfterScroll(DataSet: TDataSet);
Begin
 Try
  YeniEkle.Enabled      := (qRol.State = dsBrowse)  And (LoginInfo.Haklar[2]);
  pmRol.Enabled         := qRol.State = dsBrowse;
  YeniKaydet.Enabled    := qRol.State In [dsInsert, dsEdit];
  YeniVazgec.Enabled    := qRol.State In [dsInsert, dsEdit];
  YeniYetkiVer.Enabled  := (qRol.State In [dsInsert, dsEdit]) and (RolTree.Selected <> Nil    );
  YeniYetkiAl.Enabled   := (qRol.State In [dsInsert, dsEdit]) and (RolTree.Selected <> Nil);
  YeniKapat.Enabled     := (qRol.State = dsBrowse);
  FiltreYetki.Enabled   := (PageControl1.ActivePage = TabSheet2) And (QRol.State In [DsEdit,DsInsert]) And (RolTree.Selected <> Nil);
  pmIlk.Enabled         := Not(qRol.BOF);
  pmOnceki.Enabled      := Not(qRol.BOF);
  pmSonraki.Enabled     := Not(qRol.EOF);
  pmSon.Enabled         := Not(qRol.EOF);
     If qRol.State = dsBrowse Then
     Begin
       YeniDegistir.Enabled := (qRol.FieldByName('KOD').AsString <> '') And (LoginInfo.Haklar[2]);
       YeniSil.Enabled      := (qRol.FieldByName('KOD').AsString <> '') And (LoginInfo.Haklar[6751]);
     End
       Else
     Begin
       YeniDegistir.Enabled := False;
       YeniSil.Enabled      := False;
     End;
  Except
  End;
end;

procedure TErp2000_Roller_Genel.RolTree1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key In ['+', '-'] Then ManagePrivillegs(RolTree.Selected, Key);
end;

procedure TErp2000_Roller_Genel.qRolAfterInsert(DataSet: TDataSet);
var
  I: Integer;
begin
   For I := 1 To 9999 Do Buffer[I] := False;
   qRolTUR.AsString := LoginInfo.RolTur;
   BufferYukle;
end;

procedure TErp2000_Roller_Genel.FormActivate(Sender: TObject);
begin
 //  RolTree.FullExpand;
 // If RolTree.Items.Count > 0 Then Roltree.Items[0].MakeVisible;
end;

procedure TErp2000_Roller_Genel.TmDurumTimer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := LoginInfo.Isim;
  StatusBar1.Panels[1].Text := FormatDateTime('dd mmmm yyyy hh:mm:ss', Date + Time);
  if QRol.Active then
  Begin
    Try
      If qRol.State = dsBrowse Then
      Begin
          StatusBar1.Panels[3].Text := qRol.FieldByName('SDY').AsString;
          StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', dRol.DataSet.FieldByName('SDT').AsDateTime);
      End
       Else
      Begin
          StatusBar1.Panels[3].Text := '...';
          StatusBar1.Panels[4].Text := '...';
      End;
    Except
    End;
  End;
end;

procedure TErp2000_Roller_Genel.FormCreate(Sender: TObject);
Var
  I,I1 : Integer;
begin
    YeniEkle.Visible     := Not(YonetimIslemleriIzleyiciMod);
    YeniDegistir.Visible := Not(YonetimIslemleriIzleyiciMod);
    YeniSil.Visible      := Not(YonetimIslemleriIzleyiciMod);
    YeniKaydet.Visible   := Not(YonetimIslemleriIzleyiciMod);
    YeniVazgec.Visible   := Not(YonetimIslemleriIzleyiciMod);
    YeniYetkiVer.Visible := Not(YonetimIslemleriIzleyiciMod);
    YeniYetkiAl.Visible  := Not(YonetimIslemleriIzleyiciMod);
    PmRol.Visible        := Not(YonetimIslemleriIzleyiciMod);


    Left := ((Yonetim_Menu.Width - 220) div 2) - (Width  div 2);
    Top  := ((Yonetim_Menu.Height - 80) div 2) - (Height div 2);

    RolTree.Visible := False;
    SQLList(QTree,'SELECT TANIM_YETKI.*,''PARENT'' AS STATE, ' +
                  ' CASE WHEN YETKI_NO = 0 THEN YETKI_ACIKLAMA ELSE ' +
                  '''(''||DECODE(LENGTH(YETKI_NO),1,''000'',2,''00'',3,''0'')||YETKI_NO||'') ''||YETKI_ACIKLAMA ' +
                  ' END AS YETKI ' +
                  ' FROM TANIM_YETKI WHERE TUR =' + #39 + LoginInfo.RolTur + #39);
    RolTree.Items.Clear;
    RolTree.Items := DbRolTree.Items;
    RolTree.Visible := True;
    RolTree.StateImages := AcImages;
    QTree.Close;
    PageControl1.ActivePage := TabSheet1;
    MngQuery;
    EkBufferAcildi := False;
end;

procedure TErp2000_Roller_Genel.PageControl1Change(Sender: TObject);
Var
  I,I1 : Integer;
begin
    If (PageControl1.ActivePage = TabSheet2) And (QRol.Active) Then
    Begin
        BufferYukle;
        If RolTree.Items.Count > 0 Then
        Begin
            RolTree.Items[1].MakeVisible;
            RolTree.Items[1].Selected;
        End;
    End;
    FiltreYetki.Enabled  := (PageControl1.ActivePage = TabSheet2) And (QRol.State In [DsEdit,DsInsert]);
end;

procedure TErp2000_Roller_Genel.pmRolClick(Sender: TObject);
begin
    SQLList(DmGlobal.QTmp,'SELECT ID001 FROM BELIT_DEFAULT.SYS_DEF0004ID WHERE ID001 LIKE ' + #39 + Copy(Dmglobal.dbGlobal.Username,1,5) + '%' + #39 + ' AND ID001 NOT LIKE ''MERCEK%'' ORDER BY ID001 DESC');
    DmGlobal.QTmp.First;
    VtSec.Items.Clear;
    While Not(DmGlobal.QTmp.Eof) do
    Begin
        VtSec.Items.Add;
        VtSec.Items[VtSec.Items.Count -1].Text := DmGlobal.QTmp.FieldByName('ID001').AsString;
        If VtSec.Items[VtSec.Items.Count -1].Text = LoginInfo.OracleKullanici Then VtSec.Items[VtSec.Items.Count -1].Checked := True;
        DmGlobal.QTmp.Next;
    End;
    VtSec.Visible :=  Not(Pos('SEHA',LoginInfo.OracleKullanici) > 0);
   
    Panel4.Visible := True;
    cxTextEdit1.SetFocus;
    cxTextEdit1.SelStart := 0;
    cxTextEdit1.SelLength:= Length(cxTextEdit1.Text);
    CxTextEdit1.Text     := qRolKOD.Text +'-Y';
end;

procedure TErp2000_Roller_Genel.EdAramaKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key=#13) Then
      Begin
        MngQuery;
        edArama.SetFocus;
        edArama.SelStart := 0;
        edArama.SelLength:= Length(edArama.Text);
        ActiveControl    := edArama;
        Key := #0;
      End;
end;

procedure TErp2000_Roller_Genel.Edit1KeyPress(Sender: TObject; var Key: Char);
Var
   I : Integer;
begin
  if Key = #13 then
  Begin
    RolTree.Visible := False;
    for I := 0 to RolTree.Items.Count - 1 do
    Begin
        If Copy(RolTree.Items[I].Text,2,4) = (Sender As TEdit).Text then
        Begin
            RolTree.Visible := True;
            PageControl1.ActivePageIndex := 1;
            RolTree.SetFocus;
            RolTree.Selected := RolTree.Items[I];
            Abort;
        End;
    End;
    RolTree.Visible := True;
    ShowMessage('Ýlgili Yetki Numarasý bulunamadý !');
  End;
end;

procedure TErp2000_Roller_Genel.RolKaydet1Click(Sender: TObject);
begin
  RolTree.SaveToFile('C:\Belit\Rol.XLS');
  ShowMessage('Rol kayýt iþlemi tamamlandý.')
end;

procedure TErp2000_Roller_Genel.RolTree222KeyPress(Sender: TObject;
  var Key: Char);
begin
//  if Key In ['+', '-'] Then ManagePrivillegs(RolTree.Selected, Key);
end;

procedure TErp2000_Roller_Genel.cxButton1Click(Sender: TObject);
var
   S:String;
   I : Integer;
   BOFID : String;
begin
    if MessageDlg('ROL kopyalama iþlemi yapýlcaktýr, onaylýyormusunuz ?', mtError, [mbYes, mbNo], 0) = mrNo Then Exit;
    For I := 0 to VTSec.Count - 1 do
    Begin
        if VTSec.Items[I].Checked then
        Begin
           Try
            SQLList(DMGlobal.QTmp,'SELECT KOD FROM ' + VTSec.Items[I].Text + '.ROLLER WHERE KOD = ' + #39 + cxTextEdit1.Text + #39);
            If DMGlobal.QTmp.FieldByName('KOD').AsString = '' Then
            Begin
                If LoginInfo.RolTur <> 'P' then
                Begin
                    SQLList(DmGlobal.QTmp,' (SELECT BOF_ID FROM ' + VTSec.Items[I].Text + '.IK_T_BOF WHERE ROWNUM = 1) ');
                    BOFID := DmGlobal.QTmp.FieldByName('BOF_ID').AsString;
                End Else BOFID := LoginInfo.RolTur;

                S:='INSERT INTO ' + VTSec.Items[I].Text + '.ROLLER (KOD,YETKI_0,YETKI_1,YETKI_2,YETKI_3,YETKI_4,YETKI_5,YETKI_6,YETKI_7,YETKI_8,YETKI_9,' +
                  ' YETKI_A,YETKI_B,YETKI_C,YETKI_D,YETKI_E,YETKI_F,SDY,SDT,YETKI_G,YETKI_H,YETKI_I,YETKI_J, ' +
                  ' YETKI_K,YETKI_L,YETKI_M,YETKI_N,YETKI_O,YETKI_P,YETKI_R,YETKI_S,YETKI_T,YETKI_Y,YETKI_U,' +
                  ' YETKI_V,YETKI_A1,YETKI_A2,YETKI_A3,YETKI_A4,YETKI_A5,YETKI_A6,YETKI_A7,YETKI_A8,YETKI_A9,' +
                  ' YETKI_A10,YETKI_A11,YETKI_A12,YETKI_A13,YETKI_A14,YETKI_A15,YETKI_A16,YETKI_A17,YETKI_A18,' +
                  ' YETKI_A19,YETKI_A20,YETKI_A21,YETKI_A22,TUR,YETKI_A23,YETKI_A24,YETKI_A25,YETKI_A26,YETKI_A27,' +
                  ' YETKI_A28,YETKI_A29,YETKI_A30 )' +
                  ' VALUES('+#39+ cxTextEdit1.Text + #39+','
                                +#39+ qRolYETKI_0.Text +#39+ ','
                                +#39+ qRolYETKI_1.Text +#39+ ','
                                +#39+ qRolYETKI_2.Text +#39+ ','
                                +#39+ qRolYETKI_3.Text +#39+ ','
                                +#39+ qRolYETKI_4.Text +#39+ ','
                                +#39+ qRolYETKI_5.Text +#39+ ','
                                +#39+ qRolYETKI_6.Text +#39+ ','
                                +#39+ qRolYETKI_7.Text +#39+ ','
                                +#39+ qRolYETKI_8.Text +#39+ ','
                                +#39+ qRolYETKI_9.Text +#39+ ','
                                +#39+ qRolYETKI_A.Text +#39+ ','
                                +#39+ qRolYETKI_B.Text +#39+ ','
                                +#39+ qRolYETKI_C.Text +#39+ ','
                                +#39+ qRolYETKI_D.Text +#39+ ','
                                +#39+ qRolYETKI_E.Text +#39+ ','
                                +#39+ qRolYETKI_F.Text +#39+ ','
                                +#39+ qRolSDY.Text +#39+ ','
                                +   'SYSDATE'+ ','
                                +#39+ qRolYETKI_G.Text +#39+ ','
                                +#39+ qRolYETKI_H.Text +#39+ ','
                                +#39+ qRolYETKI_I.Text +#39+ ','
                                +#39+ qRolYETKI_J.Text +#39+ ','
                                +#39+ qRolYETKI_K.Text +#39+ ','
                                +#39+ qRolYETKI_L.Text +#39+ ','
                                +#39+ qRolYETKI_M.Text +#39+ ','
                                +#39+ qRolYETKI_N.Text +#39+ ','
                                +#39+ qRolYETKI_O.Text +#39+ ','
                                +#39+ qRolYETKI_P.Text +#39+ ','
                                +#39+ qRolYETKI_R.Text +#39+ ','
                                +#39+ qRolYETKI_S.Text +#39+ ','
                                +#39+ qRolYETKI_T.Text +#39+ ','
                                +#39+ qRolYETKI_Y.Text +#39+ ','
                                +#39+ qRolYETKI_U.Text +#39+ ','
                                +#39+ qRolYETKI_V.Text +#39+ ','
                                +#39+ qRolYETKI_A1.Text +#39+ ','
                                +#39+ qRolYETKI_A2.Text +#39+ ','
                                +#39+ qRolYETKI_A3.Text +#39+ ','
                                +#39+ qRolYETKI_A4.Text +#39+ ','
                                +#39+ qRolYETKI_A5.Text +#39+ ','
                                +#39+ qRolYETKI_A6.Text +#39+ ','
                                +#39+ qRolYETKI_A7.Text +#39+ ','
                                +#39+ qRolYETKI_A8.Text +#39+ ','
                                +#39+ qRolYETKI_A9.Text +#39+ ','
                                +#39+ qRolYETKI_A10.Text +#39+ ','
                                +#39+ qRolYETKI_A11.Text +#39+ ','
                                +#39+ qRolYETKI_A12.Text +#39+ ','
                                +#39+ qRolYETKI_A13.Text +#39+ ','
                                +#39+ qRolYETKI_A14.Text +#39+ ','
                                +#39+ qRolYETKI_A15.Text +#39+ ','
                                +#39+ qRolYETKI_A16.Text +#39+ ','
                                +#39+ qRolYETKI_A17.Text +#39+ ','
                                +#39+ qRolYETKI_A18.Text +#39+ ','
                                +#39+ qRolYETKI_A19.Text +#39+ ','
                                +#39+ qRolYETKI_A20.Text +#39+ ','
                                +#39+ qRolYETKI_A21.Text +#39+ ','
                                +#39+ qRolYETKI_A22.Text +#39+ ','
                                +#39+ BOFID +#39+ ','
                                +#39+ qRolYETKI_A23.Text +#39+ ','
                                +#39+ qRolYETKI_A24.Text +#39+ ','
                                +#39+ qRolYETKI_A25.Text +#39+ ','
                                +#39+ qRolYETKI_A26.Text +#39+ ','
                                +#39+ qRolYETKI_A27.Text +#39+ ','
                                +#39+ qRolYETKI_A28.Text +#39+ ','
                                +#39+ qRolYETKI_A29.Text +#39+ ','
                                +#39+ qRolYETKI_A30.Text +#39+')';

                dmGlobal.qTmp.Close;
                dmGlobal.qTmp.SQL.Clear;
                dmGlobal.qTmp.SQL.Add(S);
                dmGlobal.qTmp.ExecSQL;
                dmGlobal.qTmp.Close;
                dmGlobal.qTmp.SQL.Clear;
                dmGlobal.qTmp.SQL.Add('Commit');
                dmGlobal.qTmp.ExecSQL;
            End;
           Except
           End;
        End;
    End;


  S :=  cxTextEdit1.Text;
  if qRol.Active Then qRol.Close;
  QRol.Open;
  QRol.Locate('KOD', S, [loPartialKey]);
  Application.MessageBox('Rol kopyalama iþlemi tamamlanmýþtýr.  !', 'HATA', mb_OK);
end;

procedure TErp2000_Roller_Genel.cxButton2Click(Sender: TObject);
begin
    Panel4.Visible := False;
end;

procedure TErp2000_Roller_Genel.cxButton8Click(Sender: TObject);
begin
    Panel6.Visible := False;
end;


procedure TErp2000_Roller_Genel.FiltreYetkiClick(Sender: TObject);
Var
  I: Integer;

  Procedure LoadToBuffer(F: String; K,K1: Integer);
  Var
    S: String;
  Begin
      S := _Crypto(False, QRol1.FieldByName(F).AsString, K);

      While Length(S) > 1 Do
      Begin
          EkBuffer[K1,StrToInt(Copy(S, 1, 4))] := True;
          if Length(S) > 4 Then Delete(S, 1, 5)
                           Else Delete(S, 1, 4);
      End;
   End;

   Procedure LoadToPrivillages(K : Integer);
   Var
     T: Integer;
   begin
       For T := 1 To 9999 Do EkBuffer[K,T] := False;
        LoadToBuffer('YETKI_0', 1,K);
        LoadToBuffer('YETKI_1', 2,K);
        LoadToBuffer('YETKI_2', 3,K);
        LoadToBuffer('YETKI_3', 4,K);
        LoadToBuffer('YETKI_4', 5,K);
        LoadToBuffer('YETKI_5', 5,K);
        LoadToBuffer('YETKI_6', 4,K);
        LoadToBuffer('YETKI_7', 3,K);
        LoadToBuffer('YETKI_8', 2,K);
        LoadToBuffer('YETKI_9', 1,K);
        LoadToBuffer('YETKI_A', 1,K);
        LoadToBuffer('YETKI_B', 2,K);
        LoadToBuffer('YETKI_C', 3,K);
        LoadToBuffer('YETKI_D', 4,K);
        LoadToBuffer('YETKI_E', 5,K);
        LoadToBuffer('YETKI_F', 6,K);
        LoadToBuffer('YETKI_G', 1,K);
        LoadToBuffer('YETKI_H', 2,K);
        LoadToBuffer('YETKI_I', 3,K);
        LoadToBuffer('YETKI_J', 4,K);
        LoadToBuffer('YETKI_K', 5,K);
        LoadToBuffer('YETKI_L', 6,K);
        LoadToBuffer('YETKI_M', 7,K);
        LoadToBuffer('YETKI_N', 1,K);
        LoadToBuffer('YETKI_O', 2,K);
        LoadToBuffer('YETKI_P', 3,K);
        LoadToBuffer('YETKI_R', 4,K);
        LoadToBuffer('YETKI_S', 5,K);
        LoadToBuffer('YETKI_T', 6,K);
        LoadToBuffer('YETKI_Y', 7,K);
        LoadToBuffer('YETKI_U', 1,K);
        LoadToBuffer('YETKI_V', 2,K);
        LoadToBuffer('YETKI_A1', 3,K);
        LoadToBuffer('YETKI_A2', 4,K);
        LoadToBuffer('YETKI_A3', 5,K);
        LoadToBuffer('YETKI_A4', 6,K);
        LoadToBuffer('YETKI_A5', 7,K);
        LoadToBuffer('YETKI_A6', 1,K);
        LoadToBuffer('YETKI_A7', 2,K);
        LoadToBuffer('YETKI_A8', 3,K);
        LoadToBuffer('YETKI_A9', 4,K);
        LoadToBuffer('YETKI_A10',5,K);
        LoadToBuffer('YETKI_A11',6,K);
        LoadToBuffer('YETKI_A12',7,K);
        LoadToBuffer('YETKI_A13',1,K);
        LoadToBuffer('YETKI_A14',2,K);
        LoadToBuffer('YETKI_A15',3,K);
        LoadToBuffer('YETKI_A16',4,K);
        LoadToBuffer('YETKI_A17',5,K);
        LoadToBuffer('YETKI_A18',6,K);
        LoadToBuffer('YETKI_A19',7,K);
        LoadToBuffer('YETKI_A20',1,K);
        LoadToBuffer('YETKI_A21',2,K);
        LoadToBuffer('YETKI_A22',3,K);
        LoadToBuffer('YETKI_A23',4,K);
        LoadToBuffer('YETKI_A24',5,K);
        LoadToBuffer('YETKI_A25',6,K);
        LoadToBuffer('YETKI_A26',7,K);
        LoadToBuffer('YETKI_A27',1,K);
        LoadToBuffer('YETKI_A28',2,K);
        LoadToBuffer('YETKI_A29',3,K);
        LoadToBuffer('YETKI_A30',4,K);
  End;

begin
    If (RolTree.Selected = Nil) Or Not((RolTree.Focused)) Then Abort;
    cxLabel21.Caption := 'Özel Filtre Verme [' + RolTree.Selected.Text + ']';
    cxRadioGroup1.ItemIndex := -1;
    If EkBufferAcildi = False Then
    Begin
        cxCheckBox7.State := cbsUnChecked;
       SQLList(QRol1, 'SELECT *FROM ROLLER WHERE  TUR = '+ #39 + LoginInfo.RolTur + #39 + ' ORDER BY KOD');
       SQLList(dmGlobal.qTmp2, 'SELECT NVL((SELECT COUNT(*) FROM ROLLER WHERE  TUR = '+ #39 + LoginInfo.RolTur + #39 + ' ),0) AS SAYI FROM DUAL');
       SetLength(EkBuffer,dmGlobal.qTmp2.FieldByName('SAYI').AsInteger,9999);
       SetLength(EkBufferdeDegisiklik,dmGlobal.qTmp2.FieldByName('SAYI').AsInteger);
       For I := 0 To QRol1.RecordCount - 1 Do EkBufferdeDegisiklik[I] := False;

       ChRol.Items.Clear;
       QRol1.First;
       While Not(QRol1.Eof) Do
       Begin
           ChRol.Items.Add(QRol1KOD.AsString);
           LoadToPrivillages(ChRol.Items.Count - 1);
           ChRol.Checked[ChRol.Items.Count - 1] := ChRol.Items.Strings[ChRol.Items.Count - 1] = qRolKOD.AsString;
           QRol1.Next;
       End;
       EkBufferAcildi := True;
    End;
    Panel6.Visible := True;
end;


Procedure TErp2000_Roller_Genel.ManagePrivillegsEkBuffer(Node: TTreeNode; Operation: Char;Index : Integer);
Var
  I: Integer;
  Function FiltreyeUygunmu(S : String) : Boolean;
  Begin
      If (Erp2000_Roller_Genel.CxTumu.Checked) Or (Erp2000_Roller_Genel.Panel6.Visible = False) Or (Not(Erp2000_Roller_Genel.QRol.State In [DsEdit,DsInsert])) Then Result := True
        Else
      Begin
          Result := False;
          If (Result = False) And (Erp2000_Roller_Genel.CxIncele.Checked)   Then If (Pos('Ýncele',S) > 0) Or (Pos('Ýzleme',S) > 0)        Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxYetkiler.Checked) Then If (Pos(  ',' + Copy(S, 2, Pos(')', S) - 2)+',',CxTextEdit2.Text) > 0) Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxEkle.Checked)     Then If (Pos('Ekle',S) > 0) Or (Pos('Ekleme',S) > 0)          Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxDegistir.Checked) Then If (Pos('Deðiþtir',S) > 0) Or (Pos('Deðiþtirme',S) > 0)  Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxSil.Checked)      Then If (Pos('Sil',S) > 0) Or (Pos('Silme',S) > 0)            Then Result := True;
          If (Result = False) And (Erp2000_Roller_Genel.CxIcinde.Checked)   Then If (Pos(Erp2000_Roller_Genel.CxIcindeEdit.Text,S) > 0) Then Result := True;
      End;
  End;
  Procedure StatePrivillegs(S: String;RolIndex :Integer;State:Boolean);
  Begin
      EkBuffer[RolIndex,StrToInt('0' + Copy(S, 2, Pos(')', S) - 2))] := State;
  End;


Begin
  if Node.HasChildren Then
     Begin
       For I := 0 To (Node.Count - 1) Do ManagePrivillegsEkBuffer(Node.Item[I], Operation,Index);
     End
     Else
     Begin
        If FiltreyeUygunmu(Node.Text) Then
        Begin
         Case Operation Of
            '+': Begin
                   StatePrivillegs(Node.Text,Index,True);
                 End;
            '-': Begin
                   StatePrivillegs(Node.Text,Index,False);
                 End;
          End;
        End;
     End;
End;

procedure TErp2000_Roller_Genel.cxButton9Click(Sender: TObject);
Var
  I : Integer;

begin
    If cxTextEdit2.Text <> '' then
    Begin
        If CxTextEdit2.Text[1] <> ',' Then CxTextEdit2.Text := ',' + CxTextEdit2.Text;
        If CxTextEdit2.Text[Length(CxTextEdit2.Text)] <> ',' Then CxTextEdit2.Text := CxTextEdit2.Text + ',';
    End;
    If cxRadioGroup1.ItemIndex = 0 Then  //Yetkiye verme
    Begin
        If RolTree.Selected <> Nil Then ManagePrivillegs(RolTree.Selected, '+')
                                   Else Application.MessageBox('Yetkilendirme için her hangi bir bölüm seçimi yapýlmamýþ !', 'HATA', mb_OK);
    End
       Else
    If cxRadioGroup1.ItemIndex = 1 Then  //Yetkiye verme
    Begin  //Yetkiyi alma
        if RolTree.Selected <> Nil Then ManagePrivillegs(RolTree.Selected, '-')
                                   Else Application.MessageBox('Yetki geri alma için her hangi bir bölüm seçimi yapýlmamýþ !', 'HATA', mb_OK);
    End
       Else
    Begin
        Application.MessageBox('Yetki verme/alma iþlemi iþaretli deyil...','DÝKKAT !',mb_OK);
        cxRadioGroup1.SetFocus;
        Abort;
    End;

    //1.Ýþlem Tamam þimdi iþlemin geçici olarak diðer rollere uyarlanmasý var.
    For I := 0 To chRol.Items.Count - 1 Do
    Begin
        If ((ChRol.Items.Strings[I] <> qRolKOD.AsString) And (ChRol.Checked[I]))  Then
        Begin
            EkBufferdeDegisiklik[I] := True;
            If (cxRadioGroup1.ItemIndex = 0) Then ManagePrivillegsEkBuffer(RolTree.Selected, '+',I)
                                             Else ManagePrivillegsEkBuffer(RolTree.Selected, '-',I);
        End;
    End;
    Panel6.Visible := False;
end;

procedure TErp2000_Roller_Genel.chRolClickCheck(Sender: TObject);
begin
    If (ChRol.Checked[ChRol.ItemIndex] = False) And (ChRol.Items.Strings[ChRol.ItemIndex] = qRolKOD.AsString) Then ChRol.Checked[ChRol.ItemIndex] := True;
end;

procedure TErp2000_Roller_Genel.cxCheckBox7PropertiesChange(
  Sender: TObject);
Var
   I : Integer;
begin
    For I := 0 To ChRol.Items.Count - 1 Do If ChRol.Items.Strings[I] <> qRolKOD.AsString Then ChRol.Checked[I] := cxCheckBox7.State = cbsChecked;
end;

procedure TErp2000_Roller_Genel.CxTumuPropertiesChange(Sender: TObject);
begin
    CxIncele.Properties.OnChange   := Nil;
    CxDegistir.Properties.OnChange := Nil;
    CxSil.Properties.OnChange      := Nil;
    CxEkle.Properties.OnChange     := Nil;
    CxIcinde.Properties.OnChange   := Nil;
    CxYetkiler.Properties.OnChange   := Nil;
    CxIncele.Checked               := Not(CxTumu.Checked);
    CxYetkiler.Checked             := Not(CxTumu.Checked);
    CxDegistir.Checked             := Not(CxTumu.Checked);
    CxSil.Checked                  := Not(CxTumu.Checked);
    CxEkle.Checked                 := Not(CxTumu.Checked);
    CxIcinde.Checked               := Not(CxTumu.Checked);
    CxIcindeEdit.Enabled           := CxIcinde.Checked;
    CxIncele.Properties.OnChange   := CxIncelePropertiesChange;
    CxDegistir.Properties.OnChange := CxIncelePropertiesChange;
    CxSil.Properties.OnChange      := CxIncelePropertiesChange;
    CxEkle.Properties.OnChange     := CxIncelePropertiesChange;
    CxIcinde.Properties.OnChange   := CxIncelePropertiesChange;
    CxYetkiler.Properties.OnChange := CxIncelePropertiesChange;
    cxTextEdit2.Enabled            := CxYetkiler.Enabled;
end;

procedure TErp2000_Roller_Genel.CxIncelePropertiesChange(
  Sender: TObject);
begin
    CxTumu.Properties.OnChange := Nil;
    CxTumu.Checked             := False;
    If (Sender As TcxCheckBox) = CxIcinde   Then CxIcindeEdit.Enabled := (Sender As TcxCheckBox).Checked;
    If (Sender As TcxCheckBox) = CxYetkiler Then CxTextEdit2.Enabled  := (Sender As TcxCheckBox).Checked;
    CxTumu.Properties.OnChange := CxTumuPropertiesChange;
end;

procedure TErp2000_Roller_Genel.qRolAfterCancel(DataSet: TDataSet);
begin
    EkBufferAcildi := False;
    BufferYukle;
end;

procedure TErp2000_Roller_Genel.RolTreeKeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key In ['+', '-'] Then ManagePrivillegs(RolTree.Selected, Key);
end;

procedure TErp2000_Roller_Genel.YeniEkleExecute(Sender: TObject);
begin
    qRol.Insert;
end;

procedure TErp2000_Roller_Genel.YeniDegistirExecute(Sender: TObject);
begin
    qRol.Edit;
end;

procedure TErp2000_Roller_Genel.YeniSilExecute(Sender: TObject);
begin
  if Application.MessageBox('Rol Silmek istediðinizden emin misiniz??','DÝKKAT !',mb_YesNo+mb_DefButton2)= idNo then Exit;

  dmGlobal.qtmp.Close;
  dmGlobal.qtmp.SQL.Clear;
  dmGlobal.qtmp.SQL.Add('SELECT COUNT(*) FROM KULLANICI WHERE KOD IN (SELECT KOD FROM KULLANICI_ROL WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + ' AND ROL = '''+qRolKOD.Asstring+''')');
  dmGlobal.qtmp.Open;
  if dmGlobal.qtmp.Fields[0].AsFloat >= 1 then
     begin
       Application.MessageBox('Bu ROL tanýmý hareket gördüðünden silme iþlemi iptal edildi. !','HATA',mb_OK);
       Exit;
     end;

  qRol.Delete;
end;

procedure TErp2000_Roller_Genel.YeniVazgecExecute(Sender: TObject);
begin
    If Application.MessageBox('Yapýlan iþlemlerden vazgeçilecektir . Onaylýyormusunuz ?','Dikkat !',Mb_YesNo) = idNo Then Abort;
    qRol.Cancel;
end;

procedure TErp2000_Roller_Genel.YeniYetkiVerExecute(Sender: TObject);
begin
  if RolTree.Selected <> Nil Then ManagePrivillegs(RolTree.Selected, '+')
                             Else Application.MessageBox('Yetkilendirme için her hangi bir bölüm seçimi yapýlmamýþ !', 'HATA', mb_OK);
end;

procedure TErp2000_Roller_Genel.YeniYetkiAlExecute(Sender: TObject);
begin
  if RolTree.Selected <> Nil Then ManagePrivillegs(RolTree.Selected, '-')
                             Else Application.MessageBox('Yetki geri alma için her hangi bir bölüm seçimi yapýlmamýþ !', 'HATA', mb_OK);
end;

procedure TErp2000_Roller_Genel.YeniKapatExecute(Sender: TObject);
begin
    Close;
end;

procedure TErp2000_Roller_Genel.qRolAfterEdit(DataSet: TDataSet);
begin
    BufferYukle;
end;

procedure TErp2000_Roller_Genel.RolTreeChange(Sender: TObject;
  Node: TTreeNode);
begin
    RolTree.Selected := Node;
    qRolAfterScroll(qROL);    
end;

procedure TErp2000_Roller_Genel.dxBarButton2Click(Sender: TObject);
begin
   QRol.Post;
end;

procedure TErp2000_Roller_Genel.YeniKaydetExecute(Sender: TObject);
begin
    Qrol.Post;
end;

procedure TErp2000_Roller_Genel.PageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
    AllowChange := ((QRol.State In [DsEdit,DsInsert]) And (NewPage = TabSheet2)) Or (Not(QRol.State In [DsEdit,DsInsert]));
end;

procedure TErp2000_Roller_Genel.dRolDataChange(Sender: TObject;
  Field: TField);
begin
    qRolAfterScroll(qROL);
end;

procedure TErp2000_Roller_Genel.dRolStateChange(Sender: TObject);
begin
    qRolAfterScroll(qROL);
end;

end.








