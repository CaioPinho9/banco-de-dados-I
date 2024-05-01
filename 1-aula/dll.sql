create table ambulatorios
(
    nroa       int        not null primary key,
    andar      numeric(2) not null,
    capacidade smallint
);
create table medicos
(
    codm          int         not null primary key,
    nome          varchar(50) not null,
    idade         smallint    not null,
    cidade        varchar(40),
    cpf           numeric(11) not null unique,
    especialidade varchar(30),
    nroa          int,
    FOREIGN KEY (nroa) REFERENCES ambulatorios (nroa)
);
create table pacientes
(
    codp   int         not null primary key,
    nome   varchar(40) not null,
    idade  smallint    not null,
    cidade varchar(40),
    cpf    numeric(11) not null unique,
    doenca varchar(40) not null
);
create table funcionarios
(
    codf    int         not null primary key,
    nome    varchar(40) not null,
    idade   smallint    not null,
    cidade  varchar(40),
    cpf     numeric(11) not null unique,
    salario numeric(10) not null,
    cargo   varchar(40)
);
create table consultas
(
    codm int,
    codp int,
    data date,
    hora time,
    PRIMARY KEY (codm, codp, data),
    FOREIGN KEY (codm) REFERENCES medicos (codm),
    FOREIGN KEY (codp) REFERENCES pacientes (codp)
);
alter table funcionarios
    drop column cargo;
create index idx_cidade on pacientes (cidade);
