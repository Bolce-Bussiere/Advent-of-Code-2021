start =. 6!:1 ''
in =: __&"."0;._2 ] 1!:1 < 'AoC/15/input.txt'

inbounds =: [: *./ 0 0&<:@] , $@[ > ]

djk =: adverb define
    open =. < y
    dists =. 0 (<y)} ($ m) $ _
    while. # open do.
        current =. {. open

        NB. Heap pop
        open =. ({: open) 0} open
        open =. }: open
        j =. 0
        label_heapify.
        'min l r' =. (; >:@*&2 ; 2 + *&2) j
        min =. l ]`([^:(<&(dists {~ open {~ ]))) @. ((#open) > [) min
        min =. r ]`([^:(<&(dists {~ open {~ ]))) @. ((#open) > [) min
        if. min ~: j do.
            open =. (open {~ min , j) (j , min)} open
            j =. min
            goto_heapify.
        end.

        for_i. (#~ m&inbounds"1) ((,-) 1 0 ,: 0 1) (+"1 1) > current do.
            t =. ((<i) { m) + current { dists
            if. t < (< i) { dists do.
                dists =. t (< i)} dists

                NB. Heap push
                j =. # open
                open =. open , < i
                while. 0:`(<&(dists {~ open {~ ]) <:@>.@%&2) @. (0&<) j do.
                    open =. (open {~ j ,~ <: j >.@% 2) (j , <: j >.@% 2)} open
                    j =. <: j >.@% 2
                end.
            end.
        end.
    end.
    (<x) { dists
)

part1 =: (<:$ in) in djk 0 0
p1 =. 6!:1 ''

in =: ,./^:2 (+/~ i.5) ([: ]`(|~ 9:) @. (9&<) +)"0 2 in
p1pt5 =. 6!:1 ''
part2 =: (<:$ in) in djk 0 0
p2 =. 6!:1 ''

echo 'Found part 1 solution ' , (": part1) , ' in ' , ": p1 - start
echo 'Constructed part 2 array in ' , ": p1pt5 - p1
echo 'Found part 2 solution ' , (": part2) , ' in ' , ": p2 - p1
echo 'Total time: ' , ": p2 - start
