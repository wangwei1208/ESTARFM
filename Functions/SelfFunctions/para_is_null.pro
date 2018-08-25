FUNCTION Para_is_null,Pathtxt1ID,Pathtxt2ID,Pathtxt3ID,Pathtxt4ID,Yeartxt1ID,Yeartxt2ID,Yeartxt3ID,Yeartxt4ID,Monthtxt1ID,$
Monthtxt2ID,Monthtxt3ID,Monthtxt4ID,Daytxt1ID,Daytxt2ID,Daytxt3ID,Daytxt4ID,DirtxtID,Windowsize1ID,Windowsize2ID
COMPILE_OPT IDL2
WIDGET_CONTROL,Pathtxt1ID,GET_VALUE=Pathtxt1
WIDGET_CONTROL,Pathtxt2ID,GET_VALUE=Pathtxt2
WIDGET_CONTROL,Pathtxt3ID,GET_VALUE=Pathtxt3
WIDGET_CONTROL,Pathtxt4ID,GET_VALUE=Pathtxt4
WIDGET_CONTROL,Yeartxt1ID,GET_VALUE=Yeartxt1
WIDGET_CONTROL,Yeartxt2ID,GET_VALUE=Yeartxt2
WIDGET_CONTROL,Yeartxt3ID,GET_VALUE=Yeartxt3
WIDGET_CONTROL,Yeartxt4ID,GET_VALUE=Yeartxt4
WIDGET_CONTROL,Monthtxt1ID,GET_VALUE=Monthtxt1
WIDGET_CONTROL,Monthtxt2ID,GET_VALUE=Monthtxt2
WIDGET_CONTROL,Monthtxt3ID,GET_VALUE=Monthtxt3
WIDGET_CONTROL,Monthtxt4ID,GET_VALUE=Monthtxt4
WIDGET_CONTROL,Daytxt1ID,GET_VALUE=Daytxt1
WIDGET_CONTROL,Daytxt2ID,GET_VALUE=Daytxt2
WIDGET_CONTROL,Daytxt3ID,GET_VALUE=Daytxt3
WIDGET_CONTROL,Daytxt4ID,GET_VALUE=Daytxt4
WIDGET_CONTROL,DirtxtID,GET_VALUE=Dirtxt
WIDGET_CONTROL,Windowsize1ID,GET_VALUE=Windowsize1
WIDGET_CONTROL,Windowsize2ID,GET_VALUE=Windowsize2
IF [(Pathtxt1 EQ '') OR (Pathtxt2 EQ '') OR (Pathtxt3 EQ '') OR (Pathtxt4 EQ '') OR $
  (Yeartxt1 EQ '') OR (Yeartxt2 EQ '') OR (Yeartxt3 EQ '') OR (Yeartxt4 EQ '') OR $
  (Monthtxt1 EQ '') OR (Monthtxt2 EQ '') OR (Monthtxt3 EQ '') OR (Monthtxt4 EQ '') OR $
  (Daytxt1 EQ '') OR (Daytxt2 EQ '') OR (Daytxt3 EQ '') OR (Daytxt4 EQ '') OR $
  (Dirtxt EQ '') OR (Windowsize1 EQ '') OR (Windowsize2 EQ '')] THEN BEGIN
    RETURN,0
ENDIF ELSE BEGIN
  RETURN,1
ENDELSE
END