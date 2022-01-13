in =: , ((#:i.16) {~ '0123456789ABCDEF'&i.) -.&LF 1!:1 < 'AoC/16/input.txt'

binr =: ,:/@:[ #.;.0 ]

parse =: verb define
    if. 4 = 3 3 binr y do.
        (((_3 #.\ 6 {. y) ; 16&#.) ,&< y }.~ 6 + 5&*@#) 0 ] F:. ((#.@}. [ 1 Z: -.@{.)@[) _5 ]\ 6 }. y
    else.
        if. 6 { y do.
            res =. (}: , parse@>@{:)^:(7 11 binr y) < 18 }. y
        else.
            res =. (}: , parse@>@{:)^:((7 15 binr y) > (22-~#y) - #@>@{:)^:_ < 22 }. y
        end.
        ({: ,~ (_3 #.\ 6 {. y) <@; <@(_2 ]\ ;@}:)) res
        return.
    end.
)

eval =: verb define
    ([: +`*`<.`>.`]`>`<`= @. ((0 ; 1) {:: y)/ [: eval"1 (1&{::))`(1&{::) @. (4 = (0 ; 1)&{::) y
)

parsed =: 0 {:: parse in
echo part1 =: +/ ; ((a:"_)`(<@{.) @. (1 < #)) S: 0 parsed
echo part2 =: eval parsed
