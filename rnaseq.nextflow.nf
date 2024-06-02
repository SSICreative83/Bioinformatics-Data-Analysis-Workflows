process rna_seq_analysis {
    input:
    path count_data from file('rna_seq_counts.csv')
    path col_data from file('rna_seq_coldata.csv')
    
    output:
    path 'rna_seq_volcano.png' into result

    script:
    """
    Rscript rna_seq_analysis.R $count_data $col_data
    """
}
