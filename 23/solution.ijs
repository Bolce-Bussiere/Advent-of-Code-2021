require 'scripts/dictionary.ijs'

NB. spots reachable from y in hall x
reachable =: dyad define
    h =. y ({. ; }.&.:>:) ' ' = x
    I. (*./\&.|. (0 {:: h)) , 1 , *./\ 1 {:: h
)

NB. We should always move pods from wherever they are into their rooms if possible
NB. And the order that we move them doesnt matter
collapse =: verb define
    'h r' =. y
    cost =. 0
    done =. 0
    while. -. done do.
        done =. 1
        for_i. h do.
            if. i = ' ' do.
                continue.
            end.
            val =. 'ABCD' i. i
            if. *./ i = val {:: r do.
                NB. We can add pods to this room
                if. (+:>:val) e. h reachable i_index do.
                    NB. We can move this pod back in.
                    cost =. cost + (10x ^ val) * (4 - # val {:: r) + i_index |@- +: >: val
                    h =. ' ' i_index} h
                    r =. (< i , val {:: r) val} r
                    done =. 0
                end.
            end.
        end.
        for_i. r do.
            if. (i -: a:) +. (i_index { 'ABCD') = {. > i do.
                continue.
            end.
            val =. 'ABCD' i. {. > i
            if. *./ ({. > i) = val {:: r do.
                if. (+:>:val) e. h reachable +: >: i_index do.
                    cost =. cost + (10 ^ val) * (+/ 4 - (val , i_index) #@{::"0 1 r) + >: val (|@-)&(+:@>:) i_index
                    r =. (< ({. > i) , val {:: r) val} r
                    r =. (< }. i_index {:: r) i_index} r
                    done =. 0
                end.
            end.
        end.
    end.
    h ; r ; cost
)

explode =: verb define
    'h r' =. y
    opts =. ,: 3 $ a:
    if. 7 = +/ ' ' ~: h do.
        }. opts return.
    end.
    for_i. r do.
        if. *./ (> i) = i_index { 'ABCD' do.
            continue.
        end.
        val =. 'ABCD' i. {. > i
        for_j. 2 4 6 8 -.~ h reachable (+:>:i_index) do.
            cost =. (10x ^ val) * (5 - # > i) + j |@- +: >: i_index
            new =. (({. > i) j} h) ,&< (< }. i_index {:: r) i_index} r
            opts =. opts , new , < cost
        end.
    end.
    }. opts
)

name =: (' ';'0') stringreplace (,@:>@(1&{::) , (2 4 6 8 -.~ i.11) { >@{.)

solve =: verb define
    open =. ,: y
    dists =. conew 'dictionary'
    (name y) set__dists 0
    while. # open do.
        current =. {. open

        NB. Heap pop
        open =. ({: open) 0} open
        open =. }: open
        j =. 0
        label_heapify.
        'min l r' =. (; >:@*&2 ; 2 + *&2) j
        min =. l ]`([^:(<&([: get__dists@:name open {~ ]))) @. ((#open) > [) min
        min =. r ]`([^:(<&([: get__dists@:name open {~ ]))) @. ((#open) > [) min
        if. min ~: j do.
            open =. (open {~ min , j) (j , min)} open
            j =. min
            goto_heapify.
        end.
        
        for_i. explode current do.
            t =. (get__dists name current) + > {: i
            i =. collapse }: i
            t =. t + > {: i
            i =. }: i
            if. 1:`(t < get__dists) @. has__dists (name i) do.
                (name i) set__dists t
                j =. # open
                if. j = 0 do.
                    open =. ,: i
                else.
                    NB. Heap push
                    open =. open , i
                    while. 0:`(<&([: get__dists@:name open {~ ]) <:@>.@%&2) @. (0&<) j do.
                        open =. (open {~ j ,~ <: j >.@% 2) (j , <: j >.@% 2)} open
                        j =. <: j >.@% 2
                    end.
                end.
            end.
        end.
    end.
    i =. (11 $ ' ') ,&< AAAA`BBBB`CCCC`DDDD
    if. has__dists name i do.
        get__dists name i
    else.
        echo 'No solution found!'
    end.
)

NB. Part 1, part 2, and example inputs
NB. rooms =: DC`BA`AD`CB
rooms =: DDDC`BCBA`ABAD`CACB
NB. rooms =: BDDA`CCBD`BBAC`DACA

echo solve (11 $ ' ') ,&< rooms
