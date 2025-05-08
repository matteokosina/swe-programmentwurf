= Use Case Diagramme
#image("Verwaltungssoftware.png")

Das Diagramm zeigt die Use-Cases, die unser Programm abdecken soll. Dabei haben wir uns dafür entschieden, die Rollen in dem Diagramm abzubilden, weshalb es mehrere Akteure des Unternehmens gibt (links). Außerdem ist das FiBuSys als Akteure dargestellt, da es beim Bezahlen angebunden ist. Beim Verwalten von Personaldaten wird diese Schnittstelle ebenfalls genutzt, das ist aber aus Übersichtlichkeits-Gründen nicht eingezeichnet.

Um es für den Benutzer möglichst einfach zu halten, haben wir uns dafür entschieden, einen Daten-getriebenen Ansatz zu wählen: Da die Verwaltung von Kundendaten, Termindaten, Materialdaten, Angeboten, Lieferungen, ... nahezu identisch sind, sind diese nicht als eigene Use-Cases eingearbeitet, sondern in einem "Verwalten"-Use-Case zusammengefasst.

== Verwaltungssoftware - Hauptsystem

Das erste Diagramm stellt die Kernfunktionalitäten der Verwaltungssoftware und deren Beziehung zu den verschiedenen Akteuren dar. Diese übergeordnete Darstellung bietet einen Gesamtüberblick über die Systemfunktionen, wie es für UML-Use Case Diagramme typisch ist.

=== Akteure und ihre Rollen

- *Gast*: Ein temporärer Benutzer, dem individuelle, zeitlich begrenzte Berechtigungen zugewiesen werden können. Diese beschränkten Zugriffsrechte ermöglichen es externen Personen, bestimmte Funktionen zu nutzen, ohne vollständigen Systemzugriff zu erhalten.

- *Kaufmännischer Mitarbeiter*: Verfügt über die Berechtigung, Berechtigungen anzupassen und Gastzugänge anzulegen. Diese Rolle stellt eine Verbindung zwischen der Verwaltung und den operativen Aspekten des Systems dar.

- *Vorgesetzter*: Eine Führungsposition, die hierarchisch über dem kaufmännischen Mitarbeiter steht und erweiterte Befugnisse hat.

- *Administrator*: Hat umfassende Berechtigungen im System, kann Verwaltungsfunktionen ausführen und ist für die grundlegende Systemkonfiguration verantwortlich.

- *Kunde*: Der Endnutzer der Dienstleistungen oder Produkte, der mit dem System über eine definierte Schnittstelle interagiert.

- *FiBuSys*: Ein externes Finanzbuchhaltungssystem, das an die Hauptsoftware angebunden ist und über die Schnittstelle mit den Bezahlvorgängen kommuniziert.

=== Zentrale Use Cases

- *Berechtigungen anpassen*: Ermöglicht dem kaufmännischen Mitarbeiter, Zugriffsrechte für verschiedene Benutzer zu definieren und zu modifizieren. Dies ist entscheidend für die Sicherheit und Zugriffssteuerung im System.

- *Gastzugang anlegen*: Dieser Use Case wird vom "Berechtigungen anpassen" Fall durch eine "Include"-Beziehung eingebunden, was bedeutet, dass er zwingend Teil des übergeordneten Prozesses ist. Hiermit können temporäre Zugänge für externe Akteure geschaffen werden.

- *GUI Konfigurieren*: Ermöglicht die Anpassung der Benutzeroberfläche entsprechend den Bedürfnissen der verschiedenen Benutzergruppen.

- *Verwalten*: Ein umfassender Use Case, der durch ein Sternchen (\*) als zentraler Anwendungsfall gekennzeichnet ist und im zweiten Diagramm weiter verfeinert wird. Der Administrator hat hier die Hauptverantwortung.

- *Bezahlen*: Diese Funktionalität ist mit dem externen FiBuSys verbunden und ermöglicht die Abwicklung von Zahlungsvorgängen über eine definierte Schnittstelle.

Die Daten, auf die sich die Use Cases beziehen, umfassen Kundendaten, Termindaten, Materialdaten, Auftragsdaten, Gerätedaten, Personaldaten, Angebote, Rechnungen, Bestellungen und Lieferungen. Diese bilden das Fundament der Geschäftsprozesse, die durch die Software unterstützt werden.

== Verfeinerung: Verwalten
#image("Verwalten _ Verfeinerung.png")

Das zweite Diagramm detailliert den "Verwalten" Use Case aus dem Hauptdiagramm und zeigt die spezifischen Verwaltungsfunktionen, die im System verfügbar sind.

=== Hauptfunktionalitäten

- *Anlegen*: Eine zentrale Funktion zum Erstellen neuer Datensätze im System, gekennzeichnet durch das Sternchen als wichtiger Anwendungsfall.

- *Importieren*: Ermöglicht das Einlesen von Daten aus externen Quellen in das System, was besonders für Massendatenverarbeitung wichtig ist.

- *Exportieren*: Das Gegenstück zum Importieren - hiermit können Daten aus dem System in verschiedene Formate exportiert werden, etwa für Berichte oder Datenübertragungen.

- *Drucken*: Markiert mit zwei Sternen, bezieht sich dieser Anwendungsfall besonders auf Rechnungen und Angebote, wie in der Notiz angegeben.

- *Anzeigen*: Diese Funktion erlaubt das Betrachten von Datensätzen und ist ein zentraler Punkt in der Benutzerinteraktion. Die Anmerkung im gelben Feld weist darauf hin, dass alle Anzeige-Funktionalitäten in einem separaten "Anzeigen" Use Case Diagramm dargestellt werden.

- *Ändern*: Diese Funktionalität, die im vierten Diagramm weiter verfeinert wird, ermöglicht die Modifikation bestehender Datensätze.

- *Suchen und Filtern*: Ermöglicht das gezielte Auffinden und Filtern von Datensätzen nach verschiedenen Kriterien, was besonders bei großen Datenmengen wichtig ist.

Diese Funktionen werden durch verschiedene Akteure ausgeführt. Der Administrator hat Zugriff auf Importieren und Exportieren, während der Vorgesetzte besonders mit Anzeigen und Ändern interagiert. Die Extension-Points und Include-Beziehungen zeigen, wie diese Funktionen miteinander verknüpft sind.

== Daten validieren - Terminverwaltung
#image("Daten validieren (Terminverwaltung) Vefeinerung.png")

Das dritte Diagramm fokussiert sich auf einen spezifischen Aspekt des Systems: die Validierung von Termindaten. Es zeigt die Interaktion zwischen dem System und den Validierungsregeln.

=== Validierungsregeln

- *Titel ist nicht leer*: Eine grundlegende Validierungsregel, die sicherstellt, dass jeder Termin einen aussagekräftigen Titel hat.

- *EndZeitpunkt ist valides DateTime*: Stellt sicher, dass das Enddatum eines Termins ein gültiges Datumsformat hat und zeitlich sinnvoll ist.

- *AuftragsID entspricht der ID eines existierenden Auftrags*: Überprüft die Referenzintegrität, indem sichergestellt wird, dass der Termin mit einem existierenden Auftrag verknüpft ist.

- *TerminID generieren*: Erzeugt eine eindeutige ID für jeden neuen Termin, was für die Datenbankintegrität und Referenzierung wichtig ist.

- *StartZeitpunkt ist valide DateTime*: Analog zur Endzeit-Prüfung wird hier sichergestellt, dass der Startzeitpunkt ein gültiges Format hat.

Diese Validierungsregeln sind entscheidend für die Datenqualität und Konsistenz im System. Sie stehen in direkter Verbindung zum "Daten validieren" Use Case im vierten Diagramm und sind auch relevant für die "Ändern" und "Anlegen" Funktionen aus dem zweiten Diagramm.

== Verfeinerung: Ändern
#image("Ändern _ Verfeinerung.png")

Das vierte Diagramm detailliert den "Ändern" Use Case aus dem zweiten Diagramm und zeigt den Prozess der Datenanpassung mit den erforderlichen Validierungsschritten.

=== Prozessschritte

- *Daten anpassen*: Der übergeordnete Use Case, der den gesamten Änderungsprozess umfasst und von einem Vorgesetzten initiiert wird.

- *Datenfelder verändern*: Ein durch "Include" eingebundener Teilprozess, der die eigentliche Modifikation der Datenfelder ermöglicht.

- *Daten validieren*: Stellt sicher, dass die geänderten Daten den Validierungsregeln entsprechen, wie sie im dritten Diagramm für Termindaten beschrieben wurden. Dieser Schritt ist zwingend durch die "Include"-Beziehung eingebunden.

- *Änderungen bestätigen*: Der letzte Schritt im Prozess, bei dem der Benutzer die Änderungen nach erfolgreicher Validierung bestätigt.

- *Änderungen verwerfen*: Eine Alternative, die es dem Benutzer ermöglicht, den Änderungsprozess abzubrechen und zum ursprünglichen Zustand zurückzukehren.

Die blaue Notiz im Diagramm erklärt den Prozessablauf: Zuerst müssen die Datenfelder angepasst werden, dann werden die Daten vom System validiert, und schließlich muss der Benutzer die Änderungen reviewen und bestätigen.

// == Zusammenhänge und Referenzen zwischen den Diagrammen

// Die vier Diagramme bilden ein kohärentes Gesamtbild der Verwaltungssoftware, wobei jedes nachfolgende Diagramm bestimmte Aspekte des vorherigen verfeinert:

// 1. Das erste Diagramm zeigt die übergeordnete Systemarchitektur mit allen Hauptakteuren und zentralen Funktionen.

// 2. Das zweite Diagramm verfeinert den "Verwalten" Use Case aus dem ersten Diagramm und zeigt die verschiedenen Verwaltungsfunktionen.

// 3. Das dritte Diagramm detailliert die Datenvalidierung speziell für die Terminverwaltung, was ein wichtiger Aspekt beim Anlegen und Ändern von Daten ist.

// 4. Das vierte Diagramm fokussiert sich auf den "Ändern" Use Case aus dem zweiten Diagramm und zeigt den detaillierten Prozess der Datenanpassung mit den notwendigen Validierungsschritten.

// Diese hierarchische Verfeinerung ist ein typisches Merkmal von UML-Diagrammen und ermöglicht es, komplexe Systeme auf verschiedenen Abstraktionsebenen zu beschreiben. Die "Include"- und "Extend"-Beziehungen zwischen den Use Cases verdeutlichen die funktionalen Abhängigkeiten und zeigen, welche Prozesse zwingend miteinander verbunden sind.

// Die Darstellung der Akteure und ihre Interaktionen mit den verschiedenen Systemfunktionen ermöglicht ein umfassendes Verständnis der Anforderungen und Abläufe innerhalb der Verwaltungssoftware. Diese Visualisierung dient als wertvolle Grundlage für die Kommunikation zwischen Entwicklern und Stakeholdern sowie für die weitere Systemimplementierung.
