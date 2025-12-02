# Sistema de Gerenciamento de Clínica Médica  
**Disciplina:** Banco de Dados  
**Projeto completo com modelagem lógica + implementação SQL (MySQL)

## Descrição do Minimundo
Sistema para controle de pacientes, médicos, consultas, convênios, prescrições, exames e contas de uma clínica médica.  
O modelo está normalizado até a 3ª Forma Normal e possui todas as restrições de integridade referencial.

## Estrutura dos Arquivos

| Arquivo                    | Descrição                                                                 |
|---------------------------|---------------------------------------------------------------------------|
| `01_create_tables.sql`    | Criação do banco e todas as 7 tabelas com PK, FK, RESTRICT e CASCADE     |
| `02_insert_dados.sql`    | Inserção de dados reais em todas as tabelas (pacientes particulares e com convênio) |
| `03_select_consultas.sql` | 5 consultas complexas usando JOIN, WHERE, GROUP BY, ORDER BY e LIMIT    |
| `04_update_delete.sql`    | 3 comandos UPDATE + 4 comandos DELETE respeitando integridade referencial |

## Como executar (passo a passo)

1. Abra o **MySQL Workbench**
2. Abra uma nova aba de query (Ctrl + T)
3. Execute os arquivos **na ordem numérica**:
   - 01 → 02 → 03 → 04
4. Pronto! O banco estará criado, populado e com todas as operações realizadas.

## Principais funcionalidades demonstradas
- Chaves primárias e estrangeiras
- Relacionamentos 1:N e 1:1
- `ON DELETE CASCADE` e `ON DELETE RESTRICT`
- Consultas com múltiplos JOINs
- Atualização e exclusão segura de dados

## Diagrama Lógico (resumo)
