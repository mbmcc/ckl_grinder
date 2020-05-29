"
/V-79205/
/<STATUS>/
:s~<STATUS>.*</STATUS>~<STATUS>Open</STATUS>
"
"/FINDING_DETAILS
":s~<FINDING_DETAILS>\(.*\)\|\(.+\)</FINDING_DETAILS>~<FINDING_DETAILS></FINDING_DETAILS>

/COMMENTS/
:s~<COMMENTS>.*</COMMENTS>~<COMMENTS>This is an unclassified system and the STIG should be downgraded to a CAT II\.</COMMENTS>

