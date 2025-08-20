
      
  
    

  create  table "empresa"."public"."dim_pagamento"
  
  
    as
  
  (
    

SELECT
  id_pagamento,
  metodo_pagamento
FROM "empresa"."public"."stg_pagamentos"


  );
  
  