// rppa_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_RPPA {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    Rscript rppa_analysis.R $datafile > results.txt
    """
}

workflow {
    datafile = file('rppa_data.txt')
    ANALYZE_RPPA(datafile)
}
