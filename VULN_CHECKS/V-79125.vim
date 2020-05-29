
" For V-79125 :: Since the script generates the documentation, and the System
" Documentation does indeed match the STIG query results, I’m marking it as
" “Not a Finding”.  When the application owner reviews the documentation
" corrections can be made if needed.
"
" (The STIG result is recorded in the SQL instance text document attached to
" the word document.)  While this does seem to be a “cart before the horse”
" scenario, the app owner will have to review and sign the system
" documentation to make the STIG process complete.

/V-79125/
/<STATUS>/
:s~<STATUS>.*</STATUS>~<STATUS>NotAFinding</STATUS>

"Make sure that finding details are blank. 
"/FINDING_DETAILS
":s~<FINDING_DETAILS></FINDING_DETAILS>~<FINDING_DETAILS></FINDING_DETAILS>

"/COMMENTS/
":s/<COMMENTS>/<COMMENTS>
