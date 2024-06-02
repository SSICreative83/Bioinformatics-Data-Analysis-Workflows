# tcga_analysis.R
library(TCGAbiolinks)

tcga_analysis <- function(project) {
    query <- GDCquery(project = project,
                      data.category = "Transcriptome Profiling",
                      data.type = "Gene Expression Quantification",
                      workflow.type = "HTSeq - Counts")
    GDCdownload(query)
    data <- GDCprepare(query)
    print(summary(data))
}

tcga_analysis("TCGA-BRCA")
