select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select preco_unitario
from "empresa"."public"."dim_produto"
where preco_unitario is null



      
    ) dbt_internal_test