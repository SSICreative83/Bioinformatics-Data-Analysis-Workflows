from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
}

dag = DAG('microarray_analysis', default_args=default_args, schedule_interval='@daily')

t1 = BashOperator(
    task_id='run_microarray_analysis',
    bash_command='python /path/to/microarray_analysis.py /path/to/microarray_data.csv',
    dag=dag,
)
