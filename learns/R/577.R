#install.packages("fastICA")
#install.packages("MASS")
#install.packages("scatterplot3d")
#install.packages("fastICA")
#install.packages("GMD")
#install.packages("markdown")
#install.packages("knitr")

library(MASS)
library(NMF)
library(scatterplot3d)
library(fastICA)
library(GMD)

##Problem 1###
setwd(setwd("."))
setwd("G:/My Drive/Class/7. Spring 2018/STAT577/Submissions/HW4")

MiceData = read.csv("mice_cortex_nuclear.csv")

MiceData.X <- na.omit(MiceData[,-1]) #Removing MouseID and NA

v = apply(MiceData.X,2,var) 
o = order(v,decreasing = T)
MiceData.X = MiceData.X[,o[1:50]]  

# PCA for clustering
# s = svd(MiceData.X)
# loads = s$v  # pc - directions (loadings)
# lambdas = s$d  # eigen-values - also equal to pc variances
# pcs = as.matrix(MiceData.X)%*%loads  # pc scores
# props = lambdas/sum(lambdas)  # proportion of variations explained by each direction
# cumsum(props)  # cumulative proportions of variation


par(mfrow=c(1,2))
props = svd(MiceData.X)$d
plot(1:ncol(MiceData.X),props,xlab="# of components",ylab="Variance",type='l')
cumvar = cumsum(props)/sum(props)
plot(1:ncol(MiceData.X),cumvar,xlab="# of components",ylab="Cummulative variance",type='l')
cumvar

# NMF
MiceData.X.nmf = t(MiceData.X)
MiceData.X.random = randomize(MiceData.X.nmf)
estim.r = nmf(MiceData.X.nmf, rank = 1:8, "lee", nrun = 10, seed = 59)
estim.r.random = nmf(MiceData.X.random, rank = 1:8, "lee", nrun = 10, seed = 59)
plot(estim.r, estim.r.random)
plot(estim.r)

###(b)
# PCA 
a = princomp(MiceData.X)
biplot(a)
pcs = as.matrix(MiceData.X)%*%loads
par(mfrow=c(2,2))
plot(pcs[,1],pcs[,2],xlab="PC-1",ylab="PC-2",pch = 20)
plot(pcs[,1],pcs[,3],xlab="PC-1",ylab="PC-3",pch = 20)
plot(pcs[,2],pcs[,3],xlab="PC-2",ylab="PC-3",pch = 20)
scatterplot3d(pcs[,1],pcs[,2],pcs[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              angle=40,xlab="PC-1",ylab="PC-2",zlab="PC-3")

# ICA
a = fastICA(MiceData.X, n.comp=3, alg.typ = "parallel", fun = "logcosh", alpha = 1,
            method = "R", row.norm = FALSE, maxit = 200,tol = 0.0001, verbose = FALSE)
A=a$A;S=a$S
plot(a$S[,1],a$S[,2],xlab="S-1",ylab="S-2",pch = 20)
plot(a$S[,1],a$S[,3],xlab="S-1",ylab="S-3",pch = 20)
plot(a$S[,2],a$S[,3],xlab="S-2",ylab="S-3",pch = 20)
scatterplot3d(a$S[,1],a$S[,2],a$S[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              angle=20,xlab="S-1",ylab="S-2",zlab="S-3")

# NMF
nmf.mice = nmf(MiceData.X.nmf, rank=3, "lee", nrun=10)
summary(nmf.mice)
X.hat = fitted(nmf.mice)  
W = basis(nmf.mice)       
H = coef(nmf.mice)
par(mfrow=c(2,2))
plot(H[1,],H[2,],xlab="H-1",ylab="H-2",pch = 20)
plot(H[1,],H[3,],xlab="H-1",ylab="H-3",pch = 20)
plot(H[2,],H[3,],xlab="H-2",ylab="H-3",pch = 20)
scatterplot3d(H[1,],H[2,],H[3,], pch = 20,col.grid = "lightblue",col.axis = "blue",
              angle=60,xlab="H-1",ylab="H-2",zlab="H-3")

###(C)
nmf.mice = nmf(MiceData.X.nmf, rank=2, "lee", nrun=10)
summary(nmf.mice)
sum((MiceData.X.nmf-X.hat)^2) # NMF
sum((MiceData.X-S%*%A)^2) # ICA

####Problem 2
#(a)
set.seed(59)
ss = rep(0,20)
for(i in 1:20){
  km = kmeans(MiceData.X,i,nstart=20)
  ss[i] = km$tot.withinss
}
par(mfrow=c(1,2))
plot(1:20,ss,xlab = "k",ylab="total with-in ss",type='l') # plot of k versus the total with-in ss
ss_lag = ss[2:20]
ss_diff = ss[1:19] - ss_lag
plot(1:19,ss_diff,xlab = "k",ylab="reduction in total with-in ss",type='l') # plot of k versus the reduction in total with-in ss

##Based on the figure, there are three clusters in the data
km.mice =kmeans(MiceData.X,3,nstart=20)  # k-means with k=3
km.mice
groups = km.mice$cluster
pcs = as.matrix(MiceData.X)%*%svd(MiceData.X)$v
par(mfrow=c(2,2))
plot(pcs[,1],pcs[,2],xlab="PC-1",ylab="PC-2",pch = 20,col=as.numeric(groups))
plot(pcs[,1],pcs[,3],xlab="PC-1",ylab="PC-3",pch = 20,col=as.numeric(groups))
plot(pcs[,2],pcs[,3],xlab="PC-2",ylab="PC-3",pch = 20,col=as.numeric(groups))
scatterplot3d(pcs[,1],pcs[,2],pcs[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              color=as.numeric(groups),angle=40,xlab="PC-1",ylab="PC-2",zlab="PC-3")
#(b)

hc.complete.mice=hclust(dist(MiceData.X), method="complete")
hc.average.mice=hclust(dist(MiceData.X), method="average")
hc.single.mice=hclust(dist(MiceData.X), method="single")
par(mfrow=c(1,3))
plot(hc.complete.mice,main="Complete Linkage", cex=.9) 
plot(hc.average.mice, main="Average Linkage", cex=.9)
plot(hc.single.mice, main="Single Linkage", cex=.9)

ss = rep(0,20)
for(i in 1:20){
  hc.complete.mice=hclust(dist(MiceData.X), method="complete")
  hc.clusters.complete = cutree(hc.complete.mice, k=i)
  hc.res= css(dist.obj=dist(MiceData.X), clusters=hc.clusters.complete)
  ss[i] = hc.res$totwss
}
par(mfrow=c(1,2))
plot(1:20,ss,xlab = "k",ylab="total with-in ss",type='l') # plot of k versus the total with-in ss
ss_lag = ss[2:20]
ss_diff = ss[1:19] - ss_lag
plot(1:19,ss_diff,xlab = "k",ylab="reduction in total with-in ss",type='l') # plot of k versus the reduction in total with-in ss

# Summary plot for results with compelete linkage
hc.complete.mice=hclust(dist(MiceData.X), method="complete")
hc.clusters.complete = cutree(hc.complete.mice, k=4)
pcs = as.matrix(MiceData.X)%*%svd(MiceData.X)$v
par(mfrow=c(2,2))
plot(pcs[,1],pcs[,2],xlab="PC-1",ylab="PC-2",pch = 20,col=as.numeric(hc.clusters.complete))
plot(pcs[,1],pcs[,3],xlab="PC-1",ylab="PC-3",pch = 20,col=as.numeric(hc.clusters.complete))
plot(pcs[,2],pcs[,3],xlab="PC-2",ylab="PC-3",pch = 20,col=as.numeric(hc.clusters.complete))
scatterplot3d(pcs[,1],pcs[,2],pcs[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              as.numeric(hc.clusters.complete),angle=40,xlab="PC-1",ylab="PC-2",zlab="PC-3")


####Problem 3
wholesaleData = read.csv(file = "Wholesale_customers_data.csv")
wholesaleData = na.omit(wholesaleData)
wholesaleData.nmf = t(wholesaleData)

# (a)
wholesaleData.random = randomize(wholesaleData.nmf)
estim.r = nmf(wholesaleData.nmf, rank = 1:5, "lee", nrun = 10, seed = 1)
estim.r.random = nmf(wholesaleData.random, rank = 1:5, "lee", nrun = 10, seed = 1)
plot(estim.r, estim.r.random)

par(mfrow=c(1,2))
e = svd(wholesaleData)$d
plot(1:6,e,xlab="components",ylab="Variances",type='l')
cumvar = cumsum(e)/sum(e)
plot(1:6,cumvar,xlab="components",ylab="Cummulative Variance",type='l')
cumvar

## PCA
a = princomp(wholesaleData)
biplot(a)
pcs = as.matrix(wholesaleData)%*%svd(wholesaleData)$v
par(mfrow=c(2,2))
plot(pcs[,1],pcs[,2],xlab="PC-1",ylab="PC-2",pch = 20)
plot(pcs[,1],pcs[,3],xlab="PC-1",ylab="PC-3",pch = 20)
plot(pcs[,2],pcs[,3],xlab="PC-2",ylab="PC-3",pch = 20)
scatterplot3d(pcs[,1],pcs[,2],pcs[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              angle=20,xlab="PC-1",ylab="PC-2",zlab="PC-3")


##ICA
a = fastICA(wholesaleData, n.comp=3, alg.typ = "parallel", fun = "logcosh", alpha = 1,
            method = "R", row.norm = FALSE, maxit = 200,tol = 0.0001, verbose = FALSE)
A=a$A;S=a$S
par(mfrow=c(2,2))

plot(a$S[,1],a$S[,2],xlab="S-1",ylab="S-2",pch = 20)
plot(a$S[,1],a$S[,3],xlab="S-1",ylab="S-3",pch = 20)
plot(a$S[,2],a$S[,3],xlab="S-2",ylab="S-3",pch = 20)
scatterplot3d(a$S[,1],a$S[,2],a$S[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              angle=20,xlab="S-1",ylab="S-2",zlab="S-3")
##NMF
nmf.mice = nmf(wholesaleData.nmf, rank=3, "lee", nrun=10)
summary(nmf.mice)
wholesaleData.hat = fitted(nmf.mice)  
W = basis(nmf.mice)       
H = coef(nmf.mice)
par(mfrow=c(2,2))
plot(H[1,],H[2,],xlab="H-1",ylab="H-2",pch = 20)
plot(H[1,],H[3,],xlab="H-1",ylab="H-3",pch = 20)
plot(H[2,],H[3,],xlab="H-2",ylab="H-3",pch = 20)
scatterplot3d(H[1,],H[2,],H[3,], pch = 20,col.grid = "lightblue",col.axis = "blue",
              angle=20,xlab="H-1",ylab="H-2",zlab="H-3")

## (b)
set.seed(1)
ss = rep(0,20)
for(i in 1:20){
  km = kmeans(wholesaleData,i,nstart=20)
  ss[i] = km$tot.withinss
}
par(mfrow=c(1,2))
plot(1:20,ss,xlab = "k",ylab="total with-in ss",type='l') 
ss_lag = ss[2:20]
ss_diff = ss[1:19] - ss_lag
plot(1:19,ss_diff,xlab = "k",ylab="reduction in total with-in ss",type='l') 

# K=3
km.wholesale =kmeans(wholesaleData,3,nstart=20)  # k-means with k=3
groups = km.wholesale$cluster
pcs = as.matrix(wholesaleData)%*%svd(wholesaleData)$v
par(mfrow=c(2,2))
plot(pcs[,1],pcs[,2],xlab="PC-1",ylab="PC-2",pch = 20,col=as.numeric(groups))
plot(pcs[,1],pcs[,3],xlab="PC-1",ylab="PC-3",pch = 20,col=as.numeric(groups))
plot(pcs[,2],pcs[,3],xlab="PC-2",ylab="PC-3",pch = 20,col=as.numeric(groups))
scatterplot3d(pcs[,1],pcs[,2],pcs[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              color=as.numeric(groups),angle=60,xlab="PC-1",ylab="PC-2",zlab="PC-3")

# (c)
hc.complete.wholesale=hclust(dist(wholesaleData), method="complete")
hc.average.wholesale=hclust(dist(wholesaleData), method="average")
hc.single.wholesale=hclust(dist(wholesaleData), method="single")
par(mfrow=c(1,3))
plot(hc.complete.wholesale,main="Complete Linkage", xlab="", sub="", cex=.9) 
plot(hc.average.wholesale, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single.wholesale, main="Single Linkage", xlab="", sub="", cex=.9)

# Choose number of clusters for complete linkage
ss = rep(0,20)
for(i in 1:20){
  hc.complete.wholesale=hclust(dist(wholesaleData), method="complete")
  hc.clusters.complete = cutree(hc.complete.wholesale, k=i)
  hc.res= css(dist.obj=dist(wholesaleData), clusters=hc.clusters.complete)
  ss[i] = hc.res$totwss
}
par(mfrow=c(1,2))
plot(1:20,ss,xlab = "k",ylab="total with-in ss",type='l') # plot of k versus the total with-in ss
ss_lag = ss[2:20]
ss_diff = ss[1:19] - ss_lag
plot(1:19,ss_diff,xlab = "k",ylab="reduction in total with-in ss",type='l') # plot of k versus the reduction in total with-in ss

# Summary plot for results with compelete linkage
hc.complete.wholesale=hclust(dist(wholesaleData), method="complete")
hc.clusters.complete = cutree(hc.complete.wholesale, k=8)
pcs = as.matrix(wholesaleData)%*%svd(wholesaleData)$v
par(mfrow=c(2,2))
plot(pcs[,1],pcs[,2],xlab="PC-1",ylab="PC-2",pch = 20,col=as.numeric(hc.clusters.complete))
plot(pcs[,1],pcs[,3],xlab="PC-1",ylab="PC-3",pch = 20,col=as.numeric(hc.clusters.complete))
plot(pcs[,2],pcs[,3],xlab="PC-2",ylab="PC-3",pch = 20,col=as.numeric(hc.clusters.complete))
scatterplot3d(pcs[,1],pcs[,2],pcs[,3], pch = 20,col.grid = "lightblue",col.axis = "blue",
              as.numeric(hc.clusters.complete),angle=60,xlab="PC-1",ylab="PC-2",zlab="PC-3")


