select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    id_produto as unique_field,
    count(*) as n_records

from "empresa"."public"."dim_produto"
where id_produto is not null
group by id_produto
having count(*) > 1



      
    ) dbt_internal_test