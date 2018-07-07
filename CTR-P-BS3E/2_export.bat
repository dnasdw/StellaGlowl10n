PUSHD "%~dp0"
FOR /R cci\cxi0\exefs\banner %%I IN (*.bcmdl) DO (tools\txobtool -evfd "%%~I" "%%~dpnI" || PAUSE)
FOR /R cci\cxi0\romfs %%I IN (*.arc.cmp) DO (tools\CmpTool U "%%~I" "%%~dpnI.l10n.arc" || PAUSE)
FOR /R cci\cxi0\romfs %%I IN (*.arc.l10n.arc) DO (tools\sarctool -xvfd "%%~I" "%%~dpnI.dir" || PAUSE)
FOR /R cci\cxi0\romfs %%I IN (*.bflim) DO (tools\bflimtool -dvfp "%%~I" "%%~dpnI.png" || PAUSE)
REM FOR /R cci\cxi0\romfs %%I IN (*.bcres.cmp) DO (tools\CmpTool U "%%~I" "%%~dpnI.l10n.bcres" || PAUSE)
REM FOR /R cci\cxi0\romfs %%I IN (*.bcres.l10n.bcres) DO (tools\txobtool -evfd "%%~I" "%%~dpnI.dir" || PAUSE)
FOR /R cci\cxi0\romfs %%I IN (*.bflyt) DO (tools\bflyttool -evft "%%~I" "%%~dpnI.l10n.txt" || PAUSE)
FOR /R cci\cxi0\romfs\event %%I IN (*.flw) DO (tools\ExportFlw "%%~I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
FOR /R cci\cxi0\romfs\param %%I IN (*.str) DO (tools\ExportStr "%%~I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
POPD
