select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

with all_values as (

    select
        tipo_cliente as value_field,
        count(*) as n_records

    from "empresa"."public"."dim_cliente"
    group by tipo_cliente

)

select *
from all_values
where value_field not in (
    'atacado','varejo'
)



      
    ) dbt_internal_test