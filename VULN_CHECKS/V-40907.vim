"
/V-40907/ 
/<STATUS>
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>

"/FINDING_DETAILS
":s~<FINDING_DETAILS>\(.*\)\|\(.+\)</FINDING_DETAILS>~<FINDING_DETAILS></FINDING_DETAILS>

/COMMENTS
:s~<COMMENTS>\(.*\)\|\(.+\)</COMMENTS>~<COMMENTS>This Database is part of an SQL cluster\.  A single DoD certificate is used, force encrypted shows as enabled, but the certificate is not displayed\.  This is due to the certificate not matching the hostname\.  The certificate is specified in the registry, and encrypted transmission is in effect\.</COMMENTS>
