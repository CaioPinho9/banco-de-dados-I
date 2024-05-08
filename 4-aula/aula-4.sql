-- Responda o que se pede utilizando junção (não natural):
-- 1) Buscar o nome e CPF dos médicos que também são pacientes do hospital
SELECT m.nome, m.cpf
FROM (SELECT nome, cpf FROM medicos) AS m
JOIN (SELECT cpf FROM pacientes) AS p ON m.cpf = p.cpf;

-- 2) Buscar nomes de funcionários e de médicos (exibir pares de nomes) que residem na mesma cidade
SELECT f.nome, m.nome
FROM (SELECT nome, cidade FROM funcionarios) AS f
JOIN (SELECT nome, cidade FROM medicos) AS m ON f.cidade = m.cidade;

-- 3) Buscar o nome e idade dos médicos que têm consulta marcada com a paciente cujo nome é Ana
SELECT m.nome, m.idade
FROM (SELECT codm, nome, idade FROM medicos) AS m
JOIN (SELECT codm, codp FROM consultas) AS c ON m.codm = c.codm
JOIN (SELECT codp, nome FROM pacientes) AS p ON c.codp = p.codp
WHERE p.nome = 'Ana';

-- 4) Buscar o número dos ambulatórios que estão no mesmo andar do ambulatório 5
SELECT a.nroa
FROM (SELECT nroa, andar FROM ambulatorios) AS a
WHERE a.andar = (SELECT andar FROM ambulatorios WHERE nroa = 5);

-- Responda o que se pede utilizando junção natural:
-- 5) Buscar o código e o nome dos pacientes com consulta marcada para horários após às 14 horas
SELECT p.codp, p.nome
FROM (SELECT codp, nome FROM pacientes) AS p
NATURAL JOIN (SELECT codp FROM consultas WHERE hora > '14:00:00') AS c;

-- 6) Buscar o número e o andar dos ambulatórios cujos médicos possuem consultas marcadas para o dia 12/10/2020
SELECT a.nroa, a.andar
FROM (SELECT nroa, andar FROM ambulatorios) AS a
NATURAL JOIN (SELECT codm, nroa FROM medicos) AS m
NATURAL JOIN (SELECT codm FROM consultas WHERE data = '12/10/2020') AS c;

-- Responda o que se pede utilizando junção externa (e também junção, se necessário):
-- 7) Buscar os dados de todos os ambulatórios e, para aqueles ambulatórios onde médicos dão atendimento, exibir também os códigos e nomes destes médicos
SELECT a.nroa, m.codm, m.nome
FROM (SELECT nroa FROM ambulatorios) AS a
LEFT JOIN (SELECT nroa, codm, nome FROM medicos) AS m ON a.nroa = m.nroa;

-- 8) Buscar o CPF e o nome de todos os médicos e, para aqueles médicos que possuem consultas marcadas, exibir também o nome dos paciente e a data da consulta
SELECT m.cpf, m.nome, p.nome, c.data
FROM (SELECT codm, cpf, nome FROM medicos) AS m
LEFT JOIN (SELECT codm, codp, data FROM consultas) AS c ON m.codm = c.codm
LEFT JOIN (SELECT codp, nome FROM pacientes) AS p ON c.codp = p.codp;
