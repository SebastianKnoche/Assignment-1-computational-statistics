# Data Analytics: Methoden und Programmierung
# Assignment 1: computational statistics
# Themenfeld SS 2021 - Arbeitsgruppe
# 2021-05-11

# simulate rolling the die a few thousand times (e.g. 10000)
# estimate the expectation and the variance from this simulation data
sim_die <- function(n=10000){
  tmp_die <- sample(1:6, n, replace = TRUE)
  #expectation/mean
  e <- sum(tmp_die)/n
  #variance
  v <- var(tmp_die)
  
  tmp_vec <- c(e,v)
  names(tmp_vec) <- c("expectation","variance")
  return(tmp_vec)
}


# compute the average of 20 rolls several thousand times
# and estimates the expectation and the variance of $\overline{Y}$
sim_av20_die <- function(n=10000){
  tmp_e <- c()
  tmp_v <- c()
  for(i in 1:n){
    tmp_die <- sim_die(20)
    tmp_e[i] <- tmp_die[1]
    tmp_v[i] <- tmp_die[2]
  }
  #expectation/mean
  e <- sum(tmp_e)/n
  #variance
  v <- sum(tmp_v)/n
  
  tmp_vec <- c(e,v)
  names(tmp_vec) <- c("expectation","variance")
  return(tmp_vec)
}
  
# compute a single t-statistic. This function has two arguments:
# 1) `x`: vector having the realizations $x_{i} $.
# 2) `mu0`: the value according to the null hypothesis

#generate a vector of random variables
# x <- rnorm(1000,mean=10,sd=3)

#compute a single t statistic
my.tstat <- function(x,mu0=8) {
  return(
    (mean(x) - mu0)/sd(x)*sqrt(length(x))
  )
} #note H_0 is false here


# Write a function `my.genSampleMatrix` that generates a matrix of random variables.
# This function should generate several thousand times a sample of size $n$.
# The arguments are:
# 1) `nReps`: the number of replications. This value will govern the precision of your simulation and is typically equal to several thousand.
# 2) `nSample`: the sample size of each sample (`=n`)
# 3) `mu`: the true expected value of the population
# 4) `sigma`: the true $\sigma$ of the population
# The function should create a matrix where *each row* is a particular sample.
# The number of rows is equal to `nReps`.

#generate a matrix of random variables
my.genSampleMatrix <- function(nReps=2, nSample=5, mu=2, sigma=2) {
  SampleMatrix <- matrix(nrow = nReps,ncol=nSample,byrow = TRUE) #Create Empty Matrix with nReps Rows and nSize Columns
  for (row in seq(nrow(SampleMatrix))){ 
    SampleMatrix[row,] <- rnorm(nSample,mean = mu,sd=sigma^2) #Fill out Matrix by Row with each sample
  }
  return(SampleMatrix) #Output Result
}


# Write a function that accepts the matrix of random variables as an input
# and computes a vector of t-statistics.
# That is, it should compute the t-statistic for each sample in the matrix.
# This function should make use of your previously defined function
# that computes the t-statistic for a single vector.
# The arguments are:
# 1) `sampleMatrix`: the matrix containing the samples.
# 2) `mu0`: the value according to the Null hypothesis.

#compute vector of t stats
my.compute.tVector <- function(sampleMatrix=my.samMatrix, mu0=2) {
     apply(
       sampleMatrix, # Matrix to apply
       MARGIN = 1, #Set to apply by row
       my.tstat, #function to apply
       mu0 = mu0 #extra argument for funtion my.tstat 
    ) 
}


# Now write a function `my.computeTestDecisions` that carries out the decision problem.
# It takes the matrix holding the samples as an input,
# computes the t-statistics and checks whether the t-statistics are larger than a critical value.
# The arguments are:
# 1) `my.samMatrix`: the matrix containing the samples.
# 2) `threshold`: the critical value. After choosing a (significance) level of α we can use a table showing the t-distribution to read off this value.
# 3) `mu0`: the value according to the Null hypothesis.
# 4) `decision.vect`: an indicator (Boolean) variable. The default value is `FALSE` which means that `my.computeTestDecisions()` should return the fraction of samples where the t-statistic is larger than the critical value. For `decision.vect` equal to `TRUE` the function should return the vector of decisions (a vector of Booleans indicating whether the t-statistic is larger than the critical value.)

#compute rejection rate / estimate the probability of rejecting the null

#use a significance level of 10 percent. recall this is one-sided testing.
# rejectValue <- qt(0.9,df=19)
# rejectValue

my.computeTestDecisions <- function(my.samMatrix, threshold = rejectValue, mu0=2, decision.vect=TRUE) {
  #
}


# Now a write a wrapper function that computes the fraction of samples
# where the t-statistic is larger than the critical value for *different values*
# of $\mu$, $\sigma$ etc. The idea is that we use only this wrapper function
# to study the properties of the t-test.
# In particular, we would like to estimate by simulation the probability
# to reject the null hypothesis (the power of a test) for various values
# of the unknown population expectation $\mu$.
#The arguments are:
# 1) `mu`: (see above) the true expected value of the population
# 2) `nReps`: see above
# 3) `nSample`: see above
# 4) `threshold`: see above
# 5) `sigma`: (see above) the true $\sigma$ of the population
# 6) `mu0`: (see above) the value corresponding to the null hypothesis $H_{0}$
#now use the powervalue function to compute the probability of rejecting the null for various values

#same as above. H_0 is true. Result should be equal to significance level
#the precision can be increased by choosing a large nReps-value
my.powerValue <- function(nReps=10000,nSample=20,threshold = rejectValue, mu=2,sigma=2, mu0=2) {
  #
}
