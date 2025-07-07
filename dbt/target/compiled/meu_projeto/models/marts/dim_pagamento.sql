

SELECT
  id_pagamento,
  metodo_pagamento
FROM "empresa"."public"."stg_pagamentos"


WHERE id_pagamento NOT IN (SELECT id_pagamento FROM "empresa"."public"."dim_pagamento")
