�
 TKART_MUHASEBE 0�  TPF0TKart_MuhasebeKart_MuhasebeLeft� Top� ActiveControlDBGrid1BorderIconsbiSystemMenubiHelp BorderStylebsSingleCaption   Muhasebe Hesap PlanlarıClientHeight%ClientWidthXColor	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style OldCreateOrder	PopupMenu
PopupMenu1PositionpoScreenCenterOnClose	FormCloseOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight TPanelPanel2Left TopWidthXHeight AlignalBottomTabOrder  TLabelLabel1LeftTopWidth)HeightCaptionArananFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFont  TEditedAramaLeft2TopWidthHeightCharCaseecUpperCaseFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrder OnChangeedAramaChange
OnKeyPressedAramaKeyPress  	TComboBoxcbAramaLeft:TopWidthiHeightHint   Arama Yapılacak AlanStylecsDropDownListFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontTabOrderItems.StringsKODACIKLAMA	   ÖZEL KOD2. ACIKLAMA   TBitBtnBtnSecLeft�TopWidthJHeightCursorcrHandPointCaption   &SeçFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs
ParentFontTabOrderOnClickBtnSecClick  TBitBtnBtnKapatLeft
TopWidthJHeightCursorcrHandPointCaption&KapatFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 8����w���������33?  DD@���DD������3��  33MP��33�����38��  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33E���3333���38�?  33M]��3333�x�38�?  33DDDDD3333������?  33333333333�����3?  333   333333?���3?  333
��333333����3?  333   333333����3?  ModalResult	NumGlyphs
ParentFontTabOrder   TDBGridDBGrid1Left Top WidthXHeightAlignalClient
DataSourcedKartFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OptionsdgTitles
dgColLinesdgTabsdgRowSelect 
ParentFontTabOrderTitleFont.CharsetDEFAULT_CHARSETTitleFont.ColorclWindowTextTitleFont.Height�TitleFont.NameMS Sans SerifTitleFont.StylefsBold OnDrawColumnCellDBGrid1DrawColumnCell
OnDblClickDBGrid1DblClick
OnKeyPressDBGrid1KeyPressColumnsExpanded	FieldNameKODTitle.AlignmenttaCenterTitle.CaptionHESAP PLANI KODUWidth� Visible	 Expanded	FieldName
ACIKLAMA_1Title.AlignmenttaCenterTitle.Caption	   AÇIKLAMAWidth�Visible	    TDataSourcedKartAutoEditDataSetqKartOnStateChangedKartStateChangeLeft� Toph  	TOraQueryqKartSessiondmGlobal.dbGlobalSQL.Strings(SELECT * FROM KART_MUHASEBE ORDER BY KOD                         AfterScrollqKartAfterScrollOnCalcFieldsqKartCalcFieldsLeft� Toph TStringFieldqKartKOD	FieldNameKODRequired	Size  TStringFieldqKartACIKLAMA_1	FieldName
ACIKLAMA_1Size2  TStringFieldqKartACIKLAMA_2	FieldName
ACIKLAMA_2Size2  TStringFieldqKartOZEL_KOD_1	FieldName
OZEL_KOD_1Size
  TStringFieldqKartOZEL_KOD_2	FieldName
OZEL_KOD_2Size
  TFloatField	qKartBORC	FieldNameBORC  TFloatFieldqKartALACAK	FieldNameALACAK  TStringFieldqKartMASRAF_MERKEZI	FieldNameMASRAF_MERKEZISize  TIntegerFieldqKartSDY	FieldNameSDY  TDateTimeFieldqKartSDT	FieldNameSDT  TFloatFieldqKartBAKIYE	FieldKindfkCalculated	FieldNameBAKIYE
Calculated	   
TPopupMenu
PopupMenu1	AlignmentpaRightLeft�Top�  	TMenuItempmIlkCaption   İlk Kayıt
GroupIndex
ImageIndexOnClick
pmIlkClick  	TMenuItempmOncekiCaption   Önceki Kayıt
GroupIndex
ImageIndexOnClickpmOncekiClick  	TMenuItem	pmSonrakiCaption   Sonraki Kayıt
GroupIndex
ImageIndexOnClickpmSonrakiClick  	TMenuItempmSonCaption
   Son Kayıt
GroupIndex
ImageIndexOnClick
pmSonClick  	TMenuItemN3Caption-
GroupIndex  	TMenuItempmKapatCaptionKapat
GroupIndexHintKapat
ImageIndexShortCutX@OnClickpmKapatClick  	TMenuItem
ShowPopUp1Caption	ShowPopUp
GroupIndexShortCut{VisibleOnClickShowPopUp1Click    