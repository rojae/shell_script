#!/bin/sh

#############################################
# USE : 
# sh backup.sh target.war cp
# sh backup.sh target.war mv
#############################################

date=$(date '+%Y%m%d')
me=`basename "$0"`

file_name=${1%.*}
file_extension=${1##*.}

ori_name=$1
mode=$2
new_name=$file_name'_'$date.$file_extension

echo "[$me] Line ${LINENO} > Check filename $ori_name..."

file_copy(){
        echo "[$me] Line ${LINENO} > cp $ori_name $new_name"
        cp $ori_name $new_name
}

file_rename(){
        echo "[$me] Line ${LINENO} > mv $ori_name $new_name"
        mv $ori_name $new_name
}

if [ -z $ori_name ] || [ -z $mode ]
then
    echo "First Parameter : original file is not Valid"
    echo "Second Parameter : mode is not valid"
    echo "mode) cp, mv"
    exit 1;
fi

if [ $mode != "cp" ] && [ $mode != "mv" ]
then
    echo "Second Parameter : mode is not valid"
    echo "mode) cp, mv"
    exit 1;
fi


if [ -e $1 ]
then
        echo "[$me] Line ${LINENO} > File exist, so make backup file.. $new_name"
        
        case $mode in
            "cp")
                file_copy
                ;;
            "mv")
                file_rename
                ;;
        esac

else
        echo "[$me] Line ${LINENO} > $ori_name is not exist, not do backup.."
fi

echo "[$me] Line ${LINENO} > Done.."
exit 0;