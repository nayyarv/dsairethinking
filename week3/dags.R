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


plot(dag_6.2 %>% graphLayout())
adjustmentSets( dag_6.2 , exposure="S" , outcome="D" )
impliedConditionalIndependencies(dag_6.2)
ggdag_paths(dag_6.2, from="S", to="D")



dagc = dagitty("dag{
  G -> P -> C
  G -> C
  P <- U -> C
}")
plot(dagc %>% graphLayout())
adjustmentSets( dagc, exposure="G" , outcome="C" )

impliedConditionalIndependencies(dagc)
ggdag_paths(dagc, from="G", to="C")


dag_6.1 <- dagitty( "dag {
    X -> Y <- C
    X <- U -> B
    U <- A -> C
    U -> B <- C
}")

adjustmentSets( dag_6.1 , 'B', "Y")
ggdag_paths(dag_6.1, "X", "Y")
ggdag_adjustment_set(dag_6.1, "X", "Y")
                 

