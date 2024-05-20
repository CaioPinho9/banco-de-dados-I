--Buscar o que se pede utilizando ORDER BY ou GROUP BY: 
--1) os dados de todos os funcionários ordenados pelo salário (decrescente) e pela idade (crescente). Buscar apenas os três primeiros funcionários nesta ordem 
SELECT * FROM funcionarios f ORDER BY f.salario DESC, f.idade LIMIT 5;

--2) o nome dos médicos e o número e andar do ambulatório onde eles atendem, ordenado pelo número do ambulatório 
SELECT m.nome, a.nroa, a.andar FROM medicos m JOIN ambulatorios a ON a.nroa = m.nroa ORDER BY nroa;

--3) andares dos ambulatórios e a capacidade total por andar 
SELECT a.andar, SUM(a.capacidade) FROM ambulatorios a GROUP BY a.andar;

--4) andares dos ambulatórios cuja média de capacidade no andar seja >= 40 
SELECT a.andar FROM ambulatorios a GROUP BY a.andar HAVING AVG(a.capacidade) >= 40;

--5) nome dos médicos que possuem mais de uma consulta marcada 
SELECT m.nome FROM medicos m JOIN consultas c ON m.codm = c.codm GROUP BY m.codm HAVING COUNT(m.codm) > 1;

--Realizar as seguintes atualizações: 
--6) excluir os ambulatórios que não possuem médicos atendendo neles 
DELETE
FROM ambulatorios a
WHERE NOT EXISTS (SELECT 1
                  FROM medicos m
                  WHERE a.nroa = m.nroa);

--7) o médico Pedro passa a residir na mesma cidade do paciente Paulo e sua idade passa a ser o dobro da idade da paciente Ana. Realizar essa alteração. 
UPDATE medicos m
SET cidade = (SELECT cidade FROM pacientes p WHERE p.nome = 'Paulo'),
    idade  = (SELECT p.idade * 2 FROM pacientes p WHERE p.nome = 'Ana')
WHERE m.nome = 'Pedro';

--8) o funcionário Caio (codf = 3) tornou-se médico. Sua especialidade é a mesma da médica Maria (codm = 2) e ele vai atender no mesmo ambulatório dela. Inserir Caio na tabela Médicos, aproveitando os dados em comum.
INSERT INTO medicos (codm, cpf, nome, idade, cidade, especialidade, nroa)
SELECT f.codf, f.cpf, f.nome, f.idade, f.cidade, m.especialidade, m.nroa
FROM funcionarios f, medicos m
WHERE f.codf = 3
  AND m.codm = 2;
