#!/bin/bash

###################################
#        AutoRepoPull v0.1        #
###################################
#              INFO               #
###################################
# Ein Script welches automatisch  #
# GIT-Repos bei veränderungen am  #
# Branch einen Pull durchführt.   #
# Optional auch weitere Befehle   #
# danach ausführt.                #
###################################
#            INFO ENDE            #
###################################
#       by Marvin Beckmann        #
###################################

###################################
# Funktionen                      #
###################################

###################################
# Variablen                       #
###################################
st1=30

path=/var/www/html/website/
###################################
# Programm                        #
###################################
while true
do
  # Aktualisiere die Credentials
  git config --global credential.helper 'cache --timeout=3600'

  # Springe in das entsprechende Verzeichnis
  cd $path
  pwd

  # Prüfe den GIT Status
  status=$(git status | grep "auf dem selben Stand" | grep "feature\/qstag" | wc -l)
  echo "Ausgabe: $status"

  if [ "$status" -ne 1 ]
  then
    echo "Repo ist nicht aktuell!"
    echo "Führe git pull durch:"
    git pull
    echo "Führe Jekyll aus:"
    jekyll build
  else
    echo "Repo ist aktuell"
  fi
  echo "Nächster Durchlauf in $st1 Sekunden"
  sleep $st1
done
