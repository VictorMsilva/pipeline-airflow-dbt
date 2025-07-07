SELECT
  id_cliente,
  TRIM(LOWER(nome)) AS nome,
  tipo_cliente,
  telefone,
  LOWER(email) AS email,
  data_cadastro
FROM clientes
WHERE id_cliente IS NOT NULL