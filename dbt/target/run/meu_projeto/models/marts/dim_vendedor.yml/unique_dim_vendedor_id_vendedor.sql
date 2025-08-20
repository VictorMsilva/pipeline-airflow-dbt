select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    id_vendedor as unique_field,
    count(*) as n_records

from "empresa"."public"."dim_vendedor"
where id_vendedor is not null
group by id_vendedor
having count(*) > 1



      
    ) dbt_internal_test