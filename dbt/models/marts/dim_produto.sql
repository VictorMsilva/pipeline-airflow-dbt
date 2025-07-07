{{ config(
  materialized='incremental',
  unique_key='id_produto'
) }}

SELECT
  p.id_produto,
  p.nome_produto,
  p.descricao,
  p.preco_unitario,
  cat.nome_categoria,
  f.nome_fornecedor,
  f.cidade_fornecedor,
  f.estado_fornecedor
FROM {{ ref('stg_produtos') }} p
LEFT JOIN {{ ref('stg_categorias') }} cat ON p.id_categoria = cat.id_categoria
LEFT JOIN {{ ref('stg_fornecedores') }} f ON p.id_fornecedor = f.id_fornecedor

{% if is_incremental() %}
WHERE p.id_produto NOT IN (SELECT id_produto FROM {{ this }})
{% endif %}