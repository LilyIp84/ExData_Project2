### Explorartory Data Analysis
### Course Project 2 - Plot 2
### Q2: Have total emissions from PM2.5 decreased in the Baltimore City, 
###Maryland (fips == 24510) from 1999 to 2008? Use the base plotting system to 
###make a plot answering this question.

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

emission <- aggregate(Emissions ~ year, NEIBaltimore, sum)

with (emission,
      barplot(height = Emissions, 
              names.arg = year,
              xlab = "Year", 
              ylab = expression("Emissions PM"[2.5]),
              main = expression("Total Baltimore City Emissions by Year 1999-2008")))

### Copy plot as png file
dev.copy (png, file = "plot2.png", height = 480, width = 480) 
dev.off() 