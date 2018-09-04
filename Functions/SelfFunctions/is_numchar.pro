FUNCTION is_NumChar,TxtControlID,Number
WIDGET_CONTROL,TxtControlID,GET_VALUE=InputDatetxt
InputDatetxt=STRCOMPRESS(InputDatetxt,/REMOVE_ALL)
length=STRLEN(InputDatetxt)
IF (length NE Number) THEN BEGIN
  RETURN,0
ENDIF ELSE BEGIN
  FixArr=FIX(BYTE(InputDatetxt))
  ArrLength=N_ELEMENTS(FixArr)
  Num=0
  FOR i=0,ArrLength DO BEGIN
    IF [(FixArr[i] GE 48) AND (FixArr[i] LE 57)] THEN BEGIN
      Num=Num+1
    ENDIF
  ENDFOR
  IF (Num EQ Number) THEN BEGIN
    RETURN,1
  ENDIF ELSE BEGIN
    RETURN,0
  ENDELSE
ENDELSE
END