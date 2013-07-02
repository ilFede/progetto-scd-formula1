#!/bin/sh
tnameserv -ORBInitialPort 1050 &
echo "**** Avvio del pannello ****"
cd bin
java TimePanel -ORBInitialPort 1050 -ORBInitialHost localhost

