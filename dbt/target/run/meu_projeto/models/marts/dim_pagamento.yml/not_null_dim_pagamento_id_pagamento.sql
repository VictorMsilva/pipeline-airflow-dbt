select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id_pagamento
from "empresa"."public"."dim_pagamento"
where id_pagamento is null



      
    ) dbt_internal_test