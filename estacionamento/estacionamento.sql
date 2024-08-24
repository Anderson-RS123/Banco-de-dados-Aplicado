create table tipoVeiculo(
	id serial primary key,
	nome varchar(100) 
);

create table vaga (
    id serial primary key,
    tipo int,
    numero int not null unique,
    foreign key (tipo) references tipoVeiculo (id)
);

create table usuario (
    id serial primary key,
    nome varchar(100) not null,
    CPF char(11) not null unique
);


create table carro (
    id serial primary key,
    placa varchar(20) not null,
    modelo varchar(50) not null,
    idUsuario int,
    foreign key (idUsuario) references usuario (id)
);


create table agendamento (
    id serial primary key,
    data date not null,
    idUsuario int,
    idCarro int,
    idVaga int,
    foreign key (idUsuario) references usuario (id),
    foreign key (idCarro) references carro (id),
    foreign key (idVaga) references vaga (id)
);

insert into tipoveiculo (nome)
values ('SUV'), ('Carro'), ('Moto'), ('Truck'), ('Bi-Trem');



insert into usuario (nome, CPF)
values ('Ana Silva', '12345678901'), 
       ('João Oliveira', '23456789012'), 
       ('Maria Santos', '34567890123'),  
	   ('Marcos Silva', '42632434812'), 
       ('Bruno Dias', '42347293744');
    

insert into vaga (tipo, numero)
values (2, 1), 
       (3, 2), 
       (1, 3),
       (5, 4), 
       (4, 5); 
   

insert into carro (placa, modelo, idUsuario)
values ('ABC1234', 'Fusca', 1),  
       ('XYZ5678', 'Civic', 2),  
       ('LMN9012', 'Corolla', 3), 
	   ('IER7E45', 'GOL', 4),  
       ('QWO7854', 'S10', 2); 
    

insert into agendamento (data, idUsuario, idCarro, idVaga)
values ('2024-08-20', 1, 1, 1),  
       ('2024-08-21', 2, 2, 2),  
       ('2024-08-22', 3, 3, 4),  
       ('2024-08-23', 5, 1, 5),
       ('2024-08-24', 4, 4, 3);

-- 6.1
select * from tipoveiculo t;
select * from agendamento a;
select * from carro c;

-- 6.2
select v.numero, t.nome from vaga v 
inner join tipoveiculo t on v.id = t.id;

-- 6.3
select c.placa, c.modelo, u.nome, u.cpf, a."data" from carro c
left join usuario u on c.id = u.id
left join agendamento a on u.id = a.idusuario;

-- 6.4
select a."data", u.nome, c.placa, v.numero from agendamento a 
left join usuario u on a.idusuario = u.id 
left join carro c on a.idcarro = c.id 
left join vaga v on a.idvaga = v.id;

-- 6.5
select v.numero, u.cpf, a."data" from agendamento a 
right join usuario u on a.idusuario = u.id
right join vaga v on a.idvaga = v.id;

-- 6.6
select c.placa, c.modelo, u.nome, u.cpf, a."data" from carro c
full outer join usuario u on c.id = u.id
full outer join agendamento a on u.id = a.idusuario;

-- 6.7
select a."data", u.nome, c.placa, v.numero from agendamento a 
full outer join usuario u on a.idusuario = u.id 
full outer join carro c on a.idcarro = c.id
full outer join vaga v on a.idvaga = v.id;

alter table tipoveiculo 
add column custoDiario float;
select * from tipoveiculo t ;

update tipoveiculo t set custodiario = 200 where id = 1;
update tipoveiculo t set custodiario = 190 where id = 2;
update tipoveiculo t set custodiario = 100 where id = 3;
update tipoveiculo t set custodiario = 280 where id = 4;
update tipoveiculo t set custodiario = 350 where id = 5;

-- 9.1
select max(custodiario) from tipoveiculo t;

-- 9.2
select min(custodiario) from tipoveiculo t;

-- 9.3
select avg(custodiario) from tipoveiculo t;

-- 9.4
select sum(custodiario) from tipoveiculo t;

-- 9.5	
select count(numero) from vaga v;

-- 9 Group By  - descobrir o custo de cada placa gasto nesses 5 dias
select c.placa, sum(t.custodiario) from agendamento a 
inner join carro c on a.idCarro = c.id
inner join vaga v on a.idVaga = v.id
inner join tipoVeiculo t on v.tipo = t.id
group by c.placa;

-- 10 having
select a.id, a."data", u.nome, u.cpf, c.placa, c.modelo, v.numero, t.nome, t.custodiario from agendamento a
inner join usuario u on a.idusuario = u.id 
inner join carro c on a.idcarro = c.id 
inner join vaga v on a.idvaga = v.id 
inner join tipoveiculo t on v.tipo = t.id  
group by a.id, u.id, c.id, v.id, t.id
having c.id = 1
