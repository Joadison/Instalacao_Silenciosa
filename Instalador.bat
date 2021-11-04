# Instalacao_Silenciosa
@echo off
@title “CATI - CENTRAL DE ATENDIMENTO EM TI”
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo ::: CATI - CENTRAL DE ATENDIMENTO EM TI
echo ::: PROGRAMA.: INSTALACAO DE MICROS
echo ::: VERSAO...: 1.0.1
echo ::: DATA.....: 22/10/2021
echo ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
echo .
echo ----------------------

echo  INSTALANDO PROGRAMAS

echo ----------------------
echo .
echo === Desinstalar Kaspersky ====
setup_kes.exe /pKLLOGIN=KLAdmin /pKLPASSWD=@kaspersky_tjce /s /x
msiexec.exe /x {7EC66A9F-0A49-4DC0-A9E8-460333EA8013} KLPASSWD=@kaspersky_tjce /qn
msiexec.exe /x {32A3A4F4-B792-11D6-A78A-00B0D0170510} /qn
echo .
echo === Enviado CPA Assinador ====
xcopy "\\FCBDEINF2153660\WinCDP\Programas\Assinador_CPA.exe" "%appdata%\Microsoft\Windows\Start Menu\Programs\Startup" /Y
echo .
echo === Enviado o Arquivo UVNC ====
xcopy "\\FCBDEINF2153660\WinCDP\Programas\UltraVNC.ini" "C:\Program Files\uvnc bvba\UltraVNC" /-Y
echo .
echo  === Movendo AnyDesk  ===
xcopy "\\FCBDEINF2153660\WinCDP\Programas\AnyDesk.exe" "C:\Users\Public\Desktop" /Y
echo .
echo === CRIANDO PASTA SCAN ===
MD "C:\Scan"
icacls "C:\scan" /grant Todos:(OI)(CI)F /T
net share scan="C:\scan"
echo.
echo === Instalando JAVA ====
\\FCBDEINF2153660\WinCDP\Programas\jre-8u281-windows-x64.exe /s
echo .
echo === Instalando Kaspersky ====
\\FCBDEINF2153660\WinCDP\Programas\installer.exe  /s
echo .
echo === Instalando Itom ====
\\FCBDEINF2153660\WinCDP\Programas\TJITOM_FORCE.exe
echo .
echo  === SAJPG === 
C:\Saj\sajpg5\sajpg5.exe
echo .
echo .
echo .
echo ---REINCIANDO---
shutdown -r -t 120
pause
