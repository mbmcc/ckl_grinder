:: Matthew McCourry
:: github.com/mbmcc
:: 2020 05 28
:: version 0.02
::
:: A quick script to pull from remote share
::
::
::
:: -----------------------------
::  CHANGELOG
:: -----------------------------
:: Newest changes on top
::  v.02
::  - Cleaned up and adjusted time var for logging
::  v.01 
::  - created skeleton
:: 
ECHO OFF
:: run date get pos 6 chars 0-4, again for pos 0 chars 0-1, again for 3, 0-1
:: https://superuser.com/questions/951942/getting-date-in-a-batch-file

::for the standard date MMDDYYYY
::SET YYYYMMDD=%DATE:~6,5%%DATE:~0,2%%DATE:~3,2%

:: for YYYY-MM-DD format
SET YYYYMMDD=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%

SET log=%YYYYMMDD%-stig_download.log
ECHO.
IF EXIST %log% (ECHO Appending to %log%) ELSE @ECHO: >%log% 


:CopyToMatt
SECHO -------------------------------------------
ECHO Copying remote %folder% to local %folder%
ECHO.
robocopy /E /MT:128 /XO /LOG+:.\log\%log% "Z:\CKLs ready for scoring\%folder%" ".\CKLs ready for scoring\%folder%"
ECHO Done
ECHO -------------------------------------------

