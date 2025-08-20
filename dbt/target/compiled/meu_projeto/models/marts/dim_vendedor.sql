

SELECT
  v.id_vendedor,
  v.nome,
  v.telefone,
  v.email,
  d.nome_departamento,
  v.data_contratacao
FROM "empresa"."public"."stg_vendedores" v
LEFT JOIN "empresa"."public"."stg_departamentos" d ON v.id_departamento = d.id_departamento

