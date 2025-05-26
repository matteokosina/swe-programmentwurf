== Sequenzdiagramm

=== Auftrag durchführen

#image("AuftragDurchfuehren.svg", width: 75%)

Für das Sequenzdiagramm haben wir exemplarisch den Prozess "Auftrag durchführen" gewählt.

Die Referenzblöcke in diesem Diagramm sind farbcodiert, sodass alle Blöcke, die verfeinert wurden, in grün dargestellt sind. Die Blöcke, die nicht verfeinert wurden, sind in orange dargestellt.

Zu Beginn wird ein Auftrag erstellt. Da Referenzblöcke keine Lifelines erstellen können, wird der Auftrag auf dieser Ebene schon erstellt und dann in dem Verfeinerungblock "Auftrag erstellen" weiterverarbeitet. Danach wird das für den Auftrag benötigte Material nachbestellt. Die Verfeinerung hierzu bleibt aus, da dieser Prozess im Aktivitätsdiagramm behandelt wird.

Im Durchführungsteil kann der Auftrag editiert werden und Material aus dem Lager genommen werden. Dafür gibt es eine Schleife, welche in jeder Iteration eine der vier folgenden Aktionen durchführt:
- Neuer Termin hinzufügen
- Werkzeug hinzufügen
- Bearbeiter hinzufügen
- Material aus dem Lager nehmen

Zum Abschluss des Auftrags werden die Angebotsposten in die Rechnung übernommen. Diese können anschließend beliebig editiert werden, bis die Rechnung erstellt wird. 

==== Pseudocode
```
ANFANG AuftragDurchführen
	AuftragErstellen

	Nachbestellen

  SOLANGE Auftrag bearbeitet wird
    WENN Neuer Termin hinzufügen
      NeuerTerminHinzufügen
    SONST WENN Werkzeug hinzufügen
      WerkzeugHinzufügen
    SONST WENN Bearbeiter hinzufügen
      BearbeiterHinzufügen
    SONST WENN
	    Produkt auswählen
      Menge angebot
      Lagereintrag auswählen
      Bestand reduzieren
      WENN Bestand 0
        Lagereintrag entfernen
      ENDE-WENN
    ENDE-WENN
  ENDE-SOLANGE

	Rechnung erstellen
  Angebotspostionen in Rechnung übernehmen
  Attribute setzen

  SOLANGE Rechnung bearbeitet wird
    Rechnungsposten auswählen
    Attribute ändern
  ENDE-SOLANGE
  Rechnung schreiben und speichern
ENDE AuftragDurchführen
```
=== Auftrag erstellen
#image("AuftragErstellen.svg", width: 110%)

In der Verfeinerung für die Auftragserstellen wird auch das Benutzerinterface in Form von "Hauptseite" und "Auftragsmenü" berücksichtigt. Aus Gründen der Übersichtlichkeit wurde darauf in den anderen Sequenzdiagrammen verzichtet.

Zu Beginn navigiert sich der Mitarbeiter in das Auftragsmenü. Nach der Anlegung des Auftrags, können in beliebiger Reihenfolge Attribute und Referenzen auf Kunden und Mitarbeiter gesetzt werden.

Anschließend wird ein initiales Angebot erstellt. Dieser Prozess wird im späteren Verlauf weiter verfeinert.
Daraufhin folgt wieder eine Schleife, in der drei Dinge passieren können:
- Ein weiteres Angebot wird vom Mitarbeiter erstellt
- Der Kunde nimmt ein Angebot an
- Der Kunde lehnt ein Angebot ab

Die Schleife endet, wenn der Kunde ein Angebot angenommen hat. Danach ist der Auftrag erstellt.

==== Pseudocode
```
ANFANG AuftragErstellen
	Öffne Auftragsmenü
  Auftrag erstellen

	Attribute (Titel Beschreibung StartTermin, EndTermin) hinzufügen

	Kunden Referenz hinzufügen
  Mitarbeiter Referenzen hinzufügen
  WENN ein Objekt nicht gefunden wurde
    Neues Objekt anlegen
  ENDE-WENN

	Initiales AngebotErstellen
  Angebot speichern
	SOLANGE Angebot nicht akzeptiert wurde
		Angebot verhandeln
	ENDE-SOLANGE
ENDE AuftragErstellen
```
=== Angebot erstellen
#image("AngebotErstellen.svg", width: 110%)

In der Verfeinerung für die Angeboterstellung wird das Benutzerinterface zur Vereinfachung nicht berücksichtigt. Nach der Erstellung des Angebots und der Verknüpfung mit dem Auftrag, können eine beliebige Anzahl an Angebotsposten erstellt werden.

Hier wird zwischen Dienstleistungs- und Produktposten unterschieden.
Bei Produktposten muss aus allen Produkten das passende ausgewählt werden. Danach wird das Produkt vom Posten referenziert und die Anzahl festgelegt.

Zum Schluss wird der Posten bestätigt. Wenn der Mitarbeiter alle Posten erstellt hat, ist das Angebot fertig.

==== Pseudocode
```
ANFANG AngebotErstellen
  Angebot erstellen
  Attribute (Titel, Beschreibung, StartTermin, EndTermin) setzen

  Angebot zu Auftrag hinzufügen

	WIEDERHOLE
		Posten erstellen
    Posten zu Angebot hinzufügen
    Attribute setzen
    Postenart wählen
    WENN es ein DienstleistungsPosten ist
      Anzahl auf 0 setzen
    SONST
      Anzahl setzen
      Produkte durchsuchen
      Produkt auswählen
    ENDE-WENN
    Posten bestätigen
	ENDE-WIEDERHOLE
ENDE PostenErstellen
```
