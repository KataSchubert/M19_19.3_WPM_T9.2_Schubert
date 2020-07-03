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

# Die neue Datei enthält nun nur noch ISSN-Nummern und das Date. Allerdings ist diese Auflistung noch nicht sauber, sondern voller Leerzeilen und unsauberen ISSNs.
# Im ersten Schritt möchte ich nun die Zeilen löschen, die "eng" enthalten. Dafür nutze ich den Befehl "sed" sowie "d" und lösche die Zeilen, die den Begriff "eng" enthalten.
# Dieses Ergebnis wird in einer neuen Datei "2020-05-23-Article_list_dirty_Ergebnis2.tsv" gespeichert.

sed '/eng/d' 2020-05-23-Article_list_dirty_Ergebnis1.tsv > 2020-05-23-Article_list_dirty_Ergebnis2.tsv

# Nun geht es daran, die Leerzeilen zu löschen, die nur Tabs enthalten. 
# Dazu nutze ich wiederum den Befehl "sed" und lösche mithilfe von regulären Ausdrücken die Leerzeilen.
# Dieses Ergebnis wird in einer neuen Datei "2020-05-23-Article_list_dirty_Ergebnis3.tsv" gespeichert.

sed '/^\s*$/d' 2020-05-23-Article_list_dirty_Ergebnis2.tsv > 2020-05-23-Article_list_dirty_Ergebnis3.tsv 

# Im nächsten Schritt möchte ich alle "issn: ", "Issn: " und "ISSN: " samt Leerzeichen aus der Auflistung löschen.
# Dafür wende ich wieder den Befehl "sed" sowie "s" an und lösche mithilfe von regulären Ausdrücken die dadurch entstehenden Leerzeilen.
# Dieses Ergebnis wird in einer neuen Datei "2020-05-23-Article_list_dirty_Ergebnis4.tsv" gespeichert.

sed 's/issn:\s//g;s/Issn:\s //g;s/ISSN:\s//g' 2020-05-23-Article_list_dirty_Ergebnis3.tsv > 2020-05-23-Article_list_dirty_Ergebnis4.tsv

# Dies betrifft leider nicht die Ausdrücke "ISSN:".
# Deshalb wende ich den obigen Befehl auf diesen Ausdruck an.
# Dieses Ergebnis wird in einer neuen Datei "2020-05-23-Article_list_dirty_Ergebnis5.tsv" gespeichert.

sed 's/ISSN://g' 2020-05-23-Article_list_dirty_Ergebnis4.tsv > 2020-05-23-Article_list_dirty_Ergebnis5.tsv 

# Nun möchte ich in der Auflistung die doppelten Einträge herauslöschen.
# Dafür nutze ich den Befehl "sort" und "-u".
# Dieses Ergebnis wird in einer neuen Datei "2020-05-23-Article_list_dirty_Ergebnis6.tsv" gespeichert.

sort -u 2020-05-23-Article_list_dirty_Ergebnis5.tsv > 2020-05-23-Article_list_dirty_Ergebnis6.tsv  

# Nun möchte ich in der Auflistung die ISSNs sortieren.
# Dafür nutze ich den Befehl "sort" und "-n".
# Dieses Ergebnis wird in einer finalen Datei "2020-05-23-Dates_and_ISSNs.tsv" gespeichert.

sort -n 2020-05-23-Article_list_dirty_Ergebnis6.tsv > 2020-05-23-Dates_and_ISSNs.tsv 

# Dies ist nun die vollkommen bereinigte Datei.