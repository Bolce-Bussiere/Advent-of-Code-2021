in =: __&"."0;._2 ] 1!:1 < 'AoC/11/input.txt'

wrap =. [: (0: , ] , 0:)"1 (0: , ] , 0:)

step =: [: ([: (1 1 ,: 3 3)&((0:`(4&{ + +/@:>&9) @. (1 = 0 9 I. {~&4))@,;._3) wrap)^:(1 e. 9 < ,)^:_ >:
echo part1 =: 1 {:: (] ]`(+&.>)"0 (; 0: +/@:= ,)@:step@>@{.)^:100 (in ; 0)
echo part2 =: 1 {:: (step&.>)`(>:&.>)"0^:(0 +./@:~: ,@>@{.)^:_ (in ; 0)
