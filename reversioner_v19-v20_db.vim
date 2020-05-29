" Matthew McCourry
" 2020 05 28
" version 0.05
"
" Vim script update the SQL V19 to V20 ckls
" Open all the files to be editied (and no others) in a vim process
" i.e. select all -> open with gvim
" Source this script
" i.e. :so path/to/this/script.vim
"
"
" ====================
" Choice template
"
"let choice = confirm("update CHOICE TEXT?", "&Yes\n&No", 2)
"if choice == 1
"  echo "--------------------------"
"  echo " Updating CHOICE TEXT"
"  echo "--------------------------"
"  bufdo :echo "some search text here"
"  echo "--------------------------"
"endif
"
" Macro (@t) for copying template
":15,20t-1j:22,24t.8kx8j
" appy the macro on the line with the change
" ====================
"
" -----------------------------
"  CHANGELOG
" -----------------------------
"  v.05
"  - Addeded section titles to show whats being changed on the ckl
"  - moved template to allow for static mapping of location for macro
"
"  v.04
"  - changed focus of this script for Database ckl's only
"  
"  v.03
"  - changed focus of this script for Inst ckl's only
"  
"  v.02
"  - added functionality to add a new VULD ID signature field
"  
"  v.01 
"  - created skeleton
"  - base function script
"

" Header
let choice = confirm("update DISA STIG Viewer version from 2.9 to 2.9.1?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating STIG Viewer version to 2.9.1"
  echo "--------------------------"
  bufdo :0,3s/<!--DISA STIG Viewer :: 2.9-->/<!--DISA STIG Viewer :: 2.9.1-->/  
  echo "--------------------------"
endif


""STIGID Title"
let choice = confirm("Update MS_SQL_Server_STIG to MS_SQL_Server_Database?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating text for STIGID MS_SQL_Server_STIG to _Database"
  echo "--------------------------"
  bufdo :%s/MS_SQL_Server_2012_STIG/MS_SQL_Server_Database_2012/g
  echo "--------------------------"
endif


""filename"
let choice = confirm("Update xccdf filename to Database_2012_V1R20?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo "Updating text for Filename to Database_2012"
  echo "--------------------------"
  bufdo :%s/2012_Database_STIG_V1R19/Database_2012_V1R20/g
  echo "--------------------------"
endif


""releaseinfo"
let choice = confirm("update Release version from Benchmark 19 to 20?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating to Release 20 Benchmark Date: 16 Jan"
  echo "--------------------------"
  bufdo :%s/19 Benchmark Date: 26 Jul 2019/20 Benchmark Date: 16 Jan 2020/g
  echo "--------------------------"
endif


""title"
let choice = confirm("Update Title text to Server Database 2012?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo "Updating text for 'title' SQL Server 2012 to SQL Server Database 2012"
  echo "--------------------------"
  bufdo :%s/SQL Server 2012/SQL Server Database 2012/g
  echo "--------------------------"
endif



""uuid"
let choice = confirm("update uuid?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating uuid"
  echo "--------------------------"
 bufdo :%s/<SID_DATA>d4b206eb-f90d-49c1-b0de-e4cefbabf661/<SID_DATA>d782d95b-e957-4e63-8faf-4fe2f009371a/
  echo "--------------------------"
endif


"adding new STIG UUID Attribute data
let choice = confirm("update New Attribute data (May take a while)", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating New Attribute data (May take a while)"
  echo "--------------------------"
  bufdo :g/ATTRIBUTE>TargetKey/ :+2,+3s/<STIG_DATA>/<STIG_DATA>\t\t\t\t\t<VULN_ATTRIBUTE>STIG_UUID<\/VULN_ATTRIBUTE>\t\t\t\t\t<ATTRIBUTE_DATA>31ecfaef-1987-4299-92eb-8055701d908a<\/ATTRIBUTE_DATA>\t\t\t\t<\/STIG_DATA>\t\t\t\t<STIG_DATA>/
  echo "--------------------------"
endif

