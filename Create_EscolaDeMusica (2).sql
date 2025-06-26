CREATE SCHEMA  EscolaDeMusica;
USE EscolaDeMusica;

CREATE TABLE Endereco (
	idEndereco INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    UF VARCHAR(2) NOT NULL,
    CEP VARCHAR(9) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Bairro VARCHAR(100) NOT NULL,
    Rua VARCHAR(100) NOT NULL,
    Numero INT NOT NULL,
    Complemento VARCHAR(45)
);

CREATE TABLE Telefone (
	idTelefone INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Numero VARCHAR(20) NOT NULL
);

CREATE TABLE Sinfonia (
		idSinfonia INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        DataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        Compositor VARCHAR(45) NOT NULL,
        Nome VARCHAR(45) NOT NULL
);

CREATE TABLE Instrumento (
	idInstrumento INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    Nome VARCHAR(45) NOT NULL,
    Tipo VARCHAR(45) NOT NULL
);

CREATE TABLE Funcao (
		idFuncao INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
        DataFuncao DATE NOT NULL,
        NivelExperiencia VARCHAR(45) NOT NULL,
        Nome VARCHAR(45) NOT NULL,
        Categoria VARCHAR(45) NOT NULL,
        idSinfonia INT NOT NULL,
		FOREIGN KEY (idSinfonia) REFERENCES Sinfonia(idSinfonia)
);

CREATE TABLE Musico (
	CPF VARCHAR(11) PRIMARY KEY UNIQUE NOT NULL,
    Nome VARCHAR(90) NOT NULL,
    Nacionalidade VARCHAR(35) NOT NULL,
    DataNascimento DATE NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Salario DECIMAL(10,2) NOT NULL,
    idEndereco INT NOT NULL,
    idTelefone INT NOT NULL,
    idInstrumento INT NOT NULL,
    idFuncao INT NOT NULL,
    FOREIGN KEY (idEndereco) REFERENCES Endereco(idEndereco),
    FOREIGN KEY (idTelefone) REFERENCES Telefone(idTelefone),
    FOREIGN KEY (idInstrumento) REFERENCES Instrumento(idInstrumento),
    FOREIGN KEY (idFuncao) REFERENCES Funcao(idFuncao)
);

CREATE TABLE Orquestra (
	idOrquestra INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Pais VARCHAR(45) NOT NULL,
    Cidade VARCHAR(45) NOT NULL,
    DataCriacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Nome VARCHAR(45) NOT NULL,
    idSinfonia INT NOT NULL,
    FOREIGN KEY (idSinfonia) REFERENCES Sinfonia(idSinfonia)
);

CREATE TABLE Pertence (
	idOrquestra INT NOT NULL,
    Musico_CPF VARCHAR(11) NOT NULL,
    PRIMARY KEY (idOrquestra, Musico_CPF),
    FOREIGN KEY (Musico_CPF) REFERENCES Musico(CPF),
    FOREIGN KEY (idOrquestra) REFERENCES Orquestra(idOrquestra)
);


