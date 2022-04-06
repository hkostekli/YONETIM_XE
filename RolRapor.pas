unit RolRapor;
{$INCLUDE Unit\Belit.Inc}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Buttons, StdCtrls, Grids, DBGrids, DB, SQLMemMain,
  DBAccess, Ora, OraSmart, MemDS, OraError, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, cxCustomPivotGrid, cxDBPivotGrid, ExtCtrls, cxPC, Menus,
  cxLookAndFeelPainters, cxButtons, cxgridexportlink, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxContainer, cxLabel, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCheckBox,StrUtils,
  dxtree, dxdbtree, cxCheckComboBox, ActnList, kquerpnl, cxGroupBox,
  dxDockPanel, dxDockControl, kdbstruc, kdbinfo, kbdeinfo, cxMemo, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, cxLookAndFeels,
  dxBarBuiltInMenu, cxNavigator, dxSkinsdxDockControlPainter, System.Actions;

type
  TRolRaporForm = class(TForm)
    TTree: TSQLMemTable;
    STree: TDataSource;
    QRol1: TOraQuery;
    SRol1: TDataSource;
    cxPageControl1: TcxPageControl;
    cxTabSheet1: TcxTabSheet;
    cxTabSheet2: TcxTabSheet;
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
    PopupMenu1: TPopupMenu;
    ExcelKaydet1: TMenuItem;
    cxGrid2: TcxGrid;
    CxV2: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Pb2: TProgressBar;
    QRol2: TOraQuery;
    SRol2: TDataSource;
    CxV2Column1: TcxGridDBColumn;
    CxV2Column2: TcxGridDBColumn;
    QRol3: TOraQuery;
    SRol3: TDataSource;
    SKiyas: TDataSource;
    TKiyas: TSQLMemTable;
    Panel2: TPanel;
    cxButton2: TcxButton;
    cxLabel26: TcxLabel;
    cxLookupComboBox1: TcxLookupComboBox;
    cxLookupComboBox2: TcxLookupComboBox;
    cxLookupComboBox3: TcxLookupComboBox;
    QTree: TOraQuery;
    QSTree: TDataSource;
    Kapat1: TMenuItem;
    QYetki: TSQLMemQuery;
    QSYetki: TDataSource;
    Artist: TActionList;
    actSorgula: TAction;
    actTemizle: TAction;
    actKaydet: TAction;
    QryStructP: TKDBStructure;
    Grupla1: TMenuItem;
    CxIncele: TcxCheckBox;
    ComboBox1: TComboBox;
    QryStructB: TKDBStructure;
    TKiyasROLADI: TStringField;
    TKiyasYETKIYOLU: TStringField;
    TKiyasYETKI: TStringField;
    TKiyasNO: TIntegerField;
    TKiyasONAY_1: TStringField;
    TKiyasONAY_2: TStringField;
    TKiyasONAY_3: TStringField;
    dxDockSite2: TdxDockSite;
    dxLayoutDockSite3: TdxLayoutDockSite;
    DockPanel: TdxDockPanel;
    Panel1: TPanel;
    Label1: TLabel;
    DbRolTree: TdxDBTreeView;
    RolTree: TTreeView;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxButton5: TcxButton;
    cxButton6: TcxButton;
    PB1: TProgressBar;
    TTreeROLADI: TStringField;
    TTreeYETKIYOLU: TStringField;
    TTreeYETKI: TStringField;
    TTreeNOO: TIntegerField;
    TTreeONAY: TStringField;
    QYetkiROLADI: TStringField;
    QYetkiYETKIYOLU: TStringField;
    QYetkiYETKI: TStringField;
    QYetkiNOO: TIntegerField;
    QYetkiONAY: TStringField;
    dxDockingManager1: TdxDockingManager;
    dxDockSite1: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxDockPanel1: TdxDockPanel;
    dxDockPanel2: TdxDockPanel;
    cxGrid1: TcxGrid;
    CxV: TcxGridDBTableView;
    CxVROLADI: TcxGridDBColumn;
    CxVYETKIYOLU: TcxGridDBColumn;
    CxVYETKI: TcxGridDBColumn;
    CxVNO: TcxGridDBColumn;
    CxVONAY: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    QryPanel: TKQueryPanel;
    cxButton1: TcxButton;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    QryStructM: TKDBStructure;
    QryStructT: TKDBStructure;
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
    QRol2KOD: TStringField;
    QRol2YETKI_0: TStringField;
    QRol2YETKI_1: TStringField;
    QRol2YETKI_2: TStringField;
    QRol2YETKI_3: TStringField;
    QRol2YETKI_4: TStringField;
    QRol2YETKI_5: TStringField;
    QRol2YETKI_6: TStringField;
    QRol2YETKI_7: TStringField;
    QRol2YETKI_8: TStringField;
    QRol2YETKI_9: TStringField;
    QRol2YETKI_A: TStringField;
    QRol2YETKI_B: TStringField;
    QRol2YETKI_C: TStringField;
    QRol2YETKI_D: TStringField;
    QRol2YETKI_E: TStringField;
    QRol2YETKI_F: TStringField;
    QRol2SDY: TIntegerField;
    QRol2SDT: TDateTimeField;
    QRol2YETKI_G: TStringField;
    QRol2YETKI_H: TStringField;
    QRol2YETKI_I: TStringField;
    QRol2YETKI_J: TStringField;
    QRol2YETKI_K: TStringField;
    QRol2YETKI_L: TStringField;
    QRol2YETKI_M: TStringField;
    QRol2YETKI_N: TStringField;
    QRol2YETKI_O: TStringField;
    QRol2YETKI_P: TStringField;
    QRol2YETKI_R: TStringField;
    QRol2YETKI_S: TStringField;
    QRol2YETKI_T: TStringField;
    QRol2YETKI_Y: TStringField;
    QRol2YETKI_U: TStringField;
    QRol2YETKI_V: TStringField;
    QRol2YETKI_A1: TStringField;
    QRol2YETKI_A2: TStringField;
    QRol2YETKI_A3: TStringField;
    QRol2YETKI_A4: TStringField;
    QRol2YETKI_A5: TStringField;
    QRol2YETKI_A6: TStringField;
    QRol2YETKI_A7: TStringField;
    QRol2YETKI_A8: TStringField;
    QRol2YETKI_A9: TStringField;
    QRol2YETKI_A10: TStringField;
    QRol2YETKI_A11: TStringField;
    QRol2YETKI_A12: TStringField;
    QRol2YETKI_A13: TStringField;
    QRol2YETKI_A14: TStringField;
    QRol2YETKI_A15: TStringField;
    QRol2YETKI_A16: TStringField;
    QRol2YETKI_A17: TStringField;
    QRol2YETKI_A18: TStringField;
    QRol2YETKI_A19: TStringField;
    QRol2YETKI_A20: TStringField;
    QRol2YETKI_A21: TStringField;
    QRol2YETKI_A22: TStringField;
    QRol2YETKI_A23: TStringField;
    QRol2YETKI_A24: TStringField;
    QRol2YETKI_A25: TStringField;
    QRol2YETKI_A26: TStringField;
    QRol2YETKI_A27: TStringField;
    QRol2YETKI_A28: TStringField;
    QRol2YETKI_A29: TStringField;
    QRol2YETKI_A30: TStringField;
    QRol2TUR: TStringField;
    QRol3KOD: TStringField;
    QRol3YETKI_0: TStringField;
    QRol3YETKI_1: TStringField;
    QRol3YETKI_2: TStringField;
    QRol3YETKI_3: TStringField;
    QRol3YETKI_4: TStringField;
    QRol3YETKI_5: TStringField;
    QRol3YETKI_6: TStringField;
    QRol3YETKI_7: TStringField;
    QRol3YETKI_8: TStringField;
    QRol3YETKI_9: TStringField;
    QRol3YETKI_A: TStringField;
    QRol3YETKI_B: TStringField;
    QRol3YETKI_C: TStringField;
    QRol3YETKI_D: TStringField;
    QRol3YETKI_E: TStringField;
    QRol3YETKI_F: TStringField;
    QRol3SDY: TIntegerField;
    QRol3SDT: TDateTimeField;
    QRol3YETKI_G: TStringField;
    QRol3YETKI_H: TStringField;
    QRol3YETKI_I: TStringField;
    QRol3YETKI_J: TStringField;
    QRol3YETKI_K: TStringField;
    QRol3YETKI_L: TStringField;
    QRol3YETKI_M: TStringField;
    QRol3YETKI_N: TStringField;
    QRol3YETKI_O: TStringField;
    QRol3YETKI_P: TStringField;
    QRol3YETKI_R: TStringField;
    QRol3YETKI_S: TStringField;
    QRol3YETKI_T: TStringField;
    QRol3YETKI_Y: TStringField;
    QRol3YETKI_U: TStringField;
    QRol3YETKI_V: TStringField;
    QRol3YETKI_A1: TStringField;
    QRol3YETKI_A2: TStringField;
    QRol3YETKI_A3: TStringField;
    QRol3YETKI_A4: TStringField;
    QRol3YETKI_A5: TStringField;
    QRol3YETKI_A6: TStringField;
    QRol3YETKI_A7: TStringField;
    QRol3YETKI_A8: TStringField;
    QRol3YETKI_A9: TStringField;
    QRol3YETKI_A10: TStringField;
    QRol3YETKI_A11: TStringField;
    QRol3YETKI_A12: TStringField;
    QRol3YETKI_A13: TStringField;
    QRol3YETKI_A14: TStringField;
    QRol3YETKI_A15: TStringField;
    QRol3YETKI_A16: TStringField;
    QRol3YETKI_A17: TStringField;
    QRol3YETKI_A18: TStringField;
    QRol3YETKI_A19: TStringField;
    QRol3YETKI_A20: TStringField;
    QRol3YETKI_A21: TStringField;
    QRol3YETKI_A22: TStringField;
    QRol3YETKI_A23: TStringField;
    QRol3YETKI_A24: TStringField;
    QRol3YETKI_A25: TStringField;
    QRol3YETKI_A26: TStringField;
    QRol3YETKI_A27: TStringField;
    QRol3YETKI_A28: TStringField;
    QRol3YETKI_A29: TStringField;
    QRol3YETKI_A30: TStringField;
    QRol3TUR: TStringField;
    Button1: TButton;
    procedure cxButton1Click(Sender: TObject);
    procedure ExcelKaydet1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure CxV2CustomDrawCell(Sender: TcxCustomGridTableView;
      ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
      var ADone: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure QTreeBeforeOpen(DataSet: TDataSet);
    procedure Kapat1Click(Sender: TObject);
    procedure actSorgulaExecute(Sender: TObject);
    procedure actTemizleExecute(Sender: TObject);
    procedure actKaydetExecute(Sender: TObject);
    procedure Grupla1Click(Sender: TObject);
    procedure cxButton5Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
     Procedure LoadToBuffer(F: String; K,K1: Integer);
     Procedure LoadToPrivillages(K : Integer);
     Function  StatePrivillegs(K:Integer;S: String): Integer;
     Function  ParentsNode(Sayac : Integer) : String;     
  public
    { Public declarations }
  end;

var
  RolRaporForm: TRolRaporForm;

implementation

uses BlyLib, dModule, ErpMenu;

Var
  Buffer   : Array[1..3,1..9999] Of Boolean;

{$R *.dfm}

  Procedure TRolRaporForm.LoadToBuffer(F: String; K,K1: Integer);
  Var
    S: String;
  Begin
      If CxPageControl1.ActivePage = CxTabSheet1 Then S := _Crypto(False, DmGlobal.QTmp.FieldByName(F).AsString, K)
         Else
      Begin
          If K1 = 1 Then S := _Crypto(False, QRol1.FieldByName(F).AsString, K)
            Else
          If K1 = 2 Then S := _Crypto(False, QRol2.FieldByName(F).AsString, K)
            Else
          If K1 = 3 Then S := _Crypto(False, QRol3.FieldByName(F).AsString, K);
      End;

      While Length(S) > 1 Do
      Begin
          Buffer[K1,StrToInt(Copy(S, 1, 4))] := True;
          if Length(S) > 4 Then Delete(S, 1, 5)
                           Else Delete(S, 1, 4);
      End;
   End;

   Procedure TRolRaporForm.LoadToPrivillages(K : Integer);
   Var
     T: Integer;
   begin
       For T := 1 To 9999 Do Buffer[K,T] := False;
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

  Function TRolRaporForm.StatePrivillegs(K:Integer;S: String): Integer;
  Begin
    if Buffer[K,StrToInt('0' + Copy(S, 2, Pos(')', S) - 2))] Then StatePrivillegs := 2
                                                             Else StatePrivillegs := 1;
  End;

  Function TRolRaporForm.ParentsNode(Sayac : Integer) : String;
  Var
    LastParentNode,FirstParentNode : TTreeNode;
  Begin
      FirstParentNode := RolTree.Items[Sayac];
      Result := '';
      While Not(FirstParentNode.IsFirstNode) Do
      Begin
          FirstParentNode := FirstParentNode.Parent;
          If Result = '' Then Result := FirstParentNode.Text
                         Else Result := FirstParentNode.Text + ' -> ' + Result;
      End;
  End;

procedure TRolRaporForm.cxButton1Click(Sender: TObject);
Var
   I : Integer;
   RolTur,YetkiYolu,Yetki,Numarasi,Durumu : String;

begin
    If CxIncele.Checked Then
    Begin
{
        If ComboBox1.ItemIndex = 0 Then // Personel
        Begin
           Application.CreateForm(TErp2000_Roller_Personel, Erp2000_Roller_Personel);
           RolTree.Items :=  Erp2000_Roller_Personel.RolTree.Items;
           Erp2000_Roller_Personel.Close;
           LoginInfo.RolTur := 'P';
        End
          Else
        If ComboBox1.ItemIndex = 1 Then // Adese
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '1';
        End
          Else
        If ComboBox1.ItemIndex = 2 Then //Seha
        Begin
           Application.CreateForm(TErp2000_Roller_Seha, Erp2000_Roller_Seha);
           RolTree.Items :=  Erp2000_Roller_Seha.RolTree.Items;
           Erp2000_Roller_Seha.Close;
           LoginInfo.RolTur := '2';
        End
          Else
        If ComboBox1.ItemIndex = 3 Then //Selva
        Begin
           Application.CreateForm(TErp2000_Roller_Selva, Erp2000_Roller_Selva);
           RolTree.Items :=  Erp2000_Roller_Selva.RolTree.Items;
           Erp2000_Roller_Selva.Close;
           LoginInfo.RolTur := '3';
        End
          Else
        If ComboBox1.ItemIndex = 4 Then //Ýmaþ
        Begin
           Application.CreateForm(TErp2000_Roller_Imas, Erp2000_Roller_Imas);
           RolTree.Items :=  Erp2000_Roller_Imas.RolTree.Items;
           Erp2000_Roller_Imas.Close;
           LoginInfo.RolTur := '4';
        End
          Else
        If ComboBox1.ItemIndex = 5 Then //Selet
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '5';
        End
          Else
        If ComboBox1.ItemIndex = 6 Then //Irent
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '6';
        End
          Else
        If ComboBox1.ItemIndex = 7 Then //Holding
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '7';
        End
          Else
        If ComboBox1.ItemIndex = 8 Then //Belya
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '8';
        End
          Else
        If ComboBox1.ItemIndex = 9 Then //KuleYon
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '9';
        End
          Else
        If ComboBox1.ItemIndex = 10 Then //Elite
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '10';
        End
          Else
        If ComboBox1.ItemIndex = 11 Then //Invito
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '11';
        End
          Else
        If ComboBox1.ItemIndex = 12 Then //Aes
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '12';
        End
          Else
        If ComboBox1.ItemIndex = 13 Then //Petreol
        Begin
           Application.CreateForm(TErp2000_Roller_Petrol, Erp2000_Roller_Petrol);
           RolTree.Items :=  Erp2000_Roller_Petrol.RolTree.Items;
           Erp2000_Roller_Petrol.Close;
           LoginInfo.RolTur := '13';
        End
          Else
        If ComboBox1.ItemIndex = 14 Then //Avukat
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '14';
        End
          Else
        If ComboBox1.ItemIndex = 15 Then //Bil
        Begin
           Application.CreateForm(TErp2000_Roller_Adese, Erp2000_Roller_Adese);
           RolTree.Items :=  Erp2000_Roller_Adese.RolTree.Items;
           Erp2000_Roller_Adese.Close;
           LoginInfo.RolTur := '15';
        End
          Else
        If ComboBox1.ItemIndex = 16 Then //Altýn
        Begin
           Application.CreateForm(TErp2000_Roller_Altin, Erp2000_Roller_Altin);
           RolTree.Items :=  Erp2000_Roller_Altin.RolTree.Items;
           Erp2000_Roller_Altin.Close;
           LoginInfo.RolTur := '16';
        End;
        SQLList(DmGlobal.QTmp, 'SELECT *FROM ROLLER WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + ' ORDER BY KOD');
        SQLRecord('DELETE FROM TANIM_YETKI WHERE TUR = ' + #39 + LOginInfo.RolTur + #39 + '');
}
    End
      Else
    Begin
        RolTree.Visible := False;
        QTree.Close;
        QTree.Open;
        RolTree.Items.Clear;
        RolTree.Items := DbRolTree.Items;
        RolTree.Visible := True;
        SQLList(DmGlobal.QTmp,'SELECT *FROM ROLLER WHERE TUR = ' + #39 + LoginInfo.RolTur+ #39 + ' ORDER BY KOD');
    End;

    Pb1.Visible := True;
    If TTree.Active Then TTree.Close;
    TTree.CreateTable;
    TTree.Open;

    YetkiYolu := '';
    Yetki     := '';
    Numarasi  := '';
    Durumu    := '';

    Cursor := crSQLWait;
    CxV.DataController.DataSource := Nil;
    DmGlobal.QTmp.First;
    Pb1.Position := 0;
    Pb1.Max      :=  SQLRecordCount(DmGlobal.QTmp.SQL.Text);//DmGlobal.QTmp.RecordCount *  RolTree.Items.Count;
    While Not DmGlobal.QTmp.Eof Do
    Begin
        LoadToPrivillages(1);
        For I := 0 To RolTree.Items.Count - 1 Do
        Begin
            If Not(RolTree.Items[I].HasChildren) Then
            Begin
                If RolTree.Items[I].Parent <> RolTree.Items[I-1].Parent Then YetkiYolu := ParentsNode(I);
                Yetki     := Copy(RolTree.Items[I].Text, Pos(')', RolTree.Items[I].Text) + 2 , Length(RolTree.Items[I].Text) - (Pos(')', RolTree.Items[I].Text)- 2));
                Numarasi  := '0' + Copy(RolTree.Items[I].Text, 2, Pos(')', RolTree.Items[I].Text) - 2);
                If StatePrivillegs(1,RolTree.Items[I].Text) = 2 Then Durumu := 'E'
                                                                Else Durumu := 'H';
                TTree.Insert;
                TTreeROLADI.AsString    := DmGlobal.QTmp.FieldByName('KOD').AsString;
                TTreeYETKIYOLU.AsString := YetkiYolu;
                TTreeYETKI.AsString     := Yetki;
                TTreeNOO.AsString       := Numarasi;
                TTreeONAY.AsString      := Durumu;
                TTree.Post;
                If CxIncele.Checked Then SQLRecord('INSERT INTO TANIM_YETKI VALUES(' + FloatToStr(LongInt(RolTree.Items[I].ItemId)) + ',' + FloatToStr(LongInt(RolTree.Items[I].Parent.ItemId)) + ',' + Numarasi + ',' + #39 + AnsiReplaceStr(AnsiReplaceStr(Yetki,#39,' '),'	','') + #39 + ',' + #39 + LoginInfo.RolTur + #39 + ',' + DmGlobal.QTmp.FieldByName('SDY').AsString + ',SYSDATE)');
            End
              Else
            Begin
              If (CxIncele.Checked) Then
                 If I = 0 Then SQLRecord('INSERT INTO TANIM_YETKI VALUES(' + FloatToStr(LongInt(RolTree.Items.GetFirstNode.ItemId)) + ',' + FloatToStr(LongInt(RolTree.Items.GetFirstNode.ItemId)) + ',0,' + #39 + AnsiReplaceStr(AnsiReplaceStr(RolTree.Items.GetFirstNode.Text,#39,' '),'	','') + #39 + ',' + #39 + LoginInfo.RolTur + #39 + ',' + DmGlobal.QTmp.FieldByName('SDY').AsString + ',SYSDATE)')
                          Else SQLRecord('INSERT INTO TANIM_YETKI VALUES(' + FloatToStr(LongInt(RolTree.Items[I].ItemId)) + ',' + FloatToStr(LongInt(RolTree.Items[I].Parent.ItemId)) + ',0,' + #39 + AnsiReplaceStr(AnsiReplaceStr(RolTree.Items[I].Text,#39,' '),'	','') + #39 + ',' + #39 + LoginInfo.RolTur + #39 + ',' + DmGlobal.QTmp.FieldByName('SDY').AsString + ',SYSDATE)');
            End;
        End;
//        If (CxIncele.Checked) Then SQLRecord('UPDATE TANIM_YETKI SET ID = ID-(SELECT CASE WHEN MIN(ID)>MIN(PARENT_ID) THEN MIN(PARENT_ID) ELSE MIN(ID) END FROM TANIM_YETKI), PARENT_ID = PARENT_ID - (SELECT CASE WHEN MIN(ID)>MIN(PARENT_ID) THEN MIN(PARENT_ID) ELSE MIN(ID) END FROM TANIM_YETKI)');
        SQLRecord('UPDATE PARAMETRELER_YENI SET DEGER = (SELECT NVL((SELECT TO_CHAR(MAX(YETKI_NO)) FROM TANIM_YETKI WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + '),''1'') FROM DUAL) ' +
                  '        WHERE PARAMETRE = ''SON YETKÝ NO''');

        CxIncele.Checked := False;
        DmGlobal.QTmp.Next;
        Pb1.Position    := PB1.Position + 1;
        Refresh;

    End;
    TTree.First;
    Pb1.Visible := False;
    actSorgula.Enabled := True;
    actTemizle.Enabled := True;
    CxButton1.Enabled  := False;
    QryPanel.Enabled   := True;
    QYetki.Open;
    CxV.DataController.DataSource := QSYetki;
    Cursor := crArrow;
end;

procedure TRolRaporForm.ExcelKaydet1Click(Sender: TObject);
begin
    If CxPageControl1.ActivePage = CxTabSheet1 Then
    Begin
        ExcelSinirsizKaydet(CxV,Caption);
{
        If Application.MessageBox(PChar(Caption + ' listesi Excel dosyasý olarak oluþturulacaktýr. Onaylýyormusunuz ?'),'Dikkat !',Mb_YesNo) = idNo Then Abort;
        DmGlobal.SaveDialog.Filter     := 'Excel Dosyalarý|*.xls';
        DmGlobal.SaveDialog.FileName   := 'RolListe.XLS';
        If DmGlobal.SaveDialog.Execute Then
        Begin
            ExcelSinirsizKaydet(CxV,DmGlobal.SaveDialog.FileName);
            ExportGridToExcel(DmGlobal.SaveDialog.FileName, cxGrid1,False);
            Application.MessageBox(PChar(DmGlobal.SaveDialog.FileName  + ' dosyasý oluþturulmuþtur.'), 'DOSYA OLUÞTURULDU', mb_OK);
        End;
}
    End
       Else
    Begin
        ExcelSinirsizKaydet(CxV2,Caption);
{
        If Application.MessageBox(PChar(Caption + ' listesi Excel dosyasý olarak oluþturulacaktýr. Onaylýyormusunuz ?'),'Dikkat !',Mb_YesNo) = idNo Then Abort;
        DmGlobal.SaveDialog.Filter     := 'Excel Dosyalarý|*.xls';
        DmGlobal.SaveDialog.FileName   := 'RolKiyasListe.XLS';
        If DmGlobal.SaveDialog.Execute Then
        Begin
            cxGridDBColumn5.Caption := cxLookupComboBox1.Text;
            CxV2Column1.Caption     := cxLookupComboBox2.Text;
            CxV2Column2.Caption     := cxLookupComboBox3.Text;
            ExcelSinirsizKaydet(CxV2,DmGlobal.SaveDialog.FileName);
//            ExportGridToExcel(DmGlobal.SaveDialog.FileName, cxGrid2,False);
            cxGridDBColumn5.Caption := 'Rol1';
            CxV2Column1.Caption     := 'Rol2';
            CxV2Column2.Caption     := 'Rol3';
            Application.MessageBox(PChar(DmGlobal.SaveDialog.FileName  + ' dosyasý oluþturulmuþtur.'), 'DOSYA OLUÞTURULDU', mb_OK);
        End;
}
    End;
end;

procedure TRolRaporForm.cxButton2Click(Sender: TObject);
Var
   I : Integer;
   YetkiYolu,Yetki,Numarasi,Durumu1,Durumu2,Durumu3 : String;

begin
    If cxLookupComboBox1.Text = '' Then
    Begin
        Application.MessageBox('[ Rol 1 ] sahasý boþ býrakýlmýþ. Kontrol ediniz...','DÝKKAT',MB_OK);
        cxLookupComboBox1.SetFocus;
        cxLookupComboBox1.SelStart := 0;
        cxLookupComboBox1.SelLength:= Length(cxLookupComboBox1.Text);
        Abort;
    End;

{
    If cxLookupComboBox2.Text = '' Then
    Begin
        Application.MessageBox('[ Rol 2 ] sahasý boþ býrakýlmýþ. Kontrol ediniz...','DÝKKAT',MB_OK);
        cxLookupComboBox2.SetFocus;
        cxLookupComboBox2.SelStart := 0;
        cxLookupComboBox2.SelLength:= Length(cxLookupComboBox2.Text);
        Abort;
    End;

    If cxLookupComboBox3.Text = '' Then
    Begin
        Application.MessageBox('[ Rol 3 ] sahasý boþ býrakýlmýþ. Kontrol ediniz...','DÝKKAT',MB_OK);
        cxLookupComboBox3.SetFocus;
        cxLookupComboBox3.SelStart := 0;
        cxLookupComboBox3.SelLength:= Length(cxLookupComboBox3.Text);
        Abort;
    End;
}    
    RolTree.Visible := False;
    QTree.Close;
    QTree.Open;
    RolTree.Items.Clear;
    RolTree.Items := DbRolTree.Items;
    RolTree.Visible := True;

    Pb2.Visible := True;
    If TKiyas.Active Then TKiyas.Close;
    TKiyas.CreateTable;
    TKiyas.Open;

    YetkiYolu := '';
    Yetki     := '';
    Numarasi  := '';
    Durumu1   := '';
    Durumu2   := '';
    Durumu3   := '';

    CxV2.DataController.DataSource := Nil;
    Pb2.Position := 0;
    Pb2.Max      := RolTree.Items.Count;
    CxV2.DataController.Filter.Clear;
        LoadToPrivillages(1);
        If cxLookupComboBox2.Text <> '' Then LoadToPrivillages(2);
        If cxLookupComboBox3.Text <> '' Then LoadToPrivillages(3);
        
        For I := 0 To RolTree.Items.Count - 1 Do
        Begin
            If Not(RolTree.Items[I].HasChildren) Then
            Begin
                If RolTree.Items[I].Parent <> RolTree.Items[I-1].Parent Then YetkiYolu := ParentsNode(I);
                Yetki     := Copy(RolTree.Items[I].Text, Pos(')', RolTree.Items[I].Text) + 2 , Length(RolTree.Items[I].Text) - (Pos(')', RolTree.Items[I].Text)- 2));
                Numarasi  := '0' + Copy(RolTree.Items[I].Text, 2, Pos(')', RolTree.Items[I].Text) - 2);

                If StatePrivillegs(1,RolTree.Items[I].Text) = 2 Then Durumu1 := 'E'
                                                                Else Durumu1 := 'H';

                If cxLookupComboBox2.Text <> '' Then
                Begin
                    If StatePrivillegs(2,RolTree.Items[I].Text) = 2 Then Durumu2 := 'E'
                                                                    Else Durumu2 := 'H';
                End Else Durumu2 := '-';

                If cxLookupComboBox3.Text <> '' Then
                Begin
                    If StatePrivillegs(3,RolTree.Items[I].Text) = 2 Then Durumu3 := 'E'
                                                                    Else Durumu3 := 'H';
                End Else Durumu3 := '-';

                TKiyas.Insert;
                TKiyasROLADI.AsString    := 'X';
                TKiyasYETKIYOLU.AsString := YetkiYolu;
                TKiyasYETKI.AsString     := Yetki;
                TKiyasNO.AsString        := Numarasi;
                TKiyasONAY_1.AsString    := Durumu1;
                TKiyasONAY_2.AsString    := Durumu2;
                TKiyasONAY_3.AsString    := Durumu3;
                TKiyas.Post;
                Pb2.Position    := Pb2.Position + 1;
            End;
        End;

    CxV2.DataController.DataSource := SKiyas;
    TKiyas.First;
    Pb2.Visible := False;
End;

procedure TRolRaporForm.cxPageControl1Change(Sender: TObject);
begin
    If CxPageControl1.ActivePage = CxTabSheet2 Then
    Begin
        SQLList(QRol1, 'SELECT *FROM ROLLER WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + ' ORDER BY KOD');
        SQLList(QRol2, 'SELECT *FROM ROLLER WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + ' ORDER BY KOD');
        SQLList(QRol3, 'SELECT *FROM ROLLER WHERE TUR = ' + #39 + LoginInfo.RolTur + #39 + ' ORDER BY KOD');
    End
       Else
    Begin
        QRol1.Close;
        QRol2.Close;
        QRol3.Close;
    End;
end;

procedure TRolRaporForm.CxV2CustomDrawCell(Sender: TcxCustomGridTableView;
  ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
  var ADone: Boolean);
begin
    If ((AViewInfo.GridRecord.DisplayTexts[3] <> AViewInfo.GridRecord.DisplayTexts[4]) And  ((AViewInfo.GridRecord.DisplayTexts[3] <> '-') And (AViewInfo.GridRecord.DisplayTexts[4] <> '-'))) Or
       ((AViewInfo.GridRecord.DisplayTexts[3] <> AViewInfo.GridRecord.DisplayTexts[5]) And  ((AViewInfo.GridRecord.DisplayTexts[3] <> '-') And (AViewInfo.GridRecord.DisplayTexts[5] <> '-'))) Or
       ((AViewInfo.GridRecord.DisplayTexts[4] <> AViewInfo.GridRecord.DisplayTexts[5]) And  ((AViewInfo.GridRecord.DisplayTexts[4] <> '-') And (AViewInfo.GridRecord.DisplayTexts[5] <> '-')))
    Then
    Begin
       If AViewInfo.Selected Then ACanvas.Font.Color := ClWhite
                             Else ACanvas.Font.Color := ClRed;
    End;
end;

procedure TRolRaporForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Yonetim_Menu.MenuTree.Items[Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
    QRol1.Close;
    QRol2.Close;
    QRol3.Close;
    TKiyas.Close;
    TKiyas.Destroy;
    LoginInfo.RolTur := HelpKeyword;
    Action := CaFree;
end;

procedure TRolRaporForm.FormCreate(Sender: TObject);
Var
   I : Integer;
   str : TStrings;
begin
    TKiyas.Close;
    Left := (((Yonetim_Menu.Width - 220) div 2) - (Width  div 2))-13;
    Top  := ((Yonetim_Menu.Height - 80) div 2) - (Height div 2);

    HelpKeyword := LoginInfo.RolTur;
    If  (LOginInfo.LOGINNAME = 'AFURKAN') Or (LOginInfo.LOGINNAME = 'HARUN') Then
    Begin
        CxIncele.Visible  := True;
        ComboBox1.Visible := True;
    End
       Else
    Begin
        CxIncele.Visible  := False;
        ComboBox1.Visible := False;
    End;
    If LoginInfo.RolTur = 'P' Then QryPanel.DbStruct := QryStructP
      Else
    If LoginInfo.RolTur = 'M' Then QryPanel.DbStruct := QryStructM
      Else
    If LoginInfo.RolTur = 'T' Then QryPanel.DbStruct := QryStructT
                              Else QryPanel.DbStruct := QryStructB;
   QryPanel.Activate;
end;

procedure TRolRaporForm.QTreeBeforeOpen(DataSet: TDataSet);
begin
   QTree.ParamByName('TUR').AsString := LoginInfo.RolTur;
end;

procedure TRolRaporForm.Kapat1Click(Sender: TObject);
begin
   Close;
end;

procedure TRolRaporForm.actSorgulaExecute(Sender: TObject);
var
  i : Integer;
begin
    if QYetki.Active Then QYetki.Close;
    QYetki.SQL.Clear;
    QYetki.SQL.Add('SELECT * FROM YETKI WHERE ROLADI <> ''X'' ');
    Try
       QryPanel.BuildQuery;
    Except
    End;   
    if QryPanel.QResult.WhereClause.Text <> '' Then QYetki.SQL.Add(' AND ');
    for i:= 0 to QryPanel.QResult.WhereClause.Count-1 do QYetki.SQL.Add(QryPanel.QResult.WhereClause[i]);
    CxV.DataController.DataSource := Nil;
    QYetki.Open;
    CxV.DataController.DataSource := QSYetki;
end;

procedure TRolRaporForm.actTemizleExecute(Sender: TObject);
begin
    QryPanel.ClearAll;
end;

procedure TRolRaporForm.Button1Click(Sender: TObject);
Var
    YetkiDizi : Array Of Record //VardiyaNolar,Haftanýn Günleri,Gün içindeki Mesai Hareketleri
                             YETKI_YOLU     : String[255];
                             YETKI_ACIKLAMA : String[50];
                             UNVAN          : Array Of Record
                                                 ADI    : String[50];
                                                 DEGERI : String[1];
                                              End;
                End;

begin
    SetLength(YetkiDizi,100);

    SQLList(DmGlobal.QTmp2,'SELECT SYS_CONNECT_BY_PATH(YETKI_ACIKLAMA, ''.'') YETKI_YOLU, ' +
                            ' YETKI_ACIKLAMA,YETKI_NO ' +
                            ' FROM TANIM_YETKI ' +
                            ' START WITH ID = PARENT_ID ' +
                            ' CONNECT BY NOCYCLE PRIOR ID = PARENT_ID');


end;

procedure TRolRaporForm.actKaydetExecute(Sender: TObject);
begin
{
    QryPanel.SaveToFile(ExtractFilePath(Application.ExeName)+'IniFiles\RolRapor.ini');
    if QryPanel.Empty then IniFilesData('UrunAgaci.ini',3)
    else IniFilesData('UrunAgaci.ini',2);
}
end;

procedure TRolRaporForm.Grupla1Click(Sender: TObject);
begin
    If CxPageControl1.ActivePage = cxTabSheet1 Then
    Begin
      If CxV.OptionsCustomize.ColumnGrouping Then
      Begin
        CxV.OptionsCustomize.ColumnMoving              := False;
        CxV.OptionsCustomize.ColumnGrouping            := False;
        CxV.DataController.Filter.Active               := False;
        CxV.OptionsView.GroupByBox                     := False;
        CxV.DataController.DataModeController.GridMode := True;
      End
       Else
      Begin
        CxV.OptionsCustomize.ColumnMoving              := True;
        CxV.OptionsCustomize.ColumnGrouping            := True;
        CxV.DataController.Filter.Active               := True;
        CxV.OptionsView.GroupByBox                     := True;
        CxV.DataController.DataModeController.GridMode := False;
      End;
     End
       Else
    Begin
    End;
end;


procedure TRolRaporForm.cxButton5Click(Sender: TObject);
begin
    Close;
end;

procedure TRolRaporForm.cxButton6Click(Sender: TObject);
begin
    WindowState := wsNormal;
end;

procedure TRolRaporForm.FormResize(Sender: TObject);
begin
    CxButton5.Visible := WindowState = wsMaximized;
    CxButton6.Visible := WindowState = wsMaximized;
end;

end.

SELECT KOD,
CRYPTO('E',YETKI_0,1),
CRYPTO('E',YETKI_1,2),
CRYPTO('E',YETKI_2,3),
CRYPTO('E',YETKI_3,4),
CRYPTO('E',YETKI_4,5),
CRYPTO('E',YETKI_5,5),
CRYPTO('E',YETKI_6,4),
CRYPTO('E',YETKI_7,3),
CRYPTO('E',YETKI_8,2),
CRYPTO('E',YETKI_9,1),
CRYPTO('E',YETKI_A,1),
CRYPTO('E',YETKI_B,2),
CRYPTO('E',YETKI_C,3),
CRYPTO('E',YETKI_D,4),
CRYPTO('E',YETKI_E,5),
CRYPTO('E',YETKI_F,6),
CRYPTO('E',YETKI_G,1),
CRYPTO('E',YETKI_H,2),
CRYPTO('E',YETKI_I,3),
CRYPTO('E',YETKI_J,4),
CRYPTO('E',YETKI_K,5),
CRYPTO('E',YETKI_L,6),
CRYPTO('E',YETKI_M,7),
CRYPTO('E',YETKI_N,1),
CRYPTO('E',YETKI_O,2),
CRYPTO('E',YETKI_P,3),
CRYPTO('E',YETKI_R,4),
CRYPTO('E',YETKI_S,5),
CRYPTO('E',YETKI_T,6),
CRYPTO('E',YETKI_Y,7),
CRYPTO('E',YETKI_U,1),
CRYPTO('E',YETKI_V,2),
CRYPTO('E',YETKI_A1,3),
CRYPTO('E',YETKI_A2,4),
CRYPTO('E',YETKI_A3,5),
CRYPTO('E',YETKI_A4,6),
CRYPTO('E',YETKI_A5,7),
CRYPTO('E',YETKI_A6,1),
CRYPTO('E',YETKI_A7,2),
CRYPTO('E',YETKI_A8,3),
CRYPTO('E',YETKI_A9,4),
CRYPTO('E',YETKI_A10,5),
CRYPTO('E',YETKI_A11,6),
CRYPTO('E',YETKI_A12,7),
CRYPTO('E',YETKI_A13,1),
CRYPTO('E',YETKI_A14,2),
CRYPTO('E',YETKI_A15,3),
CRYPTO('E',YETKI_A16,4),
CRYPTO('E',YETKI_A17,5),
CRYPTO('E',YETKI_A18,6),
CRYPTO('E',YETKI_A19,7),
CRYPTO('E',YETKI_A20,1),
CRYPTO('E',YETKI_A21,2),
CRYPTO('E',YETKI_A22,3),
CRYPTO('E',YETKI_A23,4),
CRYPTO('E',YETKI_A24,5),
CRYPTO('E',YETKI_A25,6),
CRYPTO('E',YETKI_A26,7),
CRYPTO('E',YETKI_A27,1),
CRYPTO('E',YETKI_A28,2),
CRYPTO('E',YETKI_A29,3),
CRYPTO('E',YETKI_A30,4)
FROM ROLLER WHERE KOD = 'SÝSTEM YÖNETÝCÝSÝ';
