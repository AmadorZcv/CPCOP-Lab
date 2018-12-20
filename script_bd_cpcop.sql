
CREATE TABLE cpcop.tbl_permissao (
                id_permissao INTEGER NOT NULL,
                excluir BOOLEAN NOT NULL,
                editar BOOLEAN NOT NULL,
                criar BOOLEAN NOT NULL,
                CONSTRAINT id_permissao PRIMARY KEY (id_permissao)
);


CREATE TABLE cpcop.tbl_usuario (
                id_usuario INTEGER NOT NULL,
                nome_usuario VARCHAR NOT NULL,
                email VARCHAR NOT NULL,
                senha VARCHAR NOT NULL,
                CONSTRAINT id_usuario PRIMARY KEY (id_usuario)
);


CREATE TABLE cpcop.tbl_usuario_cadastrado (
                id_usuario_cadastrado INTEGER NOT NULL,
                id_usuario INTEGER NOT NULL,
                id_permissao INTEGER NOT NULL,
                nome_cadastrado VARCHAR NOT NULL,
                CONSTRAINT id_usuario_cadastrado PRIMARY KEY (id_usuario_cadastrado)
);


CREATE TABLE cpcop.tbl_animal_tipo (
                id_animal_tipo INTEGER NOT NULL,
                animal_tipo VARCHAR NOT NULL,
                CONSTRAINT id_animal_tipo PRIMARY KEY (id_animal_tipo)
);


CREATE TABLE cpcop.tbl_gestacao_status (
                id_gestacao_status INTEGER NOT NULL,
                gestacao_status VARCHAR NOT NULL,
                CONSTRAINT id_gestacao_status PRIMARY KEY (id_gestacao_status)
);


CREATE TABLE cpcop.tbl_ocorrencia_tipo (
                id_ocorrencia_tipo INTEGER NOT NULL,
                ocorrencia_tipo VARCHAR NOT NULL,
                CONSTRAINT id_ocorrencia_tipo PRIMARY KEY (id_ocorrencia_tipo)
);


CREATE TABLE cpcop.tbl_animal (
                id_animal INTEGER NOT NULL,
                id_animal_pai INTEGER NOT NULL,
                id_animal_mae INTEGER NOT NULL,
                nome_animal VARCHAR NOT NULL,
                data_nascimento DATE NOT NULL,
                macho BOOLEAN NOT NULL,
                ovino BOOLEAN NOT NULL,
                id_animal_tipo INTEGER NOT NULL,
                CONSTRAINT id_animal PRIMARY KEY (id_animal)
);


CREATE TABLE cpcop.tbl_gestacao (
                id_gestacao INTEGER NOT NULL,
                id_animal INTEGER NOT NULL,
                id_gestacao_status INTEGER NOT NULL,
                CONSTRAINT id_gestacao PRIMARY KEY (id_gestacao)
);


CREATE TABLE cpcop.tbl_ocorrencia (
                id_ocorrencia INTEGER NOT NULL,
                id_animal_reprodutor INTEGER NOT NULL,
                id_ocorrencia_tipo INTEGER NOT NULL,
                id_animal INTEGER NOT NULL,
                data_ocorrencia DATE NOT NULL,
                inseminada BOOLEAN NOT NULL,
                observacao VARCHAR NOT NULL,
                CONSTRAINT id_ocorrencia PRIMARY KEY (id_ocorrencia)
);


CREATE TABLE cpcop.tbl_pesagem (
                id_pesagem INTEGER NOT NULL,
                id_animal INTEGER NOT NULL,
                ecc SMALLINT NOT NULL,
                famacha SMALLINT NOT NULL,
                peso NUMERIC NOT NULL,
                data_pesagem DATE NOT NULL,
                CONSTRAINT id_pesagem PRIMARY KEY (id_pesagem, id_animal)
);


ALTER TABLE cpcop.tbl_usuario_cadastrado ADD CONSTRAINT tbl_permissao_tbl_usuario_cadastrado_fk
FOREIGN KEY (id_permissao)
REFERENCES cpcop.tbl_permissao (id_permissao)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_usuario_cadastrado ADD CONSTRAINT tbl_usuario_tbl_usuario_cadastrado_fk
FOREIGN KEY (id_usuario)
REFERENCES cpcop.tbl_usuario (id_usuario)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_animal ADD CONSTRAINT tbl_animal_tipo_tbl_animal_fk
FOREIGN KEY (id_animal_tipo)
REFERENCES cpcop.tbl_animal_tipo (id_animal_tipo)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_gestacao ADD CONSTRAINT tbl_gestacao_status_tbl_gestacao_fk
FOREIGN KEY (id_gestacao_status)
REFERENCES cpcop.tbl_gestacao_status (id_gestacao_status)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_ocorrencia ADD CONSTRAINT tbl_ocorrencia_tipo_tbl_ocorrencia_fk
FOREIGN KEY (id_ocorrencia_tipo)
REFERENCES cpcop.tbl_ocorrencia_tipo (id_ocorrencia_tipo)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_pesagem ADD CONSTRAINT tbl_animal_tbl_pesagem_fk
FOREIGN KEY (id_animal)
REFERENCES cpcop.tbl_animal (id_animal)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_ocorrencia ADD CONSTRAINT tbl_animal_tbl_ocorrencia_fk
FOREIGN KEY (id_animal)
REFERENCES cpcop.tbl_animal (id_animal)
ON DELETE CASCADE
ON UPDATE CASCADE
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_ocorrencia ADD CONSTRAINT tbl_animal_tbl_ocorrencia_fk1
FOREIGN KEY (id_animal_reprodutor)
REFERENCES cpcop.tbl_animal (id_animal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_gestacao ADD CONSTRAINT tbl_animal_tbl_gestacao_fk
FOREIGN KEY (id_animal)
REFERENCES cpcop.tbl_animal (id_animal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_animal ADD CONSTRAINT tbl_animal_tbl_animal_fk
FOREIGN KEY (id_animal_pai)
REFERENCES cpcop.tbl_animal (id_animal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE cpcop.tbl_animal ADD CONSTRAINT tbl_animal_tbl_animal_fk1
FOREIGN KEY (id_animal_mae)
REFERENCES cpcop.tbl_animal (id_animal)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
