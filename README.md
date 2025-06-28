# 🏗️ Pipeline de Geração e Transformação de Dados Sintéticos com Docker, Airflow + DBT

## 📌 Resumo do Projeto  
Criar um pipeline automatizado e modular para gerar, transformar e disponibilizar dados sintéticos de uma empresa fictícia de materiais de limpeza, utilizando containers Docker para facilitar a execução e reprodutibilidade do ambiente.  

## 🩺 Contexto e Problema  
Empresas de varejo e atacado precisam analisar dados de vendas, clientes e estoque, mas nem sempre possuem bases de dados estruturadas para testes. A construção manual desses dados pode ser trabalhosa e pouco escalável.  

Esse projeto resolve o problema criando um pipeline baseado em Docker, que gera, transforma e disponibiliza tabelas analíticas para simular um ambiente de vendas e logística.  

## 🎯 Objetivo  
- **Gerar dados sintéticos** de vendas, clientes e estoque  
- **Containerizar o ambiente** para facilitar deploy e reprodução  
- **Automatizar a transformação e validação dos dados**  
- **Construir um pipeline escalável** com Airflow e DBT  
- **Simular relatórios de BI** para análise de desempenho  

## 🧰 Stack Tecnológica  
- **Containers:** Docker + Docker Compose  
- **Orquestração:** Apache Airflow  
- **Transformação:** DBT (Data Build Tool)  
- **Armazenamento:** PostgreSQL dentro de um container  
- **Geração de Dados:** Faker, pandas  
- **Visualização (opcional):** Metabase, Power BI ou Streamlit  

## ⚙️ Estrutura do Projeto  

```plaintext
pipeline-airflow-dbt/
├── dags/                        # DAGs do Airflow (orquestração)
│   └── example_dag.py
├── dbt/                         # Projeto DBT (transformações analíticas)
│   ├── models/
│   │   └── example_model.sql
│   ├── seeds/
│   │   └── example_seed.csv
│   ├── dbt_project.yml
│   └── profiles.yml
├── data/                        # Dados em diferentes estágios
│   ├── raw/                     # Dados brutos
│   ├── processed/               # Dados processados/intermediários
│   └── analytics/               # Dados prontos para BI
├── src/                         # Código-fonte principal do projeto
│   ├── ingestion/               # Ingestão de dados
│   │   ├── __init__.py
│   │   ├── generate_data.py      # Script para geração de dados sintéticos
│   ├── processing/              # Limpeza e pré-processamento
│   │   ├── __init__.py
│   │   ├── cleaning.py
│   │   └── normalization.py
│   ├── transformation/          # Transformações fora do DBT
│   │   ├── __init__.py
│   │   ├── enrich.py
│   │   └── join.py
│   ├── validation/              # Validação e checagem de qualidade
│   │   ├── __init__.py
│   │   ├── schema_check.py
│   │   └── data_quality.py
│   ├── utils/                   # Funções utilitárias
│   │   ├── __init__.py
│   │   ├── logger.py
│   │   └── config.py
│   └── __init__.py
├── scripts/                     # Scripts auxiliares e pipelines
│   ├── run_pipeline.py
│   └── setup_env.py
├── tests/                       # Testes unitários e de integração
│   ├── ingestion/
│   │   └── test_generate_data.py # Teste para geração de dados sintéticos
│   ├── processing/
│   │   └── test_cleaning.py
│   ├── transformation/
│   │   └── test_enrich.py
│   ├── validation/
│   │   └── test_schema_check.py
│   └── utils/
│       └── test_logger.py
├── notebooks/                   # Notebooks para exploração e prototipagem
│   └── exploracao_dados.ipynb
├── configs/                     # Configurações e variáveis de ambiente
│   ├── config.yaml
│   └── .env.example
├── requirements.txt             # Dependências Python
├── docker-compose.yml           # Orquestração com Docker
└── README.md
