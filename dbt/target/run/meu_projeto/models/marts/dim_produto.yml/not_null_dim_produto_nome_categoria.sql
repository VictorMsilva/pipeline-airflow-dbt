select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select nome_categoria
from "empresa"."public"."dim_produto"
where nome_categoria is null



      
    ) dbt_internal_test