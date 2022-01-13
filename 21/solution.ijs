start =. 6!:1 ''

in =: ([: __&". ': '&takeafter);._2 ] 1!:1 < 'AoC/21/input.txt'

dval =: (100&|)&.<:
roll3 =: dval + >: +&dval 2&+

part1 =: verb define
    d =. 1
    scores =. 0 0
    player =. 0
    while. *./ 1000 > scores do.
        y =. ((10&|)&.<: (roll3 d) + player { y) player} y
        scores =. (scores +&(player&{) y) player} scores
        d =. d + 3
        player =. -. player
    end.
    (<: d) * player { scores
)

step =: (>:@] |.inv [ +/@:(*"1 0) (0 1 3 6 7 6 3 1 0 0) |.inv~ ])"2 0 i.@#

part2 =: verb define
    ps =. 1 (<"1 (i.2) ,. (<:y) ,. 0)} 2 10 31 $ 0x
    p =. 0
    wins =. 0 0
    while. *./ 0 < (+/^:2)"2 ps do.
        ps =. (|.^:p step`])"2 ps
        wins =. ((p { wins) + (+/^:2 (_10&{.)"1 p { ps) * +/^:2 (-. p) { ps) p} wins
        ps =. ((10 # 0) ,~ 21&{.)"1 ps
        p =. -.p
    end.
    >./ wins
)

p1 =: part1 in
p2 =: part2 in
end =. 6!:1 ''

echo p1, p2
echo end - start
