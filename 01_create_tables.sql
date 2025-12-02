-- 01_create_tables.sql
CREATE DATABASE IF NOT EXISTS clinica_medica CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE clinica_medica;

CREATE TABLE Paciente (
    CodigoPaciente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    DataNascimento DATE,
    Telefone VARCHAR(20),
    Endereco VARCHAR(200),
    DataCadastro DATE DEFAULT (CURRENT_DATE)
);

CREATE TABLE Medico (
    CodigoMedico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CRM VARCHAR(20) UNIQUE NOT NULL,
    Especialidade VARCHAR(80),
    Telefone VARCHAR(20)
);

CREATE TABLE Convenio (
    CodigoConvenio INT AUTO_INCREMENT PRIMARY KEY,
    NomeConvenio VARCHAR(100) NOT NULL,
    CNPJ CHAR(18) UNIQUE
);

CREATE TABLE Consulta (
    CodigoConsulta INT AUTO_INCREMENT PRIMARY KEY,
    CodigoPaciente INT NOT NULL,
    CodigoMedico INT NOT NULL,
    CodigoConvenio INT NULL,
    DataConsulta DATE NOT NULL,
    HoraConsulta TIME NOT NULL,
    ValorConsulta DECIMAL(10,2) NOT NULL,
    Status ENUM('Agendada','Realizada','Cancelada') DEFAULT 'Agendada',
    FOREIGN KEY (CodigoPaciente) REFERENCES Paciente(CodigoPaciente) ON DELETE RESTRICT,
    FOREIGN KEY (CodigoMedico) REFERENCES Medico(CodigoMedico) ON DELETE RESTRICT,
    FOREIGN KEY (CodigoConvenio) REFERENCES Convenio(CodigoConvenio) ON DELETE SET NULL
);

CREATE TABLE Prescricao (
    CodigoPrescricao INT AUTO_INCREMENT PRIMARY KEY,
    CodigoConsulta INT NOT NULL,
    Medicamento VARCHAR(150) NOT NULL,
    Dosagem VARCHAR(50),
    Instrucoes TEXT,
    FOREIGN KEY (CodigoConsulta) REFERENCES Consulta(CodigoConsulta) ON DELETE CASCADE
);

CREATE TABLE Exame (
    CodigoExame INT AUTO_INCREMENT PRIMARY KEY,
    CodigoConsulta INT NOT NULL,
    TipoExame VARCHAR(100) NOT NULL,
    DataSolicitacao DATE NOT NULL,
    DataResultado DATE NULL,
    Resultado LONGTEXT,
    FOREIGN KEY (CodigoConsulta) REFERENCES Consulta(CodigoConsulta) ON DELETE CASCADE
);

CREATE TABLE Conta (
    NumeroConta INT AUTO_INCREMENT PRIMARY KEY,
    CodigoConsulta INT NOT NULL UNIQUE,
    DataEmissao DATE NOT NULL,
    ValorTotal DECIMAL(10,2) NOT NULL,
    StatusPagamento ENUM('Pendente','Pago','Cancelado') DEFAULT 'Pendente',
    DataPagamento DATE NULL,
    FOREIGN KEY (CodigoConsulta) REFERENCES Consulta(CodigoConsulta) ON DELETE RESTRICT
);