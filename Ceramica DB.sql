-- =========================================================================
-- Contexto: Loja de cerâmica
-- =========================================================================

-- Criação do banco de dados (o nosso "container" de tabelas)
CREATE DATABASE IF NOT EXISTS CeramicaDB;
USE CeramicaDB;

-- =========================================================================
-- 1. TABELA CATEGORIA
-- * No DER em papel, o Cliente tinha o CPF como identificador (Chave Natural).
-- * DECISÃO DE PROJETO: Adotamos um 'idCliente' artificial (Surrogate Key) do tipo INT UNSIGNED. 
-- * POR QUE 'UNSIGNED'? Removemos os números negativos, dobrando o limite 
--   de clientes que o sistema pode cadastrar (de 2 bilhões para 4 bilhões).
-- =========================================================================
-- Relacionamento 1:N, uma categoria possui vários produtos, mas cada produto pertence somente a uma categoria.
-- A categoria representa a parte "1" do relacionamento
-- É uma entidade única, então é primaria
-- =========================================================================
CREATE TABLE Categoria (

idCategoria INT UNSIGNED NOT NULL PRIMARY KEY,

-- nome: Atributo simples/atômico obrigatório (NOT NULL).
Nome VARCHAR(125) NOT NULL

);

-- PARTE 2: TABELA DO PRODUTO
CREATE TABLE Produto (

  idProduto int UNSIGNED NOT NULL PRIMARY KEY,

  -- idCategoria (FK): Vai conectar as entidades
  -- Precisa ter EXATAMENTE o mesmo tipo de dado da origem (INT UNSIGNED).
  idCliente INT UNSIGNED NOT NULL,
  
  -- Alguns atributos do produto
  Nome VARCHAR(125) NOT NULL,
  Estoque DECIMAL UNSIGNED,

  -- CONSTRAINT (Restrição de Integridade Referencial):
  -- O produto precisa estar em uma categoria
  CONSTRAINT fk_categoria
    FOREIGN KEY (idCategoria)
    REFERENCES Cliente(idCategoria)
);

