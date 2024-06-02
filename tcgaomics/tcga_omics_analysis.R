# tcga_omics_analysis.R
library(TCGAbiolinks)
library(dplyr)

tcga_omics_analysis <- function(project) {
    query <- GDCquery(project = project,
                      data.category = "Transcriptome Profiling",
                      data.type = "Gene Expression Quantification",
                      workflow.type = "HTSeq - Counts")
    GDCdownload(query)
    data <- GDCprepare(query)
    
    # Additional omics data integration (e.g., methylation, copy number)
    query_meth <- GDCquery(project = project,
                           data.category = "DNA Methylation",
                           data.type = "Methylation Beta Value")
    GDCdownload(query_meth)
    data_meth <- GDCprepare(query_meth)
    
    integrated_data <- data %>% inner_join(data_meth, by = "sample")
    
    print(summary(integrated_data))
}

tcga_omics_analysis("TCGA-BRCA")
