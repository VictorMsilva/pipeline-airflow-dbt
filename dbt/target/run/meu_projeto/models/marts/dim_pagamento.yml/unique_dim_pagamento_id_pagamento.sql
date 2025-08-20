select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    id_pagamento as unique_field,
    count(*) as n_records

from "empresa"."public"."dim_pagamento"
where id_pagamento is not null
group by id_pagamento
having count(*) > 1



      
    ) dbt_internal_test