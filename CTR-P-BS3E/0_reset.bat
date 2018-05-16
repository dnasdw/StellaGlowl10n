PUSHD "%~dp0"
RD /S /Q cci
RD /S /Q build
RD /S /Q import_temp
DEL "Stella Glow (USA) (zh).3ds"
DEL patch.3ps
DEL zh\icon.ico
DEL BS3ETOOLS.exe
POPD
