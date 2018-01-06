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
#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#start png file creation
png(filename = "plot4.png", width = 480, height = 480)

#plot4 code
SCC_Coal <- SCC[grep("[Cc]oal", SCC$Short.Name), "SCC"]
NEI_Coal <- NEI[NEI$SCC %in% SCC_Coal,]
CoalEmmissionsbyYear<- tapply(NEI_Coal$Emissions, NEI_Coal$year, sum)
barplot(CoalEmmissionsbyYear, xlab = "Year", ylab = "PM2.5 Emissions", main = "Coal PM2.5 Emissions by Year")

#close png file creation
dev.off()