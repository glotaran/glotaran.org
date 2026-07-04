@echo off
setlocal
title pyglotaran starter kit
pushd "%~dp0"

echo.
echo  ============================================================
echo   pyglotaran starter kit
echo  ============================================================
echo.
echo  This window sets everything up and then opens the analysis
echo  environment in your web browser.
echo.
echo  The FIRST time this runs it downloads Python and the
echo  analysis packages, roughly 500 MB, which can take a few
echo  minutes depending on your internet connection.
echo  After that, starting is quick and works offline.
echo.
echo  KEEP THIS BLACK WINDOW OPEN while you work.
echo  Closing it stops the analysis environment.
echo.

rem --- Step 1: make sure the uv Python manager is available ---
where uv >nul 2>&1
if %errorlevel% equ 0 goto uv_present

echo  Step 1/3: Installing the 'uv' Python manager ...
echo.
powershell -NoProfile -ExecutionPolicy ByPass -Command "irm https://astral.sh/uv/install.ps1 | iex"
set "PATH=%USERPROFILE%\.local\bin;%PATH%"
goto uv_check

:uv_present
echo  Step 1/3: The 'uv' Python manager is already installed.

:uv_check
where uv >nul 2>&1
if errorlevel 1 goto no_uv

rem --- Step 2: create the environment and install the packages ---
echo.
echo  Step 2/3: Setting up Python and the analysis packages ...
echo            first run only: this downloads about 500 MB
echo.
uv sync
if errorlevel 1 goto sync_failed

rem --- Step 3: launch JupyterLab ---
echo.
echo  Step 3/3: Opening the analysis environment in your browser ...
echo.
echo  When you are done: save your notebook in the browser, then
echo  close the browser tab and close this window.
echo.
uv run jupyter lab 01_welcome.ipynb

popd
echo.
echo  The analysis environment has stopped. You can close this window.
pause
exit /b 0

:no_uv
echo.
echo  Could not install 'uv'. Are you connected to the internet?
echo  If you are behind a company firewall or proxy, ask your IT
echo  department, or install uv manually from:
echo      https://docs.astral.sh/uv/getting-started/installation/
echo.
pause
popd
exit /b 1

:sync_failed
echo.
echo  Setup did not finish. The most common causes are:
echo   - no internet connection
echo   - a firewall or proxy blocking downloads
echo   - not enough free disk space; about 2 GB is needed
echo.
echo  Running this script again will resume where it left off.
echo.
pause
popd
exit /b 1
