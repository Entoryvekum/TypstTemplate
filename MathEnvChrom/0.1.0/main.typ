#import("@local/MathUtil:0.1.0"):*

#let _defaultCounter=parseCounter(counter("MathEnvChromDefaultCounter"))
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
    stroke: rgb("#35aeae"),
    fill: rgb("#f9fdff"),
)
#let def = mathBlockEnv.with(
    title: [Definition],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#db9a4b"),
    fill: rgb("#fffcf9"),
)
#let lemma = mathBlockEnv.with(
    title: [Lemma],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#b991b2"),
    fill: rgb("#fefbff"),
)
#let corol = mathBlockEnv.with(
    title: [Corollary],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#39a243"),
    fill: rgb("#f9fffa"),
)
#let example = mathBlockEnv.with(
    title: [Example],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#7c90c3"),
    fill: rgb("#f8faff"),
)
#let cautionPat = pattern(size:(100pt,100pt))[
    #rect(
        width: 100pt,
        height: 100pt,
        fill: gradient.linear(
            rgb("#fff3f5"),rgb("#ffcbcb"),angle:  45deg,
        ).sharp(2).repeat(4)
    )
]
#let caution = mathBlockEnv.with(
    title: [Caution],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#ee8282"),
    fill: cautionPat,
)
#let prop = mathBlockEnv.with(
    title: [Property],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#bcb44b"),
    fill: rgb("#fffef1"),
)
#let idea = mathBlockEnv.with(
    title: [Idea],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#618f81"),
    fill: rgb("#f9fffd"),
)
#let problem = mathBlockEnv.with(
    title: [Problem],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
    radius: 0.8em,
    outset: 0.1em,
    inset: 0.7em,
    stroke: rgb("#da7fb1"),
    fill: rgb("#fff9fc"),
)
#let proof = mathBlockEnv.with(
    title: [Proof.#h(0.25em)],
    titlefmt: emph,
    suffix: [#h(1fr)$square$],
    bodyfmt: defaultBodyfmt,
)
#let MathEnvChromDemo()={
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