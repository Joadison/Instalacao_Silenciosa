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
setup_kes.exe  /s /x
msiexec.exe /x {}  /qn
msiexec.exe /x {} /qn
echo .
echo === Enviado CPA Assinador ====
xcopy "" "" /Y
echo .
echo === Enviado o Arquivo UVNC ====
xcopy "" "" /-Y
echo .
echo  === Movendo AnyDesk  ===
xcopy "" "" /Y
echo .
echo === CRIANDO PASTA SCAN ===
MD "C:\Scan"
icacls "C:\scan" /grant Todos:(OI)(CI)F /T
net share scan="C:\scan"
echo.
echo === Instalando JAVA ====
jre-8u281-windows-x64.exe /s
echo .
echo === Instalando Kaspersky ====
installer.exe  /s
echo .
echo === Instalando Itom ====
TJITOM_FORCE.exe
echo .
echo .
echo .
echo ---REINCIANDO---
shutdown -r -t 120
pause
