
" Leave it as OPEN.  Comment: SQL is clustered utilizing 3rd party software, which uses NT_Authority\SYSTEM as the cluster management account.  Reducing permissions breaks cluster functionality.  Contacting manufacturer to find a solution to this issue.

/V-79195/
/<STATUS>/
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>

"Make sure that finding details are blank. 
/FINDING_DETAILS
:s~<FINDING_DETAILS></FINDING_DETAILS>~<FINDING_DETAILS>Check text will not provide good results, see comments\.</FINDING_DETAILS>

/<COMMENTS>/
:s~\V<COMMENTS>\.\*</COMMENTS>~<COMMENTS>We use 3rd party clustering software, so SQL doesnt know its actually clustered, meaning the \&quot;isClustered\&quot; value returned from the STIG query is wrong. Follow the registry check described in this STIG for clustered instances.</COMMENTS>

