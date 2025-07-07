SELECT
  id_endereco,
  id_cliente,
  TRIM(LOWER(cidade)) AS cidade,
  TRIM(LOWER(estado)) AS estado,
  tipo_endereco
FROM enderecos
WHERE id_cliente IS NOT NULL
