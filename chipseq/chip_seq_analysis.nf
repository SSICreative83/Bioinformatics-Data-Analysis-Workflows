// chip_seq_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_CHIP_SEQ {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    bash chip_seq_analysis.sh $datafile > results.txt
    """
}

workflow {
    datafile = file('chip_seq_data.txt')
    ANALYZE_CHIP_SEQ(datafile)
}
