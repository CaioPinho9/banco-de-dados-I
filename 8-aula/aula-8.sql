-- 1) criar uma visão que enxerga o código, nome, CPF e idade os dados dos funcionários de Florianopolis;
CREATE VIEW funcionarios_florianopolis AS
SELECT codf, nome, cpf, idade
FROM funcionarios
WHERE cidade = 'Florianopolis';

-- 2) consulte os dados da visão;
SELECT * FROM funcionarios_florianopolis;

-- 3) incremente a idade de todos os funcionários da visão;
UPDATE funcionarios_florianopolis SET idade = idade + 1;

-- 4) consulte novamente os dados da visão. A atualização funcionou?
SELECT * FROM funcionarios_florianopolis;

-- 5) inserir o funcionário de nome Rodrigo, CPF 22200022233, 41 anos e código 10 através da visão;
INSERT INTO funcionarios_florianopolis (codf, nome, cpf, idade) VALUES (10, 'Rodrigo', '22200022233', 41);

-- 6) consulte os dados da visão. A inserção funcionou?
SELECT * FROM funcionarios_florianopolis;

-- 7) definir uma trigger que, ao invés de inserir na visão, insere diretamente na tabela Funcionários preenchendo o atributo cidade com ‘Florianopolis’;
CREATE OR REPLACE FUNCTION insert_funcionario_florianopolis()
    RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO funcionarios (codf, nome, cpf, idade, cidade)
    VALUES (new.codf, new.nome, new.cpf, new.idade, 'Florianopolis');
    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_insert_funcionario_florianopolis
    INSTEAD OF INSERT
    ON funcionarios_florianopolis
    FOR EACH ROW
EXECUTE FUNCTION insert_funcionario_florianopolis();

-- 8) inserir o funcionário de nome Raul, CPF 44400044433, 53 anos e código 11;
INSERT INTO funcionarios_florianopolis (codf, nome, cpf, idade) VALUES (11, 'Raul', '44400044433', 53);

-- 9) consulte os dados da visão. A inserção funcionou?
SELECT * FROM funcionarios_florianopolis;

-- 10) criar uma visão que enxerga o código, nome, idade, CPF e número do ambulatório dos médicos que atendem em ambulatórios com número igual ou superior à 2.
-- Defina essa visão com a cláusula WITH CHECK OPTION;
CREATE VIEW medicos_atendem_ambulatorios_grandes AS
SELECT m.codm, m.nome, m.idade, m.cpf, m.nroa
FROM medicos m
WHERE m.nroa >= 2
WITH CHECK OPTION;

-- 11) consulte os dados da visão;
SELECT * FROM medicos_atendem_ambulatorios_grandes;

-- 12) inserir o médico de nome Soraia, CPF 55500055533, 47 anos, ambulatório 2 e código 7;
INSERT INTO medicos_atendem_ambulatorios_grandes (codm, nome, cpf, idade, nroa)
VALUES (7, 'Soraia', '55500055533', 47, 2);

-- 13) consulte os dados da visão. A inserção funcionou?
SELECT * FROM medicos_atendem_ambulatorios_grandes;

-- 14) inserir o médico de nome Saulo, CPF 66600066633, 52 anos, ambulatório 1 e código 8. A inserção funcionou?
INSERT INTO medicos_atendem_ambulatorios_grandes (codm, nome, cpf, idade, nroa)
VALUES (8, 'Saulo', '66600066633', 52, 1);
SELECT * FROM medicos_atendem_ambulatorios_grandes;
