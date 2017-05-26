SET cwdir=%CD%
SET rootdir=%~dp0
CD /D "%rootdir%"
FOR /R cci\cxi0\exefs\banner %%I IN (*.bcmdl) DO (tools\txobtool -evfd "%%I" "%%~dpnI" || PAUSE)
FOR /R cci\cxi0\romfs %%I IN (*.arc.cmp) DO (tools\CmpTool U "%%I" "%%~dpnI.l10n.arc" || PAUSE)
REM FOR /R cci\cxi0\romfs %%I IN (*.bcres.cmp) DO (tools\CmpTool U "%%I" "%%~dpnI.l10n.bcres" || PAUSE)
REM FOR /R cci\cxi0\romfs %%I IN (*.bcres.l10n.bcres) DO (tools\txobtool -evfd "%%I" "%%~dpnI.dir" || PAUSE)
FOR /R cci\cxi0\romfs\event %%I IN (*.flw) DO (tools\ExportFlw "%%I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
FOR /R cci\cxi0\romfs\param %%I IN (*.str) DO (tools\ExportStr "%%I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
CD /D "%cwdir%"
PAUSE
