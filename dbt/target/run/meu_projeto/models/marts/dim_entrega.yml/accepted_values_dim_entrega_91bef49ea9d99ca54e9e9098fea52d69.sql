select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        status_entrega as value_field,
        count(*) as n_records

    from "empresa"."public"."dim_entrega"
    group by status_entrega

)

select *
from all_values
where value_field not in (
    'entregue','parcial','pendente'
)



      
    ) dbt_internal_test