// scrna_seq_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_SCRNA_SEQ {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    Rscript scrna_seq_analysis.R $datafile > results.txt
    """
}

workflow {
    datafile = file('scrna_seq_data/')
    ANALYZE_SCRNA_SEQ(datafile)
}
