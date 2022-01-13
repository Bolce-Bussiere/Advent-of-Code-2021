inp =. '1' = > cutLF 1!:1 < 'AoC/3/input.txt'

echo part1 =: (*&#. -.) (+/ > -:@#) inp

update_bounds =: 1 : 0
    ([ + {:@])`([ -.@u -:@-/@:])`]}
)

select_bits =: {.@] {"1 ({: ,: -/)@:}.@] ];.0 [

iter =: 1 : 0
    #. y {~ {: y (>:@{.@] , }.@] u update_bounds~ 1: i.~ select_bits)^:(1: < -/@:}.@])^:_ ] 0 , 0 ,~ #y
)

NB. Remove /:~ if doing big boy input
echo part2 =: (> iter * <: iter) /:~ inp
