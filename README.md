# ☕ BomGosto - Consultas SQL

Este repositório contém o conjunto de **consultas SQL** desenvolvidas para o exercício da **Cafeteria BomGosto**, cujo objetivo é controlar as vendas de café realizadas por meio de **comandas**.  

O projeto foi desenvolvido utilizando **PostgreSQL**, e o backup do banco de dados utilizado está disponível no arquivo:  
`BD_BomGosto.sql`.

---

## Estrutura do Banco de Dados

O banco possui três tabelas principais:

1. **cardapio**
   - `id_cardapio` (PK)
   - `nome_item` (nome do café, único)
   - `descricao` (detalhes do café)
   - `preco_unitario` (valor do café)

2. **comanda**
   - `id_comanda` (PK)
   - `data` (data da comanda)
   - `nr_mesa` (número da mesa)
   - `nome_cliente` (nome do cliente)

3. **item_comanda**
   - `id_item_comanda` (PK)
   - `quantidade` (quantidade do café)
   - `id_comanda` (FK para comanda)
   - `id_cardapio` (FK para cardápio)

Regras:
- Não é possível inserir o mesmo código de café mais de uma vez na mesma comanda.  
- Cada comanda pode conter vários tipos de café.

---

## 🧠 Questões Resolvidas

### 1️⃣ Listagem do cardápio
> Faça uma listagem do cardápio ordenada por nome.

### 2️⃣ Comandas com seus itens
> Apresente todas as comandas (código, data, mesa e nome do cliente) e os itens da comanda  
> (código comanda, nome do café, descrição, quantidade, preço unitário e preço total do café).  
> Ordene por data, código da comanda e nome do café.

### 3️⃣ Valor total das comandas
> Liste todas as comandas (código, data, mesa e nome do cliente) mais uma coluna com o valor total da comanda.  
> Ordene por data.

### 4️⃣ Comandas com mais de um tipo de café
> Faça a mesma listagem da questão anterior, mas traga apenas as comandas que possuem mais de um tipo de café.

### 5️⃣ Faturamento por data
> Qual o total de faturamento por data? Ordene por data.

---

## 🗂️ Estrutura do Repositório

```
📁 bomgosto-db-queries/
│
├── 🗄️ BD_BomGosto.sql          # Backup do banco de dados PostgreSQL
├── 🧩 query1.sql               # Resposta da questão 1
├── 🧩 query2.sql               # Resposta da questão 2
├── 🧩 query3.sql               # Resposta da questão 3
├── 🧩 query4.sql               # Resposta da questão 4
├── 🧩 query5.sql               # Resposta da questão 5
└── README.md
```

---

## 💾 Como Usar

1. **Restaure o banco de dados** no PostgreSQL:
   ```bash
   psql -U postgres -f BD_BomGosto.sql
   ```
2. **Execute as consultas** individualmente no seu editor SQL favorito (como pgAdmin ou DBeaver).

---

## 🧰 Tecnologias Utilizadas

- 🐘 **PostgreSQL**
- 💻 **SQL**
- 📄 **pgAdmin / DBeaver** (para execução das queries)

---

## 🔗 Repositório

[👉 Acesse o projeto no GitHub](https://github.com/LucasArend/bomgosto-db-queries)

---

### ✍️ Autor
**Lucas Arend Maciel**  
📧 [GitHub Profile](https://github.com/LucasArend)
