#!/bin/bash
#This program is a script to use submission timestamps of my students and print all the late submissions

#Read CSV and extract fields using \" as delimiter
#Extract the names, student ID & date fields and clean up the text using sed
#Eg: cat studentinfo.csv | awk '{print $1}' |sed 's/"//' >names
# cat studentinfo.csv | awk '{print $4}' | sed 's/.*uploaded //' | sed 's/"//' >timesstamps

#Use the paste command to combine them back into the same file (paste command creates a Tab-separated value list)
#paste names timestamps >AllInfo

deadline="2016-04-05 3:00pm"
duedate=`date -d "$deadline" +%s`
while read -r -a fullline
do
    subtime="${fullline[0]} ${fullline[1]}"
    studentid=${fullline[2]}
    name=${fullline[@]:3}
    d2=`date -d "$subtime" +%s`

    datediff=$(($d2-$duedate))

    oneday=86400
    if [ "$datediff" -gt "0" ]
    then
        Res=$(($datediff/$oneday + 1))
        echo "$name $studentid - Late by $Res days"
    fi
done
