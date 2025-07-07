
    
    

select
    id_entrega as unique_field,
    count(*) as n_records

from "empresa"."public"."dim_entrega"
where id_entrega is not null
group by id_entrega
having count(*) > 1


