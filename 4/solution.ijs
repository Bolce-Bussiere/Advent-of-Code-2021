start =. 6!:1 ''

boardSize =. 5

'nums boards' =: ((__&".;._1)@(','&,)@>@{. ; (- boardSize) ]\ (__&".)@>@}.) cutLF 1!:1 < 'AoC/4/big_5x5.txt'

parsed =. 6!:1 ''

winTurn =: (>./"1 <./@:, >./)@:i."1 2

score =: ({&nums@] * ,@[ +/@:-. {.&nums@>:@]) nums&winTurn

echo score"2 boards {~ (i. <./ , >./) nums winTurn boards

end =. 6!:1 ''

echo 'Read file in ', ": parsed - start
echo 'Found solution in ', ": end - parsed
echo 'Total runtime: ', ": end - start
