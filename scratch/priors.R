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
