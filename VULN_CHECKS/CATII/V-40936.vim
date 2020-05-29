
"
/V-40936/ 
/FINDING_DETAILS
if search("eric.spears.pa - The default (sysadmin) account was found and disabled.","nez") !=0
?<STATUS>?
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>
endif

"/COMMENTS
":s~<COMMENTS>\(.*\)\|\(.+\)</COMMENTS>~<COMMENTS></COMMENTS>



