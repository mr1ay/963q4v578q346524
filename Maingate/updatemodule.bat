	@echo off

	set projectdetailway=gate2\%1\%2.mr1ay
	set projectway=gate2\%1\%2
	set versionway=gate2\%1\%2\%3

	::bilgiyi alan bölge
		::versiyon linkini al 
		::versiyon dosyasının zipli hali
		::version.zip dosyasının açılmış halinin ismi
		::version.zip dosyasının açılmış halindeki version dosyası


	<%projectdetailway% (
			set /p vlink=
			set /p vzip=
			set /p vze=
			set /p vtxt=
			set /p vtxtnew=
			set /p z1=
			set /p updatelink=
			set /p updatedfile=
			set /p extupdatedfile=
			set /p wantupdatefile=
			set /p z1=
			set /p fulllink=
			set /p downloadedfullfile=
			set /p extfullfile=
			set /p wantfullfilename=
			)	

if "%4" =="downloadfullfile" goto :downloadfullversion
	::versiyon bilgisini alan yer
	set /p version_old=<%versionway% 

	:controlversion

cls
		call mr1ay mbat 5 11 1f "Version controlling"
		ping www.google.com -n 1 -w 1 > nul && (

				call mr1ay download %vlink% %vzip%.zip
cls
				goto wait
				) || (
				batbox.exe /g 10 12 /c 0x8c /d "internet not found :("
				batbox.exe /g 10 13 /c 0x8c /d "please open internet :("
				echo.:controlversion>errorr.mr1ay
							start notepad.exe errorr.mr1ay
							timeout /t 2 >nul
							taskkill /im notepad.exe /f
				goto Maingate
				)

			:wait
				timeout /t 1 >nul
				if exist %vzip%.zip goto asdw
				if exist errorr.mr1ay 	(
							start notepad.exe errorr.mr1ay
							timeout /t 2 >nul
							taskkill /im notepad.exe /f
							batbox.exe /g 10 15  /c 0x8c /d " found error"
							batbox.exe /g 10 16  /c 0x8c /d " please again download"
							del errorr.mr1ay

							call Stargate_Project_by_Mr1ay.bat :Maingate
							)
					goto wait

			:asdw
				timeout /t  2 >nul
				7z.exe x %vzip%.zip >nul
				del %vzip%.zip 
				rename %vze% %vtxt% >nul
				set /p version_new=<%vtxt%\%vtxtnew%
				call mr1ay versioncontrol %versionway% %vtxt%\%vtxtnew%

				:wait2
					timeout /t 1 >nul
					if exist youcantdownloadnewversion.mr1ay (
										 echo not found different
										 rd /s /q %vtxt% >nul
										 del youcandownloadnewversion.mr1ay
										 cls
										 call Stargate_Project_by_Mr1ay.bat :Maingate

										 )
					if exist youcandownloadnewversion.mr1ay goto :doyoudownload
					goto wait2




			:doyoudownload
				batbox.exe /g 5 16  /c 0x6e /d "you can download new version .click and download "
				batbox.exe /g 5 17  /c 0xcf /d ". yes i want download ."
				batbox.exe /g 5 18  /c 0xcf /d ". no  i wont download ."
				:Maingateloop2
	
					call mr1ay.bat batboxmouse
					if %y%==0 goto :0
					if %y% geq 2 if %y% leq 5  if %x% geq 5  if %x% leq 30   call Stargate_Project_by_Mr1ay.bat :Maingate
					if %y% geq 2 if %y% leq 5  if %x% geq 30 if %x% leq 60   call Stargate_Project_by_Mr1ay.bat:Stargate
					if %y% == 17 if %x% leq 25 goto :versiondownload
					if %y% == 18 if %x% leq 25 goto :noversion
					goto :Maingateloop2


	:noversion
				rd /s /q %vtxt% >nul
				del youcandownloadnewversion.mr1ay
				cls
				call Stargate_Project_by_Mr1ay.bat :background

				goto :stargate
:e
	:versiondownload
		ping www.google.com -n 1 -w 1 > nul && (


				del youcandownloadnewversion.mr1ay
				del  %vtxt%\%vtxtnew% >nul
				rd /s /q %vtxt% >nul
				batbox.exe /g 50 1 /c 0x8a /d "internet found     :)"
				timeout /t 1 >nul
				call mr1ay download  %updatelink% %updatedfile%.zip
				cls
				7z.exe x %updatedfile%.zip
				del %updatedfile%.zip 
				rename %extupdatedfile% %wantupdatefile%
				move %wantupdatefile% %projectway%\%wantupdatefile% 
				echo.%version_new%>%versionway%		
				cd %projectway%\%wantupdatefile%
				if exist make.bat start make.bat
				
				goto :end
			) || (
				del youcantdownloadnewversion.mr1ay
				echo.versiondowload>errorr.mr1ay
				start notepad.exe errorr.mr1ay
				timeout /t 2 >nul
				taskkill /im notepad.exe /f
				goto :i
			)
				goto :eof




	:downloadfullversion

		ping www.google.com -n 1 -w 1 > nul && (
				batbox.exe /g 50 1 /c 0x8a /d "downloading version     :)"
				timeout /t 1 >nul
				call mr1ay download  %fulllink% %downloadedfullfile%.zip
				cls
				7z.exe x %downloadedfullfile%.zip
				cls
				del %downloadedfullfile%.zip
				rename %extfullfile% %wantfullfilename% 
				move %wantfullfilename% gate1\%wantfullfilename% >nul
				::rd /s /q 
				goto :end
			) || (
				echo.disconnect downloadfullversion>error.mr1ay
				start notepad.exe errorr.mr1ay
				timeout /t 2 >nul
				taskkill /im notepad.exe /f
				goto :i
			)


		:i
				batbox.exe /g 50 1 /c 0x8c /d "internet not found :("

				goto :end


:end
 goto :eof

::::::::::::::::::::::::::::::::
::
::
::
::				
::
::
::
::
::::