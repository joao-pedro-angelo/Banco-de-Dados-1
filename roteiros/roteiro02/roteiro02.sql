-- Criando a tabela tarefas sem constraints
CREATE TABLE tarefas (
    id NUMERIC,
    descricao VARCHAR(50),
    func_resp_cpf CHAR(11),
    prioridade SMALLINT,
    status CHAR(1)
);

-- Criando a tabela funcionario sem constraints
CREATE TABLE funcionario (
    cpf CHAR(11),
    data_nasc DATE,
    nome VARCHAR(100),
    funcao VARCHAR(20),
    nivel CHAR(1),
    superior_cpf CHAR(11)
);

-- ---------------------------------------------------------------------------
-- Inserções iniciais na tabela tarefas
INSERT INTO tarefas VALUES (1, 'limpar sala', '12345678901', 1, 'P');
INSERT INTO tarefas VALUES (2, 'lavar corredor', '98765432100', 2, 'E');
INSERT INTO tarefas VALUES (3, 'apagar luzes', NULL, NULL, NULL);

-- Inserções iniciais na tabela funcionario
INSERT INTO funcionario VALUES ('12345678901', '1980-05-15', 'Carlos Silva', 'SUP_LIMPEZA', 'S', NULL);
INSERT INTO funcionario VALUES ('98765432100', '1990-02-20', 'Ana Paula', 'LIMPEZA', 'P', '12345678901');
INSERT INTO funcionario VALUES (NULL, NULL, NULL, NULL, NULL, NULL);

-- -------------------------------------------------------------------------
-- Tabela tarefas
ALTER TABLE tarefas ALTER COLUMN id SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN descricao SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN func_resp_cpf SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN prioridade SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN status SET NOT NULL;

-- Tabela funcionario
ALTER TABLE funcionario ALTER COLUMN cpf SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN funcao SET NOT NULL;
ALTER TABLE funcionario ALTER COLUMN nivel SET NOT NULL;

-- -----------------------------------------------------------------------
-- Adicionando chave primária
ALTER TABLE tarefas ADD CONSTRAINT pk_tarefas PRIMARY KEY (id);
ALTER TABLE funcionario ADD CONSTRAINT pk_funcionario PRIMARY KEY (cpf);

-- Adicionando chave estrangeira
ALTER TABLE funcionario ADD CONSTRAINT fk_superior_cpf 
    FOREIGN KEY (superior_cpf) REFERENCES funcionario (cpf);

-- ------------------------------------------------------------------------
-- Restrições de valores específicos
ALTER TABLE tarefas ADD CONSTRAINT chk_status_values 
    CHECK (status IN ('P', 'E', 'C'));

ALTER TABLE tarefas ADD CONSTRAINT chk_prioridade_values 
    CHECK (prioridade IN (0, 1, 2, 3, 4, 5));

ALTER TABLE funcionario ADD CONSTRAINT chk_funcao_values 
    CHECK (funcao IN ('LIMPEZA', 'SUP_LIMPEZA'));

ALTER TABLE funcionario ADD CONSTRAINT chk_nivel_values 
    CHECK (nivel IN ('J', 'P', 'S'));

-- -------------------------------------------------------------------------
-- Atualizando valores nulos ou inválidos nas tabelas
UPDATE tarefas SET prioridade = 0 WHERE prioridade IS NULL;
UPDATE tarefas SET status = 'P' WHERE status IS NULL;

UPDATE funcionario SET funcao = 'LIMPEZA' WHERE funcao IS NULL;
UPDATE funcionario SET nivel = 'J' WHERE nivel IS NULL;

-- -------------------------------------------------------------------------
-- Inserções válidas na tabela tarefas
INSERT INTO tarefas VALUES (4, 'limpar janelas', '99887766554', 3, 'C');

-- Inserções válidas na tabela funcionario
INSERT INTO funcionario VALUES ('11223344556', '1995-11-11', 'João Mendes', 'LIMPEZA', 'J', '12345678901');
