-- ================================================
-- 04_update_delete.sql
-- Projeto: Sistema de Gerenciamento de Clínica Médica
-- Objetivo: Demonstrar comandos UPDATE e DELETE respeitando
--           todas as regras de integridade referencial
-- ================================================

USE clinica_medica;

-- ======================
-- 3 COMANDOS UPDATE
-- ======================

-- 1. Marcar a consulta nº 2 como Realizada
UPDATE Consulta 
SET Status = 'Realizada' 
WHERE CodigoConsulta = 2;

-- 2. Marcar a conta da consulta nº 2 como Paga (data de hoje)
UPDATE Conta 
SET StatusPagamento = 'Pago', 
    DataPagamento = CURDATE() 
WHERE CodigoConsulta = 2;

-- 3. Atualizar o telefone da paciente Ana Silva
UPDATE Paciente 
SET Telefone = '11999998888' 
WHERE CPF = '12345678901';


-- ======================
-- 4 COMANDOS DELETE (com explicação da ordem correta)
-- ======================

-- Primeiro precisamos apagar a Conta (tem ON DELETE RESTRICT)
DELETE FROM Conta 
WHERE CodigoConsulta = 1;

-- Depois apagamos Prescrição e Exame da consulta 1
-- (elas têm ON DELETE CASCADE, mas apagamos manualmente para ficar didático)
DELETE FROM Prescricao 
WHERE CodigoConsulta = 1;

DELETE FROM Exame 
WHERE CodigoConsulta = 1;

-- Agora sim podemos apagar a própria consulta (tabela mãe)
DELETE FROM Consulta 
WHERE
    CodigoConsulta = 1;

-- ================================================
-- FIM DO SCRIPT
-- Todos os comandos respeitam a integridade referencial
-- e estão prontos para execução em sequência
-- ================================================