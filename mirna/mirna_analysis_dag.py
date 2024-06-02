# mirna_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('mirna_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_mirna = BashOperator(
        task_id='analyze_mirna',
        bash_command='nextflow run mirna/mirna_analysis.nf'
    )
