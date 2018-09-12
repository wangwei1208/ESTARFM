PRO ShowFileInfo,InputFileTxtID,InfoTxtID
COMPILE_OPT IDL2
ENVI,/RESTORE_BASE_SAVE_FILES
ENVI_BATCH_INIT,/NO_STATUS_WINDOW
  WIDGET_CONTROL,InputFileTxtID,GET_VALUE=InputFile
  is_Exist=FILE_TEST(InputFile)
  IF is_Exist EQ 0 THEN BEGIN
    void=DIALOG_MESSAGE('The file is invalid!',/ERROR)
    ENVI_BATCH_EXIT
    RETURN
  ENDIF ELSE BEGIN
    ENVI_OPEN_DATA_FILE,InputFile,R_FID=n_fid
    mapinfo=ENVI_GET_MAP_INFO(FID=n_fid)
    Datum=mapinfo.PROJ.DATUM
    Projection=mapinfo.PROJ.NAME
    PixelSize=mapinfo.PS[0]
    ENVI_FILE_QUERY,n_fid,DIMS=n_dims,FILE_TYPE=n_FileType,DATA_TYPE=n_DataType
    FileType=ENVI_FILE_TYPE(n_FileType)
    DataType=Judge_DataType(n_DataType)
    FileInfo=STRARR(6)
    FileInfo[0]='File:'+inputfile
    FileInfo[1]='Data Type:'+DataType
    FileInfo[2]='File Type:'+FileType
    FileInfo[3]='Datum:'+Datum
    FileInfo[4]='Projection:'+Projection
    IF (mapinfo.PROJ.TYPE EQ 1) THEN BEGIN
      FileInfo[5]='Pixel size:'+STRING(PixelSize)+' degree'
    ENDIF ELSE BEGIN
      FileInfo[5]='Pixel size:'+STRING(PixelSize)+' meters'
    ENDELSE
    WIDGET_CONTROL,InfoTxtID,SET_VALUE=FileInfo
    ENVI_BATCH_EXIT
  ENDELSE
END