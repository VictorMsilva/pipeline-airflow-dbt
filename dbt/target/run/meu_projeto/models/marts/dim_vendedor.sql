
      
        
            delete from "empresa"."public"."dim_vendedor"
            where (
                id_vendedor) in (
                select (id_vendedor)
                from "dim_vendedor__dbt_tmp193914960079"
            );

        
    

    insert into "empresa"."public"."dim_vendedor" ("id_vendedor", "nome", "telefone", "email", "nome_departamento", "data_contratacao")
    (
        select "id_vendedor", "nome", "telefone", "email", "nome_departamento", "data_contratacao"
        from "dim_vendedor__dbt_tmp193914960079"
    )
  