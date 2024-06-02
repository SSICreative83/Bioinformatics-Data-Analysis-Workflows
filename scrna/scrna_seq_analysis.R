# scrna_seq_analysis.R
library(Seurat)

scrna_seq_analysis <- function(file_path) {
    data <- Read10X(data.dir = file_path)
    seurat_object <- CreateSeuratObject(counts = data)
    seurat_object <- NormalizeData(seurat_object)
    seurat_object <- FindVariableFeatures(seurat_object)
    seurat_object <- ScaleData(seurat_object)
    seurat_object <- RunPCA(seurat_object)
    seurat_object <- FindNeighbors(seurat_object, dims = 1:10)
    seurat_object <- FindClusters(seurat_object)
    seurat_object <- RunUMAP(seurat_object, dims = 1:10)
    print(seurat_object)
}

scrna_seq_analysis("scrna_seq_data/")
