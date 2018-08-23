FUNCTION OneChannel_In,Bandfile
compile_opt idl2
qi=QUERY_IMAGE(Bandfile,info,CHANNELS=channel)
IF channel EQ 1 THEN BEGIN
Is_one=1
ENDIF ELSE BEGIN 
Is_one=0
ENDELSE
RETURN,Is_one
END