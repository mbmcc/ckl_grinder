"
/V-40935/ 
/FINDING_DETAILS
if search("eric.spears.pa - xp_cmdshell is disabled.","nez") !=0
?<STATUS>?
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>
endif

"/COMMENTS
":s~<COMMENTS>\(.*\)\|\(.+\)</COMMENTS>~<COMMENTS></COMMENTS>



