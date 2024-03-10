#let scr(body) = {
    set text(
        font: "STIX Two Math",
        stylistic-set: 1
    )
    $cal(body)$
}
#let mbb(body) = {
    $bb(#upper(body))$
}
#let ubold(body) = {
    $upright(bold(body))$
}
#let boxed(body) = {
    show math.equation: it => {
        box(it,inset: (top: 0.5em, bottom: 0.5em))
    }
    body
}

#let envForMathEmphasis(type: "Theorem", name: none, num: true, fg: black, bg: white, headingColor: black, body) = locate(
    location => {
        let level = counter(heading).at(location)
        let top = if level.len() > 0 { level.first() } else { 0 }
        let counterName="CounterForMathEmphasisEnvironment"+str(top)
        let counterForMath=counter(counterName)
        show: block.with(spacing: 11pt)
        stack(
            dir: ttb,
            rect(fill: fg, radius: (top: 2pt), stroke: fg)[
                #strong(
                    text(headingColor)[
                        #type
                        #if num {
                            counterForMath.step()
                            [ #top.#counterForMath.display() ]
                        }
                        #if name != none and name!="" [#h(0.25em) #name ]
                    ]
                )
            ],
            rect(
                width: 100%,
                fill: bg,
                stroke: (fg)
            )[
                #emph(body)
            ]
        )
    }
)

#let thrm = envForMathEmphasis.with(
    type: "Theorem",
    fg: rgb("#84d7d7"),
    bg: rgb("#f9fdff"),
)
#let def = envForMathEmphasis.with(
    type: "Definition",
    fg: rgb("#f8c486"),
    bg: rgb("#fffcf9"),
)
#let lemma = envForMathEmphasis.with(
    type: "Lemma",
    fg: rgb("#f8ccf0"),
    bg: rgb("#fefbff"),
)
#let corol = envForMathEmphasis.with(
    type: "Corollary",
    fg: rgb("#99dfa8"),
    bg: rgb("#f9fffa"),
)
#let example = envForMathEmphasis.with(
    type: "Example",
    fg: rgb("#9db5f3"),
    bg: rgb("#f8faff"),
)
#let caution = envForMathEmphasis.with(
    type: "Caution",
    fg: rgb("#ff9191"),
    bg: rgb("#fff9fa"),
)
#let prop = envForMathEmphasis.with(
    type: "Property",
    fg: rgb("#f3e743"),
    bg: rgb("#fffef1"),
)
#let idea = envForMathEmphasis.with(
    type: "Idea",
    fg: rgb("#b6b7d0"),
    bg: rgb("#eeeeff"),
)
#let proof(body) = block(spacing: 11.5pt, {
    set par(first-line-indent: 0pt)
    emph[Proof.]
    [\ ] + body
    h(1fr)
    $∎$
})