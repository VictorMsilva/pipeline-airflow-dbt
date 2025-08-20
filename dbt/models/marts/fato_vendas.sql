{{ config(
    materialized='incremental',
    unique_key='id_item_pedido'
) }}

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
FROM {{ ref('stg_itens_pedido') }} ip
JOIN {{ ref('stg_pedidos') }} p ON ip.id_pedido = p.id_pedido

{% if is_incremental() %}
WHERE p.data_pedido > (SELECT MAX(id_data_pedido) FROM {{ this }})
{% endif %}
