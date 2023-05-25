create database Curso;
use Curso;

create table aluno
(
id_aluno int not null,
nome_aluno varchar(20),
data_nascimento_aluno double,
primary key (id_aluno)
);

create table matricula
(
id_matricula int not null,
numero_matricula int,
data_matricula double,
id_aluno int,
primary key (id_matricula), 
foreign key (id_aluno) references aluno(id_aluno)
);

create table turma
(
id_turma int not null,
numero_turma int,
data_aula_turma double,
id_aluno int,
id_matricula int,
primary key(id_turma),
foreign key (id_aluno) references aluno(id_aluno),
foreign key (id_matricula) references matricula(id_matricula)
);
create table disciplina(
id_disciplina int not null,
nome_disciplina varchar(30),
carga_horaria_disciplina double,
turma int,
professor int,
primary key(id_disciplina)
);

create table professor
(
id_cpf_professor int not null,
endereco_professor varchar(20),
id_turma int,
id_disciplina int,
primary key(id_cpf_professor),
foreign key (id_turma) references turma(id_turma),
foreign key(id_disciplina) references disciplina (id_disciplina));

alter table disciplina
add foreign key (turma) references turma(id_turma),
add foreign key (professor) references professor(id_cpf_professor);