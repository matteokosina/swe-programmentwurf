= Analyse-Klassendiagramm
#image("Klassendiagramm.svg")
Es wurden verschiedene Entwurfsmuster eingesetzt:

Ein zentrales Beispiel ist die Trennung zwischen Werkzeugbeschreibung und Werkzeugexemplar, die dem Analysemuster „Exemplartyp“ folgt. Hierbei werden allgemeine, für alle Exemplare eines Werkzeugs identische Informationen wie Name, Hersteller und Wartungsanforderungen in der Beschreibungsklasse erfasst. Individuelle Merkmale wie Seriennummer, Zustand oder Baujahr werden hingegen dem konkreten Exemplar zugewiesen.

Ein weiteres eingesetztes Muster ist das der „Liste“, das sich in der Modellierung von Angebot und Angebotsposition sowie Rechnung und Rechnungsposten wiederfindet. Diese Beziehungen stellen klassische Listenstrukturen dar, bei denen ein übergeordnetes Objekt (das Angebot) mehrere gleichartige Unterobjekte (Positionen) umfasst.

Die Klasse Lieferinformationen basiert auf dem Muster des „Koordinators“. In diesem Fall besteht eine n:m-Beziehung zwischen Produkten und Lieferanten, bei der zusätzliche Informationen wie Liefertermine oder Lieferbedingungen gespeichert werden müssen. Diese Informationen gehören jedoch zu keiner der beteiligten Klassen direkt. Durch die Einführung einer eigenen Koordinationsklasse können diese Daten modelliert werden, ohne die beteiligten Klassen unnötig zu verkomplizieren.

Des Weiteren haben wir das Muster „Rollen“ eingesetzt. So kann eine Person verschiedene Rollen wie Mitarbeiter oder Geschäftspartner einnehmen. Diese Rollen werden durch spezialisierte Unterklassen abgebildet, während gemeinsame Eigenschaften wie Name oder Kontaktdaten in der Oberklasse bleiben. Diese Struktur erlaubt es, eine Person flexibel und gleichzeitig konsistent im System zu repräsentieren.

Darüber hinaus wurde bei der Modellierung von Lieferdaten das Prinzip der „Historie“ berücksichtigt. Einem Kundenauftrag können mehrere Angebote zugeordnet werden. Es muss jedoch später berücksichtigt werden, dass nur das letzte Angebot zum jeweiligen Auftrag bindend ist und alle älteren jeweils nur der Protokollierung aller Angebote dienen.

Folgende Designentscheidungen haben wir in Absprache mit dem Kunden getroffen:
- Ein Eigenauftrag muss immer im Kontext eines Kundenauftrags erfolgen.
- Jeder Kundenauftrag muss (mindestens) ein Angebot haben.
- #text(weight: "bold", fill: red)[TODO: weiter ausführen]
