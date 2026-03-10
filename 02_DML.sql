use faculdade;


-- Insert into disciplinas
INSERT INTO disciplinas (cd_disciplina, nm_disciplina, qt_carga_horaria) 
VALUES
(1, 'IF973-Ciencia de Dados', 60),
(2, 'IF974-Calculo I', 45),
(3, 'IF992-Modelagem de Banco de Dados', 60);


-- Insert into cargos
INSERT INTO cargos (cd_cargo, nm_cargo) 
VALUES
(10, 'Professor Efetivo'),
(20, 'Professor Adjunto-1'),
(30, 'Professor Associado');


-- Insert into departamentos
INSERT INTO departamentos (cd_departamento, nm_departamento) 
VALUES
(100, 'D001-Ciencia da Computacao'),
(200, 'D002-Matematica'),
(300, 'D003-Administracao');


-- Insert into professores
INSERT INTO professores (cd_professor, cd_departamento, cd_cargo, nm_professor, vl_salario) 
VALUES
(1,100, 10, 'Antonio Leal', '1000'),
(2,200, 20, 'Eduardo Nogueira Nobre', '5000'),
(3,200, 10, 'Aragao Junior', '15000');


-- Insert into aulas
INSERT INTO aulas (cd_aula, cd_disciplina, cd_professor, nu_semestre) 
VALUES
(1001, 1, 1, '2013.2'),
(1002, 2, 3, '2013.2'),
(1003, 2, 3, '2024.1'),
(1004, 2, 1, '2024.2'),
(1005, 3, 1, '2024.2');
