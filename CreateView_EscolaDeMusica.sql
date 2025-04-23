USE EscolaDeMusica;

CREATE VIEW view_musicos_completo AS
SELECT 
  M.CPF,
  M.Nome AS Musico,
  M.Salario,
  M.Nacionalidade,
  M.DataNascimento,
  M.Sexo,
  I.Nome AS Instrumento,
  F.Nome AS Funcao,
  E.Cidade,
  T.Numero AS Telefone
FROM Musico M
JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
JOIN Funcao F ON M.idFuncao = F.idFuncao
JOIN Endereco E ON M.idEndereco = E.idEndereco
JOIN Telefone T ON M.idTelefone = T.idTelefone;

CREATE VIEW view_musicos_orquestras AS
SELECT 
  M.Nome AS Musico,
  O.Nome AS Orquestra,
  O.Cidade,
  O.Pais
FROM Musico M
JOIN Pertence P ON M.CPF = P.Musico_CPF
JOIN Orquestra O ON P.idOrquestra = O.idOrquestra;

CREATE VIEW view_orquestras_com_sinfonia AS
SELECT 
  O.Nome AS Orquestra,
  S.Nome AS Sinfonia,
  S.Compositor
FROM Orquestra O
JOIN Sinfonia S ON O.idSinfonia = S.idSinfonia;

CREATE VIEW view_musicos_corda AS
SELECT M.Nome, I.Nome AS Instrumento
FROM Musico M
JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
WHERE I.Tipo = 'Cordas';

CREATE VIEW view_sinfonias_funcao_avancada AS
SELECT 
  S.Nome AS Sinfonia,
  F.Nome AS Funcao,
  F.NivelExperiencia
FROM Funcao F
JOIN Sinfonia S ON F.idSinfonia = S.idSinfonia
WHERE F.NivelExperiencia = 'Avançado';

CREATE VIEW view_musicos_telefone AS
SELECT 
  M.Nome,
  T.Numero AS Telefone
FROM Musico M
JOIN Telefone T ON M.idTelefone = T.idTelefone;

CREATE VIEW view_musicos_salario_maior_que_media AS
SELECT Nome, Salario
FROM Musico
WHERE Salario > (
    SELECT AVG(Salario) FROM Musico
);

CREATE VIEW view_qtd_musicos_por_instrumento AS
SELECT I.Nome AS Instrumento, COUNT(M.CPF) AS Quantidade
FROM Instrumento I
LEFT JOIN Musico M ON I.idInstrumento = M.idInstrumento
GROUP BY I.Nome;

CREATE VIEW view_orquestras_mais_5_musicos AS
SELECT O.Nome, COUNT(P.Musico_CPF) AS Total
FROM Orquestra O
JOIN Pertence P ON O.idOrquestra = P.idOrquestra
GROUP BY O.idOrquestra
HAVING COUNT(P.Musico_CPF) > 5;

CREATE VIEW view_musicos_sem_orquestra AS
SELECT M.Nome
FROM Musico M
LEFT JOIN Pertence P ON M.CPF = P.Musico_CPF
WHERE P.idOrquestra IS NULL;







