-- Trigger 1: 

DELIMITER $$

CREATE TRIGGER impedir_menor_idade
BEFORE INSERT ON Musico
FOR EACH ROW
BEGIN
    IF TIMESTAMPDIFF(YEAR, NEW.DataNascimento, CURDATE()) < 18 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Músico deve ter no mínimo 18 anos.';
    END IF;
END$$

DELIMITER ;

-- Teste trigger 1:
INSERT INTO Musico (CPF, Nome, Nacionalidade, DataNascimento, Sexo, Salario, idEndereco, idTelefone, idInstrumento, idFuncao)
VALUES ('99999999999', 'José Filho', 'Brasileira', '2010-01-01', 'M', 2000, 1, 1, 1, 1);

-- Trigger 2:

DELIMITER $$

CREATE TRIGGER impedir_cpf_duplicado
BEFORE INSERT ON Musico
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Musico WHERE CPF = NEW.CPF) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'CPF já cadastrado.';
    END IF;
END$$

DELIMITER ;

-- Teste trigger 2:
INSERT INTO Musico (CPF, Nome, Nacionalidade, DataNascimento, Sexo, Salario, idEndereco, idTelefone, idInstrumento, idFuncao)
VALUES ('12345678906', 'Pedro Alves', 'Brasileira', '1995-05-05', 'M', 2500, 1, 1, 1, 1);

-- trigger 3:


DELIMITER $$

CREATE TRIGGER nacionalidade_padrao_insert
BEFORE INSERT ON Musico
FOR EACH ROW
BEGIN
    IF NEW.Nacionalidade IS NULL OR TRIM(NEW.Nacionalidade) = '' THEN
        SET NEW.Nacionalidade = 'Brasileira';
    END IF;
END$$

DELIMITER ;

-- Teste trigger 3:

INSERT INTO Musico (CPF, Nome, Nacionalidade, DataNascimento, Sexo, Salario, idEndereco, idTelefone, idInstrumento, idFuncao)
VALUES ('40404040404', 'Marcos Souza', NULL, '1985-03-03', 'M', 2500, 1, 1, 1, 1);

SELECT CPF, Nome, Nacionalidade
FROM Musico
WHERE CPF = '40404040404';

-- trigger 4:

DELIMITER $$

CREATE TRIGGER verificar_tamanho_telefone
BEFORE INSERT ON Telefone
FOR EACH ROW
BEGIN
    IF CHAR_LENGTH(NEW.Numero) < 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Número de telefone deve ter no mínimo 10 dígitos.';
    END IF;
END$$

DELIMITER ;

-- Teste trigger 4:

INSERT INTO Telefone (Numero)
VALUES ('123456789'); 

-- trigger 5:

DELIMITER $$

CREATE TRIGGER impedir_delete_endereco_usado
BEFORE DELETE ON Endereco
FOR EACH ROW
BEGIN
    IF (SELECT COUNT(*) FROM Musico WHERE idEndereco = OLD.idEndereco) > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Não é possível excluir um endereço vinculado a um músico.';
    END IF;
END$$

DELIMITER ;

-- Teste trigger 5:

DELETE FROM Endereco
WHERE idEndereco = 1;


-- trigger 6:

DELIMITER $$

CREATE TRIGGER ajustar_uf_maiusculo
BEFORE INSERT ON Endereco
FOR EACH ROW
BEGIN
    SET NEW.UF = UPPER(NEW.UF);
END$$

DELIMITER ;

-- Teste trigger 6:

INSERT INTO Endereco (idEndereco, UF, CEP, Cidade, Bairro, Rua, NumeroCasa)
VALUES (10, 'sp', '01001-000', 'São Paulo', 'Centro', 'Av. Paulista', 1000);

SELECT idEndereco, UF FROM Endereco WHERE idEndereco = 10;

