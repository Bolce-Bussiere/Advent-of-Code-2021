s =. 6!:1 ''
in =: x: __&".@> '..'&splitstring&> ', y=' splitstring 15 }. -.&LF 1!:1 < 'AoC/17/input.txt'

xvel_r =: (>. _0.5 + %: (0.25 + +: (<0 0) { in)) , (<0 1) { in
yvel_r =: (, <:@|) (<1 0) { in

in_range =: ([: *./ <:`>:"0)"1 0
p_root =. 0.5 - [: %: (0.25 - +:@-)
f =. 1 : 0
    ((u@p_root&((-:@* >:)x))`_: @. (((-:@* >:) x) < ])) y
)

steps_in_x =: (_1 0 + ]) + (>. f)`(<. f)"0~

NB. TODO: faster
steps_in_y =: 4 : 0
    (0:`(>:@+:) @. (0 <: ]) y) + >: I. x in_range - (+/\@:+ i.@>:@<.@((<: | {. x)&%)) |`>: @. (0 <: ]) y
)

xvels =. (#~ 0 < #@>@{:"1) (; ({.in)&steps_in_x)"0 ({. + i.@>:@-~/) xvel_r
yvels =. (#~ 0 < #@>@{:"1) (; ({:in)&steps_in_y)"0 ({. + i.@>:@-~/) yvel_r

vels =. > -.&a: , xvels ((a:"_)`((<@,)&(0&{::)) @. (([: +./ 1 = I."1 0)&(1&{::)))"1 1/ yvels

part1 =: (-:*>:) >./ {:"1 vels
part2 =: # vels

echo (6!:1 '') - s
echo part1 , part2
