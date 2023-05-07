#!/bin/bash -eu

#Znajdz w pliku access_log unikalnych 10 adresow IP w access_log
cat $(realpath access_log) | grep --extended -o "^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}" | sort -u | head -10

#Znajdź w pliku access_log zapytania, które mają frazę "denied" w linku
cat $(realpath access_log) | grep "\/denied\/"

#Znajdź w pliku access_log zapytania z IP 64.242.88.10
cat $(realpath access_log) | grep "^64\.242\.88\.10"

#Znajdz w pliku access_log unikalne zapytania typu DELETE
cat $(realpath access_log) | grep "DELETE" | sort -u