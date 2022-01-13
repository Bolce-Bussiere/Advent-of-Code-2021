start =. 6!:1 ''

inp =: __&".;._1 ',' , -.&LF 1!:1 < 'AoC/6/input.txt'

fish =: x: 0 0 ,~ <:@#/.~ (i.7) , inp

step =: (0 0 0 0 0 0 0 0 0 (_3)}~ {.) + 1&|.

day80 =. step^:80 fish
part1 =: +/ day80
part2 =: +/ step^:(176) day80
