USE EscolaDeMusica;

INSERT INTO Endereco (UF, CEP, Cidade, Bairro, Rua, Numero, Complemento) VALUES
('SP', '01001-000', 'São Paulo', 'Centro', 'Av. Paulista', 1000, 'Apto 1'),
('RJ', '20010-000', 'Rio de Janeiro', 'Centro', 'Rua Uruguaiana', 85, 'Sala 2'),
('MG', '30110-000', 'Belo Horizonte', 'Savassi', 'Rua da Bahia', 300, 'Apto 3'),
('PR', '80010-000', 'Curitiba', 'Centro', 'Av. Sete de Setembro', 400, 'Sala 4'),
('BA', '40010-000', 'Salvador', 'Barra', 'Av. Oceânica', 123, 'Apto 5'),
('PE', '50010-000', 'Recife', 'Boa Viagem', 'Rua dos Navegantes', 56, 'Casa 6'),
('RS', '90010-000', 'Porto Alegre', 'Moinhos', 'Rua Padre Chagas', 321, 'Apto 7'),
('CE', '60010-000', 'Fortaleza', 'Aldeota', 'Av. Santos Dumont', 234, 'Casa 8'),
('DF', '70010-000', 'Brasília', 'Asa Sul', 'SQS 106', 10, 'Bloco C'),
('SC', '88010-000', 'Florianópolis', 'Centro', 'Rua Felipe Schmidt', 567, 'Apto 9');

INSERT INTO Telefone (Numero) VALUES
('11999999991'), ('21999999992'), ('31999999993'), ('41999999994'),
('71999999995'), ('81999999996'), ('51999999997'), ('85999999998'),
('61999999999'), ('48999999990');

INSERT INTO Sinfonia (Compositor, Nome) VALUES
('Beethoven', '5ª Sinfonia'), ('Mozart', 'Sinfonia nº 40'), ('Bach', 'Brandenburgo nº 3'),
('Tchaikovsky', 'Sinfonia nº 6'), ('Mahler', 'Sinfonia nº 5'), ('Brahms', 'Sinfonia nº 1'),
('Schubert', 'Inacabada'), ('Dvořák', 'Do Novo Mundo'), ('Mendelssohn', 'Italiana'),
('Shostakovich', 'Sinfonia nº 7');

INSERT INTO Instrumento (Nome, Tipo) VALUES
('Violino', 'Cordas'), ('Viola', 'Cordas'), ('Violoncelo', 'Cordas'),
('Contrabaixo', 'Cordas'), ('Flauta', 'Madeiras'), ('Oboé', 'Madeiras'),
('Clarinete', 'Madeiras'), ('Fagote', 'Madeiras'), ('Trompete', 'Metais'),
('Trombone', 'Metais');

INSERT INTO Funcao (DataFuncao, NivelExperiencia, Nome, Categoria, idSinfonia) VALUES
('2023-01-10', 'Avançado', 'Spalla', 'Cordas', 1), ('2023-02-11', 'Intermediário', 'Solista', 'Cordas', 2),
('2023-03-12', 'Iniciante', 'Apoio', 'Cordas', 3), ('2018-04-13', 'Avançado', 'Solista', 'Madeiras', 4),
('2023-05-14', 'Intermediário', 'Apoio', 'Metais', 5), ('2017-06-15', 'Avançado', 'Regente', 'Regência', 6),
('2023-07-16', 'Avançado', 'Solista', 'Cordas', 7), ('2022-08-17', 'Intermediário', 'Apoio', 'Madeiras', 8),
('2023-09-18', 'Iniciante', 'Estagiário', 'Cordas', 9), ('2020-10-19', 'Avançado', 'Spalla', 'Cordas', 10);

INSERT INTO Musico (CPF, Nome, Nacionalidade, DataNascimento, Sexo, Salario, idEndereco, idTelefone, idInstrumento, idFuncao) VALUES
('12345678901', 'João Silva', 'Brasileira', '1990-01-01', 'M', 3000.00, 1, 1, 2, 1),
('12345678902', 'Maria Souza', 'Brasileira', '1985-05-15', 'F', 3200.00, 2, 2, 2, 2),
('12345678903', 'Pedro Lima', 'Brasileira', '1992-03-20', 'M', 2800.00, 3, 3, 4, 3),
('12345678904', 'Ana Paula', 'Brasileira', '1994-07-22', 'F', 3100.00, 4, 4, 4, 4),
('12345678905', 'Carlos Mendes', 'Brasileira', '1988-11-30', 'M', 2900.00, 5, 5, 3, 5),
('12345678906', 'Mariana Rocha', 'Brasileira', '1991-09-12', 'F', 3050.00, 6, 6, 2, 6),
('12345678907', 'Lucas Almeida', 'Brasileira', '1993-04-18', 'M', 3150.00, 7, 7, 5, 7),
('12345678908', 'Fernanda Costa', 'Brasileira', '1996-08-23', 'F', 3250.00, 8, 8, 8, 8),
('12345678909', 'Bruno Dias', 'Brasileira', '1987-12-25', 'M', 2800.00, 9, 9, 9, 9),
('12345678910', 'Camila Martins', 'Brasileira', '1995-06-10', 'F', 3300.00, 10, 10, 10, 10);

INSERT INTO Orquestra (Pais, Cidade, Nome, idSinfonia) VALUES
('Brasil', 'São Paulo', 'Orquestra Sinfônica SP', 1), ('Brasil', 'Rio de Janeiro', 'Orquestra Petrobrás', 2),
('Brasil', 'Belo Horizonte', 'Orquestra Filarmônica MG', 3), ('Brasil', 'Curitiba', 'Orquestra de Câmara PR', 4),
('Brasil', 'Salvador', 'Orquestra Neojiba', 5), ('Brasil', 'Recife', 'Orquestra Recife', 6),
('Brasil', 'Porto Alegre', 'Orquestra Sinfônica RS', 7), ('Brasil', 'Fortaleza', 'Orquestra Sinfônica CE', 8),
('Brasil', 'Brasília', 'Orquestra Nacional', 9), ('Brasil', 'Florianópolis', 'Orquestra SC', 10);

INSERT INTO Pertence (idOrquestra, Musico_CPF) VALUES
(1, '12345678901'), (1, '12345678902'), (2, '12345678903'),
(2, '12345678904'), (3, '12345678905'), (3, '12345678906'),
(4, '12345678907'), (4, '12345678908'), (5, '12345678909'),
(5, '12345678910');
