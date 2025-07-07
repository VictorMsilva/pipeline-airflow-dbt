{{ config(
  materialized='incremental',
  unique_key='id_pagamento'
) }}

SELECT
  id_pagamento,
  metodo_pagamento
FROM {{ ref('stg_pagamentos') }}

{% if is_incremental() %}
WHERE id_pagamento NOT IN (SELECT id_pagamento FROM {{ this }})
{% endif %}

