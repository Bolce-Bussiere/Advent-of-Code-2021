'e in' =: ({. ;&('#'&=@:>) }.) cutLF 1!:1 < 'AoC/20/input.txt'

pad =. 0 0 (,,[)"1 (,:~ 0) (,,[) ]

enhance =: 1 : 0
    (1 1,:3 3) (([: {&x #.@:,);._3^:2 pad^:2)^:(-:m) y
)

echo part1 =: +/ , e (2 enhance) in
echo part2 =: +/ , e (50 enhance) in
