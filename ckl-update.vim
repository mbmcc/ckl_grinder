" Matthew McCourry
" github.com/mbmcc
" 2020 05 29
" version 0.05
"
" Vim script to edit batches of ckl files 
" Open all the files to be editied (and no others) in a vim process
" i.e. select all -> open with gvim
" Source this script
" i.e. :so path/to/this/script.vim
"
" -----------------------------
"  CHANGELOG
" -----------------------------
"  v.05
"  - Added variables for comment text and finding text
"
"  v.04 
"  - applied a choose ability for each item
"  - added back the bufdo, its too anoyying to say y/n to each file
"  
"  v.03 
"  - removed bufdo from all commands. now you bufdo <script.vim> 
"
"  v.02 
"  - added some echo statements for nice ouput
"  
"  v.01 
"  - created skeleton
"  - base function script
"
let b:comments = "<COMMENTS>Waiting on documentation<\/COMMENTS>"
let b:finding_details = ""

let choice = confirm("Do you want to fix line endings?", "&Yes\n&No", 2)
if choice == 1
  "### putting in unix line endings on ckl with no eol.
  echo "--------------------------"
  echo "Fixing Line Endings"
  echo "--------------------------"
  "### Line 1 should be as follows:
  "﻿<?xml version="1.0" encoding="UTF-8"?><!--DISA STIG Viewer :: 2.9-->
  bufdo :1s/->/->
  bufdo :2,$s/</</g
  bufdo :2,$s/\n<\//<\//g
  echo "--------------------------"
endif

let choice = confirm("Do you want to fix indentation?", "&Yes\n&No", 2)
if choice == 1
  "### Reformatting the indentation
  echo "--------------------------"
  echo "Fixing indentation"
  echo "--------------------------"
  bufdo :norm gg
  bufdo :norm =G
endif

let choice = confirm("Do you want to mark all 'Not Reviewed' to 'Open'?", "&Yes\n&No", 2)
if choice == 1
  "#### mark all of the line items as "open"
  bufdo :%s/<STATUS>Not_Reviewed<\/STATUS>/<STATUS>Open<\/STATUS>/g
  echo "--------------------------"
endif


let choice = confirm("Do you want to fill blank comments?", "&Yes\n&No", 2)
if choice == 1
  "#### all the blank comment entries and put in 'Waiting on documentation'
  echo "--------------------------"
  echo "Finding blank Comments and replacing with '"b:comments"'"
  echo "--------------------------"
  bufdo :%s/<COMMENTS><\/COMMENTS>/\=b:comments/g
  echo "--------------------------"
endif

let choice = confirm("Do you want to mark line items with finding details as NF?", "&Yes\n&No", 2)
if choice == 1
  "#### find all of the line items that have finding details and mark NF
  echo "--------------------------"
  echo "Finding items that have finding details and marking status NF"
  echo "--------------------------"
  bufdo :g/<FINDING_DETAILS>\w/ :-1s/<STATUS>Open<\/STATUS>/<STATUS>NotAFinding<\/STATUS>
  echo "--------------------------"
  echo "Reverting previously found items to Open if finding states 'this is a finding'"
  echo "--------------------------"
  bufdo  :g/<FINDING_DETAILS>.\+This is a finding/ :-1s/<STATUS>.\+<\/STATUS>/<STATUS>Open<\/STATUS>
  echo "--------------------------"
endif


"#### Start processing reversioning scripts
let choice = confirm("Run v19 to v20 reversioning for Instance ckls", "&Yes\n&No", 2)

if choice == 1
  echo "--------------------------"
  echo "Running Inst reversioning"
  echo "--------------------------"
  " make sure you are in CKL Grinder Folder"
  source .\reversioner_v19-v20_inst.vim
  echo "--------------------------"
endif


"#### 
let choice = confirm("Run v19 to v20 reversioning for Database ckls", "&Yes\n&No", 2)

if choice == 1
  echo "--------------------------"
  echo "Running Inst reversioning"
  echo "--------------------------"
  " make sure you are in CKL Grinder Folder"
  source .\reversioner_v19-v20_db.vim
  echo "--------------------------"
endif


"#### Start processing individual vulnerability ckl changes
let choice = confirm("continue with vulnerability specific changes?", "&Yes\n&No", 2)

if choice == 1
  echo "--------------------------"
  echo "Running selected Vuln ckl updates"
  echo "--------------------------"
  " make sure you are in CKL Grinder Folder"
  source .\instance-vulns.vim
  echo "--------------------------"
endif

