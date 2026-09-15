@echo off
setlocal

title Instalador de dependencias Python

where py >nul 2>&1
if errorlevel 1 (
    echo O comando Python Launcher ^(py^) nao foi encontrado.
    echo Tente substituir "py" por "python" neste arquivo.
    pause
    exit /b 1
)

echo Atualizando o pip...
py -m pip install --upgrade pip
if errorlevel 1 (
    echo Falha ao atualizar o pip.
    pause
    exit /b 1
)

echo Instalando dependencias...
py -m pip install requests aiohttp PyQt5 httpx
if errorlevel 1 (
    echo Falha ao instalar uma ou mais dependencias.
    pause
    exit /b 1
)

echo.
echo Dependencias instaladas com sucesso.
echo.
pause
endlocal
