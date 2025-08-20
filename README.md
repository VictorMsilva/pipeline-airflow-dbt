# 🏗️ Synthetic Data Generation and Transformation Pipeline with Docker, Airflow + DBT

## 📌 Project Overview
Automated and modular pipeline to generate, transform, and provide synthetic data for a fictitious cleaning products company, using Docker containers to facilitate environment execution and reproducibility.

---

## 🩺 Context and Problem
Retail and wholesale companies need to analyze sales, customer, and inventory data, but often lack structured databases for testing. Manually building these datasets can be laborious and not scalable.

This project solves the problem by creating a Docker-based pipeline that generates, transforms, and provides analytical tables to simulate a sales and logistics environment.

---

## 🎯 Objectives
- Generate synthetic sales, customer, and inventory data
- Containerize the environment for easy deployment and reproducibility
- Automate data transformation and validation
- Build a scalable pipeline with Airflow and DBT
- Simulate BI reports for performance analysis

---

## 🧰 Tech Stack
- **Containers:** Docker + Docker Compose
- **Orchestration:** Apache Airflow
- **Transformation:** DBT (Data Build Tool)
- **Storage:** PostgreSQL (in container)
- **Data Generation:** Faker, pandas
- **Visualization (optional):** Metabase, Power BI, or Streamlit

---

## ⚙️ Project Structure

```plaintext
pipeline-airflow-dbt/
├── dags/                        # Airflow DAGs (orchestration)
│   └── example_dag.py
├── dbt/                         # DBT Project (analytical transformations)
│   ├── models/
│   │   └── example_model.sql
│   ├── seeds/
│   │   └── example_seed.csv
│   ├── dbt_project.yml
│   └── profiles.yml
├── data/                        # Data at different stages
│   ├── raw/
│   ├── processed/
│   └── analytics/
├── src/                         # Main source code
│   ├── ingestion/
│   │   └── generate_data.py
│   ├── processing/
│   │   └── cleaning.py
│   ├── transformation/
│   │   └── enrich.py
│   ├── validation/
│   │   └── schema_check.py
│   ├── utils/
│   │   └── logger.py
│   └── __init__.py
├── scripts/                     # Auxiliary scripts
│   ├── run_pipeline.py
│   └── setup_env.py
├── tests/                       # Unit and integration tests
│   ├── ingestion/
│   │   └── test_generate_data.py
│   ├── processing/
│   │   └── test_cleaning.py
│   ├── transformation/
│   │   └── test_enrich.py
│   ├── validation/
│   │   └── test_schema_check.py
│   └── utils/
│       └── test_logger.py
├── notebooks/                   # Data exploration notebooks
│   └── exploracao_dados.ipynb
├── configs/                     # Configurations and variables
│   ├── config.yaml
│   └── .env.example
├── requirements.txt
├── docker-compose.yml
└── README.md
```

---

## 📦 Dimensional Modeling – Sales Project

### 🧠 Business Process
Product sales by customers, registered in orders and delivered to addresses, with payments and reviews.

### 📏 Fact Table Grain
Each row represents an item sold in an order.

### 📊 Fact Table: `fato_vendas`
- id_item_pedido
- id_pedido
- id_cliente
- id_produto
- id_vendedor
- id_data_pedido
- quantidade
- preco_unitario
- valor_total

### 🧩 Dimension Tables

**dim_cliente**
- id_cliente
- nome
- tipo_cliente
- telefone
- email
- cidade
- estado
- data_cadastro

**dim_produto**
- id_produto
- nome_produto
- descricao
- preco_unitario
- nome_categoria
- nome_fornecedor
- cidade_fornecedor
- estado_fornecedor

**dim_vendedor**
- id_vendedor
- nome
- telefone
- email
- nome_departamento
- data_contratacao

**dim_data**
- id_data
- data
- dia
- mês
- ano
- trimestre
- dia_da_semana
- feriado

---

## ⭐ Star Schema

Visual representation of the proposed dimensional model:

![Star Schema – Dimensional Modeling](docs/Star_schema_vendas.png)

---

## 🏗️ Project Layers

### 1. RAW / Staging Layer (`models/staging/`)
Raw data treatment:
- Cleaning inconsistencies
- Standardizing formats
- Removing nulls and duplicates
- Type conversions (e.g., dates, numerics)

**Included models:**
- `stg_clientes.sql`, `stg_enderecos.sql`, `stg_produtos.sql`
- `stg_vendedores.sql`, `stg_departamentos.sql`, `stg_pedidos.sql`
- `stg_itens_pedido.sql`, `stg_pagamentos.sql`, `stg_entregas.sql`
- `stg_categorias.sql`, `stg_fornecedores.sql`, `stg_datas.sql`, `stg_feriados.sql`

### 2. Modeling Layer (`models/marts/`)
Incremental models that insert data directly into physical tables in the database. Each dimension is populated and updated incrementally.

**Included models:**
- `dim_cliente.sql`
- `dim_produto.sql`
- `dim_vendedor.sql`
- `dim_pagamento.sql`
- `dim_entrega.sql`
- `dim_data.sql`
- `fato_vendas.sql`

## 🧪 Automated Tests

Each dimension and fact has tests defined via `.yml` files, such as:
- `not_null` — required fields
- `unique` — primary keys
- `accepted_values` — valid domains
- `relationships` — referential integrity

## 📚 DBT Documentation and Data Lineage

The project uses [DBT Docs](https://docs.getdbt.com/docs/building-a-dbt-project/documentation) to document all models, sources, tests, and pipeline dependencies.

- To view the interactive documentation and lineage graph, run:

  dbt docs generate
  dbt docs serve --port 8080

## 🚦 Orchestration with Apache Airflow

The project uses [Apache Airflow](https://airflow.apache.org/) to orchestrate and automate the data pipeline, ensuring that ingestion, transformation (DBT), and validation steps are executed in a controlled and scheduled manner.

- DAGs (pipelines) are in the `dags/` folder.
- Airflow runs in a Docker container, accessible at [http://localhost:8080](http://localhost:8080).

## ✅ Data Engineering Best Practices

- **Layer separation:** Raw, staging, and analytical models organized in separate folders.
- **Versioning and reproducibility:** The entire pipeline is versioned in Git and executable via Docker.
- **Secure variable management:** Credentials and sensitive parameters in environment files, never in code.
- **Automated tests:** DBT ensures data integrity with uniqueness, nullity, and relationship tests.
- **Modular orchestration:** Airflow schedules, monitors, and facilitates pipeline extension.
- **Documentation and lineage:** DBT Docs generates automatic documentation and data flow visualization.

## 📈 Deliverables

- **Validated analytical tables:** Ready for BI and analysis.
- **Automated pipeline:** From ingestion to data delivery, all monitored by Airflow.
- **Reproducible environment:** Anyone can clone and run the project from scratch.
- **Ready for integration:** Final data connectable to tools like Metabase or Power BI.

---

## 🚀 How to set up the Python environment (recommended: Python 3.11)

> **Attention:** Apache Airflow 2.8.x is not compatible with Python 3.12. Use Python 3.11 to avoid installation errors.

### 1. Install Python 3.11 (on Ubuntu/WSL)
```bash
sudo apt update
sudo apt install python3.11 python3.11-venv python3.11-distutils
```

### 2. Create and activate the virtual environment
```bash
python3.11 -m venv .venv
source .venv/bin/activate
```

### 3. Install project dependencies
```bash
pip install --upgrade pip
pip install -r requirements.txt
pip install apache-airflow==2.8.4
```

---

## 🚀 How to run the project with Docker

### 1. Install Docker and Docker Compose (if not already installed)

On Ubuntu/WSL:
```bash
sudo apt update
sudo apt install -y docker.io docker-compose
```

### 2. Start the project containers

In the project root, run:
```bash
docker-compose up -d
```
This will start all necessary services (Airflow, DBT, database, etc) in containers.

### 3. Generate and load synthetic data into the database

Run the SQL script to generate synthetic data inside the database container:
```bash
docker-compose exec db psql -U admin -d empresa -f /scripts/SQL/start_gen_dados_sinteticos.sql
```

### 4. Run the DBT pipeline

Inside the DBT container, run:
```bash
docker-compose exec dbt dbt run
docker-compose exec dbt dbt test
```
These commands will create the analytical models and run data quality tests.

### 5. Access Airflow

Open your browser and go to: http://localhost:8080

- Default username and password are usually `airflow` / `airflow` (check your docker-compose.yml)
- Trigger the desired DAG to run the pipeline and DBT tests.
