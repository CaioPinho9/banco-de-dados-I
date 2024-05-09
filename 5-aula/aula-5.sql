-- Resolva o que se pede utilizando subconsultas [NOT] IN:
-- 1) nome dos pacientes com consultas marcadas após às 14 horas
SELECT nome
FROM (SELECT nome, codp FROM pacientes) p
WHERE codp IN (SELECT codp FROM consultas WHERE hora > '14:00:00');

-- 2) nome e idade dos médicos que possuem consulta com a paciente Ana
SELECT m.nome, m.idade
FROM (SELECT nome, idade, codm FROM medicos) m
WHERE codm IN (SELECT codm
               FROM (SELECT codm, codp FROM consultas) c
               JOIN (SELECT codp, nome FROM pacientes WHERE nome = 'Ana') p ON c.codp = p.codp);

-- 3) número e andar dos ambulatórios onde nenhum médico dá atendimento
SELECT a.nroa, a.andar
FROM (SELECT nroa, andar FROM ambulatorios) a
WHERE a.nroa NOT IN (SELECT nroa FROM medicos);

-- Resolva o que se pede utilizando subconsultas SOME e/ou ALL:
-- 4) CPF dos médicos que atendem em ambulatórios do primeiro andar
SELECT m.cpf
FROM medicos m
WHERE m.nroa = SOME (SELECT nroa FROM ambulatorios WHERE andar = 1);

-- 5) nome e CPF de todos os funcionários, exceto o de maior salário
SELECT f.nome, f.cpf
FROM (SELECT nome, cpf, salario FROM funcionarios) AS f
WHERE f.salario < SOME (SELECT salario FROM funcionarios);

-- 6) nome dos pacientes com consultas marcadas para horários anteriores a todos os horários de consultas marcadas para o dia 14/10/2020
SELECT p.nome
FROM (SELECT nome, codp FROM pacientes) p
JOIN (SELECT codp, hora FROM consultas) c ON p.codp = c.codp
WHERE c.hora < ALL (SELECT hora FROM consultas WHERE data = '2020-10-14');

-- 7) número e andar dos ambulatórios com capacidade superior à capacidade de qualquer ambulatório que esteja no primeiro andar
SELECT a.nroa, a.andar
FROM ambulatorios a
WHERE a.capacidade > ALL (SELECT capacidade FROM ambulatorios WHERE andar = 1);
