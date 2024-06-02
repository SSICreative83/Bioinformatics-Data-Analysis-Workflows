# rna_seq_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('rna_seq_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_rna_seq = BashOperator(
        task_id='analyze_rna_seq',
        bash_command='nextflow run rna_seq/rna_seq_analysis.nf'
    )
