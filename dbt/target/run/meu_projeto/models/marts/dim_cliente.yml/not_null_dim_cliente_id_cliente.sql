select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select id_cliente
from "empresa"."public"."dim_cliente"
where id_cliente is null



      
    ) dbt_internal_test