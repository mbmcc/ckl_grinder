" An in all cases we assume HBSS is installed, so for any of the SQL 2012
" Instance:
" V-40948 can be marked as NF, with the following statement. "HBSS monitors
" file integrity satisfying this STIG. See HBSS team for evidence."

/V-40948/ 
/<STATUS>
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>

"/FINDING_DETAILS
":s~<FINDING_DETAILS>\(.*\)\|\(.+\)</FINDING_DETAILS>~<FINDING_DETAILS></FINDING_DETAILS>

/COMMENTS
:s~<COMMENTS>\(.*\)\|\(.+\)</COMMENTS>~<COMMENTS>HBSS monitors file integrity satisfying this STIG\. See HBSS team for evidence\.</COMMENTS>
