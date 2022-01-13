start =. 6!:1 ''

letters =: 26 {. (u:inv 'A') }. a.
count =: [: +/ letters ="1 0 ]
getSubs =: (2&{. ; (0&{ , _1&{ , 1&{) ; count@:(2&{.))@>"0

'init subs' =: ({. , [: < getSubs@}.) cutLF 1!:1 < 'AoC/14/input.txt'

get =: {{ {. x {~ I. (y -: >@{.)"1 x }}
next =: {{ +/ 2 ([: 2&{:: x&get)\ y }}
step =: {{ (}:y) , <(1 (letters i. (1;1) {:: y)} 26#0) -~ x next 1 {:: y }}

getAns =: {{ (>./ - <./) -.&0 (count }: }. init) -~ y }}

part1 =: getAns (subs =: step"_ 1~^:10 subs) next init
part2 =: getAns (subs =: step"_ 1~^:30 subs) next init
end =. 6!:1 ''

echo part1
echo part2
echo end - start
