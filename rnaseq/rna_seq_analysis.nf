// rna_seq_analysis.nf
nextflow.enable.dsl=2

process ANALYZE_RNA_SEQ {
    input:
    path datafile

    output:
    path "results.txt"

    script:
    """
    Rscript rna_seq_analysis.R $datafile > results.txt
    """
}

workflow {
    datafile = file('rna_seq_data.txt')
    ANALYZE_RNA_SEQ(datafile)
}
