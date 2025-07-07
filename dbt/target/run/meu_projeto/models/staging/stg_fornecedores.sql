
  create view "empresa"."public"."stg_fornecedores__dbt_tmp"
    
    
  as (
    SELECT
  id_fornecedor,
  nome_fornecedor,
  cidade AS cidade_fornecedor,
  estado AS estado_fornecedor
FROM fornecedores
  );