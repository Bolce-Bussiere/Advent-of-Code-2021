start =. 6!:1 ''

wrap =. 9 , ] , 9:
in =: wrap wrap"1 '0123456789'&i."0;._2 ] 1!:1 < 'AoC/9/9-4096-4.txt'
parsed =. 6!:1 ''

lowPts =. (2 -~ #@{. in) (<.@%~ <@:>:@, |)"0 0 I. , (1 1 ,: 3 3) (4&{ */@:< 1 3 5 7&{)@:,;._3 in

part1 =: +/ >: lowPts { in
p1 =. 6!:1 ''

dels =. 4 2 $ 1 0 0 1 _1 0 0 _1
count =. verb define
    boundry =. y
    c =. 0
    while. 0 < # boundry do.
        p =. {. boundry
        boundry =. }. boundry
        c =. >: c
        in =: 9 p} in
        boundry =. boundry , (#~ -.@e.&boundry) (#~ 9: ~: {&in) dels <@:+"1 1 > p
    end.
    c
)


part2 =: */ _3 {. /:~ count"0 lowPts
p2 =. 6!:1 ''

echo 'Parsed file in ' , ": parsed - start
echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - parsed
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - start
