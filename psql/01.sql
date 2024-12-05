-- ------------------------------------------------------------------------------------
-- Comandos úteis para manutenção do banco de dados

-- 1. Renomear uma tabela
-- ALTER TABLE nome_antigo RENAME TO nome_novo;

-- 2. Renomear uma coluna em uma tabela
-- ALTER TABLE nome_tabela RENAME COLUMN coluna_antiga TO coluna_nova;

-- 3. Alterar o tipo de uma coluna
-- ALTER TABLE nome_tabela ALTER COLUMN nome_coluna TYPE novo_tipo;

-- 4. Alterar a definição de uma coluna (exemplo: adicionar/retirar NOT NULL)
-- ALTER TABLE nome_tabela ALTER COLUMN nome_coluna SET NOT NULL;
-- ALTER TABLE nome_tabela ALTER COLUMN nome_coluna DROP NOT NULL;

-- 5. Adicionar uma coluna em uma tabela
-- ALTER TABLE nome_tabela ADD COLUMN nome_coluna tipo_coluna;

-- 6. Remover uma coluna de uma tabela
-- ALTER TABLE nome_tabela DROP COLUMN nome_coluna;

-- 7. Adicionar uma chave primária
-- ALTER TABLE nome_tabela ADD CONSTRAINT nome_constraint PRIMARY KEY (nome_coluna);

-- 8. Remover uma chave primária
-- ALTER TABLE nome_tabela DROP CONSTRAINT nome_constraint;

-- 9. Adicionar uma chave estrangeira
-- ALTER TABLE nome_tabela ADD CONSTRAINT nome_constraint FOREIGN KEY (nome_coluna) REFERENCES tabela_referenciada (coluna_referenciada);

-- 10. Remover uma chave estrangeira
-- ALTER TABLE nome_tabela DROP CONSTRAINT nome_constraint;

-- 11. Adicionar um índice em uma tabela
-- CREATE INDEX nome_indice ON nome_tabela (nome_coluna);

-- 12. Remover um índice de uma tabela
-- DROP INDEX nome_indice;
