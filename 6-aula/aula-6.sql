-- Responda utilizando subconsultas com EXISTS:
-- 1) Buscar o nome e o CPF dos médicos que também são pacientes do hospital
SELECT m.nome, m.cpf FROM medicos m WHERE EXISTS (SELECT cpf FROM pacientes p WHERE m.cpf = p.cpf);

-- 2) Buscar o nome e o CPF dos médicos ortopedistas, e a data das suas consultas,
--    para os ortopedistas que têm consulta marcada com a paciente Ana
SELECT m.nome, m.cpf, c.data
FROM medicos m
JOIN consultas c ON m.codm = c.codm
WHERE m.especialidade = 'ortopedia'
  AND EXISTS (SELECT codp FROM pacientes p WHERE c.codp = p.codp AND p.nome = 'Ana');

-- 3) Buscar o nome e o CPF dos médicos que têm consultas marcadas com todos os pacientes
SELECT m.nome, m.cpf
FROM medicos m
WHERE NOT EXISTS (SELECT codp
                  FROM pacientes p
                  WHERE NOT EXISTS (SELECT codp, codm
                                    FROM consultas c
                                    WHERE c.codm = m.codm AND c.codp = p.codp));

-- 4) Buscar o nome e o CPF dos médicos ortopedistas que têm consultas marcadas com todos os pacientes de Florianópolis
SELECT m.nome, m.cpf
FROM medicos m
WHERE m.especialidade = 'ortopedia'
  AND NOT EXISTS (SELECT codp
                  FROM pacientes p
                  WHERE p.cidade = 'Florianopolis'
                    AND NOT EXISTS (SELECT codp, codm
                                    FROM consultas c
                                    WHERE c.codm = m.codm AND c.codp = p.codp));

-- Responda utilizando subconsultas na cláusula FROM :
-- 1) Buscar a data e a hora das consultas marcadas para a médica Maria
SELECT c.data, c.hora
FROM (SELECT data, hora, codm FROM consultas) c
JOIN (SELECT codm FROM medicos WHERE nome = 'Maria') m ON c.codm = m.codm;

-- 2) Buscar o nome e a cidade dos pacientes que têm consultas marcadas com ortopedistas
SELECT p.nome, p.cidade
FROM (SELECT codp, nome, cidade FROM pacientes) p
JOIN (SELECT codp
      FROM consultas c JOIN medicos m ON c.codm = m.codm
      WHERE m.especialidade = 'ortopedia') c ON p.codp = c.codp;

-- 3) Buscar o nome e o CPF dos médicos que atendem no mesmo ambulatório do médico Pedro
SELECT m.nome, m.cpf FROM medicos m JOIN medicos p ON m.nroa = p.nroa WHERE p.nome = 'Pedro';
