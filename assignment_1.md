---
title: "Data Analytics: Methoden und Programmierung"
subtitle: "Assignment 1: computational statistics"
author: "Themenfeld SoSe 2021 - Arbeitsgruppe"
date: "2021-05-12"
output:
  html_document:
    keep_md: yes
  pdf_document: default
---





This assignment serves two purposes. First, it will train your R programming skills, in particular writing your own functions. Second, it serves as an introduction to computational statistics (or: understanding statistics by simulation). The idea is to study well-known problems by simulation.

Feel free to work in groups (maximum of 4 students per group). Each group must submit at least one R-file containing well-documented functions and test cases to test the functions. You may use two files (one for the functions and another one for the testcases), but this is not necessary. Write your answers and explanations as comments into the R-File. You may submit an Rmd-file instead of an R-File, but this not necessary.

A note on grading: There will be a written exam ($50%$), the in-class quizzes ($10%$ for both classes; the Data Science and the Programming class) and two home assignments (each $15%$). The groups will be asked to present their home assignments in class. There will be a single final grade calculated from the sum of all achieved points. In total, you can earn a maximum of 100 points ($=100%$).

This home assignment has 15 points ($=15%$) and is due Sunday, May 30, 6PM

## 1    Estimation (3 Points)

Let $Y$ denote a discrete random variable describing rolling a usual die with six sides.

### 1.1   Expectation and variance

Assume that each side is observed with equal probability. Compute (on a sheet of paper) the expectation and the variance of the random variable $Y$. Insert your calculations and the answer as a comment into the R-File.

> $\begin{align*}  
\mathrm{E}(Y) & = 1\frac{1}{6}+2\frac{1}{6}+3\frac{1}{6}+4\frac{1}{6}+5\frac{1}{6}+6\frac{1}{6}\\  
\mathrm{E}(Y) & = 3.5\\  
\\  
\mathrm{Var}(Y) & = 1^{2}\frac{1}{6}+2^{2}\frac{1}{6}+3^{2}\frac{1}{6}+4^{2}\frac{1}{6}+5^{2}\frac{1}{6}+6^{2}\frac{1}{6}-3.5^{2}\\  
\mathrm{Var}(Y) & = \frac{35}{12} = 2.92\\  
\end{align*}$  

#### 1.1.1    Expectation and variance by simulation

Now produce some code to simulate rolling the die. The computer should roll the die a few thousand times (e.g. 10000) and estimate the expectation and the variance from this simulation data. Write a function by completing this skeleton.


```r
sim_die <- function(n=10000){
  #expectation/mean
  e <-
  #variance
  v <-
  return(c(e,v))
}
```


```r
sim_die <- function(n = 10000){
  tmp_die <- sample(1:6, n, replace = TRUE)
  #expectation/mean
  e <- sum(tmp_die)/n
  #variance
  v <- var(tmp_die)
  
  tmp_vec <- c(e, v)
  names(tmp_vec) <- c("expectation", "variance")
  return(tmp_vec)
}
```



> $\begin{align*}  
\mathrm{E}(Y) & = 3.5237\\  
\mathrm{Var}(Y) & = 2.8989\\  
\end{align*}$  

### 1.2   Variance of the mean

Assume that you roll the die 20 times and then compute the average $(\overline{Y}=\frac{1}{n}\sum_{i}Y_{i})$ of the 20 values. This describes a new experiment and the average ($\overline{Y}$) is a new random variable. Compute (on a sheet of paper) the expectation and the variance of $\overline{Y}$

> $\begin{align*}  
\mathrm{E}(\overline{Y}) & = Y_{1}\frac{1}{20}+Y_{2}\frac{1}{20}+...+Y_{19}\frac{1}{20}+Y_{20}\frac{1}{20}\\  
\\  
\mathrm{Var}(\overline{Y}) & = Y_{1}^{2}\frac{1}{20}+Y_{2}^{2}\frac{1}{20}+...+Y_{19}^{2}\frac{1}{20}+Y_{20}^{2}\frac{1}{20}-{E}(\overline{Y})^{2}\\  
\end{align*}$  

#### 1.2.1    By simulation

Write a function that computes the average of 20 rolls several thousand times and estimates the expectation and the variance of $\overline{Y}$



> $\begin{align*}  
\mathrm{E}(\overline{Y}) & = 3.4982\\  
\mathrm{Var}(\overline{Y}) & = 2.9142\\  
\end{align*}$  

## 2    Hypothesis testing (12 Points)

A population is described by a random variable $X$ and you would like to perform a hypothesis test regarding the expectation of the population. For example, the random variable could describe the distribution of returns from a particular investment. A possible interesting hypothesis is –for example– whether the expected return is larger than 2 percent. Letting $\mu_{X}$ denote the unknown expected value, you wish to test $H_{0}:\mu_{X}\le2$ against $H_{1}:\mu_{X}>\mu_0=2$. For simplicity, consider only this one-sided hypothesis testing problem in the following.

Let $X_{i},i\in[1,n]$ denote random draws from the population. Assume that the population of returns is characterized by a Normal distribution. Thus, $X_{i}$ are iid random variables following a Normal distribution 2 with expectation $\mu_{X}$ and variance $\sigma^{2}_{X}$.

In the following, you are asked to write several functions for carrying out this hypothesis testing problem.

### 2.1   A single t-statistic

Write a function computing a single t-statistic. This function has two arguments:

  1) `x`: vector having the realizations $x_{i}$.
  2) `mu0`: the value according to the null hypothesis



> $t = 17.8176$

### 2.2   Generating a matrix of random variables

Write a function `my.genSampleMatrix` that generates a matrix of random variables. This function should generate several thousand times a sample of size $n$. The arguments are:

  1) `nReps`: the number of replications. This value will govern the precision of your simulation and is typically equal to several thousand.
  2) `nSample`: the sample size of each sample (`=n`)
  3) `mu`: the true expected value of the population
  4) `sigma`: the true $\sigma$ of the population

The function should create a matrix where *each row* is a particular sample. The number of rows is equal to
`nReps`.


Table: Sample matrix

|    1     |     2     |     3      |     4     |     5     |
|:--------:|:---------:|:----------:|:---------:|:---------:|
| 7.183282 | -1.509153 | 0.6517722  | -1.457798 | -1.722433 |
| 7.959834 | -1.169107 | -0.0562633 | 8.264322  | 2.060400  |


### 2.3   Vector of t-statistics

Write a function that accepts the matrix of random variables as an input and computes a vector of t-statistics.  
That is, it should compute the t-statistic for each sample in the matrix. This function should make use of your previously defined function that computes the t-statistic for a single vector.

The arguments are:

  1) `sampleMatrix`: the matrix containing the samples.
  2) `mu0`: the value according to the Null hypothesis.



> $\begin{align*}  t_{ 1 } & = -0.8091\\  t_{ 2 } & = 0.7101  
\end{align*}$  

#### 2.3.1    Further example: the same function with a larger number of repetitions.

<img src="assignment_1_files/figure-html/further testing of my.compute.tVector()-1.png" style="display: block; margin: auto;" />

### 2.4   The decision problem

Until now, you can generate a matrix holding the samples and you can compute the t-statistic for each sample in the matrix. Now write a function `my.computeTestDecisions` that carries out the decision problem. It takes the matrix holding the samples as an input, computes the t-statistics and checks whether the t-statistics are larger than a critical value.

The arguments are:

  1) `my.samMatrix`: the matrix containing the samples.
  2) `threshold`: the critical value. After choosing a (significance) level of α we can use a table showing the t-distribution to read off this value.
  3) `mu0`: the value according to the Null hypothesis.
  4) `decision.vect`: an indicator (Boolean) variable. The default value is `FALSE` which means that `my.computeTestDecisions()` should return the fraction of samples where the t-statistic is larger than the critical value. For `decision.vect` equal to `TRUE` the function should return the vector of decisions (a vector of booleans indicating whether the t-statistic is larger than the critical value.)


```
## [1] "critical value: 1.3277282090268"
```


```r
reject <- my.computeTestDecisions(my.samMatrix, threshold = rejectValue, mu0 = 2, decision.vect = TRUE)
reject
```

```
##     1     2 
## FALSE FALSE
```

#### 2.4.1    Further example: the same function with a larger number of repetitions.

This time we do not specify the argument `decision.vect`. Hence it takes the default value of `FALSE` and returns the fraction of samples where the t-statistic is larger than the critical value. We know that this fraction should be equal to our (significance) level $\alpha$ if the hypothesized $\mu_{0}$ is equal to the true $\mu_{X}$. By increasing the number of repetitions (`nReps`) we may improve the precision of the simulation.


```r
my.samMatrix <- my.genSampleMatrix(nReps = 20000, nSample = 20, mu = 2, sigma = 3)
reject <- my.computeTestDecisions(my.samMatrix, threshold = rejectValue, mu0 = 2)
reject
```

```
## [1] 0.0996
```

### 2.5   Putting it all together.

Now a write a wrapper function that computes the fraction of samples where the t-statistic is larger than the critical value for *different values* of $\mu$, $\sigma$ etc. The idea is that we use only this wrapper function to study the properties of the t-test. In particular, we would like to estimate by simulation the probability to reject the null hypothesis (the power of a test) for various values of the unknown population expectation $\mu$.

The arguments are:

  1) `mu`: (see above) the true expected value of the population
  2) `nReps`: see above
  3) `nSample`: see above
  4) `threshold`: see above
  5) `sigma`: (see above) the true $\sigma$ of the population
  6) `mu0`: (see above) the value corresponding to the null hypothesis $H_{0}$


```r
#now use the powervalue function to compute the probability of rejecting the null for various values

#same as above. H_0 is true. Result should be equal to significance level
#the precision can be increased by choosing a large nReps-value
my.powerValue(nReps = 10000, nSample = 20, threshold = rejectValue, mu = 2, sigma = 2, mu0 = 2)
```

```
## [1] 0.1015
```


```r
# #now H_0 is false
my.powerValue(nReps = 10000, nSample = 20, threshold = rejectValue, mu = 2.4, sigma = 2, mu0 = 2)
```

```
## [1] 0.1988
```


```r
#now H_0 is false
my.powerValue(nReps = 10000, nSample = 20, threshold = rejectValue, mu = 2.6, sigma = 2, mu0 = 2)
```

```
## [1] 0.2678
```

#### 2.5.1    Plotting

Now we are done. We can compute the power of the t-test for various values of $\mu$ etc.

**Use your wrapper function** to simulate the power of the t-test for the following problem: $H_{0}:\mu_{X}\le2$ against $H_{1}:\mu_{X}>\mu_{0}=2$ with sample size $n=20$, $\sigma=2$ and significance level $\alpha=0.1$. Number of replications is 10000.

Compute the power of the t-test $\prod(\mu_{X})$ for $\mu_{X}=2.0, 2.1, 2.2, ...4.0$ and plot the results:

<img src="assignment_1_files/figure-html/plotting the power of the t-test-1.png" style="display: block; margin: auto;" />
