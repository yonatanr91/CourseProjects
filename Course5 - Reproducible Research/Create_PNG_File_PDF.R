#check if file exists, if not, download and unzip
if(!file.exists("_e143dff6e844c7af8da2a4e71d7c054d_payments.csv")) {
        fileUrl <- "https://d18ky98rnyall9.cloudfront.net/_e143dff6e844c7af8da2a4e71d7c054d_payments.csv?Expires=1502582400&Signature=KW4YxHgR1p137Kb3YqgyYL-h~w96txE9u2-ZAeBSuuf2xPgMRJvzKjpzyhTU5E0fxM14SNmuDWdChi6Sw0iMukju7~LtT59oexakxNO15KvYrASD~vRqFDIHC6sRYMHRNoGtbzdrkRauDYc1kcShWhFyHYxEmDjmI59MghyhUu8_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A"
        download.file(fileUrl, destfile="C:/Users/yrafael/Desktop/Data Science Course/Course Code/_e143dff6e844c7af8da2a4e71d7c054d_payments.csv")
}

#read files
data <- read.csv("_e143dff6e844c7af8da2a4e71d7c054d_payments.csv")

#PLOT 1
#what is the relationship between mean covered charges (Average.Covered.Charges)
#and mean total payments (Average.Total.Payments) in New York?

#start png file creation
png(filename = "optionalplot1.png", width = 480, height = 480)

#optionalplot1 code
library(ggplot2)
NYdata <- subset(data, Provider.State == "NY")
g <- ggplot(NYdata, aes(Average.Covered.Charges, Average.Total.Payments))
g <- g + geom_point() + geom_smooth(method = "lm") + labs(x = "Mean Covered Charge", y = "Mean Total Payments", title = "New York - Mean Covered Charges vs. Mean Total Payments")
print(g)

#close png file creation
dev.off()


#PLOT 2
#How does the relationship between mean covered charges (Average.Covered.Charges)
#and mean total payments (Average.Total.Payments) vary by medical condition (DRG.Definition)
#and the state in which care was received (Provider.State)?

#start png file creation
png(filename = "optionalplot2.png", width = 480, height = 480)

#optionalplot2 code
library(ggplot2)
g <- ggplot(data, aes(Average.Covered.Charges, Average.Total.Payments))
g <- g + geom_point() + geom_smooth(method = "lm") + facet_grid(Provider.State~DRG.Definition) + labs(x = "Mean Covered Charge", y = "Mean Total Payments", title = "Mean Covered Charges vs. Mean Total Payments - by City and Medical Condition")
print(g)

#close png file creation
dev.off()
