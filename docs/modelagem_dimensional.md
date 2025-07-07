
# 📦 Modelagem Dimensional – Projeto Vendas

## 🧠 Processo de Negócio
Venda de produtos por clientes, registrados em pedidos e entregues em endereços, com pagamentos e avaliações.

## 📏 Grão da Fato Principal
Cada linha representa um item vendido em um pedido.

## 📊 Tabela Fato: fato_vendas

- id_item_pedido
- id_pedido
- id_cliente
- id_produto
- id_vendedor
- id_data_pedido
- quantidade
- preco_unitario
- valor_total

## 🧩 Tabelas de Dimensão

### dim_cliente
- id_cliente
- nome
- tipo_cliente
- telefone
- email
- cidade
- estado
- data_cadastro

### dim_produto
- id_produto
- nome_produto
- descricao
- preco_unitario
- nome_categoria
- nome_fornecedor
- cidade_fornecedor
- estado_fornecedor

### dim_vendedor
- id_vendedor
- nome
- telefone
- email
- nome_departamento
- data_contratacao

### dim_data
- id_data
- data
- dia
- mês
- ano
- trimestre
- dia_da_semana
- feriado

## ⭐ Star Schema

Representação visual da modelagem dimensional proposta

![Esquema Estrela – Modelagem Dimensional](star_schema_retail_wholesale.png)


