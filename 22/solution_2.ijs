NB. INCOMPLETE!
nums =. _2 ]\ [: __&". ' ' [`([: I.@:-.@e.&'0123456789-' ])`]} ]

in =: (nums ;~ 'on' -: ' '&taketo);._2 ] 1!:1 < 'AoC/22/example.txt'

fix =: [: ({."1 ,. >:@-~/"1) 50 + ]
p1 =: ]`(fix&.>)"0 (#~ ([: */^:2 <&51 * >&_51)@:>@{:"1) in

ap =: dyad define
    (0 {:: x) (< ([: < {. + i.@{:)"1 > {: x)} y
)

echo part1 =: (101 101 101 $ 0) +/^:_ F.. ap p1

r_c =: [: +./ 1 = (<:`])"0@[ I."1 0 ]
cube_c =: [: *./ (r_c +. r_c~)"1 1

clamp =: {:@[ <. {.@[ >. ]

vol =: ([: */@:x: >:@-~/"1)`0: @. (0 = #)

NB. return the cubiod created by intersecting x and y
intersect =: ] clamp"1 clamp"1

p2 =: verb define
    cuboids =. i.0
    v_tot =. 0x
    for_i. y do.
        v_tot =. v_tot - +/ vol@:((1 {:: i)&intersect)@>"0 (#~ ((1 {:: i)&cube_c)@>"0) cuboids
        if. 0 {:: i do.
            cuboids =. cuboids , 1 { i
        end.
    end.
    v_tot + +/ (>@{. * vol@:>@{:)"1 cuboids
)
