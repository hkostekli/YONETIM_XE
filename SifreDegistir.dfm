�
 TFORM_SIFREDEGISTIR 0�  TPF0TForm_SifreDegistirForm_SifreDegistirLeft�Top*BorderIcons BorderStylebsSingleCaption   Kullanıcı Şifre DeğiştirmeClientHeight� ClientWidth@Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold OldCreateOrder	PopupMenu
PopupMenu1OnClose	FormCloseOnCreate
FormCreatePixelsPerInch`
TextHeight TLabelLabel1LeftTopWidthAHeightCaptionEski Parola  TLabelLabel2LeftTop0WidthBHeightCaptionYeni Parola  TLabelLabel3LeftTopGWidthsHeightCaptionYeni Parola (Tekrar)  TEditEdit1Left� TopWidth� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontPasswordChar*ReadOnly	TabOrder   TEditEdit2Left� Top,Width� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontPasswordChar*ReadOnly	TabOrder  TEditEdit3Left� TopDWidth� HeightFont.CharsetDEFAULT_CHARSET
Font.ColorclBlueFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
ParentFontPasswordChar*ReadOnly	TabOrder  TPanelPanel1Left TopoWidth@HeightAlignalBottomCaptionPanel1TabOrder
DesignSize@  TBitBtn	BtnKaydetLeftlTopWidthgHeightAnchorsakRightakBottom Caption&KaydetEnabledFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  333333333333�33333  334C33333338�33333  33B$3333333�8�3333  34""C33333833�3333  3B""$33333�338�333  4"*""C3338�8�3�333  2"��"C3338�3�333  :*3:"$3338�38�8�33  3�33�"C333�33�3�33  3333:"$3333338�8�3  33333�"C333333�3�3  33333:"$3333338�8�  333333�"C333333�3�  333333:"C3333338�  3333333�#3333333��  3333333:3333333383  333333333333333333  	NumGlyphs
ParentFontTabOrder OnClickBtnKaydetClick  TBitBtnBtnKapatLeft� TopWidthgHeightAnchorsakRightakBottom Caption   &VazgeçFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
�  �  BM�      v   (   $            h                       �  �   �� �   � � ��  ��� ���   �  �   �� �   � � ��  ��� 333333333333333333  33�33333333?333333  39�33�3333��33?33  3939�338�3?��3  39��338�8��3�3  33�338�3��38�  339�333�3833�3  333�33338�33?�3  3331�33333�33833  3339�333338�3�33  333��33333833�33  33933333�33�33  33����333838�8�3  33�39333�3��3�3  33933�333��38�8�  33333393338�33���  3333333333333338�3  333333333333333333  	NumGlyphs
ParentFontTabOrderOnClickBtnKapatClick  TBitBtnBtnDegistirLeftTopWidthgHeightAnchorsakRightakBottom Caption   &DeğiştirFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.StylefsBold 
Glyph.Data
:  6  BM6      6   (                  �  �          ���������������������������������������������������������������������������������������������������                                          ������   ��� ����� ����� ����� ��      ��� ��   ������    ����� ����� ����� �����   � �   ���   ������   ���   ���   ���   ��� ��    ��� �      ������    ����� ����� ��      ���               ������   ��� ����� �����    ��   ��� ����� ��   ������    ����� ����� ��    ��    ����� �����   ������   ��� ����� �����    �� ��    ����� ��   ������    ����� ����� ��    �� ��   ��� �����   ������                         �� ��            ���������������������������    �� ��   ���������������������������������������            ������������������������������������     �  �   ���������������������������������������      ������������
ParentFontTabOrderOnClickBtnDegistirClick   	TOraQuery
qkullaniciSessiondmGlobal.dbGlobalSQL.StringsSelect * from kullanici CachedUpdates	UpdateObject
uKullaniciLeftsTop	  TOraUpdateSQL
uKullaniciInsertSQL.Stringsinsert into kullanici	  (SIFRE)values
  (:SIFRE) DeleteSQL.Stringsdelete from kullaniciwhere  KOD = :OLD_KOD ModifySQL.Stringsupdate kullaniciset  SIFRE = :SIFREwhere  KOD = :OLD_KOD Left� Top	  
TPopupMenu
PopupMenu1LeftETop 	TMenuItemYardm1Caption   YardımShortCutp    