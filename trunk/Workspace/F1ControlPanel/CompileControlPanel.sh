#!/bin/sh
echo "**** Creazione delle directory ****"
mkdir -p ./bin
mkdir -p ./bin/MDLControlPanel
echo "**** Inizio compilazione middleware ****"
idlj -td ./src -fall ./src/MDLControlPanel.idl
echo "**** Fine compilazione middleware ****"
echo "**** Inizio compilazione del test per il pannello ****"
javac  ./src/*.java ./src/MDLControlPanel/*.java -d ./bin -Xlint:unchecked
echo "**** Fine compilazione del test per il pannello ****"
