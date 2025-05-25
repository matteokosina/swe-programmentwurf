== Aktivitätsdiagramme
Aktivitätsdiagramme werden zur Modellierung beliebiger prozedualer Abläufe verwendet. 
Diese veranschaulichen somit komplexe Verläufe, Nebenläufigkeiten oder auch alternative Veranschaulichungswege, um ein klares Verständins der gewünschten Abläufe eines Produkets zwischen Auftraggeber und -nehmer zu gewährleisten.
=== Materialbestellung
#image("Aktivitätsdiagramm.svg")

Für die Modellierung eines Aktivitätsdiagrammes wurde hierbei der Prozess einer Materialbestellung gewählt. Dieser hat als Eingabewert den Kundenauftrag, welcher bereits mit einem gewählten Angebot verknüpft wurde. 
Von diesem Angebot werden anschließend alle Materialposten auf eine vollständige Verfügbarkeit überprüft und je nach Lagerbestand eine entsprechende Nachbestellung eingeleitet oder nicht. 

Hierbei ist zu beachten, dass  erst nach der Überprüfung aller nötigen Materialposten die Bestellung abgesendet wird. Dadurch werdern Materialien, welche von dem selben Lieferanten beschaffen werden sollen, gemeinsam in einem Eigenauftrag bestellt und mehrere Einzelbestellungen vermieden.

Ebenfalls wird bei nicht Erhaltung einer Bestellbestätigung überprüft, wodurch ein Fehler bei der Bestellung zustande gekommen ist. Da bei einer passenden Eingabe der nötigen Daten nur ein Fehler von Seite der Lieferanten entstehen kann, muss der entsprechende Lieferant geändert und die Bestellung erneut durchgeführt werden. 

Im Pseudocode sind zusätzlich die Prozesse "Lieferant anlegen", "Lieferant kontaktieren" und "Rechnung archivieren" verfeinert dargestellt, um eine mögliche Detaillierung der Prozesse abzubilden.

=== Verfeinerung: Lieferant anlegen
#image("Aktivitätsdiagramm-LieferantAnlegen.svg")

Zur Veranschaulichung einer Verfeinerung in einem Aktivitätsdiagramm wurde der Prozess des Anlegens eines neuen Lieferantens gewählt. 
