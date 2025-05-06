#import "locale.typ": *

#let titlepage(
  authors,
  date,
  title-font,
  language,
  logo-left,
  logo-right,
  many-authors,
  supervisor,
  title,
  type-of-thesis,
  university,
  university-location,
  at-university,
  date-format,
  show-confidentiality-statement,
  confidentiality-marker,
  university-short,
  page-grid,
  class,
  course,
  semester,
) = {

  // ---------- Page Setup ---------------------------------------

  set page(     
    // identical to document
    margin: (top: 4cm, bottom: 3cm, left: 4cm, right: 3cm),   
  )
  // The whole page in `title-font`, all elements centered
  set text(font: title-font, size: page-grid)
  set align(center)

  // ---------- Logo(s) ---------------------------------------

  if logo-left != none and logo-right == none {           // one logo: centered
    place(                                
      top + center,
      dy: -3 * page-grid,
      box(logo-left, height: 3 * page-grid) 
    )
  } else if logo-left != none and logo-right != none {    // two logos: left & right
    place(
      top + left,
      dy: -4 * page-grid,
      box(logo-left, height: 3 * page-grid) 
    )
    place(
      top + right,
      dy: -4 * page-grid,
      box(logo-right, height: 3 * page-grid) 
    )
  }

  // ---------- General -------------------------------------
  
  // class
  v(3 * page-grid)
  text(size: 1.5 * page-grid, class)
  v(page-grid)

  par(leading: 0.6 * page-grid, type-of-thesis + "\n" + course + "\n" + semester)
  v(page-grid)

  // ---------- Title ---------------------------------------

       
  text(weight: "bold", fill: luma(80), size: 1.5 * page-grid, title)
  v(4 * page-grid)
  

  // ---------- Sub-Title-Infos ---------------------------------------
  // 
  // type of thesis (optional)
  // if (type-of-thesis != none and type-of-thesis.len() > 0) {
  //   align(center, text(size: page-grid, type-of-thesis))
  //   v(0.25 * page-grid)
  // }

  // course of studies
  text(size: 14pt, TITLEPAGE_SECTION_B.at(language) + authors.map(author => author.course-of-studies).dedup().join(" | "),)
  v(0.25 * page-grid)

  // university
  text(size: 14pt, university + [ ] + university-location)
  v(2 * page-grid)


  // ---------- Info-Block ---------------------------------------
  set text(size: 14pt)
  text("Dr.-Ing. R. Lutz")
  v(0 * page-grid)
  text("Institut für Automation und angewandte Informatik (IAI)")
  v(0 * page-grid)
  text("Karlsruher Institut für Technologie (KIT)")
  v(3 * page-grid)

  text("Bearbeitet von")
  v(0* page-grid)
  text(size: 15pt, authors.map(author => author.name).join(" und "))
}