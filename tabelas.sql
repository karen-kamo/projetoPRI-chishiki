CREATE TABLE aluno(
	id_alu serial NOT NULL,
	nome_alu varchar(100),
	email_alu varchar(350),
	senha_alu varchar(100),
	curso_alu varchar(100),
	
	CONSTRAINT pk_aluno PRIMARY KEY(id_alu)
);

CREATE TABLE professor(
	id_prof serial NOT NULL,
	nome_prof varchar(100),
	email_prof varchar(350),
	senha_prof varchar(100),
	
	CONSTRAINT pk_professor PRIMARY KEY(id_prof)
);

CREATE TABLE disciplina(
	id_disc serial NOT NULL,
	nome_disc varchar(100),
	curso_disc varchar(100),
	
	CONSTRAINT pk_disciplina PRIMARY KEY(id_disc)
);

CREATE TABLE pergunta(
	id_perg serial NOT NULL,
	conteudo_perg varchar(500000),
	id_alu int,
	id_disc int,
	
	CONSTRAINT pk_pergunta PRIMARY KEY(id_perg),
	CONSTRAINT fk_pergunta_aluno FOREIGN KEY(id_alu)
		references aluno,
	CONSTRAINT fk_pergunta_disciplina FOREIGN KEY(id_disc)
		references disciplina
);

CREATE TABLE resposta(
	id_resp serial NOT NULL,
	conteudo_resp varchar(500000),
	id_alu int,
	id_prof int,
	id_perg int,
	
	CONSTRAINT pk_resposta PRIMARY KEY(id_resp),
	CONSTRAINT fk_resposta_aluno FOREIGN KEY(id_alu)
		references aluno,
	CONSTRAINT fk_resposta_professor FOREIGN KEY(id_prof)
		references professor,
	CONSTRAINT fk_resposta_pergunta FOREIGN KEY(id_perg)
		references pergunta
);

--Tabela do relacionamento entre professor e disciplina
CREATE TABLE professor_disciplina(
	id_prof_disc serial NOT NULL,
	id_prof int,
	id_disc int,
	
	CONSTRAINT pk_prof_dis PRIMARY KEY(id_prof_disc),
	CONSTRAINT fk_resposta_professor FOREIGN KEY(id_prof)
		references professor,
	CONSTRAINT fk_resposta_disciplina FOREIGN KEY(id_disc)
		references disciplina
);
