# flow_cytometry_analysis_dag.py
from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2024, 1, 1),
}

with DAG('flow_cytometry_analysis', default_args=default_args, schedule_interval='@daily') as dag:

    analyze_flow_cytometry = BashOperator(
        task_id='analyze_flow_cytometry',
        bash_command='nextflow run flow_cytometry/flow_cytometry_analysis.nf'
    )
