-- Tabela Fato: Vendas
CREATE TABLE fato_vendas (
	id_item_pedido INT PRIMARY KEY,
	id_pedido INT,
	id_cliente INT,
	id_produto INT,
	id_vendedor INT,
	id_data_pedido DATE,
	quantidade INT,
	preco_unitario DECIMAL(10,2),
	valor_total DECIMAL(10,2)
);

-- Dimensão Cliente
CREATE TABLE dim_cliente (
	id_cliente INT PRIMARY KEY,
	nome VARCHAR(255),
	tipo_cliente VARCHAR(20),
	telefone VARCHAR(20),
	email VARCHAR(255),
	cidade VARCHAR(100),
	estado VARCHAR(50),
	data_cadastro DATE
);

-- Dimensão Produto
CREATE TABLE dim_produto (
	id_produto INT PRIMARY KEY,
	nome_produto VARCHAR(255),
	descricao TEXT,
	preco_unitario DECIMAL(10,2),
	nome_categoria VARCHAR(255),
	nome_fornecedor VARCHAR(255),
	cidade_fornecedor VARCHAR(100),
	estado_fornecedor VARCHAR(50)
);

-- Dimensão Vendedor
CREATE TABLE dim_vendedor (
	id_vendedor INT PRIMARY KEY,
	nome VARCHAR(255),
	telefone VARCHAR(20),
	email VARCHAR(255),
	nome_departamento VARCHAR(255),
	data_contratacao DATE
);

-- Dimensão Data
CREATE TABLE dim_data (
	id_data DATE PRIMARY KEY,
	dia INT,
	mes INT,
	ano INT,
	trimestre VARCHAR(5),
	dia_da_semana VARCHAR(15),
	feriado BOOLEAN
);
