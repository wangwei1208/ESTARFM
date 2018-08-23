FUNCTION Get_PixelSize,Bandfile
  compile_opt idl2
  is_exist=FILE_TEST(Bandfile)
  IF is_exist EQ 1 THEN BEGIN
    qi1=QUERY_TIFF(Bandfile,info1,GEOTIFF=geoinfo1)
    RETURN,geoinfo1.MODELPIXELSCALETAG[1]
  ENDIF
END
