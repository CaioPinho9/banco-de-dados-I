CREATE TABLE ambulatorios
(
    nroa       INT        NOT NULL PRIMARY KEY,
    andar      NUMERIC(2) NOT NULL,
    capacidade SMALLINT
);
CREATE TABLE medicos
(
    codm          INT         NOT NULL PRIMARY KEY,
    nome          VARCHAR(50) NOT NULL,
    idade         SMALLINT    NOT NULL,
    cidade        VARCHAR(40),
    cpf           NUMERIC(11) NOT NULL UNIQUE,
    especialidade VARCHAR(30),
    nroa          INT,
    FOREIGN KEY (nroa) REFERENCES ambulatorios (nroa)
);
CREATE TABLE pacientes
(
    codp   INT         NOT NULL PRIMARY KEY,
    nome   VARCHAR(40) NOT NULL,
    idade  SMALLINT    NOT NULL,
    cidade VARCHAR(40),
    cpf    NUMERIC(11) NOT NULL UNIQUE,
    doenca VARCHAR(40) NOT NULL
);
CREATE TABLE funcionarios
(
    codf    INT         NOT NULL PRIMARY KEY,
    nome    VARCHAR(40) NOT NULL,
    idade   SMALLINT    NOT NULL,
    cidade  VARCHAR(40),
    cpf     NUMERIC(11) NOT NULL UNIQUE,
    salario NUMERIC(10) NOT NULL,
    cargo   VARCHAR(40)
);
CREATE TABLE consultas
(
    codm INT,
    codp INT,
    data DATE,
    hora TIME,
    PRIMARY KEY (codm, codp, data),
    FOREIGN KEY (codm) REFERENCES medicos (codm),
    FOREIGN KEY (codp) REFERENCES pacientes (codp)
);
ALTER TABLE funcionarios
    DROP COLUMN cargo;
CREATE INDEX idx_cidade ON pacientes (cidade);
