--4) Faça a mesma listagem das comandas da questão anterior (3),
--mas traga apenas as comandas que possuem mais do que um tipo de café na comanda;

SELECT 
    c.id_comanda,
    c.data,
    c.nr_mesa,
    c.nome_cliente,
    STRING_AGG(ca.nome_item, ', ') AS cafes,
    SUM(i.quantidade * ca.preco_unitario) AS valor_total_comanda
FROM 
    comanda c
JOIN 
    item_comanda i ON c.id_comanda = i.id_comanda
JOIN 
    cardapio ca ON i.id_cardapio = ca.id_cardapio
GROUP BY 
    c.id_comanda, c.data, c.nr_mesa, c.nome_cliente
HAVING 
    COUNT(DISTINCT i.id_cardapio) > 1
ORDER BY 
    c.data;



