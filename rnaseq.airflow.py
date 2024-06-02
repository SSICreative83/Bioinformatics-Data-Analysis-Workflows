t2 = BashOperator(
    task_id='run_rna_seq_analysis',
    bash_command='Rscript /path/to/rna_seq_analysis.R /path/to/rna_seq_counts.csv /path/to/rna_seq_coldata.csv',
    dag=dag,
)
