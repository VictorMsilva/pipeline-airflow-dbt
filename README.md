# pipeline-airflow-dbt

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-vicmo-blue?logo=linkedin)](https://www.linkedin.com/in/seu-perfil)
[![GitHub](https://img.shields.io/badge/GitHub-vicmo-black?logo=github)](https://github.com/seu-usuario)

## 🏗️ Visão Geral

Pipeline de ingestão e transformação de dados públicos utilizando Airflow e DBT. O objetivo é automatizar a coleta, limpeza e disponibilização de dados abertos de fontes como IBGE, Ministério da Saúde e Brasil.io, facilitando análises e relatórios reprodutíveis.

## 📌 Resumo do Projeto

Criar um pipeline de dados completo e modular para ingestão, transformação e disponibilização de dados abertos, utilizando ferramentas modernas da stack de engenharia de dados.

## 🩺 Contexto e Problema

Órgãos públicos como o IBGE, Ministério da Saúde e plataformas como http://Brasil.io  oferecem grandes volumes de dados úteis, mas disponibilizam essas informações de forma despadronizada: CSVs separados por ano, APIs com formatos inconsistentes e campos mal documentados.

Organizações ou analistas que desejam usar esses dados para monitorar tendências (ex: COVID, preços, população) enfrentam desafios como:

* Ingestão manual ou pouco confiável
* Falta de automação e versionamento
* Transformações repetitivas e sem rastreabilidade
* Baixa reprodutibilidade de relatórios e análises

Este projeto resolve esse problema criando um pipeline automatizado, rastreável e testável para transformar os dados brutos em tabelas limpas e analíticas, prontas para uso em BI.

## 🛠️ Tecnologias Utilizadas

- [Apache Airflow](https://airflow.apache.org/)
- [DBT (Data Build Tool)](https://www.getdbt.com/)
- Python 3.x
- Docker (opcional para orquestração)
- Outras dependências listadas em `requirements.txt`

## 📁 Estrutura do Projeto

```
pipeline-airflow-dbt/
├── dags/                # DAGs do Airflow
├── dbt/                 # Projeto DBT
├── data/                # Dados brutos e processados
├── scripts/             # Scripts auxiliares
├── requirements.txt     # Dependências Python
├── docker-compose.yml   # (Opcional) Orquestração com Docker
└── README.md
```

## 🚀 Como Executar

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/pipeline-airflow-dbt.git
   cd pipeline-airflow-dbt
   ```

2. **(Opcional, mas recomendado) Crie e ative um ambiente virtual**
   ```bash
   python3 -m venv .venv
   source .venv/bin/activate
   ```

3. **Instale as dependências**
   ```bash
   pip install -r requirements.txt
   ```

4. **Configure variáveis de ambiente**  
   (Exemplo: crie um arquivo `.env` com as credenciais necessárias)

5. **Inicie o Airflow**
   ```bash
   airflow db init
   airflow webserver --port 8080
   airflow scheduler
   ```

6. **Execute o pipeline**
   - Acesse o Airflow em [localhost:8080](http://localhost:8080)
   - Ative e execute a DAG desejada

7. **Transforme os dados com DBT**
   ```bash
   cd dbt
   dbt run
   dbt test
   ```

## 💡 Exemplo de Uso

Após executar o pipeline, as tabelas limpas estarão disponíveis para análise em ferramentas de BI ou notebooks Python.

## 🤝 Contribuição

Contribuições são bem-vindas!  
Abra uma issue ou envie um pull request.

## 📄 Licença

Este projeto está licenciado sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

---
Desenvolvido por [Seu Nome](https://www.linkedin.com/in/seu-perfil)


## Estrutura de Pastas Sugeridas.

## 📁 Estrutura Completa do Projeto

```
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
│   │   ├── ibge.py
│   │   ├── ministerio_saude.py
│   │   └── brasilio.py
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
│   │   └── test_ibge.py
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
```

## 🛠️ Como preparar o ambiente manualmente

Para criar a estrutura de pastas e arquivos recomendados e instalar as dependências, siga os passos abaixo:

1. **Crie as pastas do projeto:**
   ```bash
   mkdir -p dags dbt/models dbt/seeds data/raw data/processed data/analytics \
   src/ingestion src/processing src/transformation src/validation src/utils \
   scripts tests/ingestion tests/processing tests/transformation tests/validation tests/utils \
   notebooks configs
   ```

2. **Crie os arquivos iniciais:**
   ```bash
   touch dbt/dbt_project.yml dbt/profiles.yml \
   src/ingestion/__init__.py src/ingestion/ibge.py src/ingestion/ministerio_saude.py src/ingestion/brasilio.py \
   src/processing/__init__.py src/processing/cleaning.py src/processing/normalization.py \
   src/transformation/__init__.py src/transformation/enrich.py src/transformation/join.py \
   src/validation/__init__.py src/validation/schema_check.py src/validation/data_quality.py \
   src/utils/__init__.py src/utils/logger.py src/utils/config.py src/__init__.py \
   scripts/run_pipeline.py scripts/setup_env.py \
   tests/ingestion/test_ibge.py tests/processing/test_cleaning.py tests/transformation/test_enrich.py \
   tests/validation/test_schema_check.py tests/utils/test_logger.py \
   notebooks/exploracao_dados.ipynb configs/config.yaml configs/.env.example \
   README.md requirements.txt docker-compose.yml dags/example_dag.py dbt/models/example_model.sql dbt/seeds/example_seed.csv
   ```

3. **Instale as dependências necessárias usando [uv](https://github.com/astral-sh/uv):**
   - Certifique-se de estar com o ambiente virtual ativado.
   - Instale as dependências listadas em `requirements.txt`:
     ```bash
     uv pip install -r requirements.txt
     ```
   - Se ainda não existir um `requirements.txt`, adicione as principais dependências do projeto:
     ```bash
     uv pip install apache-airflow dbt-core dbt-postgres pandas python-dotenv requests
     uv pip freeze > requirements.txt
     ```

Esses comandos criam toda a estrutura de diretórios e arquivos vazios recomendados para o projeto, além de instalar as dependências essenciais com o `uv`, que é mais rápido que o pip.

