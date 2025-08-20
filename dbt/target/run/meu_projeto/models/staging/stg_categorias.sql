
  create view "empresa"."public"."stg_categorias__dbt_tmp"
    
    
  as (
    SELECT
  id_categoria,
  nome_categoria
FROM categorias
  );