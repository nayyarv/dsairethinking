# Week 2

## Questions

### Conditional Probability and Counting

Rethinking Chapter 2: 2M4-2M7

See [Presentation](https://drive.google.com/file/d/1G3vWX_LnIfFi6SyhNm9lQ8F9CZxJUdR_/view)

### Conditional Probability and Monte Carlo
a. Hiroshi has two children. If you know one of them was a girl, what’s the probability that the other child is a girl? (Counting & Bayes Rule)
b. Prove this with a monte carlo experiment.
c. Tien has two children. You know that one of them is a daughter, who was born on a Thursday. Simulate this problem to identify the probability that the other child is also a daughter. Make sure to generate a sex, day pair and not just assume independence.
d. Prove the Monte Hall problem via Monte Carlo simulations.

Solutions [Week 1 Rmarkdown file](week1.Rmd); [Week 1 output pdf](week1.pdf)

### Simulating a Queueing Problem
Simulate a queuing problem, as adapted from Gelman. There are 3 doctors at a clinc, new customers arrive Poisson distributed with lambda ~ 10 minutes. Each person takes anywhere from 5-20 minutes (uniformly distributed) occupying the doctor. The clinic opens at 9am and last patient is allowed in at 4pm.
a. Simulate this process for a 100 days and identify patient average wait times.
b. Simulate this problem as multi queue, i.e. each patient chooses a doctor to see when they arrive at the clinic.
c. Simulate where the time to solve problems is heavy tailed (I suggest using a shifted log normal)

Solutions [Week 1 Rmarkdown file](week1.Rmd); [Week 1 output pdf](week1.pdf)

### Monte Carlo, convergence and accuracy
a. Calculate pi using Buffon’s Needle using Monte Carlo. Use 4 different techniques to model how a human would drop the needles and report on any bias estimates.
b. Calculate pi using the cannonball method. Report on the empirical error as a function of number of samples and explain your hypothesis.

Solutions [Week 1 Rmarkdown file](week1.Rmd); [Week 1 output pdf](week1.pdf)

### (Optional: open-ended) We’ve learned that frequentist methods have an implicit uniform prior. Show that a uniform prior is not always a good prior when doing inference.
