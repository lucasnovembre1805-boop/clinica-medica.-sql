-- CONSULTA 1: Todas as consultas da paciente Ana Silva (com nome do médico)
SELECT 
    p.Nome AS Paciente,
    m.Nome AS Médico,
    c.DataConsulta,
    c.HoraConsulta,
    c.ValorConsulta,
    c.Status
FROM Consulta c
JOIN Paciente p ON c.CodigoPaciente = p.CodigoPaciente
JOIN Medico m ON c.CodigoMedico = m.CodigoMedico
WHERE p.Nome LIKE '%Ana%';
-- CONSULTA 2: Consultas com valor acima de R$ 300,00
SELECT 
    CodigoConsulta,
    DataConsulta,
    HoraConsulta,
    ValorConsulta
FROM Consulta 
WHERE ValorConsulta > 300.00
ORDER BY ValorConsulta DESC;
-- CONSULTA 3: Quantas consultas cada médico tem?
SELECT 
    m.Nome,
    m.Especialidade,
    COUNT(c.CodigoConsulta) AS Total_de_Consultas
FROM Consulta c
JOIN Medico m ON c.CodigoMedico = m.CodigoMedico
GROUP BY m.CodigoMedico
ORDER BY Total_de_Consultas DESC;
-- CONSULTA 4: Pacientes particulares (sem convênio)
SELECT DISTINCT
    p.Nome,
    p.Telefone
FROM Consulta c
JOIN Paciente p ON c.CodigoPaciente = p.CodigoPaciente
WHERE c.CodigoConvenio IS NULL;
-- CONSULTA 5: Contas ainda pendentes com nome do paciente
SELECT 
    co.NumeroConta,
    p.Nome AS Paciente,
    co.ValorTotal,
    co.DataEmissao
FROM Conta co
JOIN Consulta c ON co.CodigoConsulta = c.CodigoConsulta
JOIN Paciente p ON c.CodigoPaciente = p.CodigoPaciente
WHERE co.StatusPagamento = 'Pendente'
ORDER BY co.DataEmissao;