# rppa_analysis.R
library(limma)

rppa_analysis <- function(file_path) {
    data <- read.table(file_path, header=TRUE, sep="\t")
    fit <- lmFit(data)
    fit <- eBayes(fit)
    results <- topTable(fit)
    print(results)
}

rppa_analysis("rppa_data.txt")
