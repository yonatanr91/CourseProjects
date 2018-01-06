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
#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#start png file creation
png(filename = "plot5.png", width = 480, height = 480)

#plot5 code
SCC_MV <- SCC[grep("[V]ehicle | [Mm]otor", SCC$Short.Name), "SCC"]
NEI_MV <- NEI[NEI$SCC %in% SCC_MV,]
NEI_MV_BC <- subset(NEI_MV, fips == "24510")
BCCoalEmmissionsbyYear<- tapply(NEI_MV_BC$Emissions, NEI_MV_BC$year, sum)
barplot(BCCoalEmmissionsbyYear, xlab = "Year", ylab = "PM2.5 Emissions", main = "Baltimore City Coal PM2.5 Emissions by Year")

#close png file creation
dev.off()