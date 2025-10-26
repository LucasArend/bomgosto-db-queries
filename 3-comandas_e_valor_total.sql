--3) Liste todas as comandas (código, data, mesa e nome do cliente)
--mais uma coluna com o valor total da comanda. Ordene por data esta listagem;

SELECT 
    c.id_comanda,
    c.data,
    c.nr_mesa,
    c.nome_cliente,
    SUM(i.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM 
    comanda c
JOIN 
    item_comanda i ON c.id_comanda = i.id_comanda
JOIN 
    cardapio ca ON i.id_cardapio = ca.id_cardapio
GROUP BY 
    c.id_comanda, c.data, c.nr_mesa, c.nome_cliente
ORDER BY 
    c.data;
