#!/bin/bash
if [ -z $1 ]; then 
  echo "well, someone didn't want to run the script with a file...";
  exit;
fi

file=$1
bug=7c85d987a917c2a555d1391426978f05
string="e  oy  a    e  io   o   o "
mesg="Level 7: \n Robert Morris has been here...\nI love messing with these amateur programmers!!\nIf you want some real fun, then you should try finding the little bug and fix the script. >:)\nAfter that run again the shell script!!\n\nGood Luck!!!\n\n "
merges=$(git log --format=%h --merges | head -1)
csum="md5sum"
if [ $(echo "$OSTYPE" | grep darwin) ];then
    csum="md5"
fi

if [ "$file" = "nextclue_input.cpp" ];then 
  if [ ${merges} ]; then 
    while read p; do 
      for w in $p;do 
        if [ `echo $w | $csum | awk '{print $1}'` = $bug ];then 
          echo -e $mesg; 
          exit; 
        fi; 
      done;
    done < $file ;
    echo -e "Well, congratulations!! You fixed the bug!!\nIf you would like to continue, then you should checkout to the $(echo OTBtUDhvdVFIc05lCg== | base64 --decode | tr -d '0-9A-Z') branch!!\nAnd please keep the following vowels in mind \"$string\"\n ";
   else 
     echo -e $mesg; 
     exit;
   fi; 
else 
  echo "Looks like you passed in the wrong file";
fi

