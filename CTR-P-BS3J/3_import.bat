SET cwdir=%CD%
SET rootdir=%~dp0
CD /D "%rootdir%"
RD /S /Q build
MD build\cxi0\exefs
XCOPY cci\cxi0\exefs build\cxi0\exefs /S /Y
MD build\cxi0\romfs
XCOPY cci\cxi0\romfs build\cxi0\romfs /S /Y
XCOPY zh\cxi0 build\cxi0 /S /Y
XCOPY zh\cxi0_tex build\cxi0 /S /Y
REM FOR /R build\cxi0\exefs\banner %%I IN (*.bcmdl) DO (tools\txobtool -ivfd "%%I" "%%~dpnI" || PAUSE)
REM FOR /R build\cxi0\romfs %%I IN (*.bcres.l10n.bcres) DO (tools\txobtool -ivfd "%%I" "%%~dpnI.dir" || PAUSE)
REM FOR /R build\cxi0\romfs %%I IN (*.bcres.cmp) DO (tools\CmpTool C "%%~dpnI.l10n.bcres" "%%I" || PAUSE)
FOR /R build\cxi0\romfs %%I IN (*.arc.cmp) DO (tools\CmpTool C "%%~dpnI.l10n.arc" "%%I" || PAUSE)
CD /D "%cwdir%"
PAUSE
