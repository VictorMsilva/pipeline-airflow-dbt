
      
        
            delete from "empresa"."public"."dim_entrega"
            where (
                id_entrega) in (
                select (id_entrega)
                from "dim_entrega__dbt_tmp193914670886"
            );

        
    

    insert into "empresa"."public"."dim_entrega" ("id_entrega", "status_entrega", "cidade", "estado")
    (
        select "id_entrega", "status_entrega", "cidade", "estado"
        from "dim_entrega__dbt_tmp193914670886"
    )
  