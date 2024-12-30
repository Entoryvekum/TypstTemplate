#import("@local/MathUtil:0.1.0"):*

#let _defaultCounter=parseCounter(counter("MathEnvSimpleDefaultCounter"))
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
)
#let def= mathBlockEnv.with(
    title: [Definition],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt.with(style:"..."),
)
#let lemma= mathBlockEnv.with(
    title: [Lemma],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let corol= mathBlockEnv.with(
    title: [Corollary],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let example= mathBlockEnv.with(
    title: [Example],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let caution= mathBlockEnv.with(
    title: [Caution],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let prop= mathBlockEnv.with(
    title: [Property],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let idea= mathBlockEnv.with(
    title: [Idea],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let problem= mathBlockEnv.with(
    title: [Problem],
    cnt: _defaultCounter,
    titlefmt: strong,
    bodyfmt: defaultBodyfmt,
)
#let proof = mathBlockEnv.with(
    title: [Proof.#h(0.25em)],
    titlefmt: emph,
    suffix: [#h(1fr)$square$],
    bodyfmt: defaultBodyfmt,
)
#let MathEnvSimpleDemo()={
    text(fill:gray,lorem(20))
    thrm[#lorem(3)][#lorem(20)][#linebreak()#lorem(20)]
    text(fill:gray,lorem(20))
    def[#lorem(20)]
    text(fill:gray,lorem(20))
    lemma[#lorem(20)]
    text(fill:gray,lorem(20))
    corol[#lorem(20)]
    text(fill:gray,lorem(20))
    example[#lorem(20)]
    text(fill:gray,lorem(20))
    caution[#lorem(20)]
    text(fill:gray,lorem(20))
    prop[#lorem(20)]
    text(fill:gray,lorem(20))
    idea[#lorem(20)]
    text(fill:gray,lorem(20))
    problem[#lorem(20)]
    text(fill:gray,lorem(20))
    proof[#lorem(20)]
    text(fill:gray,lorem(20))
}