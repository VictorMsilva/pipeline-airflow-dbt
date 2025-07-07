
      
        
            delete from "empresa"."public"."dim_produto"
            where (
                id_produto) in (
                select (id_produto)
                from "dim_produto__dbt_tmp193914893385"
            );

        
    

    insert into "empresa"."public"."dim_produto" ("id_produto", "nome_produto", "descricao", "preco_unitario", "nome_categoria", "nome_fornecedor", "cidade_fornecedor", "estado_fornecedor")
    (
        select "id_produto", "nome_produto", "descricao", "preco_unitario", "nome_categoria", "nome_fornecedor", "cidade_fornecedor", "estado_fornecedor"
        from "dim_produto__dbt_tmp193914893385"
    )
  