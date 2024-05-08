CREATE TABLE ambulatorios
(
    nroa       INT,
    andar      NUMERIC(2) NOT NULL,
    capacidade SMALLINT,
    PRIMARY KEY (nroa)
);

CREATE TABLE medicos
(
    codm          INT,
    nome          VARCHAR(40) NOT NULL,
    idade         SMALLINT    NOT NULL,
    cidade        VARCHAR(40),
    cpf           NUMERIC(11) NOT NULL UNIQUE,
    especialidade VARCHAR(30),
    nroa          INT,
    PRIMARY KEY (codm),
    FOREIGN KEY (nroa) REFERENCES ambulatorios
);

CREATE TABLE pacientes
(
    codp   INT,
    nome   VARCHAR(40) NOT NULL,
    idade  SMALLINT    NOT NULL,
    cidade VARCHAR(40),
    cpf    NUMERIC(11) NOT NULL UNIQUE,
    doenca VARCHAR(40) NOT NULL,
    PRIMARY KEY (codp)
);

CREATE TABLE funcionarios
(
    codf    INT,
    nome    VARCHAR(40) NOT NULL,
    idade   SMALLINT    NOT NULL,
    cidade  VARCHAR(40),
    cpf     NUMERIC(11) NOT NULL UNIQUE,
    salario NUMERIC(10),
    PRIMARY KEY (codf)
);

CREATE TABLE consultas
(
    codm INT,
    codp INT,
    data DATE,
    hora TIME,
    PRIMARY KEY (codm, codp, data),
    FOREIGN KEY (codm) REFERENCES medicos,
    FOREIGN KEY (codp) REFERENCES pacientes
);
