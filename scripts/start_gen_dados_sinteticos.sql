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

-- Departamentos (5 registros)
INSERT INTO departamentos (nome_departamento) VALUES
('Vendas'), ('Logística'), ('Financeiro'), ('Compras'), ('TI');

-- Categorias (20 registros)
INSERT INTO categorias (nome_categoria)
SELECT 'Categoria ' || id FROM generate_series(1, 20) AS id;

-- Fornecedores (50 registros)
INSERT INTO fornecedores (nome_fornecedor, telefone, email, cidade, estado)
SELECT 
    'Fornecedor ' || id AS nome_fornecedor,
    '11977' || LPAD(id::text, 4, '0') AS telefone,
    'fornecedor' || id || '@email.com' AS email,
    'São Paulo' AS cidade,
    'SP' AS estado
FROM generate_series(1, 50) AS id;

-- Produtos (500 registros)
INSERT INTO produtos (nome_produto, descricao, preco_unitario, id_categoria, id_fornecedor)
SELECT 
    'Produto ' || id AS nome_produto,
    'Descrição do produto ' AS descricao,
    ROUND((random() * 100)::numeric, 2) AS preco_unitario,
    (random() * 19 + 1)::int AS id_categoria,
    (random() * 49 + 1)::int AS id_fornecedor
FROM generate_series(1, 500) AS id;

-- Inserindo Pedidos (10.000)
INSERT INTO pedidos (id_cliente, id_vendedor, data_pedido, status_pedido)
SELECT 
    FLOOR(RANDOM() * 1000) + 1, -- Cliente aleatório
    FLOOR(RANDOM() * 100) + 1, -- Vendedor aleatório
    NOW() - INTERVAL '1 day' * FLOOR(RANDOM() * 1825), -- Data aleatória entre 2020 e 2025
    CASE WHEN RANDOM() > 0.75 THEN 'incompleto' ELSE 'completo' END -- 25% incompletos
FROM generate_series(1, 10000);

-- Inserindo Itens de Pedido (30.000)
INSERT INTO itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
SELECT 
    FLOOR(RANDOM() * 10000) + 1, -- Pedido aleatório
    FLOOR(RANDOM() * 500) + 1, -- Produto aleatório
    FLOOR(RANDOM() * 10) + 1, -- Quantidade entre 1 e 10
    ROUND((RANDOM() * 50 + 5)::numeric, 2) -- Preço entre R$5 e R$55
FROM generate_series(1, 30000);

-- Inserindo Pagamentos (10.000)
INSERT INTO pagamentos (id_pedido, data_pagamento, valor_pago, metodo_pagamento)
SELECT 
    id_pedido,
    data_pedido + INTERVAL '2 days', -- Pagamento dois dias após pedido
    (SELECT SUM(preco_unitario * quantidade) FROM itens_pedido WHERE itens_pedido.id_pedido = pedidos.id_pedido), -- Total do pedido
    CASE WHEN RANDOM() < 0.4 THEN 'cartão' WHEN RANDOM() < 0.7 THEN 'boleto' ELSE 'pix' END -- Métodos aleatórios
FROM pedidos;

-- Inserindo Avaliações (2.000)
INSERT INTO avaliacoes (id_cliente, id_pedido, nota, comentario, data_avaliacao)
SELECT 
    id_cliente, 
    id_pedido, 
    FLOOR(RANDOM() * 5) + 1, -- Nota entre 1 e 5
    CASE WHEN RANDOM() < 0.5 THEN 'Ótima experiência!' ELSE 'Pedido incompleto, mas atendimento bom.' END, -- Feedback aleatório
    data_pedido + INTERVAL '5 days' -- Avaliação após entrega
FROM pedidos
WHERE id_pedido % 5 = 0; -- 20% dos pedidos recebem avaliações

-- Inserindo Entregas (10.000)
INSERT INTO entregas (id_pedido, id_endereco, data_entrega, status_entrega)
SELECT 
    id_pedido,
    FLOOR(RANDOM() * 1200) + 1, -- Endereço aleatório
    data_pedido + INTERVAL '3 days', -- Entrega três dias após pedido
    CASE WHEN status_pedido = 'incompleto' THEN 'parcial' ELSE 'entregue' END -- Reflete problema de estoque
FROM pedidos;

-- Inserindo Estoque (500 produtos, abaixo da demanda)
INSERT INTO estoque (id_produto, quantidade_disponivel, quantidade_reservada, quantidade_vendida)
SELECT 
    id_produto,
    FLOOR(RANDOM() * 500), -- Estoque inicial abaixo da demanda
    FLOOR(RANDOM() * 1000), -- Reservado, indicando alta demanda
    FLOOR(RANDOM() * 1500) -- Vendido acima do estoque
FROM produtos;