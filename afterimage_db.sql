create database bd_julia;

use bd_julia;

create table professores_senac(
	id int primary key,
    nome varchar(255),
    email varchar(255) unique not null,
    idade int
);

drop table professores_senac;

insert into professores_senac(id, nome, email, idade)
values (1, 'victor hugo lopes', 'vitor@gmail,com', 29),
(2, 'rafaela egues', 'rafa@gmail,com', 25);

delete from professores_senac where id = 1;

describe professores_senac;

select * from professores_senac;

insert into professores_senac(id, nome, email, idade)
values (3, 'bruno de portugues', 'bruno@portugues.com', 28);

select id, nome from professores_senac
where id = 3;

select id, nome from professores_senac
where nome like '%tor%' or (idade<27 and idade>20);

alter table professores_senac
add column genero varchar(255);

alter table professores_senac
drop column genero;

alter table professores_senac
change genero genero enum('masculino', 'feminino', 'não binário');

update professores_senac
set genero = 'masculino' where id = 3;

update professores_senac
set genero = 'feminino' where id = 2;

alter table professores_senac add column formacao
enum('graduação', 'especialização', 'mestrado', 'doutorado')
default 'graduação';

alter table professores_senac
change id id int auto_increment;

select upper(nome) from professores_senac;

-- comentário --

select sum(idade) from professores_senac;

select avg(idade) from professores_senac;

select count(*) from professores_senac
where genero = 'feminino';

select min(idade) from professores_senac;

select curdate()
from dual;

select datediff(curdate(), '2020-02-10')
from dual;

select concat('O professor ', nome, ' tem ', idade, ' anos')
from professores_senac;

create database relational_db;
use relational_db;

create table relational_user(
	id varchar(255) primary key,
    name varchar(255)
);

create table relational_account(
	id int primary key,
    balance float,
    user_id varchar(255),
    foreign key (user_id) references relational_user(id)
);

insert into relational_user(id, name) values
('a', 'User A'),
('b', 'User B');

insert into relational_account (id, balance, user_id) values
(857452, 140000, 'a'),
(255566, 5200000, 'b');

select * from relational_account;

create database afterimage_db;
use afterimage_db;

create table users(
	id int auto_increment primary key,
    username varchar(255) unique not null,
    nome varchar(255) not null,
    email varchar(255) unique not null,
    senha varchar(255) not null,
    instituicao boolean
);

create table posts(
	id int auto_increment primary key,
    user_id int,
    foreign key (user_id) references users(id),
    img varchar(255) not null,
    titulo varchar(255) not null,
    descricao varchar(255),
    data_publicao timestamp,
    dia int,
    mes int,
    ano int, 
    decada int,
    seculo int,
    sensitive_content boolean not null
);

create table tags(
	id int auto_increment primary key,
    tag_text varchar(255) unique not null,
    post_id int,
    foreign key (post_id) references posts(id)
);



