---- MODULE MC ----
EXTENDS Calculator, TLC

\* Constant expression definition @modelExpressionEval
const_expr_161184114916138000 == 
\A F, G \in BOOLEAN : (F => G) /\ (G => F) <=> (F <=> G)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_161184114916138000>>)
----

=============================================================================
\* Modification History
\* Created Thu Jan 28 13:39:09 GMT 2021 by jonmc
