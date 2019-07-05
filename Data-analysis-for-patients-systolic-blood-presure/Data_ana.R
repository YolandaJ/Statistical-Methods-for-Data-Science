getwd()
setwd("/Users/youjia/Desktop")
getwd()
bp <- read.table("bp.txt",fill = FALSE,sep = "",header = TRUE)
# a.make boxplot for these two data
boxplot(bp$armsys, ylab = "Armsys in mmHg", main = "boxplot of armsys",range = 0)
boxplot(bp$fingsys, ylab = "Fingsys in mmHg", main = "boxplot of fingsys", range = 0)

# b.1.make histograms for these two data
hist(bp$armsys, xlab = "Armsys (mmHg)", main = "histograms of armsys", freq = F)
hist(bp$fingsys, xlab = "Fingsys (mmHg)", main = "histograms of Fingsys", freq = F)
# b.2.make qqplot for the two data
qqnorm(bp$armsys, main = "qqplot of armsys(mmHg)")
qqline(bp$armsys)
qqnorm(bp$fingsys, main = "qqplot of fingsys(mmHg)")
qqline(bp$fingsys)

# c. Construct an appripriate 95% confidence interval for the difference in the mean of the two methods
deltabp <- bp$armsys-bp$fingsys
mean <- mean(deltabp)
sd <- sd(deltabp)
CI <- (mean + c(-1,1)*qnorm(1-0.025)*sd/sqrt(length(deltabp)))
cat("95% confidence interval for the difference in the mean of the two methods is: ",CI, "\n")
