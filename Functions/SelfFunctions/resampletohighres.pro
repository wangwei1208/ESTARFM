function ResampleToHighRes,LowResfile,BigPS,SmallPS,OutputDir
;  arrOri=READ_TIFF(LowResfile) ;读取tiff文件
;  Scale=BigPS/SmallPS  ;计算重采样比例
;  OriRows=N_ELEMENTS(arrOri[0,*]) ;获取原始图像行列数
;  OriColumn=N_ELEMENTS(arrOri[*,0])
;  arrRes=CONGRID(arrOri,OriColumn*Scale,OriRows*Scale)  ;重采样
;  query_status=QUERY_TIFF(LowResfile,info,GEOTIFF=geoinfo)
;  WRITE_TIFF,'C:\Users\dell-01\Desktop\test\resample.tif',arrRes,GEOTIFF=geoinfo
  e=ENVI()
  ;ENVI_BATCH_STATUS_WINDOW,/ON
  root_dir=FILE_DIRNAME(LowResfile)
  fileName=FILE_BASENAME(LowResfile)
  fileNameWithoutExtention=FILE_BASENAME(LowResfile,'.tif')
  File=Filepath(fileName,ROOT_DIR=root_dir)
  Raster=e.OpenRaster(File)
  Task=ENVITask('PixelScaleResampleRaster')
  Task.INPUT_RASTER=Raster
  scale=float(SmallPS)/BigPS
  Task.PIXEL_SCALE=[scale,scale]
  OutputFile=OutputDir+'\'+'ts_'+fileNameWithoutExtention+'.dat'
  Task.OUTPUT_RASTER_URI=OutputFile
  Task.Execute
  ;当ENVI处于打开状态时，将结果放到波段列表中
  DataColl = e.Data
  DataColl.Add, Task.Output_Raster
  View1 = e.GetView()
  Layer1 = View1.CreateLayer(Task.Output_Raster)
  RETURN,1
end
