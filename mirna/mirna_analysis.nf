// mirna_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_MIRNA {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    python mirna_analysis.py $datafile > results.txt
    """
}

workflow {
    datafile = file('mirna_data.csv')
    ANALYZE_MIRNA(datafile)
}
