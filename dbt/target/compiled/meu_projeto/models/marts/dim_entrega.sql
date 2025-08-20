

SELECT
  ent.id_entrega,
  ent.status_entrega,
  ende.cidade,
  ende.estado
FROM "empresa"."public"."stg_entregas" ent
LEFT JOIN "empresa"."public"."stg_enderecos" ende
  ON ent.id_endereco = ende.id_endereco

