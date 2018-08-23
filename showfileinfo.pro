PRO ShowFileInfo,InputFileTxtID,InfoTxt
  WIDGET_CONTROL,InputFileTxtID,GET_VALUE=InputFile
  is_Exist=FILE_TEST(InputFile)
  IF is_Exist EQ 0 THEN BEGIN
    void=DIALOG_MESSAGE('The file is invalid!',/ERROR)
    RETURN
  ENDIF
  IF InputFile EQ '' THEN BEGIN
    void=DIALOG_MESSAGE('The data is not selected!',/INFORMATION)
  ENDIF ELSE BEGIN
    ReadPath=InputFile[0]
    Query_Status=QUERY_IMAGE((ReadPath,info)
    WIDGET_CONTROL,InfoTxt,SET_VALUE=Query_Status
  ENDELSE
END