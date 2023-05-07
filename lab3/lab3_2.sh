#!/bin/bash -eu

#Z pliku yolo.csv wypisz wszystkich, ktorych id jest liczba nieparzysta. Wyniki zapisz na standardowe wyjscie bledow.
cat $(realpath yolo.csv) | grep --extended "^[0-9]*[13579]\," 1>&2
#Z pliku yolo.csv wypisz kazdego, kto jest wart dokladnie $2.99 lub $5.99 lub $9.99. Nie wazne czy milionow, czy miliardow (tylko nazwisko i wartosc). Wyniki zapisz na standardowe wyjscie bledow
cat $(realpath yolo.csv) | grep "\$[2,5,9]\.99.$" | cut -d',' -f3,7 1>&2
