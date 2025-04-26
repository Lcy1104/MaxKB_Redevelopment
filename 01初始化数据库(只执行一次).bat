@echo off
CHCP 65001
setlocal enabledelayedexpansion
set "CURRENT_DIR=%~dp0"
set "PGPORT=15432"

for /f "tokens=2 delims=:" %%i in ('findstr /r "^DB_PASSWORD:" conf\config.yml') do (
    set "password=%%i"
    set "password=!password:~1!"
)
set PGPASSWORD=!password!

echo 清理pgsql\data目录中。。。
rd /s /q "pgsql\data"
mkdir "pgsql\data"

cd /d "pgsql"

echo 初始化数据库中。。。

CHCP 936
bin\initdb -D data -U postgres -A password -E utf8 -W

bin\pg_ctl -D data -l logfile start

CHCP 65001
cd /d ..
echo 创建maxkb仓库和vector插件中。。。
pgsql\bin\psql -f installer/init.sql --username postgres

call "miniconda3\condabin\conda.bat" activate
python apps/manage.py migrate

cd /d "pgsql"
bin\pg_ctl -D data -l logfile stop
echo 初始化完毕，按任意键退出或手动关闭cmd

endlocal
pause
