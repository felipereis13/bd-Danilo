USE EscolaDeMusica;

DELETE FROM Pertence
 WHERE idOrquestra = 5 
 AND Musico_CPF = '12345678909';
 
DELETE FROM Pertence
 WHERE idOrquestra = 5 
 AND Musico_CPF = '12345678910';
 
DELETE FROM Orquestra 
WHERE idOrquestra = 10;

DELETE FROM Musico 
WHERE idTelefone = 10;

DELETE FROM Telefone 
WHERE idTelefone = 10;

DELETE FROM Funcao 
WHERE idFuncao = 10;

DELETE FROM Instrumento
 WHERE idInstrumento = 10;
 
DELETE FROM Sinfonia
 WHERE idSinfonia = 10;
 
DELETE FROM Endereco
 WHERE idEndereco = 10;
 
DELETE FROM Musico 
WHERE CPF = '12345678910';

DELETE FROM Musico
 WHERE CPF = '12345678909';
 