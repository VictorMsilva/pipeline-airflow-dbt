
      
        
            delete from "empresa"."public"."dim_cliente"
            where (
                id_cliente) in (
                select (id_cliente)
                from "dim_cliente__dbt_tmp193914569965"
            );

        
    

    insert into "empresa"."public"."dim_cliente" ("id_cliente", "tipo_cliente", "telefone", "data_cadastro", "nome", "email", "cidade", "estado")
    (
        select "id_cliente", "tipo_cliente", "telefone", "data_cadastro", "nome", "email", "cidade", "estado"
        from "dim_cliente__dbt_tmp193914569965"
    )
  