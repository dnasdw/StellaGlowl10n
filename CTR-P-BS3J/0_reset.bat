SET cwdir=%CD%
SET rootdir=%~dp0
CD /D "%rootdir%"
RD /S /Q cci
RD /S /Q build
RD /S /Q import_temp
DEL StellaGlow.3ds
DEL patch.3ps
DEL zh\icon.ico
DEL StellaGlow.exe
CD /D "%cwdir%"
PAUSE
