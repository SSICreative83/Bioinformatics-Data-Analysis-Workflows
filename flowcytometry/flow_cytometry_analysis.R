# flow_cytometry_analysis.R
library(flowCore)

flow_cytometry_analysis <- function(file_path) {
    data <- read.FCS(file_path, transformation = FALSE)
    summary <- summary(data)
    print(summary)
}

flow_cytometry_analysis("flow_cytometry_data.fcs")
