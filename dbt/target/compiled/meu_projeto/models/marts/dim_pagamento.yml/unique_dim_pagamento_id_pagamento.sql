
    
    

select
    id_pagamento as unique_field,
    count(*) as n_records

from "empresa"."public"."dim_pagamento"
where id_pagamento is not null
group by id_pagamento
having count(*) > 1


