USE EscolaDeMusica;

CREATE VIEW vMusicos AS
	SELECT m.Nome 'NomeMusico',
		e.UF,
		e.Cidade,
		e.Bairro,
		e.Rua,
		e.Numero,
		e.Complemento,
		t.numero 'Telefone'
		FROM Musico m
			INNER JOIN
				Endereco e ON m.idEndereco = e.idEndereco
			INNER JOIN
				Telefone t ON m.idTelefone = t.idTelefone;

CREATE VIEW vSinfonias AS
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

CREATE VIEW vMusicosFuncoes AS
	SELECT m.Nome 'Nome',
		f.Nome 'Função',
		CONCAT('R$ ', FORMAT(m.Salario, 2, 'de_DE')) AS Salario
			FROM Musico m
				INNER JOIN Funcao f ON m.idFuncao = f.idFuncao
						ORDER BY m.Salario DESC;

CREATE VIEW vMediaSalarial AS
	SELECT i.Tipo 'Tipo de instrumento',
		CONCAT('R$ ', FORMAT(AVG(m.Salario), 2, 'de_DE')) 'MédiaSalarial'
			FROM Musico m
				INNER JOIN Instrumento i ON m.idInstrumento = i.idInstrumento
					GROUP BY i.Tipo
						ORDER BY
							AVG(m.Salario) DESC;

CREATE VIEW vSinfonias AS
	SELECT s.Nome 'Sinfonia',
		m.Nome 'Musico'
		FROM Sinfonia s
			INNER JOIN 
				Funcao f ON s.idSinfonia = f.idSinfonia
			INNER JOIN 
				Musico m ON f.idFuncao = m.idFuncao
					ORDER BY 
						s.Nome;

CREATE VIEW vMusicoOrquestras AS
	SELECT M.Nome,
		O.Nome 'Orquestra'
		FROM Musico M
			INNER JOIN Pertence P ON M.CPF = P.Musico_CPF
			INNER JOIN Orquestra O ON P.idOrquestra = O.idOrquestra;
        
CREATE VIEW vMusicosPorInstrumento AS
	SELECT I.Tipo,
		COUNT(M.CPF) 'TotalDeMusicos'
		FROM Musico M
			INNER JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
				GROUP BY I.Tipo;

CREATE VIEW vInstrumentoMusicos AS
	SELECT m.Nome 'NomeMusico',
		i.Nome 'Instrumento',
		i.Tipo 'Tipo'
		FROM Musico m
			INNER JOIN
				Instrumento i ON m.idInstrumento =i.idInstrumento;

CREATE VIEW vMusicos5Anos AS
	SELECT m.Nome 'Nome',
		f.Nome 'função',
		f.NivelExperiencia,
		TIMESTAMPDIFF(YEAR, f.DataFuncao, CURDATE()) 'AnosExperiencia'
			FROM Funcao f
				INNER JOIN Musico m ON f.idFuncao = m.idFuncao
					WHERE TIMESTAMPDIFF(YEAR, f.DataFuncao, CURDATE()) > 3
						ORDER BY
							AnosExperiencia DESC, f.nome;

CREATE VIEW vInstrumentosNUsados AS
	SELECT i.Nome 'Instrumento'
		FROM Instrumento i
			LEFT JOIN Musico m ON i.idInstrumento = m.idInstrumento
				WHERE m.CPF IS NULL
					GROUP BY i.Nome;







