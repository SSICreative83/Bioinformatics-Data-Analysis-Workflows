// dbgap_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_DBGAP {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    Rscript dbgap_analysis.R $datafile > results.txt
    """
}

workflow {
    datafile = file('dbgap_data.txt')
    ANALYZE_DBGAP(datafile)
}
