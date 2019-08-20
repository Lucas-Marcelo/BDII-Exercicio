create database ETEC_HAS_EX_01;

use ETEC_HAS_EX_01;

create table area (
	id_area		integer			not null		primary key  	identity(1 , 1), /*PK*/
	nm_area		varchar(60)		not null
);

create table professor (
	id_prof		integer			not null		primary key     identity(1 , 1), /*PK*/
	nm_prof		varchar(60)		not null,
	end_prof	varchar(255)	not null,
	rg_prof		varchar(20)		not null,
	cpf_prof	varchar(12)		not null
);

create table curso (
	id_curso		integer			not null		primary key	identity(1 , 1), /*PK*/
	nm_curso		varchar(45)		not null,
	area_id_area	integer			constraint fk_id_area foreign key(area_id_area) references area(id_area) /*FK*/
);

create table modulo (
	id_mod			integer			not null		primary key	identity(1 , 1), /*PK*/
	nm_mod			integer			not null,
	curso_id_curso	integer			constraint fk_id_curso foreign key(curso_id_curso) references curso(id_curso) /*FK*/
/*  nome da fk		tipo    restrição  nome constraint         nome da fk      tabela pk        nome pk      */
);

create table materia (
	id_mat				integer			not null		primary key	identity(1 , 1), /*PK*/
	nm_mat				varchar(50)		not null,
	modulo_id_mod		integer			constraint fk_id_mod foreign key(modulo_id_mod) references modulo(id_mod), /*FK*/
	professor_id_prof	integer			constraint fk_id_prof foreign key(professor_id_prof) references professor(id_prof) /*FK*/
);

create table aluno (
	id_alu			integer			not null	primary key	identity(1 , 1), /*PK*/
	nm_alu			varchar(60)		not null,
	end_alu			varchar(255)	not null,
	rg_alu			varchar(20)		not null,
	cpf_alu			numeric(11)		not null,
	email_alu		varchar(50)		not null,
	nm_mae_alu		varchar(60),
	nm_pai_alu		varchar(60),
	curso_id_curso	integer			constraint fk2_id_curso foreign key(curso_id_curso) references curso(id_curso) /*FK*/
);

sp_help area
sp_help professor
sp_help curso
sp_help modulo
sp_help materia
sp_help aluno

select * from area
select * from professor
select * from curso
select * from modulo
select * from materia
select * from aluno