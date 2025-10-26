-- 2) Apresente todas as comandas (código, data, mesa e nome do cliente)
-- e os itens da comanda (código comanda, nome do café, descricão,
-- quantidade, preço unitário e preço total do café) destas ordenados data
-- e código da comanda e, também o nome do café

SELECT 
    c.id_comanda,
    c.nr_mesa,
    c.nome_cliente,
    i.id_item_comanda,
    ca.nome_item AS nome_cafe,
    ca.descricao,
    i.quantidade,
    ca.preco_unitario,
    (i.quantidade * ca.preco_unitario) AS preco_total_cafe
FROM 
    comanda c
JOIN 
    item_comanda i ON c.id_comanda = i.id_comanda
JOIN 
    cardapio ca ON i.id_cardapio = ca.id_cardapio
ORDER BY 
    c.data,
    c.id_comanda,
    ca.nome_item;