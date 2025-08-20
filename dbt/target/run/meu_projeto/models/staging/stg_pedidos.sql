
  create view "empresa"."public"."stg_pedidos__dbt_tmp"
    
    
  as (
    SELECT
  id_pedido,
  id_cliente,
  id_vendedor,
  data_pedido
FROM pedidos
  );