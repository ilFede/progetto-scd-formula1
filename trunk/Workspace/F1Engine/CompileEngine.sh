#!/bin/sh

echo "**** Creazione delle directory ****"
#mkdir -p ./src/pilot/MDLControlPanel
echo "**** Inizio compilazione middleware ****"
cd src
cd controller
idlac -c MDLControlPanel.idl
cd ..
cd ..
echo "**** Fine compilazione middleware ****"
echo "**** Inizio compilazione dell'engine ****"
gnatmake -P formula1_engine.gpr `polyorb-config`
echo "**** Fine compilazione del test per il pannello ****"

