

SELECT
  c.id_cliente,
  c.nome,
  c.tipo_cliente,
  c.telefone,
  c.email,
  e.cidade,
  e.estado,
  c.data_cadastro
FROM "empresa"."public"."stg_clientes" c
JOIN "empresa"."public"."stg_enderecos" e ON c.id_cliente = e.id_cliente
WHERE e.tipo_endereco = 'residencial'

