@echo off

pushd %~dp0

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo You need to run this script as administrator
	pause
	goto end
)

"./Ubuntu Mono derivative Powerline.ttf"
"./Ubuntu Mono derivative Powerline Bold Italic.ttf"
"./Ubuntu Mono derivative Powerline Bold.ttf"
"./Ubuntu Mono derivative Powerline Italic.ttf"

set VIMDIR=%programfiles(x86)%\vim

echo VIMDIR=%VIMDIR%

echo copying _gvimrc
cp _gvimrc "%VIMDIR%"
echo copying _vimrc
cp _vimrc "%VIMDIR%"
echo copying vim74 folder
cp -r vim74 "%VIMDIR%"

echo setting up vim plugins
set PATH=%PATH%;%VIMDIR%\vim74
gvim +PlugInstall +qa

echo done!
timeout /t 5

popd

:end