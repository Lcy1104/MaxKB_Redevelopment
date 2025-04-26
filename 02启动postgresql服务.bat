@echo off
set "CURRENT_DIR=%~dp0"
set "PGPORT=15432"

cd /d %CURRENT_DIR%pgsql
.\bin\pg_ctl -D data -l logfile start

CHCP 65001
echo PostgreSQL服务已启动，按下任意键关闭服务
pause
.\bin\pg_ctl -D data -l logfile stop






