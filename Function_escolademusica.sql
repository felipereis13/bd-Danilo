USE EscolaDeMusica;

-- 1. Calcula a idade do músico com base na data de nascimento
DELIMITER $$

CREATE FUNCTION calcular_idade(data_nasc DATE)
RETURNS INT
DETERMINISTIC
BEGIN
  RETURN TIMESTAMPDIFF(YEAR, data_nasc, CURDATE());
END $$
DELIMITER ;

-- 2. Retorna se o salário está acima da média dos músicos ('Sim' ou 'Não')
DELIMITER $$

CREATE FUNCTION salario_acima_media(salario DECIMAL(10,2))
RETURNS VARCHAR(3)
DETERMINISTIC
BEGIN
  DECLARE media DECIMAL(10,2);
  SELECT AVG(Salario) INTO media FROM Musico;
  IF salario > media THEN
    RETURN 'Sim';
  ELSE
    RETURN 'Não';
  END IF;
END $$
DELIMITER ;

-- 3. Conta quantos músicos tocam instrumentos de um determinado tipo (ex: 'Cordas')
DELIMITER $$

CREATE FUNCTION contar_musicos_por_tipo(tipo_instr VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE qtd INT;
  SELECT COUNT(M.CPF) INTO qtd
  FROM Musico M
  JOIN Instrumento I ON M.idInstrumento = I.idInstrumento
  WHERE I.Tipo = tipo_instr;
  RETURN qtd;
END $$
DELIMITER ;

-- 4. Retorna a quantidade de funções em uma sinfonia (por idSinfonia)
DELIMITER $$

CREATE FUNCTION qtd_funcoes_sinfonia(id_sinfonia INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE qtd INT;
  SELECT COUNT(*) INTO qtd FROM Funcao WHERE idSinfonia = id_sinfonia;
  RETURN qtd;
END $$
DELIMITER ;

-- 5. Retorna a quantidade de músicos em uma orquestra (por idOrquestra)
DELIMITER $$

CREATE FUNCTION qtd_musicos_orquestra(id_orquestra INT)
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE qtd INT;
  SELECT COUNT(*) INTO qtd FROM Pertence WHERE idOrquestra = id_orquestra;
  RETURN qtd;
END $$
DELIMITER ;

-- 6. Formata um número de telefone no formato (XX) XXXX-XXXX
DELIMITER $$

CREATE FUNCTION formatar_telefone(num VARCHAR(20))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
  RETURN CONCAT('(', SUBSTRING(num,1,2), ') ', SUBSTRING(num,3,4), '-', SUBSTRING(num,7));
END $$

DELIMITER ;

-- 7. Retorna quantos músicos moram em uma determinada cidade.
DELIMITER $$

CREATE FUNCTION musicos_por_cidade(cidade_nome VARCHAR(100))
RETURNS INT
DETERMINISTIC
BEGIN
  DECLARE total INT;
  SELECT COUNT(M.CPF) INTO total
  FROM Musico M
  JOIN Endereco E ON M.idEndereco = E.idEndereco
  WHERE E.Cidade = cidade_nome;
  RETURN total;
END $$

DELIMITER ;


-- Testes das Funções

USE EscolaDeMusica;

-- 1. Testar idade dos músicos
SELECT Nome, DataNascimento, calcular_idade(DataNascimento) AS Idade FROM Musico;

-- 2. Testar se salário está acima da média
SELECT Nome, Salario, salario_acima_media(Salario) AS AcimaDaMedia FROM Musico;

-- 3. Contar músicos que tocam instrumentos do tipo 'Cordas'
SELECT contar_musicos_por_tipo('Cordas') AS QtdMusicosCordas;

-- 4. Quantidade de funções na sinfonia de id 1
SELECT qtd_funcoes_sinfonia(1) AS TotalFuncoesSinfonia1;

-- 5. Quantidade de músicos na orquestra de id 1
SELECT qtd_musicos_orquestra(1) AS TotalMusicosOrquestra1;

-- 6. Testar formatação de telefone 
SELECT 
  Numero AS Original,
  formatar_telefone(Numero) AS Formatado
FROM Telefone;

-- 7. Quantos músicos moram na cidade 'São Paulo'?
SELECT musicos_por_cidade('São Paulo') AS TotalMusicosSP;


