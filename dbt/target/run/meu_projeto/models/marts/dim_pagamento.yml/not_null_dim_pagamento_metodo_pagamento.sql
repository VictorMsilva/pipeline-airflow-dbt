select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select metodo_pagamento
from "empresa"."public"."dim_pagamento"
where metodo_pagamento is null



      
    ) dbt_internal_test