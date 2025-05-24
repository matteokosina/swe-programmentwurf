# Materialbestellung 

Die Aktion "Materialbestellungen für obigen Auftrag durchführen“ von der Bestandsprüfung der für einen Auftrag nötigen Materialien bis zur Verwaltung der Rechnung
```
WENN Material nicht verfügbar
    In das Bestellunterprogramm navigieren

    // Prüfen ob bestehende verknüpfte Lieferaufträge existieren
    Prüfen ob eine Vorlage für Bestellgruppe verwendet wird
    WENN Vorlage vorhanden
        Vorlage suchen
        Vorlage auswählen
        Vorlage Bestellung hinzufügen
    ENDE WENN
    SOLANGE weiteres Material für einen Angebotsposten benötigt wird
        Auswahlliste anzeigen
        Material suchen 
        WENN Material gefunden
            Angebote vergleichen
        SONST
            Lieferanten recherchieren
            Lieferant auswählen
            Lieferant kontaktieren 
            Angebote empfangen
            Neuen Lieferanten anlegen
        ENDE WENN
        Lieferantenangebot auswählen 
        WENN bereits ein Angebot gewählt wurde
            Prüfe ob die Lieferanten übereinstimmen
                WENN die Lieferanten nicht übereinstimmen
                    Neuen Eigenauftrag für Bestellung anlegen (Für Verfeinerung vgl. Auftrag anlegen)
                    Eigenauftrag in Kontext des Kundenauftrags setzen
                    Eigenauftrag als verknüpften Auftrag des Kundenauftrags hinzufügen
                ENDE WENN
        ENDE WENN
        Material dem passenden Bestellauftrag hinzufügen
    ENDE SOLANGE
    Bestellung absenden
    WENN Bestellbestätigung erhalten -> Rechnung erhalten //Rechnung als Output der Bestellbestätigung
        Rechnung archivieren (Rechnung) //Rechnung als Input für das Archivieren der Rechnung
    SONST 
        Neue Bestellung mit anderem Lieferanten anlegen
    ENDE WENN
ENDE WENN
```
### Versuch 2
```
Kundenauftrag auswählen
Finales, verknüpftes Angebot auswählen
FÜR-ALLE Materialposten des finalen Angebots 
    Lagerbestand des zugeordnetes Produkts prüfen 
    WENN nicht genug verfügbar
        Lieferant aus Hauplieferanten auswählen
        WENN kein Lieferant verfügbar
            Lieferanten recherchieren
            Lieferant auswählen
            Lieferant kontaktieren 
            Angebote empfangen
            Lieferant anlegen
            Lieferant auswählen
        ENDE-WENN
        Lieferant aus Hauptlieferanten auswählen 
        WENN Lieferant bereits eine offene Bestellung hat
            Material dem vorhandenen Eigenauftrag mit selbem Lieferanten hinzufügen
        SONST 
            Neuen Eigenauftrag für Bestellung anlegen (Für Verfeinerung vgl. Auftrag anlegen)
            Eigenauftrag in Kontext des Kundenauftrags setzen
            Eigenauftrag als verknüpften Auftrag des Kundenauftrags hinzufügen
            Material dem neuen Eigenauftrag hinzufügen
        ENDE-WENN
    ENDE-WENN
ENDE-FÜR-ALLE
Alle offenen Eigenaufträge absenden
WENN Bestellbestätigung erhalten -> Rechnung erhalten //Rechnung als Output der Bestellbestätigung
    Rechnung archivieren (Rechnung) //Rechnung als Input für das Archivieren der Rechnung
SONST
    Fehler prüfen
    Neue Bestellung mit anderem Lieferanten für fehlgeschlagenes Produkt anlegen
ENDE-WENN
```
## Unterprozesse
### Lieferant anlegen
```
Öffne Lieferantenmenü
Öffne Lieferanten-Editor

Neuen Lieferanten hinzufügen

Attribute (Name, Steuernummer) hinzufügen
Rechnungsadresse erstellen 
Attribute setzen (Postleitzahl, Stadt, Straße, Hausnummer)
Referenz auf Rechnungsadresse hinzufügen
Hauptperson erstellen
Attribute setzen (Anrede, Vorname, Nachname, Telefonnummer, E-Mail-Adresse)
Referenz auf Hauptkontakt hinzufügen
Vertreter hinzufügen

FÜR-ALLE Produkte eines Lieferanten
    Produkt der Bestellliste hinzufügen 
    Attribute (ProduktID, Name, Beschreibung, Hersteller, Stückpreis) hinzufügen
    WENN Hauptlieferant des Produktes
        Produkt mit Lieferant als Hauptlieferant verknüpfen
    ENDE-WENN
ENDE-FÜR-ALLE
```
### Lieferant kontaktieren 
```
WENN Mailadresse als Kontaktmöglichkeit vorhanden
    Mailprogramm öffnen
    Empfänger eintragen
    Betreff definieren 
    Mail mit Angebotsanfrage verfassen 
    Mail absenden
SONST-WENN Telefonnummer als Kontakmöglichkeit vorhanden 
    Telefon holen 
    Telefonnummer eingeben
    Anrufen 
    WENN Lieferant nicht ran geht
        Auf die Mailbox sprechen
    SONST
        Angebote einholen
        Vereinbaren diese via Mail oder Post zu bekommen
    ENDE WENN
SONST-WENN Adresse als Kontaktmöglichkeit vorhanden
    Word öffnen 
    Anschreiben verfassen 
    Drucker anschalten
    Dokument drucken
    Drucker ausschalten
    Briefumschlag holen
    Absender, Empfänger und Briefmarke auf den Umschlag schreiben
    Brief falten 
    Brief in den Briefumschlag legen
    Briefumschlag verschließen
    Brief wegbringen
SONST
    Neuen Lieferanten suchen (keine Kontaktdaten vorhanden)
ENDE WENN
```
## Rechung archivieren (Rechnung)
```
WENN Rechung in Papierformat
    Rechnung einscannen
WENN Rechnung nicht in PDF Format
    Rechnung in PDF konvertieren
ENDE WENN
Rechnung dem Eigenauftrag der Bestellung anhängen
```

Verfeinern: Lieferant anlegen und evtl noch die anderen aus dem Prozess