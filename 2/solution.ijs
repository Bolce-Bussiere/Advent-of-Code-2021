inp =: ;:;._2 ] 1!:1 < 'AoC/2/input.txt'

echo part1 =: */ x: +. +/ (__&".@>@{: * 1 0j_1 0j1 {~ forward`up`down i. {.)"1 inp

stepForward =. __&".@>@{:@[ (] + 0: , [ , {.@] * [) ]

stepUD =. 1 : 0
    }.@] ,~ {.@] u __&".@>@{:@[
)

step =: stepForward`(- stepUD)`(+ stepUD) @. (forward`up`down i. {.@[)
echo part2 =: 0 0 0 (*/@:}. F.. step) inp
