PRO Init_Year_Month_Day,YearTxtID,MonthTxtID,DayTxtID
SysDate=BIN_DATE(SYSTIME())
SysYear=SysDate[0]
TimeInterval=SysYear-1972
YearArrElement=TimeInterval+1
YearList=STRARR(YearArrElement)
j=0
FOR i=1972,sysYear DO BEGIN
  YearList[j]=i
  j=j+1
ENDFOR
MonthList=['1','2','3','4','5','6','7','8','9','10','11','12']
DayList=STRARR(31)
FOR i=0,30 DO BEGIN
  j=i+1
  DayList[i]=j
  DayList[i]=STRTRIM(DayList[i],2) ;Remove the space
ENDFOR
WIDGET_CONTROL,YearTxtID,SET_VALUE=YearList
WIDGET_CONTROL,MonthTxtID,SET_VALUE=MonthList
WIDGET_CONTROL,DayTxtID,SET_VALUE=DayList
END