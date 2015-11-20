### Explorartory Data Analysis
### Course Project 2 - Plot 3
### Q3: Of the four types of sources indicated by the type (point, nonpoint, 
###onroad, nonroad) variable, which of these four sources have seen decreases 
###in emissions from 1999–2008 for Baltimore City? Which have seen increases in 
###emissions from 1999–2008? Use the ggplot2 plotting system to make a plot 
###answer this question.

require(dplyr)
require(ggplot2)

### Read data
## This first line will likely take a few seconds. Be patient!
if(!exists("NEI")){
    NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
    SCC <- readRDS("Source_Classification_Code.rds")
}

### Group the emission data by year

NEIBaltimore <- filter(NEI, fips == 24510)

emission <- aggregate(Emissions ~ year + type, NEIBaltimore, sum)

ggplot(emission, aes(x = year, y = Emissions, colour = type)) +
    geom_line() +
    xlab("year") +
    ylab(expression("Emissions PM"[2.5])) +
    ggtitle(expression("Total Baltimore City Emissions by Year 1999-2008 and Type"))

### Copy plot as png file
dev.copy (png, file = "plot3.png", height = 480, width = 480) 
dev.off() 