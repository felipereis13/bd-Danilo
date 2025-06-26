-- cadastra um novo usuario
DELIMITER $$
	CREATE PROCEDURE CadastrarNovoMusico(
		IN pCPF VARCHAR(11),
		IN pNome VARCHAR(90),
		IN pNacionalidade VARCHAR(35),
		IN pDataNascimento DATE,
		IN pSexo ENUM('M', 'F'),
		IN pSalario DECIMAL(10,2),
		IN pIdEndereco INT,
		IN pIdTelefone INT,
		IN pIdInstrumento INT,
		IN pIdFuncao INT
	)
	BEGIN
		INSERT INTO Musico (CPF, Nome, Nacionalidade, DataNascimento, Sexo, Salario, idEndereco, idTelefone, idInstrumento, idFuncao)
		VALUES (pCPF, pNome, pNacionalidade, pDataNascimento, pSexo, pSalario, pIdEndereco, pIdTelefone, pIdInstrumento, pIdFuncao);
	END $$
DELIMITER ;

CALL CadastrarNovoMusico(
	'12345678911',
	'Igor Fernandes',
	'Brasileira',
	'1997-10-05',
	'M',
	3000.00,
	1,  -- idEndereco
	1,  -- idTelefone
	1,  -- idInstrumento
	1   -- idFuncao
);

-- Listar Orquestras por cidade
DELIMITER $$
	CREATE PROCEDURE ListarOrquestra(IN cidadeBuscada VARCHAR(45))
    BEGIN
		SELECT O.Nome, O.Cidade, O.Pais FROM orquestra O WHERE cidade = cidadeBuscada;
    END $$
DELIMITER ;

CALL ListarOrquestra('Belo Horizonte');

-- Aumenta o Salario do musico por Categoria
DELIMITER $$
	CREATE PROCEDURE AumentarSalario(
		IN categoriaFuncao VARCHAR(45),
        IN percentual DECIMAL(5,2)
	)
	BEGIN 
		UPDATE Musico
			SET Salario = Salario * (1 + (percentual / 100))
            WHERE idFuncao IN (
				SELECT idFuncao FROM Funcao WHERE Categoria = categoriaFuncao
			);
    END $$
DELIMITER ;

CALL AumentarSalario('Cordas', 10);

-- Listar Musicos Por Instrumento
DELIMITER $$
CREATE PROCEDURE ListarMusicos(IN nomeInstrumento VARCHAR(45))
BEGIN
	SELECT M.Nome, M.CPF, I.Nome AS Instrumento
	FROM Musico M
	INNER JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
	WHERE I.Nome = nomeInstrumento;
END $$
DELIMITER ;

CALL ListarMusicos('Violino');

-- Contar a quantidade de musicos por sexo
DELIMITER $$
CREATE PROCEDURE ContarMusicosPorSexo()
BEGIN
	SELECT Sexo, COUNT(*) AS Quantidade
	FROM Musico
	GROUP BY Sexo;
END $$
DELIMITER ;

CALL ContarMusicosPorSexo();

-- Buscar dados de musico por CPF
DELIMITER $$
CREATE PROCEDURE BuscarDetalhesDoMusico(IN cpfBuscado VARCHAR(11))
BEGIN
	SELECT M.CPF, M.Nome, M.Salario, M.Sexo, 
		   E.Cidade, E.Bairro, E.Rua, E.Numero,
		   T.Numero AS Telefone,
		   I.Nome AS Instrumento, I.Tipo,
		   F.Nome AS Funcao, F.Categoria, F.NivelExperiencia
	FROM Musico M
		INNER JOIN Endereco E ON M.idEndereco = E.idEndereco
		INNER JOIN Telefone T ON M.idTelefone = T.idTelefone
		INNER JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
		INNER JOIN Funcao F ON M.idFuncao = F.idFuncao
			WHERE M.CPF = cpfBuscado;
END $$
DELIMITER ;

CALL BuscarDetalhesDoMusico('12345678901');
