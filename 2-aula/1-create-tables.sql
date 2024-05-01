create table Ambulatorios
(
    nroa       int,
    andar      numeric(2) not null,
    capacidade smallint,
    primary key (nroa)
);

create table Medicos
(
    codm          int,
    nome          varchar(40) not null,
    idade         smallint    not null,
    cidade        varchar(40),
    CPF           numeric(11) not null unique,
    especialidade varchar(30),
    nroa          int,
    primary key (codm),
    foreign key (nroa) references Ambulatorios
);

create table Pacientes
(
    codp   int,
    nome   varchar(40) not null,
    idade  smallint    not null,
    cidade varchar(40),
    CPF    numeric(11) not null unique,
    doenca varchar(40) not null,
    primary key (codp)
);

create table Funcionarios
(
    codf    int,
    nome    varchar(40) not null,
    idade   smallint    not null,
    cidade  varchar(40),
    CPF     numeric(11) not null unique,
    salario numeric(10),
    primary key (codf)
);

create table Consultas
(
    codm int,
    codp int,
    data date,
    hora time,
    primary key (codm, codp, data),
    foreign key (codm) references Medicos,
    foreign key (codp) references Pacientes
);
