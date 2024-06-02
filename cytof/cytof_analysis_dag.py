# cytof_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('cytof_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_cytof = BashOperator(
        task_id='analyze_cytof',
        bash_command='nextflow run cytof/cytof_analysis.nf'
    )
