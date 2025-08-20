-- Criando tabelas
CREATE TABLE clientes (
	id_cliente SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	tipo_cliente VARCHAR(20) CHECK (tipo_cliente IN ('varejo', 'atacado')),
	telefone VARCHAR(20),
	email VARCHAR(255),
	data_cadastro DATE
);

CREATE TABLE enderecos (
	id_endereco SERIAL PRIMARY KEY,
	id_cliente INT,
	rua VARCHAR(255),
	numero VARCHAR(10),
	bairro VARCHAR(100),
	cidade VARCHAR(100),
	estado VARCHAR(50),
	cep VARCHAR(20),
	tipo_endereco VARCHAR(20) CHECK (tipo_endereco IN ('residencial', 'comercial')),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

CREATE TABLE vendedores (
	id_vendedor SERIAL PRIMARY KEY,
	nome VARCHAR(255),
	telefone VARCHAR(20),
	email VARCHAR(255),
	data_contratacao DATE,
	id_departamento INT
);

CREATE TABLE departamentos (
	id_departamento SERIAL PRIMARY KEY,
	nome_departamento VARCHAR(255)
);

CREATE TABLE produtos (
	id_produto SERIAL PRIMARY KEY,
	nome_produto VARCHAR(255),
	descricao TEXT,
	preco_unitario DECIMAL(10,2),
	id_categoria INT,
	id_fornecedor INT
);

CREATE TABLE categorias (
	id_categoria SERIAL PRIMARY KEY,
	nome_categoria VARCHAR(255)
);

CREATE TABLE fornecedores (
	id_fornecedor SERIAL PRIMARY KEY,
	nome_fornecedor VARCHAR(255),
	telefone VARCHAR(20),
	email VARCHAR(255),
	cidade VARCHAR(100),
	estado VARCHAR(50)
);

CREATE TABLE pedidos (
	id_pedido SERIAL PRIMARY KEY,
	id_cliente INT,
	id_vendedor INT,
	data_pedido DATE,
	status_pedido VARCHAR(20) CHECK (status_pedido IN ('completo', 'incompleto')),
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_vendedor) REFERENCES vendedores(id_vendedor)
);

CREATE TABLE itens_pedido (
	id_item_pedido SERIAL PRIMARY KEY,
	id_pedido INT,
	id_produto INT,
	quantidade INT,
	preco_unitario DECIMAL(10,2),
	FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
	FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

CREATE TABLE pagamentos (
	id_pagamento SERIAL PRIMARY KEY,
	id_pedido INT,
	data_pagamento DATE,
	valor_pago DECIMAL(10,2),
	metodo_pagamento VARCHAR(20) CHECK (metodo_pagamento IN ('cartão', 'boleto', 'pix')),
	FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

CREATE TABLE avaliacoes (
	id_avaliacao SERIAL PRIMARY KEY,
	id_cliente INT,
	id_pedido INT,
	nota INT CHECK (nota BETWEEN 1 AND 5),
	comentario TEXT,
	data_avaliacao DATE,
	FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
	FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido)
);

CREATE TABLE entregas (
	id_entrega SERIAL PRIMARY KEY,
	id_pedido INT,
	id_endereco INT,
	data_entrega DATE,
	status_entrega VARCHAR(20) CHECK (status_entrega IN ('entregue', 'parcial', 'pendente')),
	FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
	FOREIGN KEY (id_endereco) REFERENCES enderecos(id_endereco)
);

CREATE TABLE estoque (
	id_estoque SERIAL PRIMARY KEY,
	id_produto INT,
	quantidade_disponivel INT,
	quantidade_reservada INT,
	quantidade_vendida INT,
	FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);

-- Inserindo dados sintéticos

-- Clientes (1.000 registros)
INSERT INTO clientes (nome, tipo_cliente, telefone, email, data_cadastro)
SELECT 
	'Cliente ' || id AS nome,
	CASE WHEN id % 2 = 0 THEN 'varejo' ELSE 'atacado' END AS tipo_cliente,
	'11999' || LPAD(id::text, 4, '0') AS telefone,
	'cliente' || id || '@email.com' AS email,
	DATE '2020-01-01' + (random() * 1825)::int AS data_cadastro
FROM generate_series(1, 1000) AS id;

-- Endereços (1.200 registros)
INSERT INTO enderecos (id_cliente, rua, numero, bairro, cidade, estado, cep, tipo_endereco)
SELECT 
	(random() * 999 + 1)::int AS id_cliente,
	'Rua ' || (random() * 499)::int AS rua,
	((random() * 998)::int + 1)::text AS numero,
	'Bairro ' || (random() * 99)::int AS bairro,
	'São Paulo' AS cidade,
	'SP' AS estado,
	LPAD((random() * 99999)::int::text, 5, '0') || '-' || LPAD((random() * 999)::int::text, 3, '0') AS cep,
	CASE WHEN random() > 0.5 THEN 'residencial' ELSE 'comercial' END AS tipo_endereco
FROM generate_series(1, 1200);

-- Vendedores (100 registros)
INSERT INTO vendedores (nome, telefone, email, data_contratacao, id_departamento)
SELECT 
	'Vendedor ' || id AS nome,
	'11988' || LPAD(id::text, 4, '0') AS telefone,
	'vendedor' || id || '@email.com' AS email,
	DATE '2019-01-01' + (random() * 1825)::int AS data_contratacao,
	(random() * 4 + 1)::int AS id_departamento
FROM generate_series(1, 100) AS id;

