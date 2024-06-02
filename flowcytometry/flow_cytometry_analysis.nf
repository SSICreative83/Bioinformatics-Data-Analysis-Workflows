// flow_cytometry_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_FLOW_CYTOMETRY {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    Rscript flow_cytometry_analysis.R $datafile > results.txt
    """
}

workflow {
    datafile = file('flow_cytometry_data.fcs')
    ANALYZE_FLOW_CYTOMETRY(datafile)
}
