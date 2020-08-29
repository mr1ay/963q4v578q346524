@echo off
if "%1"=="" echo hello this is update file.
if "%1"=="w" goto :versionnumberfile 
if "%1"=="ww" goto :updateversion
if "%1"=="www" goto :downloadfullversion
goto :eof


::versionumberfile 
::https://github.com/mr1ay/645vbh4/archive/master.zip

::updateversion
::https://github.com/mr1ay/a3w4b235/archive/master.zip

::fullversion
::https://github.com/mr1ay/963q4v578q346524/archive/master.zip



	:versionnumberfile 
		::internetopen/internetclose
		ping www.google.com -n 1 -w 1 > nul && (
				call mr1ay download https://github.com/mr1ay/645vbh4/archive/master.zip version.zip
				goto end
			) || (
				batbox.exe /g 50 1 /c 0x8c /d "internet not found :("
				echo.error>error.mr1ay
				goto :end
			)



	:updateversion
		::internetopen/internetclose
		ping www.google.com -n 1 -w 1 > nul && (
				call mr1ay download https://github.com/mr1ay/a3w4b235/archive/master.zip update.zip
				7z.exe x update.zip
				rename a3w4b235-master update
				move update\yap.bat %cd%
				start yap.bat
				goto :end
			) || (
				batbox.exe /g 50 1 /c 0x8c /d "internet not found :("
				echo.error>error.mr1ay
				goto :end
			)



	:downloadfullversion
		::internetopen/internetclose
		ping www.google.com -n 1 -w 1 > nul && (
				call mr1ay download https://github.com/mr1ay/963q4v578q346524/archive/master.zip fullversion.zip
				7z.exe x fullversion.zip
				rename 963q4v578q346524-master fullversion_gate
				::start /min fullversion_gate\yap.bat
				goto :end
			) || (
				batbox.exe /g 50 1 /c 0x8c /d "internet not found :("
				echo.error>error.mr1ay
				goto :end
			)

:end
exit