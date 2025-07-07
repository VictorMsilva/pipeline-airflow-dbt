
      
        
            delete from "empresa"."public"."fato_vendas"
            where (
                id_item_pedido) in (
                select (id_item_pedido)
                from "fato_vendas__dbt_tmp193914828806"
            );

        
    

    insert into "empresa"."public"."fato_vendas" ("id_item_pedido", "id_pedido", "id_cliente", "id_produto", "id_vendedor", "id_data_pedido", "quantidade", "preco_unitario", "valor_total")
    (
        select "id_item_pedido", "id_pedido", "id_cliente", "id_produto", "id_vendedor", "id_data_pedido", "quantidade", "preco_unitario", "valor_total"
        from "fato_vendas__dbt_tmp193914828806"
    )
  