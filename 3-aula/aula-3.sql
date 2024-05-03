-- 1) Buscar os dados dos médicos com menos de 40 anos ou com especialidade diferente de traumatologia
SELECT * FROM medicos WHERE especialidade != 'traumatologia' AND idade < 40;

-- 2) Buscar o nome e a idade dos pacientes que não residem em Florianópolis
SELECT nome, idade FROM pacientes WHERE cidade != 'Florianopolis';

-- 3) Buscar o nome e a idade (em meses) dos pacientes
SELECT nome, idade * 12 FROM pacientes;

-- 4) Qual o horário da última consulta marcada para o dia 13/10/2020?
SELECT hora AS horario FROM consultas WHERE data = '2020/10/13' ORDER BY hora DESC LIMIT 1;

-- 5) Qual a média de idade dos médicos e o total de ambulatórios atendidos por eles?
SELECT AVG(idade) AS media_de_idade, COUNT(nroa) AS total_de_ambulatorios FROM medicos;

-- 6) Buscar o código, o nome e o salário líquido dos funcionários. O salário líquido é o salário cadastrado menos 20%
SELECT codf AS codigo, nome, salario * 0.8 AS salario_liquido FROM funcionarios;

-- 7) Buscar o nome dos funcionários que terminam com a letra 'a'
SELECT nome FROM funcionarios WHERE nome LIKE '%a';

-- 8) Buscar o nome e a especialidade dos médicos cuja segunda e a última letra de seus nomes seja a letra 'o'
SELECT nome, especialidade FROM medicos WHERE SUBSTRING(nome, 2, 1) = 'o' AND RIGHT(nome, 1) = 'o';

-- 9) Buscar os códigos e nomes dos pacientes com mais de 25 anos que estão com tendinite, fratura, gripe ou sarampo
SELECT codp AS codigo, nome FROM pacientes WHERE idade > 25 AND doenca IN ('tendinite', 'fratura', 'gripe', 'sarampo');

-- 10) Buscar os CPFs, nomes e idades de todas as pessoas (médicos, pacientes ou funcionários) que residem em Florianópolis
SELECT cpf, nome, idade
FROM pacientes
WHERE cidade = 'Florianopolis'
UNION ALL
SELECT cpf, nome, idade
FROM medicos
WHERE cidade = 'Florianopolis'
UNION ALL
SELECT cpf, nome, idade
FROM funcionarios
WHERE cidade = 'Florianopolis';
