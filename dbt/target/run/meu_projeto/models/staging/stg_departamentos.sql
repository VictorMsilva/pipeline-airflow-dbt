
  create view "empresa"."public"."stg_departamentos__dbt_tmp"
    
    
  as (
    SELECT
  id_departamento,
  nome_departamento
FROM departamentos
  );