#Author: Vítor Witt Martin 
#Creation Date: 08/2018/19


CREATE DATABASE dbExercicio;

USE dbExercicio;

CREATE TABLE tbCompanhia
(cod_companhia int ,
nome_companhia varchar(200),
cidade_companhia varchar(200),
 CONSTRAINT pk_tbCompanhia PRIMARY KEY (cod_companhia)
);


CREATE TABLE tbGerente
(cod_gerente int ,
nome_gerente varchar(200),
CONSTRAINT pk_tbGerente PRIMARY KEY (cod_gerente)
);

CREATE TABLE tbEmpregado
(cod_emp int ,
nome_emp varchar(200),
rua_emp varchar(200),
cidade_emp varchar(200),
fone_emp varchar(12),
cod_gerente int,
CONSTRAINT pk_tbEmpregado PRIMARY KEY (cod_emp),
CONSTRAINT fk_tbGerenteEmpregado FOREIGN KEY (cod_gerente) references tbGerente (cod_gerente)
);

CREATE TABLE Trabalha
(cod_emp int ,
cod_companhia int ,
salario DOUBLE,
CONSTRAINT pk_tbTrabalha PRIMARY KEY (cod_emp, cod_companhia),
CONSTRAINT fk_tbEmpregadoTrabalha FOREIGN KEY (cod_emp) references tbEmpregado (cod_emp),
CONSTRAINT fk_tbCompanhiaTrabalha FOREIGN KEY (cod_companhia) references tbCompanhia (cod_companhia)
);

ALTER TABLE `tbEmpregado` ADD INDEX( `nome_emp`);
ALTER TABLE `tbCompanhia` ADD UNIQUE( `nome_companhia`);
ALTER TABLE `tbGerente` ADD `telefone_gerente` VARCHAR (20) NOT NULL AFTER `nome_gerente`;

ALTER TABLE tbEmpregado DROP FOREIGN KEY fk_tbGerenteEmpregado;

DROP TABLE tbGerente;



