start =. 6!:1 ''

inp =: (_5&}. ,&< _4&{.)@cut&> cutLF 1!:1 < 'AoC/8/8-100000.txt'
parsed =. 6!:1 ''

part1 =: +/ (2 3 4 7 e.~ #@>) , > {:"1 inp
p1 =. 6!:1 ''

atog =: 'abcdefg'
digits =: #: 119 18 93 91 58 107 111 82 127 123
possible =: a: , a: , 1 ; 7 ; 4 ; 2 3 5 ; 0 6 9 ; 8

selector =: [: */ _7: ]\ digits ,@:{~ ({::&possible)@#

getPossible =: selector { (;~ (atog"_)`(atog&-.) @. (1 = possible #@{::~ #))

fix =: (;@#~ <"0@-. -.@] ;@# [)`(I.@])`[} (#@> > 1:)
solver =: {{ ; fix ([-.-.)&.>"0/ getPossible@> y }}

part2 =: +/ _4 (10&#.)\ , digits&i.@(solver@>@[ e.&>"1 0 >@])/"1 inp
p2 =. 6!:1 ''

echo 'Parsed file in ' , ": parsed - start
echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - parsed
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - start
