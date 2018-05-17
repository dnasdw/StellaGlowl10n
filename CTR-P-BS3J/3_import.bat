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
MD import_temp\charset
FOR /R cci\cxi0\romfs\font %%I IN (font_common*.bffnt) DO (
tools\bffnt2charset "%%~I" "import_temp\charset\%%~nI.txt" || PAUSE
tools\charset2xlor "import_temp\charset\%%~nI.txt" "tools_temp\NW_FontConverter\xlor\%%~nI.xlor" || PAUSE
tools_temp\NW_FontConverter\NW_FontConverterConsole.exe -i bffnt -if "%%~I" -o image -of "import_temp\charset\%%~nI.bmp" -oo "tools_temp\NW_FontConverter\xlor\%%~nI.xlor" || PAUSE
DEL "tools_temp\NW_FontConverter\xlor\%%~nI.xlor"
COPY "import_temp\charset\%%~nI.txt" "import_temp\charset\%%~nI_2.txt"
CALL :CalculateCharset "import_temp\charset\%%~nI_2.txt"
)
tools\Charset2Bitmap import_temp\charset\font_common_2.txt import_temp\charset\font_common_2.bmp zh\XHei_Classical-Mono.TTC 1 12 0 0 0 1 0 1 0 || PAUSE
tools\MergeBitmap import_temp\charset\font_common.txt import_temp\charset\font_common_2.txt import_temp\charset\font_common.bmp import_temp\charset\font_common_2.bmp || PAUSE
tools\Charset2Bitmap import_temp\charset\font_common2_2.txt import_temp\charset\font_common2_2.bmp zh\XHei_Classical-Mono.TTC 1 14 0 0 0 1 0 -1 0 || PAUSE
tools\MergeBitmap import_temp\charset\font_common2.txt import_temp\charset\font_common2_2.txt import_temp\charset\font_common2.bmp import_temp\charset\font_common2_2.bmp || PAUSE
FOR /R cci\cxi0\romfs\font %%I IN (font_common*.bffnt) DO (
tools\charset2xlor "import_temp\charset\%%~nI_2.txt" "tools_temp\NW_FontConverter\xlor\%%~nI_2.xlor" || PAUSE
tools_temp\NW_FontConverter\NW_FontConverterConsole.exe -i image -if "import_temp\charset\%%~nI_2.bmp" -io "tools_temp\NW_FontConverter\xlor\%%~nI_2.xlor" -ic A4 -o bffnt -of "build\cxi0\romfs\font\%%~nI.bffnt" -oa @ || PAUSE
DEL "tools_temp\NW_FontConverter\xlor\%%~nI_2.xlor"
)
FOR /R build\cxi0\romfs\event %%I IN (*.flw) DO (tools\ImportFlw "%%~I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
FOR /R build\cxi0\romfs\param %%I IN (*.str) DO (tools\ImportStr "%%~I" "%%~dpnI.l10n.txt" "%%~dpnI.l10n.outer.txt" "%%~dpnI.l10n.inner.txt" || PAUSE)
FOR /R build\cxi0\romfs %%I IN (*.arc.l10n.arc) DO (tools\sarctool -cvfd "%%~I" "%%~dpnI.dir" || PAUSE)
FOR /R build\cxi0\romfs %%I IN (*.arc.cmp) DO (tools\CmpTool C "%%~dpnI.l10n.arc" "%%~I" || PAUSE)
POPD
GOTO :EOF

:CalculateCharset
tools\CalculateCharset "%~1" 0 || PAUSE
FOR /R build\cxi0\romfs %%I IN (*.l10n.txt) DO (tools\CalculateCharset "%~1" "%%~I" || PAUSE)
GOTO :EOF
