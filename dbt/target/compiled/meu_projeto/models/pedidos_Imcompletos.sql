SELECT
    p.id_pedido,
    c.nome AS cliente,
    p.data_pedido,
    SUM(ip.preco_unitario * ip.quantidade) AS valor_total
FROM pedidos p
JOIN clientes c ON p.id_cliente = c.id_cliente
JOIN itens_pedido ip ON p.id_pedido = ip.id_pedido
WHERE p.status_pedido = 'incompleto'
GROUP BY p.id_pedido, c.nome, p.data_pedido