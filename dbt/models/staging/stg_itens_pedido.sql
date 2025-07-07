SELECT
  id_item_pedido,
  id_pedido,
  id_produto,
  quantidade,
  preco_unitario
FROM itens_pedido
WHERE quantidade > 0 AND preco_unitario > 0
