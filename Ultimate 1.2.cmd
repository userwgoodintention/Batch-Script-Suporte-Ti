@echo off  
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
  >nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
  ) ELSE (
  >nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
  )

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
  echo Requesting administrative privileges...
  goto UACPrompt
  ) else ( goto gotAdmin )

:UACPrompt
echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
set params= %*
echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

"%temp%\getadmin.vbs"
del "%temp%\getadmin.vbs"
exit /B

:gotAdmin
pushd "%CD%"
CD /D "%~dp0"

@echo off
title ULTIMATE Tool Suporte TI [Ver1.0] LuanSoftwares©
cls
:menu
mode con cols=75 lines=40
setlocal
call :setESC
color 07
cls
echo   %ESC%[93mULTIMATE Tool Suporte TI: [Versao 1.2] LuanSoftwares(c)©  %ESC%[0m
echo.
echo.
:::                   ___________________
:::                   | _______________ |               
:::                   | |XXXXmsdosXXXX| |
:::                   | |mount c c:\XX| |
:::                   | |c:XXXXXXXXXXX| |
:::                   | |c:cd d1mXXXXX| |
:::                   | |setupXXXXXXXX| |
:::                   |_________________|
:::                       _[_______]_
:::                   ___[___________]___
:::                  |         [_____] []|__
:::                  |         [_____] []|  \__
:::                  L___________________J     \ 
:::                   ___________________      /\
:::                  /###################\    (__)
:::
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
  echo         %ESC%[36m1.%ESC%[0mAtivar e Colocar Senha Padrao do Administrador.
  echo         %ESC%[36m2.%ESC%[0mDesativar o Perfil.
  echo         %ESC%[36m3.%ESC%[0mInstalar CheckList d Programas silenciosamente.
  echo         %ESC%[36m4.%ESC%[0mGerador de Senhas.
  echo         %ESC%[36m5.%ESC%[0mIp Fixo 1.
  echo         %ESC%[36m6.%ESC%[0mIp Fixo 2.
  echo         %ESC%[36m7.%ESC%[0mInstalar programa separado.
  echo         %ESC%[36m8.%ESC%[0mLimpar pastas temporarias.
  echo         %ESC%[36m9.%ESC%[0mVerificar CheckList de Formatacao(Somente Leitura).
  echo         %ESC%[36m10.%ESC%[0mAtivar Windows 10(Precisa de chave).
  echo         %ESC%[36m11.%ESC%[0mVerificar Configuracoes e Informacoes do PC.
  echo         %ESC%[36m12.%ESC%[0mVerificar Todos os Programas instalados no PC.
  echo         %ESC%[36m13.%ESC%[0mInstalar Softwares pela internet(com chocolatey).
  echo         %ESC%[36m14.%ESC%[0mFazer Pendrive Bootavel Windows 7 mini(quebrar senha).
  echo         %ESC%[36m15.%ESC%[0mContato e Informacoes do Software.
  echo.
  echo        Computador: %computername%        Usuario: %username%
  echo.
  echo.    
  set /p opcao= Escolha uma opcao:
  echo.
  if %opcao% equ 1 goto opcao1
  if %opcao% equ 2 goto opcao2
  if %opcao% equ 3 goto opcao3
  if %opcao% equ 4 goto opcao4
  if %opcao% equ 5 goto opcao5
  if %opcao% equ 6 goto opcao6
  if %opcao% equ 7 goto opcao7
  if %opcao% equ 8 goto opcao8
  if %opcao% equ 9 goto opcao9
  if %opcao% equ 10 goto opcao10
  if %opcao% equ 11 goto opcao11
  if %opcao% equ 12 goto opcao12
  if %opcao% equ 13 goto opcao13
  if %opcao% equ 14 goto opcao14
  if %opcao% equ 15 goto opcao15
  if %opcao% GEQ 16 goto opcao16



  :opcao1
  cls
  echo.
  echo    %ESC%[43mAtivando Perfil%ESC%[0m
  echo.
  SET /P PERFIL1= Digite o nome do perfil ex(Administrador):
net user %PERFIL1% /active:yes && goto erromsg5 || goto erromsg4
echo.
pause
goto menu


:erromsg5
echo  %ESC%[42mAtivado Perfil de Admin com sucesso%ESC%[0m
echo.
echo    %ESC%[43mDigite a Senha%ESC%[0m
net user %PERFIL1% * && goto erromsg3 || goto erromsg4
pause
goto menu

:erromsg3
echo  %ESC%[42mSenha Cadastrada com sucesso%ESC%[0m
echo.
pause
goto menu

:erromsg4
echo  %ESC%[41malguma coisa deu errado(contate o Desenvolvedor)%ESC%[0m
echo.
pause
goto menu


:opcao2
cls
echo.
echo    %ESC%[43mDesativando Perfil%ESC%[0m
echo.
SET /P PERFIL= Digite o nome do perfil ex(Convidado):
net user %PERFIL% /active:no && goto erromsg1 || goto erromsg2
echo.
pause
goto menu

:erromsg1
echo  %ESC%[42mPerfil Desativado Com Sucesso.%ESC%[0m
echo.
pause
goto menu

:erromsg2
echo  %ESC%[41mPerfil nao foi desativado%ESC%[0m
echo.
pause
goto menu


:opcao3
cls
echo.
echo.
echo.
echo         %ESC%[36m1.%ESC%[0mInstalar programas principais silenciosamente
echo         %ESC%[36m2.%ESC%[0mLista de Programas
echo                                                   3.Sair.
choice /C 12345 /N /M "Escolha:"
if errorlevel 3 goto :POPSAIR
if errorlevel 2 goto :INSTALL2
if errorlevel 1 goto :INSTALL1

:POPSAIR
goto menu


:INSTALL1
cls
echo.
==================================================================
echo   Instalando Adobe Reader                (passo 1 de 8)
==================================================================
start /wait msiexec /i "%~dp0\ProgramasSilent\adobe\AcroRead.msi" /qn

echo.
==================================================================
echo   Instalando Google Chrome               (passo 2 de 8)
==================================================================

start /wait msiexec /i "%~dp0\ProgramasSilent\chrome\GoogleChromeStandaloneEnterprise64.msi" /qn

echo.
==================================================================
echo   Instalando Mozilla Firefox             (passo 3 de 8)
==================================================================

start /wait msiexec /i "%~dp0\ProgramasSilent\firefox\Firefox Setup 73.0.1.msi" /qn

echo.
==================================================================
echo   Instalando java 32 e 64bits            (passo 4 de 8)
==================================================================

start /wait %~dp0/ProgramasSilent\java/jre-8u241-windows-x64.exe /s INSTALLDIR=C:\java\jre64
start /wait %~dp0/ProgramasSilent\java/jre-8u241-windows-i586.exe /s INSTALLDIR=C:\java\jre86


echo.
==================================================================
echo   Instalando pdfsam-v3                   (passo 5 de 8)
==================================================================

start /wait msiexec /i "%~dp0\ProgramasSilent\pdfsam\pdfsam-v3.3.0.msi" /qn

echo.
==================================================================
echo   Instalando libreoffice com HelpPack    (passo 6 de 8)
==================================================================
If not exist C:\install\logs\ md C:\install\logs\
start /wait %~dp0\ProgramasSilent\libreoffice\LibreOffice_6.3.5_Win_x64.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR
start /wait %~dp0\ProgramasSilent\libreoffice\LibreOffice_6.3.5_Win_x64_helppack_pt-BR.msi /qn ALLUSERS=1 CREATEDESKTOPLINK=1 REGISTER_ALL_MSO_TYPES=0 REGISTER_NO_MSO_TYPES=1 ISCHECKFORPRODUCTUPDATES=0 QUICKSTART=0 ADDLOCAL=ALL UI_LANGS=pt_BR

echo.
==================================================================
echo   Instalando 7-ZIP                       (passo 7 de 8)
==================================================================
start /wait msiexec /i "%~dp0\ProgramasSilent\7-zip\7z1900-x64.msi" /qn

echo.
==================================================================
echo   Instalando TeamViewer10host            (passo 8 de 8)
==================================================================
start /wait msiexec /i "%~dp0\ProgramasSilent\teamviewer\TeamViewer_Host-idc2vgck97.msi" /qn

regedit /s "%~dp0\ProgramasSilent\teamviewer\TeamViewer_Settings.reg"



echo.
==================================================================
echo   concluido
==================================================================

pause
goto menu

:INSTALL2
echo ----------------------------------------------
echo # Adobe Reader 11.0.23                       #
echo # Google Chrome Stand alone Enterprise       #
echo # Mozilla Firefox 73.0.1                     #
echo # jre-8u241-windows-x64                      #
echo # jre-8u241-windows-i586                     #
echo # 7-ZIP 19.00                                #
echo # LibreOffice_6.3.5 com help pack            #
echo ----------------------------------------------
pause
goto opcao3



:opcao4
@echo off
:Start2
cls
goto Start
:Start
title Password Generator
echo I will make you a new password. 
echo Please write the password down somewhere in case you forget it. 
echo ----------------------------------------¬-----------------------
echo 1) 1 Random Password
echo 2) 5 Random Passwords
echo 3) 10 Random Passwords
echo Input your choice
set input=
set /p input= Choice: 
if %input%==1 goto A if NOT goto Start2
if %input%==2 goto B if NOT goto Start2
if %input%==3 goto C if NOT goto Start2
:A
cls
echo Your password is %random%
echo Now choose what you want to do. 
echo 1) Go back to the beginning
echo 2) Exit
set input=
set /p input= Choice: 
if %input%==1 goto Start2 if NOT goto Start 2
if %input%==2 goto Exit if NOT goto Start 2
:B
cls
echo Your 5 passwords are %random%, %random%, %random%, %random%, %random%.
echo Now choose what you want to do. 
echo 1) Go back to the beginning
echo 2) Exit
set input=
set /p input= Choice: 
if %input%==1 goto Start2 if NOT goto Start 2
if %input%==2 goto Exit if NOT goto Start 2
:C
cls
echo Your 10 Passwords are %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%
echo Now choose what you want to do. 
echo 1) Go back to the beginning
echo 2) Exit
set input=
set /p input= Choice: 
if %input%==1 goto Start2 if NOT goto Start 2
if %input%==2 goto Exit if NOT goto Start 2
:Exit
goto menu

:opcao5
SET /P IP= Digite o IP:
SET /P MASCARA= Digite a MASCARA:
SET /P GATEWAY= Digite o GATEWAY:
SET /P DNS= Digite o DNS:
SET /P DNS2= Digite o DNS2:
@echo off
set INTERFACE=Ethernet
set IP=%IP%
set MASCARA=%MASCARA%
set GATEWAY=%GATEWAY%
set DNS=%DNS%
set DNS2=%DNS2%
:CONFIRMAR
  rem opções
  choice /C FAC /M "Pressione: [F]ixo, [A]utomatico ou [C]ancelar"
  IF errorlevel=3 goto FIM
  IF errorlevel=2 goto AUTOMATICO
  IF errorlevel=1 goto FIXO
  goto CONFIRMAR
  :FIXO
  netsh interface ip set address name="%INTERFACE%" static %IP% %MASCARA% %GATEWAY% 1
  netsh interface ip set dnsservers name="%INTERFACE%" static %DNS% primary no
  netsh intERFACE ip set dnsservers name="%INTERFACE%" static %DNS2% index=2
  goto :FIM
  :AUTOMATICO
  netsh interface ip set address name="%INTERFACE%" dhcp
  netsh interface ip set dnsservers name="%INTERFACE%" dhcp
  goto :FIM
  :FIM
  goto menu




  :opcao6
  @echo off
  set INTERFACE=Ethernet
  set IP=
  set MASCARA=
  set GATEWAY=
  set DNS=
  set DNS2=
  :CONFIRMAR
  rem opções
  choice /C FAC /M "Pressione: [F]ixo, [A]utomatico ou [C]ancelar"
  IF errorlevel=3 goto FIM
  IF errorlevel=2 goto AUTOMATICO
  IF errorlevel=1 goto FIXO
  goto CONFIRMAR
  :FIXO
  netsh interface ip set address name="%INTERFACE%" static %IP% %MASCARA% %GATEWAY% 1
  netsh interface ip set dnsservers name="%INTERFACE%" static %DNS% primary no
  netsh intERFACE ip set dnsservers name="%INTERFACE%" static %DNS2% index=2
  goto :FIM
  :AUTOMATICO
  netsh interface ip set address name="%INTERFACE%" dhcp
  netsh interface ip set dnsservers name="%INTERFACE%" dhcp
  goto :FIM
  :FIM
  goto menu

  :opcao7
  msiexec /i "%~dp0\aker\akerclient-2.0.8-pt-win64-install-0005.msi"
  goto menu



  :opcao8
  cls
  cleanmgr.exe /sagerun:n && goto erromsg6 || goto erromsg9

  :erromsg6
  echo.
  echo   %ESC%[42mLimpado Arquivos Temporarios da internet.%ESC%[0m
  del /s /f /q C:\Windows\Temp\*.* && goto erromsg7 || goto erromsg9


  :erromsg7
  echo.
  echo   %ESC%[42mLimpado Arquivos Temporarios do Sistema.%ESC%[0m
  del /f /q C:\Users\%username%\AppData\Local\temp && goto erromsg8|| goto erromsg9


  :erromsg8
  echo.
  echo   %ESC%[42mLimpado Arquivos Temporarios do Usuario.%ESC%[0m
  pause
  goto menu

  :erromsg9
  echo.
  echo   ESC%[41m Algo errado nao esta certo.%ESC%[0m
  echo.
  pause
  goto menu


  :opcao9
  mode 110,55
  color 70
  echo =====================================================================================
  echo *
  echo * 0 verificar o nome do computador antes de formatar
  echo *   e verificar se tem backup (EXTREMA IMPORTANCIA)
  echo *
  echo * 1 ativar administrador e colocar a senha de Administrador
  echo * 2 instalar programas padrao:
  echo *
  echo *
  echo * 3 colocar nome da maquina e colocar maquina no dominio
  echo *   atalho: windows+ pausebreak
  echo *   dominio
  echo *   e trocar nome da maquina
  echo *
  echo * 4 instalar programas que precisam da internet
  echo *   firefox
  echo *   instalar Antivirus mais atualizado
  echo *
  echo * 5 instalar drivers(precisa de internet)
  echo *   usar programa DRIVER BOOSTER(desabilitar opcao de instalar o opera) ou
  echo *   ir no gerenciador de dispositivos(atalho: windows + pausebreak) e atualizar os driver
  echo *
  echo * 6 ativar o windows
  echo *
  echo *
  echo * 7 voltar o backup para o disco local (C);
  echo *
  echo *
  echo *
  echo *   obs: caso seja necessario fazer uma limpeza fisica.
  echo *
  echo *   como fazer mapeamento de pasta compartilhada:
  echo *
  echo *   1 abrir executar e digitar \\pasta compartilhada
  echo *   2 abrir o cmd e digitar start \\pasta compartilhada
  echo *   3 clica na pasta solicitada e com botao direito e seleciona conectar
  echo *
  echo *
  echo *
  echo *   como mapear impressora em rede:
  echo *
  echo *   1 abrir executar e digitar \\servidor de impressao
  echo *   2 abrir o cmd e digitar start \\servidor de impressao
  echo *   3 clica na impressora  solicitada e com botao direito e seleciona conectar
  echo *
  echo ==============================================
  pause
  goto menu





  :opcao10
  @echo off
  fltmc >nul 2>&1 || (
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\GetAdmin.vbs"
    echo UAC.ShellExecute "%~fs0", "", "", "runas", 1 >> "%temp%\GetAdmin.vbs"
    cmd /u /c type "%temp%\GetAdmin.vbs">"%temp%\GetAdminUnicode.vbs"
    cscript //nologo "%temp%\GetAdminUnicode.vbs"
    del /f /q "%temp%\GetAdmin.vbs" >nul 2>&1
    del /f /q "%temp%\GetAdminUnicode.vbs" >nul 2>&1
    exit
    )
  mode con cols=70 lines=40
  color
  title Ativacao do Windows 10 (SESP)
  ::===========================================================================
  setlocal enabledelayedexpansion
  setlocal EnableExtensions
  pushd "%~dp0"
  cd /d "%~dp0"
  :MAINMENU
  echo.  
  echo.
  echo         %ESC%[36m1.%ESC%[0mAtivar Windows 10 com Licenca Digital.
  echo.
  echo         %ESC%[36m2.%ESC%[0mChecar Status de Ativacao do Windows.
  echo.
  echo         %ESC%[36m3.%ESC%[0mSair.
  echo.
  echo.  
  choice /C:123 /N /M "ESCOLHA : "
  if errorlevel 3 goto :Sair
  if errorlevel 2 goto :Check
  if errorlevel 1 goto :Ativar

  ::===========================================================================

  :Sair
  goto menu
  ::===========================================================================
  :Ativar
  @echo off
set slp=SoftwareLicensingProduct
set sps=SoftwareLicensingService
FOR /F "tokens=3" %%I IN ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" ^| findstr CurrentVersion ^| findstr REG_SZ') DO (SET winver=%%I)
for /f "tokens=2* delims= " %%a in ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v "PROCESSOR_ARCHITECTURE"') do if "%%b"=="AMD64" (set vera=x64) else (set vera=x86)
for /f "tokens=2 delims== " %%A in ('"wmic path %slp% where (Name LIKE '%%Windows%%' and PartialProductKey is not null) get LicenseStatus /format:list"') do set status=%%A
for /f "tokens=2 delims=, " %%A in ('"wmic path %slp% where (Name LIKE '%%Windows%%' and LicenseStatus='%status%') get name /value"') do set osedition=%%A
echo  %ESC%[44mSeu Sistema Operacional atual: Windows 10 %osedition% %vera%%ESC%[0m
echo.
echo             ex:(XXX23-33346-54235-6366-52344)
SET /P CHAVE= Digite a sua chave para Ativacao.
cscript slmr.vbs /ipk %CHAVE%
cscript slmr.vbs /skms.lotro.cc
cscript slmgr.vbs /ato
pause
goto menu
  ::=====================================================================================
  :Check
  cd /d "%~dp0" && ( if exist "%temp%\getadmin.vbs" del "%temp%\getadmin.vbs" ) && fsutil dirty query %systemdrive% 1>nul 2>nul || (  cmd /u /c echo Set UAC = CreateObject^("Shell.Application"^) : UAC.ShellExecute "cmd.exe", "/k cd ""%~sdp0"" && ""%~s0""", "", "runas", 1 >> "%temp%\getadmin.vbs" && "%temp%\getadmin.vbs" && exit /B )
  CLS
  mode con cols=70 lines=40
  echo    %ESC%[43m Checando o Status de Ativacao %ESC%[0m
  echo.
  cscript //nologo %systemroot%\System32\slmgr.vbs /dli
  cscript //nologo %systemroot%\System32\slmgr.vbs /xpr
  ECHO ____________________________________________________________
  )
echo.
echo Pressione qualquer tecla para continuar...
pause >nul
CLS
mode con cols=60 lines=25
GOTO MAINMENU
  ::===============================================================================================================
  goto menu

  :opcao11
  mode 110,55
  systeminfo
  pause
  goto menu

  :opcao12
  mode 110,55
  wmic product get name
  pause
  goto menu

:opcao13
ECHO OFF
mode 110,50
echo [A] Instalar a Aplicacao Chocolatey(precisa reiniciar o pc).
echo.
echo [B] ja possuo o chocolatey e quero instalar um novo software(ex: Choco install adobereader).
echo entre no site para verificar todos os pacotes possiveis de instalacao (https://chocolatey.org/packages)
echo.
echo [C] Voltar ao Menu Principal.
echo.
choice /C ABC /N /M "Escolha:"
if errorlevel 3 goto :CHOCOSAIR
if errorlevel 2 goto :CHOCOINSTALL
if errorlevel 1 goto :CHOCO
::==============================================================================================================
:CHOCOINSTALL
cls
mode 70,40
cmd.exe
goto menu
::===============================================================================================================
:CHOCO
@"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "[System.Net.ServicePointManager]::SecurityProtocol = 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
goto menu
::===============================================================================================================
:CHOCOSAIR
goto menu

:opcao14
echo Sera necessario um Pendrive que podera ser formatado!!
echo Deseja continuar?
choice /C SN /N /M " [S] SIM  [N]NAO  Escolha:"
if errorlevel 2 goto :bootoff
if errorlevel 1 goto :booton

:booton
echo (ATENCAO!!! esse comando vai formatar o Pendrive em NTFS)
SET /P USB= Digite e letra do Diretorio USB (C:, D:, E: etc):
format %USB%: /FS:NTFS /X /Q
XCOPY %~dp0\ProgramasSilent\miniwin7 "%USB%:\" /c /g /d /i /e /h /-y
echo %ESC%[42mpendrive Bootavel criado com sucesso.%ESC%[0m
pause
goto menu

:bootoff
goto menu

:opcao15
echo off
echo ==============================================
echo * Para Duvidas e Sugestoes segue o contato:  *
echo * Email:luanrodriguesleite@gmail.com         *
echo * Versao: 1.2                                *
echo * Codename:KnightRider                       *
echo * Desenvolvedor: Luan Rodrigues Leite        *
echo ==============================================
choice /C AB /N /M " [A] Voltar  [B]EasterEgg  Escolha:"
if errorlevel 2 goto :SENHAS
if errorlevel 1 goto :MENUP
  ::===========================================================================
  :MENUP
  goto menu
  ::===========================================================================
  :SENHAS

  set Password2=KnightRider
  set Password3=knightrider
  set Password4=matrix
  set Password5=snake
  set Password6=msdos
  set Password7=MSDOS
  goto CHECK

  :CHECK
  echo EasterEgg
  set /p pass="Password=> "
  if %pass%==%Password2% goto OPEN2
  if %pass%==%Password3% goto OPEN2
  if %pass%==%Password4% goto OPEN4
  if %pass%==%Password5% goto OPEN5
  if %pass%==%Password6% goto OPEN6
  if %pass%==%Password7% goto OPEN6
  If NOT %pass%==%Password2%%Password3%%Password4%%Password5%%Password6%%Password7% goto FAIL
  goto END

  :OPEN6
  XCOPY %~dp0\ProgramasSilent\msdos C:\ /c /g /d /i /e /h /-y

  "%~dp0\ProgramasSilent\dosbox\DOSBox.exe"
  goto menu



  :OPEN5
  start %~dp0/ProgramasSilent\dosbox\snake.cmd
  goto menu
  :FAIL
  echo.
  echo.
  echo         %ESC%[41mERROU IRMAO%ESC%[0m
  pause
  goto opcao15

  :OPEN4
  echo       Tome a Pilula AZUL volte a vida para o normal.
  echo       Tome a Pilula VERMELHA e entre na MATRIX.
  choice /C AV /N /M "          [A]AZUL  [V]VERMELHA  Escolha:"
  if errorlevel 2 goto :VERMELHA
  if errorlevel 1 goto :AZUL

  :AZUL
  goto menu

  :VERMELHA
  @echo off
  :a
  color 2
  echo 1 1 1 0 1 0 0 0 1 1 1 1 0 0 0 1 1 0 0 1 0 0 0 1 1 0 1 0 1 0 0 0 1 1 1 1
  ping localhost -n 1 > nul
  echo 1 1 0 1 1 1 0 0 0 1 0 1 0 1 2 0 0 0 1 0 1 1 0 0 1 1 1 0 0 1 0 1 0 0 1 1 0
  echo 1 0 0 1 1 0 9 8 1 2 0 1 9 9 2 1 1 1 0 0 1 0 1 1 1 0 1 1 0 1 0 0 0 1 0 1 1
  ping localhost -n 1 > nul
  echo 0 1 0 0 0 1 0 0 0 1 0 0 0 1 0 1 0 0 1 0 1 0 1 1 0 1 0 0 0 0 1 0 1 0 0 1 0
  ping localhost -n 1 > nul
  echo 1 0 1 1 1 0 1 1 0 9 1 1 2 1 1 0 9 1 0 5 7 7 8 7 8 1 3 2 1 2 1 2 3 2 1 3 4
  ping localhost -n 1 > nul
  echo 1 1 1 0 1 0 0 1 0 0 0 1 1 1 0 0 1 1 1 4 1 2 1 1 2 0 1 0 1 2 2 1 0 1 1 0 1
  goto a

  :OPEN2
  mode 79,32
  echo                                 _versao 1.0
  echo                              ==(W{==========-      /===-
  echo                                [   (.--.)         /---=-_---~~~~~~~----__
  echo                                [ \_,[**],__      ]===-~___            _,-'`
  echo                   -==\\        `\ ' `--'   ),    `//~\\   ~~~~`--._.-~
  echo               ______-==[        /`\_. .__/\ \    ] ]  \\          _-~`
  echo            -~~~  ,-/-==\\      (   [ .  ]  ~~]   ] ]   `\       ,'
  echo         __--~~~  ,-/-==\\      (   [ .  ]  ~~]   ] ]   `\       ,'
  echo      _-~       /'    [  \\     )__/=-0--=\}{/   / /      \     /
  echo    .'        /       [   \\      /~\___/~~\/  /' /        \   /
  echo   /  ____  /         [    \`\.__/-~~   \  ]_/'  /          \/'
  echo  /-'~    ~~~~~---__  [     ~-/~         ( )   /'        _--~`
  echo                    \_[      /        _) [ ;  ),   __--~~
  echo                      '~~--_/      _-~/- []\   '-~ \
  echo                     {\__--_/}    / \\}-]){__\      \
  echo                     /'   (_/  _-~  ] ]__}--{__]      ]
  echo                    [   _/) )-~     ] ]__}--{__]      ]
  echo                    / /~ ,_/       / /__}---{__/      ]
  echo                   o-o _//        /-~_}---{__-~      /
  echo                   (*(~          /~_}---{__-      _-~
  echo                  ,/[           /__{--{__/     _-~
  echo               ,//('(          [__}--{__]     /                  .--_
  echo              ( ( '))          [__}--{__]    ]                 /' _-_~\
  echo           `-)) )) (           [__}--{__]    ]               /'  /   ~\`\
  echo          ,/,'//( (             \__}--{__\    \            /'  //      [[
  echo        ,( ( ((, ))              ~-__}--{_~-_  ~--__---~'/'/  /'       VV
  echo      `~/  )` ) ,/]                ~-_~}--{_/-__      __-~ _/
  echo    ._-~//( )/ )) `                    ~~-'_/_/ /~~~~~__--~
  echo     ;'( ')/ ,)(                              ~~~~~~~~
  echo    ' ') '( (/
pause
goto menu


:opcao16
echo                       %ESC%[41m###########################%ESC%[0m
echo                       %ESC%[41m#  ESTA OPCAO NAO EXISTE  #%ESC%[0m
echo                       %ESC%[41m###########################%ESC%[0m
pause
goto menu
:setESC
for /F "tokens=1,2 delims=#" %%a in ('"prompt #$H#$E# & echo on & for %%b in (1) do rem"') do (
  set ESC=%%b
  exit /B 0
  )

'
