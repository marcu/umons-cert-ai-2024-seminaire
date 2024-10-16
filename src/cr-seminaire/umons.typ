#let script-size = 7.97224pt
#let footnote-size = 8.50012pt
#let small-size = 9.24994pt
#let normal-size = 1em
#let large-size = 2em
#let title-size = 3em
#let subtitle-size = 2em

// This function gets your whole document as its `body` and formats
// it as an article in the style of the American Mathematical Society.
#let umons-article(
  // The article's title.
  title: "Paper title",
  subtitle: none,

  department: "",

  // An array of authors. For each author you can specify a name,
  // department, organization, location, and email. Everything but
  // but the name is optional.
  authors: (),

  academic-year: "",

  professor: "",

  // Your article's abstract. Can be omitted if you don't have one.
  abstract: none,

  // The article's paper size. Also affects the margins.
  paper-size: "a4",

  // The path to a bibliography file if you want to cite some external
  // works.
  bibliography-file: none,

  // The document's content.
  body,

  font: "Garamond Libre"
) = {
  // Set document metadata.
  set document(title: title, author: authors)

  // Set the body font. AMS uses the LaTeX font.
  set text(size: normal-size, font: font)

  // Configure the page.
  set page(
    paper: paper-size,

    // The page header should show the page number and list of
    // authors, except on the first page. The page number is on
    // the left for even pages and on the right for odd pages.
    header-ascent: 14pt,
    header: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 { return }
      set text(size: script-size)
      grid(
        columns: (6em, 1fr, 6em),
        if calc.even(i) { align(left)[#i] },
        align(center, upper(
          if calc.odd(i) { title } else { authors }
        )),
        if calc.odd(i) { align(right)[#i] }
      )
    }),

    // On the first page, the footer should contain the page number.
    footer-descent: 12pt,
    footer: locate(loc => {
      let i = counter(page).at(loc).first()
      if i == 1 {
        align(
            center,
            text[
                Faculty of Sciences #sym.diamond.filled.small University of Mons #sym.diamond.filled.small
                Place du Parc 20 #sym.diamond.filled.small
                B-7000 Mons]
        )
      }
    }),
  )

  // Configure headings.
  show heading.where(level: 1): it => [
    #set text(
      font: ("Latin Modern Sans"),
      size: large-size,
    )
    #pagebreak(weak: true)
    #v(15pt, weak: true)
    #it.body
    #v(.25em, weak: true)
  ]

  show heading.where(level: 2): it => [
    #set text(
      font: ("Latin Modern Sans"),
      size: normal-size,
    )
    #it.body
    #v(1em, weak: true)
  ]

  // Configure lists and links.
  set list(indent: 24pt, body-indent: 5pt)
  set enum(indent: 24pt, body-indent: 5pt)

  show link: it => underline(text(font: "New Computer Modern Mono", it))

  // Configure equations.
  show math.equation: set block(below: 8pt, above: 9pt)
  show math.equation: set text(weight: 400)

  // Configure citation and bibliography styles.
  set cite(style: "alphanumeric")
  set bibliography(style: "apa", title: "References")

  show figure: it => {
    show: pad.with(x: 23pt)
    set align(center)

    v(12.5pt, weak: true)

    // Display the figure's body.
    it.body

    // Display the figure's caption.
    if it.has("caption") {
      // Gap defaults to 17pt.
      v(
        if it.has("gap") {
          it.gap
        } else {
          17pt
        },
        weak: true,
      )
      smallcaps[Figure]
      if it.numbering != none {
        [ #counter(figure).display(it.numbering)]
      }
      [. ]
      it.caption
    }

    v(15pt, weak: true)
  }

  // Display the abstract
  if abstract != none {
    v(20pt, weak: true)
    set text(script-size)
    show: pad.with(x: 35pt)
    smallcaps[Abstract. ]
    abstract
  }

  let title-page() = {
    set page(
      header: align(
        top,
        [
          #v(1em)
          #set align(top)
          #grid(
            columns: (1fr, 1fr, 1fr),
            rows: 15mm,
            {
              align(left)[
                #image("UMONS_FS.svg"),
              ]
            },
            {
              align(center)[
                #image("fpms.svg"),
              ]
            },
            {
              align(right)[
                #image("UMONS-logo.svg")
              ]
            },
          )],
      ),
      footer: align(
        center,
        text[
          Faculty of Sciences #sym.diamond.filled.small University of Mons #sym.diamond.filled.small
          Place du Parc 20 #sym.diamond.filled.small
          B-7000 Mons
        ],
      ),
      margin: (
        top: 1cm,
        left: 1cm,
        right: 1cm,
        bottom: 1cm,
      ),
    )

    set text(font: ("Latin Modern Sans",))

    v(25em)

    set align(center)

    if title != "" {
      upper({
        text(size: title-size)[*#title*]
      })
    }

    if subtitle != none {
      parbreak()
      text(size: subtitle-size)[#subtitle]
    }

    set text(size: normal-size)
    let cellTitle(content) = block(
      width: 100%,
      inset: 5pt,
    )[
      #align(right)[*#content*:]
    ]
    let cellBody(content) = block(
      width: 100%,
      inset: 5pt,
    )[
      #set align(left)
      #content
    ]
    grid(
      columns: 2,
      rows: 2,
      cellTitle("Auteur"), cellBody(authors),
      cellTitle("Département"), cellBody(department),
      cellTitle("Année académique"), cellBody(academic-year),
    )
  }

  let toc-page() = {
    set text(font: ("Latin Modern Sans",))

    v(15em)

    set align(center)

    outline(
      title: [Table des matières],
      depth: 1,
    )
  }

  title-page()

  toc-page()

  pagebreak()

  set page(margin: (
    top: 75pt,
    left: 50pt,
    right: 50pt,
    bottom: 25pt,
  ))

  body

  // Display the bibliography, if any is given.
  if bibliography-file != none {
    show bibliography: set text(8.5pt)
    show bibliography: pad.with(x: 0.5pt)
    bibliography(bibliography-file)
  }
}

// The ASM template also provides a theorem function.
#let theorem(body, numbered: true) = figure(
  body,
  kind: "theorem",
  supplement: [Theorem],
  numbering: if numbered {
    "1"
  },
)

// And a function for a proof.
#let proof(body) = block(
  spacing: 11.5pt,
  {
    emph[Proof.]
    [ ] + body
    h(1fr)
    box(scale(160%, origin: bottom + right, sym.square.stroked))
  },
)
