�
 TKDVINDEXLERI_FORM 0�  TPF0TKdvIndexleri_FormKdvIndexleri_FormLeftCTop$BorderStylebsSingleCaption   Kdv İndexleriClientHeightmClientWidth�Color	clBtnFaceFont.CharsetDEFAULT_CHARSET
Font.ColorclWindowTextFont.Height�	Font.NameMS Sans Serif
Font.Style 	FormStyle
fsMDIChildOldCreateOrder	PopupMenu
PopupMenu1PositionpoScreenCenterVisible	OnClose	FormCloseOnCreate
FormCreate	OnDestroyFormDestroyPixelsPerInch`
TextHeight 
TStatusBar
StatusBar1Left TopXWidth�HeightPanels	AlignmenttaCenterBevelpbRaisedWidth�  	AlignmenttaCenterWidth| BevelpbRaisedWidth 	AlignmenttaCenterWidth2 BevelpbRaisedWidthx    TcxGridcxGrid1Left Top Width�HeightXAlignalClientTabOrderTabStopLookAndFeel.KindlfUltraFlatLookAndFeel.NativeStyle TcxGridDBTableView	TableViewNavigator.Buttons.CustomButtons *DataController.DataModeController.GridMode	DataController.DataSourcedKdv/DataController.Summary.DefaultGroupSummaryItems )DataController.Summary.FooterSummaryItems $DataController.Summary.SummaryGroups  OptionsCustomize.ColumnFilteringOptionsData.CancelOnExitOptionsData.Deleting OptionsData.DeletingConfirmationOptionsData.Inserting#OptionsView.NoDataToDisplayInfoText   <Veri bulunmamaktadır>OptionsView.ScrollBarsssNoneOptionsView.GroupByBoxOptionsView.Indicator	 TcxGridDBColumnCol_SIRA_NOCaption   İNDEXDataBinding.FieldNameSIRA_NOHeaderAlignmentHorztaCenterWidth=  TcxGridDBColumnCol_KDV_ORANICaption	KDV ORANIDataBinding.FieldName	KDV_ORANIHeaderAlignmentHorztaCenterWidthZ  TcxGridDBColumnCol_ACIKLAMACaption	   AÇIKLAMADataBinding.FieldNameACIKLAMAHeaderAlignmentHorztaCenterWidth   TcxGridLevelcxGrid1Level1GridView	TableView   TTimerTmDurumInterval�OnTimerTmDurumTimerLeft�Top�   TDataSourcedKdvDataSettKdvOnStateChangedKdvStateChangeLeft� TopQ  	TOraQuerytKdvSessiondmGlobal.dbGlobalSQL.StringsSELECT *FROM KART_KDV CachedUpdates	UpdateObjectuKdvAfterInserttKdvAfterInsert	AfterEdittKdvAfterEdit	AfterPosttKdvAfterPostBeforeDeletetKdvBeforeDeleteAfterDeletetKdvAfterDeleteAfterScrolltKdvAfterScrollLeftWTopR TIntegerFieldtKdvSIRA_NO	FieldNameSIRA_NORequired	  TFloatFieldtKdvKDV_ORANI	FieldName	KDV_ORANI  TStringFieldtKdvACIKLAMA	FieldNameACIKLAMASize2  TDateTimeFieldtKdvSDT	FieldNameSDT  TIntegerFieldtKdvSDY	FieldNameSDY   TOraUpdateSQLuKdvInsertSQL.Stringsinsert into KART_KDV*  (SIRA_NO, KDV_ORANI, ACIKLAMA, SDT, SDY)values2  (:SIRA_NO, :KDV_ORANI, :ACIKLAMA, :SDT, SYSDATE) DeleteSQL.Stringsdelete from KART_KDVwhere  SIRA_NO = :OLD_SIRA_NO ModifySQL.Stringsupdate KART_KDVset  KDV_ORANI = :KDV_ORANI,  ACIKLAMA = :ACIKLAMA,  SDT = :SDT,  SDY = SYSDATEwhere  SIRA_NO = :OLD_SIRA_NO Left� TopP  
TPopupMenu
PopupMenu1	AlignmentpaRightImagesdmGlobal.FisNoImageLeft�Topp 	TMenuItempmEkleCaptionEkle
ImageIndex ShortCutsOnClickpmEkleClick  	TMenuItem
pmDegistirCaption
   Değiştir
ImageIndexShortCutD@OnClickpmDegistirClick  	TMenuItempmSilCaptionSil
ImageIndexShortCutS@OnClick
pmSilClick  	TMenuItemN1Caption-  	TMenuItempmKaydetCaptionKaydet
ImageIndexShortCutqOnClickpmKaydetClick  	TMenuItempmVazgecCaption   Vazgeç
ImageIndexShortCutV@OnClickpmVazgecClick  	TMenuItemN2Caption-  	TMenuItempmKapatCaptionKapat
ImageIndexShortCutX@OnClickpmKapatClick    