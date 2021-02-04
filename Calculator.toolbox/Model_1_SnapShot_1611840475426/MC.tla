---- MODULE MC ----
EXTENDS Calculator, TLC

\* Constant expression definition @modelExpressionEval
const_expr_161184047439011000 == 
\A F, G \in BOOLEAN : F => (F => G)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_161184047439011000>>)
----

=============================================================================
\* Modification History
\* Created Thu Jan 28 13:27:54 GMT 2021 by jonmc
