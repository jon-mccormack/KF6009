----------------------------- MODULE HanoiTower -----------------------------

EXTENDS Naturals, Sequences
CONSTANT DISCS

VARIABLE tower1, tower2, tower3

Init == 
    /\ tower1 = [ n \in DISCS |-> n]
    /\ tower2 = << >>
    /\ tower3 = << >>
    

isOrdered (tower) == 
    \A n \in 2..Len(tower) \* loop through the tower sequence.. starting from index 2 
        : tower[n-1] < tower[n] \* ensure that the previous element is less than the current one


TypeInv == 
    /\ tower1 \in Seq(DISCS) /\ isOrdered (tower1)
    /\ tower2 \in Seq(DISCS) /\ isOrdered (tower2)
    /\ tower3 \in Seq(DISCS) /\ isOrdered (tower3)


Complete == 
    \/ tower2 = [ n \in DISCS |-> n] \* equality check - is tower2 equal to the initially constructed sequence of DISCS?
    \/ tower3 = [ n \in DISCS |-> n] \* same as above
    
MoveDisc (fromTower, toTower) ==
    /\ fromTower' = Tail(fromTower) \* fromTower is updated to everything except the first disc
    /\ toTower' = << Head(fromTower) >> \o toTower \* add then disc from the top (head) of the from tower to the top of this tower (\o concatenates arrays)
    
Move (fromTower, toTower) ==
    /\ fromTower /= <<>> \* ensure fromTower is not empty (so there is a disc to move)
    /\ (
        \/ toTower = <<>> \* ensure either to toTower is empty...
        \/ toTower /= <<>> /\ Head(fromTower) < Head(toTower) \* ... or that the toTower's top disc is of a higher value than the fromTowers head (the disc to move)
        )
    /\ MoveDisc(fromTower, toTower) \* providing both previous expressions resolve to true (/\ - ands) call MoveDisc
    
Next == 
    \/ Move (tower1, tower2) /\ UNCHANGED tower3
    \/ Move (tower1, tower3) /\ UNCHANGED tower2
    \/ Move (tower2, tower1) /\ UNCHANGED tower3
    \/ Move (tower2, tower3) /\ UNCHANGED tower1
    \/ Move (tower3, tower1) /\ UNCHANGED tower2
    \/ Move (tower3, tower2) /\ UNCHANGED tower1

=============================================================================
\* Modification History
\* Last modified Wed Feb 03 17:49:37 GMT 2021 by jonmc
\* Created Wed Feb 03 16:36:19 GMT 2021 by jonmc
