

SELECT
  p.id_produto,
  p.nome_produto,
  p.descricao,
  p.preco_unitario,
  cat.nome_categoria,
  f.nome_fornecedor,
  f.cidade_fornecedor,
  f.estado_fornecedor
FROM "empresa"."public"."stg_produtos" p
LEFT JOIN "empresa"."public"."stg_categorias" cat ON p.id_categoria = cat.id_categoria
LEFT JOIN "empresa"."public"."stg_fornecedores" f ON p.id_fornecedor = f.id_fornecedor

