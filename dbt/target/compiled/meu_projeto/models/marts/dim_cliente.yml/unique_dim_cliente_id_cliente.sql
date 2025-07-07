
    
    

select
    id_cliente as unique_field,
    count(*) as n_records

from "empresa"."public"."dim_cliente"
where id_cliente is not null
group by id_cliente
having count(*) > 1


