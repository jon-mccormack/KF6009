----------------------------- MODULE HBuilding -----------------------------
CONSTANT PEOPLE 

VARIABLE register, in, out

Init ==
    /\ register = {}
    /\ in = {}
    /\ out = {}
    
Register(p) == 
    /\ p \in PEOPLE \ register
    /\ register' = register \cup {p}
    /\ out' =  out \cup {p}
    /\ in' = in
    
Enter(p) == 
    /\ p \in PEOPLE /\ p \in register /\ p \in out
    /\ in' = in \cup {p}
    /\ out' = out \ {p}
    /\ register' = register
    
Leave(p) == 
    /\ p \in in \* make sure p is in in
    /\ out' = out \cup {p} \* add p to out
    /\ in' = in \ {p} \* remove p fro in
    /\ register' = register \* register stays the same
    
Next == \* like an entrypoint
    \E p \in PEOPLE: \* there is some person who can be passed into the following functions
        \/ Register(p)
        \/ Enter(p)
        \/ Leave(p)   
    
TypeInv == 
    /\ register \subseteq PEOPLE
    /\ register = in \cup out
    /\ in \cap out = {}

=============================================================================
\* Modification History
\* Last modified Thu Jan 28 10:09:59 GMT 2021 by jonmc
\* Created Thu Jan 28 09:28:55 GMT 2021 by jonmc
