#!/bin/bash
#Read CSV and extract fields using \" as delimiter
#Extract the names, student ID & date fields and clean up the text using sed
#Use the paste command to combine them back into the same file

deadline="2016-04-05 3:00pm"
duedate=`date -d "$deadline" +%s`
while read -r -a fullline
do
    line="${fullline[0]} ${fullline[1]}"
    studentid=${fullline[2]}
    name=${fullline[@]:3}
    d2=`date -d "$line" +%s`

    datediff=$(($d2-$duedate))

    oneday=86400
    if [ "$datediff" -gt "0" ]
    then
        Res=$(($datediff/$oneday + 1))
        echo "$name $studentid - Late by $Res days"
    fi
done
