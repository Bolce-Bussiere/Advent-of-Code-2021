start =. 6!:1 ''

getSubs =: (' -> '&(taketo ; takeafter))@>"0
'init subs' =: ({. , [: < getSubs@}.) cutLF 1!:1 < 'AoC/14/input.txt'
alph =: ~. ; subs
id =: =/~ i. # alph

c =: id ,~ ([: +/ alph ="1 0 >@{.)"1 subs
m =: ((alph -@="1 0 (1;0)&{::"1) ,.~ {."1 ([: +/ ="1 0)"1 (2 <\ (0 2 1&{)@:;)"1) subs
m =: m , id ,.~ 0 $~ (# alph) ([,-~) # {. m

counts =: {{ (+/ alph&="0 }. }: y) -~ +/ ((- # alph) }. x +/ . * c) #~ ({."1 subs) ([: +/ ="1 0) 2 <\ y }}
NB. exponentiation by squaring
mat_exp_step =. {{ (; (1 {:: y) ((+/ .*)^:x)~ ]) (+/ .*)~ 0 {:: y }}
mat_exp =: {{ (y ; y (+/ .*)^:(2 | x) (=/~i.#y)) ((1&{::) F.: mat_exp_step) (}: #: x) }}

part1 =: (>./ - <./) (m2 =. 10 mat_exp m) counts init
part2 =: (>./ - <./) (m2 +/ . * 30 mat_exp m) counts init

end =. 6!:1 ''
echo part1
echo part2
echo end - start
