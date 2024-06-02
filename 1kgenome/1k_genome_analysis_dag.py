# 1k_genome_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('1k_genome_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_1k_genome = BashOperator(
        task_id='analyze_1k_genome',
        bash_command='nextflow run 1k_genome/1k_genome_analysis.nf'
    )
