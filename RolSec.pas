unit RolSec;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, OraSmart, MemDS, OraError, cxGraphics, StdCtrls, Buttons, cxControls,
  cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit, Registry,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, ExtCtrls, cxStyles,
  cxCustomData, cxFilter, cxData, cxDataStorage, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxGridCustomView, cxGrid, cxClasses, cxLabel, Menus, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter,
  cxLookAndFeels, cxLookAndFeelPainters, cxNavigator;

type
  TRolSecForm = class(TForm)
    QRol: TOraQuery;
    SRol: TDataSource;
    Panel1: TPanel;
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
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBTableView1ROL: TcxGridDBColumn;
    cxLookupComboBox1: TcxLookupComboBox;
    PopupMenu1: TPopupMenu;
    Kapat1: TMenuItem;
    QRolKOD: TIntegerField;
    QRolROL: TStringField;
    QRolTUR: TStringField;
    QRolFIRMA: TIntegerField;
    QRolSATINALMACI: TStringField;
    QRolSATINALMACILAR: TStringField;
    QRolSUBELER: TStringField;
    QRolMASRAF_SUBELER: TStringField;
    QRolCARILER: TStringField;
    QRolANA_KIRIM: TStringField;
    QRolSDY: TIntegerField;
    QRolSDT: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure Kapat1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RolSecForm: TRolSecForm;

implementation
Uses Login,ErpMenu,BlyLib;
{$R *.dfm}

procedure TRolSecForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
   Reg : TRegistry;
begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\Software\Belit\YAZILIM\', True);
   try
      Reg.WriteString('ROL', QRolRol.Text);
   except
   end;
   Reg.CloseKey;
   Reg.Free;
end;

procedure TRolSecForm.FormShow(Sender: TObject);
var
   Reg  : TRegistry;
Begin
   Reg := TRegistry.Create;
   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\Software\Belit\YAZILIM', True);
   try
      If Login_Service.EdKod.Text = Reg.ReadString('KKod') Then CxLookupComboBox1.Text := Reg.ReadString('ROL')
                                                           Else CxLookupComboBox1.Text := QRolROL.Text;
   except
      CxLookupComboBox1.Text := QRolROL.Text;
   end;
   Reg.CloseKey;
   Reg.Free;
   If ModalResult <> MrOk Then ModalResult := MrCancel;
end;

procedure TRolSecForm.cxGrid1DBTableView1KeyPress(Sender: TObject;
  var Key: Char);
begin
    If Key = #13 Then
    Begin
        ModalResult := MrOk;
    End
       Else
    If Key = #27 Then
    Begin
        ModalResult := MrCancel;
    End;
end;

procedure TRolSecForm.cxGrid1DBTableView1DblClick(Sender: TObject);
begin
    ModalResult := MrOk;
end;

procedure TRolSecForm.Kapat1Click(Sender: TObject);
begin
    ModalResult := MrNo;
end;

end.
