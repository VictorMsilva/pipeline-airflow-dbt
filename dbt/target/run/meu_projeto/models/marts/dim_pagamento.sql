
      
        
            delete from "empresa"."public"."dim_pagamento"
            where (
                id_pagamento) in (
                select (id_pagamento)
                from "dim_pagamento__dbt_tmp193914763452"
            );

        
    

    insert into "empresa"."public"."dim_pagamento" ("id_pagamento", "metodo_pagamento")
    (
        select "id_pagamento", "metodo_pagamento"
        from "dim_pagamento__dbt_tmp193914763452"
    )
  