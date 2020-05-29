"EXEC master.sys.xp_loginconfig 'login mode'; 
"
"If the config_value returned is "Windows NT Authentication", this is not a
"finding."
/V-79355/
/<STATUS>/
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>
"
"/FINDING_DETAILS
":s~<FINDING_DETAILS>\(.*\)\|\(.+\)</FINDING_DETAILS>~<FINDING_DETAILS></FINDING_DETAILS>

/COMMENTS/
:s~<COMMENTS>.*</COMMENTS>~<COMMENTS>The Login Mode is set to \&quot;Windows NT Authentication\&quot; per check text\. Compliant with STIG</COMMENTS>



