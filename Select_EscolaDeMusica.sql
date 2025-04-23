USE EscolaDeMusica;

-- Todos os musicos com instrumentos e funções
SELECT M.Nome, I.Nome AS Instrumento, F.Nome AS Funcao
FROM Musico M
JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
JOIN Funcao F ON M.idFuncao = F.idFuncao;

-- musicos que tocam instrumentos do tipo cordas
SELECT M.Nome, I.Nome AS Instrumento
FROM Musico M
JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
WHERE I.Tipo = 'Cordas';

-- todas as orquestras e suas sinfonias 
SELECT O.Nome AS Orquestra, S.Nome AS Sinfonia, S.Compositor
FROM Orquestra O
JOIN Sinfonia S ON O.idSinfonia = S.idSinfonia;

-- sinfonias e suas quantidades de funções
SELECT S.Nome, COUNT(F.idFuncao) AS TotalFuncoes
FROM Sinfonia S
LEFT JOIN Funcao F ON S.idSinfonia = F.idSinfonia
GROUP BY S.idSinfonia;


-- Músicos que pertencem a alguma orquestra e qual orquestra eles participam
SELECT M.Nome, O.Nome AS Orquestra
FROM Musico M
JOIN Pertence P ON M.CPF = P.Musico_CPF
JOIN Orquestra O ON P.idOrquestra = O.idOrquestra;

-- Músicos com seus endereços completos
SELECT M.Nome, E.Rua, E.Numero, E.Bairro, E.Cidade, E.UF
FROM Musico M
JOIN Endereco E ON M.idEndereco = E.idEndereco;

-- Funções com o nível de experiência Avançado
SELECT F.Nome, F.NivelExperiencia, S.Nome AS Sinfonia
FROM Funcao F
JOIN Sinfonia S ON F.idSinfonia = S.idSinfonia
WHERE F.NivelExperiencia = 'Avançado';

-- Músicos que ganham mais que a média dos salários
SELECT Nome, Salario
FROM Musico
WHERE Salario > (
    SELECT AVG(Salario) FROM Musico
);

-- Total de músicos por tipo de instrumento
SELECT I.Tipo, COUNT(M.CPF) AS Total
FROM Musico M
JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
GROUP BY I.Tipo;

-- Orquestras que tocam sinfonias de Beethoven
SELECT O.Nome
FROM Orquestra O
JOIN Sinfonia S ON O.idSinfonia = S.idSinfonia
WHERE S.Compositor = 'L. van Beethoven';

-- Músicos com CPF começando com o numero 1
SELECT Nome, CPF
FROM Musico
WHERE CPF LIKE '1%';

-- Sinfonias criadas nos últimos 2 anos
SELECT Nome, DataCriacao
FROM Sinfonia
WHERE DataCriacao >= DATE_SUB(CURDATE(), INTERVAL 2 YEAR);

-- Músicos com salário abaixo da média da orquestra que participam
SELECT M.Nome, M.Salario, O.Nome AS Orquestra
FROM Musico M
JOIN Pertence P ON M.CPF = P.Musico_CPF
JOIN Orquestra O ON P.idOrquestra = O.idOrquestra
WHERE M.Salario < (
    SELECT AVG(M2.Salario)
    FROM Musico M2
    JOIN Pertence P2 ON M2.CPF = P2.Musico_CPF
    WHERE P2.idOrquestra = P.idOrquestra
);

-- Instrumentos e quantos musicos ultilizam
SELECT I.Nome, COUNT(M.CPF) AS TotalMusicos
FROM Instrumento I
LEFT JOIN Musico M ON I.idInstrumento = M.idInstrumento
GROUP BY I.idInstrumento;


-- Orquestras e quantos musicos participam
SELECT O.Nome, COUNT(P.Musico_CPF) AS Total
FROM Orquestra O
LEFT JOIN Pertence P ON O.idOrquestra = P.idOrquestra
GROUP BY O.idOrquestra;


-- Nome e telefone de todos os músicos
SELECT M.Nome, T.Numero AS Telefone
FROM Musico M
JOIN Telefone T ON M.idTelefone = T.idTelefone;

-- Músicos por cidade
SELECT E.Cidade, COUNT(M.CPF) AS Total
FROM Musico M
JOIN Endereco E ON M.idEndereco = E.idEndereco
GROUP BY E.Cidade;

-- Todas as funções e quantos musicos tem em cada
SELECT F.idFuncao, F.Nome AS Funcao, COUNT(M.CPF) AS TotalMusicos
FROM Funcao F
LEFT JOIN Musico M ON F.idFuncao = M.idFuncao
GROUP BY F.idFuncao, F.Nome;


-- funções desempenhadas por músicos em sinfonias
SELECT 
  M.Nome AS Musico,
  F.Nome AS Funcao,
  S.Nome AS Sinfonia
FROM Musico M
JOIN Funcao F ON M.idFuncao = F.idFuncao
JOIN Sinfonia S ON F.idSinfonia = S.idSinfonia;


-- Detalhes completos dos músicos(qual função, instrumento e orquestra participam)	
SELECT M.Nome AS Musico, F.Nome AS Funcao, I.Nome AS Instrumento, O.Nome AS Orquestra
FROM Musico M
JOIN Funcao F ON M.idFuncao = F.idFuncao
JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
LEFT JOIN Pertence P ON M.CPF = P.Musico_CPF
LEFT JOIN Orquestra O ON P.idOrquestra = O.idOrquestra;

















