SET cwdir=%CD%
SET rootdir=%~dp0
CD /D "%rootdir%"
FOR /R cci\cxi0\exefs\banner %%I IN (*.bcmdl) DO (tools\txobtool -evfd "%%I" "%%~dpnI" || PAUSE)
FOR /R cci\cxi0\romfs %%I IN (*.arc.cmp) DO (tools\CmpTool U "%%I" "%%~dpnI.l10n.arc" || PAUSE)
REM FOR /R cci\cxi0\romfs %%I IN (*.bcres.cmp) DO (tools\CmpTool U "%%I" "%%~dpnI.l10n.bcres" || PAUSE)
REM FOR /R cci\cxi0\romfs %%I IN (*.bcres.l10n.bcres) DO (tools\txobtool -evfd "%%I" "%%~dpnI.dir" || PAUSE)
CD /D "%cwdir%"
PAUSE
