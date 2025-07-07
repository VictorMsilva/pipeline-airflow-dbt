
  create view "empresa"."public"."stg_produtos__dbt_tmp"
    
    
  as (
    SELECT
  id_produto,
  nome_produto,
  descricao,
  preco_unitario,
  id_categoria,
  id_fornecedor
FROM produtos
WHERE preco_unitario > 0
  );