---- MODULE MC ----
EXTENDS Calculator, TLC

\* Constant expression definition @modelExpressionEval
const_expr_16118403421807000 == 
\A F, G \in BOOLEAN : F => (F => G)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_16118403421807000>>)
----

=============================================================================
\* Modification History
\* Created Thu Jan 28 13:25:42 GMT 2021 by jonmc
