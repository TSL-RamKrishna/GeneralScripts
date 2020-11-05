#!/bin/bash

#echo Getting md5sum of target file

function md5sumcheck(){
                local md5=$(md5sum $1 | awk '{print $1}')
                echo $md5
}

function validate(){
        if [[ "$1" == "$2" ]]; then
                echo "Copying successful"
        else
                echo  "FAILED"
        fi
}

function copy_and_validate(){
        echo "Getting MD5 of target file "
        targetmd5=$(md5sum  $1 | awk '{print $1}')
        targetbasename=$(basename $1)

        if [ -d $2 ]; then
                if [ -e $2/${targetbasename} ]; then
                        echo "File already exist, checking MD5"
                        destmd5=$(md5sum $2/${targetbasename} | awk '{print $1}')
                        if [[ "${targetmd5}" == "${destmd5}" ]]; then echo "File was copied successfully"; else echo "File copy failed. Destination file is removed"; rm $2/${targetbasename}; fi
                else
                        echo Copying the file
                        cp $1 $2
                        echo "File copied, Checking MD5"
                        destmd5=$(md5sum $2/${targetbasename} | awk '{print $1}')
                        if [[ "${targetmd5}" == "${destmd5}" ]]; then echo "Copied successfully"; else echo "File copy failed. Destination file is removed"; rm $2/${targetbasename}; fi
                fi


        elif [[ -e $2 && -f $2 ]]; then
                echo "File already exist, checking MD5"
                destmd5=$(md5sum $2} | awk '{print $1}')
                if [[ "${targetmd5}" == "${destmd5}" ]]; then echo "File was copied successfully" ; else echo "File copy failed. Destination file is removed"; rm $2/${targetbasename}; fi
        else
                cp $1 $2
                echo "File Copied. Checking MD5"
                destmd5=$(md5sum $2} | awk '{print $1}')
                if [[ "${targetmd5}" == "${destmd5}" ]]; then echo "Copied successfully" ; else echo "File copy failed. Destination file is removed"; rm $2/${targetbasename}; fi
        fi

#       destmd5=$(md5sumcheck $2/${targetbasename})
#        result=$(validate ${targetmd5} ${destmd5} )
#        if [ ! "$result" == "Copying successful" ]; then
#
#               echo "Copying failed";
#       fi


}

copy_and_validate $1 $2

exit 0
