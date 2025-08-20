{{ config(
  materialized='incremental',
  unique_key='id_vendedor'
) }}

SELECT
  v.id_vendedor,
  v.nome,
  v.telefone,
  v.email,
  d.nome_departamento,
  v.data_contratacao
FROM {{ ref('stg_vendedores') }} v
LEFT JOIN {{ ref('stg_departamentos') }} d ON v.id_departamento = d.id_departamento

{% if is_incremental() %}
AND v.data_contratacao > (SELECT MAX(data_contratacao) FROM {{ this }})
{% endif %}
