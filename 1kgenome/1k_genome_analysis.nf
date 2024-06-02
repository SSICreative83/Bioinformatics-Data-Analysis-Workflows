// 1k_genome_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_1K_GENOME {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    bash 1k_genome_analysis.sh $datafile > results.txt
    """
}

workflow {
    datafile = file('1k_genome_data.txt')
    ANALYZE_1K_GENOME(datafile)
}
