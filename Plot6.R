### Explorartory Data Analysis
### Course Project 2 - Plot 6
### Q6: Compare emissions from motor vehicle sources in Baltimore City with 
### emissions from motor vehicle sources in Los Angeles County, California 
### (fips == 06037). Which city has seen greater changes over time in motor 
### vehicle emissions?

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

###Filter by the by City and vehicle sources
mergeCity <- filter(merge, (fips == "24510" | fips == "06037") & 
                             type == 'ON-ROAD')

###Group data by emissions and sum
emission <- aggregate(Emissions ~ year + fips, mergeCity, sum)


ggplot(emission, aes(x = year, y = Emissions, colour = fips)) +
    geom_line() +
    xlab("year") +
    ylab(expression("Emissions PM"[2.5])) +
    scale_color_manual("City\n",labels = c("Los Angeles County", "Baltimore City"), 
                       values = c("blue", "red")) +
    ggtitle(expression("Total On-Road Emissions by Year 1999-2008 and City"))

### Copy plot as png file
dev.copy (png, file = "plot6.png", height = 480, width = 480) 
dev.off() 