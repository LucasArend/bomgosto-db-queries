--5)Qual o total de faturamento por data? ordene por data esta consulta.

SELECT 
    c.data,
    SUM(i.quantidade * ca.preco_unitario) AS faturamento_total
FROM 
    comanda c
JOIN 
    item_comanda i ON c.id_comanda = i.id_comanda
JOIN 
    cardapio ca ON i.id_cardapio = ca.id_cardapio
GROUP BY 
    c.data
ORDER BY 
    c.data;



