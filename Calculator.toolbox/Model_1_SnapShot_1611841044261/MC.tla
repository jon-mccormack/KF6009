---- MODULE MC ----
EXTENDS Calculator, TLC

\* Constant expression definition @modelExpressionEval
const_expr_161184104323027000 == 
\A F, G \in BOOLEAN : F => (F => G)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_161184104323027000>>)
----

=============================================================================
\* Modification History
\* Created Thu Jan 28 13:37:23 GMT 2021 by jonmc
