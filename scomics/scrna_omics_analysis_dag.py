# scrna_omics_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('scrna_omics_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_scrna_omics = BashOperator(
        task_id='analyze_scrna_omics',
        bash_command='nextflow run scrna_omics/scrna_omics_analysis.nf'
    )
