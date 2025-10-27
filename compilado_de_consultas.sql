--1) Faça uma listagem do cardápio ordenada por nome;
SELECT 
*
FROM 
    cardapio
ORDER BY 
    nome_item;


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



