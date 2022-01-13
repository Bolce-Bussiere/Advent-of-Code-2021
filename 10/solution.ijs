in =: <;._2 ] 1!:1 < 'AoC/10/input.txt'

removePairs =: ((,.&a: _2 <\ '()[]{}<>')&stringreplace)^:_
part1 =: [: +/ 3x 57x 1197x 25137x {~ (')]}>'&i.)@{.@(-.&'([{<')@>"0
part2 =: [: (<.@-:@# { /:~) 5&#.@:>:@x:@('([{<'&i.)@|.@>"0
echo (part1`part2/.~ (+./@:e.~&'>}])')@>"0) removePairs&.> in
