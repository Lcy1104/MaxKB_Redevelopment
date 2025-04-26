@echo off
CHCP 65001
setlocal enabledelayedexpansion
set "CURRENT_DIR=%~dp0"
set "PATH=%CURRENT_DIR%ffmpeg;%PATH%"
call "miniconda3\condabin\conda.bat" activate

start /B python main.py dev local_model
start /B python main.py dev web

:: 尝试运行celery命令
start /B python main.py dev celery
start /B pip install --force-reinstall celery-5.4.0-py3-none-any.whl  --no-index --no-dependencies --no-build-isolation
start /B python main.py dev celery
endlocal
pause