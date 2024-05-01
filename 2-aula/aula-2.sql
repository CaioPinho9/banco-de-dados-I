INSERT INTO Ambulatorios (nroa, andar, capacidade)
VALUES (1, 1, 30),
       (2, 1, 50),
       (3, 2, 40),
       (4, 2, 25),
       (5, 2, 55);

INSERT INTO Medicos (codm, nome, idade, especialidade, CPF, cidade, nroa)
VALUES (1, 'Joao', 40, 'ortopedia', '10000100000', 'Florianopolis', 1),
       (2, 'Maria', 42, 'traumatologia', '10000110000', 'Blumenau', 2),
       (3, 'Pedro', 51, 'pediatria', '11000100000', 'São José', 2),
       (4, 'Carlos', 28, 'ortopedia', '11000110000', 'Joinville', 3),
       (5, 'Marcia', 33, 'neurologia', '11000111000', 'Biguaçu', 3);

INSERT INTO Pacientes (codp, nome, idade, cidade, CPF, doenca)
VALUES (1, 'Ana', 20, 'Florianopolis', '20000200000', 'gripe'),
       (2, 'Paulo', 24, 'Palhoça', '20000220000', 'fratura'),
       (3, 'Lucia', 30, 'Biguaçu', '22000200000', 'tendinite'),
       (4, 'Carlos', 28, 'Joinville', '11000110000', 'sarampo');

INSERT INTO Funcionarios (codf, nome, idade, salario, CPF)
VALUES (1, 'Rita', 32, 1200, '20000100000'),
       (2, 'Vera', 55, 1220, '30000100000'),
       (3, 'Caio', 45, 1100, '41000110000'),
       (4, 'Marcelo', 44, 1200, '51000110000'),
       (5, 'Paula', 33, 2500, '61000110000');

INSERT INTO Consultas (codm, codp, data, hora)
VALUES (1, 1, '2020/10/12', '14:00'),
       (1, 1, '2020/10/13', '9:00'),
       (2, 4, '2020/10/13', '10:00'),
       (2, 2, '2020/10/13', '11:00'),
       (2, 3, '2020/10/14', '14:00'),
       (2, 4, '2020/10/14', '17:00'),
       (3, 1, '2020/10/19', '18:00'),
       (3, 3, '2020/10/12', '10:00'),
       (3, 4, '2020/10/19', '13:00'),
       (4, 4, '2020/10/20', '13:00'),
       (4, 4, '2020/10/22', '19:30');


-- 1) O paciente Paulo mudou-se para Ilhota
UPDATE pacientes
SET cidade = 'Ilhota'
WHERE nome = 'Paulo';
-- 2) A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Novembro de 2020
UPDATE consultas
SET data = '2020-11-04',
    hora = '12:00:00'
WHERE codm = 1
  AND codp = 4;
-- 3) A consulta do médico 3 com o paciente 4 passou para às 14h30
UPDATE consultas
SET hora = '14:30:00'
WHERE codm = 3
  AND codp = 4;
-- 4) O funcionário 4 deixou a clínica
DELETE
FROM funcionarios
WHERE codf = 4;
-- 5) As consultas após as 19 horas devem ser excluídas
DELETE
FROM consultas
WHERE hora > '19:00:00';
-- 6) Os médicos que residem em Biguacu e Palhoca devem ser excluídos
DELETE
FROM medicos
WHERE cidade IN ('Biguaçu', 'Palhoca');
