PRO OpenData,HeadLabel,PathTxt,ProBar
  OpenFile=DIALOG_PICKFILE(TITLE=!SYS_TITLE+HeadLabel,FILTER='*.tif')
  IF N_ELEMENTS(OpenFile) EQ 0 THEN BEGIN
    void=DIALOG_MESSAGE('You have selected no files!',/INFORMATION)
    RETURN
  ENDIF ELSE BEGIN
    WIDGET_CONTROL,PathTxt,SET_VALUE=OpenFile
    IDLITWDPROGRESSBAR_SETVALUE_Correct,ProBar,0
  ENDELSE
END