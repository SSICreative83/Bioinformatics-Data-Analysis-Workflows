# scrna_seq_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('scrna_seq_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_scrna_seq = BashOperator(
        task_id='analyze_scrna_seq',
        bash_command='nextflow run scrna_seq/scrna_seq_analysis.nf'
    )
