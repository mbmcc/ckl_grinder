
" Leave it as OPEN.  Comment: SQL is clustered utilizing 3rd party software, which uses NT_Authority\SYSTEM as the cluster management account.  Reducing permissions breaks cluster functionality.  Contacting manufacturer to find a solution to this issue.

/V-79129/
/<STATUS>/
:s~<STATUS>.*</STATUS>~<STATUS>Open</STATUS>

"Make sure that finding details are blank. 
/FINDING_DETAILS
:s~<FINDING_DETAILS></FINDING_DETAILS>~<FINDING_DETAILS>Check text will not provide good results, see comments\.</FINDING_DETAILS>

/COMMENTS/
:s/<COMMENTS>\(.*\)<\/COMMENTS>/<COMMENTS>SQL is clustered utilizing 3rd party software, which uses NT_Authority\SYSTEM as the cluster management account\.  Reducing permissions breaks cluster functionality\.  Contacting manufacturer to find a solution to this issue\.<\/COMMENTS>
