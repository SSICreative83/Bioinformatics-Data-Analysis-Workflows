# dbgap_analysis.R
library(data.table)

dbgap_analysis <- function(file_path) {
    data <- fread(file_path)
    summary <- summary(data)
    print(summary)
}

dbgap_analysis("dbgap_data.txt")
