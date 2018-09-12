pro DateSeleChange,YearID,MonthID,DayID,event
  compile_opt idl2
  WIDGET_CONTROL,YearID,GET_VALUE=YearArr
  WIDGET_CONTROL,MonthID,GET_VALUE=MonthArr
  IF ((event.ID EQ YearID) OR (event.ID EQ MonthID)) THEN BEGIN
    selected=WIDGET_INFO(event.ID,/DROPLIST_SELECT) ;获取被点击列表的选择项的索引
    IF (event.ID EQ YearID) THEN BEGIN
      Year=FIX((STRTRIM(YearArr[selected],2)))
      MonthIndex=WIDGET_INFO(MonthID,/DROPLIST_SELECT)
      MonthStr=STRTRIM(MonthArr[MonthIndex],2)
      Month=FIX(MonthStr)
      IF (is_leapyear(Year) EQ 1) THEN BEGIN
        IF (Month EQ 2) THEN BEGIN
          DayList=STRARR(29)
          FOR i=0,28 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 1) OR (Month EQ 3) OR (Month EQ 5) OR (Month EQ 7) OR (Month EQ 8) OR (Month EQ 10) OR (Month EQ 12)) THEN BEGIN
          DayList=STRARR(31)
          FOR i=0,30 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 4) OR (Month EQ 6) OR (Month EQ 9) OR (Month EQ 11)) THEN BEGIN
          DayList=STRARR(30)
          FOR i=0,29 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
      ENDIF ELSE BEGIN
        IF (Month EQ 2) THEN BEGIN
          DayList=STRARR(28)
          FOR i=0,27 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 1) OR (Month EQ 3) OR (Month EQ 5) OR (Month EQ 7) OR (Month EQ 8) OR (Month EQ 10) OR (Month EQ 12)) THEN BEGIN
          DayList=STRARR(31)
          FOR i=0,30 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 4) OR (Month EQ 6) OR (Month EQ 9) OR (Month EQ 11)) THEN BEGIN
          DayList=STRARR(30)
          FOR i=0,29 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
      ENDELSE
      IF ((Month EQ 1) OR (Month EQ 3) OR (Month EQ 5) OR (Month EQ 7) OR (Month EQ 8) OR (Month EQ 10) OR (Month EQ 12)) THEN BEGIN
        DayList=STRARR(31)
        FOR i=0,30 DO BEGIN
          j=i+1
          DayList[i]=j
          DayList[i]=STRTRIM(DayList[i],2)
        ENDFOR
        WIDGET_CONTROL,DayID,SET_VALUE=DayList
      ENDIF
      IF ((Month EQ 4) OR (Month EQ 6) OR (Month EQ 9) OR (Month EQ 11)) THEN BEGIN
        DayList=STRARR(30)
        FOR i=0,29 DO BEGIN
          j=i+1
          DayList[i]=j
          DayList[i]=STRTRIM(DayList[i],2)
        ENDFOR
        WIDGET_CONTROL,DayID,SET_VALUE=DayList
      ENDIF
    ENDIF ;Year
    IF (event.ID EQ MonthID) THEN BEGIN
      Month=FIX(STRTRIM(MonthArr[selected]))
      YearIndex=WIDGET_INFO(YearID,/DROPLIST_SELECT)
      YearStr=STRTRIM(YearArr[YearIndex],2)
      Year=FIX((YearStr))
      IF (is_leapyear(Year) EQ 1) THEN BEGIN
        IF (Month EQ 2) THEN BEGIN
          DayList=STRARR(29)
          FOR i=0,28 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 1) OR (Month EQ 3) OR (Month EQ 5) OR (Month EQ 7) OR (Month EQ 8) OR (Month EQ 10) OR (Month EQ 12)) THEN BEGIN
          DayList=STRARR(31)
          FOR i=0,30 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 4) OR (Month EQ 6) OR (Month EQ 9) OR (Month EQ 11)) THEN BEGIN
          DayList=STRARR(30)
          FOR i=0,29 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
      ENDIF ELSE BEGIN
        IF (Month EQ 2) THEN BEGIN
          DayList=STRARR(28)
          FOR i=0,27 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 1) OR (Month EQ 3) OR (Month EQ 5) OR (Month EQ 7) OR (Month EQ 8) OR (Month EQ 10) OR (Month EQ 12)) THEN BEGIN
          DayList=STRARR(31)
          FOR i=0,30 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
        IF ((Month EQ 4) OR (Month EQ 6) OR (Month EQ 9) OR (Month EQ 11)) THEN BEGIN
          DayList=STRARR(30)
          FOR i=0,29 DO BEGIN
            j=i+1
            DayList[i]=j
            DayList[i]=STRTRIM(DayList[i],2)
          ENDFOR
          WIDGET_CONTROL,DayID,SET_VALUE=DayList
        ENDIF
      ENDELSE
    ENDIF ;Month
  ENDIF
end
