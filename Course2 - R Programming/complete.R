complete <- function(directory, id = 1:332) {
        files <- list.files(directory, full.names=TRUE)
        cases <- data.frame()
        for (i in id) {
                sel <- read.csv(files[i])
                nobs <-  nrow(sel[complete.cases(sel), ])
                input <- data.frame(i, nobs)
                cases <- rbind(cases, input)
                }
        colnames(cases) <- c("id", "nobs")
        cases
}