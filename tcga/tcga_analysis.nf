// tcga_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_TCGA {
    input:
    path project

    output:
    path "results.txt"

    script:
    """
    Rscript tcga_analysis.R $project > results.txt
    """
}

workflow {
    project = file('tcga_project.txt')
    ANALYZE_TCGA(project)
}
