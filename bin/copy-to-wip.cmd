:: 
:: Matthew McCourry
:: github.com/mbmcc
:: last change 2020 05 28
:: version 0.05
::
:: Some text here to make a short description of the program
::
::
:: A checklist of features
::
::
:: -----------------------------
::  CHANGELOG
:: -----------------------------
:: Newest changes on top
::  v.05
::  - Rewrote menu system to take better advantage of the increased number of
::    functions
::  v.04
::  - Code cleanup and some refactoring
::  v.03
::  - added fucntionality to copy only files in selected dir (for SQL 2016)
::  v.02
::  - added functionality to copy Instance or DB ckls (by filename)
::  v.01 
::  - created skeleton
::  - base function script
  
:: This routine is to copy the potential stig ckls from my copy dir to my wip dir
::
::
::
::
@ECHO OFF
SET Folder=
:: The following is the parent folder where you are working your STIGS
SET StigDir=%USERPROFILE%\Downloads\SQL STIGS

:: The following is the folder in your STIG parent folder where your "production" copy of your STIGS are
SET OfflineArchive=CKLs ready for scoring\Matt M\WIP

:: The following sets the specific STIG Folder for the system you are working
ECHO:
ECHO +---------------------------------------------+
DIR /B "%StigDir%\%OfflineArchive%"
ECHO +---------------------------------------------+
ECHO:
SET /P Folder=What folder do you want to copy from? 
SET ArchiveDir=%StigDir%\%OfflineArchive%\%Folder%

:: The following is the "testing" directory where you will make your STIG changes
SET WorkingDir=%StigDir%\WIP CKL

SET CopyLog=%StigDir%\log\cp_wip.log
::--------------------------

:Menu
ECHO:
ECHO +---------------------------------------------+
ECHO ^| Copy all ckl (F)iles in the directory? (f)  ^|
ECHO ^| Recursive Copy (I)nstance ckl's?       (i)  ^|
ECHO ^| Recursive Copy (D)atabase ckl's?       (d)  ^|
ECHO ^| Recursive Copy (A)ll ckl's?            (a)  ^|
ECHO ^| Do(n)'t copy any of the ckl's          (n)  ^|
ECHO +---------------------------------------------+
ECHO:
SET /P CopyChoice="Which Copy option would you like? "

GOTO Text
::--------------------------


:Text
ECHO:
ECHO Starting Copy
ECHO    From Directory
ECHO  "%ArchiveDir%"
ECHO    To Directory
ECHO  "%WorkingDir%"
ECHO:
ECHO  creating "%CopyLog%"
ECHO  COPY LOG >"%CopyLog%"
ECHO: >"%CopyLog%"

IF /I %CopyChoice%==n GOTO NoCopy
IF /I %CopyChoice%==a GOTO CopyAll
IF /I %CopyChoice%==f GOTO CopyFiles
IF /I %CopyChoice%==i GOTO CopyInstance
IF /I %CopyChoice%==d GOTO CopyDatabase
::--------------------------
:Done
ECHO Done
GOTO EOF

:NoCopy
ECHO No files copied
GOTO Done


:CopyAll
ECHO Copying all files
FOR /F "usebackq delims=" %%F IN (`DIR /S /B "%ArchiveDir%\*SQL*.ckl"`) DO (ECHO copying FROM: "%%F"   TO: "%WorkingDir%">>"%CopyLog%" && COPY "%%F" "%WorkingDir%")
GOTO Done
 

:CopyFiles
ECHO Copying only files in the directory
FOR /F "usebackq delims=" %%F IN (`WHERE "%ArchiveDir%":*SQL*.ckl`) DO (ECHO copying FROM: "%%F"   TO: "%WorkingDir%">>"%CopyLog%" && COPY "%%F" "%WorkingDir%")
GOTO Done


:CopyInstance
ECHO Copying instance files
FOR /F "usebackq delims=" %%F IN (`DIR /S /B  "%ArchiveDir%\*nstance*.ckl"`) DO (ECHO copying FROM: "%%F"   TO: "%WorkingDir%">>"%CopyLog%" && COPY "%%F" "%WorkingDir%")
GOTO Done


:CopyDatabase
ECHO Copying database files
FOR /F "usebackq delims=" %%F IN (`DIR /S /B  "%ArchiveDir%\*C27SQL*DB*.ckl"`) DO (ECHO copying FROM: "%%F"   TO: "%WorkingDir%">>"%CopyLog%" && COPY "%%F" "%WorkingDir%")
GOTO Done


:EOF
