### Explorartory Data Analysis
### Course Project 2 - Plot 5
### Q5: How have emissions from motor vehicle sources changed from 1999–2008 
### in Baltimore City?

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

### Merge NEI and SCC data

merge <- merge(NEI, SCC, by = 'SCC')

###Filter by the by Baltimal City and vehicle sources
mergeBaltimore <- filter(merge, fips == "24510" & type == 'ON-ROAD')

###Group data by emissions and sum
emission <- aggregate(Emissions ~ year, mergeBaltimore, sum)

with (emission,
      barplot(height = Emissions, 
              names.arg = year,
              xlab = "Year", 
              ylab = expression("Emissions PM"[2.5]),
              main = expression("Total On-Road Emissions by Year 1999-2008 in 
                            Baltimore City")))

### Copy plot as png file
dev.copy (png, file = "plot5.png", height = 480, width = 480) 
dev.off() 