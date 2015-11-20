### Explorartory Data Analysis
### Course Project 2 - Plot 1
### Q1: Have total emissions from PM2.5 decreased in the United States from 
### 1999 to 2008? Using the base plotting system, make a plot showing the total 
### PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

require(dplyr)
require(ggplot2)

### Read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Group the emission data by year

emission <- aggregate(Emissions ~ year, NEI, sum)

with (emission,
      barplot(height = Emissions, 
              names.arg = year,
              xlab = "Year", 
              ylab = expression("Emissions PM"[2.5]),
              main = expression("Total US Emissions by Year 1999-2008")))

### Copy plot as png file
dev.copy (png, file = "plot1.png", height = 480, width = 480) 
dev.off() 