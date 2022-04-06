object RolSecForm: TRolSecForm
  Left = 434
  Top = 190
  BorderStyle = bsToolWindow
  Caption = 'Giri'#351' i'#231'in bir ROL se'#231'melisiniz ....'
  ClientHeight = 248
  ClientWidth = 432
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 432
    Height = 248
    Align = alClient
    BevelOuter = bvNone
    PopupMenu = PopupMenu1
    TabOrder = 0
    object cxGrid1: TcxGrid
      Left = 0
      Top = 0
      Width = 432
      Height = 248
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = cxcbsNone
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      PopupMenu = PopupMenu1
      TabOrder = 0
      LookAndFeel.Kind = lfUltraFlat
      LookAndFeel.NativeStyle = False
      object cxGrid1DBTableView1: TcxGridDBTableView
        OnDblClick = cxGrid1DBTableView1DblClick
        OnKeyPress = cxGrid1DBTableView1KeyPress
        Navigator.Buttons.CustomButtons = <>
        Navigator.Buttons.First.Hint = #304'lk Kay'#305't'
        Navigator.Buttons.First.Visible = False
        Navigator.Buttons.PriorPage.Hint = #214'nceki Sayfa'
        Navigator.Buttons.PriorPage.Visible = False
        Navigator.Buttons.Prior.Hint = #214'nceki Kay'#305't'
        Navigator.Buttons.Prior.Visible = False
        Navigator.Buttons.Next.Hint = 'Sonraki Kay'#305't'
        Navigator.Buttons.Next.Visible = False
        Navigator.Buttons.NextPage.Hint = 'Sonraki Sayfa'
        Navigator.Buttons.NextPage.Visible = False
        Navigator.Buttons.Last.Hint = 'Son Kay'#305't'
        Navigator.Buttons.Last.Visible = False
        Navigator.Buttons.Insert.Enabled = False
        Navigator.Buttons.Insert.Visible = False
        Navigator.Buttons.Delete.Enabled = False
        Navigator.Buttons.Delete.Visible = False
        Navigator.Buttons.Edit.Visible = False
        Navigator.Buttons.Post.Visible = False
        Navigator.Buttons.Cancel.ImageIndex = 1
        Navigator.Buttons.Cancel.Visible = False
        Navigator.Buttons.Refresh.Enabled = False
        Navigator.Buttons.Refresh.Visible = False
        Navigator.Buttons.SaveBookmark.Enabled = False
        Navigator.Buttons.SaveBookmark.Visible = False
        Navigator.Buttons.GotoBookmark.Enabled = False
        Navigator.Buttons.GotoBookmark.Visible = False
        Navigator.Buttons.Filter.Enabled = False
        Navigator.Buttons.Filter.Visible = False
        DataController.DataModeController.GridMode = True
        DataController.DataModeController.GridModeBufferCount = 1000
        DataController.DataSource = SRol
        DataController.Options = []
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsBehavior.IncSearch = True
        OptionsBehavior.NavigatorHints = True
        OptionsBehavior.ColumnHeaderHints = False
        OptionsCustomize.ColumnFiltering = False
        OptionsCustomize.ColumnGrouping = False
        OptionsData.CancelOnExit = False
        OptionsData.Deleting = False
        OptionsData.DeletingConfirmation = False
        OptionsData.Editing = False
        OptionsData.Inserting = False
        OptionsSelection.CellSelect = False
        OptionsSelection.HideFocusRectOnExit = False
        OptionsView.ScrollBars = ssNone
        OptionsView.ColumnAutoWidth = True
        OptionsView.DataRowHeight = 21
        OptionsView.GridLineColor = 16762052
        OptionsView.GroupByBox = False
        OptionsView.Header = False
        OptionsView.HeaderHeight = 21
        Styles.Background = cxStyle11
        Styles.Content = cxStyle2
        Styles.ContentEven = cxStyle3
        Styles.ContentOdd = cxStyle4
        Styles.FilterBox = cxStyle5
        Styles.Inactive = cxStyle12
        Styles.IncSearch = cxStyle11
        Styles.Selection = cxStyle12
        Styles.Footer = cxStyle6
        Styles.Group = cxStyle7
        Styles.GroupByBox = cxStyle8
        Styles.Header = cxStyle10
        Styles.Indicator = cxStyle15
        Styles.Preview = cxStyle13
        Styles.StyleSheet = GridTableViewStyleSheetDevExpress
        object cxGrid1DBTableView1ROL: TcxGridDBColumn
          Caption = 'ROLLER'
          DataBinding.FieldName = 'ROL'
          PropertiesClassName = 'TcxLabelProperties'
          Properties.Alignment.Horz = taCenter
          FooterAlignmentHorz = taCenter
          HeaderAlignmentHorz = taCenter
          HeaderGlyphAlignmentHorz = taCenter
          Width = 406
        end
      end
      object cxGrid1Level1: TcxGridLevel
        GridView = cxGrid1DBTableView1
      end
    end
    object cxLookupComboBox1: TcxLookupComboBox
      Left = 12
      Top = 201
      AutoSize = False
      ParentFont = False
      Properties.DropDownListStyle = lsFixedList
      Properties.KeyFieldNames = 'ROL'
      Properties.ListColumns = <
        item
          FieldName = 'ROL'
        end>
      Properties.ListOptions.AnsiSort = True
      Properties.ListOptions.ShowHeader = False
      Properties.ListOptions.SyncMode = True
      Properties.ListSource = SRol
      Style.BorderColor = 8404992
      Style.BorderStyle = ebsSingle
      Style.Color = clWhite
      Style.Font.Charset = DEFAULT_CHARSET
      Style.Font.Color = clWindowText
      Style.Font.Height = -11
      Style.Font.Name = 'MS Sans Serif'
      Style.Font.Style = []
      Style.LookAndFeel.NativeStyle = True
      Style.Shadow = True
      Style.TextColor = clRed
      Style.IsFontAssigned = True
      StyleDisabled.LookAndFeel.NativeStyle = True
      StyleFocused.BorderStyle = ebsSingle
      StyleFocused.Color = clWhite
      StyleFocused.LookAndFeel.NativeStyle = True
      StyleHot.BorderStyle = ebsSingle
      StyleHot.LookAndFeel.NativeStyle = True
      TabOrder = 1
      Visible = False
      Height = 25
      Width = 180
    end
  end
  object QRol: TOraQuery
    Session = dmGlobal.dbGlobal
    SQL.Strings = (
      
        'SELECT *FROM KULLANICI_ROL WHERE KOD IN (SELECT KOD FROM KULLANI' +
        'CI WHERE LOGINNAME =:LOGINNAME) AND TUR =:ROLTUR')
    Left = 8
    Top = 22
    ParamData = <
      item
        DataType = ftString
        Name = 'LOGINNAME'
        Value = 'AFURKAN'
      end
      item
        DataType = ftString
        Name = 'ROLTUR'
        Value = 'P'
      end>
    object QRolKOD: TIntegerField
      FieldName = 'KOD'
    end
    object QRolROL: TStringField
      FieldName = 'ROL'
      Size = 60
    end
    object QRolTUR: TStringField
      FieldName = 'TUR'
      Size = 2
    end
    object QRolFIRMA: TIntegerField
      FieldName = 'FIRMA'
    end
    object QRolSATINALMACI: TStringField
      FieldName = 'SATINALMACI'
      Size = 25
    end
    object QRolSATINALMACILAR: TStringField
      FieldName = 'SATINALMACILAR'
      Size = 500
    end
    object QRolSUBELER: TStringField
      FieldName = 'SUBELER'
      Size = 1000
    end
    object QRolMASRAF_SUBELER: TStringField
      FieldName = 'MASRAF_SUBELER'
      Size = 1000
    end
    object QRolCARILER: TStringField
      FieldName = 'CARILER'
      Size = 1000
    end
    object QRolANA_KIRIM: TStringField
      FieldName = 'ANA_KIRIM'
      Size = 250
    end
    object QRolSDY: TIntegerField
      FieldName = 'SDY'
    end
    object QRolSDT: TDateTimeField
      FieldName = 'SDT'
    end
  end
  object SRol: TDataSource
    DataSet = QRol
    Left = 40
    Top = 24
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 145
    Top = 40
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle3: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle4: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle5: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle6: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16758711
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle14: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle15: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object DetayGridHeader: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 21156
      TextColor = clWhite
    end
    object DetayBackRound: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11463679
      TextColor = clWhite
    end
    object DetayGridSatirKoyu: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 11463679
      TextColor = clBlack
    end
    object DetayGridSatirAcik: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15268607
      TextColor = clBlack
    end
    object DetaySatirSecme: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 5093373
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      TextColor = clMaroon
    end
    object Detay1Header: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 6250335
      TextColor = clWhite
    end
    object Detay1BackRound: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlack
    end
    object Detay1SatirKoyu: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15132390
      TextColor = clBlack
    end
    object Detay1SatirAcik: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 16250871
      TextColor = clBlack
    end
    object Detay1SatirSecme: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 10658466
      TextColor = clWhite
    end
    object GridSatirAcik: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = clWhite
      TextColor = clBlue
    end
    object GridSatirKoyu: TcxStyle
      AssignedValues = [svColor, svTextColor]
      Color = 15132390
      TextColor = clBlue
    end
    object GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet
      Caption = 'DevExpress'
      Styles.Content = cxStyle3
      Styles.ContentEven = cxStyle4
      Styles.ContentOdd = cxStyle5
      Styles.FilterBox = cxStyle6
      Styles.Inactive = cxStyle11
      Styles.IncSearch = cxStyle12
      Styles.Selection = cxStyle15
      Styles.Footer = cxStyle7
      Styles.Group = cxStyle8
      Styles.GroupByBox = cxStyle9
      Styles.Indicator = cxStyle13
      Styles.Preview = cxStyle14
      BuiltIn = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 264
    Top = 77
    object Kapat1: TMenuItem
      Caption = 'Kapat '
      ShortCut = 16472
      OnClick = Kapat1Click
    end
  end
end
