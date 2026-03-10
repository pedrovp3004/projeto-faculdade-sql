create database faculdade;

use faculdade;

create table disciplinas(

cd_disciplina int,
nm_disciplina varchar(100),
qt_carga_horaria int,
constraint pk_disciplinas primary key (cd_disciplina)
);

create table departamentos(
cd_departamento int,
nm_departamento varchar(200),
constraint pk_departamentos primary key(cd_departamento)
);

create table cargos(
cd_cargo int,
nm_cargo varchar(100),
constraint pk_cargos primary key (cd_cargo)
);

create table professores(
cd_professor int,
cd_departamento int,
cd_cargo int,
nm_professor varchar(100),
vl_salario decimal(10,2),
constraint pk_professores primary key (cd_professor),
constraint fk_professores_1 foreign key (cd_departamento) references departamentos(cd_departamento),
constraint fk_professores_2 foreign key (cd_cargo) references cargos (cd_cargo)
);

create table aulas(
cd_aula int, 
cd_disciplina int,
cd_professor int,
nu_semestre varchar(6),
constraint pk_aulas primary key(cd_aula),
constraint fk_aulas_1 foreign key(cd_disciplina) references disciplinas (cd_disciplina),
constraint fk_aulas_2 foreign key(cd_professor) references professores(cd_professor) 
);


