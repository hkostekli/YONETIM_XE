{$INCLUDE Unit\Belit.Inc}

unit Kullanici;
interface

uses
  Windows, Messages, SysUtils, Variants,Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, StdCtrls, ImgList, ToolWin, Db, DBAccess, Ora, OraSmart, MemDS, OraError, ExtCtrls, DBCtrls,
  FileCtrl, Grids, DBGrids, Mask, Buttons, CheckLst, cxPC, cxControls,
  cxContainer, cxEdit, cxLabel, cxCheckBox, cxDBEdit, cxTextEdit,
  cxGraphics, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMemo, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxClasses, cxGridCustomView, cxGrid,
  cxTL, SQLMemMain, cxDBExtLookupComboBox, cxInplaceContainer, ActnList,
  dxBar, dxBarExtItems, cxGroupBox, cxNavigator, cxDBNavigator, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxLookAndFeelPainters, cxButtons, kquerpnl, dxDockPanel, dxDockControl,
  kdbstruc, cxCheckComboBox, cxDBCheckComboBox, cxImageComboBox, cxCheckListBox,
  cxLookAndFeels, dxBarBuiltInMenu, dxSkinsdxBarPainter,
  dxSkinsdxDockControlPainter, System.Actions, System.ImageList;

type
  TErp2000_Kullanicilar = class(TForm)
    dKullanici: TDataSource;
    PopupMenu1: TPopupMenu;
    pmEkle: TMenuItem;
    pmDegistir: TMenuItem;
    pmSil: TMenuItem;
    pmKaydet: TMenuItem;
    pmVazgec: TMenuItem;
    N1: TMenuItem;
    pmOnceki: TMenuItem;
    pmSonraki: TMenuItem;
    N3: TMenuItem;
    pmKapat: TMenuItem;
    ShowPopUp1: TMenuItem;
    AcImages: TImageList;
    dRol: TDataSource;
    qSube: TOraQuery;
    dSube: TDataSource;
    dSatinalmaci: TDataSource;
    qSatinalmaci: TOraQuery;
    tkullanici: TOraQuery;
    UKullanici: TOraUpdateSQL;
    trol: TOraQuery;
    OpenDialog1: TOpenDialog;
    pmSatinalma: TMenuItem;
    pmKirim: TMenuItem;
    pmSube: TMenuItem;
    pmMasrafMagazalar: TMenuItem;
    qExecSql: TOraQuery;
    qTmp: TOraQuery;
    KirimSec: TSQLMemTable;
    cxStyleRepository1: TcxStyleRepository;
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
    Enable_New: TImageList;
    Disable_New: TImageList;
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
    dxBarButton4: TdxBarButton;
    dxBarButton5: TdxBarButton;
    RolEkle: TAction;
    RolDegistir: TAction;
    RolSil: TAction;
    RolKaydet: TAction;
    RolVazgec: TAction;
    N2: TMenuItem;
    N4: TMenuItem;
    SatrEkle1: TMenuItem;
    SatrSil1: TMenuItem;
    RolDeitir1: TMenuItem;
    RolKaydet1: TMenuItem;
    RolVazge1: TMenuItem;
    QRoller: TOraQuery;
    SRoller: TDataSource;
    URoller: TOraUpdateSQL;
    PageControl1: TcxPageControl;
    TabSheet1: TcxTabSheet;
    Panel1: TPanel;
    Label11: TLabel;
    cbArama: TComboBox;
    edArama: TEdit;
    cbRol: TComboBox;
    StatusBar1: TStatusBar;
    TabSheet2: TcxTabSheet;
    Panel3: TPanel;
    cxPageControl1: TcxPageControl;
    cxTabSheet3: TcxTabSheet;
    cxGrid2: TcxGrid;
    CxRol: TcxGridDBTableView;
    CxRolROL: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    cxTabSheet4: TcxTabSheet;
    cxLabel22: TcxLabel;
    cxDBLookupComboBox6: TcxDBLookupComboBox;
    cxLabel9: TcxLabel;
    cxDBMemo1: TcxDBMemo;
    cxLabel10: TcxLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    cxLabel11: TcxLabel;
    cxDBMemo2: TcxDBMemo;
    cxLabel12: TcxLabel;
    cxDBMemo3: TcxDBMemo;
    cxLabel14: TcxLabel;
    cxDBMemo4: TcxDBMemo;
    cxDBLookupComboBox1: TcxDBLookupComboBox;
    cxLabel15: TcxLabel;
    Panel2: TPanel;
    PageControl2: TcxPageControl;
    TabSheet3: TcxTabSheet;
    chSatinalmaci: TCheckListBox;
    TabSheet5: TcxTabSheet;
    chAnaKirim: TCheckListBox;
    TabSheet4: TcxTabSheet;
    chMagaza: TCheckListBox;
    TabSheet6: TcxTabSheet;
    chMasrafMagazalar: TCheckListBox;
    cxDBLookupComboBox2: TcxDBLookupComboBox;
    cxLabel3: TcxLabel;
    Panel4: TPanel;
    pmAktar: TSpeedButton;
    PmmKapat: TSpeedButton;
    CxNav: TcxDBNavigator;
    Panel5: TPanel;
    cxLabel17: TcxLabel;
    cxLabel18: TcxLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    cxDBTextEdit6: TcxDBTextEdit;
    cxDBCheckBox3: TcxDBCheckBox;
    cxDBCheckBox4: TcxDBCheckBox;
    cxLabel19: TcxLabel;
    DbEdit4: TcxDBTextEdit;
    cxLabel20: TcxLabel;
    cxDBLookupComboBox5: TcxDBLookupComboBox;
    cxLabel21: TcxLabel;
    cxDBTextEdit8: TcxDBTextEdit;
    cxLabel1: TcxLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    cxLabel16: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxDBLookupComboBox3: TcxDBLookupComboBox;
    cxCheckBox1: TcxCheckBox;
    tkullaniciKOD: TIntegerField;
    tkullaniciISIM: TStringField;
    tkullaniciSIFRE: TStringField;
    tkullaniciGOREVI: TStringField;
    tkullaniciUNVANI: TStringField;
    tkullaniciSDY: TIntegerField;
    tkullaniciSDT: TDateTimeField;
    tkullaniciLOGINNAME: TStringField;
    tkullaniciAKTIF: TStringField;
    tkullaniciINTERNALID: TStringField;
    tkullaniciELTERMINALI_KULLANIR: TStringField;
    tkullaniciPERSONEL_ID: TIntegerField;
    QRollerKOD: TIntegerField;
    QRollerROL: TStringField;
    QRollerTUR: TStringField;
    QRollerFIRMA: TIntegerField;
    QRollerSATINALMACI: TStringField;
    QRollerSATINALMACILAR: TStringField;
    QRollerSUBELER: TStringField;
    QRollerMASRAF_SUBELER: TStringField;
    QRollerCARILER: TStringField;
    QRollerANA_KIRIM: TStringField;
    QRollerSDY: TIntegerField;
    QRollerSDT: TDateTimeField;
    trolKOD: TStringField;
    trolYETKI_0: TStringField;
    trolYETKI_1: TStringField;
    trolYETKI_2: TStringField;
    trolYETKI_3: TStringField;
    trolYETKI_4: TStringField;
    trolYETKI_5: TStringField;
    trolYETKI_6: TStringField;
    trolYETKI_7: TStringField;
    trolYETKI_8: TStringField;
    trolYETKI_9: TStringField;
    trolYETKI_A: TStringField;
    trolYETKI_B: TStringField;
    trolYETKI_C: TStringField;
    trolYETKI_D: TStringField;
    trolYETKI_E: TStringField;
    trolYETKI_F: TStringField;
    trolSDY: TIntegerField;
    trolSDT: TDateTimeField;
    trolYETKI_G: TStringField;
    trolYETKI_H: TStringField;
    trolYETKI_I: TStringField;
    trolYETKI_J: TStringField;
    trolYETKI_K: TStringField;
    trolYETKI_L: TStringField;
    trolYETKI_M: TStringField;
    trolYETKI_N: TStringField;
    trolYETKI_O: TStringField;
    trolYETKI_P: TStringField;
    trolYETKI_R: TStringField;
    trolYETKI_S: TStringField;
    trolYETKI_T: TStringField;
    trolYETKI_Y: TStringField;
    trolYETKI_U: TStringField;
    trolYETKI_V: TStringField;
    trolYETKI_A1: TStringField;
    trolYETKI_A2: TStringField;
    trolYETKI_A3: TStringField;
    trolYETKI_A4: TStringField;
    trolYETKI_A5: TStringField;
    trolYETKI_A6: TStringField;
    trolYETKI_A7: TStringField;
    trolYETKI_A8: TStringField;
    trolYETKI_A9: TStringField;
    trolYETKI_A10: TStringField;
    trolYETKI_A11: TStringField;
    trolYETKI_A12: TStringField;
    trolYETKI_A13: TStringField;
    trolYETKI_A14: TStringField;
    trolYETKI_A15: TStringField;
    trolYETKI_A16: TStringField;
    trolYETKI_A17: TStringField;
    trolYETKI_A18: TStringField;
    trolYETKI_A19: TStringField;
    trolYETKI_A20: TStringField;
    trolYETKI_A21: TStringField;
    trolYETKI_A22: TStringField;
    trolYETKI_A23: TStringField;
    trolYETKI_A24: TStringField;
    trolYETKI_A25: TStringField;
    trolYETKI_A26: TStringField;
    trolYETKI_A27: TStringField;
    trolYETKI_A28: TStringField;
    trolYETKI_A29: TStringField;
    trolYETKI_A30: TStringField;
    trolTUR: TStringField;
    dxDockingManager1: TdxDockingManager;
    QryStruct: TKDBStructure;
    dxDockSite1: TdxDockSite;
    dxLayoutDockSite2: TdxLayoutDockSite;
    dxLayoutDockSite1: TdxLayoutDockSite;
    dxDockPanel1: TdxDockPanel;
    dxDockPanel2: TdxDockPanel;
    QryPanel: TKQueryPanel;
    cxGroupBox7: TcxGroupBox;
    btnQryFilter: TcxButton;
    btnQryClear: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    Col_LoginName: TcxGridDBColumn;
    Col_Kod: TcxGridDBColumn;
    Col_ISIM: TcxGridDBColumn;
    Col_Aktif: TcxGridDBColumn;
    Col_Terminal: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    ActSorgula: TAction;
    ActKaydet: TAction;
    ActVazgec: TAction;
    tkullaniciBI_KULLANICI: TStringField;
    tkullaniciBI_SIFRE: TStringField;
    cxLabel6: TcxLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    cxLabel7: TcxLabel;
    cxDBTextEdit1: TcxDBTextEdit;
    cxLabel8: TcxLabel;
    cxTabSheet1: TcxTabSheet;
    cxPageControl2: TcxPageControl;
    cxTabSheet2: TcxTabSheet;
    cxTabSheet5: TcxTabSheet;
    cxTabSheet6: TcxTabSheet;
    cxTabSheet7: TcxTabSheet;
    cxTabSheet8: TcxTabSheet;
    cxTabSheet9: TcxTabSheet;
    cxTabSheet10: TcxTabSheet;
    cxGrid3: TcxGrid;
    CxVAnaBolge: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    QAnaBolge: TOraQuery;
    SAnaBolge: TDataSource;
    QAnaBolgeID_ULKE: TIntegerField;
    QAnaBolgeID_ANA_BOLGE: TIntegerField;
    QAnaBolgeID_KULLANICI_KOD: TIntegerField;
    QAnaBolgeSDY: TIntegerField;
    QAnaBolgeSDT: TDateTimeField;
    CxVAnaBolgeID_ANA_BOLGE: TcxGridDBColumn;
    QAltBolge: TOraQuery;
    SAltBolge: TDataSource;
    QSehir: TOraQuery;
    SSehir: TDataSource;
    QIlce: TOraQuery;
    SIlce: TDataSource;
    QTabela: TOraQuery;
    STabela: TDataSource;
    SSatinalmacii: TDataSource;
    QSatinalmacii: TOraQuery;
    QTedarikci: TOraQuery;
    STedarikci: TDataSource;
    QAnaBolgeU_SDY: TIntegerField;
    QAnaBolgeU_SDT: TDateTimeField;
    QSehirID_ULKE: TIntegerField;
    QSehirID_BOLGE: TIntegerField;
    QSehirID_SEHIR: TIntegerField;
    QSehirID_KULLANICI_KOD: TIntegerField;
    QSehirSDY: TIntegerField;
    QSehirSDT: TDateTimeField;
    QSehirU_SDY: TIntegerField;
    QSehirU_SDT: TDateTimeField;
    QIlceID_ULKE: TIntegerField;
    QIlceID_BOLGE: TIntegerField;
    QIlceID_SEHIR: TIntegerField;
    QIlceID_ILCE: TIntegerField;
    QIlceID_KULLANICI_KOD: TIntegerField;
    QIlceSDY: TIntegerField;
    QIlceSDT: TDateTimeField;
    QIlceU_SDY: TIntegerField;
    QIlceU_SDT: TDateTimeField;
    QIlceTUM: TStringField;
    cxGrid4: TcxGrid;
    CxVAltBolge: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    QAltBolgeID_ULKE: TIntegerField;
    QAltBolgeID_ANA_BOLGE: TIntegerField;
    QAltBolgeID_ALT_BOLGE: TIntegerField;
    QAltBolgeID_KULLANICI_KOD: TIntegerField;
    QAltBolgeSDY: TIntegerField;
    QAltBolgeSDT: TDateTimeField;
    QAltBolgeU_SDY: TIntegerField;
    QAltBolgeU_SDT: TDateTimeField;
    cxTabSheet11: TcxTabSheet;
    QBolge: TOraQuery;
    SBolge: TDataSource;
    QBolgeID_ULKE: TIntegerField;
    QBolgeID_BOLGE: TIntegerField;
    QBolgeID_KULLANICI_KOD: TIntegerField;
    QBolgeSDY: TIntegerField;
    QBolgeSDT: TDateTimeField;
    QBolgeU_SDY: TIntegerField;
    QBolgeU_SDT: TDateTimeField;
    cxGrid5: TcxGrid;
    CxVBolge: TcxGridDBTableView;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridLevel4: TcxGridLevel;
    QSatinalmaciiID_SATINALMACI: TIntegerField;
    QSatinalmaciiID_KULLANICI_KOD: TIntegerField;
    QSatinalmaciiSDY: TIntegerField;
    QSatinalmaciiSDT: TDateTimeField;
    QSatinalmaciiU_SDY: TIntegerField;
    QSatinalmaciiU_SDT: TDateTimeField;
    QTabelaID_BIRIM_TABELA: TIntegerField;
    QTabelaID_KULLANICI_KOD: TIntegerField;
    QTabelaSDY: TIntegerField;
    QTabelaSDT: TDateTimeField;
    QTabelaU_SDY: TIntegerField;
    QTabelaU_SDT: TDateTimeField;
    cxGrid6: TcxGrid;
    CxVSehir: TcxGridDBTableView;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel5: TcxGridLevel;
    cxGrid7: TcxGrid;
    CxVIlce: TcxGridDBTableView;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridLevel6: TcxGridLevel;
    cxGrid8: TcxGrid;
    CxVTabela: TcxGridDBTableView;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel7: TcxGridLevel;
    cxGrid9: TcxGrid;
    CxVSatinalmaci: TcxGridDBTableView;
    cxGridDBColumn6: TcxGridDBColumn;
    cxGridLevel8: TcxGridLevel;
    cxGrid10: TcxGrid;
    CxVTedarikci: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridLevel9: TcxGridLevel;
    cxLabel13: TcxLabel;
    tkullaniciBI_SIFRE_DEGISTI: TStringField;
    tkullaniciBI_KULLANICI_SIL: TStringField;
    cxDBLookupComboBox4: TcxDBLookupComboBox;
    cxLabel23: TcxLabel;
    cxDBLookupComboBox7: TcxDBLookupComboBox;
    cxLabel24: TcxLabel;
    cxDBLookupComboBox8: TcxDBLookupComboBox;
    cxLabel25: TcxLabel;
    cxDBLookupComboBox9: TcxDBLookupComboBox;
    QTedarikciDS_TEDARIKCI: TStringField;
    QTedarikciID_KULLANICI_KOD: TIntegerField;
    QTedarikciSDY: TIntegerField;
    QTedarikciSDT: TDateTimeField;
    QTedarikciU_SDY: TIntegerField;
    QTedarikciU_SDT: TDateTimeField;
    LAltBolge: TOraQuery;
    LSAltBolge: TDataSource;
    LAltBolgeBOLGE: TStringField;
    LAltBolgeID_ALT_BOLGE: TFloatField;
    LAltBolgeID_ANA_BOLGE: TFloatField;
    LSehir: TOraQuery;
    LSSehir: TDataSource;
    LSIlce: TDataSource;
    LIlce: TOraQuery;
    LSehirDS_SEHIR: TStringField;
    LSehirID_SEHIR: TFloatField;
    LSehirID_BOLGE: TFloatField;
    LIlceSEHIR: TStringField;
    LIlceID_SEHIR: TFloatField;
    LIlceID_ILCE: TFloatField;
    LIlceID_BOLGE: TFloatField;
    CxYetkiSil: TcxButton;
    CxYetkiTakas: TcxButton;
    Panel6: TPanel;
    cxPageControl3: TcxPageControl;
    cxTabSheet12: TcxTabSheet;
    cxTabSheet13: TcxTabSheet;
    Shape1: TShape;
    CxYTum: TcxCheckBox;
    CxYAnaBolge: TcxCheckBox;
    CxYAltBolge: TcxCheckBox;
    CxYBolge: TcxCheckBox;
    CxYSehir: TcxCheckBox;
    CxYIlce: TcxCheckBox;
    CxYTabela: TcxCheckBox;
    CxYSatinalmaci: TcxCheckBox;
    CxLAnaBolge: TcxLookupComboBox;
    CxLBolge: TcxLookupComboBox;
    CxLSehir: TcxLookupComboBox;
    cxLabel26: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    CxYTedarikci: TcxCheckBox;
    LBaz: TcxLookupComboBox;
    LYetki: TcxLookupComboBox;
    cxLabel27: TcxLabel;
    cxLabel28: TcxLabel;
    Shape2: TShape;
    cxButton3: TcxButton;
    cxButton4: TcxButton;
    QBaz: TOraQuery;
    SBaz: TDataSource;
    QDegisen: TOraQuery;
    SDegisen: TDataSource;
    QDegisenKOD: TIntegerField;
    QDegisenISIM: TStringField;
    QDegisenUNVANI: TStringField;
    QBazKOD: TIntegerField;
    QBazISIM: TStringField;
    QBazUNVANI: TStringField;
    cxLabel29: TcxLabel;
    cxLabel30: TcxLabel;
    cxDBImageComboBox2: TcxDBImageComboBox;
    N5: TMenuItem;
    KullancKopyalama1: TMenuItem;
    Panel8: TPanel;
    cxButton5: TcxButton;
    cxLabel31: TcxLabel;
    VTSec: TcxCheckListBox;
    cxButton6: TcxButton;
    SpTumSec: TSpeedButton;
    SpTumKaldir: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormDestroy(Sender: TObject);
    procedure PageControl1Changing(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure tKullaniciAfterDelete(DataSet: TDataSet);
    procedure tKullaniciAfterEdit(DataSet: TDataSet);
    procedure tKullaniciAfterInsert(DataSet: TDataSet);
    procedure tKullaniciAfterPost(DataSet: TDataSet);
    procedure tKullaniciAfterScroll(DataSet: TDataSet);
    procedure tKullaniciBeforeEdit(DataSet: TDataSet);
    procedure tKullaniciBeforePost(DataSet: TDataSet);
    procedure tKullaniciBeforeInsert(DataSet: TDataSet);
    procedure edAramaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edAramaKeyPress(Sender: TObject; var Key: Char);
    procedure pmAktarClick(Sender: TObject);
    procedure PmmKapatClick(Sender: TObject);
    procedure cbRolChange(Sender: TObject);
    procedure pmSatinalmaClick(Sender: TObject);
    procedure pmKirimClick(Sender: TObject);
    procedure pmSubeClick(Sender: TObject);
    procedure pmMasrafMagazalarClick(Sender: TObject);
    procedure Col_KodHeaderClick(Sender: TObject);
    procedure PageControl1PageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure PageControl1Change(Sender: TObject);
    procedure cxGrid1DBTableView1CustomDrawCell(
      Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
      AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
    procedure YeniEkleExecute(Sender: TObject);
    procedure YeniDegistirExecute(Sender: TObject);
    procedure YeniSilExecute(Sender: TObject);
    procedure YeniKaydetExecute(Sender: TObject);
    procedure YeniVazgecExecute(Sender: TObject);
    procedure YeniGeriExecute(Sender: TObject);
    procedure YeniIleriExecute(Sender: TObject);
    procedure YeniKapatExecute(Sender: TObject);
    procedure RolEkleExecute(Sender: TObject);
    procedure RolDegistirExecute(Sender: TObject);
    procedure RolSilExecute(Sender: TObject);
    procedure RolKaydetExecute(Sender: TObject);
    procedure RolVazgecExecute(Sender: TObject);
    procedure DbEdit4DblClick(Sender: TObject);
    procedure cxPageControl1PageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure dKullaniciStateChange(Sender: TObject);
    procedure cxPageControl1Change(Sender: TObject);
    procedure QRollerBeforeOpen(DataSet: TDataSet);
    procedure QRollerAfterInsert(DataSet: TDataSet);
    procedure QRollerAfterEdit(DataSet: TDataSet);
    procedure QRollerBeforePost(DataSet: TDataSet);
    procedure cxDBLookupComboBox3PropertiesChange(Sender: TObject);
    procedure QRollerBeforeDelete(DataSet: TDataSet);
    procedure cbAramaChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxDBMemo3KeyPress(Sender: TObject; var Key: Char);
    procedure cxDBMemo2KeyPress(Sender: TObject; var Key: Char);
    procedure cxDBTextEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure cxDBMemo1KeyPress(Sender: TObject; var Key: Char);
    procedure QRollerAfterScroll(DataSet: TDataSet);
    procedure cxDBLookupComboBox1PropertiesChange(Sender: TObject);
    procedure SRollerDataChange(Sender: TObject; Field: TField);
    procedure cxDBTextEdit5Click(Sender: TObject);
    procedure cxDBMemo3Click(Sender: TObject);
    procedure ActSorgulaExecute(Sender: TObject);
    procedure ActVazgecExecute(Sender: TObject);
    procedure cxDBTextEdit1DblClick(Sender: TObject);
    procedure QAnaBolgeAfterInsert(DataSet: TDataSet);
    procedure QAnaBolgeBeforePost(DataSet: TDataSet);
    procedure QAnaBolgeBeforeDelete(DataSet: TDataSet);
    procedure cxPageControl2Change(Sender: TObject);
    procedure dKullaniciDataChange(Sender: TObject; Field: TField);
    procedure cxGrid3FocusedViewChanged(Sender: TcxCustomGrid; APrevFocusedView,
      AFocusedView: TcxCustomGridView);
    procedure cxPageControl2PageChanging(Sender: TObject; NewPage: TcxTabSheet;
      var AllowChange: Boolean);
    procedure CxYTumPropertiesChange(Sender: TObject);
    procedure CxYAnaBolgePropertiesChange(Sender: TObject);
    procedure CxYBolgePropertiesChange(Sender: TObject);
    procedure CxYSehirPropertiesChange(Sender: TObject);
    procedure CxYetkiSilClick(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CxYetkiTakasClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure cxButton4Click(Sender: TObject);
    procedure DbEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure KullancKopyalama1Click(Sender: TObject);
    procedure cxButton6Click(Sender: TObject);
    procedure SpTumSecClick(Sender: TObject);
    procedure SpTumKaldirClick(Sender: TObject);
  private
    Procedure MngQuery(F, V, L: String; Order: Boolean);
    procedure StoreState(LoginId,Firmalar,Magazalar,State,Roll : String);
    Procedure ExecSql(Str : String);
    Procedure RolAc;
  public
    { Public declarations }
  end;

var
  Erp2000_Kullanicilar: TErp2000_Kullanicilar;

implementation

Uses BlyLib, dModule, ErpMenu;

Var
  Buffer             : Array[1..9999] Of Boolean;
  IslemTipi          : Integer;
  SubeList           : TStringList;
  DataState          : String;
  EskiBISifre        : String;
  EskiBIKullanici    : Boolean;
{$R *.DFM}


Procedure TErp2000_Kullanicilar.RolAc;
Begin
    If QRoller.Active Then QRoller.Close;
    QRoller.Open;
    //If CxPageControl1.ActivePage <> CxTabSheet3 Then CxPageControl1.ActivePage := CxTabSheet3;
    If QRoller.State In [DsEdit,DsInsert] Then Panel5.Enabled       := (QRollerKOD.AsString <> '') Or (TKullanici.State = DsInsert)
                                          Else Panel5.Enabled       := True;
End;

Procedure TErp2000_Kullanicilar.MngQuery(F, V, L: String; Order: Boolean);
Begin
  if tKullanici.Active Then tKullanici.Close;
  tKullanici.SQL.Clear;
  tKullanici.SQL.Add('SELECT * FROM KULLANICI WHERE KOD>0');
  if cbRol.ItemIndex=1 Then tKullanici.SQL.Add(' AND AKTIF = ''E'' ');
  if cbRol.ItemIndex=2 Then tKullanici.SQL.Add(' AND AKTIF = ''H'' ');
  If CxCheckBox1.Checked = False Then tKullanici.SQL.Add(' AND LOGINNAME NOT LIKE ''ADK%''');

  if V <> '' Then
  Begin
    Case cbArama.ItemIndex Of
       0    : tKullanici.SQL.Add('AND '+ F + '=' + V);
       1..2 : tKullanici.SQL.Add('AND '+ _SQLString(F,V,'S'));
       3    : tKullanici.SQL.Add('AND KOD IN (SELECT KOD FROM KULLANICI_ROL WHERE FIRMA=' + EdArama.Text + ')');
       4    : tKullanici.SQL.Add('AND KOD IN (SELECT KOD FROM KULLANICI_ROL WHERE ' + _SQLString(F,V,'S') + ')');
    End;
  End;
  if Order and (F <> '') Then tKullanici.SQL.Add('ORDER BY ' + F);
  //TKullanici.SQL.SaveToFile('C:\Kullanici.Txt');
  tKullanici.Open;
End;


procedure TErp2000_Kullanicilar.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if tKullanici.State In [dsInsert, dsEdit] Then
     begin
       if messagedlg('Girilen kullanýcý bilgisi kaydedilmemiþ, kaydetmek istermisiniz ?', mtconfirmation, [mbyes, mbno], 0) = mryes then tKullanici.Post
                                                                                                                                    else tKullanici.Cancel;
     end;
  Action := caFree;
    DmGlobal.QUnvanlar.Close;
end;


procedure TErp2000_Kullanicilar.FormDestroy(Sender: TObject);
Var
   I : Integer;
begin
    Yonetim_Menu.MenuTree.Items[Erp2000_Kullanicilar.Tag].ImageIndex    := 200;
    Yonetim_Menu.MenuTree.Items[Erp2000_Kullanicilar.Tag].SelectedIndex := 201;
    Yonetim_Menu.MenuTree.Repaint;
    for I := 0 to Yonetim_Menu.ComponentCount - 1 do if Yonetim_Menu.Components[I].ClassType = TOraQuery then  (Yonetim_Menu.Components[I] As TOraQuery).Close;
end;

procedure TErp2000_Kullanicilar.PageControl1Changing(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Not(tKullanici.State In [dsInsert, dsEdit]);
end;

procedure TErp2000_Kullanicilar.FormCreate(Sender: TObject);
var
 CariKirim : String;
begin
    Caption := 'Kullanýcý Tanýmlarý';
    YeniEkle.Visible      := Not(YonetimIslemleriIzleyiciMod);
    YeniDegistir.Visible  := Not(YonetimIslemleriIzleyiciMod);
    YeniSil.Visible       := Not(YonetimIslemleriIzleyiciMod);
    YeniKaydet.Visible    := Not(YonetimIslemleriIzleyiciMod);
    YeniVazgec.Visible    := Not(YonetimIslemleriIzleyiciMod);
    QRollerAfterScroll(nil);
    // BI TANIMLAMALARI

    Left := ((Yonetim_Menu.Width - 220) div 2) - (Width  div 2);
    Top  := ((Yonetim_Menu.Height - 80) div 2) - (Height div 2);

  DmGlobal.QUnvanlar.Open;
  // Satýnalmacý bilgileri yükleniyor.
  dmGlobal.qTmp.Close;
  dmGlobal.qTmp.SQL.Clear;
  dmGlobal.qTmp.SQL.Add('SELECT KOD FROM SATINALMACILAR ORDER BY KOD');
  dmGlobal.qTmp.Open;
  chSatinalmaci.Items.Clear;
  While Not dmGlobal.qTmp.Eof Do
  Begin
    chSatinalmaci.Items.Add(dmGlobal.qTmp.Fields[0].AsString);
    dmGlobal.qTmp.Next;
  End;
  //Ana Kýrým bilgileri yükleniyor.

    dmGlobal.qTmp.Close;
    dmGlobal.qTmp.SQL.Clear;
    dmGlobal.qTmp.SQL.Add('SELECT KOD FROM GRUP_DATA WHERE BOLUM IN (''S'',''D'') AND ((LENGTH(KOD)=3) OR (KOD LIKE ''KNF.%'' AND  LENGTH(KOD)=6)) ORDER BY KOD');
    dmGlobal.qTmp.Open;
    chAnaKirim.Items.Clear;
    While Not dmGlobal.qTmp.Eof Do
    Begin
      chAnaKirim.Items.Add(dmGlobal.qTmp.Fields[0].AsString);
      dmGlobal.qTmp.Next;
    End;
    //Cari bilgiler yükleniyor.
    DmGlobal.qTmp.Close;
    dmGlobal.qTmp.SQL.Clear;
    dmGlobal.qTmp.SQL.Add('SELECT CARI_ID, UNVAN FROM KART_CARI WHERE ISYERI = ''S'' ORDER BY UNVAN');
    dmGlobal.qTmp.Open;
    SubeList   := TStringList.Create;
    chMagaza.Clear;
    chMasrafMagazalar.Clear;

    While not dmGlobal.qTmp.Eof do
    Begin
      SubeList.Add(dmGlobal.qTmp.FieldByName('CARI_ID').AsString);
      chMagaza.Items.Add(dmGlobal.qTmp.FieldByName('UNVAN').AsString);
      chMasrafMagazalar.Items.Add(dmGlobal.qTmp.FieldByName('UNVAN').AsString);
      dmGlobal.qTmp.Next;
    End;
    qSube.Open;
    qSatinalmaci.Open;
    SQLList(TRol,'SELECT *FROM ROLLER WHERE TUR=' + #39 + LoginInfo.RolTur + #39);
    PageControl1.ActivePage := TabSheet1;
    MngQuery('', '', '', True);
    if not(DmGlobal.QUnvanlar.Active) then dmGlobal.qUnvanlar.Open;

    cxDBLookupComboBox2.Enabled := Not(LoginInfo.RolTur[1] In [ 'P','M','T']);
    cxDBMemo1.Enabled           := Not(LoginInfo.RolTur[1] In [ 'P','M','T']);
    cxDBTextEdit5.Enabled       := Not(LoginInfo.RolTur[1] In [ 'P','M','T']);
    cxDBMemo3.Enabled           := Not(LoginInfo.RolTur[1] In [ 'P','M','T']);
    cxDBMemo4.Enabled           := Not(LoginInfo.RolTur[1] In [ 'P','M','T']);
    QryStruct.SQLFormats.Date := 'dd' + LoginInfo.TarihAyrac + 'MM' + LoginInfo.TarihAyrac + 'yyyy';
    QryStruct.SQLFormats.Time := 'dd' + LoginInfo.TarihAyrac + 'MM' + LoginInfo.TarihAyrac + 'yyyy hh:mm';
    QryPanel.Activate;
    actSorgulaExecute(ActSorgula);
    tKullaniciAfterScroll(TKullanici);
    Abort;
end;

procedure TErp2000_Kullanicilar.tKullaniciAfterDelete(DataSet: TDataSet);
begin
  dmGlobal.dbGlobal.StartTransaction;
  Try
    tkullanici.ApplyUpdates;
    dmGlobal.dbGlobal.Commit;
    tkullanici.CommitUpdates;
  Except
   On E : Exception do
   Begin
    dmGlobal.dbGlobal.RollBack;
    tkullanici.CancelUpdates;
    Application.MessageBox(PChar('Kullanýcý silme iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi !' + E.Message), 'HATA!', mb_OK);
    tKullaniciAfterScroll(nil);
   End;
  End;
  tKullaniciAfterScroll(nil);
  RolAc;
end;

procedure TErp2000_Kullanicilar.tKullaniciAfterEdit(DataSet: TDataSet);
begin
    PageControl1.ActivePage     := TabSheet2;
    tKullaniciBI_SIFRE.AsString  := SQLResult('SELECT crypto (''E'', NVL(' + #39 + tKullaniciBI_SIFRE.AsString + #39 + ',''X''), 5) B FROM DUAL');
    tKullaniciSIFRE.AsString     := SQLResult('SELECT crypto (''E'', NVL(' + #39 + tKullaniciSIFRE.AsString + #39 + ',''X''), 5) B FROM DUAL');
    //tKullaniciSIFRE.AsString    := _Crypto(False, tKullaniciSIFRE.AsString, 5);
    //tKullaniciBI_SIFRE.AsString := _Crypto(False, tKullaniciBI_SIFRE.AsString, 5);
    EskiBIKullanici             := tkullaniciBI_KULLANICI.Text = 'E';
    tKullaniciSDY.AsString      := LoginInfo.Kod;
    EskiBISifre                 := tKullaniciBI_SIFRE.AsString;
    If Panel5.Enabled Then
    Begin
        cxDBTextEdit2.SelStart               := 0;
        cxDBTextEdit2.SelLength              := Length(cxDBTextEdit2.Text);
        cxDBTextEdit2.SetFocus;
    End;
end;

procedure TErp2000_Kullanicilar.tKullaniciAfterInsert(DataSet: TDataSet);
Var
  I: Integer;
begin
  For I := 1 To 9999 Do Buffer[I]     := False;
  tKullaniciBI_KULLANICI.AsString     := 'H';
  tkullaniciBI_SIFRE_DEGISTI.AsString := 'H';
  tkullaniciBI_KULLANICI_SIL.AsString := 'H';

  tKullaniciAKTIF.AsString        := 'E';
  tKullaniciELTERMINALI_KULLANIR.AsString := 'H';
  tKullaniciSDY.AsString   := LoginInfo.Kod;

    If Panel5.Enabled Then
    Begin
        cxDBTextEdit2.SelStart               := 0;
        cxDBTextEdit2.SelLength              := Length(cxDBTextEdit2.Text);
        cxDBTextEdit2.SetFocus;
    End;
    RolAc;

    if dmGlobal.qTmp.Active Then dmGlobal.qTmp.Close;
    dmGlobal.qTmp.SQL.Clear;
    dmGlobal.qTmp.SQL.Add('SELECT KULLANICI_TANIMI_SQ.NEXTVAL FROM DUAL');
    dmGlobal.qTmp.Open;
    tkullaniciKOD.Value := dmGlobal.qTmp.FieldByName('NEXTVAL').Value;
    dmGlobal.qTmp.Close;
end;

procedure TErp2000_Kullanicilar.tKullaniciAfterPost(DataSet: TDataSet);
Var
  bi_sifre : String;
  I : Integer;
begin
   If QRoller.State in [DsInsert,DsEdit]       Then QRoller.Post;
   If QAnaBolge.State in [DsInsert,DsEdit]     Then QAnaBolge.Post;
   If QAltBolge.State in [DsInsert,DsEdit]     Then QAltBolge.Post;
   If QBolge.State in [DsInsert,DsEdit]        Then QBolge.Post;
   If QSehir.State in [DsInsert,DsEdit]        Then QSehir.Post;
   If QIlce.State in [DsInsert,DsEdit]         Then QIlce.Post;
   If QTabela.State in [DsInsert,DsEdit]       Then QTabela.Post;
   If QSatinalmacii.State in [DsInsert,DsEdit] Then QSatinalmacii.Post;
   If QTedarikci.State in [DsInsert,DsEdit]    Then QTedarikci.Post;

   QRoller.ApplyUpdates;
   If QAnaBolge.Active     Then QAnaBolge.ApplyUpdates;
   If QAltBolge.Active     Then QAltBolge.ApplyUpdates;
   If QBolge.Active        Then QBolge.ApplyUpdates;
   If QSehir.Active        Then QSehir.ApplyUpdates;
   If QIlce.Active         Then QIlce.ApplyUpdates;
   If QTabela.Active       Then QTabela.ApplyUpdates;
   If QSatinalmacii.Active Then QSatinalmacii.ApplyUpdates;
   If QTedarikci.Active    Then QTedarikci.ApplyUpdates;

 dmGlobal.dbGlobal.StartTransaction;
 try
  tKullanici.ApplyUpdates;

  dmGlobal.dbGlobal.Commit;
  tKullanici.CommitUpdates;

      // iþ zekasý için yeni oluþturuldu
      if Length(_Crypto(False, tkullaniciSIFRE.AsString,5))>10 then bi_sifre := tkullaniciSIFRE.AsString
        Else
      begin
          i        := Length(_Crypto(False, tkullaniciSIFRE.AsString,5));
          bi_sifre := _Crypto(False, tkullaniciSIFRE.AsString,5);
          while i<10 do
            begin
              bi_sifre := bi_sifre + '0';
              Inc(i);
            end;
          bi_sifre := _Crypto(True, bi_sifre, 5);
      end;
      ExecSql('UPDATE KULLANICI SET BI_SIFRE='''+bi_sifre+''',BI_SIFRE_DEGISTI=''E'' WHERE KOD= '+Tkullanici.FieldByName('KOD').AsString);
     /////////////////////////////////////////////////

  // Belit.Net
  ExecSql('DELETE KULLANICI_WEBYETKI WHERE KOD='+tkullaniciKOD.AsString);
  ExecSql('INSERT INTO KULLANICI_WEBYETKI(KOD,WEBYETKI) VALUES('+tkullaniciKOD.AsString+','''+SQLResult('SELECT crypto (''E'', NVL(' + #39 + tKullaniciSIFRE.AsString + #39 + ',''X''), 5) B FROM DUAL'){_Crypto(False, tKullaniciSIFRE.AsString, 5)}+''')');
  QRoller.First;
  If DataState = 'DsInsert' Then
  Begin
      ExecSql('DELETE BOLGE_TANIMI WHERE LOGINID='+tkullaniciKOD.AsString);
      ExecSql('DELETE BOLGE_STORE WHERE LOGINID='+tkullaniciKOD.AsString);
  End;
  While Not QRoller.Eof Do
  Begin
      If Not(LoginInfo.Konsolide) Then StoreState(tkullaniciKOD.AsString,QRollerFIRMA.AsString,QRollerSUBELER.AsString,DataState,QRollerROL.AsString);
      QRoller.Next;
  End;
 except on E:Exception do
   begin
     dmGlobal.dbGlobal.Rollback;
     MessageDlg('Kayýt iþlemi sýrasýnda bir hata oluþtu ve iþlem iptal edildi !'+e.message, mtError, [mbOK], 0);
     exit;
   end;
 End;

 //IK_T_YETKI KONTROLU
 If (tkullaniciPERSONEL_ID.AsString <> '') And (cxDBLookupComboBox3.Text <> '')
 Then
    Begin
        SQLRecord('DELETE FROM IK_T_YETKI WHERE KULLANICI_KOD =  ' + tkullaniciKOD.AsString);
        SQLRecord('INSERT INTO IK_T_YETKI SELECT ' + tkullaniciPERSONEL_ID.AsString + ',' + tkullaniciKOD.AsString + ',' + tkullaniciKOD.AsString  + ',(SELECT BOF_ID FROM IK_T_BOF WHERE ROWNUM = 1) FROM DUAL WHERE ' + tkullaniciPERSONEL_ID.AsString + '||''_''||' + tkullaniciKOD.AsString + ' NOT IN (SELECT PERSONEL_ID||''_''||KULLANICI_KOD FROM IK_T_YETKI)');
    End
       Else
    Begin
        SQLRecord('DELETE FROM IK_T_YETKI WHERE KULLANICI_KOD =  ' + tkullaniciKOD.AsString);
    End;
 tKullaniciAfterScroll(Nil);
 //PageControl1.ActivePage := TabSheet1;
end;

procedure TErp2000_Kullanicilar.tKullaniciAfterScroll(DataSet: TDataSet);
begin
  // BI AYARLARI
    //CxTabSheet1.TabVisible := (Pos('BELIT', LoginInfo.OracleKullanici) > 0) And (LoginInfo.Haklar[4511]) ;
    cxLabel7.Visible           := Pos('BELIT', LoginInfo.OracleKullanici) > 0;
    cxLabel30.Visible          := Pos('BELIT', LoginInfo.OracleKullanici) > 0;
    cxLabel6.Visible           := Pos('BELIT', LoginInfo.OracleKullanici) > 0;
    cxDBImageComboBox2.Visible := Pos('BELIT', LoginInfo.OracleKullanici) > 0;
    cxDbCheckBox1.Visible      := Pos('BELIT', LoginInfo.OracleKullanici) > 0;
    cxDBTextEdit1.Visible      := Pos('BELIT', LoginInfo.OracleKullanici) > 0;
    cxLabel8.Visible           := Pos('BELIT', LoginInfo.OracleKullanici) > 0;

  If Caption = 'BI Kullanýcý Tanýmlarý' then
  Begin
     YeniEkle.Enabled    := False;
     YeniKaydet.Enabled  := tKullanici.State In [dsInsert, dsEdit];
     YeniVazgec.Enabled  := tKullanici.State In [dsInsert, dsEdit];
     YeniKapat.Enabled   := (tKullanici.State = dsBrowse);
     YeniGeri.Enabled    := Not(tKullanici.BOF) and (tKullanici.State = dsBrowse);
     YeniIleri.Enabled   := Not(tKullanici.EOF) and (tKullanici.State = dsBrowse);
     YeniSil.Enabled     := False;
     cxDBTextEdit2.Properties.ReadOnly       := True;
     cxDBLookupComboBox3.Properties.ReadOnly := True;
     cxDBTextEdit6.Properties.ReadOnly       := True;
     DbEdit4.Properties.ReadOnly             := True;
     cxDBLookupComboBox5.Properties.ReadOnly := True;
     cxDBTextEdit8.Properties.ReadOnly       := True;
     cxDBCheckBox3.Properties.ReadOnly       := True;
     cxDBCheckBox4.Properties.ReadOnly       := True;
     CxYetkiSil.Visible                      := (LoginInfo.Haklar[4512]) And (Not(tKullanici.State In [dsInsert, dsEdit]));
     CxYetkiTakas.Visible                    := (LoginInfo.Haklar[4513]) And (Not(tKullanici.State In [dsInsert, dsEdit]));

     if tKullanici.State = dsBrowse Then
     Begin
       YeniDegistir.Enabled := (tKullaniciKOD.AsString <> '') ;
     End
       Else
     Begin
       YeniDegistir.Enabled := False;
     End;
                   

     if tKullanici.State = dsBrowse Then
     Begin
         StatusBar1.Panels[3].Text := tKullaniciSDY.AsString;
         StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tKullaniciSDT.AsDateTime);
     End
       Else
     Begin
         StatusBar1.Panels[3].Text := '...';
         StatusBar1.Panels[4].Text := '...';
     End;
     CxNav.Enabled             := (pmKaydet.Enabled);
     pmSatinalma.Enabled       := False;
     pmSube.Enabled            := False;
     pmKirim.Enabled           := False;
     pmMasrafMagazalar.Enabled := False;
     PmAktar.Enabled           := False;
     PmmKapat.Enabled          := PmKaydet.Enabled;
     SRoller.AutoEdit          := False;
     CxVAnaBolge.OptionsData.Editing    := tKullanici.State in [dsinsert, dsedit];
     CxVAltBolge.OptionsData.Editing    := CxVAnaBolge.OptionsData.Editing;
     CxVBolge.OptionsData.Editing       := CxVAnaBolge.OptionsData.Editing;
     CxVSatinalmaci.OptionsData.Editing := CxVAnaBolge.OptionsData.Editing;
     CxVSehir.OptionsData.Editing       := CxVAnaBolge.OptionsData.Editing;
     CxVIlce.OptionsData.Editing        := CxVAnaBolge.OptionsData.Editing;
     CxVTabela.OptionsData.Editing      := CxVAnaBolge.OptionsData.Editing;
  End
     Else
  if Caption = 'Kullanýcý Tanýmlarý' then
  Begin
     YeniEkle.Enabled    := (tKullanici.State = dsBrowse) And (tkullaniciKOD.Text <> '0') And (LoginInfo.Haklar[2]) ;
     YeniKaydet.Enabled  := (tKullanici.State In [dsInsert, dsEdit]) And (tkullaniciKOD.Text <> '0');
     YeniVazgec.Enabled  := (tKullanici.State In [dsInsert, dsEdit]) And (tkullaniciKOD.Text <> '0');
     YeniKapat.Enabled   := (tKullanici.State = dsBrowse);
     YeniGeri.Enabled  := Not(tKullanici.BOF) and (tKullanici.State = dsBrowse);
     YeniIleri.Enabled := Not(tKullanici.EOF) and (tKullanici.State = dsBrowse);
     if tKullanici.State = dsBrowse Then
     Begin
       YeniDegistir.Enabled := (tKullaniciKOD.AsString <> '') And (tkullaniciKOD.Text <> '0') And (LoginInfo.Haklar[2]);
       YeniSil.Enabled      := (tKullaniciKOD.AsString <> '') And (tkullaniciKOD.Text <> '0') And (LoginInfo.Haklar[6751]);
     End
       Else
     Begin
       YeniDegistir.Enabled := False;
       YeniSil.Enabled      := False;
     End;

     CxYetkiSil.Visible                      := (LoginInfo.Haklar[4512]) And (Not(tKullanici.State In [dsInsert, dsEdit])) And (LoginInfo.Haklar[6751]);
     CxYetkiTakas.Visible                    := (LoginInfo.Haklar[4513]) And (Not(tKullanici.State In [dsInsert, dsEdit])) And (LoginInfo.Haklar[2]);

     if tKullanici.State = dsBrowse Then
     Begin
         StatusBar1.Panels[3].Text := tKullaniciSDY.AsString;
         StatusBar1.Panels[4].Text := FormatDateTime('dd mm yyyy hh:mm', tKullaniciSDT.AsDateTime);
     End
       Else
     Begin
         StatusBar1.Panels[3].Text := '...';
         StatusBar1.Panels[4].Text := '...';
     End;
     CxNav.Enabled             := pmKaydet.Enabled;
     pmSatinalma.Enabled       := tKullanici.State in [dsinsert, dsedit];
     pmSube.Enabled            := tKullanici.State in [dsinsert, dsedit];
     pmKirim.Enabled           := tKullanici.State in [dsinsert, dsedit];
     pmMasrafMagazalar.Enabled := tKullanici.State in [dsinsert, dsedit];
     PmAktar.Enabled           := PmKaydet.Enabled;
     PmmKapat.Enabled          := PmKaydet.Enabled;
     SRoller.AutoEdit          := PmKaydet.Enabled;
     CxVAnaBolge.OptionsData.Editing    := tKullanici.State in [dsinsert, dsedit];
     CxVAltBolge.OptionsData.Editing    := CxVAnaBolge.OptionsData.Editing;
     CxVBolge.OptionsData.Editing       := CxVAnaBolge.OptionsData.Editing;
     CxVSatinalmaci.OptionsData.Editing := CxVAnaBolge.OptionsData.Editing;
     CxVSehir.OptionsData.Editing       := CxVAnaBolge.OptionsData.Editing;
     CxVIlce.OptionsData.Editing        := CxVAnaBolge.OptionsData.Editing;
     CxVTabela.OptionsData.Editing      := CxVAnaBolge.OptionsData.Editing;
  End;
end;

procedure TErp2000_Kullanicilar.tKullaniciBeforeEdit(DataSet: TDataSet);
begin
  if PageControl1.ActivePage = TabSheet1 Then PageControl1.ActivePage := TabSheet2;
end;

procedure TErp2000_Kullanicilar.tKullaniciBeforePost(DataSet: TDataSet);
var
  AStr : String;
  I : Integer;

  Function MukerrerKontrol(TableName : String; SQLL : String) : Boolean;
  Begin
      If dmGlobal.QTmp.Active Then dmGlobal.QTmp.Close;
      dmGlobal.QTmp.SQL.Clear;
      dmGlobal.QTmp.SQL.Text := 'SELECT COUNT(1) FROM ' + TableName + ' WHERE ' + sqll;
      dmGlobal.QTmp.Open;
      Result := dmGlobal.QTmp.Fields[0].AsInteger > 0;
      dmGlobal.QTmp.Close;
  End;

begin
  If QRoller.State In [DsEdit,DsInsert] Then QRoller.Post;
  If QAnaBolge.State in [DsInsert,DsEdit]   Then QAnaBolge.Post;
  If QAltBolge.State in [DsInsert,DsEdit]   Then QAltBolge.Post;
  If QBolge.State in [DsInsert,DsEdit]   Then QBolge.Post;
  If QSehir.State in [DsInsert,DsEdit]   Then QSehir.Post;
  If QIlce.State in [DsInsert,DsEdit]   Then QIlce.Post;
  If QTabela.State in [DsInsert,DsEdit]   Then QTabela.Post;
  If QSatinalmacii.State in [DsInsert,DsEdit]   Then QSatinalmacii.Post;
  If QTedarikci.State in [DsInsert,DsEdit]   Then QTedarikci.Post;

  tKullaniciSDY.AsString       := LoginInfo.Kod;
  tKullaniciSDT.Value          := Now;


  If tkullaniciLOGINNAME.AsString = '' Then
  Begin
      Application.MessageBox('[Giriþ Adý] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
      cxDBTextEdit2.SelStart               := 0;
      cxDBTextEdit2.SelLength              := Length(cxDBTextEdit2.Text);
      cxDBTextEdit2.SetFocus;
      Abort;
  End;

  If tkullaniciISIM.AsString = '' Then
  Begin
      Application.MessageBox('[Adý Soyadý] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
      cxDBTextEdit6.SelStart               := 0;
      cxDBTextEdit6.SelLength              := Length(cxDBTextEdit6.Text);
      cxDBTextEdit6.SetFocus;
      Abort;
  End;

  If tkullaniciSIFRE.AsString = '' Then
  Begin
      Application.MessageBox('[Þifre] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
      DbEdit4.SelStart               := 0;
      DbEdit4.SelLength              := Length(DbEdit4.Text);
      DbEdit4.SetFocus;
      Abort;
  End;
  
  If (tkullaniciELTERMINALI_KULLANIR.Text = 'E') And (Pos('IMAS',LoginInfo.OracleKullanici) > 0) then
  Begin
      AStr := '';
      For I := 1 to Length(tkullaniciSIFRE.Text) do
          if Not(Pos(tkullaniciSIFRE.Text[I],'0123456789') > 0) then AStr := 'E';

      If AStr = 'E' then
        Begin
            Application.MessageBox('Kiosk ve el terminali þifre tanýmlarken sadece rakam ile þifre verilebilir. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
            Abort;
        End;
      If MukerrerKontrol('KULLANICI',' Crypto(''E'',SIFRE, 5) = ' + #39 + tkullaniciSIFRE.Text + #39 + ' AND KOD <> ' + tkullaniciKOD.Text)
        Then
      Begin
          Application.MessageBox('Ýlgili Terminal / Kiosk þifresi baþka bir kullanýcýda tanýmlanmýþ. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
          Abort;
      End;
  End;

  If (tkullaniciBI_SIFRE.AsString = '') And (tkullaniciBI_KULLANICI.Text = 'E') Then
  Begin
      Application.MessageBox('[BI Þifre] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
      cxDBTextEdit1.SelStart               := 0;
      cxDBTextEdit1.SelLength              := Length(cxDBTextEdit1.Text);
      cxDBTextEdit1.SetFocus;
      Abort;
  End;

  If (tkullaniciINTERNALID.AsString = '') And (tkullaniciBI_KULLANICI.Text = 'E') Then
  Begin
      Application.MessageBox('[BI Rol] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
      cxDBImageComboBox2.SelStart               := 0;
      cxDBImageComboBox2.SelLength              := Length(cxDBImageComboBox2.Text);
      cxDBImageComboBox2.SetFocus;
      Abort;
  End;

  If (Length(tkullaniciBI_SIFRE.AsString) < 10) And (tkullaniciBI_KULLANICI.Text = 'E') Then
  Begin
      Application.MessageBox('[BI Þifre] bilgisi en az 10 karakter olmalýdýr. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
      cxDBTextEdit1.SelStart               := 0;
      cxDBTextEdit1.SelLength              := Length(cxDBTextEdit1.Text);
      cxDBTextEdit1.SetFocus;
      Abort;
  End;

    If DataSet.State = DsInsert Then
    Begin
      If MukerrerKontrol('KULLANICI','LOGINNAME = ' + #39 + TKullaniciLOGINNAME.AsString + #39) Then
      Begin
          Application.MessageBox('Ayný kullanýcý kodu daha öncden kullanýlmýþ. Kontrol ediniz...','DÝKKAT',MB_OK);
          Abort;
      End;
{
      If MukerrerKontrol('KULLANICI','ISIM = ' + #39 + TKullaniciISIM.AsString + #39 + ' AND KOD <> ' + #39 + tkullaniciKOD.AsString + #39) Then
      Begin
          Application.MessageBox('Ayný isim daha önceden kullanýlmýþ. Kontrol ediniz...','DÝKKAT',MB_OK);
          Abort;
      End;
}
    End;
    If (EskiBISifre <> tKullaniciBI_SIFRE.AsString) And (TKullanici.State = DsEdit) Then tkullaniciBI_SIFRE_DEGISTI.Text := 'E'
                                                                                    Else tkullaniciBI_SIFRE_DEGISTI.Text := 'H';
    If (EskiBIKullanici = True) And (tkullaniciBI_KULLANICI.Text = 'H') And (TKullanici.State = DsEdit) Then tkullaniciBI_KULLANICI_SIL.Text := 'E'
                                                                                                        Else tkullaniciBI_KULLANICI_SIL.Text := 'H'; 
    EskiBIKullanici             := tkullaniciBI_KULLANICI.Text = 'E';
    tKullaniciBI_SIFRE.AsString  := SQLResult('SELECT crypto (''H'', NVL(' + #39 + tKullaniciBI_SIFRE.AsString + #39 + ',''X''), 5) B FROM DUAL');
    tKullaniciSIFRE.AsString     := SQLResult('SELECT crypto (''H'', NVL(' + #39 + tKullaniciSIFRE.AsString + #39 + ',''X''), 5) B FROM DUAL');
    AStr := '';
    AStr := AStr + _Crypto(True,DBEdit4.Text,5);
end;

procedure TErp2000_Kullanicilar.tKullaniciBeforeInsert(DataSet: TDataSet);
begin
  if PageControl1.ActivePage = TabSheet1 Then PageControl1.ActivePage := TabSheet2;
end;

procedure TErp2000_Kullanicilar.edAramaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key=VK_DOWN then tkullanici.Next else if Key=VK_UP then tkullanici.Prior;
end;

procedure TErp2000_Kullanicilar.edAramaKeyPress(Sender: TObject;
  var Key: Char);
Var
   I : Integer;
begin
 if Key = #13 then
 Begin
    if tKullanici.Active Then tKullanici.Close;
    tKullanici.SQL.Clear;
    tKullanici.SQL.Add('SELECT * FROM KULLANICI WHERE KOD>-1');
    If Not((LoginInfo.LOGINNAME = 'FATASAGUN') Or (LoginInfo.LOGINNAME = 'HARUN') Or (LoginInfo.LOGINNAME = 'BULU') Or (LoginInfo.LOGINNAME = 'AFURKAN') Or (LoginInfo.LOGINNAME = 'TUGRAL')) then
       tKullanici.SQL.Add(' AND LOGINNAME NOT IN (''AFURKAN'',''FATASAGUN'',''HARUN'',''TUGRAL'',''BULU'')');
    If cbRol.ItemIndex=1 Then tKullanici.SQL.Add(' AND AKTIF = ''E'' ');
    If cbRol.ItemIndex=2 Then tKullanici.SQL.Add(' AND AKTIF = ''H'' ');
    If CxCheckBox1.Checked = False Then tKullanici.SQL.Add(' AND LOGINNAME NOT LIKE ''ADK%''');
    If EdArama.Text <> '' Then
    Begin
      Case cbArama.ItemIndex Of
         0 : tKullanici.SQL.Add('AND KOD = ' + EdArama.Text);
         1 : tKullanici.SQL.Add('AND LOGINNAME '  + _MakeSQLString(EdArama.Text+'*'));
         2 : tKullanici.SQL.Add('AND ISIM ' + _MakeSQLString(EdArama.Text+'*'));
      End;
    End;

    QryPanel.Activate;
    QryPanel.BuildQuery;
    if QryPanel.QResult.WhereClause.Text <> '' then TKullanici.SQL.Add(' AND ');
    for i:= 0 to QryPanel.QResult.WhereClause.Count-1 do TKullanici.SQL.Add(QryPanel.QResult.WhereClause[i]);
    TKullanici.Open;
    tKullaniciAfterScroll(tKullanici);    
    Try
       EdArama.SelStart               := 0;
       EdArama.SelLength              := Length(EdArama.Text);
       EdArama.SetFocus;
       Abort;
    Except
    End;
 End;
end;

procedure TErp2000_Kullanicilar.pmAktarClick(Sender: TObject);
 Procedure SQLEkle(var SQLStr: String; EkSql:String);
 begin
   if SQLStr = '' then SQLStr := ';' +EkSql + ';'
   else SQLStr := SQLStr + EkSql +';';
 end;
var
SqlIfade: String;
i:Integer;
begin
    If (TKullanici.State In [DsEdit,DsInsert]) And (Not(QRoller.State In [DsEdit,DsInsert])) Then
    Begin
        If QRollerKOD.AsString = '' Then QRoller.Insert
                                    Else QRoller.Edit;
    End;
    If Not(QRoller.State In [DsEdit,DsInsert]) Then Abort;
  SqlIfade := '';
  case IslemTipi Of
    1: begin
         For i:=0 To chSatinalmaci.Items.Count-1 Do if chSatinalmaci.Checked[i] Then SQLEkle(SqlIfade,chSatinalmaci.Items.Strings[i]);
         QRoller.FieldByName('SATINALMACILAR').AsString :=SqlIfade;
       end;
    2: begin
         For i:=0 To chMagaza.Items.Count-1 Do if chMagaza.Checked[i] Then SQLEkle(SqlIfade,SubeList.Strings[i]);
         QRoller.FieldByName('SUBELER').AsString :=SqlIfade;
         QRoller.FieldByName('MASRAF_SUBELER').AsString :=SqlIfade;
         For i:=0 to chMasrafMagazalar.Items.Count-1      Do chMasrafMagazalar.Checked[i]     := POS(';'+SubeList.Strings[i]+';',SqlIfade)>0;
       end;
    3: begin
         For i:=0 To chAnaKirim.Items.Count-1 Do if chAnaKirim.Checked[i] Then SQLEkle(SqlIfade,chAnaKirim.Items.Strings[i]);
         QRoller.FieldByName('ANA_KIRIM').AsString :=SqlIfade;
       end;
    4: begin
         For i:=0 To chMasrafMagazalar.Items.Count-1 Do if chMasrafMagazalar.Checked[i] Then SQLEkle(SqlIfade,SubeList.Strings[i]);
         QRoller.FieldByName('MASRAF_SUBELER').AsString :=SqlIfade;
       end;
  end;
  pmSatinalma.Enabled := True;
  pmKirim.Enabled := True;
  pmSube.Enabled := True;
  pmMasrafMagazalar.Enabled := True;
  PmAktar.Visible  := False;
  SpTumSec.Visible     := False;
  SpTumKaldir.Visible  := False;
  PmmKapat.Visible := False;
end;

procedure TErp2000_Kullanicilar.PmmKapatClick(Sender: TObject);
begin
    pmSatinalma.Enabled := True;
    pmKirim.Enabled := True;
    pmSube.Enabled := True;
    pmMasrafMagazalar.Enabled := True;
    PmAktar.Visible := False;
    PmmKapat.Visible := False;
    SpTumSec.Visible     := False;
    SpTumKaldir.Visible  := False;
end;

procedure TErp2000_Kullanicilar.cbRolChange(Sender: TObject);
begin
    ActSorgula.Execute;
end;

procedure TErp2000_Kullanicilar.pmSatinalmaClick(Sender: TObject);
var
i:Integer;
begin
  Panel2.Visible  := True;
  PmAktar.Visible := True;
  SpTumSec.Visible     := True;
  SpTumKaldir.Visible  := True;

  PmmKapat.Visible := True;

  pmSatinalma.Enabled := False;
  pmKirim.Enabled := False;
  pmSube.Enabled := False;
  pmMasrafMagazalar.Enabled := False;


  IslemTipi      := 1;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  TabSheet3.TabVisible := True;
  TabSheet6.TabVisible := False;
  PageControl2.ActivePage := TabSheet3;
  For i:=0 to chSatinalmaci.Items.Count-1 Do chSatinalmaci.Checked[i]:= POS(''+chSatinalmaci.Items.Strings[i]+'',QRoller.FieldByName('SATINALMACILAR').AsString)>0;
end;

procedure TErp2000_Kullanicilar.pmKirimClick(Sender: TObject);
var
i:Integer;
begin
  Panel2.Visible       := True;
  pmSatinalma.Enabled := False;
  pmKirim.Enabled := False;
  pmSube.Enabled := False;
  pmMasrafMagazalar.Enabled := False;
  
  IslemTipi            := 3;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := True;
  TabSheet6.TabVisible := False;
  PageControl2.ActivePage := TabSheet5;
  PmAktar.Visible := True;
  PmmKapat.Visible := True;
  SpTumSec.Visible     := True;
  SpTumKaldir.Visible  := True;

  For i:=0 to chAnaKirim.Items.Count-1 Do chAnaKirim.Checked[i]:= POS(';'+chAnaKirim.Items.Strings[i]+';',QRoller.FieldByName('ANA_KIRIM').AsString)>0;

end;

procedure TErp2000_Kullanicilar.pmSubeClick(Sender: TObject);
var
i:Integer;
begin
  Panel2.Visible       := True;
  pmSatinalma.Enabled := False;
  pmKirim.Enabled := False;
  pmSube.Enabled := False;
  pmMasrafMagazalar.Enabled := False;
  PmAktar.Visible := True;
  SpTumSec.Visible     := True;
  SpTumKaldir.Visible  := True;
  PmmKapat.Visible := True;

  IslemTipi            := 2;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := True;
  TabSheet5.TabVisible := False;
  TabSheet6.TabVisible := False;
  PageControl2.ActivePage := TabSheet4;
  PmAktar.Visible := True;
  PmmKapat.Visible := True;
  SpTumSec.Visible     := True;
  SpTumKaldir.Visible  := True;


   For i:=0 to chMagaza.Items.Count-1 Do chMagaza.Checked[i]:= POS(';'+SubeList.Strings[i]+';',QRoller.FieldByName('SUBELER').AsString)>0;
end;

procedure TErp2000_Kullanicilar.pmMasrafMagazalarClick(Sender: TObject);
var
 i : Integer;
begin
  Panel2.Visible       := True;
  pmSatinalma.Enabled := False;
  pmKirim.Enabled := False;
  pmSube.Enabled := False;
  pmMasrafMagazalar.Enabled := False;
  PmAktar.Visible := True;
  PmmKapat.Visible := True;
  SpTumSec.Visible     := True;
  SpTumKaldir.Visible  := True;



  IslemTipi            := 4;
  TabSheet3.TabVisible := False;
  TabSheet4.TabVisible := False;
  TabSheet5.TabVisible := False;
  TabSheet6.TabVisible := True;
  PageControl2.ActivePage := TabSheet6;
  For i:=0 to chMasrafMagazalar.Items.Count-1 Do chMasrafMagazalar.Checked[i]:= POS(';'+SubeList.Strings[i]+';',QRoller.FieldByName('MASRAF_SUBELER').AsString)>0;

end;

procedure TErp2000_Kullanicilar.Col_KodHeaderClick(Sender: TObject);
begin
  case TcxGridDBColumn(Sender).Tag of
    1: MngQuery('KOD',      EdArama.Text,'', True);
    2: MngQuery('LOGINNAME',EdArama.Text,'', True);
    3: MngQuery('ISIM',     EdArama.Text,'', True);
  end;
end;

procedure TErp2000_Kullanicilar.PageControl1PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
    AllowChange := Not ((tkullanici.State In [dsInsert,dsEdit]) And (NewPage = TabSheet1));
end;


Procedure TErp2000_Kullanicilar.ExecSql(Str : String);
begin
    qExecSql.Close;
    qExecSql.Sql.Clear;
    qExecSql.Sql.Add(Str);
    qExecSql.ExecSQL
End;


procedure TErp2000_Kullanicilar.SpTumKaldirClick(Sender: TObject);
Var
   I : Integer;
begin
  case IslemTipi Of
    1: For i:=0 To chSatinalmaci.Items.Count-1 Do chSatinalmaci.Checked[i] := False;
    2: For i:=0 To chMagaza.Items.Count-1 Do chMagaza.Checked[i]           := False;
    3: For i:=0 To chAnaKirim.Items.Count-1 Do chAnaKirim.Checked[i]       := False;
    4: For i:=0 To chMasrafMagazalar.Items.Count-1 Do chMasrafMagazalar.Checked[i] := False;
  end;
end;

procedure TErp2000_Kullanicilar.SpTumSecClick(Sender: TObject);
Var
   I : Integer;
begin
  case IslemTipi Of
    1: For i:=0 To chSatinalmaci.Items.Count-1 Do chSatinalmaci.Checked[i] := True;
    2: For i:=0 To chMagaza.Items.Count-1 Do chMagaza.Checked[i]           := True;
    3: For i:=0 To chAnaKirim.Items.Count-1 Do chAnaKirim.Checked[i]       := True;
    4: For i:=0 To chMasrafMagazalar.Items.Count-1 Do chMasrafMagazalar.Checked[i] := True;
  end;
end;

procedure TErp2000_Kullanicilar.SRollerDataChange(Sender: TObject;
  Field: TField);
begin
    tKullaniciAfterScroll(TKullanici);
end;

procedure TErp2000_Kullanicilar.StoreState(LoginId,Firmalar,Magazalar,State,Roll : String);
var
  MagazaSayisi ,
  KartCari     ,
  BolgeStore   ,
  MagazaCount  : Integer;

  SqlYukle     ,
  MagNo        ,
  Sql          ,
  InsertStore  ,
  DeleteStore  ,
  AnaKirim     ,
  KirimAciklama: String;


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
        qTmp.Sql.Add('SELECT COUNT(*) FROM KART_CARI WHERE ISYERI=''S''');
        qTmp.Open;

        KartCari := qTmp.Fields[0].AsInteger;

        qTmp.Close;
        qTmp.Sql.Clear;
        qTmp.Sql.Add('SELECT COUNT(*) FROM BOLGE_STORE WHERE TIP=1 AND LOGINID='+LoginId + ' AND ROL = ' + #39 + Roll + #39);
        qTmp.Open;

        BolgeStore := qTmp.Fields[0].AsInteger;

        if Magazalar = '' then MagazaCount := KartCari
        else
           begin
              MagNo    := Magazalar;
              while not (MagNo = '') do
                 begin
                   Sql := GetPart(MagNo);
                   if Sql <> '' then inc(MagazaSayisi);
                 end;
              MagazaCount := MagazaSayisi;
           end;

         if (BolgeStore = KartCari) and (KartCari=MagazaCount) then exit
         else
            begin
              if State = 'dsEdit' then
                 begin
                    KirimSec.Close;
                    KirimSec.TableName := FormatDateTime('hhmmnnss',now);
                    KirimSec.CreateTable;
                    KirimSec.Open;

                    qTmp.Close;
                    qTmp.Sql.Clear;
                    qTmp.Sql.Add('SELECT BOS FROM BOLGE_STORE WHERE ROL = ' + #39 + Roll + #39 + ' AND TIP=1 AND LOGINID='+LoginId + ' ORDER BY BOS');
                    qTmp.Open;
                    qTmp.First;

                    while not qTmp.Eof do
                       begin
                          KirimSec.Insert;
                          KirimSec.FieldByName('BOS').AsInteger := qTmp.FieldByName('BOS').AsInteger;
                          KirimSec.FieldByName('EKLE').AsString := 'H';
                          KirimSec.FieldByName('SIL').AsString  := 'H';
                                    Try
                                       KirimSec.Post;
                                    Except

                                    End;

                          qTmp.Next;
                       end;

                    if Magazalar = '' then
                       begin
                          SqlYukle := '';
                          qTmp.Close;
                          qTmp.Sql.Clear;
                          qTmp.Sql.Add('SELECT CARI_ID FROM KART_CARI WHERE ISYERI=''S'' ORDER BY CARI_ID');
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
                         Sql := GetPart(MagNo);
                         if Sql <> '' then
                            begin
                               KirimSec.SetKey;
                               KirimSec.FieldByName('BOS').AsFloat      := StrToFloat(Sql);
                               if KirimSec.GotoKey then
                                  begin
                                    KirimSec.Edit;
                                    KirimSec.FieldByName('SIL').AsString := 'E';
                                    Try
                                       KirimSec.Post;
                                    Except

                                    End;

                                  end
                               else
                                  begin
                                    KirimSec.Insert;
                                    KirimSec.FieldByName('BOS').AsFloat      := StrToFloat(Sql);
                                    KirimSec.FieldByName('SIL').AsString     := 'E';
                                    KirimSec.FieldByName('EKLE').AsString    := 'E';
                                    Try
                                       KirimSec.Post;
                                    Except

                                    End;
                                  end;
                               SqlEkle(Sql,',');
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

                    if DeleteStore <> '' then ExecSql('DELETE FROM BOLGE_STORE WHERE LOGINID='+LoginId + ' AND BOS IN ('+DeleteStore +')');
                    if InsertStore <> '' then
                       begin
                         ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,'''+AnaKirim +''',SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+InsertStore +') AND ISYERI=''S''');
                         ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,'''+AnaKirim +''',SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+InsertStore +') AND ISYERI=''S''');
                       end;
                end;

             if State = 'dsInsert' then
                begin
                   if ( Firmalar = '' ) and ( Magazalar = '' ) And (LoginInfo.Konsolide = False) then
                      begin
                         ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',1,KOD,ACIKLAMA,SYSDATE,' + #39 + Roll + #39 + ' FROM GRUP_DATA where bolum=''I'''); // Fiyat
                         ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE ISYERI=''S''');
                         ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',2,KOD,ACIKLAMA,SYSDATE,' + #39 + Roll + #39 + ' FROM GRUP_DATA where bolum=''I'''); // Rapor
                         ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE ISYERI=''S''');
                      end
                   else
                      begin
                           if ( Firmalar = '' ) and ( Magazalar <> '' ) And (LoginInfo.Konsolide = False) then
                              begin
                                MagNo    := Magazalar;
                                SqlYukle := '';
                                MagazaSayisi := 0;
                                while not (MagNo = '') do
                                   begin
                                     Sql := GetPart(MagNo);
                                     if Sql <> '' then SqlEkle(Sql,',');
                                   end;
                               Delete(SqlYukle, Length(SqlYukle), 1);

                               ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+ SqlYukle +') and ISYERI=''S''');
                               ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',1,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE,' + #39 + Roll + #39 + ')');
                               ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',1,B.KOD,B.ACIKLAMA,SYSDATE,' + #39 + Roll + #39 + ' FROM bolge_store a , grup_data b where A.ROL = ' + #39 + Roll + #39 + ' AND loginid='+LoginId+' and tip=1 and b.BOLUM=''I'' and a.kod=b.kod group by b.kod,b.aciklama');

                               ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+ SqlYukle +') and ISYERI=''S''');
                               ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',2,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE,' + #39 + Roll + #39 + ')');
                               ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',2,B.KOD,B.ACIKLAMA,SYSDATE,' + #39 + Roll + #39 + ' FROM bolge_store a , grup_data b where  A.ROL = ' + #39 + Roll + #39 + ' AND loginid='+LoginId+' and tip=2 and b.BOLUM=''I'' and a.kod=b.kod group by b.kod,b.aciklama');
                              end
                           else
                              begin
                                 if ( Firmalar <> '' ) and ( Magazalar <> '' ) And (LoginInfo.Konsolide = False) then
                                    begin
                                       ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+ Firmalar +') and ISYERI=''S''');
                                       ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',1,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE,' + #39 + Roll + #39 + ')');
                                       ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',1,B.KOD,B.ACIKLAMA,SYSDATE,' + #39 + Roll + #39 + ' FROM bolge_store a , grup_data b where  A.ROL = ' + #39 + Roll + #39 + ' AND loginid='+LoginId+' and tip=1 and b.BOLUM=''I'' and a.kod=b.kod group by b.kod,b.aciklama');

                                       ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE,' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+ Firmalar +') and ISYERI=''S''');
                                       ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',2,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE,' + #39 + Roll + #39 + ')');
                                       ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',2,B.KOD,B.ACIKLAMA,SYSDATE,' + #39 + Roll + #39 + ' FROM bolge_store a , grup_data b where  A.ROL = ' + #39 + Roll + #39 + ' AND loginid='+LoginId+' and tip=2 and b.BOLUM=''I'' and a.kod=b.kod group by b.kod,b.aciklama');
                                    end;
                              end;
                      end;
                end;
            end;

         {
             if State = 'dsInsert' then
                begin
                   if ( Firmalar = '' ) and ( Magazalar = '' ) then
                      begin
                         ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',1,KOD,ACIKLAMA,SYSDATE, ' + #39 + Roll + #39 + ' FROM GRUP_DATA where bolum=''I'''); // Fiyat
                         ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE, ' + #39 + Roll + #39 + ' FROM KART_CARI WHERE ISYERI=''S''');
                         ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',2,KOD,ACIKLAMA,SYSDATE, ' + #39 + Roll + #39 + ' FROM GRUP_DATA where bolum=''I'''); // Rapor
                         ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE, ' + #39 + Roll + #39 + ' FROM KART_CARI WHERE ISYERI=''S''');
                      end
                   else
                      begin
                           if ( Firmalar = '' ) and ( Magazalar <> '' ) then
                              begin
                                MagNo    := Magazalar;
                                SqlYukle := '';
                                MagazaSayisi := 0;
                                while not (MagNo = '') do
                                   begin
                                     Sql := GetPart(MagNo);
                                     if Sql <> '' then SqlEkle(Sql,',');
                                   end;
                               Delete(SqlYukle, Length(SqlYukle), 1);

                               ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE, ' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+ SqlYukle +') and ISYERI=''S''');
                               ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',1,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE, ' + #39 + Roll + #39 + ' )');
                               ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',1,B.KOD,B.ACIKLAMA,SYSDATE, ' + #39 + Roll + #39 + ' FROM bolge_store a , grup_data b where loginid='+LoginId+' and tip=1 and b.BOLUM=''I'' and a.kod=b.kod AND A.ROL = ' + #39 + Roll + #39 + ' group by b.kod,b.aciklama');

                               ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE, ' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+ SqlYukle +') and ISYERI=''S''');
                               ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',2,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE, ' + #39 + Roll + #39 + ' )');
                               ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',2,B.KOD,B.ACIKLAMA,SYSDATE, ' + #39 + Roll + #39 + ' FROM bolge_store a , grup_data b where loginid='+LoginId+' and tip=2 and b.BOLUM=''I'' and a.kod=b.kod AND A.ROL = ' + #39 + Roll + #39 + ' group by b.kod,b.aciklama');
                              end
                           else
                              begin
                                 if ( Firmalar <> '' ) and ( Magazalar <> '' ) then
                                    begin
                                       ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,1,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE, ' + #39 + Roll + #39 + ' FROM KART_CARI WHERE CARI_ID IN ('+ Firmalar +') and ISYERI=''S''');
                                       ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',1,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE, ' + #39 + Roll + #39 + ' )');
                                       ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',1,B.KOD,B.ACIKLAMA,SYSDATE, ' + #39 + Roll + #39 + '  FROM bolge_store a , grup_data b where loginid='+LoginId+' and tip=1 and b.BOLUM=''I'' and a.kod=b.kod  AND A.ROL = ' + #39 + Roll + #39 + ' group by b.kod,b.aciklama');

                                       ExecSql('INSERT INTO BOLGE_STORE SELECT ' +LoginId +',CARI_ID,2,SUBSTR(CARI_KOD,1,INSTR(SUBSTR(CARI_KOD,1,15),''.00'')-1),SYSDATE, ' + #39 + Roll + #39 + '  FROM KART_CARI WHERE CARI_ID IN ('+ Firmalar +') and ISYERI=''S''');
                                       ExecSql('INSERT INTO BOLGE_TANIMI VALUES ('+LoginId +',2,'''+AnaKirim + ''','''+KirimAciklama + ''',SYSDATE, ' + #39 + Roll + #39 + ' )');
                                       ExecSql('INSERT INTO BOLGE_TANIMI SELECT '+LoginId +',2,B.KOD,B.ACIKLAMA,SYSDATE, ' + #39 + Roll + #39 + '  FROM bolge_store a , grup_data b where loginid='+LoginId+' and tip=2 and b.BOLUM=''I'' and a.kod=b.kod  AND A.ROL = ' + #39 + Roll + #39 + ' group by b.kod,b.aciklama');
                                    end;
                              end;
                      end;
                end;
              }  
           // end;
     end;
end;


procedure TErp2000_Kullanicilar.PageControl1Change(Sender: TObject);
begin
    If PageControl1.ActivePage = TabSheet1 Then
    Begin
        Panel2.Visible := False;
        QRoller.Close;
        QRoller.Close;
    End Else RolAc;
    tKullaniciAfterScroll(tKullanici);    
end;

procedure TErp2000_Kullanicilar.cxGrid1DBTableView1CustomDrawCell(
  Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
  AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
begin
    If AViewInfo.GridRecord.DisplayTexts[Col_Aktif.Index] = 'H' Then
       If AViewInfo.Selected Then ACanvas.Font.Color := ClWhite
                             Else ACanvas.Font.Color := ClRed;
end;

procedure TErp2000_Kullanicilar.cxGrid3FocusedViewChanged(Sender: TcxCustomGrid;
  APrevFocusedView, AFocusedView: TcxCustomGridView);
begin
    CxNav.DataSource := (AFocusedView As TcxGridDbTableView).DataController.DataSource;
end;

procedure TErp2000_Kullanicilar.YeniEkleExecute(Sender: TObject);
begin
    PageControl1.ActivePage := TabSheet2;
    tKullanici.Insert;
    DataState := 'dsInsert';
end;

procedure TErp2000_Kullanicilar.YeniDegistirExecute(Sender: TObject);
var
i : Integer;
begin
  DataState := 'dsEdit';
  tKullanici.Edit;
  If PageControl1.ActivePage = TabSheet1 Then PageControl1.ActivePage := TabSheet2;

  For i:=0 to chSatinalmaci.Items.Count-1 Do chSatinalmaci.Checked[i]:= POS(''+chSatinalmaci.Items.Strings[i]+'',QRoller.FieldByName('SATINALMACILAR').AsString)>0;
  For i:=0 to chMagaza.Items.Count-1      Do chMagaza.Checked[i]     := POS(';'+SubeList.Strings[i]+';',QRoller.FieldByName('SUBELER').AsString)>0;
  For i:=0 to chAnaKirim.Items.Count-1    Do chAnaKirim.Checked[i]   := POS(';'+chAnaKirim.Items.Strings[i]+';',QRoller.FieldByName('ANA_KIRIM').AsString)>0;
  For i:=0 to chMasrafMagazalar.Items.Count-1      Do chMasrafMagazalar.Checked[i]     := POS(';'+SubeList.Strings[i]+';',QRoller.FieldByName('MASRAF_SUBELER').AsString)>0;
  tKullaniciAfterScroll(nil);

end;

procedure TErp2000_Kullanicilar.YeniSilExecute(Sender: TObject);
Procedure AltKayitKontrol(Tablo,Saha,Deger,Mesaj : String);
  Begin
   If (Tablo <> '') And (Saha <> '') And (Deger <> '') And (Mesaj <> '') Then
   Begin
       SQLList(DmGlobal.QTmp,'SELECT ' + SAHA + ' FROM ' + Tablo + ' WHERE ' + SAHA + ' = ' + #39 + Deger + #39);
       If DmGlobal.QTmp.Fields[0].AsString <> '' Then
       Begin                                                    
           Application.MessageBox(PChar(Mesaj),'DÝKKAT !',mb_OK);
           Abort;
       End;
   End;
  End;

begin
    If LoginInfo.Konsolide = False Then
    Begin
        AltKayitKontrol('FIS_IRSALIYE','SDY',tkullaniciKOD.AsString,'Bu taným Stok hareketlerinde kullanýlmýþ...Silemezsiniz...');
        AltKayitKontrol('FIS_FATURA','SDY',tkullaniciKOD.AsString,'Bu taným faturalarda kullanýlmýþ...Silemezsiniz...');
        AltKayitKontrol('KART_STOK','SDY',tkullaniciKOD.AsString,'Bu taným Stok Kartlarýnda kullanýlmýþ...Silemezsiniz...');
        AltKayitKontrol('KART_CARI','SDY',tkullaniciKOD.AsString,'Bu taným Cari Kartlarda kullanýlmýþ...Silemezsiniz...');
        AltKayitKontrol('KART_BANKA','SDY',tkullaniciKOD.AsString,'Bu taným Banka Kartlarýnda kullanýlmýþ...Silemezsiniz...');
        AltKayitKontrol('FIS_BANKA','SDY',tkullaniciKOD.AsString,'Bu taným Banka hareketlerinde kullanýlmýþ...Silemezsiniz...');
        AltKayitKontrol('KULLANICI_ROL','KOD',tkullaniciKOD.AsString,'Bu taným altýnda tanýmlý roller mevcut...Silemezsiniz...');
   End;

  if Application.MessageBox('Silmek istediðinizden emin misiniz??','DÝKKAT !',mb_YesNo+mb_DefButton2)= idNo then Exit;
  DataState := 'dsDelete';
  tKullanici.Delete;
end;

procedure TErp2000_Kullanicilar.YeniKaydetExecute(Sender: TObject);
 Procedure SQLEkle(var SQLStr: String; EkSql:String);
 begin
   if SQLStr = '' then SQLStr := ';' +EkSql + ';'
   else SQLStr := SQLStr + EkSql +';';
 end;
var
 SqlIfade: String;
 i:Integer;
begin
  if MessageDlg('Yaptýðýnýz deðiþiklikleri kayýt etmek istediðinizden emin misiniz?', mtInformation, [mbYes, mbNo], 0) = mrYes Then
  Begin
{
    if ( tkullaniciSATINALMACILAR.AsString <> '' ) and (tkullaniciANA_KIRIM.AsString='') Then
        begin
          Application.MessageBox('Satýnalmacýya baðlý olan Ana Kýrým seçeneði yapýlmamýþtýr.','BÝLGÝ',mb_Ok);
          Exit;
        end;

    if Length(tKullaniciSIFRE.AsString) < 4 then
       begin
         Application.MessageBox('Þifre en az 4 karakter olmalýdýr.','Bilgi',mb_ok);
         exit;
       end;


    SqlIfade := '';
    For i:=0 To chSatinalmaci.Items.Count-1 Do if chSatinalmaci.Checked[i] Then SQLEkle(SqlIfade,chSatinalmaci.Items.Strings[i]);
    QRollerSATINALMACILAR.AsString :=SqlIfade;
    SqlIfade := '';
    For i:=0 To chMagaza.Items.Count-1 Do if chMagaza.Checked[i] Then SQLEkle(SqlIfade,SubeList.Strings[i]);
    QRollerSUBELER.AsString :=SqlIfade;
    SqlIfade := '';
    For i:=0 To chAnaKirim.Items.Count-1 Do if chAnaKirim.Checked[i] Then SQLEkle(SqlIfade,chAnaKirim.Items.Strings[i]);
    QRollerANA_KIRIM.AsString :=SqlIfade;
    SqlIfade := '';
    For i:=0 To chMasrafMagazalar.Items.Count-1 Do if chMasrafMagazalar.Checked[i] Then SQLEkle(SqlIfade,SubeList.Strings[i]);
    QRollerMASRAF_SUBELER.AsString :=SqlIfade;
}
    tKullanici.Post;
  End;
  
end;

procedure TErp2000_Kullanicilar.YeniVazgecExecute(Sender: TObject);
begin
   DataState := '';
   If QRoller.State In [DsEdit,DsInsert]       Then QRoller.Cancel;
   If QAnaBolge.State in [DsInsert,DsEdit]     Then QAnaBolge.Cancel;
   If QAltBolge.State in [DsInsert,DsEdit]     Then QAltBolge.Cancel;
   If QBolge.State in [DsInsert,DsEdit]        Then QBolge.Cancel;
   If QSehir.State in [DsInsert,DsEdit]        Then QSehir.Cancel;
   If QIlce.State in [DsInsert,DsEdit]         Then QIlce.Cancel;
   If QTabela.State in [DsInsert,DsEdit]       Then QTabela.Cancel;
   If QSatinalmacii.State in [DsInsert,DsEdit] Then QSatinalmacii.Cancel;
   If QTedarikci.State in [DsInsert,DsEdit]    Then QTedarikci.Cancel;
   tKullanici.Cancel;
   //PageControl1.ActivePage := TabSheet1;
end;

procedure TErp2000_Kullanicilar.YeniGeriExecute(Sender: TObject);
begin
  tKullanici.Prior;
  RolAc;
end;

procedure TErp2000_Kullanicilar.YeniIleriExecute(Sender: TObject);
begin
    tKullanici.Next;
    RolAc;
end;

procedure TErp2000_Kullanicilar.YeniKapatExecute(Sender: TObject);
begin
  Erp2000_Kullanicilar.Close;
end;

procedure TErp2000_Kullanicilar.RolEkleExecute(Sender: TObject);
begin
    CxNav.ClickButton(6);
end;

procedure TErp2000_Kullanicilar.RolDegistirExecute(Sender: TObject);
begin
    CxNav.ClickButton(9);
end;

procedure TErp2000_Kullanicilar.RolSilExecute(Sender: TObject);
begin
    CxNav.ClickButton(8);
end;

procedure TErp2000_Kullanicilar.RolKaydetExecute(Sender: TObject);
begin
    CxNav.ClickButton(10);
end;

procedure TErp2000_Kullanicilar.RolVazgecExecute(Sender: TObject);
begin
    CxNav.ClickButton(11);
end;

procedure TErp2000_Kullanicilar.DbEdit4DblClick(Sender: TObject);
begin
  if tkullaniciKOD.AsString = '2' then cxLabel16.Caption := ''
    else If (((Pos('SÝSTEM YÖNETÝCÝSÝ',LoginInfo.Roller) > 0) Or (LoginInfo.Roller = 'SÝSTEM YÖNETÝCÝSÝ') Or (LoginInfo.Roller = 'SÝSTEM YÖNETÝCÝSÝ YARDIMCISI')) And
    (Pos(';'+tkullaniciKOD.AsString+';',';6269;24504;4;1;8323;7;70846;70845;9;2;8;80024;10;1574;1724;111;105;844;1063;1604;441;160;1260;') < 1)) Or
             (Pos(';'+LoginInfo.Kod+';',';6269;24504;4;1;8323;7;70846;70845;9;2;8;80024;10;1574;1724;111;105;844;1063;1604;441;160;1260;') > 0) Then
              If Caption = 'Kullanýcý Tanýmlarý' Then cxLabel16.Caption := SQLResult('SELECT crypto (''E'', NVL(' + #39 + tKullaniciSIFRE.AsString + #39 + ',''X''), 5) B FROM DUAL');
end;


procedure TErp2000_Kullanicilar.DbEdit4KeyPress(Sender: TObject; var Key: Char);
begin
    If (tkullaniciELTERMINALI_KULLANIR.Text = 'E') And (Pos('IMAS',LoginInfo.OracleKullanici) > 0) then
    Begin
        If Not(Key In ['1','2','3','4','5','6','7','8','9','0',#13,#8,#46 ]) then
        Begin
            Application.MessageBox('Kiosk ve el terminali þifre tanýmlarken sadece rakam ile þifre verilebilir. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
            Abort;
        End;
    End;
end;

procedure TErp2000_Kullanicilar.cxPageControl1PageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
    AllowChange := Not((QRoller.State In [DsEdit,DsInsert]) And (QRoller.State In [DsEdit,DsInsert]));// And (NewPage = CxTabSheet4);
    if CxPageControl1.ActivePage = TabSheet1 then
    Begin
        if TKullanici.State In [dsEdit,DsInsert] then
        Begin
            Application.MessageBox('Kaydý tamamladýktan sonra diðer sayfaya geçebilirsiniz. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
            AllowChange := False;
        End;
    End;

end;

procedure TErp2000_Kullanicilar.cxPageControl2Change(Sender: TObject);
begin
    cxPageControl1Change(nil);
end;

procedure TErp2000_Kullanicilar.cxPageControl2PageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
    if NewPage = cxTabSheet5 then {Alt Bölge}
          AllowChange := CxVAnaBolge.Controller.SelectedRecordCount > 0
       Else
    if NewPage = cxTabSheet6 then {Þehir}
          AllowChange := CxVBolge.Controller.SelectedRecordCount > 0
       Else
    if NewPage = cxTabSheet7 then {Ýlçe}
          AllowChange := (CxVBolge.Controller.SelectedRecordCount > 0) And (CxVSehir.Controller.SelectedRecordCount > 0);

    If AllowChange  then AllowChange := Not(TKullanici.State In [dsEdit,DsInsert]);
    if TKullanici.State In [dsEdit,DsInsert] then
    Begin
        Application.MessageBox('Kaydý tamamladýktan sonra diðer sayfaya geçebilirsiniz. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
        Abort;
    End;
end;

procedure TErp2000_Kullanicilar.CxYAnaBolgePropertiesChange(Sender: TObject);
begin
    If CxYAnaBolge.Checked then
    Begin
        CxYAltBolge.Checked    := True;
        CxYAltBolge.Enabled    := False;
    End Else CxYAltBolge.Enabled := True;
end;

procedure TErp2000_Kullanicilar.CxYBolgePropertiesChange(Sender: TObject);
begin
    If CxYBolge.Checked then
    Begin
        CxYSehir.Checked       := True;
        CxYIlce.Checked        := True;
        CxYSehir.Enabled       := False;
        CxYIlce.Enabled        := False;
    End
       Else
    Begin
        CxYSehir.Enabled       := True;
        CxYIlce.Enabled        := True;
    End;
end;

procedure TErp2000_Kullanicilar.CxYetkiSilClick(Sender: TObject);
begin
    CxPageControl2.ActivePage := CxTabSheet2;
    CxPageControl3.ActivePage := CxTabSheet12;
    CxTabSheet12.TabVisible   := True;
    CxTabSheet13.TabVisible   := False;
    Panel6.Visible := True;
end;

procedure TErp2000_Kullanicilar.CxYetkiTakasClick(Sender: TObject);
begin
    QBaz.Open;
    QDegisen.Open;
    CxPageControl2.ActivePage := CxTabSheet2;
    CxPageControl3.ActivePage := CxTabSheet13;
    CxTabSheet12.TabVisible   := False;
    CxTabSheet13.TabVisible   := True;
    Panel6.Visible := True;
end;

procedure TErp2000_Kullanicilar.CxYSehirPropertiesChange(Sender: TObject);
begin
    If CxYSehir.Checked then
    Begin
        CxYIlce.Checked        := True;
        CxYIlce.Enabled        := False;
    End Else CxYIlce.Enabled   := True;
end;

procedure TErp2000_Kullanicilar.CxYTumPropertiesChange(Sender: TObject);
begin
    If CxYTum.Checked then
    Begin
        CxYAnaBolge.Checked    := False;
        CxYAltBolge.Checked    := False;
        CxYBolge.Checked       := False;
        CxYSehir.Checked       := False;
        CxYIlce.Checked        := False;
        CxYTabela.Checked      := False;
        CxYSatinalmaci.Checked := False;
        CxLAnaBolge.ClearSelection;
        CxLBolge.ClearSelection;
        CxLSehir.ClearSelection;

        CxYAnaBolge.Enabled    := False;
        CxYAltBolge.Enabled    := False;
        CxYBolge.Enabled       := False;
        CxYSehir.Enabled       := False;
        CxYIlce.Enabled        := False;
        CxYTabela.Enabled      := False;
        CxYSatinalmaci.Enabled := False;
    End
       Else
    Begin
        CxYAnaBolge.Enabled    := True;
        CxYAltBolge.Enabled    := True;
        CxYBolge.Enabled       := True;
        CxYSehir.Enabled       := True;
        CxYIlce.Enabled        := True;
        CxYTabela.Enabled      := True;
        CxYSatinalmaci.Enabled := True;
    End;
end;

procedure TErp2000_Kullanicilar.dKullaniciDataChange(Sender: TObject;
  Field: TField);
begin
//   CxTabSheet1.TabVisible := (Pos('BELIT', LoginInfo.OracleKullanici) > 0) And (tkullaniciBI_KULLANICI.Text = 'E');
end;

procedure TErp2000_Kullanicilar.dKullaniciStateChange(Sender: TObject);
begin
    tkullanici.AfterScroll(nil);
end;

procedure TErp2000_Kullanicilar.cxPageControl1Change(Sender: TObject);
begin
    If CxPageControl1.ActivePage = CxTabSheet3 Then
    Begin
        Panel2.Visible  := False;
        PmAktar.Visible := False;
        PmmKapat.Visible := False;
        SpTumSec.Visible     := False;
        SpTumKaldir.Visible  := False;

    End;

    If CxPageControl1.ActivePageIndex In [0,1] then
    Begin
        If QAnaBolge.Active    Then QAnaBolge.Close;
        If QAltBolge.Active    Then QAltBolge.Close;
        If QBolge.Active       Then QBolge.Close;
        If QSehir.Active       Then QSehir.Close;
        If QIlce.Active        Then QIlce.Close;
        If QTabela.Active      Then QTabela.Close;
        If QSatinalmaci.Active Then QSatinalmaci.Close;
        If QTedarikci.Active   Then QTedarikci.Close;
        CxNav.DataSource := SRoller;
    End
      Else
    Begin
        If cxPageControl2.ActivePageIndex = 0 Then
        Begin
            if Not(QAnaBolge.Active) then QAnaBolge.Open;
            CxNav.DataSource := SAnaBolge;
            CxVAnaBolgeID_ANA_BOLGE.FocusWithSelection;
        End
           Else
        If cxPageControl2.ActivePageIndex = 1 Then
        Begin
            if Not(LAltBolge.Active) then LAltBolge.Open;
            if Not(QAltBolge.Active) then QAltBolge.Open;
            CxNav.DataSource := SAltBolge;
        End
           Else
        If cxPageControl2.ActivePageIndex = 2 Then
        Begin
            if Not(QBolge.Active) then QBolge.Open;
            CxNav.DataSource := SBolge;
        End
           Else
        If cxPageControl2.ActivePageIndex = 3 Then
        Begin
            if Not(LSehir.Active) then LSehir.Open;
            if Not(QSehir.Active) then QSehir.Open;
            CxNav.DataSource := SSehir;
        End
           Else
        If cxPageControl2.ActivePageIndex = 4 Then
        Begin
            if Not(LIlce.Active) then LIlce.Open;
            if Not(QIlce.Active) then QIlce.Open;
            CxNav.DataSource := SIlce;
        End
           Else
        If cxPageControl2.ActivePageIndex = 5 Then
        Begin
            if Not(QTabela.Active) then QTabela.Open;
            CxNav.DataSource := STabela;
        End
           Else
        If cxPageControl2.ActivePageIndex = 6 Then
        Begin
            if Not(QSatinalmacii.Active) then QSatinalmacii.Open;
            CxNav.DataSource := SSatinalmacii;
        End
           Else
        If cxPageControl2.ActivePageIndex = 7 Then
        Begin
            if Not(QTedarikci.Active) then QTedarikci.Open;
            CxNav.DataSource := STedarikci;
        End;
    End;
    tKullaniciAfterScroll(tKullanici);    
end;

procedure TErp2000_Kullanicilar.QRollerBeforeOpen(DataSet: TDataSet);
begin
    QRoller.ParamByName('TUR').AsString := LoginInfo.RolTur;
    QRoller.ParamByName('KOD').AsString := tkullaniciKOD.AsString;
end;

procedure TErp2000_Kullanicilar.QRollerAfterInsert(DataSet: TDataSet);
begin
    If (cxDBLookupComboBox3.Text <> '') And (Not(LoginInfo.Konsolide)) Then
    Begin
        DataSet.FieldByName('FIRMA').AsString          := dmGlobal.QPersonel.FieldByName('MAGAZA_NO').AsString;
        DataSet.FieldByName('SUBELER').AsString        := ';'+dmGlobal.QPersonel.FieldByName('MAGAZA_NO').AsString+';';
        DataSet.FieldByName('MASRAF_SUBELER').AsString := ';'+dmGlobal.QPersonel.FieldByName('MAGAZA_NO').AsString+';';
    End;    

    DataSet.FieldByName('SATINALMACILAR').AsString := '';
    DataSet.FieldByName('ANA_KIRIM').AsString      := '';
    DataSet.FieldByName('KOD').AsString := tkullaniciKOD.AsString;
    DataSet.FieldByName('TUR').AsString := LoginInfo.RolTur;

    cxPageControl1.OnPageChanging := Nil;
    cxPageControl1.ActivePage := CxTabSheet4;
    cxDBLookupComboBox6.SelStart               := 0;
    cxDBLookupComboBox6.SelLength              := Length(cxDBLookupComboBox6.Text);
    cxDBLookupComboBox6.SetFocus;
    cxPageControl1.OnPageChanging := cxPageControl1PageChanging;
    QRollerAfterScroll(Qroller);
end;

procedure TErp2000_Kullanicilar.QAnaBolgeAfterInsert(DataSet: TDataSet);
begin
    DataSet.FieldByName('ID_KULLANICI_KOD').AsString := tkullaniciKOD.AsString;
    If (DataSet = QAnaBolge) Or (DataSet = QAltBolge) Or (DataSet = QBolge) Or
       (DataSet = QSehir) Or (DataSet = QIlce) Then DataSet.FieldByName('ID_ULKE').AsString := '1';
end;

procedure TErp2000_Kullanicilar.QAnaBolgeBeforeDelete(DataSet: TDataSet);
begin
    If DataSet = QAnaBolge Then  AltKayitKontrol('CR_KULLANICI_ALT_BOLGE',' AND ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_ANA_BOLGE = ' + #39 + QAnaBolge.FieldByName('ID_ANA_BOLGE').AsString + #39,'Bu taným Alt Bölge bilgilerinde kullanýlýyor... Ýþlem yapamazsýnýz...');
    If DataSet = QBolge Then
    Begin
        AltKayitKontrol('CR_KULLANICI_SEHIR',' AND ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_BOLGE = ' + #39 + QBolge.FieldByName('ID_BOLGE').AsString + #39,'Bu taným Þehir bilgilerinde kullanýlýyor... Ýþlem yapamazsýnýz...');
        AltKayitKontrol('CR_KULLANICI_ILCE',' AND ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_BOLGE = ' + #39 + QBolge.FieldByName('ID_BOLGE').AsString + #39,'Bu taným Ýlçe bilgilerinde kullanýlýyor... Ýþlem yapamazsýnýz...');
    End;
    If DataSet = QSehir Then  AltKayitKontrol('CR_KULLANICI_ILCE',' AND ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_SEHIR = ' + #39 + QSehir.FieldByName('ID_SEHIR').AsString + #39,'Bu taným Ýlçe bilgilerinde kullanýlýyor... Ýþlem yapamazsýnýz...');
    If Application.MessageBox('Bu taným kullanýcýdan silinecektir. Onaylýyormusunuz ?','Dikkat !',Mb_YesNo) = idNo Then Abort;
end;

procedure TErp2000_Kullanicilar.QAnaBolgeBeforePost(DataSet: TDataSet);
begin
    If DataSet = QAnaBolge then
    Begin
        QAnaBolgeID_ULKE.Value     := 0;
        If MukerrerKontrol('CR_KULLANICI_ANA_BOLGE','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_ANA_BOLGE = ' + QAnaBolgeID_ANA_BOLGE.Text) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;
    End;
    If DataSet = QAltBolge then
    Begin
        QAltBolgeID_ANA_BOLGE.Text := QAnaBolgeID_ANA_BOLGE.Text;
        If MukerrerKontrol('CR_KULLANICI_ALT_BOLGE','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_ANA_BOLGE = ' + QAnaBolgeID_ANA_BOLGE.Text + ' AND ID_ALT_BOLGE = ' + QAltBolgeID_ALT_BOLGE.Text) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;

    End;

    If DataSet = QBolge then
    Begin
        If MukerrerKontrol('CR_KULLANICI_BOLGE','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_BOLGE = ' + QBolgeID_BOLGE.Text) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;
    End;

    If DataSet = QSehir    then
    Begin
        QSehirID_BOLGE.Text        := QBolgeID_BOLGE.Text;
        If MukerrerKontrol('CR_KULLANICI_SEHIR','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_BOLGE = ' + QBolgeID_BOLGE.Text + ' AND ID_SEHIR = ' + QSehirID_SEHIR.Text) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;
    End;

    If DataSet = QIlce     then
    Begin
        QIlceID_SEHIR.Text := QSehirID_SEHIR.Text;
        QIlceID_BOLGE.Text := QSehirID_BOLGE.Text;
        If MukerrerKontrol('CR_KULLANICI_ILCE','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_SEHIR = ' + QSehirID_SEHIR.Text + ' AND ID_ILCE = ' + QIlceID_ILCE.Text) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;
    End;

    If DataSet = QTabela then
    Begin
        If MukerrerKontrol('CR_KULLANICI_BIRIM_TABELA','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_BIRIM_TABELA = ' + QTabelaID_BIRIM_TABELA.Text) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;
    End;

    If DataSet = QSatinalmaci then
    Begin
        If MukerrerKontrol('CR_KULLANICI_SATINALMACI','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND ID_SATINALMACI = ' + QSatinalmaciiID_SATINALMACI.Text) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;
    End;

    If DataSet = QTedarikci then
    Begin
        If MukerrerKontrol('CR_KULLANICI_TEDARIKCI','ID_KULLANICI_KOD = ' + DataSet.FieldByName('ID_KULLANICI_KOD').AsString + ' AND DS_TEDARIKCI = ' + #39 + QTedarikciDS_TEDARIKCI.Text + #39) Then
        Begin
            Application.MessageBox('Ayný bilgileri ikinci defa giriyorsunuz ve deðiþiklik yapmadan kaydetmeye çalýþýyorsunuz. Kontrol ediniz...','DÝKKAT',MB_OK);
            Abort;
        End;
    End;

    DataSet.FieldByName('SDY').AsString   := LoginInfo.Kod;
    DataSet.FieldByName('SDT').AsString   := DateToStr(Date);
    DataSet.FieldByName('U_SDY').AsString := LoginInfo.Kod;
    DataSet.FieldByName('U_SDT').AsString := DateToStr(Date);
end;

procedure TErp2000_Kullanicilar.QRollerAfterEdit(DataSet: TDataSet);
begin
    DataSet.FieldByName('KOD').AsString := tkullaniciKOD.AsString;
    DataSet.FieldByName('TUR').AsString := LoginInfo.RolTur;
    if (PageControl1.ActivePage = TabSheet2) And (PageControl1.ActivePage <> TabSheet1) then
    Begin
        cxPageControl1.OnPageChanging := Nil;
        cxPageControl1.ActivePage     := CxTabSheet4;
        cxPageControl1.OnPageChanging := cxPageControl1PageChanging
    End;
    QRollerAfterScroll(Qroller);
end;

procedure TErp2000_Kullanicilar.QRollerBeforePost(DataSet: TDataSet);
    Function SubStrSayi(AnaStr,SubStr : String) : Integer;
    Var
       I : Integer;
    Begin
        Result := 0;
        If AnaStr = '' Then Result := 0
          Else
        Begin
            Result := 0;
            For I  := 1 To Length(AnaStr) Do If AnaStr[I] = SubStr Then Result := Result + 1;
        End;
    End;
begin
    If SubStrSayi(QRollerSATINALMACILAR.AsString,';') > 2 Then QRollerSATINALMACI.AsString := '';
    If SubStrSayi(QRollerSUBELER.AsString,';') > 2 Then QRollerFIRMA.AsString := '';

    If QRoller.FieldByName('ROL').AsString = '' Then
    Begin
        Application.MessageBox('[RolAdi] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
        cxDBLookupComboBox6.SelStart               := 0;
        cxDBLookupComboBox6.SelLength              := Length(cxDBLookupComboBox6.Text);
        cxDBLookupComboBox6.SetFocus;
        Abort;
    End;

{
    If QRoller.FieldByName('FIRMA').AsString = '' Then
    Begin
        Application.MessageBox('[Baðlý Olduðu Þube] bilgisi eksik. Ýþlem iptal edildi...','DÝKKAT !',mb_OK);
        cxDBLookupComboBox1.SelStart               := 0;
        cxDBLookupComboBox1.SelLength              := Length(cxDBLookupComboBox1.Text);
        cxDBLookupComboBox1.SetFocus;
        Abort;
    End;
}
    DataSet.FieldByName('SDY').AsString := LoginInfo.Kod;
    DataSet.FieldByName('SDT').AsString := DateToStr(Date);
end;

procedure TErp2000_Kullanicilar.cxButton1Click(Sender: TObject);
var
   S:String;
   I : Integer;
   BOFID : String;
   KullaniciNo : Integer;

begin
    If MessageDlg('Kullanýcý kopyalama iþlemi yapýlacaktýr, onaylýyormusunuz ?', mtError, [mbYes, mbNo], 0) = mrNo Then Exit;
    SQLList(DMGlobal.QTmp1,'SELECT *FROM KULLANICI_ROL WHERE ROWNUM = 1 AND KOD = ' + #39 + TKullaniciKod.Text + #39);

    For I := 0 to VTSec.Count - 1 do
    Begin
        if VTSec.Items[I].Checked then
        Begin
           Try
            // Önce Rol varmý yokmu bakýlacak.
            SQLList(DMGlobal.QTmp2,'SELECT KOD FROM ' + VTSec.Items[I].Text + '.ROLLER WHERE KOD = ' + #39 + DmGlobal.QTmp1.FieldByName('ROL').AsString + #39);
            If DMGlobal.QTmp2.FieldByName('KOD').AsString = '' Then
                SqlRecord('INSERT INTO ' + VTSec.Items[I].Text + '.ROLLER SELECT *FROM ROLLER WHERE KOD = ' + #39 + DmGlobal.QTmp1.FieldByName('ROL').AsString + #39);

            // Kullanýcý varmý yokmu bakýlacak.
            SQLList(DMGlobal.QTmp4,'SELECT * FROM ' + VTSec.Items[I].Text + '.KULLANICI WHERE LOGINNAME = ' + #39 + TKullaniciLOGINNAME.Text + '_Kopya' + #39);
            If DMGlobal.QTmp4.FieldByName('LOGINNAME').AsString = '' Then
            Begin
                SQLList(DMGlobal.QTmp5,'SELECT KULLANICI_TANIMI_SQ.NEXTVAL FROM DUAL');
                KullaniciNo := dmGlobal.qTmp5.FieldByName('NEXTVAL').AsInteger;
                SqlRecord('INSERT INTO ' + VTSec.Items[I].Text + '.KULLANICI SELECT ' + IntToStr(KullaniciNo) + ',ISIM,SIFRE,GOREVI,UNVANI,SDY,SDT,LOGINNAME||'+#39+'_Kopya' +#39+' ,AKTIF,INTERNALID,' +
                                 ' ELTERMINALI_KULLANIR,PERSONEL_ID,BI_KULLANICI,BI_SIFRE,BI_SIFRE_DEGISTI,BI_KULLANICI_SIL FROM KULLANICI WHERE KOD = ' + #39 + TKullaniciKOD.Text + #39);
                SqlRecord('INSERT INTO ' + VTSec.Items[I].Text + '.KULLANICI_ROL SELECT ' + IntToStr(KullaniciNo) + ' ,ROL,TUR,FIRMA,SATINALMACI,SATINALMACILAR,SUBELER,MASRAF_SUBELER,CARILER,ANA_KIRIM,SDY,SDT FROM KULLANICI_ROL WHERE KOD = ' + TKullaniciKOD.Text + ' AND ROL = ' + #39 + DmGlobal.QTmp1.FieldByName('ROL').AsString + #39);
            End Else Application.MessageBox(PChar('Ayný Kullanýcý adý ' + VTSec.Items[I].Text + ' yýlýnda kopyalanmýþ mevcuttur !'), 'HATA', mb_OK);
           Except
           End;
        End;
    End;
    Application.MessageBox(PChar('Kullanýcý kopyalama iþlemi ' + TKullaniciLOGINNAME.Text + '_Kopya olarak tamamlanmýþtýr.  !'), 'HATA', mb_OK);
end;

procedure TErp2000_Kullanicilar.cxButton2Click(Sender: TObject);
Var
  KriterAnaBolge,KriterBolge,KriterSehir : String;
begin
    If Application.MessageBox('Ýlgili kriterlere göre bu kullanýcý bazýnda toplu silme iþlemi yapýlacaktýr. Emin misiniz??','DÝKKAT !',mb_YesNo+mb_DefButton2) = idNo Then Abort;
    If CxYTum.Checked Then
    Begin
        If ExeccSQL('DELETE FROM CR_KULLANICI_ALT_BOLGE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text)
           Then ExeccSQL('DELETE FROM CR_KULLANICI_ANA_BOLGE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
        If ExeccSQL('DELETE FROM CR_KULLANICI_ILCE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text)
           Then If ExeccSQL('DELETE FROM CR_KULLANICI_SEHIR WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text)
                 Then ExeccSQL('DELETE FROM CR_KULLANICI_BOLGE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
        ExeccSQL('DELETE FROM CR_KULLANICI_BIRIM_TABELA WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
        ExeccSQL('DELETE FROM CR_KULLANICI_SATINALMACI WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
        ExeccSQL('DELETE FROM CR_KULLANICI_TEDARIKCI WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
    End
       Else
    Begin
        If CxLAnaBolge.Text <> '' Then KriterAnaBolge := ' AND ID_ANA_BOLGE = ' + VarToStr(CxLAnaBolge.EditValue)
                                  Else KriterAnaBolge := '';
        If CxLBolge.Text <> ''    Then KriterBolge    := ' AND ID_BOLGE = ' + VarToStr(CxLBolge.EditValue)
                                  Else KriterBolge    := '';
        If CxLSehir.Text <> ''    Then KriterSehir    := ' AND ID_SEHIR = ' + VarToStr(CxLSehir.EditValue)
                                  Else KriterSehir    := '';
        If CxYAnaBolge.Checked then
        Begin
            If ExeccSQL('DELETE FROM CR_KULLANICI_ALT_BOLGE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterAnaBolge)
               Then ExeccSQL('DELETE FROM CR_KULLANICI_ANA_BOLGE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterAnaBolge);
        End Else If CxYAltBolge.Checked then ExeccSQL('DELETE FROM CR_KULLANICI_ALT_BOLGE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterAnaBolge);

        if CxYBolge.Checked then
        Begin
            If ExeccSQL('DELETE FROM CR_KULLANICI_ILCE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterBolge + KriterSehir)
               Then If ExeccSQL('DELETE FROM CR_KULLANICI_SEHIR WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterBolge + KriterSehir)
                   Then ExeccSQL('DELETE FROM CR_KULLANICI_BOLGE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterBolge);
        End
           Else
        if CxYSehir.Checked then
        Begin
            If ExeccSQL('DELETE FROM CR_KULLANICI_ILCE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterBolge + KriterSehir)
               Then ExeccSQL('DELETE FROM CR_KULLANICI_SEHIR WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterBolge + KriterSehir);
        End Else If CxYIlce.Checked then ExeccSQL('DELETE FROM CR_KULLANICI_ILCE WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text + KriterBolge + KriterSehir);
        If CxYTabela.Checked then ExeccSQL('DELETE FROM CR_KULLANICI_BIRIM_TABELA WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
        If CxYSatinalmaci.Checked then ExeccSQL('DELETE FROM CR_KULLANICI_SATINALMACI WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
        If CxYTedarikci.Checked then ExeccSQL('DELETE FROM CR_KULLANICI_TEDARIKCI WHERE ID_KULLANICI_KOD = ' + tkullaniciKOD.Text);
    End;
    QAnaBolge.Close;
    QAltBolge.Close;
    QBolge.Close;
    QSehir.Close;
    QIlce.Close;
    QTabela.Close;
    qSatinalmaci.Close;
    QTedarikci.Close;
    QAnaBolge.Open;
    QAltBolge.Open;
    QBolge.Open;
    QSehir.Open;
    QIlce.Open;
    QTabela.Open;
    qSatinalmaci.Open;
    QTedarikci.Open;
    Application.MessageBox('Silme iþlemleri tamamlanmýþtýr. Kontrol ediniz...','DÝKKAT',MB_OK);
end;

procedure TErp2000_Kullanicilar.cxButton3Click(Sender: TObject);
begin
    QBaz.Open;
    QDegisen.Open;
    Panel6.Visible := False;
end;

procedure TErp2000_Kullanicilar.cxButton4Click(Sender: TObject);
begin
    If (LBaz.Text = '') Or (LYetki.Text = '') Then
    Begin
        Application.MessageBox('Eksiklik var. Kontrol ediniz...','DÝKKAT',MB_OK);
        Abort;
    End;

    //1.Adým : Yetkisi deðiþecek kullanýcýnýn bütün BI yetkileri silinir.
    ExeccSQL('DELETE FROM CR_KULLANICI_ALT_BOLGE WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));
    ExeccSQL('DELETE FROM CR_KULLANICI_ANA_BOLGE WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));
    ExeccSQL('DELETE FROM CR_KULLANICI_ILCE WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));
    ExeccSQL('DELETE FROM CR_KULLANICI_SEHIR WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));
    ExeccSQL('DELETE FROM CR_KULLANICI_BOLGE WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));
    ExeccSQL('DELETE FROM CR_KULLANICI_BIRIM_TABELA WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));
    ExeccSQL('DELETE FROM CR_KULLANICI_SATINALMACI WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));
    ExeccSQL('DELETE FROM CR_KULLANICI_TEDARIKCI WHERE ID_KULLANICI_KOD = ' + VarToStr(LYetki.EditValue));

    //2.Adým Baz Tablonun Kopyasýný Alma
    ExeccSQL('INSERT INTO CR_KULLANICI_ALT_BOLGE ' +
                ' SELECT ID_ULKE,ID_ANA_BOLGE,ID_ALT_BOLGE,' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_ALT_BOLGE WHERE ID_KULLANICI_KOD = ' + VarToStr(LBaz.EditValue));
    ExeccSQL('INSERT INTO CR_KULLANICI_ANA_BOLGE ' +
                ' SELECT ID_ULKE,ID_ANA_BOLGE,' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_ANA_BOLGE WHERE ID_KULLANICI_KOD  = ' + VarToStr(LBaz.EditValue));
    ExeccSQL('INSERT INTO CR_KULLANICI_ILCE ' +
                ' SELECT ID_ULKE,ID_BOLGE,ID_SEHIR,ID_ILCE,' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_ILCE WHERE ID_KULLANICI_KOD = ' + VarToStr(LBaz.EditValue));
    ExeccSQL('INSERT INTO CR_KULLANICI_SEHIR ' +
                ' SELECT ID_ULKE,ID_BOLGE,ID_SEHIR, ' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_SEHIR WHERE ID_KULLANICI_KOD = ' + VarToStr(LBaz.EditValue));
    ExeccSQL('INSERT INTO CR_KULLANICI_BOLGE ' +
                ' SELECT ID_ULKE,ID_BOLGE,' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_BOLGE WHERE ID_KULLANICI_KOD = ' + VarToStr(LBaz.EditValue));
    ExeccSQL('INSERT INTO CR_KULLANICI_BIRIM_TABELA ' +
                ' SELECT ID_BIRIM_TABELA,' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_BIRIM_TABELA WHERE ID_KULLANICI_KOD = ' + VarToStr(LBaz.EditValue));
    ExeccSQL('INSERT INTO CR_KULLANICI_SATINALMACI ' +
                ' SELECT ID_SATINALMACI,' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_SATINALMACI WHERE ID_KULLANICI_KOD = ' + VarToStr(LBaz.EditValue));
    ExeccSQL('INSERT INTO CR_KULLANICI_TEDARIKCI ' +
                ' SELECT DS_TEDARIKCI,' + VarToStr(LYetki.EditValue) + ',SDY,SDT,U_SDY,U_SDT FROM CR_KULLANICI_TEDARIKCI WHERE ID_KULLANICI_KOD = ' + VarToStr(LBaz.EditValue));
    QAnaBolge.Close;
    QAltBolge.Close;
    QBolge.Close;
    QSehir.Close;
    QIlce.Close;
    QTabela.Close;
    qSatinalmaci.Close;
    QTedarikci.Close;
    QAnaBolge.Open;
    QAltBolge.Open;
    QBolge.Open;
    QSehir.Open;
    QIlce.Open;
    QTabela.Open;
    qSatinalmaci.Open;
    QTedarikci.Open;
    Application.MessageBox('Ýþlem tamamlandý. Kontrol ediniz...','DÝKKAT',MB_OK);
end;

procedure TErp2000_Kullanicilar.cxButton6Click(Sender: TObject);
begin
    Panel8.Visible := False;
end;

procedure TErp2000_Kullanicilar.cxDBLookupComboBox1PropertiesChange(
  Sender: TObject);
begin
    if QRoller.State In [DsEdit,DsInsert] Then
    Begin
        QRollerSUBELER.AsString        := ';'+ QSube.FieldByName('CARI_ID').AsString +';';
        QRollerMASRAF_SUBELER.AsString := ';'+ QSube.FieldByName('CARI_ID').AsString +';';
        if cxDBLookupComboBox1.Text = '' Then
        Begin
            QRollerSUBELER.AsString        := '';
            QRollerMASRAF_SUBELER.AsString := '';
        End;
    End;
end;

procedure TErp2000_Kullanicilar.cxDBLookupComboBox3PropertiesChange(
  Sender: TObject);
begin
    If (TKullanici.State In [DsEdit,DsInsert]) And (cxDBLookupComboBox3.Text <> '') Then
    Begin
        tkullaniciISIM.AsString   := cxDBLookupComboBox3.Text;
        tkullaniciUNVANI.AsString := DmGlobal.QPersonelUNVAN.AsSTring;
    End;

    If (TKullanici.State In [DsInsert]) And (QRoller.State In [DsEdit,DsInsert]) And (cxDBLookupComboBox3.Text <> '') Then
    Begin
        QRoller.FieldByName('FIRMA').AsString          := dmGlobal.QPersonel.FieldByName('MAGAZA_NO').AsString;
        QRoller.FieldByName('SUBELER').AsString        := ';'+dmGlobal.QPersonel.FieldByName('MAGAZA_NO').AsString+';';
        QRoller.FieldByName('MASRAF_SUBELER').AsString := ';'+dmGlobal.QPersonel.FieldByName('MAGAZA_NO').AsString+';';
    End;
end;

procedure TErp2000_Kullanicilar.QRollerBeforeDelete(DataSet: TDataSet);
begin
    If Application.MessageBox('Bu rol kullanýcýdan silinecektir. Onaylýyormusunuz ?','Dikkat !',Mb_YesNo) = idNo Then Abort;
end;

procedure TErp2000_Kullanicilar.ActSorgulaExecute(Sender: TObject);
Var
   S : Char;
begin
    s := #13;
    edAramaKeyPress(edarama,s);
end;

procedure TErp2000_Kullanicilar.ActVazgecExecute(Sender: TObject);
begin
   QryPanel.ClearAll;
end;

procedure TErp2000_Kullanicilar.cbAramaChange(Sender: TObject);
begin
    edArama.SetFocus;
    edArama.SelStart := 0;
    edArama.SelLength:= Length(edArama.Text);
end;

procedure TErp2000_Kullanicilar.FormShow(Sender: TObject);
begin
    edArama.SetFocus;
    edArama.SelStart := 0;
    edArama.SelLength:= Length(edArama.Text);
end;

procedure TErp2000_Kullanicilar.KullancKopyalama1Click(Sender: TObject);
begin
    If tkullaniciKOD.Text <> '' then
    Begin
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
        Panel8.Visible := True;
    End;
end;

procedure TErp2000_Kullanicilar.cxDBMemo3Click(Sender: TObject);
begin
    Panel2.Visible   := False;
    PmAktar.Visible  := False;
    SpTumSec.Visible     := False;
    SpTumKaldir.Visible  := False;

    PmmKapat.Visible := False;
end;

procedure TErp2000_Kullanicilar.cxDBMemo3KeyPress(Sender: TObject;
  var Key: Char);
begin
    Panel2.Visible   := False;
    PmAktar.Visible  := False;
    PmmKapat.Visible := False;
    SpTumSec.Visible     := False;
    SpTumKaldir.Visible  := False;
end;

procedure TErp2000_Kullanicilar.cxDBMemo2KeyPress(Sender: TObject;
  var Key: Char);
begin
{
    If (Key = #69) Or (Key = #101) Then
    Begin
        cxDBMemo2.SetFocus;
        cxDBMemo2.SelStart := Length(cxDBMemo2.Text);
        Abort;
    End;
}
end;

procedure TErp2000_Kullanicilar.cxDBTextEdit1DblClick(Sender: TObject);
begin
{
    if tkullaniciKOD.AsString = '2' then cxLabel8.Caption := ''
      else If (LoginInfo.Roller = 'SÝSTEM YÖNETÝCÝSÝ') Or (Pos(';'+tkullaniciKOD.AsString+';',';6269;24504;4;1;8323;7;70846;70845;9;2;8;80024;') < 1) Then cxLabel8.Caption := _Crypto(False, tKullaniciBI_SIFRE.AsString, 5);
}
  If tkullaniciKOD.AsString = '2' then cxLabel8.Caption := ''
      else If (((LoginInfo.Roller = 'SÝSTEM YÖNETÝCÝSÝ') Or (LoginInfo.Roller = 'SÝSTEM YÖNETÝCÝSÝ YARDIMCISI')) And (Pos(';'+tkullaniciKOD.AsString+';',';6269;24504;4;1;8323;7;70846;70845;9;2;8;80024;10;1574;1724;') < 1)) Or
              (Pos(';'+LoginInfo.Kod+';',';6269;24504;4;1;8323;7;70846;70845;9;2;8;80024;10;1574;1724;') > 0) Or ((LoginInfo.Roller = 'SÝSTEM YÖNETÝCÝSÝ YARDIMCISI') Or ((LoginInfo.LOGINNAME = 'AASIM.KOK') Or (LoginInfo.LOGINNAME = 'MURAT.BIREKUL')))  Then
                If Caption = 'BI Kullanýcý Tanýmlarý' Then cxLabel8.Caption := _Crypto(False, tKullaniciBI_SIFRE.AsString, 5);
end;

procedure TErp2000_Kullanicilar.cxDBTextEdit5Click(Sender: TObject);
begin
    pmKirimClick(PmKirim);
end;

procedure TErp2000_Kullanicilar.cxDBTextEdit5KeyPress(Sender: TObject;
  var Key: Char);
begin
    pmKirimClick(PmKirim);
end;

procedure TErp2000_Kullanicilar.cxDBMemo1KeyPress(Sender: TObject;
  var Key: Char);
begin
{
    If (Key = #69) Or (Key = #101) Then
    Begin
        cxDBMemo1.SetFocus;
        cxDBMemo1.SelStart := Length(cxDBMemo1.Text);
        Abort;
    End;
}
end;

procedure TErp2000_Kullanicilar.QRollerAfterScroll(DataSet: TDataSet);
begin
    CxDbMemo2.Enabled   := LoginInfo.Konsolide = False;
    CxDbMemo4.Enabled   := LoginInfo.Konsolide = False;
    SpTumSec.Enabled    := QRoller.State In [DsEdit,DsInsert];
    SpTumKaldir.Enabled := QRoller.State In [DsEdit,DsInsert];

end;

end.



  NBDI_FIRST        = 0;
  NBDI_PRIORPAGE    = 1;
  NBDI_PRIOR        = 2;
  NBDI_NEXT         = 3;
  NBDI_NEXTPAGE     = 4;
  NBDI_LAST         = 5;
  NBDI_INSERT       = 6;
  NBDI_APPEND       = 7;
  NBDI_DELETE       = 8;
  NBDI_EDIT         = 9;
  NBDI_POST         = 10;
  NBDI_CANCEL       = 11;
  NBDI_REFRESH      = 12;
  NBDI_SAVEBOOKMARK = 13;
  NBDI_GOTOBOOKMARK = 14;
  NBDI_FILTER       = 15;




