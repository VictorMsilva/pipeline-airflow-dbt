
  create view "empresa"."public"."stg_vendedores__dbt_tmp"
    
    
  as (
    SELECT
  id_vendedor,
  nome,
  telefone,
  email,
  id_departamento,
  data_contratacao
FROM vendedores
  );