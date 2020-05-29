
"
/V-40940/ 
/FINDING_DETAILS
if search("eric.spears.pa - The 'SQL Server Reporting Services (MSSQLSERVER)' is not installed.","nez") !=0
?<STATUS>?
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>
endif

"/COMMENTS
":s~<COMMENTS>\(.*\)\|\(.+\)</COMMENTS>~<COMMENTS></COMMENTS>



