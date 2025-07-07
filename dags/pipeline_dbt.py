from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'start_date': datetime(2024, 7, 7),  # data de início (hoje)
    'retries': 1,
}

with DAG(
    dag_id='pipeline_dbt',
    default_args=default_args,
    schedule_interval="0 0 * * *",  # Executa todos os dias à meia-noite
    catchup=False,
    description='Pipeline para rodar DBT via Airflow'
) as dag:

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='docker exec dbt dbt run'
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='docker exec dbt dbt test'
    )

    dbt_run >> dbt_test