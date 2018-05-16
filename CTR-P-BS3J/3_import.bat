PUSHD "%~dp0"
RD /S /Q build
MD build\cxi0\exefs
XCOPY cci\cxi0\exefs build\cxi0\exefs /S /Y
MD build\cxi0\romfs
XCOPY cci\cxi0\romfs build\cxi0\romfs /S /Y
XCOPY zh\cxi0 build\cxi0 /S /Y
XCOPY zh\cxi0_tex build\cxi0 /S /Y
REM FOR /R build\cxi0\exefs\banner %%I IN (*.bcmdl) DO (tools\txobtool -ivfd "%%~I" "%%~dpnI" || PAUSE)
REM FOR /R build\cxi0\romfs %%I IN (*.bflim) DO (tools\bflimtool -evfp "%%~I" "%%~dpnI.png" || PAUSE)
REM FOR /R build\cxi0\romfs %%I IN (*.bcres.l10n.bcres) DO (tools\txobtool -ivfd "%%~I" "%%~dpnI.dir" || PAUSE)
REM FOR /R build\cxi0\romfs %%I IN (*.bcres.cmp) DO (tools\CmpTool C "%%~dpnI.l10n.bcres" "%%~I" || PAUSE)
FOR /R build\cxi0\romfs\event %%I IN (*.flw) DO (tools\ImportFlw "%%~I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
FOR /R build\cxi0\romfs\param %%I IN (*.str) DO (tools\ImportStr "%%~I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
FOR /R build\cxi0\romfs %%I IN (*.arc.l10n.arc) DO (tools\sarctool -cvfd "%%~I" "%%~dpnI.dir" || PAUSE)
FOR /R build\cxi0\romfs %%I IN (*.arc.cmp) DO (tools\CmpTool C "%%~dpnI.l10n.arc" "%%~I" || PAUSE)
POPD
