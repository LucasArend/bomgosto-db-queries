--
-- PostgreSQL database dump
--

\restrict uFMSDaRLsK3Gdzld78yUU6cbZbSG3VwqcV03MwLidhOu62VIhH4jXyyFIa1uvl9

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-10-26 14:56:00

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16423)
-- Name: cardapio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cardapio (
    id_cardapio integer NOT NULL,
    nome_item character varying(100) NOT NULL,
    descricao text,
    preco_unitario numeric(10,2) NOT NULL
);


ALTER TABLE public.cardapio OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16418)
-- Name: comanda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comanda (
    id_comanda integer NOT NULL,
    data date NOT NULL,
    nr_mesa integer NOT NULL,
    nome_cliente character varying(100) NOT NULL
);


ALTER TABLE public.comanda OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16432)
-- Name: item_comanda; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item_comanda (
    id_item_comanda integer NOT NULL,
    quantidade integer NOT NULL,
    id_comanda integer NOT NULL,
    id_cardapio integer NOT NULL
);


ALTER TABLE public.item_comanda OWNER TO postgres;

--
-- TOC entry 4905 (class 0 OID 16423)
-- Dependencies: 218
-- Data for Name: cardapio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cardapio (id_cardapio, nome_item, descricao, preco_unitario) FROM stdin;
1	cafe	com gás	10.50
2	cafe com leite	sem formol	5.50
3	cappuccino	café com leite e espuma de leite	7.50
4	expresso	café puro, forte	6.00
5	latte	café com leite e um toque de baunilha	8.00
6	mocha	café com chocolate	9.00
7	americano	café filtrado	5.00
\.


--
-- TOC entry 4904 (class 0 OID 16418)
-- Dependencies: 217
-- Data for Name: comanda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comanda (id_comanda, data, nr_mesa, nome_cliente) FROM stdin;
1	2025-10-04	5	Ronaldo
2	2025-10-04	2	Diego
3	2025-10-05	3	Ana
4	2025-10-05	1	Bruno
5	2025-10-06	4	Carla
6	2025-10-06	2	Daniel
\.


--
-- TOC entry 4906 (class 0 OID 16432)
-- Dependencies: 219
-- Data for Name: item_comanda; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.item_comanda (id_item_comanda, quantidade, id_comanda, id_cardapio) FROM stdin;
1	3	2	2
2	4	1	1
3	2	3	1
4	1	3	3
5	3	4	2
6	2	4	4
7	1	5	5
8	1	5	6
9	2	5	7
10	2	6	3
11	1	6	4
\.


--
-- TOC entry 4752 (class 2606 OID 16431)
-- Name: cardapio cardapio_nome_item_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_nome_item_key UNIQUE (nome_item);


--
-- TOC entry 4754 (class 2606 OID 16429)
-- Name: cardapio cardapio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cardapio
    ADD CONSTRAINT cardapio_pkey PRIMARY KEY (id_cardapio);


--
-- TOC entry 4750 (class 2606 OID 16422)
-- Name: comanda comanda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comanda
    ADD CONSTRAINT comanda_pkey PRIMARY KEY (id_comanda);


--
-- TOC entry 4756 (class 2606 OID 16436)
-- Name: item_comanda item_comanda_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_comanda
    ADD CONSTRAINT item_comanda_pkey PRIMARY KEY (id_item_comanda);


--
-- TOC entry 4757 (class 2606 OID 16442)
-- Name: item_comanda item_comanda_id_cardapio_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_comanda
    ADD CONSTRAINT item_comanda_id_cardapio_fkey FOREIGN KEY (id_cardapio) REFERENCES public.cardapio(id_cardapio);


--
-- TOC entry 4758 (class 2606 OID 16437)
-- Name: item_comanda item_comanda_id_comanda_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item_comanda
    ADD CONSTRAINT item_comanda_id_comanda_fkey FOREIGN KEY (id_comanda) REFERENCES public.comanda(id_comanda);


-- Completed on 2025-10-26 14:56:00

--
-- PostgreSQL database dump complete
--

\unrestrict uFMSDaRLsK3Gdzld78yUU6cbZbSG3VwqcV03MwLidhOu62VIhH4jXyyFIa1uvl9

