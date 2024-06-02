process chip_seq_analysis {
    input:
    path fastq_files from file('*.fastq')

    output:
    path 'chip_seq_peaks' into result

    script:
    """
    bash chip_seq_analysis.sh $fastq_files
    """
}
