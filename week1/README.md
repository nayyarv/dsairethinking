# Week 1 

## Presentation Questions

### Conditional Probability and Counting

Rethinking Chapter 2: 2M4-2M7

See [Presentation](https://drive.google.com/file/d/1G3vWX_LnIfFi6SyhNm9lQ8F9CZxJUdR_/view)

### Conditional Probability and Monte Carlo

1. Hiroshi has two children. If you know one of them was a girl, what’s the probability that the other child is a girl? (Counting & Bayes Rule)
2. Prove this with a monte carlo experiment.
3. Tien has two children. You know that one of them is a daughter, who was born on a Thursday. Simulate this problem to identify the probability that the other child is also a daughter. Make sure to generate a sex, day pair and not just assume independence.
4. Prove the Monte Hall problem via Monte Carlo simulations.

Solutions: [Week 1 Rmarkdown file](week1.Rmd); [Week 1 output pdf](week1.pdf)

### Simulating a Queueing Problem

Simulate a queuing problem, as adapted from Gelman. There are 3 doctors at a clinc, new customers arrive Poisson distributed with lambda ~ 10 minutes. Each person takes anywhere from 5-20 minutes (uniformly distributed) occupying the doctor. The clinic opens at 9am and last patient is allowed in at 4pm.

1. Simulate this process for a 100 days and identify patient average wait times.
2. Simulate this problem as multi queue, i.e. each patient chooses a doctor to see when they arrive at the clinic.
3. Simulate where the time to solve problems is heavy tailed (I suggest using a shifted log normal)

Notes: For a poisson distribution, use the the fact that the exponential distribution models the time between patients that are poisson distributed.

Solutions: [Week 1 Rmarkdown file](week1.Rmd); [Week 1 output pdf](week1.pdf)

### Monte Carlo, convergence and accuracy

1. Calculate pi using Buffon’s Needle using Monte Carlo. Use 4 different techniques to model how a human would drop the needles and report on any bias estimates.
2. Calculate pi using the cannonball method. Report on the empirical error as a function of number of samples and explain your hypothesis.

Solutions: [Week 1 Rmarkdown file](week1.Rmd); [Week 1 output pdf](week1.pdf)

### (Optional: open-ended) We’ve learned that frequentist methods have an implicit uniform prior. Show that a uniform prior is not always a good prior when doing inference.

Firstly, note that the uniform prior for a Binomial Distribution is actually informative, it biases results closer to 1/2. In fact the informative prior would actually be Beta(1/2, 1/2).

This is more obvious with the code below. 

```r
#prior
x=0:100/100

#uninformative
plot(x, dbeta(x, 0.5, 0.5), 'l', col='blue', ylab="prior")
# uniform
lines(x, dbeta(x, 1, 1), 'l', col='red')

# coin toss
n = 10
h = 5
plot(x, dbeta(x, 0.5+h, 0.5+(n-h)), 'l', col='blue', ylab="prior")
lines(x, dbeta(x, 1+h, 1+(n-h)), col='red')

```

One way of thinking about this is the fact that the binomial parameter, p can only go from [0,1]. A single observation of a heads or a tails means that p is not 0 or 1 and is extremely strong evidence. Meanwhile we need a more information to rule out a value like 0.1 and even more to rule out a value of 0.5 (think about how easy it is to reject a 0.1 p compared to a 0.5 p). Hence the prior in this case represents the inverse power of each observation on the posterior.

Additionally, consider

```r
x = 1:10
ydat = 50 * x + 3 + rnorm(10, 0, 50)

newy = (ydat - mean(ydat))/sd(ydat)
```

Now if i was to do a linear model on `ydat`, a uniform prior makes sense since the intercept could be anything and the slope could be anything. However, for `newy`, a simple transform of the data has changed our possible values of the intercept and slope. We are now significantly more suspicious of large values for either since after normalisation, they shouldn't exist and we expect values closer to 0 so a Norm(0,1) makes the most sense as prior!

More generally, uninformative priors, should remain so as the data is changed!
