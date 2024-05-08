INSERT INTO ambulatorios (nroa, andar, capacidade)
VALUES (1, 1, 30),
       (2, 1, 50),
       (3, 2, 40),
       (4, 2, 25),
       (5, 2, 55);

INSERT INTO medicos (codm, nome, idade, especialidade, cpf, cidade, nroa)
VALUES (1, 'Joao', 40, 'ortopedia', 10000100000, 'Florianopolis', 1),
       (2, 'Maria', 42, 'traumatologia', 10000110000, 'Blumenau', 2),
       (3, 'Pedro', 51, 'pediatria', 11000100000, 'Sao Jose', 2),
       (4, 'Carlos', 28, 'ortopedia', 11000110000, 'Joinville', NULL),
       (5, 'manoel', 52, 'NEUROLOGIA', 11000220000, 'Palhoca', NULL);

INSERT INTO pacientes (codp, nome, idade, cidade, cpf, doenca)
VALUES (1, 'Ana', 21, 'Florianopolis', 20000200000, 'gripe'),
       (2, 'Paulo', 24, 'ILHOTA ', 20000220000, 'fratura'),
       (3, 'Lucia', 30, 'Biguacu', 22000200000, 'tendinite'),
       (4, 'Carlos', 28, 'Joinville', 11000110000, 'sarampo');

INSERT INTO funcionarios (codf, nome, idade, cpf, cidade, salario)
VALUES (1, 'Rita', 32, 20000100000, 'Sao Jose', 1200),
       (2, 'Vera', 55, 30000110000, 'Palhoca', 1220),
       (3, 'Caio', 45, 41000100000, 'Florianopolis', 1100),
       (5, 'Paula', 33, 61000111000, 'Florianopolis', 2500);

INSERT INTO consultas (codm, codp, data, hora)
VALUES (1, 1, '2020/10/12', '14:00'),
       (1, 4, '2020/11/4', '12:00'),
       (2, 1, '2020/10/13', '09:00'),
       (2, 2, '2020/10/13', '11:00'),
       (2, 3, '2020/10/14', '14:00'),
       (2, 4, '2020/10/14', '17:00'),
       (3, 1, '2020/10/19', '18:00'),
       (3, 3, '2020/10/12', '10:00'),
       (3, 4, '2020/10/19', '14:30'),
       (4, 4, '2020/10/20', '13:00');
