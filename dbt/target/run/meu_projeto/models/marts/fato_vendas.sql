
      
  
    

  create  table "empresa"."public"."fato_vendas"
  
  
    as
  
  (
    

SELECT
  ip.id_item_pedido,
  ip.id_pedido,
  p.id_cliente,
  ip.id_produto,
  p.id_vendedor,
  p.data_pedido AS id_data_pedido,
  ip.quantidade,
  ip.preco_unitario,
  ip.quantidade * ip.preco_unitario AS valor_total
FROM "empresa"."public"."stg_itens_pedido" ip
JOIN "empresa"."public"."stg_pedidos" p ON ip.id_pedido = p.id_pedido


  );
  
  