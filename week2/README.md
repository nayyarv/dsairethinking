# Week 2

## Presentation Questions


### Statistical Rethinking - 4H1/ HW Q1 

Fitting a Bayesian Model of Height

Courtesy Wilfree Gee

- [Python](presentations/ganymede-week-2-hw-python.ipynb)
- [R](presentations/ganymede-week-2-hw-python.ipynb)

### Statistical Rethinking - 4H2

Under 18 Linear Regression

### Statistical Rethinking -  4H3 / HW Q2

Linear regression of the logarithm

### Bayesian Anscombe

Fit linear regression’s to anscombe’s quartet to get good fits (type ‘anscombe’ into R). 
- Can you choose good prior’s and models to get good fits?
- Show what happens when the quadratic term is added to the 2nd quartet on the posterior of the other terms.
- Use a T distribution on the error model for the 3rd quartet, one with a low df and another with high df.
- Invert y and x for Anscombe’s 4th and model. Can you make the prior strong enough to overcome the outlier?
- (Bonus) Without using quap, can you create a naive linear regression using something like rejection sampling?

### Bayesian Updating

You’re on a cityrail train and you see that it’s numbered 4031. You know that the train numbering cannot exceed 10,000 due to it’s typefacing and you assume that each number is unique and in sequence.

- Explain why the likelihood P(X|N) ∝ 1/N (is proportional to) for 4031 <= N < 10000.
Using a convenient prior, plot the posterior, remembering to normalize. Report median and mean. 
- Now you’ve seen a carriage numbered 2031. Make use of Bayesian Updating to get a new posterior (this can be done by multiplying the two posteriors element wise, taking care to normalise).
- What if the carriage number was 6031 instead? Report median and mean.
- Now with all 3 carriage observations, what’s your estimate of the number of carriages in Sydney
- (Bonus) Suggest a method that would work if you didn’t know what the upper bound on the number of trains would be. (Hint the right prior is needed)


## `quap`

(Bonus) Explain the maths behind the quap method in McElreath's rethinking package
