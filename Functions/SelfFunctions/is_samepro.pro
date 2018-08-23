function Is_SamePro,Bandfile1,Bandfile2,Bandfile3,Bandfile4
  compile_opt idl2
  qi1=QUERY_TIFF(Bandfile1,info1,GEOTIFF=geoinfo1)
  qi2=QUERY_TIFF(Bandfile2,info2,GEOTIFF=geoinfo2)
  ;qi3=QUERY_TIFF(Bandfile3,info3,GEOTIFF=geoinfo3)
  ;qi4=QUERY_TIFF(Bandfile4,info4,GEOTIFF=geoinfo4)
  IF geoinfo1.(4) EQ geoinfo2.(4) THEN BEGIN
    Is_Same=1
  ENDIF ELSE BEGIN
    Is_Same=0
  ENDELSE
  return, Is_Same
end
