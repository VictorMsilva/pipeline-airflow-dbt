{{ config(
    materialized='incremental',
    unique_key='id_cliente'
) }}

SELECT
  c.id_cliente,
  c.nome,
  c.tipo_cliente,
  c.telefone,
  c.email,
  e.cidade,
  e.estado,
  c.data_cadastro
FROM {{ ref('stg_clientes') }} c
JOIN {{ ref('stg_enderecos') }} e ON c.id_cliente = e.id_cliente
WHERE e.tipo_endereco = 'residencial'

{% if is_incremental() %}
AND c.data_cadastro > (SELECT MAX(data_cadastro) FROM {{ this }})
{% endif %}
