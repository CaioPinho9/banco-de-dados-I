-- 1) O paciente Paulo mudou-se para Ilhota
UPDATE pacientes SET cidade = 'Ilhota' WHERE nome = 'Paulo';
-- 2) A consulta do médico 1 com o paciente 4 passou para às 12:00 horas do dia 4 de Novembro de 2020
UPDATE consultas SET data = '2020-11-04', hora = '12:00:00' WHERE codm = 1 AND codp = 4;
-- 3) A consulta do médico 3 com o paciente 4 passou para às 14h30
UPDATE consultas SET hora = '14:30:00' WHERE codm = 3 AND codp = 4;
-- 4) O funcionário 4 deixou a clínica
DELETE FROM funcionarios WHERE codf = 4;
-- 5) As consultas após as 19 horas devem ser excluídas
DELETE FROM consultas WHERE hora > '19:00:00';
-- 6) Os médicos que residem em Biguacu e Palhoca devem ser excluídos
DELETE FROM medicos WHERE cidade IN ('Biguacu', 'Palhoca');
