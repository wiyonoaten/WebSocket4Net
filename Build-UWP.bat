@echo off

set fdir="%ProgramFiles%\MSBuild\14.0\Bin"

if not exist %fdir% (
	set fdir="%ProgramFiles(x86)%\MSBuild\14.0\Bin"
)

set msbuild=%fdir%\msbuild.exe

set outDir=bin\UWP\Debug
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S obj') DO RMDIR /S /Q "%%G"
%msbuild% WebSocket4Net.UWP.sln /p:Configuration=Debug /t:Clean;Rebuild /p:OutDir=..\%outDir%

set outDir=%outDir%\WebSocket4Net.UWP
del %outDir%\*.pdb
del %outDir%\*.pri

set outDir=bin\UWP\Release
FOR /F "tokens=*" %%G IN ('DIR /B /AD /S obj') DO RMDIR /S /Q "%%G"
%msbuild% WebSocket4Net.UWP.sln /p:Configuration=Release /t:Clean;Rebuild /p:OutDir=..\%outDir%

set outDir=%outDir%\WebSocket4Net.UWP
del %outDir%\*.pdb
del %outDir%\*.pri

pause