:: 
:: Matthew McCourry
:: github.com/mbmcc
:: 2020 05 28
:: version 0.02
::
:: Just a quick program to copy a bunch of file names to the clipboard
::
:: -----------------------------
::  CHANGELOG
:: -----------------------------
:: Newest changes on top
::  v.02
::  - added functionality to make multiple selections from one prompt
::  v.01 
::  - created skeleton
::  - base function script
:: 
:: This routine is to create a list of ckls to edit and put the list on the clipboard for inport into an editor
::
::

@ECHO Off
SET CKLVersion=
SET CopyDir=.
SET user=Matt M
::SET folder=
SET WipDir=%USERPROFILE%\Downloads\SQL STIGS\CKLs ready for scoring\%user%\WIP
DIR /B "%WipDir%"

SET /P folder=What folder do you want to copy (. for all)? 

SET CopyDir=%USERPROFILE%\Downloads\SQL STIGS\CKLs ready for scoring\%user%\WIP\%folder%

ECHO From Directory
ECHO "%CopyDir%"




SET /P CopyType="Copy Instance ckl's? (i) : Database ckl's (d) : All (a) : None (n) "

IF /I %CopyChoice%==n GOTO NoCopy
IF /I %CopyChoice%==a GOTO CopyAll
IF /I %CopyChoice%==i GOTO CopyInstance
IF /I %CopyChoice%==d GOTO CopyDatabase

:CopyInstance
DIR /S /B  "%CopyDir%\*nstance*%CKLVersion%*.ckl" | clip.exe
GOTO Done

:CopyDatabase
DIR /S /B  "%CopyDir%\*SQL*DB*%CKLVersion%*.ckl" | clip.exe

GOTO Done

:CopyAll
DIR /S /B  "%CopyDir%\*SQL*%CKLVersion%*.ckl" | clip.exe
GOTO Done

:Done
ECHO Clipboard filled with file list
GOTO EOF

:NoCopy
ECHO Nothing copied to clipboard
:EOF
