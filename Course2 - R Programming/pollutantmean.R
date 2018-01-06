pollutantmean <- function(directory, pollutant, id = 1:332) {
        files <- list.files(directory, full.names=TRUE)
        alldata <- data.frame()
        for (i in id) {
                alldata <- rbind(alldata, read.csv(files[i]))
        }
        pollutantdata <- alldata[ , pollutant]
        cleandata <- pollutantdata[!is.na(pollutantdata)]
        mean(cleandata)
}