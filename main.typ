#import "template/template.typ": *

#show: clean-dhbw.with(
  title: "Thema: Verwaltungssoftware für Handwerksbetriebe",
  authors: (
    (
      name: "Tim Siefken",
      student-id: "123223",
      course: "TINF23B1",
      course-of-studies: "Informatik", //company: (
      //   (name: "ABC S.L.", post-code: "08005", city: "Barcelona", country: "Spain")
    ),
    (
      name: "Jasmin Förstel",
      student-id: "9606883",
      course: "TINF23B1",
      course-of-studies: "Informatik", //company: (
      //   (name: "ABC S.L.", post-code: "08005", city: "Barcelona", country: "Spain")
    ),
  ),
  type-of-thesis: "Programmentwurf",
  // acronyms: acronyms, // displays the acronyms defined in the acronyms dictionary
  at-university: true, // if true the company name on the title page and the confidentiality statement are hidden
  // bibliography: bibliography("sources.bib"),
  date: datetime.today(),
  // glossary: glossary, // displays the glossary terms defined in the glossary dictionary
  language: "de", // en, de
  supervisor: (university: "Dr.-Ing. R. Lutz"),
  university: "Duale Hochschule Baden-Württemberg",
  university-location: "Karlsruhe",
  city: "Karslruhe",
  university-short: "DHBW",
  class: "Software Engineering I",
  course: "TINF23B1",
  semester: "3./4. Semester (2024/2025)",
  // for more options check the package documentation (https://typst.app/universe/package/clean-dhbw)
)

// Edit this content to your liking

#include "01-aufgabenstellung.typ"
#include "02-lastenheft-analyse.typ"
#include "03-analyse.typ"
#include "04-entwurf.typ"
#include "05-besonderheiten.typ"
