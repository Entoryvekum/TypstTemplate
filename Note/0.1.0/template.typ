#import("@local/MathUtil:0.1.0"):*

#let Note(
    cover: false,
    title: none,
    subtitle: none,
    author: none,
    email: none,
    time: datetime.today().display("[year].[month]"),
    pagebreakBeforeOutline: false,
    lang: "en",
    body
) = {
    //Page
    let beforeBody=counter("counterForPagesBeforeBody")
    let marginX=50pt
    let marginY=50pt
    set page(
        paper: "a4",
        margin: (x: marginX, y: marginY),
    )
    set text(
        font: ("Times New Roman","Simsun"),
        size: 11pt,
        lang: lang
    )
    set par(
        first-line-indent: if lang=="zh" {
            2em
        }else {
            1.5em
        },
        justify: true,
        leading: 0.9em,
    )
    set heading(numbering: "1.")
    
    show heading:it => text(
        weight: "bold",
        context v(2%,weak:true)+counter(heading).display()+h(0.5em)+it.body+v(1.5%,weak:true),
    )
    show heading.where(level: 1): it => text(
        size: 16pt,
        weight: "bold",
        context v(2%,weak:true)+counter(heading).display(it.numbering)+h(0.5em)+it.body+v(2%,weak:true),
    )
    show heading.where(level: 2): it => text(
        size: 13pt,
        weight: "bold",
        context v(2%,weak:true)+counter(heading).display(it.numbering)+h(0.5em)+it.body+v(1.5%,weak:true),
    )
    show heading:it => [
        #set par(first-line-indent:0pt)
        #it
    ]
    show bibliography: set heading(numbering: it=>[])
    

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

    let getHeading(beginning)={
        context {
            let curPage=here().page()
            let bef=query(selector(heading.where(level:1)).before(here()))
            let aft=query(selector(heading.where(level:1)).after(here()))
            if bef.len()<=beginning and aft.len()>0 {
                if aft.first().location().page()==curPage {
                    [#counter(heading).at(aft.first().location()).first(). ];
                    aft.first().body;
                }
            } else if bef.len()>beginning and aft.len()>0 {
                if aft.first().location().page()==curPage {
                    [#counter(heading).at(aft.first().location()).first(). ];
                    aft.first().body;
        
                } else {
                    [#counter(heading).at(bef.last().location()).first(). ];
                    bef.last().body;
                }
            } else if bef.len()>beginning and aft.len()==0 {
                [#counter(heading).at(bef.last().location()).first(). ];
                bef.last().body;
            }
        }
    }
    if cover==true {
        //Front page
        {
            v(150pt)
            set par(first-line-indent: 0em)
            if title!=none {text(title,size:40pt,weight:"bold");v(30pt,weak:true)}
            if subtitle!=none {text(subtitle,size:25pt,weight:"bold");v(25pt,weak:true)}
            if author!=none {text(author,size:15pt);linebreak()}
            if email!=none {text(email,size:13pt);linebreak()}
            if author!=none or email!=none {
                v(20pt,weak:true);
                text(size:13pt,[#time])
            } else {
                text(size:13pt,[#time])
            }
            v(75pt)
        }

        //Content
        if pagebreakBeforeOutline==false {
            set par(first-line-indent: 0em)
            show heading: it => text(size:22.5pt, weight: "bold",it.body+v(20pt,weak:true))
            set text(font:("Times New Roman","Simsun"),size:12pt)
            outline(indent:true)
        } else{
            pagebreak()
            set par(first-line-indent: 0em)
            show heading: it => text(size:30pt, weight: "bold",it.body+v(75pt,weak:true))
            set text(font:("Times New Roman","Simsun"),size:12pt)
            v(50pt)
            outline(indent:true)
        }
        pagebreak(to:"even")
        counter(page).update(1)
    
        //Header
        let Header(l,m,r)={
            grid(
                columns: (auto,1fr,auto),
                align(left,l),
                align(center,m),
                align(right,r),
            )
        }
        set page(
            header:
                context if calc.even(here().page()) {
                    Header(
                        text(12pt)[#counter(page).display()],
                        text(12pt,getHeading(1)),
                        none);
                    move(dy:-5pt,line(length:100%,stroke: (thickness: 0.4pt)))
                }
                else {
                    Header(
                        none,
                        text(12pt,getHeading(1)),
                        text(12pt)[#counter(page).display()]);
                    move(dy:-5pt,line(length:100%,stroke: (thickness: 0.4pt)))
                }
        )
        body
    } else if cover==false {
        let Header(l,m,r)={
            grid(
                columns: (auto,1fr,auto),
                align(left,l),
                align(center,m),
                align(right,r),
            )
        }
        set page(
            header: {
                align(center,text(12pt,getHeading(0)));
                move(dy:-5pt,line(length:100%,stroke: (thickness: 0.2pt)))
            }
        )
        body
    }
}