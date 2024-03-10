#import("@local/MathBasic:0.1.0"):*

#let Note(body) = {
    //Page
    let Header(l,m,r)={
        grid(
            columns: (1fr,auto,1fr),
            align(left,text(9pt,par(leading: 0.2em,l))),
            align(center,text(9pt,par(leading: 0.2em,m))),
            align(right,text(9pt,par(leading: 0.2em,r))),
        )
    }
    set text(
        font: ("Times New Roman","Simsun"),
        size: 11pt
    )
    set page(
        paper: "a4",
        margin: (x: 2cm, y: 1.5cm),
    )
    set par(
        first-line-indent: 2em,
        justify: true,
        leading: 0.9em,
    )
    set heading(numbering: "1.")
    show heading.where(level: 1): it => [
        #set par(first-line-indent: 0em)
        #set text(15pt, weight: "bold")
        #counter(heading).display()
        #h(0.5em)
        #it.body
    ]
    show heading.where(level: 2): it => text(
        size: 13pt,
        weight: "bold",
        counter(heading).display()+h(0.5em)+it.body,
    )

    //Raw
    show raw.where(block: false): box.with(
        fill: luma(240),
        inset: (x: 3pt, y: 0pt),
        outset: (y: 3pt),
        radius: 2pt,
    )
    show raw.where(block: true): block.with(
        width: 100%,
        fill: luma(240),
        inset: 8pt,
        radius: 4pt,
    )
    show raw.where(block: true): it => {
        let lines = it.text.split("\n")
        let length = lines.len()
        let i = 1
        let index = while i < length {
            str(i) + "\n"
            i+=1
        }
        grid(
            columns: (auto, 1fr),
            align(
                right,
                block(
                    inset: (
                        top: 8pt,
                        bottom: 8pt,
                        left: 0pt,
                        right: 5pt
                    ),
                    index
                )
            ),
            align(left, it),
        )
    }

    body
}