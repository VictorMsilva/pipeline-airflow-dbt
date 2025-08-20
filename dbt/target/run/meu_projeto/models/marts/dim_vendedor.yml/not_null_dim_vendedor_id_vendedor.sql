select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id_vendedor
from "empresa"."public"."dim_vendedor"
where id_vendedor is null



      
    ) dbt_internal_test