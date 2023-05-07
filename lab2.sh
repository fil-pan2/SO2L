#!/bin/bash

if [ $# -lt 2 ]; then
    echo "You need to provide 2 arguments"
    exit 1
fi


DIR_1=${1}
DIR_2=${2}

if [[ ! -d ${DIR_1} ]]; then
    echo "DIR_1 is not directory"
    exit 2
fi

if [[ ! -d ${DIR_2} ]]; then
    echo "DIR_2 is not directory"
    exit 3
fi

for FILE in $(ls ${DIR_1}); do
    if [[ -d ${DIR_1}/${FILE} ]]; then
        echo "$FILE is a directory"

        FILE_NAME="${FILE%.*}"
        EXTENTION="${FILE##.*}"

        if [[ "${FILE}"==*"."* ]]; then
            NAME="${FILE_NAME^^*}_ln.${EXTENTION}"
        else 
            NAME="${FILE_NAME^^*}_ln"
        fi

        ln -s ../"${DIR_1}"/"${FILE}" "${DIR_2}"/"${NAME}"
    

    elif [[ -L ${DIR_1}/${FILE} ]]; then
        echo "$FILE is a symbolic link"
    

    elif [[ -f ${DIR_1}/${FILE} ]]; then
        echo "$FILE is a file"

        FILE_NAME="${FILE%.*}"
        EXTENTION="${FILE##.*}"

        FILE_NAME="${FILE%.*}"
        EXTENTION="${FILE##.*}"

        if [[ "${FILE}"==*"."* ]]; then
            NAME="${FILE_NAME^^*}_ln.${EXTENTION}"
        else 
            NAME="${FILE_NAME^^*}_ln"
        fi

        ln -s ../"${DIR_1}"/"${FILE}" "${DIR_2}"/"${NAME}"
    fi
done