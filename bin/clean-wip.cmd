@ECHO OFF

ECHO --------------------
ECHO found the following:
DIR /B "WIP CKL"
ECHO --------------------
SET /P choice=Delete all the files? (Y/N) 

IF /I %choice%==Y (DEL /Q "WIP CKL\*" && ECHO Files Deleted. && ECHO.) ELSE ECHO Nevermind. Nothing Deleted.

