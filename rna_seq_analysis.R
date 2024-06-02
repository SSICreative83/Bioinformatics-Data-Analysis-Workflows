library(DESeq2)
library(ggplot2)

# 读取数据
count_data <- read.csv('rna_seq_counts.csv', row.names=1)
col_data <- read.csv('rna_seq_coldata.csv')

# 创建DESeq数据集
dds <- DESeqDataSetFromMatrix(countData=count_data, colData=col_data, design=~ condition)
dds <- DESeq(dds)

# 差异表达分析
res <- results(dds)
res <- res[order(res$padj), ]

# 火山图
ggplot(res, aes(x=log2FoldChange, y=-log10(padj))) + 
  geom_point() + 
  theme_minimal() + 
  ggtitle('Volcano Plot of RNA-Seq Data')
