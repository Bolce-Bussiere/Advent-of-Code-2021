start =. 6!:1 ''

inp =: __&".;._1 ',' , -.&LF 1!:1 < 'AoC/7/7-1000000-2.txt'

parsed =. 6!:1 ''

part1 =: +/ (|@- <.@-:@# { /:~) inp

p1 =. 6!:1 ''

part2 =: -: +/ x: ((*>:)@|@- +/ <.@(0.5&+)@% #) inp

p2 =. 6!:1 ''

echo 'Parsed file in ' , ": parsed - start
echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - parsed
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - start
