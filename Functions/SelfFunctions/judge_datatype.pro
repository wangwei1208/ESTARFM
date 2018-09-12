function Judge_DataType,DataNum
  compile_opt idl2
  IF (DataNum EQ 1) THEN BEGIN
    RETURN,'Byte'
  ENDIF
  IF (DataNum EQ 2) THEN BEGIN
    RETURN,'Integer'
  ENDIF
  IF (DataNum EQ 3) THEN BEGIN
    RETURN,'Long Integer'
  ENDIF
  IF (DataNum EQ 4) THEN BEGIN
    RETURN,'Floating-point'
  ENDIF
  IF (DataNum EQ 5) THEN BEGIN
    RETURN,'Double-precision floating-point'
  ENDIF
  IF (DataNum EQ 6) THEN BEGIN
    RETURN,'Complex'
  ENDIF
  IF (DataNum EQ 9) THEN BEGIN
    RETURN,'Double-precision complex'
  ENDIF
  IF (DataNum EQ 12) THEN BEGIN
    RETURN,'Unsigned integer'
  ENDIF
  IF (DataNum EQ 13) THEN BEGIN
    RETURN,'Unsigned long integer'
  ENDIF
  IF (DataNum EQ 14) THEN BEGIN
    RETURN,'Long 64-bit integer'
  ENDIF
  IF (DataNum EQ 15) THEN BEGIN
    RETURN,'Unsigned long 64-bit integer'
  ENDIF
  RETURN, 0
end
