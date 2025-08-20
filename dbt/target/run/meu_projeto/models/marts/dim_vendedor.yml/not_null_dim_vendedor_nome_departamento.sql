select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    



select nome_departamento
from "empresa"."public"."dim_vendedor"
where nome_departamento is null



      
    ) dbt_internal_test