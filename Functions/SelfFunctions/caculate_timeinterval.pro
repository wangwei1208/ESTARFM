function Caculate_TimeInterval,DateArr1,DateArr2
  compile_opt idl2
  ;JULDAY的参数分别为月、日、年
  TimeInterval=JULDAY(DateArr1[0],DateArr1[1],DateArr1[2])-JULDAY(DateArr2[0],DateArr2[1],DateArr2[2])
  IF TimeInterval LE 0 THEN BEGIN ;输入日期相反或输入日期相同
    mess=DIALOG_MESSAGE('Date input error',TITLE='Admin',/ERROR)
    Return,-1
  ENDIF ELSE BEGIN
    return, TimeInterval
  ENDELSE
end
