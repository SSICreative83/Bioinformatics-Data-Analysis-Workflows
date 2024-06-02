// tcga_omics_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_TCGA_OMICS {
    input:
    path project

    output:
    path "results.txt"

    script:
    """
    Rscript tcga_omics_analysis.R $project > results.txt
    """
}

workflow {
    project = file('tcga_project.txt')
    ANALYZE_TCGA_OMICS(project)
}
