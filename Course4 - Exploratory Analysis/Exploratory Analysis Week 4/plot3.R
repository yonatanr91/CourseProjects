#check if file exists, if not, download and unzip
if(!file.exists("Source_Classification_Code.rds")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(fileUrl, destfile="C:/Users/yrafael/Desktop/Data Science Course/Course Code/exdata%2Fdata%2FNEI_data.zip")
        unzip("exdata%2Fdata%2FNEI_data.zip")
}
if(!file.exists("summarySCC_PM25.rds")) {
        fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(fileUrl, destfile="C:/Users/yrafael/Desktop/Data Science Course/Course Code/exdata%2Fdata%2FNEI_data.zip")
        unzip("exdata%2Fdata%2FNEI_data.zip")
}

#read files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#PLOT
#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City?
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

#start png file creation
png(filename = "plot3.png", width = 480, height = 480)

#plot3 code
library(ggplot2)
BaltimoreCity <- subset(NEI, fips == "24510")
g <- ggplot(BaltimoreCity, aes(factor(year), Emissions, fill = type))
g <- g + geom_bar(stat = "identity") + facet_grid(.~ type) + labs(x = "Year", y = "PM2.5 Emissions", title = "Baltimore City PM2.5 Emissions by Year by Type")
print(g)

#close png file creation
dev.off()