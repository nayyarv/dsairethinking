library(rethinking)
library(dplyr)

# Consider three fictional Polynesian islands 1, 2, 3. On each there is a Royal
# Ornithologist charged by the king with surveying the birb population. They
# have each found the following proportions of 5 important birb species:
  
p1 <- c(0.2, 0.2, 0.2, 0.2, 0.2)
p2 <- c(0.8, 0.1, 0.05, 0.025, 0.025)
p3 <- c(0.05, 0.15, 0.7, 0.05, 0.05)

# Notice that each row sums to 1, all the birbs. This problem has two parts. It
# is not computationally complicated. But it is conceptually tricky. First,
# compute the entropy of each island's birb distribution. Interpret these
# entropy values. Second, use each island's birb distribution to predict the
# other two. This means to compute the K-L Divergence of each island from the
# others, treating each island as if it were a statistical model of the other
# islands. You should end up with 6 different K-L Divergence values. Which
# island predicts the others best? Why?
  

p_birb <- data.frame(p1 = p1, p2 = p2, p3 = p3)

H <- function(p){-sum(p*log(p))}

#entropy - a measure of uncertainty contined in the probability distribution
print("Entropy of Island birb distribution")
print(sapply(p_birb,H))
# Entropy is lowest for island 2 (p2) because it's highely likely that a birb will be of specie A

#Divergence
Dkl.f <- function(p, q) {-sum(p*(log(q) - log(p)))}

Dkl <- matrix(nrow = 3, ncol = 3)
rownames(Dkl) <- names(p_birb)
colnames(Dkl) <- names(p_birb)


for (ip in names(p_birb)) {
  for (iq in names(p_birb)) {
    Dkl[ip, iq] <- Dkl.f(p_birb[ip],p_birb[iq])
  }
}

colnames(Dkl) <- c("q1", "q2", "q3")
print("Prediction divergence of p using model q")
print(Dkl)
# Island 1 predicts the other islands the best because it's the distribution with the maximum entropy. E.g. more uncertainty, less chance to be surprised.
# Conversely, Island 2 is the worst at predicting the other two due to it's low entropy
# Island 1 is the easiest island to predict by the other two island, also possibly because of it's high entropy
