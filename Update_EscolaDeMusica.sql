USE EscolaDeMusica;

UPDATE Musico
SET Salario = Salario * 1.10
WHERE CPF IN (
    SELECT CPF FROM (
        SELECT CPF FROM Musico WHERE Salario < 3100
    ) AS sub
);

UPDATE Musico
 SET Nome = 'João da Silva'
 WHERE CPF = '12345678901';
 
UPDATE Endereco
 SET Complemento = 'Bloco A'
 WHERE idEndereco = 1;
 
UPDATE Telefone 
SET Numero = '11988888888' 
WHERE idTelefone = 1;

UPDATE Funcao 
SET NivelExperiencia = 'Especialista'
WHERE idFuncao = 1;
 
UPDATE Instrumento
SET Tipo = 'Sopros'
WHERE idInstrumento IN (
    SELECT idInstrumento FROM (
        SELECT idInstrumento FROM Instrumento WHERE Nome = 'Trompete'
    ) AS sub
);

UPDATE Orquestra 
SET Cidade = 'Campinas'
 WHERE idOrquestra = 1;
 
UPDATE Sinfonia
 SET Compositor = 'L. van Beethoven' 
 WHERE idSinfonia = 1;
 
UPDATE Musico 
SET idEndereco = 2 
WHERE CPF = '12345678903';

UPDATE Musico 
SET idTelefone = 3
 WHERE CPF = '12345678903';