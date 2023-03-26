#!/bin/bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove.txt}
TARGET_DIR=${3:-bakap}

FILES=$(cat ${RM_LIST})

if [[ ! -d ${TARGET_DIR} ]]; then
    mkdir ${TARGET_DIR}

fi

for FILE in ${FILES}; do
    if [[ -f ${SOURCE_DIR}/${FILE} ]]; then
        rm ${SOURCE_DIR}/${FILE}
    fi

    if [[ -d ${SOURCE_DIR}/${FILE} ]]; then
        rm -rf ${SOURCE_DIR}/${FILE}
    fi

done

for FILE in $(ls ${SOURCE_DIR}); do
    if [[ -d ${SOURCE_DIR}/${FILE} ]]; then
        cp -r ${SOURCE_DIR}/${FILE} ${TARGET_DIR}
    fi

    if [[ -f ${SOURCE_DIR}/${FILE} ]]; then
        mv ${SOURCE_DIR}/${FILE} ${TARGET_DIR}
    fi
done

if [[ $(ls ${SOURCE_DIR} | wc -w) -gt 0 ]]; then
    echo "Jeszcze cos zostalo"
fi

if [[ $(ls ${SOURCE_DIR} | wc -w) -ge 0 ]]; then
    echo "Zostaly conamniej 2 pliki"
fi

if [[ $(ls ${SOURCE_DIR} | wc -w) -gt 4 ]]; then
    echo "Zostalo wiecej niz 4 pliki"
fi

if [[ $(ls ${SOURCE_DIR} | wc -w) -eq 0 ]]; then
    echo "Nie ma nic wiecej"
fi

zip -r bakap_$(date +%F).zip bakap
