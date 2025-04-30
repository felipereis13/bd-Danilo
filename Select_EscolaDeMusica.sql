USE Escolademusica;

-- lista de todos os musicos com seus telefones e endereço

SELECT m.Nome 'NomeMusico',
	e.UF,
    e.Cidade,
    e.Bairro,
    e.Rua,
    e.Numero,
    t.numero 'Telefone'
	FROM Musico m
		INNER JOIN
			Endereco e ON m.idEndereco = e.idEndereco
		INNER JOIN
			Telefone t ON m.idTelefone = t.idTelefone;

-- lista dos instrumentos tocados por cada musico e o tipo de instrumento

SELECT m.Nome 'NomeMusico',
	i.Nome 'Instrumento',
    i.Tipo 'Tipo'
    FROM Musico m
		INNER JOIN
			Instrumento i ON m.idInstrumento =i.idInstrumento;
            
-- lista da quantidade de musicos por cidade

SELECT e.Cidade 'Cidade',
	COUNT(m.CPF) 'QuantidadeDeMusicos'
    FROM Musico m
		INNER JOIN
			Endereco e ON m.idEndereco = e.idEndereco
				GROUP BY
					e.cidade
				ORDER BY
					QuantidadeDeMusicos DESC;
                    
-- lista de sinfonias e quais musicos executam elas

SELECT s.Nome 'Sinfonia',
	m.Nome 'Musico'
	FROM Sinfonia s
		INNER JOIN
			Orquestra o ON s.idSinfonia = o.idSinfonia
		INNER JOIN
			Pertence p ON o.idOrquestra = p.idOrquestra
		INNER JOIN
			Musico m ON p.Musico_CPF = m.CPF
			ORDER BY 
				s.Nome, m.Nome;

-- Quantidade total de instrumentos de cada tipo

SELECT i.Tipo 'Tipo',
	COUNT(i.idInstrumento) 'QuantidadeDeInstrumentos'
		FROM Instrumento i
			GROUP BY i.Tipo
			ORDER BY QuantidadeDeInstrumentos DESC;

-- Musicos com mais de 3 Anos de experiencia

SELECT m.Nome 'Nome',
	f.Nome 'função',
    f.NivelExperiencia,
    TIMESTAMPDIFF(YEAR, f.DataFuncao, CURDATE()) 'AnosExperiencia'
		FROM Funcao f
			INNER JOIN Musico m ON f.idFuncao = m.idFuncao
				WHERE TIMESTAMPDIFF(YEAR, f.DataFuncao, CURDATE()) > 3
					ORDER BY
						AnosExperiencia DESC, f.nome;

-- Lista de instrumentos que não são usados por nenhum músico

SELECT i.Nome 'Instrumento'
		FROM Instrumento i
			LEFT JOIN Musico m ON i.idInstrumento = m.idInstrumento
				WHERE m.CPF IS NULL
					GROUP BY i.Nome;

-- Musicos e suas funções ordenados por salario

SELECT m.Nome 'Nome',
    f.Nome 'Função',
	CONCAT('R$ ', FORMAT(m.Salario, 2, 'de_DE')) AS Salario
		FROM Musico m
			INNER JOIN Funcao f ON m.idFuncao = f.idFuncao
					ORDER BY m.Salario DESC;
                    
-- Lista de Musicos ordenados por idade do mais velho ao mais novo

SELECT m.Nome 'Nome',
	TIMESTAMPDIFF(YEAR, m.DataNascimento, CURDATE()) AS Idade
		FROM Musico m
				ORDER BY Idade DESC;

-- Calcula a média salarial por tipo de instrumento

SELECT i.Tipo 'Tipo de instrumento',
	CONCAT('R$ ', FORMAT(AVG(m.Salario), 2, 'de_DE')) 'MédiaSalarial'
		FROM Musico m
			INNER JOIN Instrumento i ON m.idInstrumento = i.idInstrumento
				GROUP BY i.Tipo
					ORDER BY
						AVG(m.Salario) DESC;

-- Sinfonias e os musicos que os tocam

SELECT s.Nome 'Sinfonia',
    m.Nome 'Musico'
	FROM Sinfonia s
		INNER JOIN 
			Funcao f ON s.idSinfonia = f.idSinfonia
		INNER JOIN 
			Musico m ON f.idFuncao = m.idFuncao
				ORDER BY 
					s.Nome;

-- Quantidade de musicos por tipo de instrumentos
SELECT i.Tipo 'Instrumento',
    COUNT(m.CPF) 'Quantidade_musicos'
	FROM Instrumento i
		LEFT JOIN 
			Musico m ON i.idInstrumento = m.idInstrumento
			GROUP BY 
				i.Tipo
				ORDER BY 
					Quantidade_Musicos DESC;
	
-- Músicos que tocam instrumentos de cordas e ganham acima da média do instrumento

SELECT m.Nome,
    i.Tipo 'Instrumento',
    CONCAT('R$ ', FORMAT(m.Salario, 2, 'de_DE')) 'Salario'
FROM  Musico m
	JOIN 
		Instrumento i ON m.idInstrumento = i.idInstrumento
		WHERE 
			i.Tipo = 'Cordas'
			AND m.Salario > (SELECT AVG(Salario) FROM Musico)
				ORDER BY 
					m.Salario DESC;

-- Orquestras com o maior número de integrantes

SELECT o.Nome 'Orquestra',
    COUNT(p.Musico_CPF) 'Quantidade_Musicos'
	FROM Orquestra o
		LEFT JOIN 
			Pertence p ON o.idOrquestra = p.idOrquestra
			GROUP BY 
				o.Nome
				ORDER BY 
					Quantidade_Musicos DESC;
                    
-- Todos os musicos com instrumentos e funções
SELECT M.Nome,
	I.Nome 'Instrumento',
    F.Nome 'Funcao'
	FROM Musico M
		INNER JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
		INNER JOIN Funcao F ON M.idFuncao = F.idFuncao;

-- sinfonias e suas quantidades de funções

SELECT S.Nome,
	COUNT(F.idFuncao) 'TotalFuncoes'
	FROM Sinfonia S
		LEFT JOIN Funcao F ON S.idSinfonia = F.idSinfonia
			GROUP BY S.idSinfonia
				ORDER BY TotalFuncoes DESC;

-- Músicos que pertencem a alguma orquestra e qual orquestra eles participam
SELECT M.Nome,
	O.Nome 'Orquestra'
	FROM Musico M
		INNER JOIN Pertence P ON M.CPF = P.Musico_CPF
		INNER JOIN Orquestra O ON P.idOrquestra = O.idOrquestra;

-- musicos que tocam instrumentos do tipo cordas e quais instrumentos são
SELECT M.Nome,
	I.Nome 'Instrumento'
	FROM Musico M
		INNER JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
			WHERE I.Tipo = 'Cordas';

-- Total de músicos por tipo de instrumento

SELECT I.Tipo,
	COUNT(M.CPF) 'TotalDeMusicos'
	FROM Musico M
		INNER JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
			GROUP BY I.Tipo;

-- Orquestras que tocam sinfonias de Beethoven

SELECT O.Nome 'Orquestras que tocam Beethoven'
	FROM Orquestra O
		LEFT JOIN Sinfonia S ON O.idSinfonia = S.idSinfonia
			WHERE S.Compositor = 'L. van Beethoven';
