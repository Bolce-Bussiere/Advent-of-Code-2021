read_vec =: [: __&".;._1 ','&,
in =: (([: < [: read_vec@>"0 }.@:cutLF);._2~ (LF,LF)&E.) ,&LF 1!:1 < 'AoC/19/input.txt'

dists =: ([: +/&.:*: -)"1/~

overlap =: dyad define
    for_p1. dists y do.
        for_p2. dists x do.
            i =. p1 ([-.-.) p2
            if. 12 <: # i do.
                ((p2 i. i) { x) ;"1 1 (p1 i. i) { y
                return.
            end.
        end.
    end.
    i.0
)

get_transform =: verb define
    pair =. > {. (#~ ((-: ~.)@:>@{.)"1) (2 -&.>/\ ]) y
    perm =. i.~/ | pair
    flip =. ({. pair) % perm { {: pair
    ((>@{. - flip * perm { >@{:) {. y) , flip ,: perm
)

NB. My brain is incredibly wrinkly
apply_tr =. +`*`{/@:,"2 1

solve =: verb define
    need =. }. i. #y
    found =. 0
    while. # need do.
        i =. {. found
        found =. }. found
        for_j. need do.
            over =. (i {:: y) overlap2 (j {:: y)
            if. # over do.
                found =. found , j
                y =. (< (get_transform over)&apply_tr 0 0 0 , j {:: y) j} y
            end.
        end.
        need =. need -. found
    end.
    ({.@>"0 y) ; ~. ; }.&.>"0 y
)

'scanners beacons' =: solve in
echo part1 =: # beacons
echo part2 =: >./ ; ([: < {: +/@:|@:-"1 1 }:)\ scanners
