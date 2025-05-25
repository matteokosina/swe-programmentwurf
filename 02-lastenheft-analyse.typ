#import "template/template.typ"
#import "@preview/cetz:0.1.2"
#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#show: codly-init.with()
#codly(number-format: none, languages: (
  HTTP: (name: " HTTP", icon: "🌐", color: rgb("#2b9dce")),
  JSON: (name: " JSON", icon: "{}", color: rgb("#2b9dce")),
))

#let questionCount = state("q", 1)

#let questionColor = rgb("#48a23a")
#let answerColor = rgb("#de3333")
#let internColor = rgb("#3c68f9")

#let qa(question: "", answer: "", internal_remark: "", subquestions: ()) = {
  let render(question, answer, internal_remark, subquestions, level) = {
    set enum(
      numbering: n => {
        let color = n

        if question == "" {
          color += 1
        }

        if answer == "" {
          color += 1
        }

        strong((
          "",
          text(fill: questionColor, [Frage #context { questionCount.get() }:]),
          text(fill: answerColor, "Antwort:"),
          text(fill: internColor, [_Intern_:]),
        ).at(color))
      },
      number-align: left,
    )

    let subquestions = [
      #for sq in subquestions {
        render(
          sq.at("question"),
          sq.at("answer"),
          sq.at("internal_remark", default: ""),
          sq.at("subquestions", default: ()),
          level + 1,
        )
      }
    ]

    if question != "" {
      enum.item(text(fill: questionColor, question))
    }

    if answer != "" {
      enum.item([
        #text(fill: answerColor, answer)
        #if internal_remark == "" {
          subquestions
        }
      ])
    }
    
    if internal_remark != "" {
      enum.item([
        #text(fill: internColor, emph(internal_remark))
        #subquestions
      ])
    }

    questionCount.update(q => q + 1)
  }

  render(question, answer, internal_remark, subquestions, 1)
}

= Analyse des Lastenhefts
== Einleitung
Wir – die *HWSoft Vertriebs-GmbH* – bieten Handwerksbetrieben aller Größen und
Fachrichtungen maßgeschneiderte Softwarewerkzeuge an, um deren Verwaltung zu
vereinfachen und zu beschleunigen. \
Unsere bisherige Softwarelösung bietet mehrere separate Applikationen speziell
für Installateure, Heizungsbauer, Dachdecker, und Bäckereien an.
Hierfür ist die Wartung und Weiterentwicklung der einzelnen Softwarewerkzeuge
nun zu aufwändig geworden. \

#qa(
  question: "Sollen diese Spezialfälle standardmäßig implementiert sein?",
  answer: "Nein, es soll ein allgemeines System gebaut werden, welches mit den Spezialfällen erweitert werden kann.",
)

#qa(
  question: "Für welche Größen an Handwerksbetrieben ist die Software gedacht?",
  answer: "Unsere Kunden befinden sich im Größenmaß von 1-100 Mitarbeitenden.",
)

Um jedoch alle weiteren denkbaren Handwerksbetriebe ansprechen zu können und
da sich die o.g. Softwarelösungen doch recht ähnlich sind,
bietet es sich an, eine neue Verwaltungs-Software für Handwerksbetriebe
erstellen zu lassen, die eine gemeinsame Basis hat und die bestenfalls für
einzelne Spezialisierungen über Plugins o.ä. erweitert werden kann. \
Dabei soll es sich um ein Desktopsystem handeln, bei denen jeder Arbeitsplatz
im Büro auf eine gemeinsame Datenbasis zugreift. \

#qa(
  question: "Welche Betriebssysteme sind vorhanden oder sollten unterstützt werden?",
  answer: "Da unsere Kunden sehr unterschiedliche Infrastrukturen besitzen, wollen wir die Funktionalität der Software für die Desktop-Betriebssysteme Windows 11, Linux Ubuntu 24.04, Linux Debian 12 und MacOS 15 garantieren.",
  internal_remark: "Plattformunabhängigkeit wird benötigt. Unterschiede in der Verwaltung von Dateipfaden sind zu beachten.",
)

#qa(
  question: "Wie soll die Verfügbarkeit der Software gestaltet sein, kann sie bspw. über die Nacht abgeschaltet werden oder muss sie zu jeder Zeit verfügbar sein?",
  answer: "Die Software muss nicht durchgängig laufen. Die genauen Zeiträume soll jedes Unternehmen selbst anpassen können. Als Standardwert kann hier von 22 – 2 Uhr verwendet werden.",
  internal_remark: "Lösbar über Konfigurations-Seite, welche nur für Administratoren zugänglich ist. Dort kann auch der aktive Zeitrahmen eingegrenzt werden.",
)

Für Betriebe, welche beim Kunden vor Ort auf ihre Daten zugreifen wollen
und/oder müssen, wollen wir zusätzlich angepasste Web-Applikationen anbieten,
die auf Tablets oder Handys laufen können. \

#qa(
  question: "Wie sieht es mit der Verfügbarkeit für die Web-Version aus (nur im Intranet/VPN oder öffentlich zugänglich)?",
  answer: "Die Web-Version soll mit entsprechenden Sicherheitsvorkehrungen öffentlich zugänglich sein.",
  subquestions: (
    (
      question: "Wie sollen die Sicherheitsvorkehrungen aussehen? Gibt es bestehendevSicherheitsprotokolle, die aktuell verwendet werden?",
      answer: "Aktuell gibt es keine Web-Applikationen in unserem Portfolio. Für die Anwendung sollte eine Authentifikation mit Benutzername und Passwort verwendet werden.",
    ),
  ),
)

#qa(
  question: "Welche Display-Größen sollen für diese Web-Applikation unterstützt werden?",
  answer: "Das meistverwendete Handy ist das IPhone 14, welches 6,1 Zoll groß ist und das meistverwendete Tablet ist das IPad Air, es hat bis zu 13 Zoll.",
  internal_remark: "IPhone 14: 2532 x 1170 Pixel und IPad Air: 2732 x 2048 Pixel",
)

#qa(
  question: "Wie soll die Verfügbarkeit der Software gestaltet sein, kann sie bspw. über die Nacht abgeschaltet werden oder muss sie zu jeder Zeit verfügbar sein?",
  answer: "Die Software muss nicht durchgängig laufen. Die genauen Zeiträume soll jedes Unternehmen selbst anpassen können. Als Standardwert kann hier von 22 – 2 Uhr verwendet werden.",
  internal_remark: "Lösbar über Konfigurations-Seite, welche nur für Administratoren zugänglich ist. Dort kann auch der aktive Zeitrahmen eingegrenzt werden.",
)

#qa(
  question: "Sollen alternativ auch native Lösungen (Apps) für mobile Geräte entwickelt werden?",
  answer: "Nein, das ist nicht notwendig. Die Web-Applikation genügt.",
)

#qa(
  question: "Soll die Web-Version die gleichen Funktionen bieten wie die Desktop-Version?",
  answer: "Die Webapp soll keine administrativen Funktionen implementieren. Darüber hinaus sollen nur Funktionen unterstützt werden, für die die notwendigen Daten in der Webapp verfügbar sind. (siehe nächster Punkt)",
)

Aus Datenschutz- und
Sicherheitsgründen erfolgt der Zugriff nur auf explizit freigegebene Teile
der Daten. Hierzu müssen die ausgewählten Daten im Internet für die Mitarbeiter
geeignet bereitgestellt werden.\

#qa(
  question: "Welche Daten betrifft das?",
  answer: "Das betrifft alle Personaldaten und die Betriebe können selbst noch andere Daten einstellen, die nur für die Desktopanwendung gedacht sind.",
  internal_remark: "Für genaue Definition von Personaldaten siehe Datenmodellierung.",
)

#qa(
  question: "Sollen Handwerkbetriebe in der Lage sein, dies selbst zu definieren?",
  answer: "Ja, der Umfang der betroffenen Daten soll individuell konfigurierbar sein, um so die Software auf den jeweiligen Betrieb zuschneiden zu können.",
  internal_remark: "Auf gleicher Admin-Seite wie das geplante Herunterfahren konfigurierbar. Dort können die Typen von Daten angezeigt werden, beispielsweise „Personaldaten“ und „Aufträge“.",
)

#qa(
  question: "Gibt es bereits Richtlinien / Regulierungen, die umgesetzt werden können?",
  answer: "Die Anwendung muss die Daten DSGVO-konform verarbeiten.",
)

Da die Verwaltung eines Handwerksbetriebs meist durch wenige Personen erfolgt,
die meist keine oder geringe Computerkenntnisse besitzen, ist eine intuitive
und leicht erlern- und bedienbare grafische Benutzeroberfläche zwingend
erforderlich.
== Lastenheft
=== Zielsetung
Ziel dieser Entwicklung soll eine Software für die Verwaltung von Handwerksbetrieben sein.\
Es sollen auf einfache Weise Kunden-, Termin-, Material-, Auftrags-, Geräte- und Personaldaten sowie Angebote und Rechnungen mittels einer grafischen Benutzeroberfläche angelegt, gesucht, geändert, importiert und exportiert werden können. Darüber hinaus sollen Bestellungen und Lieferungen von und an andere Firmen verwaltet werden können. \

#qa(
  question: "Welche Attribute hat je ein Kunde, Termin, Material, Auftrag, Gerät, Personal, Angebot, Rechnung, Bestellung, Lieferung und Firma? ",
  answer: "siehe Datenmodellierung",
) // TODO: add reference

#qa(
  question: "Sollen diese Attribute erweitert / geändert werden können oder soll dies ausschließlich in Form von Plugins realisiert werden?",
  answer: "Die Attribute stehen fest. Alle Änderungen auf dieser Ebene müssen per Plugin realisiert werden, die in das bestehende System eingreifen.",
)

#qa(
  question: "Was soll beim Anlegen passieren, wenn ein Eintrag bereits existiert?",
  answer: "Es soll eine Fehlermeldung ausgegeben werden.",
  subquestions: (
    (
      question: "Und die Datenbasis wird dann nicht verändert, es wird nur eine Fehlermeldung gezeigt, verstehe ich das richtig?",
      answer: "Ja, genau so stellen wir uns das vor.",
    ),
  ),
)

#qa(
  question: "Gibt es Standardwerte beim Anlegen oder müssen alle Attribute angegeben werden?",
  answer: "In der Softwarekonfiguration des Administrators können die Unternehmen Standardwerte und optionale Werte, die nicht gesetzt werden müssen, definieren. Alle anderen Felder brauchen beim Anlegen einen Wert.",
)

#qa(
  question: "Soll nach jedem Attribut gesucht werden können?",
  answer: "Nein, für Details siehe /LF70/",
) //TODO: add reference

#qa(
  question: "Welche Daten sollen geändert werden können? Soll bei manchen Daten nachgefragt werden, bevor die Änderung ausgeführt wird?",
  answer: "Auch das sollte jedes Unternehmen für sich bestimmen und anpassen können.",
  subquestions: (
    (
      question: "Welche Daten sollen standardmäßig geändert werden können und bei welchen soll vor der Änderung nachgefragt werden?",
      answer: "Bei Personaldaten und Aufträge soll gefragt werden, bevor eine Änderung ausgeführt wird. Alle Felder sollen standardmäßig editierbar sein.",
    ),
  ),
)

#qa(
  question: "Soll es möglich sein einen ähnlichen Suchbegriff wie das zu suchendes Wort zu nutzen? (Z.B. Beim Suchwort „metallschnaider“ soll „Metallschneider“ gefunden werden)",
  answer: "Mehr Details siehe /LF70/",
) //TODO: add reference

#qa(
  question: "Möchten Sie auch filtern können, z. B. die Ergebnisse einer Personalsuche nach Alter sortieren können?",
  answer: "Ja, mehr Details siehe /LF70/",
) //TODO: add reference

#qa(
  question: "Für welchen Einsatz möchten Sie importieren und exportieren; ausschließlich zur Datensicherung oder auch für andere Zwecke?",
  answer: "Importieren soll neben der Datensicherung auch für exportierte Daten der alten Systeme möglich sein. Die Exportfunktion soll druckbare Formate unterstützen.",
  subquestions: (
    (
      question: "Gibt es hierfür bereits bestehende Formate oder welche, die Sie bevorzugen (Excel, CSV, PDF), oder soll ein eigener Format-Standard erstellt werden? ",
      answer: "Die Unternehmen haben unterschiedliche Formate. Hier dürfen Sie sich einen Standard CSV-Format überlegen. Die einzelnen Unternehmen müssen dann ihre alten Exporte in unseren Standard konvertieren. (Wir bieten hierzu auch Dienstleistungen an, in denen wir diese Arbeit für den Kunden übernehmen. Darüber müssen Sie sich aber keine Gedanken machen.) Als druckbares Format zum Exportieren sollte zumindest PDF unterstützt werden.",
    ),
  ),
)

Eine zentrale Datenhaltung sowie ein Mehrbenutzersystem müssen realisiert werden. \

#qa(
  question: "Bedeutet „zentral“, dass es sich um ein System in der Cloud oder lokal handelt?",
  answer: "Jedes Unternehmen verwendet seinen eigenen lokalen Server.",
)

#qa(
  question: "Sehen Sie eine Backup-Strategie vor? (Bspw. eine komplette Spiegelung der Daten)",
  answer: "Ja, umbedingt!",
  subquestions: (
    (
      question: "Soll dies durch eine externe Software-Lösung umgesetzt werden oder durch uns?",
      answer: "Wir haben in unseren alten Lösungen immer Borg für verschlüsselte Backups verwendet. Hier sollte die Borg Schnittstelle für automatische Backups integriert werden.",
      internal_remark: "Dokumentation zum BackUp-System Borg (siehe https://borgbackup.readthedocs.io/en/stable/)",
    ),
  ),
)

#qa(
  question: "Sollen Backups / andere Daten nach einer gewissen Zeit gelöscht werden?",
  answer: "Uns ist nur wichtig, dass sich die Datenhaltung nach der DSGVO richtet.",
)

=== Anwendungsbereich
Die Software wird für die Verwaltung von Daten von Handwerksbetrieben eingesetzt.
=== Zielgruppen, Benutzerollen und Verantwortlichkeiten
Zur Zielgruppe zählen alle bei einem Handwerksbetrieb beschäftigten Mitarbeiter, die für die Erfassung und Verwaltung der Daten angestellt sind.\

#qa(
  question: "Sollen auch Handwerker Daten verwalten und erfassen oder nur Büro Personal, welches speziell dafür angestellt ist?",
  answer: "Je nach Betrieb können auch Handwerker für Verwaltung von Daten zuständig sein (z.B. Schreiben von Kundenrechnung).",
)

#qa(
  question: "Soll es möglich sein Gast-Profile für extern Beschäftigte anzulegen (z.B. für Finanzprüfer)?",
  answer: "Ja, Gastprofile sollen erstellbar sein, welche nur temporärem Zugriff auf die Daten haben. Je nach den benötigten Daten, können die verschiedenen Rollen (Administrator, Buchhaltung, …) zugewiesen werden",
)

- Das kaufmännische Personal soll den Vollzugriff auf die Betriebsdaten (Personal, Termine, Kunden, Angebote, Rechnungen, Firmen, usw.) erhalten.\

#qa(
  question: "Heißt Zugriff auch erstellen, ändern und löschen oder nur lesen und suchen?",
  answer: "Ja, auch erstellen, ändern und löschen soll erlaubt sein.",
)

- Ein Administrator soll sämtliche Daten anlegen, ändern, löschen, exportieren und importieren können. Hierzu gehört auch der selektive Import und Export von Daten\

#qa(
  question: "Welchen Kenntnisstand haben Administratoren? Reicht dieser aus, um mit diesem allumfassenden Zugriff umzugehen?",
  answer: "Administratoren haben nicht unbedingt weitreichende Informatikkenntnisse. Sie sind allerdings gut geschulte Mitarbeitende, die mit der Konfiguration eines solchen Systems über eine Benutzeroberfläche umgehen können. Einfache Veränderung an Konfigurationsdateien können sie im Notfall auch auf Anweisung durchführen.",
)

#qa(
  question: "Sind sie die einzigen, die importieren/exportieren dürfen?",
  answer: "Nein, exportieren einzelner Objekte in druckbare Formate soll allen Mitarbeitenden mit Lesezugriff möglich sein. Das Importieren und Exportieren der gesamten Datenbank soll allerdings Administratoren vorbehalten werden.",
)

- Vorgesetzte (z.B. Gruppen- und Abteilungsleiter) sollen lesenden Zugriff auf alle Gerätschaften bzw. Anlagen haben.\

#qa(
  question: "Können Personen mehrere Rollen haben?",
  answer: "Nein, eine Person kann immer nur genau eine Rolle besitzen.",
)

- Ausgewählte Mitarbeiter sollen lesenden Zugriff auf Bestands- und Verfügbarkeitsdaten von Materialien und Werkzeugen haben.

#qa(
  question: "Im Endeffekt sind das die gleichen Rechte, die auch ein Vorgesetzter hat oder gibt es hier Unterschiede?",
  answer: "Richtig, wenn man mal drüber nachdenkt, sind das die gleichen Rechte.",
  internal_remark: "Nur eine Rolle „Vorgesetzter“ ist ausreichend.",
)

Es sollen keine besonderen Computerkenntnisse zur Bedienung der Software erforderlich sein.\

#qa(
  question: "Was heißt keine „besonderen“ Kenntnisse?",
  answer: "Es wird eine kurze Einführung in die Software geben, allerdings hat nicht jedes Unternehmen IT-Personal. Also sollte nicht von Kenntnissen ausgegangen werden, die über Standard EDV, z.B. Microsoft Word, hinaus gehen. Zusätzliche Anleitungen sollen in der Desktop-Anwendung aufrufbar sein!",
)

#qa(question: "Auch beim Administrator?", answer: "Siehe oben.")

=== Zusammenspiel mit anderen Systemen
Das zu entwickelnde Softwaresystem soll aus Sicherheitsgründen
ohne Netzverbindung nach Außen lauffähig sein.
Mehrere Drucker sollen für die Erstellung der Rechnungen
und Angebote angeschlossen sein. \

#qa(
  question: "Ist mit Netzverbindung die Verbindung ins öffentliche Internet gemeint oder auch die Verbindung zum lokalen Datenserver?",
  answer: "Gemeint ist Verbindung in das öffentliche Internet. Ohne Verbindung zum internen Server sind die Funktionen der Software nicht möglich.",
)

#qa(
  question: "Was passiert mit den Daten der Webapp, falls die Verbindung abbricht?",
  answer: "Der Nutzer wird bei Verbindungsabbruch benachrichtigt, dass die Daten nicht gespeichert werden können.",
)

#qa(
  question: "Wenn sie zwischengespeichert werden, wie lange und in welchem Ausmaß?",
  answer: "Es soll keine Zwischenspeicherung implementiert werden.",
)

#qa(
  question: "Sollen die Drucker in die Software integriert werden oder wird das über die Exportformate gelöst?",
  answer: "Eine direkte Verbindung zu den Druckern soll möglich sein.",
)

#qa(
  question: "Gibt es spezielle Drucker, die unterstützt werden sollen?",
  answer: "Nein, allgemeines Drucken mit den unterstützten Betriebssystemen (Windows, Linux und MacOS) soll möglich sein. Sollte es zu Problemen kommen, wird auf das PDF Exportformat zurückgegriffen, welches als gespeicherte Datei dann manuell gedruckt werden kann.",
)

#qa(
  question: "Sollen Mitarbeitende selbst jedes Mal einen Drucker auswählen dürfen oder hat jede Person einen bestimmten Drucker zugewiesen?",
  answer: "Es ist ein Standarddrucker vorgewählt, der aber noch geändert werden kann.",
)

Damit ein Kunde mit EC- oder Kreditkarte zahlen kann,
soll ein Kartenleser angeschlossen werden können.
Die Schnittstelle zum Lesegerät muss untersucht werden. \

#qa(
  question: "Welche Lesegeräte sollen unterstützt werden?",
  answer: "Die Lesegeräte sind je nach Unternehmen unterschiedlich, weshalb alle Lesegeräte unterstützt werden sollten (ggfs. durch eine Erweiterung). Die meisten Unternehmen verwenden jedoch Geräte von SumUp.",
  internal_remark: "Dokumentation dazu unter https://developer.sumup.com/api zu finden",
)

Die finanztechnischen Daten der Mitarbeiter
(Gehälter bzw. Löhne) werden separat durch unser eigenes Finanzbuchhaltungsprogramm
*FiBuSys* verwaltet.
Das System soll geeignet in das Gesamtsystem
integriert werden. \

#qa(
  question: "Welche Überschneidungen gibt es und welche Daten sollen integriert/angezeigt werden?",
  answer: "Nur die nötigen Personaldaten in Bezug auf die Gehälter der Mitarbeitenden sollen angezeigt werden. Das beinhaltet die Mitarbeiter-ID, Name, IBAN, Gehalt und die Gehaltsabrechnung.",
)
#qa(
  question: "Welche Schnittstellen sind vorhanden?",
  answer: "Das müssten Sie in der Dokumentation der FiBuSys Software lesen, das ist uns nicht bekannt.",
  internal_remark: [Die Recherche hat ergeben, dass eine REST-API vorhanden ist:
    Der Endpoint `/getLohn?mitarbeiter=<MitarbeiterID>`, welche von der
    Mitarbeiter-ID abhängig ist, gibt den Lohn des entsprechenden Mitarbeiters
    zurück. Eine Beispiel Anfrage für den Mitarbeiter mit der Mitarbeiter-ID
    0815 sähe dann so aus:
    ```HTTP
    GET <base-url>/getLohn?mitarbeiter=0815
    RESPONSE: 200 OK
    {
      „lohn“: 123.000,
      „mitarbeiterID“: „0815“,
      „name“: „John Doe“,
      „iban“: „DE12 3456 7890 1234 5678 90“
    }
    ```
  ],
)

#qa(
  question: "Soll man Löhne und Bankdaten auch in unserem System ändern und dann an das FiBuSys übertragen können?",
  answer: "Nein, solche Dinge soll man nur im FiBuSys ändern können. Die Daten sind jedoch im neuen System mit Lesezugriff abrufbar.",
)

In einem weiterführenden Projekt sollen ausgewählte Daten,
über ein
Tablet oder ein Handy direkt vor Ort verwaltet werden können.
Das erhöht die Flexibilität der Betriebe bzw. deren Mitarbeiter.
Das „Tablet-Projekt“ selbst ist nicht direkter Bestandteil des
vorliegenden Entwicklungsauftrags, sondern ein Folgeauftrag.
Es sollen jedoch vorbereitende Arbeiten und konkrete Vorschläge zur
Realisierung (GUI, Schnittstellen, Architektur) gemacht werden. \

#qa(
  question: "Ist das die Web-Applikation, von der oben gesprochen wurde?",
  answer: "Ja, genau das ist die Web-Applikation.",
)

Für Kunden, die bereits unser aktuelles System gekauft haben,
sollen die erstellten Daten direkt in das neue System übernommen
werden können.\

#qa(
  question: "Welche Datenformate werden hier verwendet?",
  answer: "Das selbsterstellte CSV-Format wie oben beschrieben.",
)

#qa(
  question: "Gibt es für das aktuelle System ein einheitliches Exportformat?",
  answer: "Nein, je nach Version des aktuellen Systems existieren unterschiedliche Formate. Als Importformat für das neue System soll jedoch nur das bereits angesprochene eigene CSV-Format existieren.",
)

#qa(
  question: "Welche Daten sind schon vorhanden?",
  answer: "Das ist abhängig vom vorherigen System, also unterschiedlich. Auf fehlende Felder soll beim Import hingewiesen werden.",
  subquestions: (
    (
      question: "Soll der Import bei fehlenden Feldern automatisch abgebrochen werden?",
      answer: "In einem Dialogfenster soll es möglich sein, einen Wert für das fehlende Feld zu definieren. Der Importprozess kann jedoch auch über dieses Dialogfenster abgebrochen werden.",
    ),
  ),
)

#qa(
  question: "Soll dieser Prozess automatisch passieren oder mit manuellem Ex- und Import?",
  answer: "Aufgrund der vielen verschiedenen Formate ist dieser Prozess nur durch manuelles Exportieren und Importieren möglich.",
)

#qa(
  question: "Was ist mit Attributen, die im aktuellen System existieren, jedoch nicht in das neue System übernommen werden können?",
  answer: "Hier soll der Administrator hingewiesen werden. Der Prozess soll dann trotzdem durchführbar sein.",
)

#qa(
  question: "Soll es möglich sein alle Daten zu exportieren?",
  answer: "Für Datenübertragung und -sicherung durch den Administrator ja. Andere Mitarbeiter haben hier nur eingeschränkten Zugriff (siehe oben).",
)

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

    #qa(
      question: "Welche Daten gibt es und aus was bestehen diese jeweils?",
      answer: "siehe Datenmodellierung",
    ) // TODO: add reference

    #qa(
      question: "Existieren branchen-spezifische Benutzeroberflächen? Müssen diese erstellbar sein?",
      answer: "Nein, alle Branchen haben die gleiche Benutzeroberfläche, einzelne Untermenüs können verschieden sein, aber das kann der jeweilige Systemadmin dann entscheiden",
      internal_remark: "Dies kann mit Feature-Flags gelöst werden -> was angezeigt werden soll und was nicht. Diese können auch über die Konfigurationsseite für Admins bearbeitet werden. So können beispielsweise alle Seiten zu „Werkzeugen“ deaktiviert werden.",
    )

    #qa(
      question: "In welchen Sprachen müssen die Benutzeroberflächen verfügbar sein?",
      answer: "Unsere Kundschaft befindet sich in der DACH-Region. Dementsprechend muss die Benutzeroberfläche nur in Deutsch verfügbar sein.",
    )

    #qa(
      question: "Haben verschiedene Benutzer verschiedene Benutzeroberflächen?",
      answer: "Ja, es soll zwei verschiedene Benutzeroberflächen geben: Admin- und Benutzer-Menü, also eine Oberfläche für Verwalter und eines für Anwender.",
    )

    #qa(
      question: "Welche Daten sind relevant für die jeweiligen Nutzer? ",
      answer: " siehe Datenmodellierung",
    ) // TODO: add reference

    #qa(
      question: "Wie viele Daten sollen angezeigt werden?",
      answer: "siehe oben",
    )

    #qa(
      question: "Soll die Benutzeroberfläche auf einen Bildschirm optimiert sein oder stehen mehrere Bildschirme zur Verfügung?",
      answer: "Ein Fenster optimiert auf einen Bildschirm (nicht jeder Mitarbeiter hat mehrere Bildschirme). Alles soll in einem Fenster dargestellt werden, so wie wenn man eine Webseite bedient.",
    )

    #qa(
      question: "Soll die Gesamtheit der Daten strikt in einer Benutzeroberfläche verfügbar sein oder können für die Übersichtlichkeit auch Untermenüs existieren?",
      answer: "Untermenüs oder neue Seiten sind erlaubt und erwünscht. Priorität ist die Nutzerfreundlichkeit.",
    )

    #qa(
      question: "Sollen die Daten ausgewertet werden (z. B. Berechnung von KPIs (Key Performance Indicator), Zusammenfassungen, Statistische Evaluierung) oder nur stur angezeigt werden?",
      answer: "Nein, sie sollen nur normal angezeigt werden, es sollen aber Schnittstellen für spätere Erweiterungen angeboten werden.",
      internal_remark: "REST APIs programmieren und mithilfe von API-Dokumentations Technologien wie z.B. Swagger (https://swagger.io/) für spätere Erweiterung dokumentieren) ",
    )

    #qa(
      question: "Mit welchen Elementen ist die Verwaltung der Daten definiert und wodurch ist diese charakterisiert? (Create, Update, Delete, Search)",
      answer: "Das muss alles (je nach Berechtigung) möglich sein. (siehe Rollendefinition)",
    )

    #qa(
      question: "Sollen die Daten gefiltert und sortiert werden können? Wenn ja, nach welchen Attributen und Elementen soll gefiltert und sortiert werden können?",
      answer: "siehe LF70",
    )

    Es sollen zahlreiche Konfigurationsdaten gespeichert
    und beim nächsten Start des Programms verwendet werden
    (z.B. aktuelle Größe und Position des Fensters).
    Daneben sollen einige Elemente vor dem Start konfigurierbar
    sein (z.B. Überschriften, Schriftarten und -größen usw.).\

    #qa(
      question: "Existiert bereits ein gewünschtes Konfigurationsformat?",
      answer: "Nein, es soll ein Standardformat festgelegt werden, dass man dann ändern kann.",
    )
    #qa(
      question: "Was bedeutet vor dem Start? Soll sich vor der eigentlichen Anwendung ein Konfigurationsfenster öffnen?",
      answer: "Beim ersten Start soll ein Konfigurationsfenster aufgehen, in dem man alles konfigurieren kann.",
    )
    #qa(
      question: "Welche Einstellungen umfassen die Konfigurationsdaten?",
      answer: "Schriftart, Schriftgröße, Akzentfarbe, Light-/Darkmode",
      subquestions: (
        (
          question: "Soll auch die Anordnung der Elemente konfigurierbar sein?",
          answer: "Nein",
        ),
        (
          question: "Was ist mit „Konfiguration von Überschriften“ gemeint?",
          answer: "Die Größe der Überschriften, kann man aber eigentlich auch immer 4 Größen größer als normalen Text machen.",
        ),
      ),
    )

    #qa(
      question: "Welche der Einstellungen müssen vor dem Start konfigurierbar sein?",
      answer: "Alle oben beschriebenen Einstellungen.",
    )

    #qa(
      question: "Dürfen Benutzer der Anwendung unterschiedliche Konfigurationen besitzen?",
      answer: "Jeder Benutzer hat eine eigene Konfigurationsdatei.",
    )

    #qa(
      question: "Soll es möglich sein, eigene thematische Darstellungen der Benutzeroberfläche als Themenprofil abzuspeichern?",
      answer: "Nein, es soll nur eine Standardkonfiguration geben und wer diese nicht möchte, kann sich seine eigene Konfiguration zusammenstellen (vor dem ersten Start).",
    )

    #qa(
      question: "Sollen diese Einstellungen geändert werden können?",
      answer: "Ja dies soll jederzeit in einem Konfigurationsmenü möglich sein.",
    )
  ],

  [
    /LF20/
  ],
  [
    Es sind Mitarbeiterdaten, Kundendaten und Lieferantendaten zu verwalten.\

    #qa(
      question: "Welche Daten sind für Mitarbeiter, Kunden und Lieferanten zu speichern? ",
      answer: "siehe Datenmodellierung",
    ) // TODO: add reference

    #qa(
      question: "Welche Zugriffsbeschränkungen gelten für die jeweiligen Daten? Welche Benutzerrollen haben Zugriff auf welche Daten?",
      answer: "siehe Rollenmodellierung (Berechtigungen)",
    ) // TODO: add reference

    #qa(
      question: "Sollen die Daten verschlüsselt abgespeichert werden?",
      answer: "Auf jeden Fall, s. DSGVO. Alles muss DSGVO-konform sein!",
    )

    #qa(
      question: "Sollen die Daten vor dem Speichern auf Korrektheit validiert werden?",
      answer: "Ja, „skdfj“ darf man z.B. nicht als Datum eingeben.",
      internal_remark: "Datentypen müssen stimmen -> keine semantische, nur syntaktische Prüfung",
      subquestions: (
        (
          question: "Wenn ja, welche Attribute müssen auf welches Format validiert werden?",
          answer: "siehe Datenmodellierung",
        ),
      ),
    )

    #qa(
      question: "Inwiefern bestehen Beziehungen zwischen den Mitarbeiter-, Kunden- und Lieferantendaten? Wie sind die Daten zugehörig?",
      answer: "siehe Datenmodellierung",
    ) // TODO: add reference

    #qa(
      question: "Sollen diese Daten importiert werden können? Aus welchen Programmen oder welche Dateiformate sollen importierbar sein?",
      answer: "Importieren soll über das definierte CSV-Format möglich sein und der Handwerks-Betrieb muss seine Daten dann entsprechend anpassen. Es gibt zu viele verschiedene bestehende Formate, um das alles abzudecken.",
    )

    #qa(
      question: "Müssen die Daten mit anderen Systemen synchronisiert werden?",
      answer: "Nein, wir gehen davon aus, dass unser System das einzige ist, das diese Daten bearbeitet. Eine Ausnahme hier sind die Daten aus dem FiBuSys. Diese können in der Anwendung allerdings nur gelesen und nicht editiert werden.",
    )

    #qa(
      question: "Sollen Lese- oder Schreib-Schnittstellen für andere Systeme bereitgestellt werden?",
      answer: "Nein, aus DSGVO-Gründen ist das nicht erwünscht.",
    )
  ],

  [
    /LF30/
  ],
  [
    Zentrales Element ist ein Kundenauftrag, zu denen Angebote, Lieferungen,
    Rechnungen und Zahlungserinnerungen gehören. Angebote, Lieferungen und
    Rechnungen beinhalten die Zusammenstellung einzelner Angebots-,
    Lieferungs- und Rechnungsposten.\

    #qa(
      question: "Welche Attribute hat ein Kundenauftrag, Angebot, Lieferung, Rechnung sowie deren zugehörigen Posten? ",
      answer: "siehe Datenmodellierung",
    ) // TODO: add reference

    #qa(
      question: "Soll es möglich sein, betriebsspezifische und optionale Informationen zu den Aufträgen hinzuzufügen?",
      answer: "Ja, es soll ein generisches „Notizen“-Feld geben",
    )

    #qa(
      question: "Gibt es unterschiedliche Typen von Kundenaufträgen? Wenn ja, benötigen diese unterschiedliche Attribute?",
      answer: "Ja, es gibt reine Materialaufträge und
        Dienstleisungsaufträge, die aber auch Material beinhalten können ",
      internal_remark: "Das können wir alles in einer Klasse abbilden",
    )

    #qa(
      question: "Sollen externe Dokumente angehangen werden können?",
      answer: "Selbstverständlich sollen PDFs angehängt werden können",
      subquestions: (
        (
          question: "Auch andere Dateiformate?",
          answer: "Nein, andere relevante Formate können in PDFs umgewandelt werden.",
        ),
      ),
    )

    #qa(
      question: "Gibt es Abhängigkeiten zwischen Angebote, Lieferungen und Rechnungen? (z. B. Ablaufreihenfolge)",
      answer: "Ja, siehe Definition",
    )

    #qa(
      question: "Wird ein Kundenauftrag stetig verfeinert oder abgeschlossen angelegt?",
      answer: "Schrittweise verfeinert, er muss also so lange bearbeitbar sein, bis er als vollständig oder abgeschlossen markiert ist.",
    )

    Daneben gehören zu einem Kundenauftrag ein Kunde und meist ein oder mehrere Lieferanten. \

    #qa(
      question: "Welche Attribute hat ein Kunde und ein Lieferant?",
      answer: "siehe Definition",
    ) // TODO: add reference

    #qa(
      question: "Sollen die Kunden- und Lieferantendaten aus einer anderen Lösung entnommen werden?",
      answer: "Ja, Importschnittstelle soll implementiert werden (wie oben mit CSV-Format, das der Entwickler sich überlegt und gut dokumentiert sein sollte)",
    )

    Jedem Kundenauftrag ist für jeden Bearbeitungsschritt
    (Erstellung, Änderung, Löschung usw.) ein Mitarbeiter zuzuordnen.
    Es muss dafür gesorgt werden,
    dass die einzelnen Schritte jederzeit nachvollziehbar sind.\

    #qa(
      question: "Passiert die Mitarbeiterzuordnung automatisiert oder manuell?",
      answer: "Die Zuordnung passiert automatisiert, kann aber manuell von Admins oder dem aktuell zugeordneten Benutzer geändert werden (z. B. wenn Aufträge wegen Krankheit oder Urlaub übergeben werden müssen).",
    )

    #qa(
      question: "Reicht es, die einzelnen Schritte zentral zu loggen oder muss jeder Mitarbeiter jederzeit mit schönem UI auf diese Schritte zugreifen können?",
      answer: "Ein zentraler Log, auf den nur Admins zugreifen können, reicht aus.",
    )

    #qa(
      question: "Muss das Log so aufgebaut sein, damit jede Aktion rückgängig gemacht werden kann? ",
      answer: "Nein, das ist nicht nötig.",
    )
  ],

  [
    /LF40/
  ],
  [
    Es muss eine Terminverwaltung integriert sein. Termine können beliebig
    lang dauern, auch mehrere Wochen (je nach Kundenauftrag). Einem
    Kundenauftrag sind entsprechend ein Start- und ein Endtermin zugeordnet.
    Darüber hinaus können beliebig viele Zwischentermine hinzugefügt werden.\
    Terminüberschneidungen müssen bei Eintragungen vermieden werden.\

    #qa(
      question: "Soll die Uhrzeit des Start- bzw. Endtermins variabel sein oder ein Standardwert gewählt werden?",
      answer: "Muss variabel sein (HH:MM), aber es soll standardmäßig 08:00 eingetragen werden.",
    )

    #qa(
      question: "Soll die Terminverwaltung in einer Kalenderanwendung realisiert werden?",
      answer: "Es soll ein Kalender-UI geben, aber man soll es auch in seinen eigenen Kalender (z. B. Outlook) einbinden können. ",
      internal_remark: "ical-Format speichern und via API anbieten",
    )

    #qa(
      question: "Hat jeder Auftrag seinen eigenen Kalender?",
      answer: "Nein, ein Auftrag hat beliebig viele Termine und alle Termine sind in einem Kalender gespeichert, in seiner Kalender-App oder in der API muss man dann auswählen können, welche Termine man anzeigen will (Filtern nach zugeordnetem Mitarbeiter oder Auftrag).",
    )

    #qa(
      question: "Dürfen sich Aufträge überschneiden oder Termine innerhalb eines Auftrags?",
      answer: "Aufträge dürfen sich überschneiden, Termine innerhalb eines Auftrages nicht.",
    )

    #qa(
      question: "Sind Termine Personengruppen zugeordnet?",
      answer: "Nein, es gibt einen zugeordneten Mitarbeiter. Darüber hinaus soll man aber noch weiter Personen als Beobachter zuordnen können.",
    )

    #qa(
      question: "Sind bei einem 2-wöchigen Termin für den ganzen Zeitraum keine anderen Meetings möglich?",
      answer: "Doch das soll möglich sein. Termine dürfen sich also doch überschneiden können, dann nehme ich meine Aussage von oben zurück.",
    )

    #qa(
      question: "Sollen wiederholende Aufträge/Termine möglich sein?",
      answer: "Ja, das muss möglich sein.",
    )
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
    Zeichenkettenlisten, die im System verarbeitet werden sollen).\

    #qa(
      question: "Welches Format haben die Zeichenkettenlisten?",
      answer: [Sie sind im CSV Format, und ist wie folgt definiert:
        #table(
          columns: 6, table.header(
          [*Produktname*],
          [*ProduktID*],
          [*Hersteller*],
          [*Lieferant*],
          [*PreisProStk*],
          [*Beschreibung*]),

          [Betonschraube Ultracut FBS II],
          [25243996],
          [FISCHER],
          [Bauhaus],
          [2.6],
          [Sechskantkopf,\ 10 x 120mm],

          [...], [...], [...], [...], [...], [...],
        )
      ],
      internal_remark: [Daraus folgt dieses CSV-Schema:
        ```CSV
          Produktname;ProduktID;Hersteller;Lieferant; PreisProStk;Beschreibung
          Betonschraube Ultracut FBS II;25243996;FISCHER;Bauhaus;2.6;Sechskantkopf, 10 x 120 mm,
        ```],
    )

    #qa(
      question: "Welcher Zeichensatz wird bei diesen verwendet? Sollen Umlaute und chinesische, französische, … Schriftzeichen erlaubt sein?",
      answer: "Umlaute und französische sind wichtig, chinesische irrelevant ",
      internal_remark: "Dann lässt sich UTF-8 nutzen",
    )

    #qa(
      question: "Sollen die branchenspezifischen Filter standardisiert gesetzt werden oder individuell konfigurierbar sein?",
      answer: "Jeder soll auf alle Listen zugreifen können.",
    )

    #qa(
      question: "Soll während eines Auftrages nachbestellt werden können?",
      answer: "Ja, aber nicht während einer Bestellung. Falls während einer Bestellung nachbestellt werden muss, soll eine neue Bestellung angelegt werden.",
    )

    #qa(
      question: "Sollen die Bestelllisten der online verfügbaren Lieferanten automatisch aktualisiert werden?",
      answer: "Nein, das machen wir.",
    )

    #qa(
      question: "Sollen die bereitgestellten Bestelllisten manuell konfigurierbar sein?",
      answer: "Ja, jeder Handwerkerbetrieb kann seine eigenen Bestelllisten pflegen und ändern können",
    )

    #qa(
      question: "Sollen Vorlagen für Bestellgruppen angelegt werden?",
      answer: "Ja, man soll Vorlagen anlegen können",
    )

    #qa(
      question: "Soll bei einer Bestellung auf einen möglichen Lagerrestbestand hingewiesen werden?",
      answer: "Ja, man soll den aktuellen Lagerbestand und den neuen Lagerbestand (nach der Bestellung) angezeigt bekommen",
    )

    #qa(
      question: "Können einem Material mehrere Lieferanten zugeordnet werden?",
      answer: "Ja, das ist möglich.",
    )

    #qa(
      question: "Was heißt interaktive Erstellung einer Bestellliste?",
      answer: "Man soll sich seine Bestellung aus der Bestellliste zusammenklicken können",
    )

    #qa(
      question: "Gibt es ein festes Format in dem Bestellaufträge gedruckt werden sollen?",
      answer: "Ja, jeder Betrieb soll ein Template mit Logo etc. anlegen können, in das die Daten dann eingefügt werden.",
    )
  ],

  [
    /LF60/
  ],
  [
    Neben den Kundenaufträgen gibt es noch eigene Aufträge an
    andere Firmen (z.B. bzgl. Wartung, Reparatur, Beschaffung (s. /LF50/)
    u.v.m.
    Auch hierfür gibt es Angebote und Rechnungen, die verwaltet werden müssen.\

    #qa(
      question: "Welcher Überbegriff passt auf diese Art von Auftrag?",
      answer: "„Eigenauftrag“",
    )

    #qa(
      question: "Was sind die Konkreten Anwendungsfälle?",
      answer: "Da diese stark von der Branche abhängig sind, müssen sie frei wählbar sein",
    )

    #qa(
      question: "Gibt es neben Kunden- und Eigenauftrag noch andere Arten von Aufträgen?",
      answer: "Nein, das sind die einzigen Aufträge.",
    )

    #qa(
      question: "Müssen die unterschiedlichen Auftragstypen verschieden behandelt werden?",
      answer: "Eigenaufträge sollen mit Kundenaufträgen verknüpft werden können (zum Beispiel bei Reparatur einer Maschine im Kontext eines Kundenauftrags)",
    )

    #qa(
      question: "Wie unterscheiden sich die Auftragstypen voneinander (z. B. welche speziellen Attribute)?",
      answer: "Wichtigster Unterschied ist die Verknüpfung und die Kategorisierung, ansonsten sind die Attribute gleich. Mehr Details siehe Modellierung",
    )
  ],

  [
    /LF70/
  ],
  [
    Die grafische Benutzungsoberfläche soll die Suche nach Kundenaufträgen,
    Kunden und Lieferanten bieten. Die Ergebnisse sollen in Listenform
    dargestellt werden. \

    #qa(
      question: "Soll es eine Universalsuche geben, in der nach allen Arten von Entitäten gesucht werden kann, oder soll für Kundenaufträge, Kunden und Lieferanten separate Suchen existieren?",
      answer: "Die Suche nach den verschiedenen Entitäten soll in separaten Tabs geschehen. Eine Universalsuche ist nicht gewünscht, da dies die Übersichtlichkeit einschränkt.",
    )

    #qa(
      question: "Soll der Attribut-Suchrahmen eingeschränkt sein? Falls ja, nach welchen Attributen darf gesucht werden?",
      answer: [Attribut-Suchrahmen muss einschränkbar sein.
        - Lieferanten und Kunden: Standartmäßig soll nach Namen gesucht werden. Zusätzlich soll auch nach Telefonnummer und E-Mail gesucht werden können.
        - Kundenaufträge: Standardmäßig anhand des Auftragstitels. Zusätzlich sollen diese anhand der zugehörigen Identifikationsnummer als auch anhand des Kunden-Namens suchbar sein.
      ],
    )

    #qa(
      question: "Soll es spezielle Suchoperatoren geben? (z. B. Wildcards)",
      answer: "Spezielle Suchoperatoren werden nicht benötigt.",
    )

    #qa(
      question: "Sind Filter erwünscht, um die Ergebnisse der Freitextsuche weiter einzuschränken? Wenn ja, nach welchen Attributen soll gefiltert werden können?",
      answer: "Filter sollen implementiert werden. Für die Suche sollen vor allem Filter zum Einschränken des Zeitraums (Datumfilter für Anfangs- und Enddatum) existieren. Des Weiteren soll nach Auftragstyp gefiltert werden können.",
    )

    #qa(
      question: "Soll es möglich sein einen ähnlichen Suchbegriff wie das zu suchendes Wort zu nutzen?",
      answer: "Ja, beim Suchen nach Namen/Text sollen auch ähnliche Ergebnisse angezeigt werden. Diese Funktionalität soll auch deaktivierbar sein.",
    )

    #qa(
      question: "Sollen die Suchergebnisse sortiert werden? Wenn ja, nach welchen Attributen soll sortiert werden können und was ist die Standardsortierung?",
      answer: "Die Suchergebnisse sollen nach Anfangs-, End- und Erstelldatum und (bei Kundenaufträgen) nach dem Auftragstyp sortiert werden können. Standardmäßig sollen die neusten Aufträge zuerst angezeigt werden.",
    )

    #qa(
      question: "Welche Attribute sollen in der Ergebnisliste angezeigt werden?",
      answer: [
        Folgende Attribute:
        - Kundenaufträge: Identifikationsnummer, Titel
        - Lieferanten und Kunden: Name, Telefonnummer, E-Mail, Adresse
      ],
    )

    #qa(
      question: "Soll eine Maximalanzahl an anzuzeigenden Objekten geben? Soll eine Seitenauswahl existieren?",
      answer: "Die Ergebnisse sollen in Seiten von 50 Objekten geteilt werden. Eine Navigation zwischen den Seiten wird dafür ebenfalls benötigt.",
    )

    Nach der Selektion eines Listeneintrags sollen
    sämtliche Informationen über das Element mit allen Referenzen direkt angezeigt werden.\

    #qa(
      question: "Soll diese Detailansicht sich im Vollbild öffnen, als Popup agieren oder innerhalb der Liste sich expandieren?",
      answer: [
        Wir möchten folgendes:
        - Die Detailansicht soll die zuvor existierende Benutzeroberfläche komplett ersetzen (im Vollbild öffnen), um so die große Masse an Daten übersichtlich darstellen zu können.
        - Gleichzeitig soll es einfach sein über eine Navigationsleiste schnell wieder in die vorherige Position in der Liste zurückzukehren
      ],
    )

    #qa(
      question: "Welche Elemente können mit der Detailansicht betrachtet werden?",
      answer: "Wir möchten, dass alle gespeicherten Elemente angezeigt werden, zur Not in einer scrollbaren Übersicht, wenn es zu viele für eine Seite sind.",
    )

    #qa(
      question: "Soll die Ansicht in verschiedene Sektionen geteilt werden? Wenn ja, welche Sektionen sollen existieren? Wie sind die Sektionen aufgebaut?",
      answer: [Hier stellen wir uns folgendes vor:
        - Für die Übersichtlichkeit sind verschiedene Sektionen innerhalb der Benutzeroberfläche zur Gruppierung vorhergesehen.
        - Welche Sektionen es genau sein sollen, sollen Ihre UI-Entwickler entscheiden. Das kann man bestimmt am besten beim Entwerfen der UI machen.
        - Sektionen so wie Suche Listenbasiert #sym.arrow Gleiche Möglichkeiten von Suche + Filter soll verfügbar sein
      ],
    )

    #qa(
      question: "Wie sollen die Referenzen funktionieren? Soll eine Navigation zu den Referenzen existieren?",
      answer: "Der Endnutzer soll auf Referenzen klicken können. Beim Klick gelangt der Nutzer zu der jeweiligen Detailansicht des Referenzobjektes (gleiches Verhalten: Vollbild + Navigationsleiste)",
    )

    #qa(
      question: "Sollen gewisse Referenzinformationen bereits ohne weitere Interaktion in der Detailansicht angezeigt werden? Wenn ja, welche?",
      answer: "Es sollen die gleichen Referenzinformationen angezeigt werden, wie in der Suche. (siehe oben) ",
    )

  ],

  [
    /LF80/
  ],
  [
    Alle Aufträge werden nach Übertragung an das Finanzbuchhaltungssystem dort
    weiterverarbeitet (Auftragsvergabe, Rechnungsstellung usw.). Eine
    Aktualisierung der Zustände der Aufträge (gestartet, laufend, ausgeführt,
    Rechnung gestellt, …) erfolgt durch Abrufen der Auftragsdaten vom
    Finanzbuchhaltungssystem.\

    #qa(
      question: "Welche verschiedenen Weiterverarbeitungsschritte muss ein Auftrag in Fibusys durchlaufen? Welche Zustände ergeben sich daraus?",
      answer: "Die Zustände lauten wie folgt: gestartet, laufend, ausgeführt, Rechnung gestellt, Rechnung beglichen, in Mahnung (-> Rechnung NICHT beglichen), archiviert (10 Jahre).",
    )

    #qa(
      question: "Welche Daten sollen an das Finanzbuchhaltungssystem übertragen werden? Welche Daten gibt das Finanzbuchhaltungssystem zurück?",
      answer: [Dafür haben wir uns überlegt:
        - An das Finanzbuchhaltungssystem sollten folgende Daten übertragen werden: Auftragsnummer Auftragsdatum Kundeninformationen (Name, Adresse, Kontaktdaten), Auftragspositionen (Beschreibung, Menge, Preis), Gesamtbetrag, Zahlungsbedingungen, Lieferdatum
        - Das Finanzbuchhaltungssystem gibt typischerweise folgende Daten zurück: Aktueller Status des Auftrags, Rechnungsnummer, Zahlungsstatus, eventuelle Fehlermeldungen oder Warnungen
      ],
    )

    #qa(
      question: "Soll die Übertragung der Daten manuell oder automatisiert funktionieren? Unter welchen Bedingungen werden die Daten übertragen?",
      answer: "Nach Erstellung in Software soll automatisch mit Fibu synchronisiert werden. Hierbei können Aufträge gebündelt werden, um Last zu vermeiden. Maximale Verzögerung: 5 Minute",
    )

    #qa(
      question: "Wann passiert eine Aktualisierung? Sollen die Daten nur angezeigt werden, oder sollen Benachrichtigungen bei Aktualisierung erstellt werden?",
      answer: [Da stellen wir uns vor:
        - Eine Aktualisierung passiert in regelmäßigen Abständen. Eine stündliche Aktualisierung sollte dabei ausreichend sein.
        - Benachrichtigungen werden bereits durch das Finanzbuchhaltungssystem erstellt, weswegen ein separates Benachrichtigungssystem nicht benötigt wird.
      ],
    )

    #qa(
      question: "Erfolgt die Synchronisierung über eine API oder über einen Dateiupload? Ruft das FibuSys uns auf oder müssen wir das System immer wieder anfragen?",
      answer: "(Antwort in Dokumentation von FibuSys)",
      internal_remark: [
        System muss regelmäßig „gepollt“ werden um Informationen zu erhalten, da das System keine Ahnung von unserer Präsenz hat.
        Auch hier bietet das FibuSys bietet dafür eine HTTP REST
        Schnittstelle an, die im JSON-Format kommuniziert. Der Endpoint ist
        `GET <base-url>/getOrders`. Beispielausgabe:
        ```JSON
        {
            "Orders": [
                {
                    "Order": {
                        "OrderID": "12345",
                        "Status": "gestartet",
                        "CustomerID": "23456",
                        "OrderDate": "2023-10-01",
                        "Items": [
                            {
                                "ItemID": "001",
                                "Description": "Produkt A",
                                "Quantity": 2,
                                "Price": 50.00
                            },
                            {
                                "ItemID": "002",
                                "Description": "Produkt B",
                                "Quantity": 1,
                                "Price": 100.00
                            }
                        ],
                        "TotalAmount": 200.00,
                        "InvoiceStatus": "Gestellt"
                    }
                }
            ]
        }
        ```
      ],
    )
  ],

  [
    /LF90/
  ],
  [
    Schließlich sollen noch die eigenen Werkzeuge und Anlagen verwaltet werden.\

    #qa(
      question: "Sollen kleine Werkzeuge (z.B. die in einem Werkzeugkasten) zusammengefasst werden können?",
      answer: "So kleines Werkzeug muss nicht beachtet werden, in diesem Fall wäre der „Werkzeugkasten“ das, was gespeichert wird (Informationen über Inhalt kann dann z.B. im Freitext gespeichert werden)",
    )
    #qa(
      question: "Welche Attribute besitzt ein Werkzeug und eine Anlage? Sollen optionale, benutzerdefinierte Felder erlaubt sein?",
      answer: [Diese Attribute:
        - Werkzeug: Name/Bezeichnung, Hersteller, Zustand, Modellnummer, Seriennummer, Wartungsanforderungen
        - Referenz zu Aufträgen, bei denen es gebraucht wird
        - Bilder (sollen immer aktuellen Zustand des Werkzeuges zeigen), siehe /LF100/
        - Anlage: Name/Bezeichnung, Hersteller, Modellnummer, Seriennummer, Betriebsstatus, Standort, Baujahr, Wartungsanforderungen
      ],
    )

    #qa(
      question: "Wie sieht die Verwaltung der Werkzeuge und Anlagen aus? Welche Operationen werden für die Verwaltung benötigt?",
      answer: "Erstellen, Entfernen, Bearbeiten",
    )

    #qa(
      question: "Welche Referenzen bestehen zwischen Werkzeugen und Anlagen sowie andere Elemente (z. B. Zuweisung zum Mitarbeiter)?",
      answer: [Folgende:
        - Zu beiden: Referenzen zu Bestellungen/Rechnungen (z.B. Wartungskosten)
        - Zuweisung zu Auftrag, der das Werkzeug oder die Anlage verwendet/benötigt
      ],
    )

    #qa(
      question: "Ist für die Verwaltung dieser Elemente auch eine Suche angedacht?",
      answer: [Ja:
        - Nach den Elementen soll auch gesucht werden können (nach Modellnummer und Name)
        - Ebenfalls sollen Filter zum Einsatz kommen, die nach dem Zustand/Betriebsstatus und Hersteller filtern
      ],
    )
  ],

  [
    /LF100/
  ],
  [
    Sämtlichen Elementen sollen mehrere Bilder mit Titel zugeordnet werden
    können, die zentral auf einem Verzeichnis liegen sollen.\

    #qa(
      question: "Repräsentiert der Titel den Dateinamen des Bilds oder sind explizite Bildunterschriften und Titel (oberhalb des Bildes) angedacht?",
      answer: "Optionale Bildunterschriften sind möglich, aber nicht erforderlich. Wenn keine Bildunterschrift angegeben wird, so wird der Dateiname verwendet als Bildunterschrift. Ist kein Titel vorhanden so wird schlicht keiner angezeigt",
    )

    #qa(
      question: "Handelt es sich bei dem Ablagerungsort um ein Verzeichnis auf einem Server oder ein lokales Verzeichnis auf den Rechnern des Anwenders?",
      answer: "Die Bilder werden zentral auf dem Server gespeichert. Beim Hinzufügen eines Bildes wird dieses auf den Server geladen.",
    )

  ],

  [
    /LF110/
  ],
  [
    Vor dem Hinzufügen von neuen Daten soll eine Überprüfung stattfinden, ob diese eventuell schon vorhanden sind.\

    #qa(
      question: "Was passiert, wenn die Überprüfung positiv ausfällt (also, wenn schon was da ist)?",
      answer: "Der Nutzer soll gefragt werden, ob die Daten aktualisiert werden sollen, neu hinzugefügt oder ob der Prozess abgebrochen werden soll.",
    )

    #qa(
      question: "Soll angezeigt werden, welche Attribute der bereits vorhandenen Elemente überschrieben werden?",
      answer: "Ja, sowohl der Name des Attributes, als auch der neue und alte Wert",
    )

    #qa(
      question: "Sollen dann für einzelne Felder ausgewählt werden können, welches übernommen wird?",
      answer: "Nein, das ist nicht nötig.",
    )

    #qa(
      question: "Gilt das für alle Daten?",
      answer: "Ja, das gilt für alle Daten.",
    )

    #qa(
      question: "Soll die Überprüfung während des Eingebens schon passieren?",
      answer: "Um Serverresourcen einzusparen, wird die Überprüfung erst nach der Eingabe durchgeführt.",
    )
  ],
)

=== Produktdaten
#table(
  columns: (auto, 1fr),
  [
    /LD10/
  ],
  [
    Die Daten sollen in einer zentralen Datenbasis abgespeichert werden.\

    #qa(
      question: "Zentrale Datenbasis pro Handwerksbetrieb oder eine große zentrale Datenbasis für alle?",
      answer: "Handwerksbetriebe haben alle einen lokalen Server (siehe oben)",
    )

    #qa(
      question: "Sollen die Clients auch offline funktionieren und die Daten dann bei Internet-Verbindung synchronisieren?",
      answer: "Nein, diese Funktion ist nicht vorgesehen (siehe oben)",
    )
  ],
)

*Aufgrund der Angaben unseres Kunden, haben wir folgende Datenmodellierung vorgenommen:*


=== Produktdaten
#table(
  columns: (auto, 1fr),
  [
    /LD10/
  ],
  [
    Die Daten sollen in einer zentralen Datenbasis abgespeichert werden.\
    #qa(
    question: "Zentrale Datenbasis pro Handwerksbetrieb oder eine große zentrale Datenbasis für alle?",
    answer: "Handwerksbetriebe haben alle einen lokalen Server (siehe oben)",
    )
    #qa(
    question:"Sollen die Clients auch offline funktionieren und die Daten dann bei Internet-Verbindung synchronisieren?",
    answer: "Nein, diese Funktion ist nicht vorgesehen (siehe oben)"
    )
  ],
)
#qa(
  internal_remark: "Aufgrund der Angaben unseres Kunden, haben wir folgende Datenmodellierung
       vorgenommen:"
)

*Mitarbeiter / Personaldaten*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  [Mitarbeiternummer], [Ganzzahl], [Eindeutige Kennung für den Mitarbeiter],
  [Anrede], [Zeichenkette], [Bevorzugte Anrede des Mitarbeiters],
  [Vorname], [Zeichenkette], [Vorname des Mitarbeiters],
  [Nachname], [Zeichenkette], [Nachname des Mitarbeiters],
  [Telefonnummer], [Zeichenkette], [Telefonnummer des Mitarbeiters],
  [PasswortHash], [Zeichenkette], [Gehashtes Passwort für den Login des Mitarbeiters],
  [Email], [Zeichenkette], [E-Mail-Adresse des Mitarbeiters],
  [Rolle], [Referenz auf Rolle], [Rolle des Mitarbeiters (z.B., Kaufmännisch, Admin)],
  //   [Zugriffsrechte], [Referenzen auf Zugriffsrechte], [Verweise auf Zugriffsrechtetabelle],
  [Bild], [Referenz auf Datei], [Verweis auf Bild vom Mitarbeiter],
)<ref:mitarbeiter>
#pagebreak(weak: true)
*GUI-Konfiguration*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  [Mitarbeiter], [Referenz auf Mitarbeiter], [Verweis auf Mitarbeiter, dem die GUI-Konfiguration gehört],
  [Schriftart], [Zeichenkette], [Gibt den Namen der Schriftart an, in welcher die Texte in der GUI erscheinen],
  [Schriftgröße], [Gleitkommazahl], [Gibt die Schriftgröße des angezeigten Textes an],
  [Akzentfarbe],
  [RGB(Ganzzahl, Ganzzahl, Ganzzahl)],
  [Beschreibt die Farbe für vorgehobene Inhalte (z.B. Farbe eines Primärbuttons)],

  [DunklerModus],
  [Boolean],
  [Wenn auf TRUE gesetzt wird alles im dunklen Modus angezeigt (z.B. der Hintergrund), sonst der helle Modus],

  [StandardDrucker],
  [Zeichenkette],
  [Verweis auf den vom Benutzer als „Standard“ ausgewählten Drucker (IP-Adresse des Druckers)],
)<ref:gui>
*Rolle*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  [Titel], [Zeichenkette], [Bezeichnung der Rolle],
  [Zugriffsrechte], [Referenzen auf Zugriffsrechte], [Verweise auf die Zugriffsrechte der Rolle],
)<ref:rolle>
*Zugriffsrechte*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  [Bezugsobjekt], [Zeichenkette], [Ziel des Zugriffsrechts (z.B. Termine, Aufträge, Personaldaten)],
  [Art], [Zeichenkette], [Art der Zugriffsrechte (Vollzugriff, Lesend etc.)],

)<ref:zugriffsrecht>
#pagebreak(weak: true)
*Lieferanten*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [LieferantenID], [Ganzzahl], [Eindeutige Kennung für den Lieferanten],
  [Name], [Zeichenkette], [Name des Lieferanten],
  [Steuernummer], [Zeichenkette], [Steuernummer des Lieferanten],
  [Straße], [Zeichenkette], [Straßenname],
  [Hausnummer], [Zeichenkette], [Hausnummer],
  [Postleitzahl], [Zeichenkette], [Postleitzahl],
  [Stadt], [Zeichenkette], [Stadt],
  [TelefonNummer], [Zeichenkette], [Telefonnummer],
  [Email], [Zeichenkette], [E-Mail-Adresse],
)<ref:lieferant>
*Kunden*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  [Kundennummer], [Ganzzahl], [Eindeutige Kennung für den Kunden],
  [FirmenName], [Zeichenkette], [Firmen Name (falls es ein Firmenkunde ist, ansonsten leere Zeichenkette)],
  [Steuernummer], [Zeichenkette], [Steuernummer (falls es ein Firmenkunde ist, ansonsten leere Zeichenkette)],
  [Vorname], [Zeichenkette], [Vorname des Kunden / der Ansprechperson bei der Firma],
  [Nachname], [Zeichenkette], [Nachname des Kunden / der Ansprechperson bei der Firma],
  [Strasse], [Zeichenkette], [Straßenname],
  [Hausnummer], [Zeichenkette], [Hausnummer],
  [Postleitzahl], [Zeichenkette], [Postleitzahl],
  [Stadt], [Zeichenkette], [Stadt],
  [TelefonNummer], [Zeichenkette], [Telefonnummer],
  [Email], [Zeichenkette], [E-Mail-Adresse],
)<ref:kunde>
#pagebreak(weak: true)
*Kundenaufträge*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [AuftragID], [Ganzzahl], [Eindeutige Kennung für den Kundenauftrag],
  [Kunde], [Referenz auf Kunde], [Verweis auf den Kunden],
  [StartTermin], [Datum], [Starttermin des Auftrags],
  [EndTermin], [Datum], [Endtermin des Auftrags],
  [Bearbeiter], [Referenz auf Mitarbeiter], [Verweis auf Mitarbeiter, der den Auftrag bearbeitet],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Titel],
  [Zeichenkette],
  [Titel des Auftrags (z.B. für spätere Druck-Anwendungen). Hieraus wird dann auch der Dateiname zum Abspeichern gebildet],
)<ref:kundenauftrag>

*Eigenauftrag*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [AuftragID], [Ganzzahl], [Eindeutige Kennung für den Eigenauftrag],
  [Lieferant], [Referenz auf Lieferant], [Verweis auf Lieferanten, der den Auftrag bearbeitet],
  [StartTermin], [Datum], [Starttermin des Auftrags],
  [EndTermin], [Datum], [Endtermin des Auftrags],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Titel],
  [Zeichenkette],
  [Titel des Auftrags (z.B. für spätere Druck-Anwendungen). Hieraus wird dann auch der Dateiname zum Abspeichern gebildet],

  [Verwendungszweck], [Zeichenkette], [Für was wurde dieser Auftrag erstellt (z.B. Reparatur)],
  [VerknüpfteAufträge],
  [Referenzen auf Aufträge],
  [Optional: Liste an verknüpften Kundenaufträgen (beispielsweise bei Beschaffung relevant)],
)<ref:eigenauftrag>
#pagebreak(weak: true)
*Angebote*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [AngebotID], [Ganzzahl], [Eindeutige Kennung für das Angebot],
  [Auftrag], [Referenz auf Auftrag], [Verweis auf den Auftrag],
  [AngebotsPosten], [Referenzen auf Posten], [Angebotsgegenstände],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Titel],
  [Zeichenkette],
  [Titel des Angebots (z.B. für spätere Druck-Anwendungen). Hieraus wird dann auch der Dateiname zum Abspeichern gebildet],
)<ref:angebot>
*Lieferungen*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [LieferungID], [Ganzzahl], [Eindeutige Kennung für die Lieferung],
  [Auftrag], [Referenz auf Auftrag], [Verweis auf zugehörigen Auftrag],
  [LieferungsPosten], [Referenzen auf Posten], [Lieferungsgegenstände],
  [LieferterminGeplant], [Datum], [Geplanter Liefertermin],
  [Liefertermin], [Datum], [Tatsächlicher Liefertermin],
)<ref:lieferung>
*Rechnungen*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [RechnungID], [Ganzzahl], [Eindeutige Kennung für die Rechnung],
  [Auftrag], [Referenz auf Auftrag], [Verweis auf zugehörigen Auftrag],
  [RechnungsPosten], [Referenzen auf Posten], [Rechnungsgegenstände],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Titel],
  [Zeichenkette],
  [Titel der Rechnung (z.B. für spätere Druck-Anwendungen). Hieraus wird dann auch der Dateiname zum Abspeichern gebildet],
)<ref:rechnung>
*Posten*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  [Titel], [Zeichenkette], [Name des Postens],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Anzahl], [Ganzzahl], [Anzahl des Produkts],
  [Produkt], [Referenz auf Produkt], [Verweis auf das Produkt],
  [GeplanterLiefertermin], [DateTime], [Angedachtes Lieferdatum des Produkts],
  [TatsächlicherLiefertermin], [DateTime], [Finales Lieferdatum des Produkts],
)<ref:posten>
#pagebreak(weak: true)
*Produkte*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  [Name], [Zeichenkette], [Name des Produkts],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Hersteller], [Zeichenkette], [Hersteller des Produkts],
  [Lieferant], [Referenz auf Lieferant], [Verweis auf den Lieferanten],
  [Stückpreis], [Gleitkommazahl], [Preis pro Stück],
  [Bestand], [Ganzzahl], [Verfügbare Menge des Produkts],
)<ref:produkt>
*Termin*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [TerminID], [Ganzzahl], [Eindeutige Kennung für den Termin],
  [Auftrag], [Referenz auf Auftrag], [Verweis auf zugehörigen Auftrag],
  [StartZeitpunkt], [DateTime], [Startzeitpunkt des Termins],
  [EndZeitpunkt], [DateTime], [Endzeitpunkt des Termins],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Titel], [Zeichenkette], [Titel des Termins],
)<ref:termin>

*Material*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [MaterialID], [Ganzzahl], [Eindeutige Kennung für das Material],
  [Name], [Zeichenkette], [Name des Materials],
  [Lieferant], [Referenz auf Lieferant], [Verweis auf Lieferanten],
  [Bestand], [Ganzzahl], [Verfügbare Menge des Materials],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Titel], [Zeichenkette], [Titel des Materials (z.B. für spätere Anzeige)],
)<ref:material>
#pagebreak(weak: true)
*Werkzeug (und Anlagen)*

#qa(
question: "Kann ein Werkzeug in mehreren Aufträgen verwendet werden?",
answer: "Ja, ein Werkzeug kann in mehreren Aufträgen verwendet werden.",
internal_remark: "\"GenutztIn\" muss eine Liste von AuftragIDs sein"
)
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [WerkzeugID], [Ganzzahl], [Eindeutige Kennung für das/die Werkzeug/Anlage],
  [Seriennummer], [Zeichenkette], [Beschreibt aus welche Serie / Charge die Maschine kommt],
  [Name], [Zeichenkette], [Name des Werkzeugs],
  [Hersteller], [Zeichenkette], [Hersteller des Werkzeugs],
  [Zustand], [Zeichenkette], [Aktueller Zustand (z.B., neu, gewartet, defekt)],
  [Wartungsanforderungen], [Zeichenkette], [Beschreibt wie und wann die Maschine gewartet werden muss],
  [FileID], [Ganzzahl], [Verweis auf Bild, das das/die Werkzeug/Anlage zeigt],
  [GenutztIn], [Referenzen auf Aufträge], [Verweis auf Aufräge, in dene das Werkzeug verwendet wird],
  [Beschreibung], [Zeichenkette], [Beschreibung oder zusätzliche Notiz],
  [Baujahr], [Ganzzahl], [Baujahr des/der Werkzeugs/Anlage],
)<ref:werkzeug>
*Datei*
#table(
  columns: 3,
  fill: (x, y) => if y == 0 { internColor },
  table.header(
    [#text(fill: white, weight: "bold")[Attribut]],
    [#text(fill: white, weight: "bold")[Datentyp]],
    [#text(fill: white, weight: "bold")[Beschreibung]],
  ),

  //   [FileID], [Ganzzahl], [Eindeutige Kennung für die Datei],
  [Titel], [Zeichenkette], [Titel der Datei],
  [Dateipfad], [Zeichenkette], [Dateipfad],
  [Bildunterschrift], [Zeichenkette], [Optionale Beschreibung],
  [AlternativText],
  [Zeichenkette],
  [Text der angezeigt werden kann, wenn die Datei nicht geladen wird (z.B. schlechte Internet-Verbindung). Besonders relevant bei Bildern],
)<ref:datei>
=== Produktleistungen
#table(
  columns: 2,
  [
    /LL10/
  ],
  [
    Die Anzahl der zu verwaltenden Elemente wird auf ca. 100.000 geschätzt.\

    #qa(
      question: "Was ist ein „zu verwaltendes Element“? Wie viele Daten hat ein solches Element (wie viele Eigenschaften, sodass man eine grobe Vorstellung von der Menge an Daten in GB bekommt)",
      answer: "Da müssen Sie mit unserer IT sprechen, da kann ich Ihnen keine Auskunft geben.",
      internal_remark: "Gespräch mit IT hat ergeben, dass ein „zu verwaltendes Element“ im Schnitt 2MB hat -> das würde ~200GB Daten pro Handwerksbetrieb ergeben.",
    )

    #qa(
      question: "Wie viel Puffer soll eingeplant werden? Was ist die maximale Anzahl, verwaltet werden können muss?",
      answer: "Puffer: Es soll theoretisch 20% mehr möglich sein (also 120.000)",
    )

  ],

  [
    /LL20/
  ],
  [
    Um bei möglichst allen Kunden unsere Software installieren und ausführen zu können muss zwingend auf Plattformunabhängigkeit geachtet werden.\

    #qa(
      question: "Auf welchen Systemen soll es laufen? Welche Windows-Versionen, welche Linux-Distributionen in jeweils welchen Versionen, welche MacOS Versionen? Welche Browser sollen unterstützt werden, welche Versionen?",
      answer: [Da Java plattformunabhängig ist, ist theoretisch jedes Betriebssystem kompatibel. Wir garantieren die Funktionalität für folgende:
        - Windows 11
        - Linux Ubuntu 24.04
        - Linux Debian 12
        - MacOS 15
        Chrome, Edge und Safari müssen unterstützt werden],
      internal_remark: "Auf Betriebssystem-spezifische Besonderheiten achten, z. B. Pfade (/ vs. \)",
    )

    #qa(
      question: "Gilt Plattformunabhängigkeit nur für die Clients oder auch für den Server?",
      answer: "Server muss nur auf Ubuntu 24.04 laufen",
    )
  ],
)

=== Qualitätsanforderungen
#table(
  columns: (auto, 1fr, 1fr, 1fr, 1.5fr),
  align: left,
  fill: (x, y) => if y == 0 { rgb("#e6e6e6") },
  table.header([Produktqualität], [sehr gut], [gut], [normal], [nicht relevant]),

  [
    Funktionalität
  ],
  [],
  [X],
  [],
  [],

  [
    Zuverlässigkeit
  ],
  [],
  [X],
  [],
  [],

  [
    Effizienz
  ],
  [],
  [X],
  [],
  [],

  [
    Benutzbarkeit (auch Gestaltung)
  ],
  [X],
  [],
  [],
  [],

  [
    Wartbarkeit
  ],
  [],
  [],
  [X],
  [],

  [
    Übertragbarkeit (Portabilität)
  ],
  [],
  [X],
  [],
  [],
)

#qa(
  question: "Wer soll das Produkt am Ende warten?",
  answer: "Wir haben IT-Experten, welche die Wartung des Produktes durchführen werden"
  )
#qa(
  question: "Bezüglich Zuverlässigkeit: Muss die zentrale Datenbasis darauf extra ausgerichtet sein – Stichwort High Availability? Also ist es ein Problem für Sie, wenn der Server mal nicht erreichbar ist, oder muss er 24/7 immer erreichbar sein?",
  answer: "Wenn der Server mal 15 Minuten nicht erreichbar ist, ist das schade, aber dafür möchten wir keine Unsummen aufbringen, um das zu verhindern. Konzentrieren Sie sich lieber auf die Benutzbarkeit!",
  internal_remark: "Ein normaler Server reicht vollkommen aus."
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
- Einfach gestaltete GUI-Skizzen (Mockups) von mindestens zwei wesentlichen GUI-Komponenten (Hauptseite, Tabs, etc.). Die Skizzen können mit einem einfachen Grafikprogramm erstellt werden. Auch sorgfältige Handzeichnungen sind erlaubt. Keine Login-GUI skizzieren!

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
    erforderlich (in der Realität natürlich schon!).",
)

#include "diagrams/UseCaseDiagram/usecasediagram.typ"
#include "diagrams/Analyseklassendiagramm/analyseklassendiagramm.typ"
#include "diagrams/UImockups/UImockups.typ"
