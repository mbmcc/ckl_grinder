
" Matthew McCourry
" 2020 05 26
" version 0.03
"
" Vim script update the SQL V19 to V20 ckls
" Open all the files to be editied (and no others) in a vim process
" i.e. select all -> open with gvim
" Source this script
" i.e. :so path/to/this/script.vim
"
" -----------------------------
"  CHANGELOG
" -----------------------------
"  v.03
"  - changed focus of this script for Inst ckl's only
"  v.02
"  - added functionality to add a new VULD ID signature field
"  v.01 
"  - created skeleton
"  - base function script
"
" ------
" Choice template
"
"let choice = confirm("update CHOICE TEXT", "&Yes\n&No", 2)
"if choice == 1
"  echo "--------------------------"
"  echo " Updating CHOICE TEXT"
"  echo "--------------------------"
"  bufdo :echo "some search text here"
"  echo "--------------------------"
"endif

" Macro (@t) for copying template
":22,26t.j:28,30t.8kx8j
"
"


let choice = confirm("update DISA STIG Viewer version from 2.9 to 2.9.1?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating STIG Viewer version to 2.9.1"
  echo "--------------------------"
  bufdo :0,3s/<!--DISA STIG Viewer :: 2.9-->/<!--DISA STIG Viewer :: 2.9.1-->/  
  echo "--------------------------"
endif


let choice = confirm("Update MS_SQL_Server_Instance_2012 to MS_SQL_Server_Instance_2012?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating MS_SQL_Server_Instance_2012"
  echo "--------------------------"
  bufdo :%s/MS_SQL_Server_2012_STIG/MS_SQL_Server_Instance_2012/g
  echo "--------------------------"
endif


let choice = confirm("Update U_MS_SQL_Server_Instance_2012_ to U_MS_SQL_Server_Instance_2012_?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo "Updating text for 2012_Instance to Instance_2012"
  echo "--------------------------"
  bufdo :%s/2012_Instance_STIG_V1R19/Instance_2012_v1R20/g
  echo "--------------------------"
endif


let choice = confirm("Update U_MS_SQL_Server_Instance_2012_ to U_MS_SQL_Server_Instance_2012_?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo "Updating SQL Server 2012 to SQL Server Instance 2012"
  echo "--------------------------"
  bufdo :%s/SQL Server 2012/SQL Server Instance 2012/g
  echo "--------------------------"
endif


let choice = confirm("update Release version from Benchmark 19 to 20?", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating to Release 20 Benchmark Date: 16 Jan"
  echo "--------------------------"
  bufdo :%s/19 Benchmark Date: 26 Jul 2019/20 Benchmark Date: 16 Jan 2020/g
  echo "--------------------------"
endif


let choice = confirm("update New Attribute data (May take a while)", "&Yes\n&No", 2)
if choice == 1
  echo "--------------------------"
  echo " Updating New Attribute data (May take a while)"
  echo "--------------------------"
  bufdo :g/ATTRIBUTE>TargetKey/ :+3s/<STIG_DATA>/<STIG_DATA>\t\t\t\t\t<VULN_ATTRIBUTE>STIG_UUID<\/VULN_ATTRIBUTE>\t\t\t\t\t<ATTRIBUTE_DATA>31ecfaef-1987-4299-92eb-8055701d908a<\/ATTRIBUTE_DATA>\t\t\t\t<\/STIG_DATA>\t\t\t\t<STIG_DATA>/
  echo "--------------------------"
endif

