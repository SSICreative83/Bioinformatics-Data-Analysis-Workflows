# tcga_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('tcga_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_tcga = BashOperator(
        task_id='analyze_tcga',
        bash_command='nextflow run tcga/tcga_analysis.nf'
    )
