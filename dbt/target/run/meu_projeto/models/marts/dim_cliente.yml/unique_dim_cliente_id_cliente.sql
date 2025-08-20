select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    id_cliente as unique_field,
    count(*) as n_records

from "empresa"."public"."dim_cliente"
where id_cliente is not null
group by id_cliente
having count(*) > 1



      
    ) dbt_internal_test