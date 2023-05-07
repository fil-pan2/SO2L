#!/bin/bash -eu

DIR_1=$(realpath groovies)

for FILE in $(ls ${DIR_1}); do
    #We wszystkich plikach w katalogu 'groovies' zamien $HEADER$ na /temat/
    sed -i 's|\$HEADER\$|\/temat\/|g' ${DIR_1}/${FILE}
    #We wszystkich plikach w katalogu 'groovies' po kazdej linijce z 'class' dodac '  String marker = '/!@$%/''
    sed -i "/class/a\String marker = '/!@$%/'" ${DIR_1}/${FILE}
done
