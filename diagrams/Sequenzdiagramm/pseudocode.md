Die Aktion „Auftrag durchführen“ vom Erstkontakt bis zur Bezahlung der Rechnung

Da es ein Auftrag ist, den der Handwerksbetrieb durchführt, handelt es sich im System um einen Kundenauftrag

```
ANFANG AuftragDurchführen

	AuftragErstellen

	Nachbestellen

	MehrfachSuche(Eigenauftrag)
	"Im Kontext von" der Eigentaufträge auf Auftrag setzen
	Eigenaufträge zu Auftrag hinzufügen

	WENN Material aus dem Lager genommen wird
		EinzelSuche(LagerEintrag)
		Bestand reduzieren
		WENN Bestand leer
			Lagereintrag löschen
		ENDE-WENN
	ENDE-WENN
	
	Rechnung erstellen

ENDE AuftragDurchführen

```

## Auftrag erstellen
```
ANFANG AuftragErstellen
	Öffne KundenAuftragsMenü
	Öffne KundenAuftragErstellMenü

	Attribute (Titel Beschreibung StartTermin, EndTermin) hinzufügen

	EinzelSuche(Kundenreferenz)
	Kundenreferenz hinzufügen
	WENN Kunde nicht exitiert
		KundeHinzufügen
	ENDE-WENN


	Initiales AngebotErstellen
	SOLANGE Angebot nicht akzeptiert wurde
		Angebot verhandeln
	ENDE-SOLANGE

	WIEDERHOLE
		Mehrfachsuche(Mitarbeiter)
	SOLANGE kein Mitarbeiter ausgewählt
	Mitarbeiter Referenzen hinzufügen
ENDE AuftragErstellen

ANFANG AngebotErstellen
	Attribute(Titel, Beschreibung) hinzufügen

	WIEDERHOLE
		PostenErstellen(Angebot)
		Posten zu den Angebotsposten hinzufügen
	BIS der Nutzer abbricht
ENDE AngebotErstellen

ANFANG PostenErstellen(Angebot)

	WENN Dienstleistungsposten DANN
		Attribute (Titel, Beschreibung, Anzahl=0) setzen
	SONST
		Attribute (Titel, Beschreibung, Anzahl) setzen
		EinzelSuche(Produkt)
		Referenziere Produkt
	ENDE-WENN
ENDE PostenErstellen

ANFANG KundeErstellen
	KundenNummer generieren
	WENN Firmenkunde
		Attribute(Name, Steuernummer) setzen
	ENDE-WENN
	Rechnungsaddresse erstellen
	Lieferaddresse erstellen
	Attribute setzen(PLZ, Stadt,Straße, Hausnummer)
	Referenzen setzen

	Hauptkontakt erstellen
	Attribute setzen (Anrede, Vorname, Nachname, Telefonnummer, E-mail)

	Vertreter hinzufügen

ENDE KundeErstellen

ANFANG TerminErstellen
	Attribute setzen (Titel, Beschreibung, StartZeitpunkt, EndZeitpunkt)

	Referenz auf Auftrag setzen
	Termin zum Auftrag hinzufügen
	Termin zum Kalender hinzufügen
ENDE TerminErstellen

ANFANG EinzelSuche(Datenart)
	Suchmenü(Datenart) öffnen
	Such Filter eintragen
	Element auswählen
	GEBE Element ZURÜCK
ENDE EinzelSuche

ANFANG MehrfachSuche(Datenart)
	SOLANGE Nutzer suche nicht abbricht TUE
		Suchmenü(Datenart) öffnen
		Such Filter eintragen
		Elemente auswählen
	ENDE-SOLANGE
	GEBE alle Elemente ZURÜCK
ENDE MehrfachSuche 
```
## Other
```
ANFANG Nachbestellen
	FÜR-ALLE MaterialPosten des validen Angebots
		Produkt raussuchen
		Lager überprüfen
		WENN nicht genug vorhanden 
			EinzelSuche(Hauptlieferanten)
			WENN nicht passend
				EinzelSuche(Lieferant)
			ENDE-WENN
			Bei Lieferanten Bestellen
		ENDE-WENN
	ENDE-FÜR-ALLE

ENDE Nachbestellen

ANFANG RechnungErstellen
	Attribute(Titel, Beschreibung) setzen
	
	Aktives Angebot des Kundenauftrags holen
	Posten des Angebots zur Rechnung hinzufügen

	SOLANGE Bearbeitung nicht fertig
		EinzelSuche(RechnungsPosten)
		Attribute oder Produktreferenz Verändern
	ENDE-SOLANGE
	

ENDE RechnungErstellen

ANFANG EinzelSuche(Datenart)
	Suchmenü(Datenart) öffnen
	Such Filter eintragen
	Element auswählen
	GEBE Element ZURÜCK
ENDE EinzelSuche

ANFANG MehrfachSuche(Datenart)
	SOLANGE Nutzer suche nicht abbricht TUE
		Suchmenü(Datenart) öffnen
		Such Filter eintragen
		Elemente auswählen
	ENDE-SOLANGE
	GEBE alle Elemente ZURÜCK
ENDE MehrfachSuche 
```


Verfeinern:

Auftrag durchführen

Auftrag erstellen

Angebot erstellen

Posten erstellen


Schreiben welche vertieft wurde und welche nicht (verschiedene Farben)
