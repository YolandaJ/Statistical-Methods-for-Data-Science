# Statistical-Methods-for-Data-Science

# Data_Processing_and_Visualization_of_USA_Election
This project is programmed using R to make a map of state-by-state percentage vote share of President Trump in 2016 election, which used shades of red for Donald Trump and shades of blue for Hillary Clinton.

1. Used package fiftystater to get each state's longitude and latitude data needed to draw polygon, created a shapefile of 50 states.
2. Filtered election data to get needed part, merged with fifty states' data, got a processed shapefile needed to be plot.
3. Developed to visualize the processed data, like drew polygon, filled scale with different colors, labeled each state with their abbreviate, which made the map easy to read.

# Data-analysis-for-patients-systolic-blood-presure
This project is to analyze the dataset which contains one measurement of systolic blood pressure made by two methods--a finger method and an arm method- from the same 200 patients.

1. Performed an exploratory analysis of the data by examing the distributions of the measurements from the two methods using boxplots. These two distributions are quite similiar so that the two methods for measurement of systolic blood pressure are reasonable.
2. Used histograms to see data distribution in each interval, and QQ plots to examine the shapes of the two distributions. We can see that these 200 patients' blood pressure are normally distributed, and the blood pressure data made by finger method are more symmetric while data made by arm method seems like right-screwed.
3. Constructed an appropriate 95% confidence interval for the difference in the means of the two methods to analyze the distinction of the two methods of measurement of systolic blood pressure. According to the results, we can see that the two methods are quite different. The mean of the blood pressure made by arm method is smaller than the mean of blood pressure made by finger method.

# Test-hypothesis-of-height-of-two-groups
A dataset singer.txt is given.
This project performed an exploratory analysis of the data by examining the distributions of the heights of the singers in the four group.
In order to figure out if Bass singers tend to be taller than Tenor singers, we formulated this problem as a test of appropriate hypothesis.
There is also another 2 different test hypothesis problems.

# Built-regression-mode-and-prediction
Built a “reasonably good” linear model for dataset, which consists of data on 97 men with advanced prostate cancer, by taking PSA level as the response variable.
Use the final model to predict the PSA level for a patient whose predictors are at the sample means of the variables.
