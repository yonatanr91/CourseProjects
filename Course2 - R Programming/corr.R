corr <- function(directory, threshold = 0) {
        files <- list.files(directory, full.names=TRUE)
        collect <- numeric(length=0)
        comp <- complete(directory)
        tcomp <- comp[comp["nobs"] > threshold, ]
        obs <- c(tcomp[, "id"])
        for (i in obs) {
                sel <- read.csv(files[i])
                cleansel <- sel[complete.cases(sel), ]
                correlation <- cor((cleansel["sulfate"]), cleansel["nitrate"])
                collect <- c(collect, correlation)
        } 
        collect
}