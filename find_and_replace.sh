#!/bin/bash
#find_and_replace.sh

_path='/Users/sl014650/ss-metl/clients/'
_clientfolder='allied'

_changes='
healthbenefitplan_productindicator to benefit_plan_id 
eligibilitygroupnumber|eligibility_group_number

eligibilitygroupname to eligibility_group_name

memberfirstname to first_name

memberlastname|last_name

'



################################################
echo "$_changes" > temp
sed -i '' 's/ to /|/g' temp

while read line; do

  _find=$(echo $line | cut -d'|' -f1)
  _replace=$(echo $line | cut -d'|' -f2)
  
  find ${_path}${_clientfolder} -type f -print0 | xargs -0 sed -i '' -e "s/${_find}/${_replace}/g"
  
done < temp

rm temp
################################################
