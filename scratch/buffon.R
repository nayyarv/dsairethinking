#Several ways of throwing a needle at "random"
L=0.25 #half-length of the needle
D=20  #length of the room
N=10^6
 
numbhits=function(A,B){
 sum(abs(floor(A[,2])-floor(B[,2]))>0)}
 
#par(mfrow=c(2,2),mar=c(1,1,1,1))
#version #1: uniform location of the centre
U=runif(N,min=0,max=D) #centre
O=runif(N,min=0,max=pi) #angle
C=cbind(runif(N,0,D),U)
A=C+L*cbind(cos(O),sin(O))
B=C-L*cbind(cos(O),sin(O))
cat(N/numbhits(A,B))
numbhits(A,B)
N = 1000
plot(C,type="n",axes=F,xlim=c(0,D),ylim=c(0,D))
for (t in 1:N)
 lines(c(A[t,1],B[t,1]),c(A[t,2],B[t,2]),col="steelblue")
for (i in 0:(D))
 abline(h=i,lty=2,col="sienna")
title(main=paste(numbhits(A,B),"hits",sep=" "))
cat(N/numbhits(A,B))
 
#version #2: uniform location of one endpoint
U=runif(N,min=0,max=D) #centre
O=runif(N,min=0,max=2*pi) #angle
A=cbind(runif(N,0,D),U)
B=A+2*L*cbind(cos(O),sin(O))
cat(N/numbhits(A,B))

plot(A,type="n",axes=F,xlim=c(0,D),ylim=c(0,D))
for (t in 1:N)
 lines(c(A[t,1],B[t,1]),c(A[t,2],B[t,2]),col="steelblue")
for (i in 1:(D-1))
 abline(h=i,lty=2,col="sienna")
title(main=paste(numbhits(A,B),"hits",sep=" "))
 
#version #3: random ray from corner
N=10^3
O=runif(N,min=0,max=pi/2) #angle
U=runif(N)*(D*apply(cbind(1/sin(O),1/cos(O)),1,max)) #centre
C=cbind(U*cos(O),U*sin(O))
A=C+L*cbind(cos(O),sin(O))
B=C-L*cbind(cos(O),sin(O))
cat(N/numbhits(A,B))

plot(C,type="n",axes=F,xlim=c(0,D),ylim=c(0,D))
for (t in 1:N)
 lines(c(A[t,1],B[t,1]),c(A[t,2],B[t,2]),col="steelblue")
for (i in 0:(D))
 abline(h=i,lty=2,col="sienna")
title(main=paste(numbhits(A,B),"hits",sep=" "))
 
#version #4: random ray from corner
O=runif(N,min=0,max=pi/2) #angle
U=runif(N)*(D*sqrt(1+apply(cbind(sin(O)^2,cos(O)^2),1,min))-2*L) #centre
A=cbind(U*cos(O),U*sin(O))
B=A+2*L*cbind(cos(O),sin(O))
plot(A,type="n",axes=F,xlim=c(0,D),ylim=c(0,D))

for (t in 1:N)
 lines(c(A[t,1],B[t,1]),c(A[t,2],B[t,2]),col="steelblue")
for (i in 1:(D-1))
 abline(h=i,lty=2,col="sienna")
title(main=paste(numbhits(A,B),"hits",sep=" "))
