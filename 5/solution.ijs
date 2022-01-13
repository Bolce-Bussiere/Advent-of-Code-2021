start =. 6!:1 ''

nonnum =: '0123456789'&([: I. -.@e.~)
readRow =: {{ 2 2 $ __&". ' ' (nonnum y) } y }}

inp =: readRow@> cutLF 1!:1 < 'AoC/5/sample.txt'

parsed =. 6!:1 ''

lineToPts =: (<./ |:@:+ i.@(+*)@-/)"2

countOverlaps =: 3 : '+/ 2 <: #/.~ ; <@lineToPts y'

part1 =: countOverlaps (#~ +./@:=/"2) inp
p1 =. 6!:1 ''

part2 =: countOverlaps inp
p2 =. 6!:1 ''

echo 'Parsed file in ' , ": parsed - start
echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - parsed
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - start
