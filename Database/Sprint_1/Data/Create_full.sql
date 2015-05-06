CREATE TABLE tb_permissao (
  id_permissao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ds_permissao VARCHAR NULL,
  PRIMARY KEY(id_permissao)
);

CREATE TABLE tb_setor (
  id_setor INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ds_setor VARCHAR NULL,
  PRIMARY KEY(id_setor)
);

CREATE TABLE tb_tipo_limitacao (
  id_tipo_limitacao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ds_tipo_limitacao VARCHAR NULL,
  PRIMARY KEY(id_tipo_limitacao)
);

CREATE TABLE tb_nivel_acesso (
  id_nivel_acesso INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ds_nivel_acesso VARCHAR NULL,
  PRIMARY KEY(id_nivel_acesso)
);

CREATE TABLE tb_acao (
  id_acao INTEGER UNSIGNED NOT NULL,
  ds_acao VARCHAR NULL,
  PRIMARY KEY(id_acao)
);

CREATE TABLE tb_configuracao_limitacao (
  id_configuracao_limitacao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_tipo_limitacao_id_tipo_limitacao INTEGER UNSIGNED NOT NULL,
  vl_latitude DOUBLE NULL,
  vl_longitude DOUBLE NULL,
  ds_rede VARCHAR NULL,
  PRIMARY KEY(id_configuracao_limitacao),
  FOREIGN KEY(tb_tipo_limitacao_id_tipo_limitacao)
    REFERENCES tb_tipo_limitacao(id_tipo_limitacao)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_nivel_acesso_permissao (
  tb_nivel_acesso_id_nivel_acesso INTEGER UNSIGNED NOT NULL,
  tb_permissao_id_permissao INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(tb_nivel_acesso_id_nivel_acesso, tb_permissao_id_permissao),
  FOREIGN KEY(tb_nivel_acesso_id_nivel_acesso)
    REFERENCES tb_nivel_acesso(id_nivel_acesso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_permissao_id_permissao)
    REFERENCES tb_permissao(id_permissao)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_configuracao (
  id_configuracao INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_configuracao_limitacao_id_configuracao_limitacao INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(id_configuracao),
  FOREIGN KEY(tb_configuracao_limitacao_id_configuracao_limitacao)
    REFERENCES tb_configuracao_limitacao(id_configuracao_limitacao)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_usuario (
  id_usuario INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_configuracao_id_configuracao INTEGER UNSIGNED NOT NULL,
  tb_setor_id_setor INTEGER UNSIGNED NOT NULL,
  id_identificacao INTEGER UNSIGNED NULL,
  ds_email VARCHAR NULL,
  id_usuario_superior INTEGER UNSIGNED NULL,
  PRIMARY KEY(id_usuario),
  FOREIGN KEY(tb_setor_id_setor)
    REFERENCES tb_setor(id_setor)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_configuracao_id_configuracao)
    REFERENCES tb_configuracao(id_configuracao)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_usuario_nivel_acesso (
  tb_usuario_id_usuario INTEGER UNSIGNED NOT NULL,
  tb_nivel_acesso_id_nivel_acesso INTEGER UNSIGNED NOT NULL,
  PRIMARY KEY(tb_usuario_id_usuario, tb_nivel_acesso_id_nivel_acesso),
  FOREIGN KEY(tb_usuario_id_usuario)
    REFERENCES tb_usuario(id_usuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_nivel_acesso_id_nivel_acesso)
    REFERENCES tb_nivel_acesso(id_nivel_acesso)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE tb_ponto (
  id_ponto INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  tb_acao_id_acao INTEGER UNSIGNED NOT NULL,
  tb_usuario_id_usuario INTEGER UNSIGNED NOT NULL,
  dt_ponto DATETIME NULL,
  vl_latitude DOUBLE NULL,
  vl_longitude DOUBLE NULL,
  ds_rede VARCHAR NULL,
  PRIMARY KEY(id_ponto, tb_acao_id_acao, tb_usuario_id_usuario),
  FOREIGN KEY(tb_acao_id_acao)
    REFERENCES tb_acao(id_acao)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(tb_usuario_id_usuario)
    REFERENCES tb_usuario(id_usuario)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);


