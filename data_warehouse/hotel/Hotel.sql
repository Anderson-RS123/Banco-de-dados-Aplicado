-- tabela cliente
create table cliente (
    id_cliente serial primary key,
    nome varchar(100) not null,
    data_nascimento date not null,
    endereco varchar(100) not null,
    categoria_fidelidade varchar(20) not null,
    data_ultima_alteracao date
);

-- tabela hotel
create table hotel (
    id_hotel serial primary key,
    nome_hotel varchar(100) not null,
    cidade varchar(50),
    pais varchar(50),
    data_inauguracao date
);

-- tabela quarto
create table quarto (
    id_quarto serial primary key,
    id_hotel int references hotel(id_hotel),
    tipo_quarto varchar(20) not null,
    status_manutencao varchar(20) not null,
    data_ultima_reforma date
);

-- tabela receitas
create table receitas (
    id_hotel int references hotel(id_hotel),
    data date,
    receita_total_diaria numeric(10, 2),
    despesas_operacionais_diarias numeric(10, 2),
    primary key (id_hotel, data)
);

-- tabela reserva
create table reserva (
    id_reserva serial primary key,
    id_cliente int references cliente(id_cliente),
    id_hotel int references hotel(id_hotel),
    id_quarto int references quarto(id_quarto),
    data_checkin date not null,
    data_checkout date not null,
    valor_total numeric(10, 2)
);

-- inserindo 12 registros na tabela cliente
insert into cliente (nome, data_nascimento, endereco, categoria_fidelidade, data_ultima_alteracao) values
('joão silva', '1990-01-15', 'rua a, 123', 'bronze', '2024-01-01'),
('maria oliveira', '1985-05-23', 'rua b, 456', 'ouro', '2024-02-15'),
('carlos souza', '1992-07-19', 'rua c, 789', 'prata', '2024-03-10'),
('ana costa', '1988-11-01', 'rua d, 101', 'platina', '2024-04-05'),
('lucas pereira', '1995-03-30', 'rua e, 202', 'bronze', '2024-05-12'),
('fernanda alves', '1993-08-14', 'rua f, 303', 'ouro', '2024-06-18'),
('roberto lima', '1991-10-22', 'rua g, 404', 'prata', '2024-07-20'),
('juliana cardoso', '1986-12-05', 'rua h, 505', 'platina', '2024-08-15'),
('marcos dias', '1989-02-17', 'rua i, 606', 'bronze', '2024-09-10'),
('patricia santos', '1987-06-09', 'rua j, 707', 'ouro', '2024-10-20'),
('rafael mendes', '1994-04-27', 'rua k, 808', 'prata', '2024-11-05'),
('camila nascimento', '1996-09-13', 'rua l, 909', 'platina', '2024-12-01');

-- inserindo 12 registros na tabela hotel
insert into hotel (nome_hotel, cidade, pais, data_inauguracao) values
('hotel sol', 'são paulo', 'brasil', '2000-01-01'),
('hotel mar', 'rio de janeiro', 'brasil', '2005-03-15'),
('hotel céu', 'curitiba', 'brasil', '2010-07-20'),
('hotel montanha', 'porto alegre', 'brasil', '2012-10-10'),
('hotel estrela', 'florianópolis', 'brasil', '2015-01-25'),
('hotel lua', 'fortaleza', 'brasil', '2017-05-14'),
('hotel neblina', 'manaus', 'brasil', '2019-08-30'),
('hotel praia', 'salvador', 'brasil', '2021-11-05'),
('hotel campo', 'brasilia', 'brasil', '2018-04-12'),
('hotel natureza', 'recife', 'brasil', '2020-09-22'),
('hotel amanhecer', 'belem', 'brasil', '2022-03-15'),
('hotel ventania', 'natal', 'brasil', '2023-06-18');

-- inserindo 12 registros na tabela quarto
insert into quarto (id_hotel, tipo_quarto, status_manutencao, data_ultima_reforma) values
(1, 'standard', 'disponível', '2023-01-01'),
(1, 'luxo', 'em manutenção', '2023-02-15'),
(2, 'suíte', 'disponível', '2023-03-10'),
(2, 'standard', 'disponível', '2023-04-05'),
(3, 'luxo', 'disponível', '2023-05-12'),
(1, 'suíte', 'em manutenção', '2023-06-18'),
(4, 'standard', 'disponível', '2023-07-20'),
(4, 'luxo', 'disponível', '2023-08-15'),
(5, 'suíte', 'em manutenção', '2023-09-10'),
(6, 'standard', 'disponível', '2023-10-20'),
(6, 'luxo', 'disponível', '2023-11-05'),
(6, 'suíte', 'disponível', '2023-12-01');

-- inserindo 12 registros na tabela receitas
insert into receitas (id_hotel, data, receita_total_diaria, despesas_operacionais_diarias) values
(1, '2024-01-01', 5000.00, 1500.00),
(1, '2024-01-02', 5200.00, 1600.00),
(2, '2024-01-01', 4800.00, 1400.00),
(2, '2024-01-02', 4900.00, 1450.00),
(3, '2024-01-01', 4500.00, 1300.00),
(3, '2024-01-02', 4600.00, 1350.00),
(4, '2024-01-01', 5500.00, 1550.00),
(4, '2024-01-02', 5700.00, 1650.00),
(5, '2024-01-01', 6000.00, 1700.00),
(5, '2024-01-02', 6200.00, 1800.00),
(6, '2024-01-01', 5300.00, 1500.00),
(6, '2024-01-02', 5400.00, 1550.00);

-- inserindo 12 registros na tabela reserva
insert into reserva (id_cliente, id_hotel, id_quarto, data_checkin, data_checkout, valor_total) values
(1, 1, 1, '2024-01-01', '2024-01-05', 2000.00),
(1, 2, 2, '2024-02-01', '2024-02-06', 2500.00),
(2, 1, 1, '2024-03-01', '2024-03-05', 2200.00),
(3, 3, 3, '2024-04-01', '2024-04-07', 3000.00),
(4, 3, 4, '2024-05-01', '2024-05-06', 2700.00),
(5, 4, 5, '2024-06-01', '2024-06-05', 3100.00),
(6, 4, 6, '2024-07-01', '2024-07-07', 3500.00),
(7, 5, 7, '2024-08-01', '2024-08-05', 1800.00),
(8, 5, 8, '2024-09-01', '2024-09-06', 2600.00),
(9, 6, 9, '2024-10-01', '2024-10-07', 3400.00),
(10, 6, 10, '2024-11-01', '2024-11-05', 2300.00),
(11, 2, 2, '2024-12-01', '2024-12-05', 2900.00);

-- construindo o dw

CREATE TABLE dim_receita (
                sk_receita INTEGER primary key,
                receita NUMERIC(10,2) NOT NULL,
                data DATE NOT NULL,
                nm_hotel VARCHAR NOT NULL,
                cidade VARCHAR NOT NULL,
                pais VARCHAR NOT NULL
);


CREATE TABLE dim_quarto (
                sk_quarto serial primary key,
                id_quarto INTEGER NOT NULL,
                nm_hotel VARCHAR NOT NULL,
                cidade VARCHAR NOT NULL,
                pais VARCHAR NOT NULL,
                tipo_quarto VARCHAR NOT NULL,
                status_manutencao VARCHAR NOT NULL,
                dt_ultima_reforma DATE NOT NULL,
                dt_inicio DATE NOT NULL,
                dt_final DATE NOT NULL,
                situacao VARCHAR NOT NULL
);


CREATE TABLE dim_cliente (
                sk_id_cliente serial primary key,
                id_cliente INTEGER NOT NULL,
                nome VARCHAR NOT NULL,
                dt_nascimento DATE NOT NULL,
                endereco VARCHAR NOT NULL,
                categoria VARCHAR NOT NULL,
                dt_inicial DATE NOT NULL,
                dt_final DATE NOT NULL,
                situacao VARCHAR NOT NULL
);


CREATE TABLE dim_tempo (
                sk_data serial primary key,
                data DATE NOT NULL
);


CREATE TABLE fato_reserva (
                sk_fato_reserva serial primary key,
                sk_data integer NOT NULL,
                sk_receita INTEGER NOT NULL,
                sk_id_cliente INTEGER NOT NULL,
                sk_quarto INTEGER NOT NULL
);


-- inserindo dados na tabela dim_tempo
insert into dim_tempo (data) 
select distinct r.data from receitas r;

-- inserindo dados na tabela dim_cliente
insert into dim_cliente (id_cliente, nome, dt_nascimento, endereco, categoria, dt_inicial, dt_final, situacao)
select 
    c.id_cliente, 
    c.nome, 
    c.data_nascimento, 
    c.endereco, 
    c.categoria_fidelidade, 
    min(c.data_ultima_alteracao) over (partition by c.id_cliente), 
    max(c.data_ultima_alteracao) over (partition by c.id_cliente),
    'ativo' 
from cliente c;

-- inserindo dados na tabela dim_receita
insert into dim_receita (sk_receita, receita, data, nm_hotel, cidade, pais)
select 
    row_number() over (order by r.id_hotel, r.data) as sk_receita,
    r.receita_total_diaria, 
    r.data, 
    h.nome_hotel, 
    h.cidade, 
    h.pais
from receitas r
join hotel h on r.id_hotel = h.id_hotel;

-- inserindo dados na tabela dim_quarto
insert into dim_quarto (id_quarto, nm_hotel, cidade, pais, tipo_quarto, status_manutencao, dt_ultima_reforma, dt_inicio, dt_final, situacao)
select 
    q.id_quarto,
    h.nome_hotel, 
    h.cidade, 
    h.pais, 
    q.tipo_quarto, 
    q.status_manutencao, 
    q.data_ultima_reforma,
    case when r.data_checkin is null then '2024/11/09'
     when r.data_checkin is not null then r.data_checkin
    end dt_inicio,
    case when r.data_checkout is null then '2024/11/09'
     when r.data_checkout is not null then r.data_checkout
    end dt_final,
    'disponível' 
from quarto q
join hotel h on q.id_hotel = h.id_hotel
left join reserva r on r.id_quarto = q.id_quarto;


-- inserindo dados na tabela fato_reserva
insert into fato_reserva (sk_fato_reserva, sk_data, sk_receita, sk_id_cliente, sk_quarto)
select 
    row_number() over (order by r.id_reserva) as sk_fato_reserva,
    t.sk_data,  
    re.sk_receita,
    c.sk_id_cliente,
    q.sk_quarto
from reserva r
left join dim_cliente c on c.id_cliente = r.id_cliente
left join dim_tempo t on t.sk_data = t.sk_data  -- t.data é do tipo DATE, r.data_checkin também é do tipo DATE
left join dim_receita re on re.nm_hotel = (select h.nome_hotel from hotel h where h.id_hotel = r.id_hotel)
left join dim_quarto q on q.id_quarto = r.id_quarto;


-- perguntas a serem respondidas
--1. Qual é a receita média por cliente em cada categoria de fidelidade?
select 
	dc.nome as "Nome",
    dc.categoria AS "categoria_fidelidade",
    AVG(dr.receita) AS "receita_media"
from fato_reserva fr
left join dim_cliente dc ON fr.sk_id_cliente = dc.sk_id_cliente
left join dim_receita dr ON fr.sk_receita = dr.sk_receita
group bydc.categoria, fr.sk_id_cliente, dc.nome
order by "categoria_fidelidade" desc;


-- 2. Quais hotéis possuem as taxas de ocupação mais altas em um período específico?
select  
    dq.nm_hotel as "Nome Hotel",
    COUNT(fr.sk_fato_reserva) * 100.0 / COUNT(dq.sk_quarto) AS "ocupacao porcentual"
from  fato_reserva fr
left join dim_quarto dq ON fr.sk_quarto = dq.sk_quarto
left join dim_tempo dt ON fr.sk_data = dt.sk_data
where dt.data between '2024-01-01' and '2024-12-31'
group by dq.nm_hotel
order by "ocupacao porcentual" desc;


-- 3. Qual a média de tempo que os clientes de uma determinada categoria de fidelidade permanecem nos hotéis?
select 
    dc.categoria AS "Categoria",
    AVG(e.dt_final - e.dt_inicio) AS "Media de permanência"
from  fato_reserva fr
left join dim_cliente dc ON fr.sk_id_cliente = dc.sk_id_cliente
left join dim_quarto e ON fr.sk_quarto = e.sk_quarto
where dc.categoria = 'platina' 
group by dc.categoria;


-- 4. Quais quartos são mais frequentemente reformados, e com que frequência?

select 
	dq.nm_hotel AS "Nome do Hotel",
    dq.id_quarto AS "id quarto",
    COUNT(dq.dt_ultima_reforma) AS "Frequência de reformas"
from dim_quarto dq
group by dq.id_quarto, dq.nm_hotel
order by "Frequência de reformas" desc;


-- 5. Qual o perfil dos clientes com maior gasto em reservas por país e categoria de fidelidade?
-- Por pais não consegui gerar relatorio pois os clientes não tem essa informacao
select 
	dc.endereco as "endereco",
	dc.categoria as "categoria",
	dr.receita as "receita"
from fato_reserva fr
left join dim_cliente dc on fr.sk_id_cliente = dc.sk_id_cliente
left join dim_receita dr on fr.sk_receita = dr.sk_receita
group by dc.categoria, dc.endereco, dr.sk_receita
order by dc.categoria, dr.receita desc;
