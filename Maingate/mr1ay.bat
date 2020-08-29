	@echo off
	if not "%1"=="" call :Menu
	if  "%1"=="" 	echo my bat program && timeout /t  2 >nul && exit


	:Menu
		if  "%1"=="batboxmouse"		call :batboxmouse 
		if  "%1"=="consolelocation" 	call :consolelocation %2 %3 %4 
		if  "%1"=="consolesize" 	call :consolesize %2 %3 
		if  "%1"=="mbat" 		call :mbat %2 %3 %4 %5 %6 %7 %8 %9
		if  "%1"=="download" 		call :download %2 %3 
		if  "%1"=="versioncontrol" 	call :versioncontrol %2 %3 
		goto :eof

	:download
		::1 link
		::2 file
		wget -O %2 %1 
		goto :eof



	:consolelocation
		if not "%1"=="" (
					title %1
					movewindow %1 %2 %3
					)

		if "%1"=="" 	(
		 			title mr1ayprogram1
					movewindow mr1ayprogram1 0 0
				 	)
					goto :eof


		


	:consolesize
		if not "%1"=="" mode %1,%2
		if  "%1"=="" 	mode 75,25
		goto :eof


	:mbat
		batbox /g %1 %2 /c 0x%3 /d %4 %5 %6 %7 %8
		goto :eof


	
	:versioncontrol
		set /p a=<%1
		set /p b=<%2
		if "%a%"=="%b%"    (
					 echo no need update
					 echo.>youcantdownloadnewversion.mr1ay
					)

		if not "%a%"=="%b%" (
				     echo. 
				     echo yes need update
				     echo you click and download
				     echo.>youcandownloadnewversion.mr1ay
				    )
		goto :eof

	:areyouhere
   		if "%1"=="var?"	if exist %a%.bmp goto a
						

	:batboxmouse
		for /f "delims=: tokens=1,2,3" %%A in ('batbox /m') do (
					set x=%%A
					set y=%%B
					set z=%%C
					)

