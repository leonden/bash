#!/bin/bash
# Name:         <script2.sh>
# Aufruf:       <script2.sh> [<1. Parameter>] [<2. Parameter>]
#               [<Beschreibung des 1. Parameters (falls vorhanden)>]
#               [<Beschreibung des 2. Parameters (falls vorhanden)>]
# Beschreibung: <for>
# Autor:        <Leon Hochwimmer>
# Version:      <0.1>
# Datum:        <31.05.2022>

# Wurde 1 Parameter übergeben?
if [ $# -ne 1 ]
then
    # nein -> Fehlermeldung ausgeben
    echo "die Anzahl Parameter stimmt nicht"
    # Hinweis auf korrekten Aufruf
    echo Usage: $0 "<folder>"    # $0 enthält den Namen des Scripts
    echo "<folder> Name des Ordners"
    # Script beenden (mit einem Wert ungleich 0)
    exit 1
fi

for fname in "$1"/*       # Schleife über alle Dateien im Ordner
do
    if [ ! -d "$fname" ]    # ist es KEIN Verzeichnis?
    then                    # ja
        if [ -x "$fname" ]  #   Test, ob Ausführungsrecht vorhanden
        then                #   ja
            echo "$fname"   #       Name der Datei wird ausgegeben
        fi
    fi
done
