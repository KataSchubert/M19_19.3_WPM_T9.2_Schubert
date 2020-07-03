#!/bin/bash

# T9.2 Bereinigung einer .tsv-Datei

# Zuallererst lasse ich mir die Inhalte der Ursprungsdatei 2020-05-23-Article_list_dirty.tsv via des Befehls "cat" anzeigen. 
# Diese liegt auch im Repository "M19_19.3_WPM_T9.2_Schubert".

cat 2020-05-23-Article_list_dirty.tsv

# Um den Inhalt der Datei ansehnlicher darstellen zu können, wende ich folgenden Befehl an, um die Zeilenumbrüche nicht umsetzen zu lassen.
# Damit lassen sich auf besser die Spaltenüberschriften feststellen. 
# Diese sind: Creator Issue, Volume, Journal, ISSN, ID, Citation, Title, Place, Language, Publisher und Date

less -S 2020-05-23-Article_list_dirty.tsv

# Die Spalten, die mich interessen, sind Nummer 5 (ISSN) und 12 (Date), welche ich nun aus der Datei extrahieren möchte.
# Dazu schneide ich die beiden Spalten mithilfe des Befehls "cut -f 5,12" aus der alten Datei heraus.
# Dieses Ergebnis wird in einer neuen Datei "2020-05-23-Article_list_dirty_Ergebnis1.tsv" gespeichert.

cut -f 5,12 2020-05-23-Article_list_dirty.tsv > 2020-05-23-Article_list_dirty_Ergebnis1.tsv