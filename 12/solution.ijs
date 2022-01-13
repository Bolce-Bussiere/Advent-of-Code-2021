strt =. 6!:1 ''
in =: (#~ (end`start +:/@:= ])"1) (, |."1) (({. ; >:@[ }. ])~ i.&'-');._2 ] 1!:1 <'AoC/12/input.txt'
parsed =. 6!:1 ''

opts =: {{ ({:"1 in) {~ I. y = {."1 in }}
paths =: 1 : 0
    x (+/@:(($:`(0:`(] $:~ ,) @. u) @. (90 < (u:inv)@{.@>@]))`1: @. ((<'end') = ])"1 0) opts@]) y
)

part1 =: (-.@e.~ paths)~ <'start'
p1 =. 6!:1 ''
part2 =: ((-.@e.~ +. (=&# ~.)@:[) paths)~ <'start'
p2 =. 6!:1 ''

echo 'Parsed file in ' , ": parsed - strt
echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - parsed
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - strt
