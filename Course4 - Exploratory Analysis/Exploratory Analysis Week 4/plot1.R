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
#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
#Using the base plotting system, make a plot showing the total PM2.5 emission
#from all sources for each of the years 1999, 2002, 2005, and 2008.

#start png file creation
png(filename = "plot1.png", width = 480, height = 480)

#plot1 code
EmmissionsbyYear<- tapply(NEI$Emissions, NEI$year, sum)
barplot(EmmissionsbyYear, xlab = "Year", ylab = "PM2.5 Emissions", main = "PM2.5 Emissions by Year")

#close png file creation
dev.off()