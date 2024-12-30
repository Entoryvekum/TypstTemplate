#let parseCounter(cnt) = {
    if cnt == none {
        return (step: (..arg)=>none,display: (..arg)=>none)
    }
    if type(cnt)!=counter and type(cnt)!=dictionary {
        panic("Not a proper counter or rich-counter.")
    }
    if type(cnt)==dictionary {
        if ("display" not in cnt or "step" not in cnt) {
            panic("Not a proper rich-counter.")
        }
    }
    else{
        cnt = (
            step: (..args) => { cnt.step(..args) },
            display: (..args) => { cnt.display(..args) },
            update: (..args) => { cnt.update(..args) },
        )
    }
    return cnt
}
#let mathBlockEnv(title: none, cnt: none, numbering: none, titlefmt: body => body, prefix:none, suffix:none, bodyfmt:(..arg) => arg.pos().join(), ..args)={
    cnt=parseCounter(cnt)
    let block_args=args.named()
    let body=args.pos()
    block(width: 100%,..block_args)[
        #(cnt.step)()
        #if numbering!=none {
            titlefmt([#title #context (cnt.display)(numbering)])
        } else {
            titlefmt([#title #context (cnt.display)()])
        }
        #prefix
        #bodyfmt(..body)
        #suffix
    ]
}
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
#let stW=$space.en "s.t." space.en $
#let andW=$space.en "and" space.en $
#let iffW=$space.en "iff" space.en $
#let ifW=$space.en "if" space.en $
#let orW=$space.en "or" space.en $