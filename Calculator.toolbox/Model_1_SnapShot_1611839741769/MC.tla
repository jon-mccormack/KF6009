---- MODULE MC ----
EXTENDS Calculator, TLC

\* Constant expression definition @modelExpressionEval
const_expr_161183973974033000 == 
\A F, G \in BOOLEAN : F => (F => G)

----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_161183973974033000>>)
----

=============================================================================
\* Modification History
\* Created Thu Jan 28 13:15:39 GMT 2021 by jonmc
