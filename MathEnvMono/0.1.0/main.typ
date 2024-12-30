#import("@local/MathUtil:0.1.0"):*

#let _defaultCounter=parseCounter(counter("MathEnvMonoDefaultCounter"))
#(_defaultCounter=parseCounter(_defaultCounter))
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
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let def= mathBlockEnv.with(
    title: [Definition],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let lemma= mathBlockEnv.with(
    title: [Lemma],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let corol= mathBlockEnv.with(
    title: [Corollary],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let example= mathBlockEnv.with(
    title: [Example],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let cautionPat=pattern(size:(100pt,100pt))[
    #rect(
        width: 100pt,
        height: 100pt,
        fill: gradient.linear(
            rgb("#f5f5f5"),rgb("#b2b2b2"),angle:  45deg,
        ).sharp(2).repeat(4)
    )
]
#let caution= mathBlockEnv.with(
    title: [Caution],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: cautionPat,
)
#let prop= mathBlockEnv.with(
    title: [Property],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let idea= mathBlockEnv.with(
    title: [Idea],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let problem= mathBlockEnv.with(
    title: [Problem],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#666666"),
    fill: rgb("#f4f4f4"),
)
#let proof = mathBlockEnv.with(
    title: [Proof.#h(0.25em)],
    titlefmt: emph,
    suffix: [#h(1fr)$square$],
    bodyfmt: defaultBodyfmt,
)
#let MathEnvMonoDemo()={
    thrm[#lorem(3)][#lorem(20)][#linebreak()#linebreak()#lorem(20)]
    def[#lorem(20)]
    lemma[#lorem(20)]
    corol[#lorem(20)]
    example[#lorem(20)]
    caution[#lorem(20)]
    prop[#lorem(20)]
    idea[#lorem(20)]
    problem[#lorem(20)]
    proof[#lorem(20)]
}