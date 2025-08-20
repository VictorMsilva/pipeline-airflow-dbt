SELECT
    c.id_cliente,
    c.nome,
    COUNT(p.id_pedido) AS total_pedidos,
    SUM(pg.valor_pago) AS total_pago
FROM clientes c
LEFT JOIN pedidos p ON c.id_cliente = p.id_cliente
LEFT JOIN pagamentos pg ON p.id_pedido = pg.id_pedido
GROUP BY c.id_cliente, c.nome