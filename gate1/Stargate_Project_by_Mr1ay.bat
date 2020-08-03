	::Edited by Mr1ay
	::TheBateam Member
	::
	::Stargate Project

	@echo off
	:0
	
		cls
		call mr1ay.bat consolesize 
		call mr1ay.bat consolelocation StargateProject 0 0
		color 8f
		cmdwiz showcursor 0
		set a=0
	
	:Menu
	:Maingate

		call mr1ay mbat 12 3 3f ". Maingate ."
		call mr1ay mbat 43 3 6e ". Stargate . "

		For /l %%A in (4,1,10) do call mr1ay mbat 0 %%A 88 "...................................................."

		call mr1ay mbat 5 6 4f "check program version?"
		call mr1ay mbat 5 8 1f ":click please:"

		:Maingateloop

			set /a a=%a%+1
			call mr1ay mbat 0 0 8e %a%
			call :internet

			call mr1ay.bat batboxmouse
				if %y% equ 7 if %x% leq 20 goto :controlversion
				if %y% geq 2 if %y% leq 5  if %x% geq 5  if %x% leq 30 goto :Maingate
				if %y% geq 2 if %y% leq 5  if %x% geq 30 if %x% leq 60 goto :Stargate
				goto :Maingateloop




	:Stargate
		call mr1ay mbat 12 3 6e ". Maingate ."
		call mr1ay mbat 43 3 3f ". Stargate . "

		For /l %%A in (4,1,10) do call mr1ay mbat 0 %%A 88 "...................................................."

		call mr1ay mbat 5 6 4f USER

		call mr1ay mbat 5 8 34 1.
		call mr1ay mbat 5 9 34 2.
		call mr1ay mbat 7 8 81 Mr1ay
		call mr1ay mbat 7 9 8a Mathindos

		:Stargateloop

			set /a a=%a%+1
			call mr1ay mbat 0 0 8e %a%
			call :internet

			call mr1ay.bat batboxmouse
				if %y%==0 goto :0
				if %y% geq 2 if %y% leq 5  if %x% geq 5  if %x% leq 30   goto :Maingate
				if %y% geq 2 if %y% leq 5  if %x% geq 30 if %x% leq 60   goto :Stargate
				if %y% == 8 if %x% leq 20 goto mr1ay
				if %y% == 9 if %x% leq 20 goto mathindos
				goto :Stargateloop




	:Mr1ay
	:Mathindos
		call mr1ay mbat 30 6 1f ". PROJECTS. "

		call mr1ay mbat 28 8 cf 1.
			call mr1ay mbat 30 8 1f Stargate
		call mr1ay mbat 28 9 cf 2.
			call mr1ay mbat 30 9 1f ?



		call mr1ay.bat batboxmouse
			if %y%==0 goto :0
			if %y% geq 2 if %y% leq 5  if %x% geq 5  if %x% leq 30   goto :Maingate
			if %y% geq 2 if %y% leq 5  if %x% geq 30 if %x% leq 60   goto :Stargate
			goto :Mr1ay


	:background
		color 8f
		goto :eof


	:internet
		ping www.google.com -n 1 -w 1 > nul && (
							goto :internetopen
							) || (
							goto :internetclose 
							)

		:internetopen
			batbox.exe /g 50 1 /c 0x8a /d "internet found     :)"
			batbox.exe /g 50 2 /c 0x88 /d "internet not found :("
			goto :eof

		:internetclose
			batbox.exe /g 50 1 /c 0x8c /d "internet not found :("
			batbox.exe /g 50 2 /c 0x88 /d "internet found     :)"
			goto :eof






	:controlversion
		call mr1ay mbat 5 10 1f "Internet controlled"
		call mr1ay mbat 5 11 1f "Version controlling"
		ping www.google.com -n 1 -w 1 > nul && (
							goto :internetopen1
							) || (
							goto :internetclose1
							)
		:internetclose1
			batbox.exe /g 10 12 /c 0x8c /d "internet not found :("
			batbox.exe /g 10 13 /c 0x8c /d "please open internet :("
			goto :eof

		:internetopen1
			start /min up.bat w
			:wait
			batbox.exe /g 5 14  /c 0x8c /d " waiting download "
				timeout /t 1 >nul
				if exist version.zip goto iyi
				if exist error.mr1ay goto hata
				goto wait


				:hata
				 batbox.exe /g 10 15  /c 0x8c /d " found error"
				 batbox.exe /g 10 16  /c 0x8c /d " please again download"
				 goto :Maingate

:iyi
			timeout /t  2 >nul
			7z.exe x version.zip >nul
			rename 2a3435w34j523-master version >nul
			move version\ver.txt %cd% >nul
			rename ver.txt lastversion.mr1ay >nul
			del version.zip 
			rd /s /q version
			call mr1ay versioncontrol version.mr1ay lastversion.mr1ay

	:wait2
		timeout /t 1 >nul
		batbox.exe /g 10 15  /c 0x8c /d " waiting download "
		if exist youcantdownloadnewversion.mr1ay goto :Maingate
		if exist youcandownloadnewversion.mr1ay goto doyoudownload
		goto wait2

	:doyoudownload

		batbox.exe /g 5 11  /c 0x8c /d "you can download new version .click and download "
		batbox.exe /g 5 12  /c 0x8c /d ". download ."

		:Maingateloop

			call mr1ay.bat batboxmouse
			if %y%==0 goto :0
			if %y% geq 2 if %y% leq 5  if %x% geq 5  if %x% leq 30   goto :Maingate
			if %y% geq 2 if %y% leq 5  if %x% geq 30 if %x% leq 60   goto :Stargate
			if %y% == 12 if %x% leq 12 goto versiondownload
			goto :Maingateloop


	:versiondownload
		ping www.google.com -n 1 -w 1 > nul && (
							goto :internetopen2
							) || (
							goto :internetclose2
							)

		:internetclose2
			batbox.exe /g 50 1 /c 0x8c /d "internet not found :("
			batbox.exe /g 50 2 /c 0x8c /d "please open internet :("

			goto :eof

		:internetopen2
			start /min up.bat ww
			batbox.exe /g 50 1 /c 0x8a /d "internet found     :)"


:wait3
				if exist version.zip goto iyi
				if exist error.mr1ay goto hata
goto :wait3







