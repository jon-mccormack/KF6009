---- MODULE MC ----
EXTENDS Calculator, TLC

\* Constant expression definition @modelExpressionEval
const_expr_161183960926026000 == 
\A F, G \in BOOLEAN : F => (F => G)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_161183960926026000>>)
----

=============================================================================
\* Modification History
\* Created Thu Jan 28 13:13:29 GMT 2021 by jonmc
