// cosmic_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_COSMIC {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    python cosmic_analysis.py $datafile > results.txt
    """
}

workflow {
    datafile = file('cosmic_data.csv')
    ANALYZE_COSMIC(datafile)
}
