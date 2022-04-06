object frmVersiyon: TfrmVersiyon
  Left = 279
  Top = 292
  BorderStyle = bsDialog
  Caption = 'VERS'#304'YON YEN'#304'LENMES'#304
  ClientHeight = 94
  ClientWidth = 374
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 67
    Top = 52
    Width = 264
    Height = 13
    Caption = 'YONETIM.EXE nin yeni versiyonu y'#252'kleniyor...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
    OnClick = Label1Click
  end
  object Label2: TLabel
    Left = 6
    Top = 6
    Width = 363
    Height = 41
    Alignment = taCenter
    AutoSize = False
    Caption = 
      'KULLANMI'#350' OLDU'#286'UNUZ BEL'#304'T YONETIM PROGRAMININ VERS'#304'YONU ESK'#304'D'#304'R.' +
      ' L'#220'TFEN BEKLEY'#304'N'#304'Z...!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    WordWrap = True
  end
  object Gosterge: TGauge
    Left = 9
    Top = 78
    Width = 358
    Height = 13
    Progress = 0
  end
  object FTP: TipwFTP
    FirewallPort = 80
    Overwrite = True
    RemoteFile = 'BELIT.EXE'
    OnDirList = FTPDirList
    OnTransfer = FTPTransfer
    Left = 300
    Top = 21
  end
  object Timer1: TTimer
    Interval = 2000
    OnTimer = Timer1Timer
    Left = 39
    Top = 33
  end
end
