-- 02_insert_dados.sql
USE clinica_medica;

INSERT INTO Paciente (Nome, CPF, DataNascimento, Telefone, Endereco) VALUES
('Ana Silva', '12345678901', '1990-05-15', '11987654321', 'Rua das Flores, 123 - SP'),
('Carlos Oliveira', '98765432100', '1985-11-20', '11912345678', 'Av. Paulista, 1000'),
('Maria Santos', '45678912344', '1998-03-10', '11955554444', 'Rua Augusta, 500'),
('João Pereira', '32165498777', '1975-08-30', '11988887777', 'Rua Oscar Freire, 200');

INSERT INTO Medico (Nome, CRM, Especialidade, Telefone) VALUES
('Dr. Roberto Lima', 'CRM/SP 98765', 'Cardiologia', '1133332222'),
('Dra. Fernanda Costa', 'CRM/SP 54321', 'Pediatria', '1144445555'),
('Dr. Paulo Almeida', 'CRM/SP 11223', 'Ortopedia', '1155556666');

INSERT INTO Convenio (NomeConvenio, CNPJ) VALUES
('Unimed', '12345678000199'),
('Bradesco Saúde', '98765432000111');

INSERT INTO Consulta (CodigoPaciente, CodigoMedico, CodigoConvenio, DataConsulta, HoraConsulta, ValorConsulta) VALUES
(1, 1, 1, '2025-12-05', '14:30:00', 350.00),
(2, 2, NULL, '2025-12-06', '10:00:00', 280.00),
(3, 3, 2, '2025-12-10', '16:00:00', 400.00),
(1, 2, NULL, '2025-12-15', '09:30:00', 250.00);

INSERT INTO Prescricao (CodigoConsulta, Medicamento, Dosagem, Instrucoes) VALUES
(2, 'Amoxicilina 500mg', '1 a cada 8h', 'Tomar com água');

INSERT INTO Exame (CodigoConsulta, TipoExame, DataSolicitacao) VALUES
(2, 'Hemograma', '2025-12-06');

INSERT INTO Conta (CodigoConsulta, DataEmissao, ValorTotal) VALUES
(1, '2025-12-05', 350.00),
(2, '2025-12-06', 280.00),
(3, '2025-12-10', 400.00),
(4, '2025-12-15', 250.00);