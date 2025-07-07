SELECT
  id_entrega,
  id_pedido,
  id_endereco,
  data_entrega,
  status_entrega
FROM entregas
WHERE status_entrega IN ('entregue', 'parcial', 'pendente')
