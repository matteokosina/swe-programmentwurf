# Materialbestellung 
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
    SOLANGE weiteres Material benötigt wird
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
        WENN bereits ein Angebot geählt wurde
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
## Unterprozesse: 
### Lieferant kontaktieren: 
```
// Ist der lieferant schon im System -> Dann zugriff über Geschäftspartner Oberklasse, statt neu einlesen
Kontaktdaten einlesen 
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
## Rechung archivieren (Rechnung):
```
WENN Rechung in Papierformat
    Rechnung einscannen
WENN Rechnung nicht in PDF Format
    Rechnung in PDF konvertieren
ENDE WENN
Rechnung dem Eigenauftrag der Bestellung anhängen
```