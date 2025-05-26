= UI Entwürfe (Mockups)
*Startseite*

Die Startseite stellt den zentralen Einstiegspunkt für die Anwendung dar. Sie bietet eine Übersicht über die wichtigsten Funktionen und Informationen.
#figure(
  rect(image("startseite.svg")),
  caption: "Startseite der Anwendung",
)<fig:startseite>
Ein Suchfeld ermöglicht es den Nutzern, schnell nach Inhalten oder Aktionen zu suchen. 

Oberhalb der Nutzerbegrüßung befindet sich eine sogenannte Breadcrumb-Navigation, die den aktuellen Standort innerhalb der Anwendung visualisiert und eine einfache Navigation unterstützt. Diese Breadcrumbs erleichtern die Orientierung innerhalb der Anwendung und ermöglichen einen schnellen Zugriff auf zuvor besuchte Seiten.

Unterhalb davon befinden sich Kacheln für „Schnelle Aktionen“, die den direkten Zugriff auf häufig genutzte Verwaltungsfunktionen erlauben. Dazu zählt eine Kachel „Rechnung erstellen“, die zum entsprechenden Formular für das Anlegen neuer Rechnungen führt, sowie eine Kachel „Auftrag anlegen“, die dasselbe für Aufträge ermöglicht. Die Kachel „Werkzeuge anzeigen“ bietet eine Listenansicht mit Bild und Titel aller Werkzeuge und Anlagen sowie zugehörige Bearbeitungsoptionen (CRUDS-Operationen).

Die Kachel „Aufträge anzeigen“ führt zu einer Übersicht aller in der Anwendung erfassten Aufträge. Über die Kachel „Weitere Aktionen“ wird den Nutzenden eine Liste zusätzlicher verfügbarer Aktionen präsentiert.
Auf der rechten Seite der Startseite befindet sich eine Kalenderansicht, die sämtliche Termine des aktuellen Tages darstellt und so einen schnellen Überblick über die anstehenden Aufgaben ermöglicht.

*Rechnung erstellen*

Drückt ein Nutzer auf die "Rechnung erstellen"-Kachel, gelangt er zu einem Formular, in dem er eine neue Rechnung anlegen kann.
#figure(
  rect(image("rechnung_erstellen.svg")),
  caption: "Erstellen einer neuen Rechnung",
)<fig:rechnung-erstellen> 
Dieses Formular enthält Eingabefelder für Leistungsposten (z.B. Einbauarbeiten)
und Materialposten (z.B. Ersatzteile, Zutaten, etc.). Bei Leistungsposten kann ferner die Stundenzahl und der Stundensatz, bei den Materialposten lediglich die Stückzahl angegeben werden (der Rest wird automatisch berechnet).
Um die Rechnung einem Kunden zuzuordnen, gibt es ein Dropdown-Menü, in dem der Nutzer den entsprechenden Kunden auswählen kann.
Auf der rechten Seite befindet sich ein Vorschau-Bereich, der eine Vorschau der Rechnung anzeigt, während der Nutzer die Eingaben vornimmt. Dies vermeidet Fehler und ermöglicht eine schnelle Überprüfung der eingegebenen Daten.
Ist die Rechnung fertiggestellt, kann der Nutzer sie über einen Button am unteren Rand des Formulars als Entwurf speichern, verwerfen oder im System anlegen und dem Kunden senden.

*Aufträge anzeigen*

Analog zur Funktion „Werkzeuge anzeigen“ ermöglicht die Aktion „Aufträge anzeigen“ die Darstellung aller erfassten Aufträge in Listenform. 
#figure(
  rect(image("auftraege_anzeigen.svg")),
  caption: "Aufträge anzeigen",
)<fig:auftraege-anzeigen> 
Jeder Auftrag wird dabei mit einem Bild, einem Titel, einer Kurzbeschreibung sowie zentralen Eckdaten angezeigt. Zudem stehen für jeden Eintrag Funktionen zur Verfügung, um den Auftrag anzusehen, zu bearbeiten oder zu löschen.
Ein Suchfeld erleichtert die gezielte Suche nach bestimmten Aufträgen. Über den Button „Neu anlegen“ gelangt der Nutzer zum Formular zur Erstellung eines neuen Auftrags.

*Auftrag erstellen*

Im zuvor genannten Formular zur Erstellung eines neuen Auftrags kann der Nutzer den Titel sowie eine Beschreibung des Auftrags festlegen.
#figure(
  rect(image("auftrag_anlegen.svg")),
  caption: "Erstellen eines neuen Auftrags",
)<fig:auftraege-anzeigen>  
Zudem besteht die Möglichkeit, einen zugehörigen Kunden über eine Suchfunktion auszuwählen. Optional können ein Start- und ein Endtermin angegeben werden.
Für das Hochladen von Bildern steht ein Drag-and-Drop-Bereich zur Verfügung. Alternativ kann der Nutzer auf das Upload-Feld klicken, woraufhin sich ein Dateiauswahl-Dialog öffnet, über den die gewünschten Bilder manuell ausgewählt werden können.
Alle Pflichtfelder sind durch ein \*-Symbol gekennzeichnet, um die Nutzerführung zu erleichtern.

*Profil-Einstellungen*

Klickt ein Nutzer egal auf welcher Seite der Anwendung auf seinen Namen oder sein Profilbild, öffnen sich die Profil-Einstellungen. Diese ermöglichen es dem Nutzer zum einen das Aussehen seiner Benutzeroberfläche anzupassen (Heller Modus, Dunkler Modus, Schriftart und -größe, etc.) und zum anderen seine persönlichen Daten zu verwalten (z.B. E-Mail-Adresse, Passwort, etc.).
#figure(
  rect(image("profil_einstellungen.svg")),
  caption: "Erstellen eines neuen Auftrags",
)<fig:profil-einstellungen>  


