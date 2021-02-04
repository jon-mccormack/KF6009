---- MODULE MC ----
EXTENDS Calculator, TLC

\* Constant expression definition @modelExpressionEval
const_expr_161184128964947000 == 
\A F, G, H \in { 1, 2, 3 } : (F => (G => H)) => ((F => G) => H)
----

\* Constant expression ASSUME statement @modelExpressionEval
ASSUME PrintT(<<"$!@$!@$!@$!@$!",const_expr_161184128964947000>>)
----

=============================================================================
\* Modification History
\* Created Thu Jan 28 13:41:29 GMT 2021 by jonmc
