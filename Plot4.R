### Explorartory Data Analysis
### Course Project 2 - Plot 4
### Q4: Across the United States, how have emissions from coal combustion-related 
### sources changed from 1999–2008?

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

###Filter by the coal sources

coal <- grepl("coal", merge$Short.Name, ignore.case=TRUE)
coal <- merge[coal,]

###Group data by emissions and sum
emission <- aggregate(Emissions ~ year, coal, sum)

with (emission,
      barplot(height = Emissions, 
              names.arg = year,
              xlab = "Year", 
              ylab = expression("Emissions PM"[2.5]),
              main = expression("Total Coal Emissions by Year 1999-2008")))

### Copy plot as png file
dev.copy (png, file = "plot4.png", height = 480, width = 480) 
dev.off() 