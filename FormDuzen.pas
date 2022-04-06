unit FormDuzen;

interface

uses
  Windows, Messages, SysUtils, Classes,Controls,Ora, OraSmart, MemDS, OraError,kdsstruc,kdbstruc, kdbinfo, kbdeinfo,cxStyles,dxBar, dxBarExtItems ;

type
  TFormDuzen = class(TComponent)
  private
    { Private declarations }
    FormKeyPress :  TKeyPressEvent;
    FormKeyDown :  TKeyEvent;
  protected
    { Protected declarations }
    procedure KeyPress(Sender: TObject; var Key: Char);
    procedure KeyDown(Sender:TObject; var Key: Word; Shift: TShiftState);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    { Published declarations }
  end;

procedure Register;

implementation

uses Forms, Grids, DModule, StdCtrls, DBGrids, DBCTRls, cxTextEdit,Blylib,cxDBLookupComboBox, kquerpnl, cxButtonEdit;

var
  NoktaVirgul :boolean;


procedure Register;
begin
  RegisterComponents('Standard', [TFormDuzen]);
end;

{ TFormDuzen }

constructor TFormDuzen.Create(AOwner: TComponent);
Var
   I,I1: Integer;
begin
  inherited;
  TForm(AOwner).KeyPreview := True;
  FormKeyPress := TForm(Owner).OnKeyPress;
  FormKeyDown := TForm(OWner).OnKeyDown;
  TForm(Owner).OnKeyPress := KeyPRess;
  TForm(OWner).OnKeyDown := KeyDown;
  for I := 0 to TForm(Owner).ComponentCount -1 do
  Begin
      If TForm(Owner).Components[I].ClassType = TOraQuery then
      Begin
          if (TForm(Owner).Components[I] As TOraQuery).Active  then (TForm(Owner).Components[I] As TOraQuery).Close;
         (TForm(Owner).Components[I] As TOraQuery).Options.LongStrings  := False;
      End;

      If TForm(Owner).Components[I].ClassType = TCxStyleRepository then
          (TForm(Owner).Components[I] As TCxStyleRepository).Scalable := True;

      If TForm(Owner).Components[I].ClassType = TDxBarManager then
          (TForm(Owner).Components[I] As TDxBarManager).Scaled := True;


//      If TForm(Owner).Components[I].ClassType = TKQueryPanel Then  
//          for i1 := 0 to (TForm(Owner).Components[I1] As TKQueryPanel).Filter.RowCount - 1 do (TForm(Owner).Components[I1] As TKQueryPanel).Filter.Rows[i1].Enabled := False;
{XE10
      If TForm(Owner).Components[I].ClassType = TKDBStructure then (TForm(Owner).Components[I] As TKDBStructure).DatabaseInfo := dmGlobal.Odac_Info;
}
      If TForm(Owner).Components[I].ClassType = TOraStoredProc then (TForm(Owner).Components[I] As TOraStoredProc).Options.RequiredFields := False;
      //If TForm(Owner).Components[I].ClassType = TOraQuery then
  End;
end;

destructor TFormDuzen.Destroy;
begin
//  if Assigned(FormKeyDown) then TForm(Owner).OnKeyDown := FormKeyDown;
//  if Assigned(FormKeyPress) then TForm(Owner).OnKeyPress := FormKeyPress;
  inherited;
end;

procedure TFormDuzen.KeyDown(Sender:TObject; var Key: Word; Shift: TShiftState);
begin
  if Assigned(FormKeyDown) then FormKeyDown(Self, Key, Shift);
  if Key=110 then
  begin
    NoktaVirgul := True;
  end else NoktaVirgul := False;
end;

procedure TFormDuzen.KeyPress(Sender: TObject; var Key: Char);
var
 Obj: TWinControl;
 kp,Kp1 :  TKeyPressEvent;
begin
  if Assigned(FormKeyPress) then FormKeyPress(Self, Key);
  if TForm(Owner).ActiveControl = nil then exit;
  Obj := TForm(Owner).ActiveControl;
  kp  := TEdit(Obj).OnKeyPress;
{
  try
     if Assigned(kp) then kp(Self,Key)
                     Else {If Not(IsGridFocused) Then
                          If (GetEditor.ClassType = TcxTextEdit) Or (GetEditor.ClassType = TcxButtonEdit)  Or
                            (GetEditor.ClassType = TcxLookupComboBox) Then GetEditor.OnKeyPress(Self,Key);
  Except
  End;

  }
  if (Obj is TCustomDBGrid)or((Obj is TCustomEdit)and (TEdit(Obj).CharCase = ecUpperCase)) then
    case Key of
      'i' : Key := 'Ý';
      'ý' : Key := 'I';
      'I' : Key := 'I';
      'Ý' : Key := 'Ý';
      'ü' : Key := 'Ü';
      'Ü' : Key := 'Ü';
      'ö' : Key := 'Ö';
      'Ö' : Key := 'Ö';
      'þ' : Key := 'Þ';
      'Þ' : Key := 'Þ';
      'ç' : Key := 'Ç';
      'Ç' : Key := 'Ç';
      'ð' : Key := 'Ð';
      'Ð' : Key := 'Ð';
    end;
  if NoktaVirgul then Key := '.';
  if Key = #13 then
    begin
      if not((Obj is TComboBox) and (TComboBox(Obj).DroppedDown)) then
      if not((Obj is TDBLookupComboBox) and (TDBLookupComboBox(Obj).ListVisible)) then
      if (not (Obj is TCustomGrid))and(not (Obj is TCustomMemo){XE10 and(not(OBJ is TGridCombo))}) then
        if Owner is Tform then
          begin
            SendMessage(TForm(Owner).Handle,WM_NEXTDLGCTL,0,0);
            Key := #0;
          end;
    end;
end;

end.
 
