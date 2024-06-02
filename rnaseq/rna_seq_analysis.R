# rna_seq_analysis.R
library(edgeR)

rna_seq_analysis <- function(file_path) {
    data <- read.delim(file_path)
    d <- DGEList(counts=data)
    d <- calcNormFactors(d)
    d <- estimateDisp(d)
    fit <- glmFit(d)
    results <- topTags(glmLRT(fit))
    print(results)
}

rna_seq_analysis("rna_seq_data.txt")
