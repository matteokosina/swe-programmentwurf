#import "template/template.typ"

= Aufgabenstellung
== Einleitung
Wir – die *HWSoft Vertriebs-GmbH* – bieten Handwerksbetrieben aller Größen und 
Fachrichtungen maßgeschneiderte Softwarewerkzeuge an, um deren Verwaltung zu
vereinfachen und zu beschleunigen. \
Unsere bisherige Softwarelösung bietet mehrere separate Applikationen speziell
für Installateure, Heizungsbauer, Dachdecker, und Bäckereien an. 
Hierfür ist die Wartung und Weiterentwicklung der einzelnen Softwarewerkzeuge 
nun zu aufwändig geworden. \
Um jedoch alle weiteren denkbaren Handwerksbetriebe ansprechen zu können und 
da sich die o.g. Softwarelösungen doch recht ähnlich sind, 
bietet es sich an, eine neue Verwaltungs-Software für Handwerksbetriebe 
erstellen zu lassen, die eine gemeinsame Basis hat und die bestenfalls für 
einzelne Spezialisierungen über Plugins o.ä. erweitert werden kann. \
Dabei soll es sich um ein Desktopsystem handeln, bei denen jeder Arbeitsplatz 
im Büro auf eine gemeinsame Datenbasis zugreift. \
Für Betriebe, welche beim Kunden vor Ort auf ihre Daten zugreifen wollen 
und/oder müssen, wollen wir zusätzlich angepasste Web-Applikationen anbieten, 
die auf Tablets oder Handys laufen können. Aus Datenschutz- und 
Sicherheitsgründen erfolgt der Zugriff nur auf explizit freigegebene Teile 
der Daten. Hierzu müssen die ausgewählten Daten im Internet für die Mitarbeiter 
geeignet bereitgestellt werden.

Da die Verwaltung eines Handwerksbetriebs meist durch wenige Personen erfolgt, 
die meist keine oder geringe Computerkenntnisse besitzen, ist eine intuitive 
und leicht erlern- und bedienbare grafische Benutzeroberfläche zwingend 
erforderlich.
== Lastenheft
=== Zielsetung
Ziel dieser Entwicklung soll eine Software für die Verwaltung von Handwerksbetrieben sein.\
Es sollen auf einfache Weise Kunden-, Termin-, Material-, Auftrags-, Geräte- und Personaldaten sowie Angebote und Rechnungen mittels einer grafischen Benutzeroberfläche angelegt, gesucht, geändert, importiert und exportiert werden können. Darüber hinaus sollen Bestellungen und Lieferungen von und an andere Firmen verwaltet werden können. \
Eine zentrale Datenhaltung sowie ein Mehrbenutzersystem müssen realisiert werden. 
=== Anwendungsbereich
Die Software wird für die Verwaltung von Daten von Handwerksbetrieben eingesetzt.
=== Zielgruppen, Benutzerollen und Verantwortlichkeiten
Zur Zielgruppe zählen alle bei einem Handwerksbetrieb beschäftigten Mitarbeiter, die für die Erfassung und Verwaltung der Daten angestellt sind.
- Das kaufmännische Personal soll den Vollzugriff auf die Betriebsdaten (Personal, Termine, Kunden, Angebote, Rechnungen, Firmen, usw.) erhalten.
- Ein Administrator soll sämtliche Daten anlegen, ändern, löschen, exportieren und importieren können. Hierzu gehört auch der selektive Import und Export von Daten
- Vorgesetzte (z.B. Gruppen- und Abteilungsleiter) sollen lesenden Zugriff auf alle Gerätschaften bzw. Anlagen haben.
- Ausgewählte Mitarbeiter sollen lesenden Zugriff auf Bestands- und Verfügbarkeitsdaten von Materialien und Werkzeugen haben.
Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein.

=== Zusammenspiel mit anderen Systemen
Das zu entwickelnde Softwaresystem soll aus Sicherheitsgründen 
ohne Netzverbindung nach Außen lauffähig sein.
Mehrere Drucker sollen für die Erstellung der Rechnungen 
und Angebote angeschlossen sein. \
Damit ein Kunde mit EC- oder Kreditkarte zahlen kann, 
soll ein Kartenleser angeschlossen werden können. 
Die Schnittstelle zum Lesegerät muss untersucht werden. \
Die finanztechnischen Daten der Mitarbeiter 
(Gehälter bzw. Löhne) werden separat durch unser eigenes Finanzbuchhaltungsprogramm 
*FiBuSys* verwaltet. 
Das System soll geeignet in das Gesamtsystem 
integriert werden. \
In einem weiterführenden Projekt sollen ausgewählte Daten, 
über ein 
Tablet oder ein Handy direkt vor Ort verwaltet werden können. 
Das erhöht die Flexibilität der Betriebe bzw. deren Mitarbeiter. 
Das „Tablet-Projekt“ selbst ist nicht direkter Bestandteil des 
vorliegenden Entwicklungsauftrags, sondern ein Folgeauftrag. 
Es sollen jedoch vorbereitende Arbeiten und konkrete Vorschläge zur 
Realisierung (GUI, Schnittstellen, Architektur) gemacht werden. \
Für Kunden, die bereits unser aktuelles System gekauft haben, 
sollen die erstellten Daten direkt in das neue System übernommen 
werden können.

=== Produktfunktionen
#table(
    columns: 2,
    [
        /LF10/
    ],
    [
        Der jeweilige Benutzer muss die Möglichkeit haben, 
        über eine grafische Benutzeroberfläche alle für ihn relevanten Daten einfach 
        und übersichtlich zu verwalten. \
        Es sollen zahlreiche Konfigurationsdaten gespeichert 
        und beim nächsten Start des Programms verwendet werden 
        (z.B. aktuelle Größe und Position des Fensters). 
        Daneben sollen einige Elemente vor dem Start konfigurierbar 
        sein (z.B. Überschriften, Schriftarten und -größen usw.).
    ],
    [
        /LF20/
    ],
    [
        Es sind Mitarbeiterdaten, Kundendaten und Lieferantendaten zu verwalten.
    ],
    [
        /LF30/
    ],
    [
        Zentrales Element ist ein Kundenauftrag, zu denen Angebote, Lieferungen, 
        Rechnungen und Zahlungserinnerungen gehören. Angebote, Lieferungen und 
        Rechnungen beinhalten die Zusammenstellung einzelner Angebots-, 
        Lieferungs- und Rechnungsposten.\
        Daneben gehören zu einem Kundenauftrag ein Kunde und meist ein oder mehrere Lieferanten. \
        Jedem Kundenauftrag ist für jeden Bearbeitungsschritt 
        (Erstellung, Änderung, Löschung usw.) ein Mitarbeiter zuzuordnen. 
        Es muss dafür gesorgt werden, 
        dass die einzelnen Schritte jederzeit nachvollziehbar sind.
    ],
    [
        /LF40/
    ],
    [
        Es muss eine Terminverwaltung integriert sein. Termine können beliebig 
        lang dauern, auch mehrere Wochen (je nach Kundenauftrag). Einem 
        Kundenauftrag sind entsprechend ein Start- und ein Endtermin zugeordnet. 
        Darüber hinaus können beliebig viele Zwischentermine hinzugefügt werden.\
        Terminüberschneidungen müssen bei Eintragungen vermieden werden.
    ],
    [
        /LF50/
    ],
    [
        Für jeden Kundenauftrag können beliebige Materialien bei verschiedenen 
        Lieferanten beschafft werden. \
        Da noch nicht bei allen Lieferanten über das Internet oder E-Mail bestellt 
        werden kann (z.B. bei vielen Kleinbetrieben), soll eine Bestellliste 
        interaktiv erstellt und als Bestellung ausgedruckt werden können. \
        Dazu sollen leicht erweiterbare, branchenspezifische Auswahllisten 
        eingesetzt werden, um den Erstellungsprozess zu vereinfachen (die vielen 
        Listen stellen wir zur Verfügung, es handelt sich um einfache 
        Zeichenkettenlisten, die im System verarbeitet werden sollen).
    ],
    [
        /LF60/
    ],
    [
        Neben den Kundenaufträgen gibt es noch eigene Aufträge an 
        andere Firmen (z.B. bzgl. Wartung, Reparatur, Beschaffung (s. /LF50/) 
        u.v.m. 
        Auch hierfür gibt es Angebote und Rechnungen, die verwaltet werden müssen.
    ],
    [
        /LF70/
    ],
    [
        Die grafische Benutzungsoberfläche soll die Suche nach Kundenaufträgen, 
        Kunden und Lieferanten bieten. Die Ergebnisse sollen in Listenform
        dargestellt werden. \
        Nach der Selektion eines Listeneintrags sollen 
        sämtliche Informationen über das Element mit allen Referenzen direkt angezeigt werden.

    ],
    [
        /LF80/
    ],
    [
        Alle Aufträge werden nach Übertragung an das Finanzbuchhaltungssystem dort 
        weiterverarbeitet (Auftragsvergabe, Rechnungsstellung usw.). Eine 
        Aktualisierung der Zustände der Aufträge (gestartet, laufend, ausgeführt, 
        Rechnung gestellt, …) erfolgt durch Abrufen der Auftragsdaten vom 
        Finanzbuchhaltungssystem.
    ],
    [
        /LF90/
    ],
    [
        Schließlich sollen noch die eigenen Werkzeuge und Anlagen verwaltet werden.
    ],
    [
        /LF100/
    ],
    [
        Sämtlichen Elementen sollen mehrere Bilder mit Titel zugeordnet werden 
        können, die zentral auf einem Verzeichnis liegen sollen.
    ],
    [
        /LF110/
    ],
    [
        Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese eventuell schon vorhanden sind.
    ]
)

=== Produktdaten
#table(
    columns: (auto, 1fr),
    [
        /LD10/
    ],
    [
        Die Daten sollen in einer zentralen Datenbasis abgespeichert werden.
    ]
)

=== Produktleistungen
#table(
    columns: 2,
    [
        /LL10/
    ],
    [
        Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt.
    ],
    [
        /LL20/
    ],
    [
        Um bei möglichst allen Kunden unsere Software installieren und ausführen zu können muss zwingend auf Plattformunabhängigkeit geachtet werden.
    ],
)

=== Qualitätsanforderungen
#table(
    columns: (auto, 1fr, 1fr, 1fr, 1.5fr),
    align: left,
    fill: (x, y) => if y == 0 { rgb("#e6e6e6") },
    table.header(
        [Produktqualität],
        [sehr gut],
        [gut],
        [normal],
        [nicht relevant],
    ),
    [
        Funktionalität
    ],
    [],[X],[],[],
    [
        Zuverlässigkeit
    ],
    [],[X],[],[],
    [
        Effizienz
    ],
    [],[X],[],[],
    [
        Benutzbarkeit (auch Gestaltung)
    ],
    [X],[],[],[],
    [
        Wartbarkeit
    ],
    [],[],[X],[],
    [
        Übertragbarkeit (Portabilität)
    ],
    [],[X],[],[],
)

== Aufgaben
Es handelt sich hier um eine stark vereinfachte Verwaltungs-Software. Einzelne 
Lastenheftpunkte sind bewusst offengehalten. Denken Sie darüber nach, welche 
Informationen zusätzlich sinnvoll oder auch notwendig sind. Recherchieren Sie 
evtl. nach einzelnen Zusammenhängen im Internet.
=== Analyse 
Für die Analyse sind zu erstellen:
- Analyse des Lastenhefts (Fragen und Antworten). 
- Ein Use-Case-Diagramm der gesamten Anwendung incl. Beschreibung.
- Eine Verfeinerung des Use-Case-Diagramms incl. Beschreibung. (nach Absprache)
- Ein Analyse-Klassendiagramm incl. Beschreibung (Untersuchen Sie dabei den Einsatz geeigneter Analysemuster)
- Einfach gestaltete GUI-Skizzen (Mockups) von mindestens zwei wesentlichen GUI-Komponenten (Hauptseite, Tabs, etc.). Die Skizzen können mit einem einfachen Grafikprogramm erstellt werden. Auch sorgfältige Handzeichnungen sind erlaubt.  Keine Login-GUI skizzieren!

=== Sequenzdiagramm und Aktivitätsdiagramm 
Erstellen Sie ein Sequenzdiagramm und ein Aktivitätsdiagramm (incl. Beschreibung) für folgende Szenarios (ein AD für ein Szenario, ein SD für das andere Szenario):
- Die Aktion „Auftrag durchführen“ vom Erstkontakt bis zur Bezahlung der Rechnung
- Die Aktionen „Materialbestellungen für obigen Auftrag durchführen“. 
Tipp: Sie können zur besseren Veranschaulichung die Bestellungen exemplarisch für einen beliebigen Handwerksbetrieb durchführen.\
Die Bewertung Ihrer Diagramme erfolgt auf der Basis der Nutzung der UML-Elemente, auf Ihrer Kreativität sowie dem Detaillierungsgrad der Diagramme.\
Fassen Sie bei beiden Diagrammen die Eingabe aller primitiven Attribute eines 
Elements (Float, String, Integer, …) in einer einzigen Aktion zusammen (z.B. 
„Attribute eintragen“).\
Für das Sequenzdiagramm ist das gewählte Szenario ausführlich zu entwickeln 
(idealer­weise mit Pseudocode oder einer anderen Modellierungsmethode Ihrer Wahl). 
Es sind sämtliche referenzierten Elemente zu berücksichtigen, die zugeordnet 
werden können. \
Hinweis: In allen Fällen wird eine (noch) leere Datenbasis angenommen. Denken Sie an geeignete Diagrammverfeinerungen. 
=== Entwurf
Abzuliefern sind hier (alle Diagramme und GUIs jeweils mit Beschreibung):
- Entwurfsklassendiagramm (Untersuchen Sie dabei den Einsatz geeigneter Entwurfsmuster)
- GUI-Modellierung:
    Es ist das Kommunikationsschema eines Teils der während der Analyse skizzierten 
    GUI mit UML zu modellieren. Die Anwendung selbst soll dabei nach dem einfachen 
    Model-View-Control-Muster mithilfe des Observer-Patterns aufgebaut sein. Dazu sind 
    mindestens ein Controller, die erforderlichen Modellklassen sowie eine unabhängige 
    GUI (View) erforderlich.\
    Die Erzeugung der Instanzen soll in einer Entity-Factory erfolgen und zur 
    Verwaltung der Instanzen ist ein Entity-Manager zu realisieren (beides siehe 
    Vorlesung).\
    Die meisten GUI-Elemente werden über eine einfache kleine Java-Bibliothek zur 
    Verfügung gestellt (swe-utils.jar), deren GUI-Komponenten in das Klassendiagramm 
    zu integrieren sind, wenn sie verwendet warden (Thema: Integration einer fremden 
    UI-Bibliothek).\
    Hinweis: Die GUI-Modellierung kann in einem separaten Diagramm mit den relevanten 
    (gewählten bzw. benötigten) Modellklassen erfolgen, falls das 
    Entwurfsklassendia­gramm sonst zu komplex werden würde. 
=== Implementierung
entfällt
== Vereinfachungen für den Programmentwurf
#list(
    marker: "",
    spacing: 0.5cm,
    "a) Es muss nicht dafür gesorgt werden, dass auf dieselben Daten bzw. CSV-Dateien 
    nicht gleichzeitig zugegriffen werden kann, d.h. es ist kein Locking-Mechanismus 
    erforderlich.",

    "b) Eine Protokollierfunktion und ein Login-Vorgang sind für die Anwendung nicht 
    erforderlich (in der Realität natürlich schon!)."
)
