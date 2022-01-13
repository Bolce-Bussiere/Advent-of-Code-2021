NB. This is someone else's algorithm.
NB. It uses the fact that each digit appears once in the input
start =. 6!:1 ''

inp =: cut;._2 ] 1!:1 < 'AoC/8/8-100000.txt'
parsed =. 6!:1 ''

part1 =: +/@, (2 3 4 7 e.~ #@>) _4&{."1 inp
p1 =. 6!:1 ''

digits =: (|: +/@:* +/) #: 119 18 93 91 58 107 111 82 127 123

freq =: 'abcdefg' +/@:="0 1 ;

part2 =: 10 #. +/ digits i. (freq@(_5&}.) +/@:{~&:>"1 0 'abcdefg'&i.&.>@(_4&{.))"1 inp
p2 =. 6!:1 ''

echo 'Parsed file in ' , ": parsed - start
echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - parsed
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - start
