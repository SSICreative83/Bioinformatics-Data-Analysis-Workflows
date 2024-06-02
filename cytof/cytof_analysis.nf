// cytof_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_CYTOF {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    python cytof_analysis.py $datafile > results.txt
    """
}

workflow {
    datafile = file('cytof_data.csv')
    ANALYZE_CYTOF(datafile)
}
