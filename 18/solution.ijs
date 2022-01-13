parse =: verb define
    if. '[' = {. y do.
        'fst y' =. parse }. y
        'lst y' =. parse }. y
        (fst ,&< lst) ,&< }. y
    else.
        (__&". {. y) ; }. y
    end.
)

in =: (0 {:: parse);._2 ] 1!:1 < 'AoC/18/input.txt'

applyintree =: 2 : 0
    if. #n do.
        ((u applyintree (}.n)) L:_1 ({.n){y) ({.n)} y
    else.
        u y
    end.
)

mag =: ([: +/ 3 2 * mag@>"0)`] @. (0 = L.)

reduce =: verb define
    paths =. < S: 1 {:: y
    if. 4 < L. y do.
        p =. 1 i.~ 2 (-:&}: *. 4 < #@])&>/\ paths
        if. p > 0 do.
            y =. ((y {::~ paths {::~ p)&+) applyintree ((p - 1) {:: paths) y
        end.
        if. p < (# paths) - 2 do.
            y =. ((y {::~ paths {::~ >: p)&+) applyintree ((p + 2) {:: paths) y
        end.
        reduce 0: applyintree (}: p {:: paths) y
    elseif. +./ 10 <: [ S: 0 y do.
        reduce ((<.;>.)@-:) applyintree (paths {::~ {. I. 10 <: [ S: 0 y) y
    else.
        y
    end.
)

echo part1 =: (mag F.. ([: reduce ,~&<)) in
echo part2 =: >./ mag@:reduce"1 ({&in)&.>"0 ,/ (-. ,&<"0 ])"1 0~ i. # in
