FUNCTION is_OneChannel,BandfileID
compile_opt idl2
WIDGET_CONTROL,BandfileID,GET_VALUE=Bandfile
qi=QUERY_IMAGE(Bandfile,info,CHANNELS=channel)
IF channel EQ 1 THEN BEGIN
Is_one=1
ENDIF ELSE BEGIN 
Is_one=0
ENDELSE
RETURN,Is_one
END