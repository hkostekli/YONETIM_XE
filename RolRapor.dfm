object RolRaporForm: TRolRaporForm
  Left = 193
  Top = 36
  BorderStyle = bsSingle
  Caption = 'Rol Raporu'
  ClientHeight = 580
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  Position = poDefault
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  DesignSize = (
    1003
    580)
  PixelsPerInch = 96
  TextHeight = 13
  object cxPageControl1: TcxPageControl
    Left = 220
    Top = 0
    Width = 783
    Height = 580
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    Properties.ActivePage = cxTabSheet1
    Properties.CustomButtons.Buttons = <>
    Properties.TabHeight = 21
    Properties.TabWidth = 110
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = True
    OnChange = cxPageControl1Change
    ClientRectBottom = 576
    ClientRectLeft = 4
    ClientRectRight = 779
    ClientRectTop = 27
    object cxTabSheet1: TcxTabSheet
      Caption = 'Rol Detay Raporu'
      ImageIndex = 0
      PopupMenu = PopupMenu1
      object dxDockSite1: TdxDockSite
        Left = 0
        Top = 0
        Width = 775
        Height = 549
        HelpContext = 111
        Align = alClient
        DockingType = 5
        OriginalWidth = 775
        OriginalHeight = 549
        object dxLayoutDockSite2: TdxLayoutDockSite
          Left = 0
          Top = 0
          Width = 775
          Height = 398
          HelpContext = 112
          DockingType = 0
          OriginalWidth = 300
          OriginalHeight = 200
          object dxLayoutDockSite1: TdxLayoutDockSite
            Left = 0
            Top = 0
            Width = 775
            Height = 398
            HelpContext = 113
            DockingType = 0
            OriginalWidth = 300
            OriginalHeight = 200
          end
          object dxDockPanel1: TdxDockPanel
            Left = 0
            Top = 0
            Width = 775
            Height = 398
            HelpContext = 114
            AllowFloating = True
            AutoHide = False
            Caption = 'Fi'#351' Listesi'
            CaptionButtons = []
            CustomCaptionButtons.Buttons = <>
            Dockable = False
            ShowCaption = False
            TabsProperties.CustomButtons.Buttons = <>
            DockingType = 0
            OriginalWidth = 185
            OriginalHeight = 140
            object cxGrid1: TcxGrid
              Left = 0
              Top = 0
              Width = 771
              Height = 394
              Align = alClient
              BorderStyle = cxcbsNone
              PopupMenu = PopupMenu1
              TabOrder = 0
              LookAndFeel.NativeStyle = False
              object CxV: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                Navigator.Buttons.First.Visible = True
                Navigator.Buttons.PriorPage.Visible = True
                Navigator.Buttons.Prior.Visible = True
                Navigator.Buttons.Next.Visible = True
                Navigator.Buttons.NextPage.Visible = True
                Navigator.Buttons.Last.Visible = True
                Navigator.Buttons.Insert.Visible = True
                Navigator.Buttons.Append.Visible = False
                Navigator.Buttons.Delete.Visible = True
                Navigator.Buttons.Edit.Visible = True
                Navigator.Buttons.Post.Visible = True
                Navigator.Buttons.Cancel.Visible = True
                Navigator.Buttons.Refresh.Visible = True
                Navigator.Buttons.SaveBookmark.Visible = True
                Navigator.Buttons.GotoBookmark.Visible = True
                Navigator.Buttons.Filter.Visible = True
                DataController.DataModeController.GridMode = True
                DataController.DataSource = QSYetki
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <
                  item
                    Format = 'Toplam Kay'#305't Say'#305's'#305' : ###0'
                    Kind = skCount
                    Column = CxVYETKIYOLU
                  end>
                DataController.Summary.SummaryGroups = <>
                OptionsCustomize.ColumnFiltering = False
                OptionsCustomize.ColumnGrouping = False
                OptionsCustomize.ColumnsQuickCustomization = True
                OptionsData.CancelOnExit = False
                OptionsData.Deleting = False
                OptionsData.DeletingConfirmation = False
                OptionsData.Editing = False
                OptionsData.Inserting = False
                OptionsView.ColumnAutoWidth = True
                OptionsView.DataRowHeight = 21
                OptionsView.GroupByBox = False
                OptionsView.GroupFooters = gfAlwaysVisible
                OptionsView.HeaderHeight = 21
                OptionsView.Indicator = True
                OptionsView.ShowColumnFilterButtons = sfbAlways
                Styles.Background = cxStyle1
                Styles.Content = cxStyle2
                Styles.ContentEven = cxStyle3
                Styles.ContentOdd = cxStyle4
                Styles.FilterBox = cxStyle5
                Styles.Inactive = cxStyle14
                Styles.IncSearch = cxStyle11
                Styles.Selection = cxStyle14
                Styles.Footer = cxStyle6
                Styles.Group = cxStyle7
                Styles.GroupByBox = cxStyle8
                Styles.Header = cxStyle14
                Styles.Indicator = cxStyle12
                Styles.Preview = cxStyle13
                Styles.StyleSheet = GridTableViewStyleSheetDevExpress
                object CxVROLADI: TcxGridDBColumn
                  Caption = 'Rol Ad'#305
                  DataBinding.FieldName = 'ROLADI'
                  Width = 262
                end
                object CxVYETKIYOLU: TcxGridDBColumn
                  Caption = 'Yetki Yolu'
                  DataBinding.FieldName = 'YETKIYOLU'
                  PropertiesClassName = 'TcxMemoProperties'
                  Width = 342
                end
                object CxVYETKI: TcxGridDBColumn
                  Caption = 'Yetki'
                  DataBinding.FieldName = 'YETKI'
                  Width = 136
                end
                object CxVNO: TcxGridDBColumn
                  Caption = 'No'
                  DataBinding.FieldName = 'NOO'
                  MinWidth = 47
                  Width = 57
                end
                object CxVONAY: TcxGridDBColumn
                  Caption = 'Onay'
                  DataBinding.FieldName = 'ONAY'
                  MinWidth = 29
                  Width = 35
                end
              end
              object cxGrid1Level1: TcxGridLevel
                GridView = CxV
              end
            end
          end
        end
        object dxDockPanel2: TdxDockPanel
          Left = 0
          Top = 398
          Width = 775
          Height = 151
          HelpContext = 116
          AllowFloating = True
          AutoHide = False
          Caption = #214'zel Sorgulama Bilgileri'
          CaptionButtons = [cbMaximize, cbHide]
          CustomCaptionButtons.Buttons = <>
          TabsProperties.CustomButtons.Buttons = <>
          DockingType = 4
          OriginalWidth = 449
          OriginalHeight = 151
          object QryPanel: TKQueryPanel
            Left = 118
            Top = 0
            Width = 653
            Height = 127
            HelpContext = 117
            VertScrollBar.Style = ssHotTrack
            Align = alRight
            BevelInner = bvNone
            BevelOuter = bvNone
            Enabled = False
            Color = 15451300
            ParentColor = False
            TabOrder = 0
            TabStop = True
            Appearance.ActiveRowColor = clInfoBk
            Appearance.ControlBorderColor = clGray
            Appearance.FieldColor = clGreen
            Appearance.LinkTypes = [fltAll, fltAny, fltNone, fltNotAll]
            Appearance.OperatorColor = clMaroon
            Appearance.ValueColor = clNavy
            Appearance.AddRowColor = clRed
            Appearance.Options = [aoFlatButtons, aoRoundButtons, aoNonEmptyBrackets, aoPopupField, aoPopupValue, aoAllowKeyboard, aoShowAddRow, aoShowCheckBoxes, aoAllowParams]
            Appearance.LogOpStyle = losAfterCond
            Appearance.NameSeparator = '.'
            DbStruct = QryStructB
            MainTableName = 'KIYAS'
            Titles.Strings = (
              '[Query Panel]'
              'ttlFilter=A'#351'a'#287#305'daki '#351'artlar'#305'n @ sa'#287'layan kay'#305'tlar'#305' se'#231'...'
              'ttlBracket=@ of the following apply'
              'ttlAll=t'#252'm'#252'n'#252
              'ttlAny=herhangi birisini'
              'ttlNone=hi'#231'birisini'
              'ttlNotAll=bir k'#305'sm'#305'n'#305
              'ttlAddCond=Yeni '#350'art &Ekle (condition)'
              'ttlAddBracket=Yeni &Parantez Ekle (bracket)'
              'ttlAfterCurrent=bundan sonra'
              'ttlInsideCurrent=bunun i'#231'inde'
              'ttlDelRow=&Sat'#305'r Sil'
              'ttlEnableDisable=&Sat'#305'r'#305' Kapat'
              'ttlClickToAdd=Yeni &Ko'#351'ul Eklemek '#304#231'in T'#305'klay'#305'n'#305'z...'
              'ttlSubQueryCaption=Alt Sorgu'
              'ttlResultField=Sonu'#231' Alan'
              'ttlAnd=ve'
              'ttlOr=veya'
              'ttlConstant=Sabit De'#287'er'
              'ttlParameter=Parametre'
              'ttlCustomCond='#214'zel Ko'#351'ul Ekle'
              'ttlTrue=Evet'
              'ttlFalse=Hay'#305'r'
              ''
              '[Result Fields Editor]'
              'ttlRFETitle=Sonu'#231' Alan D'#252'zenleyici'
              'ttlFields=&Kullan'#305'labilir Alanlar'
              'ttlResFields=Sonu'#231' Alanlar'
              'ttlMakeFldHint=Yeni Alan Olu'#351'tur'
              'ttlDelFldHint=Alan Sil'
              'ttlNewFldHint=Yeni Alan'
              'ttlAddRFldHint=Alanlara Ekle'
              'ttlSubRFldHint=Alanlardan '#199#305'kart'
              'ttlMulRFldHint=Alan ile '#199'arp'
              'ttlDivRFldHint=Alan ile B'#246'l'
              'ttlSortRFldHint=Alan'#305' S'#305'rala'
              'ttlNotSorted=S'#305'ralamay'#305' Kald'#305'r'
              'ttlAscending=Artan S'#305'ral'#305
              'ttlDescending=Azalan S'#305'ral'#305
              'ttlSortCaption=S'#305'ral'#305' Alanlar'
              'ttlSortingColName=S'#305'ralama '#350'ekli'
              'ttlFieldNmColName=Alan Ad'#305
              'ttlFieldExprColName=Form'#252'l'
              'ttlMgsDeleteField="%s" alan'#305' silinsin mi?'
              'ttlOkBtnCaption=TAMAM'
              'ttlCancelBtnCaption='#304'ptal'
              'ttlAsIs=Oldu'#287'u Gibi'
              'ttlJustSorting=Sadece S'#305'ral'#305
              'ttlAddBtnCaption=&Ekle'
              'ttlAddBtnHint=Alan Ekle'
              'ttlHelpBtnCaption=&Yard'#305'm'
              'ttlSUMCaption=Toplam'
              'ttlCOUNTCaption=Say'
              'ttlMINCaption=Minimum'
              'ttlMAXCaption=Maksimum'
              'ttlAVERAGECaption=Ortalama'
              'ttlLISTCaption=Liste'
              'ttlCOUNTDISTINCTCaption=Tekil Say'
              '')
            MaxPopupItemCount = 0
            RFEHelpContext = 0
            SQLOptions = [soASCIIRFields, soSelectDistinct, soQuoteAliases]
            SQLSyntax = ssOracle
            SubQueryAppearance.ActiveRowColor = clBtnHighlight
            SubQueryAppearance.ControlBorderColor = clBlack
            SubQueryAppearance.LinkTypes = [fltAll, fltAny, fltNone, fltNotAll]
            SubQueryAppearance.Options = [aoFlatButtons, aoRoundButtons, aoNonEmptyBrackets, aoPopupField, aoPopupValue, aoAllowKeyboard, aoShowAddRow, aoShowCheckBoxes, aoAllowParams]
            SubQueryAppearance.NameSeparator = '.'
            SubQueryFont.Charset = DEFAULT_CHARSET
            SubQueryFont.Color = clWindowText
            SubQueryFont.Height = -11
            SubQueryFont.Name = 'MS Sans Serif'
            SubQueryFont.Style = []
            RFields = (
              '[RFields]'
              'Count=0'
              'Version=3.6'
              'JustSorting=1'
              '')
          end
          object cxButton1: TcxButton
            Left = 5
            Top = 61
            Width = 83
            Height = 31
            Caption = '&Rapor'
            LookAndFeel.Kind = lfOffice11
            LookAndFeel.NativeStyle = True
            OptionsImage.Spacing = 1
            TabOrder = 1
            OnClick = cxButton1Click
          end
          object cxButton3: TcxButton
            Left = 6
            Top = 2
            Width = 83
            Height = 52
            Action = actSorgula
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = True
            TabOrder = 2
          end
          object cxButton4: TcxButton
            Left = 6
            Top = 92
            Width = 83
            Height = 31
            Action = actTemizle
            LookAndFeel.Kind = lfUltraFlat
            LookAndFeel.NativeStyle = True
            TabOrder = 3
          end
          object Button1: TButton
            Left = 163
            Top = 87
            Width = 75
            Height = 25
            Caption = 'Button1'
            TabOrder = 4
            Visible = False
            OnClick = Button1Click
          end
        end
      end
    end
    object cxTabSheet2: TcxTabSheet
      Caption = 'Rol K'#305'yas Raporu'
      ImageIndex = 1
      DesignSize = (
        775
        549)
      object cxGrid2: TcxGrid
        Left = 0
        Top = 49
        Width = 775
        Height = 500
        Align = alClient
        BorderStyle = cxcbsNone
        PopupMenu = PopupMenu1
        TabOrder = 0
        LookAndFeel.NativeStyle = False
        object CxV2: TcxGridDBTableView
          Navigator.Buttons.CustomButtons = <>
          Navigator.Buttons.First.Visible = True
          Navigator.Buttons.PriorPage.Visible = True
          Navigator.Buttons.Prior.Visible = True
          Navigator.Buttons.Next.Visible = True
          Navigator.Buttons.NextPage.Visible = True
          Navigator.Buttons.Last.Visible = True
          Navigator.Buttons.Insert.Visible = True
          Navigator.Buttons.Append.Visible = False
          Navigator.Buttons.Delete.Visible = True
          Navigator.Buttons.Edit.Visible = True
          Navigator.Buttons.Post.Visible = True
          Navigator.Buttons.Cancel.Visible = True
          Navigator.Buttons.Refresh.Visible = True
          Navigator.Buttons.SaveBookmark.Visible = True
          Navigator.Buttons.GotoBookmark.Visible = True
          Navigator.Buttons.Filter.Visible = True
          OnCustomDrawCell = CxV2CustomDrawCell
          DataController.DataSource = SKiyas
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <
            item
              Format = 'Toplam Kay'#305't Say'#305's'#305' : ###0'
              Kind = skCount
              Column = cxGridDBColumn2
            end>
          DataController.Summary.SummaryGroups = <>
          OptionsCustomize.ColumnGrouping = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.ColumnAutoWidth = True
          OptionsView.Footer = True
          OptionsView.GroupByBox = False
          OptionsView.GroupFooters = gfAlwaysVisible
          OptionsView.Indicator = True
          OptionsView.ShowColumnFilterButtons = sfbAlways
          Styles.Background = cxStyle1
          Styles.Content = cxStyle2
          Styles.ContentEven = cxStyle3
          Styles.ContentOdd = cxStyle4
          Styles.FilterBox = cxStyle5
          Styles.Inactive = cxStyle14
          Styles.IncSearch = cxStyle11
          Styles.Selection = cxStyle14
          Styles.Footer = cxStyle6
          Styles.Group = cxStyle7
          Styles.GroupByBox = cxStyle8
          Styles.Header = cxStyle14
          Styles.Indicator = cxStyle12
          Styles.Preview = cxStyle13
          Styles.StyleSheet = GridTableViewStyleSheetDevExpress
          object cxGridDBColumn2: TcxGridDBColumn
            Caption = 'Yetki Yolu'
            DataBinding.FieldName = 'YETKIYOLU'
            Width = 327
          end
          object cxGridDBColumn3: TcxGridDBColumn
            Caption = 'Yetki'
            DataBinding.FieldName = 'YETKI'
            Width = 121
          end
          object cxGridDBColumn4: TcxGridDBColumn
            Caption = 'No'
            DataBinding.FieldName = 'NO'
            Width = 51
          end
          object cxGridDBColumn5: TcxGridDBColumn
            Caption = 'Rol 1'
            DataBinding.FieldName = 'ONAY_1'
            MinWidth = 45
            Options.HorzSizing = False
            Width = 45
          end
          object CxV2Column1: TcxGridDBColumn
            Caption = 'Rol 2'
            DataBinding.FieldName = 'ONAY_2'
            MinWidth = 45
            Options.HorzSizing = False
            Width = 45
          end
          object CxV2Column2: TcxGridDBColumn
            Caption = 'Rol 3'
            DataBinding.FieldName = 'ONAY_3'
            MinWidth = 45
            Options.HorzSizing = False
            Width = 45
          end
        end
        object cxGridLevel1: TcxGridLevel
          GridView = CxV2
        end
      end
      object Pb2: TProgressBar
        Left = 626
        Top = 528
        Width = 133
        Height = 17
        Anchors = [akRight, akBottom]
        TabOrder = 1
        Visible = False
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 775
        Height = 49
        Align = alTop
        BevelOuter = bvNone
        Color = 16758711
        TabOrder = 2
        DesignSize = (
          775
          49)
        object cxButton2: TcxButton
          Left = 687
          Top = 8
          Width = 84
          Height = 29
          Anchors = [akTop, akRight]
          Caption = 'Rapor'
          LookAndFeel.Kind = lfOffice11
          LookAndFeel.NativeStyle = True
          OptionsImage.Spacing = 1
          TabOrder = 0
          OnClick = cxButton2Click
        end
        object cxLabel26: TcxLabel
          Tag = 419
          Left = 122
          Top = 3
          HelpType = htKeyword
          HelpKeyword = 'Panel6'
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'ROL 1'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 16744576
          Style.BorderStyle = ebsSingle
          Style.Color = clWhite
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.Shadow = False
          Style.TextColor = clBlack
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.BorderColor = 8404992
          StyleDisabled.BorderStyle = ebsOffice11
          StyleDisabled.Color = clMaroon
          StyleDisabled.TextColor = clBtnFace
          StyleFocused.BorderColor = clWindowFrame
          StyleFocused.BorderStyle = ebsNone
          StyleFocused.Color = clMaroon
          StyleFocused.TextColor = clBlack
          StyleHot.BorderColor = clWindowFrame
          StyleHot.BorderStyle = ebsNone
          StyleHot.Color = 9295612
          StyleHot.TextColor = clBlack
          StyleHot.TextStyle = []
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Depth = 1
          Transparent = True
          Height = 21
          Width = 184
          AnchorX = 214
          AnchorY = 14
        end
        object cxLookupComboBox1: TcxLookupComboBox
          Left = 122
          Top = 25
          Anchors = [akTop, akRight]
          Properties.ClearKey = 46
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'KOD'
          Properties.ListColumns = <
            item
              FieldName = 'KOD'
            end>
          Properties.ListOptions.AnsiSort = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListOptions.SyncMode = True
          Properties.ListSource = SRol1
          Style.BorderColor = 16744576
          Style.BorderStyle = ebsSingle
          Style.Color = clWhite
          Style.HotTrack = True
          Style.Shadow = False
          Style.TextColor = clBlue
          Style.TransparentBorder = True
          Style.ButtonStyle = btsDefault
          Style.ButtonTransparency = ebtNone
          StyleDisabled.BorderColor = clBtnShadow
          StyleDisabled.BorderStyle = ebsSingle
          StyleDisabled.ButtonStyle = btsDefault
          StyleFocused.BorderColor = clRed
          StyleFocused.BorderStyle = ebsSingle
          StyleFocused.Color = clWhite
          StyleFocused.TextColor = clRed
          StyleFocused.ButtonStyle = btsDefault
          StyleHot.BorderColor = clRed
          StyleHot.BorderStyle = ebsSingle
          StyleHot.TextColor = clRed
          TabOrder = 2
          Width = 184
        end
        object cxLookupComboBox2: TcxLookupComboBox
          Left = 308
          Top = 25
          Anchors = [akTop, akRight]
          Properties.ClearKey = 46
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'KOD'
          Properties.ListColumns = <
            item
              FieldName = 'KOD'
            end>
          Properties.ListOptions.AnsiSort = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListOptions.SyncMode = True
          Properties.ListSource = SRol2
          Style.BorderColor = 16744576
          Style.BorderStyle = ebsSingle
          Style.Color = clWhite
          Style.HotTrack = True
          Style.Shadow = False
          Style.TextColor = clBlue
          Style.TransparentBorder = True
          Style.ButtonStyle = btsDefault
          Style.ButtonTransparency = ebtNone
          StyleDisabled.BorderColor = clBtnShadow
          StyleDisabled.BorderStyle = ebsSingle
          StyleDisabled.ButtonStyle = btsDefault
          StyleFocused.BorderColor = clRed
          StyleFocused.BorderStyle = ebsSingle
          StyleFocused.Color = clWhite
          StyleFocused.TextColor = clRed
          StyleFocused.ButtonStyle = btsDefault
          StyleHot.BorderColor = clRed
          StyleHot.BorderStyle = ebsSingle
          StyleHot.TextColor = clRed
          TabOrder = 3
          Width = 184
        end
        object cxLookupComboBox3: TcxLookupComboBox
          Left = 494
          Top = 25
          Anchors = [akTop, akRight]
          Properties.ClearKey = 46
          Properties.DropDownAutoSize = True
          Properties.DropDownListStyle = lsFixedList
          Properties.KeyFieldNames = 'KOD'
          Properties.ListColumns = <
            item
              FieldName = 'KOD'
            end>
          Properties.ListOptions.AnsiSort = True
          Properties.ListOptions.ShowHeader = False
          Properties.ListOptions.SyncMode = True
          Properties.ListSource = SRol3
          Style.BorderColor = 16744576
          Style.BorderStyle = ebsSingle
          Style.Color = clWhite
          Style.HotTrack = True
          Style.Shadow = False
          Style.TextColor = clBlue
          Style.TransparentBorder = True
          Style.ButtonStyle = btsDefault
          Style.ButtonTransparency = ebtNone
          StyleDisabled.BorderColor = clBtnShadow
          StyleDisabled.BorderStyle = ebsSingle
          StyleDisabled.ButtonStyle = btsDefault
          StyleFocused.BorderColor = clRed
          StyleFocused.BorderStyle = ebsSingle
          StyleFocused.Color = clWhite
          StyleFocused.TextColor = clRed
          StyleFocused.ButtonStyle = btsDefault
          StyleHot.BorderColor = clRed
          StyleHot.BorderStyle = ebsSingle
          StyleHot.TextColor = clRed
          TabOrder = 4
          Width = 184
        end
        object cxLabel1: TcxLabel
          Tag = 419
          Left = 308
          Top = 3
          HelpType = htKeyword
          HelpKeyword = 'Panel6'
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'ROL 2'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 16744576
          Style.BorderStyle = ebsSingle
          Style.Color = clWhite
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.Shadow = False
          Style.TextColor = clBlack
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.BorderColor = 8404992
          StyleDisabled.BorderStyle = ebsOffice11
          StyleDisabled.Color = clMaroon
          StyleDisabled.TextColor = clBtnFace
          StyleFocused.BorderColor = clWindowFrame
          StyleFocused.BorderStyle = ebsNone
          StyleFocused.Color = clMaroon
          StyleFocused.TextColor = clBlack
          StyleHot.BorderColor = clWindowFrame
          StyleHot.BorderStyle = ebsNone
          StyleHot.Color = 9295612
          StyleHot.TextColor = clBlack
          StyleHot.TextStyle = []
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Depth = 1
          Transparent = True
          Height = 21
          Width = 184
          AnchorX = 400
          AnchorY = 14
        end
        object cxLabel2: TcxLabel
          Tag = 419
          Left = 494
          Top = 3
          HelpType = htKeyword
          HelpKeyword = 'Panel6'
          Anchors = [akTop, akRight]
          AutoSize = False
          Caption = 'ROL 3'
          ParentColor = False
          ParentFont = False
          Style.BorderColor = 16744576
          Style.BorderStyle = ebsSingle
          Style.Color = clWhite
          Style.Font.Charset = DEFAULT_CHARSET
          Style.Font.Color = clBlack
          Style.Font.Height = -11
          Style.Font.Name = 'MS Sans Serif'
          Style.Font.Style = []
          Style.HotTrack = False
          Style.Shadow = False
          Style.TextColor = clBlack
          Style.TextStyle = []
          Style.IsFontAssigned = True
          StyleDisabled.BorderColor = 8404992
          StyleDisabled.BorderStyle = ebsOffice11
          StyleDisabled.Color = clMaroon
          StyleDisabled.TextColor = clBtnFace
          StyleFocused.BorderColor = clWindowFrame
          StyleFocused.BorderStyle = ebsNone
          StyleFocused.Color = clMaroon
          StyleFocused.TextColor = clBlack
          StyleHot.BorderColor = clWindowFrame
          StyleHot.BorderStyle = ebsNone
          StyleHot.Color = 9295612
          StyleHot.TextColor = clBlack
          StyleHot.TextStyle = []
          Properties.Alignment.Horz = taCenter
          Properties.Alignment.Vert = taVCenter
          Properties.Depth = 1
          Transparent = True
          Height = 21
          Width = 184
          AnchorX = 586
          AnchorY = 14
        end
      end
    end
  end
  object CxIncele: TcxCheckBox
    Tag = 8
    Left = 898
    Top = 1
    Hint = 'PERS_KART_SICIL.MESLEK'
    Anchors = [akTop, akRight]
    Caption = 'A'#287'a'#231
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    Style.BorderColor = 15382169
    Style.BorderStyle = ebsSingle
    Style.Font.Charset = TURKISH_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -11
    Style.Font.Name = 'MS Sans Serif'
    Style.Font.Style = []
    Style.TextColor = clBlack
    Style.IsFontAssigned = True
    StyleFocused.BorderColor = clRed
    StyleFocused.BorderStyle = ebsSingle
    StyleFocused.TextColor = clRed
    StyleHot.BorderColor = clRed
    StyleHot.BorderStyle = ebsSingle
    StyleHot.TextColor = clBlue
    TabOrder = 1
    Transparent = True
  end
  object ComboBox1: TComboBox
    Left = 803
    Top = 1
    Width = 97
    Height = 21
    Anchors = [akTop, akRight]
    ItemIndex = 0
    TabOrder = 2
    Text = 'PERSONEL'
    Items.Strings = (
      'PERSONEL'
      'ADESE'
      'SEHA'
      'SELVA'
      'IMAS'
      'SELET'
      'IRENT'
      'HOLDING'
      'BELYA'
      'KULEYON'
      'ELITE'
      'INVITO'
      'AES'
      'PETROL'
      'AVUKAT'
      'BIL'
      'ALTIN')
  end
  object cxButton5: TcxButton
    Left = 978
    Top = 3
    Width = 20
    Height = 17
    Anchors = [akTop, akRight]
    Caption = 'X'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    OptionsImage.Spacing = 1
    TabOrder = 3
    Visible = False
    OnClick = cxButton5Click
  end
  object cxButton6: TcxButton
    Left = 955
    Top = 3
    Width = 20
    Height = 17
    Anchors = [akTop, akRight]
    Caption = '--'
    LookAndFeel.Kind = lfUltraFlat
    LookAndFeel.NativeStyle = False
    OptionsImage.Spacing = 1
    TabOrder = 4
    Visible = False
    OnClick = cxButton6Click
  end
  object PB1: TProgressBar
    Left = 499
    Top = 2
    Width = 237
    Height = 19
    Anchors = [akLeft, akTop, akBottom]
    Step = 1
    TabOrder = 6
    Visible = False
  end
  object dxDockSite2: TdxDockSite
    Left = 0
    Top = 0
    Width = 220
    Height = 580
    Cursor = crHandPoint
    Color = 16627622
    ManagerColor = False
    Align = alLeft
    AutoSize = True
    DockingType = 5
    OriginalWidth = 243
    OriginalHeight = 696
    object dxLayoutDockSite3: TdxLayoutDockSite
      Left = 0
      Top = 0
      Width = 220
      Height = 580
      DockingType = 0
      OriginalWidth = 220
      OriginalHeight = 200
    end
    object DockPanel: TdxDockPanel
      Left = 0
      Top = 0
      Width = 220
      Height = 580
      Color = 16440263
      ManagerColor = False
      AllowFloating = True
      AutoHide = False
      Caption = ' Rol Yetki A'#287'ac'#305
      CaptionButtons = [cbHide]
      CustomCaptionButtons.Buttons = <>
      TabsProperties.CustomButtons.Buttons = <>
      DockingType = 0
      OriginalWidth = 220
      OriginalHeight = 99
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 216
        Height = 556
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Color = 16758711
        TabOrder = 0
        object Label1: TLabel
          Left = 4
          Top = 5
          Width = 44
          Height = 13
          Caption = 'Rol A'#287'ac'#305
        end
        object DbRolTree: TdxDBTreeView
          Left = 70
          Top = 8
          Width = 109
          Height = 169
          ShowNodeHint = True
          DataSource = QSTree
          KeyField = 'ID'
          ListField = 'YETKI'
          ParentField = 'PARENT_ID'
          RootValue = Null
          SeparatedSt = ' - '
          RaiseOnError = True
          Indent = 19
          ParentColor = False
          Options = [trDBCanDelete, trDBConfirmDelete, trCanDBNavigate, trSmartRecordCopy, trCheckHasChildren]
          SelectedIndex = -1
          TabOrder = 0
          Visible = False
        end
        object RolTree: TTreeView
          Left = 2
          Top = 2
          Width = 212
          Height = 552
          Hint = 'Kullanicinin Sahip Oldugu Haklar'
          Align = alClient
          BorderStyle = bsNone
          Color = clWhite
          Font.Charset = TURKISH_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          Indent = 19
          ParentFont = False
          PopupMenu = PopupMenu1
          ReadOnly = True
          RightClickSelect = True
          RowSelect = True
          TabOrder = 1
        end
      end
    end
  end
  object TTree: TSQLMemTable
    CurrentVersion = '14.00 '
    StoreDefs = True
    DatabaseName = 'MEMORY'
    ReadOnly = False
    Active = True
    CaseInsensitive = False
    FieldDefs = <
      item
        Name = 'ROLADI'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'YETKIYOLU'
        DataType = ftString
        Size = 300
      end
      item
        Name = 'YETKI'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NOO'
        DataType = ftInteger
      end
      item
        Name = 'ONAY'
        DataType = ftString
        Size = 1
      end>
    TableName = 'YETKI'
    Exclusive = False
    MemoryTableAllocBy = 1000
    Left = 233
    Top = 262
    object TTreeROLADI: TStringField
      FieldName = 'ROLADI'
      Size = 200
    end
    object TTreeYETKIYOLU: TStringField
      FieldName = 'YETKIYOLU'
      Size = 300
    end
    object TTreeYETKI: TStringField
      FieldName = 'YETKI'
      Size = 50
    end
    object TTreeNOO: TIntegerField
      FieldName = 'NOO'
    end
    object TTreeONAY: TStringField
      FieldName = 'ONAY'
      Size = 1
    end
  end
  object STree: TDataSource
    DataSet = TTree
    Left = 265
    Top = 262
  end
  object QRol1: TOraQuery
    Session = dmGlobal.dbGlobal
    SQL.Strings = (
      'SELECT *FROM ROLLER WHERE TUR = '#39'B'#39'  ORDER BY KOD')
    Left = 238
    Top = 92
    object QRol1KOD: TStringField
      FieldName = 'KOD'
      Required = True
      Size = 60
    end
    object QRol1YETKI_0: TStringField
      FieldName = 'YETKI_0'
      Size = 255
    end
    object QRol1YETKI_1: TStringField
      FieldName = 'YETKI_1'
      Size = 255
    end
    object QRol1YETKI_2: TStringField
      FieldName = 'YETKI_2'
      Size = 255
    end
    object QRol1YETKI_3: TStringField
      FieldName = 'YETKI_3'
      Size = 255
    end
    object QRol1YETKI_4: TStringField
      FieldName = 'YETKI_4'
      Size = 255
    end
    object QRol1YETKI_5: TStringField
      FieldName = 'YETKI_5'
      Size = 255
    end
    object QRol1YETKI_6: TStringField
      FieldName = 'YETKI_6'
      Size = 255
    end
    object QRol1YETKI_7: TStringField
      FieldName = 'YETKI_7'
      Size = 255
    end
    object QRol1YETKI_8: TStringField
      FieldName = 'YETKI_8'
      Size = 255
    end
    object QRol1YETKI_9: TStringField
      FieldName = 'YETKI_9'
      Size = 255
    end
    object QRol1YETKI_A: TStringField
      FieldName = 'YETKI_A'
      Size = 255
    end
    object QRol1YETKI_B: TStringField
      FieldName = 'YETKI_B'
      Size = 255
    end
    object QRol1YETKI_C: TStringField
      FieldName = 'YETKI_C'
      Size = 255
    end
    object QRol1YETKI_D: TStringField
      FieldName = 'YETKI_D'
      Size = 255
    end
    object QRol1YETKI_E: TStringField
      FieldName = 'YETKI_E'
      Size = 255
    end
    object QRol1YETKI_F: TStringField
      FieldName = 'YETKI_F'
      Size = 255
    end
    object QRol1SDY: TIntegerField
      FieldName = 'SDY'
    end
    object QRol1SDT: TDateTimeField
      FieldName = 'SDT'
    end
    object QRol1YETKI_G: TStringField
      FieldName = 'YETKI_G'
      Size = 255
    end
    object QRol1YETKI_H: TStringField
      FieldName = 'YETKI_H'
      Size = 255
    end
    object QRol1YETKI_I: TStringField
      FieldName = 'YETKI_I'
      Size = 255
    end
    object QRol1YETKI_J: TStringField
      FieldName = 'YETKI_J'
      Size = 255
    end
    object QRol1YETKI_K: TStringField
      FieldName = 'YETKI_K'
      Size = 255
    end
    object QRol1YETKI_L: TStringField
      FieldName = 'YETKI_L'
      Size = 255
    end
    object QRol1YETKI_M: TStringField
      FieldName = 'YETKI_M'
      Size = 255
    end
    object QRol1YETKI_N: TStringField
      FieldName = 'YETKI_N'
      Size = 255
    end
    object QRol1YETKI_O: TStringField
      FieldName = 'YETKI_O'
      Size = 255
    end
    object QRol1YETKI_P: TStringField
      FieldName = 'YETKI_P'
      Size = 255
    end
    object QRol1YETKI_R: TStringField
      FieldName = 'YETKI_R'
      Size = 255
    end
    object QRol1YETKI_S: TStringField
      FieldName = 'YETKI_S'
      Size = 255
    end
    object QRol1YETKI_T: TStringField
      FieldName = 'YETKI_T'
      Size = 255
    end
    object QRol1YETKI_Y: TStringField
      FieldName = 'YETKI_Y'
      Size = 255
    end
    object QRol1YETKI_U: TStringField
      FieldName = 'YETKI_U'
      Size = 255
    end
    object QRol1YETKI_V: TStringField
      FieldName = 'YETKI_V'
      Size = 255
    end
    object QRol1YETKI_A1: TStringField
      FieldName = 'YETKI_A1'
      Size = 255
    end
    object QRol1YETKI_A2: TStringField
      FieldName = 'YETKI_A2'
      Size = 255
    end
    object QRol1YETKI_A3: TStringField
      FieldName = 'YETKI_A3'
      Size = 255
    end
    object QRol1YETKI_A4: TStringField
      FieldName = 'YETKI_A4'
      Size = 255
    end
    object QRol1YETKI_A5: TStringField
      FieldName = 'YETKI_A5'
      Size = 255
    end
    object QRol1YETKI_A6: TStringField
      FieldName = 'YETKI_A6'
      Size = 255
    end
    object QRol1YETKI_A7: TStringField
      FieldName = 'YETKI_A7'
      Size = 255
    end
    object QRol1YETKI_A8: TStringField
      FieldName = 'YETKI_A8'
      Size = 255
    end
    object QRol1YETKI_A9: TStringField
      FieldName = 'YETKI_A9'
      Size = 255
    end
    object QRol1YETKI_A10: TStringField
      FieldName = 'YETKI_A10'
      Size = 255
    end
    object QRol1YETKI_A11: TStringField
      FieldName = 'YETKI_A11'
      Size = 255
    end
    object QRol1YETKI_A12: TStringField
      FieldName = 'YETKI_A12'
      Size = 255
    end
    object QRol1YETKI_A13: TStringField
      FieldName = 'YETKI_A13'
      Size = 255
    end
    object QRol1YETKI_A14: TStringField
      FieldName = 'YETKI_A14'
      Size = 255
    end
    object QRol1YETKI_A15: TStringField
      FieldName = 'YETKI_A15'
      Size = 255
    end
    object QRol1YETKI_A16: TStringField
      FieldName = 'YETKI_A16'
      Size = 255
    end
    object QRol1YETKI_A17: TStringField
      FieldName = 'YETKI_A17'
      Size = 255
    end
    object QRol1YETKI_A18: TStringField
      FieldName = 'YETKI_A18'
      Size = 255
    end
    object QRol1YETKI_A19: TStringField
      FieldName = 'YETKI_A19'
      Size = 255
    end
    object QRol1YETKI_A20: TStringField
      FieldName = 'YETKI_A20'
      Size = 255
    end
    object QRol1YETKI_A21: TStringField
      FieldName = 'YETKI_A21'
      Size = 255
    end
    object QRol1YETKI_A22: TStringField
      FieldName = 'YETKI_A22'
      Size = 255
    end
    object QRol1YETKI_A23: TStringField
      FieldName = 'YETKI_A23'
      Size = 255
    end
    object QRol1YETKI_A24: TStringField
      FieldName = 'YETKI_A24'
      Size = 255
    end
    object QRol1YETKI_A25: TStringField
      FieldName = 'YETKI_A25'
      Size = 255
    end
    object QRol1YETKI_A26: TStringField
      FieldName = 'YETKI_A26'
      Size = 255
    end
    object QRol1YETKI_A27: TStringField
      FieldName = 'YETKI_A27'
      Size = 255
    end
    object QRol1YETKI_A28: TStringField
      FieldName = 'YETKI_A28'
      Size = 255
    end
    object QRol1YETKI_A29: TStringField
      FieldName = 'YETKI_A29'
      Size = 255
    end
    object QRol1YETKI_A30: TStringField
      FieldName = 'YETKI_A30'
      Size = 255
    end
    object QRol1TUR: TStringField
      FieldName = 'TUR'
      Size = 2
    end
  end
  object SRol1: TDataSource
    DataSet = QRol1
    Left = 266
    Top = 92
  end
  object cxStyleRepository1: TcxStyleRepository
    Scalable = True
    Left = 500
    Top = 164
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle2: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16247513
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
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
      Color = 14811135
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
      TextColor = clNavy
    end
    object cxStyle7: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 14872561
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle8: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 16758711
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle9: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 12937777
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clWhite
    end
    object cxStyle10: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle11: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 4707838
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clBlack
    end
    object cxStyle12: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = 15451300
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
    end
    object cxStyle13: TcxStyle
      AssignedValues = [svColor, svFont, svTextColor]
      Color = 14811135
      Font.Charset = TURKISH_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      TextColor = clNavy
    end
    object cxStyle14: TcxStyle
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
      Styles.Content = cxStyle2
      Styles.ContentEven = cxStyle3
      Styles.ContentOdd = cxStyle4
      Styles.FilterBox = cxStyle5
      Styles.Inactive = cxStyle10
      Styles.IncSearch = cxStyle11
      Styles.Selection = cxStyle14
      Styles.Footer = cxStyle6
      Styles.Group = cxStyle7
      Styles.GroupByBox = cxStyle8
      Styles.Indicator = cxStyle12
      Styles.Preview = cxStyle13
      BuiltIn = True
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 146
    Top = 150
    object Grupla1: TMenuItem
      Caption = 'Grupla'
      OnClick = Grupla1Click
    end
    object ExcelKaydet1: TMenuItem
      Caption = 'Excel Kaydet'
      OnClick = ExcelKaydet1Click
    end
    object Kapat1: TMenuItem
      Caption = 'Kapat'
      ShortCut = 16472
      OnClick = Kapat1Click
    end
  end
  object QRol2: TOraQuery
    Session = dmGlobal.dbGlobal
    SQL.Strings = (
      'SELECT * FROM ROLLER WHERE TUR = '#39'B'#39' ORDER BY KOD')
    Left = 239
    Top = 145
    object QRol2KOD: TStringField
      FieldName = 'KOD'
      Required = True
      Size = 60
    end
    object QRol2YETKI_0: TStringField
      FieldName = 'YETKI_0'
      Size = 255
    end
    object QRol2YETKI_1: TStringField
      FieldName = 'YETKI_1'
      Size = 255
    end
    object QRol2YETKI_2: TStringField
      FieldName = 'YETKI_2'
      Size = 255
    end
    object QRol2YETKI_3: TStringField
      FieldName = 'YETKI_3'
      Size = 255
    end
    object QRol2YETKI_4: TStringField
      FieldName = 'YETKI_4'
      Size = 255
    end
    object QRol2YETKI_5: TStringField
      FieldName = 'YETKI_5'
      Size = 255
    end
    object QRol2YETKI_6: TStringField
      FieldName = 'YETKI_6'
      Size = 255
    end
    object QRol2YETKI_7: TStringField
      FieldName = 'YETKI_7'
      Size = 255
    end
    object QRol2YETKI_8: TStringField
      FieldName = 'YETKI_8'
      Size = 255
    end
    object QRol2YETKI_9: TStringField
      FieldName = 'YETKI_9'
      Size = 255
    end
    object QRol2YETKI_A: TStringField
      FieldName = 'YETKI_A'
      Size = 255
    end
    object QRol2YETKI_B: TStringField
      FieldName = 'YETKI_B'
      Size = 255
    end
    object QRol2YETKI_C: TStringField
      FieldName = 'YETKI_C'
      Size = 255
    end
    object QRol2YETKI_D: TStringField
      FieldName = 'YETKI_D'
      Size = 255
    end
    object QRol2YETKI_E: TStringField
      FieldName = 'YETKI_E'
      Size = 255
    end
    object QRol2YETKI_F: TStringField
      FieldName = 'YETKI_F'
      Size = 255
    end
    object QRol2SDY: TIntegerField
      FieldName = 'SDY'
    end
    object QRol2SDT: TDateTimeField
      FieldName = 'SDT'
    end
    object QRol2YETKI_G: TStringField
      FieldName = 'YETKI_G'
      Size = 255
    end
    object QRol2YETKI_H: TStringField
      FieldName = 'YETKI_H'
      Size = 255
    end
    object QRol2YETKI_I: TStringField
      FieldName = 'YETKI_I'
      Size = 255
    end
    object QRol2YETKI_J: TStringField
      FieldName = 'YETKI_J'
      Size = 255
    end
    object QRol2YETKI_K: TStringField
      FieldName = 'YETKI_K'
      Size = 255
    end
    object QRol2YETKI_L: TStringField
      FieldName = 'YETKI_L'
      Size = 255
    end
    object QRol2YETKI_M: TStringField
      FieldName = 'YETKI_M'
      Size = 255
    end
    object QRol2YETKI_N: TStringField
      FieldName = 'YETKI_N'
      Size = 255
    end
    object QRol2YETKI_O: TStringField
      FieldName = 'YETKI_O'
      Size = 255
    end
    object QRol2YETKI_P: TStringField
      FieldName = 'YETKI_P'
      Size = 255
    end
    object QRol2YETKI_R: TStringField
      FieldName = 'YETKI_R'
      Size = 255
    end
    object QRol2YETKI_S: TStringField
      FieldName = 'YETKI_S'
      Size = 255
    end
    object QRol2YETKI_T: TStringField
      FieldName = 'YETKI_T'
      Size = 255
    end
    object QRol2YETKI_Y: TStringField
      FieldName = 'YETKI_Y'
      Size = 255
    end
    object QRol2YETKI_U: TStringField
      FieldName = 'YETKI_U'
      Size = 255
    end
    object QRol2YETKI_V: TStringField
      FieldName = 'YETKI_V'
      Size = 255
    end
    object QRol2YETKI_A1: TStringField
      FieldName = 'YETKI_A1'
      Size = 255
    end
    object QRol2YETKI_A2: TStringField
      FieldName = 'YETKI_A2'
      Size = 255
    end
    object QRol2YETKI_A3: TStringField
      FieldName = 'YETKI_A3'
      Size = 255
    end
    object QRol2YETKI_A4: TStringField
      FieldName = 'YETKI_A4'
      Size = 255
    end
    object QRol2YETKI_A5: TStringField
      FieldName = 'YETKI_A5'
      Size = 255
    end
    object QRol2YETKI_A6: TStringField
      FieldName = 'YETKI_A6'
      Size = 255
    end
    object QRol2YETKI_A7: TStringField
      FieldName = 'YETKI_A7'
      Size = 255
    end
    object QRol2YETKI_A8: TStringField
      FieldName = 'YETKI_A8'
      Size = 255
    end
    object QRol2YETKI_A9: TStringField
      FieldName = 'YETKI_A9'
      Size = 255
    end
    object QRol2YETKI_A10: TStringField
      FieldName = 'YETKI_A10'
      Size = 255
    end
    object QRol2YETKI_A11: TStringField
      FieldName = 'YETKI_A11'
      Size = 255
    end
    object QRol2YETKI_A12: TStringField
      FieldName = 'YETKI_A12'
      Size = 255
    end
    object QRol2YETKI_A13: TStringField
      FieldName = 'YETKI_A13'
      Size = 255
    end
    object QRol2YETKI_A14: TStringField
      FieldName = 'YETKI_A14'
      Size = 255
    end
    object QRol2YETKI_A15: TStringField
      FieldName = 'YETKI_A15'
      Size = 255
    end
    object QRol2YETKI_A16: TStringField
      FieldName = 'YETKI_A16'
      Size = 255
    end
    object QRol2YETKI_A17: TStringField
      FieldName = 'YETKI_A17'
      Size = 255
    end
    object QRol2YETKI_A18: TStringField
      FieldName = 'YETKI_A18'
      Size = 255
    end
    object QRol2YETKI_A19: TStringField
      FieldName = 'YETKI_A19'
      Size = 255
    end
    object QRol2YETKI_A20: TStringField
      FieldName = 'YETKI_A20'
      Size = 255
    end
    object QRol2YETKI_A21: TStringField
      FieldName = 'YETKI_A21'
      Size = 255
    end
    object QRol2YETKI_A22: TStringField
      FieldName = 'YETKI_A22'
      Size = 255
    end
    object QRol2YETKI_A23: TStringField
      FieldName = 'YETKI_A23'
      Size = 255
    end
    object QRol2YETKI_A24: TStringField
      FieldName = 'YETKI_A24'
      Size = 255
    end
    object QRol2YETKI_A25: TStringField
      FieldName = 'YETKI_A25'
      Size = 255
    end
    object QRol2YETKI_A26: TStringField
      FieldName = 'YETKI_A26'
      Size = 255
    end
    object QRol2YETKI_A27: TStringField
      FieldName = 'YETKI_A27'
      Size = 255
    end
    object QRol2YETKI_A28: TStringField
      FieldName = 'YETKI_A28'
      Size = 255
    end
    object QRol2YETKI_A29: TStringField
      FieldName = 'YETKI_A29'
      Size = 255
    end
    object QRol2YETKI_A30: TStringField
      FieldName = 'YETKI_A30'
      Size = 255
    end
    object QRol2TUR: TStringField
      FieldName = 'TUR'
      Size = 2
    end
  end
  object SRol2: TDataSource
    DataSet = QRol2
    Left = 267
    Top = 147
  end
  object QRol3: TOraQuery
    Session = dmGlobal.dbGlobal
    SQL.Strings = (
      'SELECT *FROM ROLLER WHERE TUR = '#39'B'#39' ORDER BY KOD')
    Left = 238
    Top = 206
    object QRol3KOD: TStringField
      FieldName = 'KOD'
      Required = True
      Size = 60
    end
    object QRol3YETKI_0: TStringField
      FieldName = 'YETKI_0'
      Size = 255
    end
    object QRol3YETKI_1: TStringField
      FieldName = 'YETKI_1'
      Size = 255
    end
    object QRol3YETKI_2: TStringField
      FieldName = 'YETKI_2'
      Size = 255
    end
    object QRol3YETKI_3: TStringField
      FieldName = 'YETKI_3'
      Size = 255
    end
    object QRol3YETKI_4: TStringField
      FieldName = 'YETKI_4'
      Size = 255
    end
    object QRol3YETKI_5: TStringField
      FieldName = 'YETKI_5'
      Size = 255
    end
    object QRol3YETKI_6: TStringField
      FieldName = 'YETKI_6'
      Size = 255
    end
    object QRol3YETKI_7: TStringField
      FieldName = 'YETKI_7'
      Size = 255
    end
    object QRol3YETKI_8: TStringField
      FieldName = 'YETKI_8'
      Size = 255
    end
    object QRol3YETKI_9: TStringField
      FieldName = 'YETKI_9'
      Size = 255
    end
    object QRol3YETKI_A: TStringField
      FieldName = 'YETKI_A'
      Size = 255
    end
    object QRol3YETKI_B: TStringField
      FieldName = 'YETKI_B'
      Size = 255
    end
    object QRol3YETKI_C: TStringField
      FieldName = 'YETKI_C'
      Size = 255
    end
    object QRol3YETKI_D: TStringField
      FieldName = 'YETKI_D'
      Size = 255
    end
    object QRol3YETKI_E: TStringField
      FieldName = 'YETKI_E'
      Size = 255
    end
    object QRol3YETKI_F: TStringField
      FieldName = 'YETKI_F'
      Size = 255
    end
    object QRol3SDY: TIntegerField
      FieldName = 'SDY'
    end
    object QRol3SDT: TDateTimeField
      FieldName = 'SDT'
    end
    object QRol3YETKI_G: TStringField
      FieldName = 'YETKI_G'
      Size = 255
    end
    object QRol3YETKI_H: TStringField
      FieldName = 'YETKI_H'
      Size = 255
    end
    object QRol3YETKI_I: TStringField
      FieldName = 'YETKI_I'
      Size = 255
    end
    object QRol3YETKI_J: TStringField
      FieldName = 'YETKI_J'
      Size = 255
    end
    object QRol3YETKI_K: TStringField
      FieldName = 'YETKI_K'
      Size = 255
    end
    object QRol3YETKI_L: TStringField
      FieldName = 'YETKI_L'
      Size = 255
    end
    object QRol3YETKI_M: TStringField
      FieldName = 'YETKI_M'
      Size = 255
    end
    object QRol3YETKI_N: TStringField
      FieldName = 'YETKI_N'
      Size = 255
    end
    object QRol3YETKI_O: TStringField
      FieldName = 'YETKI_O'
      Size = 255
    end
    object QRol3YETKI_P: TStringField
      FieldName = 'YETKI_P'
      Size = 255
    end
    object QRol3YETKI_R: TStringField
      FieldName = 'YETKI_R'
      Size = 255
    end
    object QRol3YETKI_S: TStringField
      FieldName = 'YETKI_S'
      Size = 255
    end
    object QRol3YETKI_T: TStringField
      FieldName = 'YETKI_T'
      Size = 255
    end
    object QRol3YETKI_Y: TStringField
      FieldName = 'YETKI_Y'
      Size = 255
    end
    object QRol3YETKI_U: TStringField
      FieldName = 'YETKI_U'
      Size = 255
    end
    object QRol3YETKI_V: TStringField
      FieldName = 'YETKI_V'
      Size = 255
    end
    object QRol3YETKI_A1: TStringField
      FieldName = 'YETKI_A1'
      Size = 255
    end
    object QRol3YETKI_A2: TStringField
      FieldName = 'YETKI_A2'
      Size = 255
    end
    object QRol3YETKI_A3: TStringField
      FieldName = 'YETKI_A3'
      Size = 255
    end
    object QRol3YETKI_A4: TStringField
      FieldName = 'YETKI_A4'
      Size = 255
    end
    object QRol3YETKI_A5: TStringField
      FieldName = 'YETKI_A5'
      Size = 255
    end
    object QRol3YETKI_A6: TStringField
      FieldName = 'YETKI_A6'
      Size = 255
    end
    object QRol3YETKI_A7: TStringField
      FieldName = 'YETKI_A7'
      Size = 255
    end
    object QRol3YETKI_A8: TStringField
      FieldName = 'YETKI_A8'
      Size = 255
    end
    object QRol3YETKI_A9: TStringField
      FieldName = 'YETKI_A9'
      Size = 255
    end
    object QRol3YETKI_A10: TStringField
      FieldName = 'YETKI_A10'
      Size = 255
    end
    object QRol3YETKI_A11: TStringField
      FieldName = 'YETKI_A11'
      Size = 255
    end
    object QRol3YETKI_A12: TStringField
      FieldName = 'YETKI_A12'
      Size = 255
    end
    object QRol3YETKI_A13: TStringField
      FieldName = 'YETKI_A13'
      Size = 255
    end
    object QRol3YETKI_A14: TStringField
      FieldName = 'YETKI_A14'
      Size = 255
    end
    object QRol3YETKI_A15: TStringField
      FieldName = 'YETKI_A15'
      Size = 255
    end
    object QRol3YETKI_A16: TStringField
      FieldName = 'YETKI_A16'
      Size = 255
    end
    object QRol3YETKI_A17: TStringField
      FieldName = 'YETKI_A17'
      Size = 255
    end
    object QRol3YETKI_A18: TStringField
      FieldName = 'YETKI_A18'
      Size = 255
    end
    object QRol3YETKI_A19: TStringField
      FieldName = 'YETKI_A19'
      Size = 255
    end
    object QRol3YETKI_A20: TStringField
      FieldName = 'YETKI_A20'
      Size = 255
    end
    object QRol3YETKI_A21: TStringField
      FieldName = 'YETKI_A21'
      Size = 255
    end
    object QRol3YETKI_A22: TStringField
      FieldName = 'YETKI_A22'
      Size = 255
    end
    object QRol3YETKI_A23: TStringField
      FieldName = 'YETKI_A23'
      Size = 255
    end
    object QRol3YETKI_A24: TStringField
      FieldName = 'YETKI_A24'
      Size = 255
    end
    object QRol3YETKI_A25: TStringField
      FieldName = 'YETKI_A25'
      Size = 255
    end
    object QRol3YETKI_A26: TStringField
      FieldName = 'YETKI_A26'
      Size = 255
    end
    object QRol3YETKI_A27: TStringField
      FieldName = 'YETKI_A27'
      Size = 255
    end
    object QRol3YETKI_A28: TStringField
      FieldName = 'YETKI_A28'
      Size = 255
    end
    object QRol3YETKI_A29: TStringField
      FieldName = 'YETKI_A29'
      Size = 255
    end
    object QRol3YETKI_A30: TStringField
      FieldName = 'YETKI_A30'
      Size = 255
    end
    object QRol3TUR: TStringField
      FieldName = 'TUR'
      Size = 2
    end
  end
  object SRol3: TDataSource
    DataSet = QRol3
    Left = 266
    Top = 206
  end
  object SKiyas: TDataSource
    DataSet = TKiyas
    Left = 264
    Top = 312
  end
  object TKiyas: TSQLMemTable
    CurrentVersion = '14.00 '
    StoreDefs = True
    DatabaseName = 'MEMORY'
    ReadOnly = False
    Active = True
    CaseInsensitive = False
    FieldDefs = <
      item
        Name = 'ROLADI'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'YETKIYOLU'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'YETKI'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'NO'
        DataType = ftInteger
      end
      item
        Name = 'ONAY_1'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ONAY_2'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'ONAY_3'
        DataType = ftString
        Size = 1
      end>
    TableName = 'KIYAS'
    Exclusive = False
    MemoryTableAllocBy = 1000
    Left = 236
    Top = 312
    object TKiyasROLADI: TStringField
      FieldName = 'ROLADI'
      Size = 100
    end
    object TKiyasYETKIYOLU: TStringField
      FieldName = 'YETKIYOLU'
      Size = 200
    end
    object TKiyasYETKI: TStringField
      FieldName = 'YETKI'
      Size = 50
    end
    object TKiyasNO: TIntegerField
      FieldName = 'NO'
    end
    object TKiyasONAY_1: TStringField
      FieldName = 'ONAY_1'
      Size = 1
    end
    object TKiyasONAY_2: TStringField
      FieldName = 'ONAY_2'
      Size = 1
    end
    object TKiyasONAY_3: TStringField
      FieldName = 'ONAY_3'
      Size = 1
    end
  end
  object QTree: TOraQuery
    Session = dmGlobal.dbGlobal
    SQL.Strings = (
      'SELECT TANIM_YETKI.*,'#39'PARENT'#39' AS STATE,'
      '     CASE WHEN YETKI_NO = 0 THEN YETKI_ACIKLAMA ELSE '
      
        '             '#39'('#39'||DECODE(LENGTH(YETKI_NO),1,'#39'000'#39',2,'#39'00'#39',3,'#39'0'#39')|' +
        '|YETKI_NO||'#39') '#39'||YETKI_ACIKLAMA '
      '             END AS YETKI '
      '  FROM TANIM_YETKI WHERE TUR =:TUR'
      '')
    CachedUpdates = True
    AutoCalcFields = False
    BeforeOpen = QTreeBeforeOpen
    Left = 51
    Top = 260
    ParamData = <
      item
        DataType = ftString
        Name = 'TUR'
        Value = 'P'
      end>
    object QTreeID: TFloatField
      FieldName = 'ID'
    end
    object QTreePARENT_ID: TFloatField
      FieldName = 'PARENT_ID'
    end
    object QTreeYETKI_NO: TIntegerField
      FieldName = 'YETKI_NO'
    end
    object QTreeYETKI_ACIKLAMA: TStringField
      FieldName = 'YETKI_ACIKLAMA'
      Size = 50
    end
    object QTreeTUR: TStringField
      FieldName = 'TUR'
      Size = 2
    end
    object QTreeSDY: TIntegerField
      FieldName = 'SDY'
    end
    object QTreeSDT: TDateTimeField
      FieldName = 'SDT'
    end
    object QTreeSTATE: TStringField
      FieldName = 'STATE'
      FixedChar = True
      Size = 6
    end
    object QTreeYETKI: TStringField
      FieldName = 'YETKI'
      Size = 96
    end
  end
  object QSTree: TDataSource
    AutoEdit = False
    DataSet = QTree
    Left = 84
    Top = 264
  end
  object QYetki: TSQLMemQuery
    CurrentVersion = '14.00 '
    DatabaseName = 'MEMORY'
    ReadOnly = True
    CaseInsensitive = False
    SQL.Text = 'SELECT *FROM YETKI '#13#10
    Left = 447
    Top = 96
    object QYetkiROLADI: TStringField
      FieldName = 'ROLADI'
      Size = 200
    end
    object QYetkiYETKIYOLU: TStringField
      FieldName = 'YETKIYOLU'
      Size = 300
    end
    object QYetkiYETKI: TStringField
      FieldName = 'YETKI'
      Size = 50
    end
    object QYetkiNOO: TIntegerField
      FieldName = 'NOO'
    end
    object QYetkiONAY: TStringField
      FieldName = 'ONAY'
      Size = 1
    end
  end
  object QSYetki: TDataSource
    AutoEdit = False
    DataSet = QYetki
    Left = 495
    Top = 98
  end
  object Artist: TActionList
    Left = 792
    Top = 95
    object actSorgula: TAction
      Caption = '&Sorgula'
      Enabled = False
      OnExecute = actSorgulaExecute
    end
    object actTemizle: TAction
      Caption = '&Temizle'
      Enabled = False
      OnExecute = actTemizleExecute
    end
    object actKaydet: TAction
      Caption = '&Kaydet'
      OnExecute = actKaydetExecute
    end
  end
  object QryStructP: TKDBStructure
    DMEButtons = [dmbOpenSave]
    SEHelpContext = 0
    SQLFormats.Date = 'dd.MM.yyyy'
    SQLFormats.Time = 'hh:mm'
    SQLFormats.DateTime = 'dd.MM.yyyy hh:mm'
    SQLFormats.FalseValue = 'false'
    SQLFormats.TrueValue = 'true'
    SQLFormats.FullTableName = 'KIYAS'
    SQLFormats.LowerFunc = 'LOWER'
    SQLFormats.WildcardChar = '%'
    DatabaseInfo = dmGlobal.BDEInfo
    AutoAddFields = False
    DefOperators.Strings = (
      'Equal=='
      'NotEqual=<>'
      'LessThan=<'
      'LessOrEqual=<='
      'GreaterThan=>'
      'GreaterOrEqual=>='
      'IsNull=BO'#350
      'InList=L'#304'STEDE OLAN'
      'NotInList=L'#304'STEDE OLMAYAN'
      'StartsWith=... '#304'LE BA'#350'LAYAN'
      'NotStartsWith=... '#304'LE BA'#350'LAMAYAN'
      'Contains=... '#304#199'EREN'
      'NotContains=... '#304#199'ERMEYEN'
      'Between=ARALIKTA OLAN'
      'NotBetween=ARALIKTA OLMAYAN')
    ExOperators = [xoInList, xoBetween, xoStartsWith, xoContains]
    Left = 462
    Top = 246
    Struct = (
      '[Main]'
      'Version=3.6'
      'OperatCount=15'
      'TableCount=1'
      'FieldCount=5'
      'CondCount=0'
      'FieldGroups=1'
      'DefaultMainTable='
      'RootFieldsFirst=0'
      ' '
      '[Operator:1]'
      'Name=Equal'
      'DisplayName=='
      'SQLName=@f = '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:2]'
      'Name=NotEqual'
      'DisplayName=<>'
      'SQLName=@f <> '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:3]'
      'Name=LessThan'
      'DisplayName=<'
      'SQLName=@f < '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:4]'
      'Name=LessOrEqual'
      'DisplayName=<='
      'SQLName=@f <= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:5]'
      'Name=GreaterThan'
      'DisplayName=>'
      'SQLName=@f >'#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:6]'
      'Name=GreaterOrEqual'
      'DisplayName=>='
      'SQLName=@f >= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:7]'
      'Name=IsNull'
      'DisplayName=BO'#350
      'SQLName=@f is null'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftMemo,f' +
        'tFmtMemo,ftFixedChar,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:8]'
      'Name=InList'
      'DisplayName=L'#304'STEDE OLAN'
      'SQLName=@f in (@1)'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:9]'
      'Name=NotInList'
      'DisplayName=L'#304'STEDE OLMAYAN'
      'SQLName=NOT (@f in (@1))'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:10]'
      'Name=StartsWith'
      'DisplayName=... '#304'LE BA'#350'LAYAN'
      'SQLName=@f like '#39'@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:11]'
      'Name=NotStartsWith'
      'DisplayName=... '#304'LE BA'#350'LAMAYAN'
      'SQLName=not(@f like '#39'@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:12]'
      'Name=Contains'
      'DisplayName=... '#304#199'EREN'
      'SQLName=@f like '#39'%@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:13]'
      'Name=NotContains'
      'DisplayName=... '#304#199'ERMEYEN'
      'SQLName=not(@f like '#39'%@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:14]'
      'Name=Between'
      'DisplayName=ARALIKTA OLAN'
      'SQLName=@f between '#39'@1'#39' and '#39'@2'#39
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:15]'
      'Name=NotBetween'
      'DisplayName=ARALIKTA OLMAYAN'
      'SQLName=NOT (@f between '#39'@1'#39' and '#39'@2'#39')'
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Table:1]'
      'DBName=ErpConnection'
      'Name=YETKI'
      'DisplayName=YETKI'
      'Alias='
      'Quoted=0'
      'Hints='
      'DsgnPos=150,0,110,160'
      'Links='
      ' '
      '[Field:1]'
      'ID=1'
      'Kind=kfkData'
      'FieldExpr=ROLADI'
      'DisplayName=Rol Ad'#305
      'TableAlias='
      'EditType=4'
      'FieldType=1'
      'FieldSize=100'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      'Operators=Equal,NotEqual,InList,NotInList'
      ''
      '[Field:1.SQL]'
      'SELECT KOD,KOD AS KODL FROM ROLLER WHERE TUR = '#39'P'#39' '
      'ORDER BY KOD'
      ' '
      '[Field:2]'
      'ID=2'
      'Kind=kfkData'
      'FieldExpr=YETKIYOLU'
      'DisplayName=Yetki Yolu'
      'TableAlias='
      'EditType=0'
      'FieldType=1'
      'FieldSize=400'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:3]'
      'ID=5'
      'Kind=kfkData'
      'FieldExpr=ONAY'
      'DisplayName=Onay'
      'TableAlias='
      'EditType=2'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      'Items=Evet,Hay'#305'r'
      'Values=E,H'
      ' '
      '[Field:4]'
      'ID=6'
      'Kind=kfkData'
      'FieldExpr=YETKI'
      'DisplayName=Yetki A'#231#305'klama'
      'TableAlias='
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:5]'
      'ID=7'
      'Kind=kfkData'
      'FieldExpr=NOO'
      'DisplayName=Yetki No'
      'TableAlias='
      'EditType=0'
      'FieldType=3'
      'FieldSize=7'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[FieldGroup1]'
      'GroupName=Kriterler'
      'Fields=1,2,6,7,5'
      ' '
      '[RootGroup]'
      'Fields=')
  end
  object QryStructB: TKDBStructure
    DMEButtons = [dmbOpenSave]
    SEHelpContext = 0
    SQLFormats.Date = 'dd.MM.yyyy'
    SQLFormats.Time = 'hh:mm'
    SQLFormats.DateTime = 'dd.MM.yyyy hh:mm'
    SQLFormats.FalseValue = 'false'
    SQLFormats.TrueValue = 'true'
    SQLFormats.FullTableName = 'KIYAS'
    SQLFormats.LowerFunc = 'LOWER'
    SQLFormats.WildcardChar = '%'
    DatabaseInfo = dmGlobal.BDEInfo
    AutoAddFields = False
    DefOperators.Strings = (
      'Equal=='
      'NotEqual=<>'
      'LessThan=<'
      'LessOrEqual=<='
      'GreaterThan=>'
      'GreaterOrEqual=>='
      'IsNull=BO'#350
      'InList=L'#304'STEDE OLAN'
      'NotInList=L'#304'STEDE OLMAYAN'
      'StartsWith=... '#304'LE BA'#350'LAYAN'
      'NotStartsWith=... '#304'LE BA'#350'LAMAYAN'
      'Contains=... '#304#199'EREN'
      'NotContains=... '#304#199'ERMEYEN'
      'Between=ARALIKTA OLAN'
      'NotBetween=ARALIKTA OLMAYAN')
    ExOperators = [xoInList, xoBetween, xoStartsWith, xoContains]
    Left = 402
    Top = 250
    Struct = (
      '[Main]'
      'Version=3.6'
      'OperatCount=15'
      'TableCount=1'
      'FieldCount=5'
      'CondCount=0'
      'FieldGroups=1'
      'DefaultMainTable='
      'RootFieldsFirst=0'
      ' '
      '[Operator:1]'
      'Name=Equal'
      'DisplayName=='
      'SQLName=@f = '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:2]'
      'Name=NotEqual'
      'DisplayName=<>'
      'SQLName=@f <> '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:3]'
      'Name=LessThan'
      'DisplayName=<'
      'SQLName=@f < '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:4]'
      'Name=LessOrEqual'
      'DisplayName=<='
      'SQLName=@f <= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:5]'
      'Name=GreaterThan'
      'DisplayName=>'
      'SQLName=@f >'#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:6]'
      'Name=GreaterOrEqual'
      'DisplayName=>='
      'SQLName=@f >= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:7]'
      'Name=IsNull'
      'DisplayName=BO'#350
      'SQLName=@f is null'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftMemo,f' +
        'tFmtMemo,ftFixedChar,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:8]'
      'Name=InList'
      'DisplayName=L'#304'STEDE OLAN'
      'SQLName=@f in (@1)'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:9]'
      'Name=NotInList'
      'DisplayName=L'#304'STEDE OLMAYAN'
      'SQLName=NOT (@f in (@1))'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:10]'
      'Name=StartsWith'
      'DisplayName=... '#304'LE BA'#350'LAYAN'
      'SQLName=@f like '#39'@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:11]'
      'Name=NotStartsWith'
      'DisplayName=... '#304'LE BA'#350'LAMAYAN'
      'SQLName=not(@f like '#39'@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:12]'
      'Name=Contains'
      'DisplayName=... '#304#199'EREN'
      'SQLName=@f like '#39'%@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:13]'
      'Name=NotContains'
      'DisplayName=... '#304#199'ERMEYEN'
      'SQLName=not(@f like '#39'%@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:14]'
      'Name=Between'
      'DisplayName=ARALIKTA OLAN'
      'SQLName=@f between '#39'@1'#39' and '#39'@2'#39
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:15]'
      'Name=NotBetween'
      'DisplayName=ARALIKTA OLMAYAN'
      'SQLName=NOT (@f between '#39'@1'#39' and '#39'@2'#39')'
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Table:1]'
      'DBName=ErpConnection'
      'Name=YETKI'
      'DisplayName=YETKI'
      'Alias=YETKI'
      'Quoted=0'
      'Hints='
      'DsgnPos=150,0,110,160'
      'Links='
      ' '
      '[Field:1]'
      'ID=1'
      'Kind=kfkData'
      'FieldExpr=ROLADI'
      'DisplayName=Rol Ad'#305
      'TableAlias=YETKI'
      'EditType=4'
      'FieldType=1'
      'FieldSize=100'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      'Operators=Equal,NotEqual,InList,NotInList'
      ''
      '[Field:1.SQL]'
      'SELECT KOD,KOD AS KODL FROM ROLLER WHERE TUR '
      '<> '#39'P'#39' ORDER BY KOD'
      ' '
      '[Field:2]'
      'ID=2'
      'Kind=kfkData'
      'FieldExpr=YETKIYOLU'
      'DisplayName=Yetki Yolu'
      'TableAlias=YETKI'
      'EditType=0'
      'FieldType=1'
      'FieldSize=400'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:3]'
      'ID=3'
      'Kind=kfkData'
      'FieldExpr=YETKI'
      'DisplayName=Yetki A'#231#305'klama'
      'TableAlias=YETKI'
      'EditType=0'
      'FieldType=1'
      'FieldSize=200'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:4]'
      'ID=5'
      'Kind=kfkData'
      'FieldExpr=ONAY'
      'DisplayName=Onay'
      'TableAlias=YETKI'
      'EditType=2'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      'Items=Evet,Hay'#305'r'
      'Values=E,H'
      ' '
      '[Field:5]'
      'ID=6'
      'Kind=kfkData'
      'FieldExpr=NOO'
      'DisplayName=Yetki No'
      'TableAlias=YETKI'
      'EditType=0'
      'FieldType=3'
      'FieldSize=7'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[FieldGroup1]'
      'GroupName=Kriterler'
      'Fields=1,2,3,6,5'
      ' '
      '[RootGroup]'
      'Fields=')
  end
  object dxDockingManager1: TdxDockingManager
    Color = clBtnFace
    DefaultHorizContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultHorizContainerSiteProperties.Dockable = True
    DefaultHorizContainerSiteProperties.ImageIndex = -1
    DefaultVertContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultVertContainerSiteProperties.Dockable = True
    DefaultVertContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.CustomCaptionButtons.Buttons = <>
    DefaultTabContainerSiteProperties.Dockable = True
    DefaultTabContainerSiteProperties.ImageIndex = -1
    DefaultTabContainerSiteProperties.TabsProperties.CustomButtons.Buttons = <>
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    LookAndFeel.Kind = lfOffice11
    LookAndFeel.NativeStyle = False
    Options = [doActivateAfterDocking, doDblClickDocking, doFloatingOnTop, doTabContainerHasCaption, doTabContainerCanAutoHide, doSideContainerCanClose, doSideContainerCanAutoHide, doTabContainerCanInSideContainer]
    Left = 699
    Top = 173
    PixelsPerInch = 96
  end
  object QryStructM: TKDBStructure
    DMEButtons = [dmbOpenSave]
    SEHelpContext = 0
    SQLFormats.Date = 'dd.MM.yyyy'
    SQLFormats.Time = 'hh:mm'
    SQLFormats.DateTime = 'dd.MM.yyyy hh:mm'
    SQLFormats.FalseValue = 'false'
    SQLFormats.TrueValue = 'true'
    SQLFormats.FullTableName = 'KIYAS'
    SQLFormats.LowerFunc = 'LOWER'
    SQLFormats.WildcardChar = '%'
    DatabaseInfo = dmGlobal.BDEInfo
    AutoAddFields = False
    DefOperators.Strings = (
      'Equal=='
      'NotEqual=<>'
      'LessThan=<'
      'LessOrEqual=<='
      'GreaterThan=>'
      'GreaterOrEqual=>='
      'IsNull=BO'#350
      'InList=L'#304'STEDE OLAN'
      'NotInList=L'#304'STEDE OLMAYAN'
      'StartsWith=... '#304'LE BA'#350'LAYAN'
      'NotStartsWith=... '#304'LE BA'#350'LAMAYAN'
      'Contains=... '#304#199'EREN'
      'NotContains=... '#304#199'ERMEYEN'
      'Between=ARALIKTA OLAN'
      'NotBetween=ARALIKTA OLMAYAN')
    ExOperators = [xoInList, xoBetween, xoStartsWith, xoContains]
    Left = 534
    Top = 252
    Struct = (
      '[Main]'
      'Version=3.6'
      'OperatCount=15'
      'TableCount=1'
      'FieldCount=5'
      'CondCount=0'
      'FieldGroups=1'
      'DefaultMainTable='
      'RootFieldsFirst=0'
      ' '
      '[Operator:1]'
      'Name=Equal'
      'DisplayName=='
      'SQLName=@f = '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:2]'
      'Name=NotEqual'
      'DisplayName=<>'
      'SQLName=@f <> '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:3]'
      'Name=LessThan'
      'DisplayName=<'
      'SQLName=@f < '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:4]'
      'Name=LessOrEqual'
      'DisplayName=<='
      'SQLName=@f <= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:5]'
      'Name=GreaterThan'
      'DisplayName=>'
      'SQLName=@f >'#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:6]'
      'Name=GreaterOrEqual'
      'DisplayName=>='
      'SQLName=@f >= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:7]'
      'Name=IsNull'
      'DisplayName=BO'#350
      'SQLName=@f is null'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftMemo,f' +
        'tFmtMemo,ftFixedChar,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:8]'
      'Name=InList'
      'DisplayName=L'#304'STEDE OLAN'
      'SQLName=@f in (@1)'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:9]'
      'Name=NotInList'
      'DisplayName=L'#304'STEDE OLMAYAN'
      'SQLName=NOT (@f in (@1))'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:10]'
      'Name=StartsWith'
      'DisplayName=... '#304'LE BA'#350'LAYAN'
      'SQLName=@f like '#39'@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:11]'
      'Name=NotStartsWith'
      'DisplayName=... '#304'LE BA'#350'LAMAYAN'
      'SQLName=not(@f like '#39'@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:12]'
      'Name=Contains'
      'DisplayName=... '#304#199'EREN'
      'SQLName=@f like '#39'%@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:13]'
      'Name=NotContains'
      'DisplayName=... '#304#199'ERMEYEN'
      'SQLName=not(@f like '#39'%@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:14]'
      'Name=Between'
      'DisplayName=ARALIKTA OLAN'
      'SQLName=@f between '#39'@1'#39' and '#39'@2'#39
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:15]'
      'Name=NotBetween'
      'DisplayName=ARALIKTA OLMAYAN'
      'SQLName=NOT (@f between '#39'@1'#39' and '#39'@2'#39')'
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Table:1]'
      'DBName=ErpConnection'
      'Name=YETKI'
      'DisplayName=YETKI'
      'Alias='
      'Quoted=0'
      'Hints='
      'DsgnPos=150,0,110,160'
      'Links='
      ' '
      '[Field:1]'
      'ID=1'
      'Kind=kfkData'
      'FieldExpr=ROLADI'
      'DisplayName=Rol Ad'#305
      'TableAlias='
      'EditType=4'
      'FieldType=1'
      'FieldSize=100'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      'Operators=Equal,NotEqual,InList,NotInList'
      ''
      '[Field:1.SQL]'
      'SELECT KOD,KOD AS KODL FROM ROLLER WHERE TUR = '#39'P'#39' '
      'ORDER BY KOD'
      ' '
      '[Field:2]'
      'ID=2'
      'Kind=kfkData'
      'FieldExpr=YETKIYOLU'
      'DisplayName=Yetki Yolu'
      'TableAlias='
      'EditType=0'
      'FieldType=1'
      'FieldSize=400'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:3]'
      'ID=5'
      'Kind=kfkData'
      'FieldExpr=ONAY'
      'DisplayName=Onay'
      'TableAlias='
      'EditType=2'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      'Items=Evet,Hay'#305'r'
      'Values=E,H'
      ' '
      '[Field:4]'
      'ID=6'
      'Kind=kfkData'
      'FieldExpr=YETKI'
      'DisplayName=Yetki A'#231#305'klama'
      'TableAlias='
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:5]'
      'ID=7'
      'Kind=kfkData'
      'FieldExpr=NOO'
      'DisplayName=Yetki No'
      'TableAlias='
      'EditType=0'
      'FieldType=3'
      'FieldSize=7'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[FieldGroup1]'
      'GroupName=Kriterler'
      'Fields=1,2,6,7,5'
      ' '
      '[RootGroup]'
      'Fields=')
  end
  object QryStructT: TKDBStructure
    DMEButtons = [dmbOpenSave]
    SEHelpContext = 0
    SQLFormats.Date = 'dd.MM.yyyy'
    SQLFormats.Time = 'hh:mm'
    SQLFormats.DateTime = 'dd.MM.yyyy hh:mm'
    SQLFormats.FalseValue = 'false'
    SQLFormats.TrueValue = 'true'
    SQLFormats.FullTableName = 'KIYAS'
    SQLFormats.LowerFunc = 'LOWER'
    SQLFormats.WildcardChar = '%'
    DatabaseInfo = dmGlobal.BDEInfo
    AutoAddFields = False
    DefOperators.Strings = (
      'Equal=='
      'NotEqual=<>'
      'LessThan=<'
      'LessOrEqual=<='
      'GreaterThan=>'
      'GreaterOrEqual=>='
      'IsNull=BO'#350
      'InList=L'#304'STEDE OLAN'
      'NotInList=L'#304'STEDE OLMAYAN'
      'StartsWith=... '#304'LE BA'#350'LAYAN'
      'NotStartsWith=... '#304'LE BA'#350'LAMAYAN'
      'Contains=... '#304#199'EREN'
      'NotContains=... '#304#199'ERMEYEN'
      'Between=ARALIKTA OLAN'
      'NotBetween=ARALIKTA OLMAYAN')
    ExOperators = [xoInList, xoBetween, xoStartsWith, xoContains]
    Left = 534
    Top = 318
    Struct = (
      '[Main]'
      'Version=3.6'
      'OperatCount=15'
      'TableCount=1'
      'FieldCount=5'
      'CondCount=0'
      'FieldGroups=1'
      'DefaultMainTable='
      'RootFieldsFirst=0'
      ' '
      '[Operator:1]'
      'Name=Equal'
      'DisplayName=='
      'SQLName=@f = '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:2]'
      'Name=NotEqual'
      'DisplayName=<>'
      'SQLName=@f <> '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:3]'
      'Name=LessThan'
      'DisplayName=<'
      'SQLName=@f < '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:4]'
      'Name=LessOrEqual'
      'DisplayName=<='
      'SQLName=@f <= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:5]'
      'Name=GreaterThan'
      'DisplayName=>'
      'SQLName=@f >'#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:6]'
      'Name=GreaterOrEqual'
      'DisplayName=>='
      'SQLName=@f >= '#39'@1'#39
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:7]'
      'Name=IsNull'
      'DisplayName=BO'#350
      'SQLName=@f is null'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftMemo,f' +
        'tFmtMemo,ftFixedChar,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:8]'
      'Name=InList'
      'DisplayName=L'#304'STEDE OLAN'
      'SQLName=@f in (@1)'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:9]'
      'Name=NotInList'
      'DisplayName=L'#304'STEDE OLMAYAN'
      'SQLName=NOT (@f in (@1))'
      'ValFormat='
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftBoolean,ftFl' +
        'oat,ftCurrency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedC' +
        'har,ftWideString,ftLargeint,ftTimeStamp,'
      'ValueKind=vkList'
      'CaseInsens=0'
      ' '
      '[Operator:10]'
      'Name=StartsWith'
      'DisplayName=... '#304'LE BA'#350'LAYAN'
      'SQLName=@f like '#39'@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:11]'
      'Name=NotStartsWith'
      'DisplayName=... '#304'LE BA'#350'LAMAYAN'
      'SQLName=not(@f like '#39'@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:12]'
      'Name=Contains'
      'DisplayName=... '#304#199'EREN'
      'SQLName=@f like '#39'%@1%'#39
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:13]'
      'Name=NotContains'
      'DisplayName=... '#304#199'ERMEYEN'
      'SQLName=not(@f like '#39'%@1%'#39')'
      'ValFormat='
      'ExprType=SameAsField'
      'AppliedTypes=ftString,ftMemo,ftFmtMemo,ftFixedChar,ftWideString,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:14]'
      'Name=Between'
      'DisplayName=ARALIKTA OLAN'
      'SQLName=@f between '#39'@1'#39' and '#39'@2'#39
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Operator:15]'
      'Name=NotBetween'
      'DisplayName=ARALIKTA OLMAYAN'
      'SQLName=NOT (@f between '#39'@1'#39' and '#39'@2'#39')'
      'ValFormat=and'
      'ExprType=SameAsField'
      
        'AppliedTypes=ftString,ftSmallint,ftInteger,ftWord,ftFloat,ftCurr' +
        'ency,ftBCD,ftDate,ftTime,ftDateTime,ftAutoInc,ftFixedChar,ftWide' +
        'String,ftLargeint,ftTimeStamp,'
      'ValueKind=vkScalar'
      'CaseInsens=0'
      ' '
      '[Table:1]'
      'DBName=ErpConnection'
      'Name=YETKI'
      'DisplayName=YETKI'
      'Alias='
      'Quoted=0'
      'Hints='
      'DsgnPos=150,0,110,160'
      'Links='
      ' '
      '[Field:1]'
      'ID=1'
      'Kind=kfkData'
      'FieldExpr=ROLADI'
      'DisplayName=Rol Ad'#305
      'TableAlias='
      'EditType=4'
      'FieldType=1'
      'FieldSize=100'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      'Operators=Equal,NotEqual,InList,NotInList'
      ''
      '[Field:1.SQL]'
      'SELECT KOD,KOD AS KODL FROM ROLLER WHERE TUR = '#39'P'#39' '
      'ORDER BY KOD'
      ' '
      '[Field:2]'
      'ID=2'
      'Kind=kfkData'
      'FieldExpr=YETKIYOLU'
      'DisplayName=Yetki Yolu'
      'TableAlias='
      'EditType=0'
      'FieldType=1'
      'FieldSize=400'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:3]'
      'ID=5'
      'Kind=kfkData'
      'FieldExpr=ONAY'
      'DisplayName=Onay'
      'TableAlias='
      'EditType=2'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      'Items=Evet,Hay'#305'r'
      'Values=E,H'
      ' '
      '[Field:4]'
      'ID=6'
      'Kind=kfkData'
      'FieldExpr=YETKI'
      'DisplayName=Yetki A'#231#305'klama'
      'TableAlias='
      'EditType=0'
      'FieldType=1'
      'FieldSize=30'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[Field:5]'
      'ID=7'
      'Kind=kfkData'
      'FieldExpr=NOO'
      'DisplayName=Yetki No'
      'TableAlias='
      'EditType=0'
      'FieldType=3'
      'FieldSize=7'
      'Quoted=0'
      'UIR=1'
      'UIC=1'
      'Aggr=0'
      
        'Operators=Equal,NotEqual,LessThan,LessOrEqual,GreaterThan,Greate' +
        'rOrEqual,IsNull,InList,NotInList,StartsWith,NotStartsWith,Contai' +
        'ns,NotContains,Between,NotBetween'
      ' '
      '[FieldGroup1]'
      'GroupName=Kriterler'
      'Fields=1,2,6,7,5'
      ' '
      '[RootGroup]'
      'Fields=')
  end
end
