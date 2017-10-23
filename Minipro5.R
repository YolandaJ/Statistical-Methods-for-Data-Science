getwd()
setwd("/Users/youjia/Desktop")
getwd()

pc <- read.table("prostate_cancer.csv", header = TRUE, sep = ",")
#vesinv is not quantitative predictors
plot(pc$cancervol,pc$psa,main='Scatterplots of PSA level against Cancervol',xlab='Cancervol (cc)',ylab='PSA (mg/ml)')
plot(pc$weight,pc$psa,main='Scatterplots of PSA level against Weight',xlab='Weight (gm)',ylab='PSA (mg/ml)')
plot(pc$age,pc$psa,main='Scatterplots of PSA level against Age',xlab='Age (years)',ylab='PSA (mg/ml)')
plot(pc$benpros,pc$psa,main='Scatterplots of PSA level against Benpros',xlab='Benpros (cm^2)',ylab='PSA (mg/ml)')
plot(pc$capspen,pc$psa,main='Scatterplots of PSA level against Capsen',xlab='Capspen (cm)',ylab='PSA (mg/ml)')
plot(pc$gleason,pc$psa,main='Scatterplots of PSA level against Gleason',xlab='Gleason',ylab='PSA (mg/ml)')

# According to the scatterplots, we choose cancervol as the most effectively to predict PSA level
# Get the simple linear model and do the test of significance
lm(pc$psa~pc$cancervol)
psa.reg <- lm(pc$psa~pc$cancervol)
anova(psa.reg)

# Use plots to see if the model is met with the three assumption 
# residual plot
plot(fitted(psa.reg),resid(psa.reg))
abline(h=0)

# qq plot
qqnorm(resid(psa.reg))
qqline(resid(psa.reg))

#time series plot of residuals
plot(resid(psa.reg),type="l")
abline(h=0)

#This doesn't satisfied with the first two assumption 
#In this case, we can do log transformation of cancervol and psa
logpsa<-log(pc$psa)
logcancervol<-log(pc$cancervol)
plot(logcancervol,logpsa,main='Scatterplots of PSA level against log of Cancervol',xlab='log of Cancervol (cc)',
     ylab='log of PSA (mg/ml)')

# Get the simple linear model after the log transformation and do the test of significance
lm(logpsa~logcancervol)
logpsa.reg<-lm(logpsa~logcancervol)
anova(logpsa.reg)

# Use plots to see if the model after the log transformation is met with the three assumption
# Residual plot
plot(fitted(logpsa.reg),resid(logpsa.reg))
abline(h=0)

# QQ plot
qqnorm(resid(logpsa.reg))
qqline(resid(logpsa.reg))

# Time series plot of residuals
plot(resid(logpsa.reg),type="l")
abline(h=0)

# Use the final model to predict the PSA level for a patient whose
# predictor variable value is at the sample mean of the variable.
newlogcancervol<-data.frame(logcancervol=log(mean(pc$cancervol)))
logPSAlevel<-predict(logpsa.reg,newdata=newlogcancervol)
logPSAlevel  # 2.906784
PSAlevel=exp(logPSAlevel)
PSAlevel   # 18.29785

