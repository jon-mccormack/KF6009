--------------------------- MODULE RiverCrossing ---------------------------
\* wolf, sheep, cabbage
\* boat for farmer + 1 of above
\* cant have wolf + sheep
\* cant have sheep + cabbage

EXTENDS Naturals

VARIABLE bank1, bank2

Init == 
    /\ bank1 = {"farmer","wolf","sheep","cabbage"}
    /\ bank2 = {}
    
bankIsSafe (bank) ==
    "farmer" \in bank \* this bank is safe -- farmer is on it -- no need to check rest
    \/
    (
        \lnot("farmer" \in bank) \* farmer is NOT on the bank
        /\ \* *AND* either
        (
            \/ \lnot("wolf" \in bank /\ "sheep" \in bank) \* either wolf AND sheep aren't on the bank
            \/ \lnot("sheep" \in bank /\ "cabbage" \in bank) \* either sheep AND cabbage aren't on the bank
        )
    )
    
TypeInv == bankIsSafe (bank1) /\ bankIsSafe (bank2) \* valid if bank 1 and bank 2 are safe

Complete == bank1 = {} /\ bank2 = {"farmer", "wolf", "sheep", "cabbage"}

Move (fromBank, toBank, thing) == 
    /\ "farmer" \in fromBank \* ensure farmer is on the bank we're going from
    /\ thing \in fromBank \* ensure the thing is on the bank we're going from
    /\ fromBank' = fromBank \ {"farmer", thing} \* remove farmer and thing from fromBank
    /\ toBank' = toBank \cup {"farmer", thing} \* toBank is now union of old toBank and {"farmer", thing} set's
    /\ bankIsSafe(fromBank')
    
MoveEmpty (fromBank, toBank) == 
    /\ "farmer" \in fromBank
    /\ fromBank' = fromBank \ {"farmer"} \* remove farmer and thing from fromBank
    /\ toBank' = toBank \cup {"farmer"} \* toBank is now union of old toBank and {"farmer"} set's
    
Next == 
    \/ Move (bank1, bank2, "wolf")
    \/ Move (bank1, bank2, "sheep")
    \/ Move (bank1, bank2, "cabbage")
    \/ Move (bank2, bank1, "wolf")
    \/ Move (bank2, bank1, "sheep")
    \/ Move (bank2, bank1, "cabbage")
    \/ MoveEmpty(bank1, bank2)
    \/ MoveEmpty(bank2, bank1)


=============================================================================
\* Modification History
\* Last modified Thu Feb 04 10:11:20 GMT 2021 by jonmc
\* Created Thu Feb 04 09:11:44 GMT 2021 by jonmc
