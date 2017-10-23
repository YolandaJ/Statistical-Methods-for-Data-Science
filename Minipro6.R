library(boot)
getwd()
setwd("/Users/youjia/Desktop")
# Read data
cpu <- scan(file = "cputime.txt")
# The parameter of interest is theta=log(E(X))
logmean <- function(x, indices){
  result <- log(mean(x[indices]), base = exp(1))
  return(result)
}
logmean.boot <- boot(cpu, logmean, R=999, sim = "ordinary", stype = "i")
logmean.boot
# Let's see the results after running ordinary nonparametric bootstrap
# ORDINARY NONPARAMETRIC BOOTSTRAP
#
#
# Call:
# boot(data = cpu, statistic = logmean, R = 999, sim = "ordinary", 
#       stype = "i")
#
#
# Bootstrap Statistics :
#     original        bias    std. error
# t1*  3.87605 -0.0009165916  0.09921397

# Let's verify the calculations just for fun
thetahat <- logmean.boot$t0
thetahat  # 3.87605
mybias <- mean(logmean.boot$t)-logmean.boot$t0 
mybias   # -0.0009165916
mysd <- sd(logmean.boot$t)
mysd  # 0.09921397

##########Question 1###########################
## bias of theta.hat is -0.0009165916                      
## standard error of theta.hat is 0.09921397  
###############################################

# 2.5th and 97.5th percentiles of the sampling distribution of thetahat
sort(logmean.boot$t)[c(25, 975)]  # [1] 3.679671 4.072440
# 2.5th and 97.5th percentiles of the sampling distribution of theta.hat-theta
sort(logmean.boot$t0-logmean.boot$t)[c(25, 975)]  # [1] -0.1963894  0.1963798

##########Question 2 and 3#####################################
## 2.5th and 97.5th percentiles of the sampling distribution 
## of thetahat is 3.679671 4.072440            
## 2.5th and 97.5th percentiles of the sampling distribution 
## of theta.hat-theta is -0.1963894  0.1963798 
###############################################################

# Get the 95% confidence interval for log(E(X))
boot.ci(logmean.boot)
# BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
#Based on 999 bootstrap replicates
#
#CALL : 
#  boot.ci(boot.out = logmean.boot)
#
#Intervals : 
#  Level      Normal              Basic         
#95%   ( 3.683,  4.071 )   ( 3.680,  4.072 )  
#
#Level     Percentile            BCa          
#95%   ( 3.680,  4.072 )   ( 3.691,  4.082 )  
#Calculations and Intervals on Original Scale

##########Question 4 #############################################
## 95% confidence interval for theta using bootstrap methods
## Normal approximation method:( 3.683,  4.071 )
## Basic bootstrap method:( 3.680,  4.072 ) 
## Percentile bootstrap method:( 3.680,  4.072 )
##################################################################
