PRO ControlWindow_CLEANUP,tlb
COMPILE_OPT idl2
  WIDGET_CONTROL,tlb,GET_UVALUE=pState
  PTR_FREE,pState  ;释放指针
END

PRO ControlWindow
COMPILE_OPT idl2
;初始化组件大小
sz=[800,400]
;设置系统变量，可方便修改系统标题
DEFSYSV,'!sys_title','ESTARFM'
;创建界面代码
tlb=WIDGET_BASE(MBAR=mBar,/COLUMN,TITLE=!SYS_TITLE,/TLB_KILL_REQUEST_EVENTS,TLB_FRAME_ATTR=1,MAP=0)
;创建菜单
;文件菜单
fMenu=WIDGET_BUTTON(mBar,VALUE='File',/MENU)
wButton=WIDGET_BUTTON(fMenu,value='Open Pre-high spatial resolution data',UNAME='OPreHSB')
wButton=WIDGET_BUTTON(fMenu,value='Open Last-high spatial resolution data',UNAME='OLastHSB')
wButton=WIDGET_BUTTON(fMenu,VALUE='Open Pre-high time resolution data',UNAME='OPreHTB')
wButton=WIDGET_BUTTON(fMenu,VALUE='Open Last-high time resolution data',UNAME='OLastHTB')
ExitButton=WIDGET_BUTTON(fMenu,VALUE='Exit',UNAME='Exit',/SEPARATOR)
;功能菜单
eMenu=WIDGET_BUTTON(mBar,VALUE='Function',/MENU)
wButton=WIDGET_BUTTON(eMenu,VALUE='Clear parameters',UNAME='Clear')
wButton=WIDGET_BUTTON(eMenu,VALUE='Run',UNAME='Execute',/SEPARATOR)
;关于菜单
hMenu=WIDGET_BUTTON(mBar,value='Help',/Menu)
aMenu=WIDGET_BUTTON(hMenu,VALUE='About',UNAME='About')
;参数栏
wInputBase=WIDGET_BASE(tlb,XSIZE=sz[0],YSIZE=sz[1],/FRAME,/ALIGN_CENTER,/ROW)
wParameterBase=WIDGET_BASE(wInputBase,XSIZE=(sz[0]/2.0),YSIZE=sz[1],/FRAME,/COLUMN)
;标题
wLabel=WIDGET_LABEL(wParameterBase,value='Model parameters',/ALIGN_CENTER)
;前期的高空间分辨率数据
;输入
wPreHSBase=WIDGET_BASE(wParameterBase,XSIZE=(sz[0]/2.04),YSIZE=(sz[1]/4.4),/FRAME,/COLUMN)
wHSFileBase=WIDGET_BASE(wPreHSBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/6.6),/COLUMN)
wHSFileLabelBase=WIDGET_BASE(wHSFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/19),/ROW)
wHsPathLabel=WIDGET_LABEL(wHSFileLabelBase,VALUE='Pre-high spatial resolution data:')
wHsDateLabel=WIDGET_LABEL(wHSFileLabelBase,VALUE=' Date(yyyy-mm-dd):')
wHSFileInputBase=WIDGET_BASE(wHSFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/12.8),/ROW)
wHSFilePath=WIDGET_TEXT(wHSFileInputBase,XSIZE=(sz[0]/25),YSIZE=(sz[1]/1000),UNAME='PreHsImagePath',/EDITABLE,/SENSITIVE)
wHSFileYear=WIDGET_DROPLIST(wHSFileInputBase,XSIZE=((sz[0]/10)),YSIZE=(sz[1]),UNAME='PreHsImageYear',/SENSITIVE)
wHSFileMonth=WIDGET_DROPLIST(wHSFileInputBase,XSIZE=((sz[0]/20)),YSIZE=(sz[1]),UNAME='PreHsImageMonth',/SENSITIVE)
wHSFileDay=WIDGET_DROPLIST(wHSFileInputBase,XSIZE=((sz[0]/20)),YSIZE=(sz[1]),UNAME='PreHsImageDay',/SENSITIVE)
Init_Year_Month_Day,wHSFileYear,wHSFileMonth,wHSFileDay ;初始化年月日
;按钮
wHSButtonBase=WIDGET_BASE(wPreHSBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/16),/ROW)
wButton=WIDGET_BUTTON(wHSButtonBase,VALUE='Browse pre-high spatial resolution data',UNAME='OPreHSB',/ALIGN_CENTER)
wButton=WIDGET_BUTTON(wHSButtonBase,VALUE='Show image info',UNAME='HSInfo',/ALIGN_CENTER)
;后期的高空间分辨率数据
;输入
wLastHSBase=WIDGET_BASE(wParameterBase,XSIZE=(sz[0]/2.04),YSIZE=(sz[1]/4.4),/FRAME,/COLUMN)
wLaHSFileBase=WIDGET_BASE(wLastHSBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/6.6),/COLUMN)
wLaHSFileLabelBase=WIDGET_BASE(wLaHSFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/19),/ROW)
wLaHsPathLabel=WIDGET_LABEL(wLaHSFileLabelBase,VALUE='Last-high spatial resolution data:')
wLaHsDateLabel=WIDGET_LABEL(wLaHSFileLabelBase,VALUE=' Date(yyyy-mm-dd):')
wLaHSFileInputBase=WIDGET_BASE(wLaHSFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/12.8),/ROW)
wLaHSFilePath=WIDGET_TEXT(wLaHSFileInputBase,XSIZE=(sz[0]/25),YSIZE=(sz[1]/1000),UNAME='LastHsImagePath',/SENSITIVE,/EDITABLE)
wLaHSFileYear=WIDGET_DROPLIST(wLaHSFileInputBase,XSIZE=((sz[0]/10)),YSIZE=(sz[1]),UNAME='LastHsImageYear',/SENSITIVE)
wLaHSFileMonth=WIDGET_DROPLIST(wLaHSFileInputBase,XSIZE=((sz[0]/20)),YSIZE=(sz[1]),UNAME='LastHsImageMonth',/SENSITIVE)
wLaHSFileDay=WIDGET_DROPLIST(wLaHSFileInputBase,XSIZE=((sz[0]/20)),YSIZE=(sz[1]),UNAME='LastHsImageDay',/SENSITIVE)
Init_Year_Month_Day,wLaHSFileYear,wLaHSFileMonth,wLaHSFileDay  ;初始化年月日
;按钮
wLaHSButtonBase=WIDGET_BASE(wLastHSBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/16),/ROW)
wButton=WIDGET_BUTTON(wLaHSButtonBase,VALUE='Browse last-high spatial resolution data',UNAME='OLastHSB',/ALIGN_CENTER)
wButton=WIDGET_BUTTON(wLaHSButtonBase,VALUE='Show image info',UNAME='LaHSInfo',/ALIGN_CENTER)
;前期的高时间分辨率数据
;输入
wPreHTBase=WIDGET_BASE(wParameterBase,XSIZE=(sz[0]/2.04),YSIZE=(sz[1]/4.4),/FRAME,/COLUMN)
wPreHTFileBase=WIDGET_BASE(wPreHTBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/6.6),/COLUMN)
wPreHTFileLabelBase=WIDGET_BASE(wPreHTFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/19),/ROW)
wPreHtPathLabel=WIDGET_LABEL(wPreHTFileLabelBase,VALUE='Pre-high time resolution data:')
wPreHtDateLabel=WIDGET_LABEL(wPreHTFileLabelBase,VALUE='    Date(yyyy-mm-dd):')
wPreHTFileInputBase=WIDGET_BASE(wPreHTFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/12.8),/ROW)
wPreHTFilePath=WIDGET_TEXT(wPreHTFileInputBase,XSIZE=(sz[0]/25),YSIZE=(sz[1]/1000),UNAME='PreHtImagePath',/SENSITIVE,/EDITABLE)
wPreHTFileYear=WIDGET_DROPLIST(wPreHTFileInputBase,XSIZE=(sz[0]/10),YSIZE=(sz[1]/1000),UNAME='PrHtImageYear',/SENSITIVE)
wPreHTFileMonth=WIDGET_DROPLIST(wPreHTFileInputBase,XSIZE=((sz[0]/20)),YSIZE=(sz[1]/1000),UNAME='PreHtImageMonth',/SENSITIVE)
wPreHTFileDay=WIDGET_DROPLIST(wPreHTFileInputBase,XSIZE=(sz[0]/20),YSIZE=(sz[1]/1000),UNAME='PreHtImageDay',/SENSITIVE)
Init_Year_Month_Day,wPreHTFileYear,wPreHTFileMonth,wPreHTFileDay ;初始化年月日
;按钮
wPreHTButtonBase=WIDGET_BASE(wPreHTBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/16),/ROW)
wButton=WIDGET_BUTTON(wPreHTButtonBase,VALUE='Browse pre-high time resolution data',UNAME='OPreHTB',/ALIGN_CENTER)
wButton=WIDGET_BUTTON(wPreHTButtonBase,VALUE='Show image info',UNAME='PreHTInfo',/ALIGN_CENTER)
;后期的高时间分辨率数据
;输入
wLastHTBase=WIDGET_BASE(wParameterBase,XSIZE=(sz[0]/2.04),YSIZE=(sz[1]/4.4),/FRAME,/COLUMN)
wLastHTFileBase=WIDGET_BASE(wLastHTBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/6.6),/COLUMN)
wLastHTFileLabelBase=WIDGET_BASE(wLastHTFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/19),/ROW)
wLastHtPathLabel=WIDGET_LABEL(wLastHTFileLabelBase,VALUE='Last-high time resolution data:')
wLastHtDateLabel=WIDGET_LABEL(wLastHTFileLabelBase,VALUE='    Date(yyyy-mm-dd):')
wLastHTFileInputBase=WIDGET_BASE(wLastHTFileBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/12.8),/ROW)
wLastHTFilePath=WIDGET_TEXT(wLastHTFileInputBase,XSIZE=(sz[0]/25),YSIZE=(sz[1]/1000),UNAME='LastHtImagePath',/SENSITIVE,/EDITABLE)
wLastHTFileYear=WIDGET_DROPLIST(wLastHTFileInputBase,XSIZE=(sz[0]/10),YSIZE=(sz[1]/1000),UNAME='LastHtImageYear',/SENSITIVE)
wLastHTFileMonth=WIDGET_DROPLIST(wLastHTFileInputBase,XSIZE=((sz[0]/20)),YSIZE=(sz[1]/1000),UNAME='LastHtImageMonth',/SENSITIVE)
wLastHTFileDay=WIDGET_DROPLIST(wLastHTFileInputBase,XSIZE=(sz[0]/20),YSIZE=(sz[1]/1000),UNAME='LastHtImageDay',/SENSITIVE)
Init_Year_Month_Day,wLastHTFileYear,wLastHTFileMonth,wLastHTFileDay ;初始化年月日
;按钮
wLastHTButtonBase=WIDGET_BASE(wLastHTBase,XSIZE=(sz[0]/2.08),YSIZE=(sz[1]/16),/ROW)
wButton=WIDGET_BUTTON(wLastHTButtonBase,VALUE='Browse last-high time resolution data',UNAME='OLastHTB',/ALIGN_CENTER)
wButton=WIDGET_BUTTON(wLastHTButtonBase,VALUE='Show image info',UNAME='LastHTInfo',/ALIGN_CENTER)
;文件信息栏
wInfoBase=WIDGET_BASE(wInputBase,XSIZE=(sz[0]/2.055),YSIZE=sz[1],/FRAME,/COLUMN)
wLabel=WIDGET_LABEL(wInfoBase,value='File Information',/ALIGN_CENTER)
wInfoTxt=WIDGET_TEXT(wInfoBase,XSIZE=(sz[0]/15),YSIZE=(sz[1]/25),UNAME='InfoTxt',/SENSITIVE,/SCROLL)
;输出参数栏:输出数据所在目录、移动窗口大小、
wOutPutBase=WIDGET_BASE(wInfoBase,XSIZE=(sz[0]/2.12),YSIZE=(sz[1]/3.4),/FRAME,/COLUMN)
wOutputLabel=WIDGET_LABEL(wOutPutBase,VALUE='Output Parameters',/ALIGN_CENTER)
;
wOutputLabelBase=WIDGET_BASE(wOutPutBase,XSIZE=(sz[0]/2.14),YSIZE=(sz[1]/25.0),/ROW)
wOutputDirLabel=WIDGET_LABEL(wOutputLabelBase,VALUE='Output Directory:',/ALIGN_LEFT)
wMoveWindow=WIDGET_LABEL(wOutputLabelBase,VALUE='                         Move Window Size:',/ALIGN_LEFT)
;
wOutputTxtBase=WIDGET_BASE(wOutPutBase,XSIZE=(sz[0]/2.14),YSIZE=(sz[1]/16.0),/ROW)
wOutputDirTxt=WIDGET_TEXT(wOutputTxtBase,XSIZE=(sz[0]/2.14)/9.0,YSIZE=(sz[1]/420.0),/EDITABLE,/SENSITIVE)
wIntervalLabel=WIDGET_LABEL(wOutputTxtBase,VALUE='   ')
wWindowSizeTxt1=WIDGET_TEXT(wOutputTxtBase,XSIZE=(sz[0]/2.14)/35.0,YSIZE=(sz[1]/420.0),/EDITABLE,/SENSITIVE)
;
wOutputButtonBase=WIDGET_BASE(wOutPutBase,XSIZE=(sz[0]/2.14),YSIZE=(sz[1]/13.0),/ROW)
wButton=WIDGET_BUTTON(wOutputButtonBase,VALUE='Select Output Directory',UNAME='SelectDir',/ALIGN_CENTER)
wButton=WIDGET_BUTTON(wOutputButtonBase,VALUE='Run',UNAME='Execute',/ALIGN_CENTER)
wButton=WIDGET_BUTTON(wOutputButtonBase,VALUE='Clear Parameters',UNAME='Clear',/ALIGN_CENTER)
ExitButton=WIDGET_BUTTON(wOutputButtonBase,VALUE='Exit',UNAME='Exit',/ALIGN_CENTER)
;
wOutputProgressBase=WIDGET_BASE(wOutPutBase,XSIZE=(sz[0]/2.14),YSIZE=(sz[1]/19.0),/ROW)
wProgressLabel=WIDGET_LABEL(wOutputProgressBase,VALUE=' Progress:')
prsbar=IDLITWDPROGRESSBAR_Correct(wOutputProgressBase,title='Progress',CANCEL=0)
;结构体传递参数
state={wButton:wButton,tlb:tlb,ExitButton:ExitButton,wHSFilePath:wHSFilePath,prsbar:prsbar,wInfoTxt:wInfoTxt,$
  wLaHSFilePath:wLaHSFilePath,wPreHTFilePath:wPreHTFilePath,wLastHTFilePath:wLastHTFilePath,$
  wHSFileYear:wHSFileYear,wHSFileMonth:wHSFileMonth,wHSFileDay:wHSFileDay,wLaHSFileYear:wLaHSFileYear,wLaHSFileMonth:wLaHSFileMonth,$
  wLaHSFileDay:wLaHSFileDay,wPreHTFileYear:wPreHTFileYear,wPreHTFileMonth:wPreHTFileMonth,wPreHTFileDay:wPreHTFileDay,$
  wLastHTFileYear:wLastHTFileYear,wLastHTFileMonth:wLastHTFileMonth,wLastHTFileDay:wLastHTFileDay,wOutputDirTxt:wOutputDirTxt,$
  wWindowSizeTxt1:wWindowSizeTxt1}
pState=PTR_NEW(state,/NO_COPY)
CenterTLB,tlb
WIDGET_CONTROL,tlb,/REALIZE,/map,set_uValue=pState
XMANAGER,'ControlWindow',tlb,/NO_BLOCK,cleanup='ControlWindow_CLEANUP' ;XMANAGER处理产生的事件并调用事件响应程序
END

;EVENT
PRO ControlWindow_EVENT,event
COMPILE_OPT idl2
WIDGET_CONTROL,event.TOP,GET_UVALUE=pState

IF TAG_NAMES(event,/STRUCTURE_NAME) EQ 'WIDGET_KILL_REQUEST' THEN BEGIN
  status=DIALOG_MESSAGE('Close this progress?',/QUESTION)
  IF status EQ 'No' THEN RETURN
  WIDGET_CONTROL,event.TOP,/DESTROY ;销毁
ENDIF

;获取被点击组件的UNAME
ComUName=WIDGET_INFO(event.ID,/UNAME)
CASE ComUName OF
  'Exit':BEGIN
    status=DIALOG_MESSAGE('Close the progress?',TITLE=!SYS_TITLE,/QUESTION)
    IF status EQ 'No' THEN RETURN
    WIDGET_CONTROL,event.TOP,/DESTROY  ;销毁
    END
    'About':BEGIN
      void=DIALOG_MESSAGE(!SYS_TITLE+' V1.0'+STRING(13b)+'Published by Life'+STRING(13b)+'E-mail:yc_hong526@163.com',/INFORMATION)
    END
    'OPreHSB':BEGIN
      OpenData,' Open Pre-high spatial resolution data',(*pState).wHSFilePath,(*pState).PRSBAR
     END
     'HSInfo':BEGIN
      ShowFileInfo,(*pState).wHSFilePath,(*pState).wInfoTxt
     END
     'OLastHSB':BEGIN
      OpenData,' Open Last-high spatial resolution data',(*pState).wLaHSFilePath,(*pState).PRSBAR
     END
     'LaHSInfo':BEGIN
      ShowFileInfo,(*pState).wLaHSFilePath,(*pState).wInfoTxt
     END
     'OPreHTB':BEGIN
      OpenData,' Open Pre-high time resolution data',(*pState).wPreHTFilePath,(*pState).PRSBAR
     END
     'PreHTInfo':BEGIN
      ShowFileInfo,(*pState).wPreHTFilePath,(*pState).wInfoTxt
     END
     'OLastHTB':BEGIN
      OpenData,' Open Last-high time resolution data',(*pState).wLastHTFilePath,(*pState).PRSBAR
     END
     'LastHTInfo':BEGIN
      ShowFileInfo,(*pState).wLastHTFilePath,(*pState).wInfoTxt
     END
     'SelectDir':BEGIN
       SelectDir,!SYS_TITLE,(*pState).wOutputDirTxt
     END
     'Clear':BEGIN
      ;Path
      WIDGET_CONTROL,(*pState).wHSFilePath,SET_VALUE=''
      WIDGET_CONTROL,(*pState).wLaHSFilePath,SET_VALUE=''
      WIDGET_CONTROL,(*pState).wPreHTFilePath,SET_VALUE=''
      WIDGET_CONTROL,(*pState).wLastHTFilePath,SET_VALUE=''
      ;Output para
      WIDGET_CONTROL,(*pState).wOutputDirTxt,SET_VALUE=''
      WIDGET_CONTROL,(*pState).wWindowSizeTxt1,SET_VALUE=''
      WIDGET_CONTROL,(*pState).wWindowSizeTxt2,SET_VALUE=''
     END
     'PreHsImageYear':BEGIN
      DateSeleChange,(*pState).wHSFileYear,(*pState).wHSFileMonth,(*pState).wHSFileDay,event
     END
     'PreHsImageMonth':BEGIN
      DateSeleChange,(*pState).wHSFileYear,(*pState).wHSFileMonth,(*pState).wHSFileDay,event
     END
     'LastHsImageYear':BEGIN
      DateSeleChange,(*pState).wLaHSFileYear,(*pState).wLaHSFileMonth,(*pState).wLaHSFileDay,event
     END
     'LastHsImageMonth':BEGIN
      DateSeleChange,(*pState).wLaHSFileYear,(*pState).wLaHSFileMonth,(*pState).wLaHSFileDay,event
     END
     'PrHtImageYear':BEGIN
      DateSeleChange,(*pState).wPreHTFileYear,(*pState).wPreHTFileMonth,(*pState).wPreHTFileDay,event
     END
     'PreHtImageMonth':BEGIN
      DateSeleChange,(*pState).wPreHTFileYear,(*pState).wPreHTFileMonth,(*pState).wPreHTFileDay,event
     END
     'LastHtImageYear':BEGIN
      DateSeleChange,(*pState).wLastHTFileYear,(*pState).wLastHTFileMonth,(*pState).wLastHTFileDay,event
     END
     'LastHtImageMonth':BEGIN
      DateSeleChange,(*pState).wLastHTFileYear,(*pState).wLastHTFileMonth,(*pState).wLastHTFileDay,event
     END
     'Execute':BEGIN
      ;Judge the parameters is inputed completely
      is_null=para_is_null((*pState).wHSFilePath,(*pState).wLaHSFilePath,(*pState).wPreHTFilePath,(*pState).wLastHTFilePath,$
        (*pState).wHSFileYear,(*pState).wHSFileMonth,(*pState).wHSFileDay,(*pState).wLaHSFileYear,(*pState).wLaHSFileMonth,$
        (*pState).wLaHSFileDay,(*pState).wPreHTFileYear,(*pState).wPreHTFileMonth,(*pState).wPreHTFileDay,$
        (*pState).wLastHTFileYear,(*pState).wLastHTFileMonth,(*pState).wLastHTFileDay,$
        (*pState).wOutputDirTxt,(*pState).wWindowSizeTxt1)
       IF (is_null EQ 0) THEN BEGIN
        status=DIALOG_MESSAGE('The parameters of model is not complete!',/ERROR)
        RETURN
       ENDIF ELSE BEGIN
        ;Judge the data has one channel only
        is_onechannel1=is_onechannel((*pState).wHSFilePath)
        is_onechannel2=is_onechannel((*pState).wLaHSFilePath)
        is_onechannel3=is_onechannel((*pState).wPreHTFilePath)
        is_onechannel4=is_onechannel((*pState).wLastHTFilePath)
        IF (is_onechannel1 NE 1) OR (is_onechannel2 NE 1) OR (is_onechannel3 NE 1) OR (is_onechannel4 NE 1) THEN BEGIN
          status=DIALOG_MESSAGE('The input data have more than one band!',/ERROR)
          RETURN
        ENDIF ELSE BEGIN
          ;Judge the projections of the data are different
          is_sameproj=is_sameprj((*pState).wHSFilePath,(*pState).wLaHSFilePath,(*pState).wPreHTFilePath,$
            (*pState).wLastHTFilePath)
          IF (is_sameproj NE 1) THEN BEGIN
            status=DIALOG_MESSAGE('The coodinates of input files are different!',/ERROR)
            RETURN
          ENDIF ELSE BEGIN
              WinSize_v=is_odd_number((*pState).wWindowSizeTxt1)
              IF (WinSize_v NE 1) THEN BEGIN
                status=DIALOG_MESSAGE('The window size is not a odd number.',/ERROR)
                RETURN
              ENDIF
          ENDELSE
        ENDELSE
       ENDELSE
     END
ELSE:
ENDCASE
END