NB. Original solution mainly operated on list of leaves,
NB. So this version skips the tree

start =. 6!:1 ''

lbrk =. ]`((,0:)&.>)"0@]
rbrk =. ]`(}:&.>)"0@]
comm =. ]`((]`(<:@#@[)`[} 1:)&.>)"0@]
num =. {:@] ,~ >@{.@] <@, __&".@[ ; >@{:@]

parse =: (,~ a:) (<@(_2 ]\ >@{.) F.. (lbrk`rbrk`comm`num @. ('[],' i. [))) ]

in =: parse;._2 ] 1!:1 < 'AoC/18/input.txt'
parsed =. 6!:1 ''

reduce =: verb define
    while. 1 do.
        exp =. I. 2 (-:&}: *. 4 < #@[)&(>@{:)/\ y
        if. 0 < # exp do.
            if. ({. exp) < 2 -~ # y do.
                y =. (< (< (1 + {. exp) , 0) +&({::&y) < (2 + {. exp) , 0) (< (2 + {. exp) , 0)} y
            end.
            if. ({. exp) > 0 do.
                y =. (< (< ({. exp) , 0) +&({::&y) < (<: {. exp) , 0) (< (<: {. exp) , 0)} y
            end.
            y =. (y {.~ {. exp) , y }.~ >: {. exp
            y =. ((0:&.>)`(}:&.>)"0 ({. exp) { y) ({. exp)} y
            continue.
        end.
        spl =. I. (10 <: >@{.)"1 y
        if. 0 < # spl do.
            y =. (y {.~ {. spl) , (((<.@-:)&.>)`((, 0:)&.>)"0 ({. spl) { y) , y }.~ {. spl
            y =. (((>.@-:)&.>)`((,1:)&.>)"0 y {~ >: {. spl) (>: {. spl)} y
            continue.
        end.
        break.
    end.
    y
)

add =: ]`((,~0:)&.>)"0@[ reduce@:, ]`((,~1:)&.>)"0@] 
mag =: [: +/ ([: */ >@{. , 3 2 {~ >@{:)"1

part1 =: ((mag@>) F.. ((add&.>)~)) in
p1 =. 6!:1 ''

part2 =: >./ ([: mag@:add&>/ {&in)"1 ,/ (-. ,"0 ])"1 0~ i. # in
p2 =. 6!:1 ''

echo 'Parsed file in ' , ": parsed - start
echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - parsed
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - start
