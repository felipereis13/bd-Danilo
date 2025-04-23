USE EscolaDeMusica;

DROP VIEW IF EXISTS 
  view_musicos_completo,
  view_musicos_orquestras,
  view_orquestras_com_sinfonia,
  view_musicos_corda,
  view_sinfonias_funcao_avancada,
  view_musicos_telefone,
  view_musicos_salario_maior_que_media,
  view_qtd_musicos_por_instrumento,
  view_orquestras_mais_5_musicos,
  view_musicos_sem_orquestra;

DROP TABLE IF EXISTS Pertence;
DROP TABLE IF EXISTS Orquestra;
DROP TABLE IF EXISTS Musico;
DROP TABLE IF EXISTS Funcao;
DROP TABLE IF EXISTS Instrumento;
DROP TABLE IF EXISTS Sinfonia;
DROP TABLE IF EXISTS Telefone;
DROP TABLE IF EXISTS Endereco;

DROP SCHEMA IF EXISTS EscolaDeMusica;
