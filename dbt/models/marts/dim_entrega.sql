{{ config(
  materialized='incremental',
  unique_key='id_entrega'
) }}

SELECT
  ent.id_entrega,
  ent.status_entrega,
  ende.cidade,
  ende.estado
FROM {{ ref('stg_entregas') }} ent
LEFT JOIN {{ ref('stg_enderecos') }} ende
  ON ent.id_endereco = ende.id_endereco

{% if is_incremental() %}
AND ent.id_entrega NOT IN (SELECT id_entrega FROM {{ this }})
{% endif %}
