NB. This solution is very slow!
nums =. _2 ]\ [: __&". ' ' [`([: I.@:-.@e.&'0123456789-' ])`]} ]

in =: (nums ;~ 'on' -: ' '&taketo);._2 ] 1!:1 < 'AoC/22/input.txt'

fix =: [: ({."1 ,. >:@-~/"1) 50 + ]
p1 =: ]`(fix&.>)"0 (#~ ([: */^:2 <&51 * >&_51)@:>@{:"1) in

ap =: dyad define
    (0 {:: x) (< ([: < {. + i.@{:)"1 > {: x)} y
)

echo part1 =: (101 101 101 $ 0) +/^:_ F.. ap p1

r_c =: [: +./ 1 = (<:`])"0@[ I."1 0 ]
cube_c =: [: *./ (r_c +. r_c~)"1 1

clamp =: {:@[ <. {.@[ >. ]

NB. Empty product is 1, watch out
vol =: ([: */@:x: >:@-~/"1)`0: @. (0 = #)

NB. return the cubiod created by intersecting x and y
intersect =: dyad define
    if. -. x cube_c y do.
        i.0
    else.
        x clamp"1 y clamp"1 x
    end.
)

NB. 6 cubiods which when taken with y are non-overlapping and cover space
co_cuboids =: verb define
    out =. i.0
    for_i. i.3 do.
        out =. out , < (,&__ _)^:(2 - i) ((i {. y) , ,: (>: {: i { y) , _)
        out =. out , < (,&__ _)^:(2 - i) ((i {. y) , ,: __ , <: {. i { y)
    end.
    out
)

NB. Collide x into y, breaking y into smaller cubiods that dont overlap with x
collide_into =: dyad define
    a: -.~ (y&intersect)&.> co_cuboids x
)

p2 =: verb define
    cuboids =. i.0
    for_i. y do.
        cuboids =. ; ((1 {:: i)&collide_into)&.> cuboids
        if. 0 {:: i do.
            cuboids =. cuboids , 1 { i
        end.
    end.
    +/ vol&> cuboids
)

echo part2 =: p2 in
