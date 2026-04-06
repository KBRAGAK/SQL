CREATE DATABASE IF NOT EXISTS sistema_cinema;
USE sistema_cinema;

-- Tabela de filmes
CREATE TABLE IF NOT EXISTS filme (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(20),
    duracao VARCHAR(10),
    faixa_etaria INT
);

-- Tabela de salas
CREATE TABLE IF NOT EXISTS sala (
    id_sala INT AUTO_INCREMENT PRIMARY KEY,
    tecnologia VARCHAR(100) NOT NULL,
    capacidade INT
);

-- Tabela de clientes
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20),
    idade INT
);

-- Tabela de sessões
CREATE TABLE IF NOT EXISTS sessao (
    id_sessao INT AUTO_INCREMENT PRIMARY KEY,
    id_filme INT,
    id_sala INT,
    horario TIME NOT NULL,
    data_sessao DATE NOT NULL,
    idioma VARCHAR(100),
    FOREIGN KEY (id_filme) REFERENCES filme(id_filme),
    FOREIGN KEY (id_sala) REFERENCES sala(id_sala)
);

-- Tabela de ingressos
CREATE TABLE IF NOT EXISTS ingresso (
    id_ingresso INT AUTO_INCREMENT PRIMARY KEY,
    id_filme INT,
    id_sala INT,
    id_cliente INT,
    id_sessao INT,
    pagamento VARCHAR(100) NOT NULL,
    assento INT NOT NULL,
    FOREIGN KEY (id_filme) REFERENCES filme(id_filme),
    FOREIGN KEY (id_sala) REFERENCES sala(id_sala),
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_sessao) REFERENCES sessao(id_sessao)
);


INSERT INTO filme (titulo, genero, duracao, faixa_etaria) VALUES
('F1 O Filme', 'drama', '156 min', '12'),
('Como Treinar O Seu Dragão (2025)', 'ação', '125 min', 10),
('Lilo & Stitch', 'aventura', '108 min', 10),
('M3gan 2.0', 'ficção', '119 min', 16);

INSERT INTO sala (tecnologia, capacidade) VALUES
('IMAX','60'),
('2D', '60'),
('2D', '60'),
('3D', '30');

INSERT INTO sessao (id_filme, id_sala, horario, data_sessao, idioma) VALUES
('1','1','18:00:00', '2025-07-02', 'dublado'),
('2','2','20:00:00', '2025-07-02', 'dublado'),
('3','3','22:00:00', '2025-07-02', 'legendado'),
('4','4','22:00:00', '2025-07-02', 'legendado');

INSERT INTO cliente (nome, cpf, idade) VALUES 
('Kelvyn Braga', '123.456.789-01', '25'),
('Maria Carolina', '124.456.789-02', '21'),
('Natiele De Campos', '125.456.789-03', '21'),
('Hulk Paraiba', '126.456.789-04', '39'),
('Teste', '126.456.789-10', '40');

INSERT INTO ingresso (id_filme, id_sala, id_cliente, id_sessao, pagamento, assento) VALUES
('1','1','1','1','pix','13'),
('2','2','2','2','crédito','32'),
('3','3','3','3','débito','60'),
('4','4','4','4','débito','7');

SELECT*FROM cliente;

SELECT*FROM cliente WHERE idade > 21;

UPDATE cliente SET idade = 26 WHERE id_cliente = 4;

DELETE FROM cliente WHERE id_cliente = 5;