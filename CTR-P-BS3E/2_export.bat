SET cwdir=%CD%
SET rootdir=%~dp0
CD /D "%rootdir%"
FOR /R cci\cxi0\exefs\banner %%I IN (*.bcmdl) DO (tools\txobtool -evfd "%%I" "%%~dpnI" || PAUSE)
CD /D "%cwdir%"
PAUSE
