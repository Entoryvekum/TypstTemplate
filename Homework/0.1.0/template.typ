#import("@local/MathUtil:0.1.0"):*

#let defaultBodyfmt = (..arg)=> {
    let rst=arg.pos()
    if rst.len()>2 {
        [Too much parameters]
    }else if rst.len()==2{
        rst.first()=[(#rst.first())]
    }
    rst.join(" ")
}
#let thrm= mathBlockEnv.with(
    title: [Theorem],
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let def= mathBlockEnv.with(
    title: [Definition],
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let corol= mathBlockEnv.with(
    title: [Corollary],
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let prop= mathBlockEnv.with(
    title: [Property],
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)

#let problemCounter=parseCounter(counter("problemCounter"))
#let lemmaCounter=parseCounter(counter("lemmaCounter"))
#let problem= mathBlockEnv.with(
    title: [Problem],
    cnt: problemCounter,
    titlefmt: it=> strong(text(size:12pt,it)),
    prefix: [#(lemmaCounter.update)(0)#h(0.5em)],
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.3em,
    inset: 0.6em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)

#let lemma= mathBlockEnv.with(
    title: [Lemma],
    cnt: lemmaCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let idea= mathBlockEnv.with(
    title: [Idea.#h(0.25em)],
    titlefmt: emph,
    bodyfmt: defaultBodyfmt,
)
#let proof = mathBlockEnv.with(
    title: [Proof.#h(0.25em)],
    titlefmt: emph,
    suffix: [#h(1fr)$square$],
    bodyfmt: defaultBodyfmt,
)
#let Homework(title:none, author:none, time:none,lang:"en", body) = {
    //Page
    set text(
        font: ("Times New Roman","Simsun"),
        size: 11pt,
        lang: lang
    )
    set page(
        paper: "a4",
        margin: (x: 2cm, y: 1.5cm),
    )
    set par(
        first-line-indent: 
            if lang=="zh" {
                2em
            }else {
                1.5em
            },
        justify: true,
        leading: 0.8em,
    )
    set heading(numbering: "1.")
    show heading.where(level: 1): it => text(
            size: 16pt,
            weight: "bold",
            context counter(heading).display()+h(0.5em)+it.body,
        )
    show heading.where(level: 2): it => text(
            size: 13pt,
            weight: "bold",
            context counter(heading).display()+h(0.5em)+it.body,
        )
    show heading: it => [
        #set par(first-line-indent: 0em)
        #it
    ]

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
        let index = while i <= length {
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
    align(center,strong(text(size:20pt,title)))
    align(center,text(size:16pt,author))
    align(center,text(size:16pt,time))
    body
}