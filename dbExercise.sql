#Author: Vítor Witt Martin 
#Creation Date: 08/2018/21

CREATE DATABASE dbExercicio;

USE dbExercicio;

CREATE TABLE tbSala
(numero_sala INT NOT NULL ,
descricao_sala VARCHAR(20) ,
 capacidade INT NOT NULL,
 CONSTRAINT pk_tbSala PRIMARY KEY (numero_sala) 
 );
 
 CREATE TABLE tbDiretor
 (codigo_diretor  INT NOT NULL ,
 nome_diretor VARCHAR (20) NOT NULL,
 CONSTRAINT pk_tbDiretor PRIMARY KEY (codigo_diretor)
 );
 
 
CREATE TABLE tbFilme
(codigo_filme INT NOT NULL,
nome_filme VARCHAR (50) NOT NULL,
ano_lancamento INT NOT NULL,
categoria_filme VARCHAR (20) NOT NULL,
codigo_diretor INT NOT NULL,
CONSTRAINT pk_tbFilme PRIMARY KEY (codigo_filme),
CONSTRAINT fk_DiretorFilme FOREIGN KEY (codigo_diretor) REFERENCES tbDiretor (codigo_diretor)
);    
    
CREATE TABLE tbPremio
(codigo_premio INT NOT NULL,
nome_premio VARCHAR (20) NOT NULL,
ano_premiacao INT NOT NULL,
codigo_filme INT NOT NULL,
CONSTRAINT pk_tbPremio PRIMARY KEY (codigo_premio),
CONSTRAINT fk_tbFilmePremio FOREIGN KEY (codigo_filme) References tbFilme (codigo_filme)
);    
 
 CREATE TABLE tbSalaFilme 
 (numero_sala INT NOT NULL,
 codigo_filme INT NOT NULL,
 data Date NOT NULL,
 horario TIME NOT NULL,
 CONSTRAINT pk_tbSalaFilme PRIMARY KEY (numero_sala, codigo_filme, data),
 CONSTRAINT fk_tbSalaSalaFilme FOREIGN KEY (numero_sala) REFERENCES tbSala (numero_sala),
 CONSTRAINT fk_tbFilmeSalaFilme FOREIGN KEY (codigo_filme) REFERENCES tbFilme (codigo_filme) 
 );

INSERT INTO tbSala (numero_sala, descricao_sala, capacidade) VALUES ('1','GGG','100');
INSERT INTO tbSala (numero_sala, descricao_sala, capacidade) VALUES ('2','HHH','101');
INSERT INTO tbSala (numero_sala, descricao_sala, capacidade) VALUES ('3','III','102');

INSERT INTO tbDiretor (codigo_diretor,nome_diretor) VALUES ('1','Jacinto');
INSERT INTO tbDiretor (codigo_diretor,nome_diretor) VALUES ('2','Faustão');
INSERT INTO tbDiretor (codigo_diretor,nome_diretor) VALUES ('3','Malandro');

INSERT INTO tbFilme (codigo_filme, nome_filme, ano_lancamento, categoria_filme, codigo_diretor) VALUES ('1','TOPTOP', '2018','AVENTURA','1');
INSERT INTO tbFilme (codigo_filme, nome_filme, ano_lancamento, categoria_filme, codigo_diretor) VALUES ('2','o RETORNO DOS QUE NÃO FORAM', '2012','SUSPENSE','2');
INSERT INTO tbFilme (codigo_filme, nome_filme, ano_lancamento, categoria_filme, codigo_diretor) VALUES ('3','O DIBRADOR', '2006','DOCUMENTARIO','3');

INSERT INTO tbPremio (codigo_premio,nome_premio, ano_premiacao, codigo_filme ) VALUES ('4','top do ano','2018','1'); 
INSERT INTO tbPremio (codigo_premio,nome_premio, ano_premiacao, codigo_filme ) VALUES ('5',' impactante do ano','2012','2');
INSERT INTO tbPremio (codigo_premio,nome_premio, ano_premiacao, codigo_filme ) VALUES ('6','emocionante do ano','2006','3');  

INSERT INTO tbSalaFilme(numero_sala,codigo_filme, data, horario ) VALUES ('1','1','2018-05-01', '08:07');
INSERT INTO tbSalaFilme(numero_sala,codigo_filme, data, horario ) VALUES ('2','2','2017-05-01', '23:11');
INSERT INTO tbSalaFilme(numero_sala,codigo_filme, data, horario ) VALUES ('3','3','2016-05-01', '00:50');

SELECT * FROM tbSala;
SELECT * FROM tbDiretor;
SELECT * FROM tbFilme;
SELECT * FROM tbPremio;
SELECT * FROM tbSalaFilme;

