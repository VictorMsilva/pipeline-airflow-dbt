select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id_entrega
from "empresa"."public"."dim_entrega"
where id_entrega is null



      
    ) dbt_internal_test