library(tidyverse)
library(rethinking)

happy= sim_happiness( seed=1977 , N_years=1000 )

d = happy %>% filter(age > 17) %>%
    mutate(age=(age-18)/47) %>%
    mutate(id = married+1)

m6.9 <- quap(
    alist(
        happiness ~ dnorm( mu , sigma ),
        mu <- a[mid] + bA*A,
        a[mid] ~ dnorm( 0 , 1 ),
        bA ~ dnorm( 0 , 2 ),
        sigma ~ dexp(1)
    ) , data=d)


m6.10 <- quap(
    alist(
        happiness ~ dnorm( mu , sigma ),
        mu <- a + bA*A,
        a ~ dnorm( 0 , 1 ),
        bA ~ dnorm( 0 , 2 ),
        sigma ~ dexp(1)
    ) , data=d2 )


compare(m6.9, m6.10)
