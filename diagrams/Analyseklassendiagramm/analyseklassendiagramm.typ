= Analyse-Klassendiagramm
#figure(
  image("Klassendiagramm.svg"),
  caption: "Analyse-Klassendiagramm",
)<fig:analyse-klassendiagramm>
Es wurden verschiedene Analysemuster eingesetzt:


In der Modellierung wurde berücksichtigt, dass Kunde und Lieferant beide von Geschäftspartner erben, jedoch besitzt ein Kunde sowohl Rechungs- als auch Lieferadresse, Lieferanten jedoch nur eine Rechnungsadresse, da an diese nichts geliefert wird. Daher wurde die Entscheidung getroffen, die Adress-Felder aufzuteilen. Daher besitzt nun ein Geschäftspartner eine Rechnungsadresse und nur der Kunde eine Lieferadresse.

Des Weiteren haben wir das Muster „Rollen“ eingesetzt. So kann eine Person verschiedene Rollen wie Mitarbeiter oder Geschäftspartner einnehmen. Diese Rollen werden durch spezialisierte Unterklassen abgebildet, während gemeinsame Eigenschaften wie Name oder Kontaktdaten in der Oberklasse bleiben. Diese Struktur erlaubt es, eine Person flexibel und gleichzeitig konsistent im System zu repräsentieren.

Um die semantische Zusmengehörigkeit hervorzuheben, wurden die Klassen mit der gleichen Farbe (orange) hinterlegt.

Ein Auftrag kann entweder der Auftrag eines Kunden oder ein Eigenauftag sein. Eigenaufträge referenzieren immer einen Kundenauftrag. Da sie sich abgesehn davon jedoch nicht in den Attributen unterscheiden, wurde entschieden, dass sie von einer gemeinsamen Oberklasse „Auftrag“ erben.

Die unterschiedlichen Aufträge wurden in Dunkelgrün markiert, um ihre semantische Zugehörigkeit erkennbar zu machen.

Darüber hinaus wurde bei der Modellierung von Lieferdaten das Prinzip der „Historie“ in Betracht gezogen. Einem Kundenauftrag können mehrere Angebote zugeordnet werden. Es muss jedoch später berücksichtigt werden, dass nur das letzte Angebot zum jeweiligen Auftrag bindend ist und alle älteren jeweils nur der Protokollierung aller Angebote dienen.

Ursprünglich war geplant, zwischen Produkt und Lieferant eine Koordinationsklasse Lieferinformationen zu modellieren, um Lieferdetails wie Termine und Bedingungen abzubilden. In der finalen Analyse wurde jedoch darauf verzichtet und stattdessen eine direkte 1:n-Beziehung zwischen Produkt und Lieferant eingeführt. Die Klasse Liefertermin wurde separat modelliert, enthält aber keine Vermittlungsfunktion. Damit wurde zugunsten einer einfacheren Struktur auf das Analysemuster des „Koordinators“ verzichtet.

Ein weiteres eingesetztes Muster ist das der „Liste“, das sich in der Modellierung von Angebot und Angebotsposition sowie Rechnung und Rechnungsposten wiederfindet. Diese Beziehungen stellen klassische Listenstrukturen dar, bei denen ein übergeordnetes Objekt (das Angebot) mehrere gleichartige Unterobjekte (Positionen) umfasst.

Diese erscheinen in olivegrün, was ihre inhaltliche Zusammengehörigkeit unterstreicht.

Ein zentrales Beispiel ist die Trennung zwischen Werkzeugbeschreibung und Werkzeugexemplar, die dem Analysemuster „Exemplartyp“ folgt. Hierbei werden allgemeine, für alle Exemplare eines Werkzeugs identische Informationen wie Name, Hersteller und Wartungsanforderungen in der Beschreibungsklasse erfasst. Individuelle Merkmale wie Seriennummer, Zustand oder Baujahr werden hingegen dem konkreten Exemplar zugewiesen.

Zur Hervorhebung ihrer semantischen Verbindung sind diese in pink dargestellt.

Folgende Designentscheidungen haben wir in Absprache mit dem Kunden getroffen:
- Ein Eigenauftrag muss immer im Kontext eines Kundenauftrags erfolgen.
- Jeder Kundenauftrag muss (mindestens) ein Angebot haben.
- Es gibt eine Datei-Klasse, sodass unterschiedliche Bildformate verwendet werden können. Die Bilder werden dann jeweils in einer externen App außerhalb unserer Applikation geöffnet.
- Da wir in Absprache mit dem Kunden erkannt haben, dass die beiden Klassen "Material" und "Produkt" (s. Tabellen in der Analyse) äquivalent sind, haben wir diese beiden zu "Produkt" vereinigt.
