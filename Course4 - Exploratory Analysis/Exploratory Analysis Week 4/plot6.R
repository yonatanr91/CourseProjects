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
#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?

#start png file creation
png(filename = "plot6.png", width = 480, height = 480)

#plot6 code
library(ggplot2)
SCC_MV <- SCC[grep("[V]ehicle | [Mm]otor", SCC$Short.Name), "SCC"]
NEI_MV <- NEI[NEI$SCC %in% SCC_MV,]
NEI_MV_BC <- subset(NEI_MV, fips == c("24510"))
NEI_MV_BC$City <- "Baltimore City"
NEI_MV_LA <- subset(NEI_MV, fips == c("06037"))
NEI_MV_LA$City <- "Los Angeles"
NEI_MV_BCLA <- rbind(NEI_MV_BC, NEI_MV_LA)
g <- ggplot(NEI_MV_BCLA, aes(factor(year), Emissions, fill = City))
g <- g + geom_bar(stat = "identity") + facet_grid(.~ City) + labs(x = "Year", y = "PM2.5 Emissions", title = "LA versus BC - Motor Vehicle PM2.5 Emissions by Year by Type")
print(g)

#close png file creation
dev.off()