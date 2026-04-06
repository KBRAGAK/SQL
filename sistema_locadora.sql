CREATE DATABASE IF NOT EXISTS sistema_locadora;
USE sistema_locadora;

-- Tabela de cliente
CREATE TABLE IF NOT EXISTS cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(20) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(50) NOT NULL
);

-- Tabela de filmes
CREATE TABLE IF NOT EXISTS filme (
    id_filme INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    genero VARCHAR(20),
    ano INT,
    disponivel VARCHAR (3)
);

-- Tabela de emprestimos
CREATE TABLE IF NOT EXISTS emprestimo (
    id_emprestimo INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_filme INT,
    data_emprestimo DATE,
    data_devolucao DATE,
    FOREIGN KEY (id_cliente) REFERENCES cliente(id_cliente),
    FOREIGN KEY (id_filme) REFERENCES filme(id_filme)
);


INSERT INTO cliente (nome, cpf, telefone, email) VALUES 
('Kelvyn Braga', '123.456.789-01', '31988703910',''),
('Maria Carolina', '124.456.789-02', '31988703920',''),
('Natiele De Campos', '125.456.789-03', '31988703930',''),
('Hulk Paraiba', '126.456.789-04', '31988703940','');

INSERT INTO filme (titulo, genero, ano, disponivel) VALUES
('F1 O Filme', 'drama', 2025, 'não'),
('Como Treinar O Seu Dragão (2025)', 'ação', 2025, 'não'),
('Lilo & Stitch', 'aventura', 2025, 'não'),
('M3gan 2.0', 'ficção', 2025, 'não');


INSERT INTO emprestimo (id_cliente, id_filme, data_emprestimo, data_devolucao) VALUES
(5, 1, '2025-07-02', '2025-07-03'),
(6, 2, '2025-07-03', '2025-07-04'),
(7, 3, '2025-07-04', '2025-07-05'),
(8, 4, '2025-07-05', '2025-07-06');

SELECT*FROM cliente;

UPDATE cliente SET email = 'kelvynbraga@gmail.com' WHERE id_cliente = 5;

