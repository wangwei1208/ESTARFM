function is_leapyear,Year
  compile_opt idl2
  ;Judge the leap year
  mod4=Year mod 4
  mod100=Year mod 100
  mod400=Year mod 400
  IF [(mod4 EQ 0) AND (mod100 NE 0)] THEN BEGIN
    RETURN,1
  ENDIF 
  IF (mod400 EQ 0) THEN BEGIN
    RETURN,1
  ENDIF ELSE BEGIN
    RETURN,0
  ENDELSE
end
