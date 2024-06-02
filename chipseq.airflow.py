t3 = BashOperator(
    task_id='run_chip_seq_analysis',
    bash_command='bash /path/to/chip_seq_analysis.sh',
    dag=dag,
)
