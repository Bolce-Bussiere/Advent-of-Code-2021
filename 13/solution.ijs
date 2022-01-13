getPaper =: [: < ('-' (taketo ,&__". takeafter) ]);._2
getFolds =: [: < (__&".@:(13&}.) ,~ 'x' = 11&{);._2 

'paper folds' =: ((getPaper`getFolds);._2~ [: (0 , }:) (LF,LF)&E.) ,&LF 1!:1 < 'AoC/13/big.txt'

fold =: {{ ~. (|.^:({.x) 0 , {: x) ((|.^:({.x) ]`([+-@|@-))"0)"1 1 y }}

echo part1 =: # ({. folds) fold paper
echo part2 =: ' #' {~ |: 1 [`([: <"1 ])`(0 $~ [: >: >./@:])} paper (] F.. fold) folds
