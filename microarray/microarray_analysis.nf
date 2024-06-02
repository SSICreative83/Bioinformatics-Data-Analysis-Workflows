// microarray_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_MICROARRAY {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    python microarray_analysis.py $datafile > results.txt
    """
}

workflow {
    datafile = file('microarray_data.csv')
    ANALYZE_MICROARRAY(datafile)
}
