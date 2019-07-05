library(raster) # to get map shape file
library(ggplot2) # for plotting and miscellaneuous things
library(ggmap) # for plotting
library(plyr) # for merging datasets
library(scales) # to get nice looking legends
library(fiftystater)

# Get a shape file of states in the US
usa.df <- fifty_states
colnames(usa.df)[6] <- "State"

# Get the data to be plotted
getwd()
usa.elec1 <- read.table("us_election_data.csv", header = T, sep = ",")
usa.elec1$State <- tolower(usa.elec1$State)

# Delete% of each value
usa.elec1$Clinton.<-as.numeric(sub("%$","",usa.elec1$Clinton.))
usa.elec1$Trump.<-as.numeric(sub("%$","",usa.elec1$Trump.))
usa.elec1$Others.<-as.numeric(sub("%$","",usa.elec1$Others.))

# Get election data of what we need to make a map
usa.elec2 <- usa.elec1[c("State", "Trump.")]
usa.elec3 <- usa.elec2[usa.elec2$State != "district of columbia", ]

#Merge fiftystate data with election data
usa.elec <- join(usa.df, usa.elec3, by = "State", type = "inner" )

#Get mystate data to text map, first we need to correct hawaii and alaska
mystates0 <- data.frame(state.center, state.abb)
# get right AK HI data, mean of all point in AK HI
alaska <- usa.df[usa.df$State == "alaska", ]
finalala <- colMeans(data.frame(alaska$long, alaska$lat))
hawaii <- usa.df[usa.df$State == "hawaii", ]
finalhaw <- colMeans(data.frame(hawaii$long, hawaii$lat))
finala <- unname(finalala)
finalh <- unname(finalhaw)
# Correct AK and HI's x y
mystates0[state.abb == "AK",]$x <- finala[1]
mystates0[state.abb == "AK",]$y <- finala[2]
mystates0[state.abb == "HI",]$x <- finalh[1]
mystates0[state.abb == "HI",]$y <- finalh[2]

# Write a function that does the plotting 
p <- function(data, brks, title) {
  ggp <- ggplot() + 
    geom_polygon(data = data, aes(x = long, y = lat, group = group, 
                                  fill = Trump.), color = "black", size = 0.15) + 
    
    scale_fill_distiller(palette = "RdBu", breaks = brks) + 
    
    theme_nothing(legend = TRUE) + labs(title = title, fill = "") + 
    
    geom_text(data = mystates0, aes(x = x, y = y, label = state.abb), size = 3)
  return(ggp)
}

# Get the break points for different shades
range(usa.elec$Trump.)
brks.to.use <- seq(30, 70 , by = 6) # give intervals
figure.title <- "Election of 2016"
p(usa.elec, brks.to.use, figure.title)
