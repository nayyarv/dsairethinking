library(tidyverse)
library(dagitty)
library(ggdag)

dag_6.2 <- dagitty( "dag {
    S -> A
    A -> D
    S -> M -> D
    S -> W
    W -> D
    A -> M
}")


ggdag(dag_6.2)
ggdag_paths(dag_6.2, from="W", to="D")
ggdag_adjustment_set( dag_6.2 , exposure="W" , outcome="D" )
impliedConditionalIndependencies(dag_6.2)



dagc = dagitty("dag{
  G -> P -> C
  G -> C
  P <- U -> C
}")
# 
ggdag(dagc)
ggdag_paths(dagc, "P" , "C" )

impliedConditionalIndependencies(dagc)
ggdag_paths(dagc, from="P", to="C")


dag_6.1 <- dagitty( "dag {
   Y <- C
    X <- U -> B
    U <- A -> C
    U -> B -> C
}")
ggdag(dag_6.1)
adjustmentSets( dag_6.1 , 'X', "Y")
ggdag_paths(dag_6.1, "X", "Y")
ggdag_adjustment_set(dag_6.1, "X", "Y")
                 

