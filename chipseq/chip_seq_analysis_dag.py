# chip_seq_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('chip_seq_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_chip_seq = BashOperator(
        task_id='analyze_chip_seq',
        bash_command='nextflow run chip_seq/chip_seq_analysis.nf'
    )
