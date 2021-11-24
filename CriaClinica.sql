/*******************************************************************************
*                                                                              *
* Criado por :                                                                 *
*            Marilene Esquiavoni                                               *
*            Denny Paulista Azevedo Filho                                      *
*                                                                              *
* Total de Dominios, Tabelas e Indices:                                        *
*                                                                              *
*     Dominios: 0                                                              *
*     Tabelas: 9                                                               *
*     Indices:                                                                 *
*       primary key: 9                                                         *
*       foreign key: 3                                                         *
*       Alter key: 0                                                           *
*                                                                              *
*******************************************************************************/

/*******************************************************************************
*                                                                              *
*                              Tabelas Clinicas                                *
*                                                                              *
*******************************************************************************/

/* Tabela Profissional - Dados dos m�dicos, dentistas, etc */
create table Profissional (
       PRO_Codigo           smallint not null,
       PRO_Nome             varchar(40),
       ATU_Codigo           smallint not null,
       PRO_Registro         varchar(10),
       PRO_Nasc             date,
       PRO_EstCivil         EstadoCivil default 'CASADO' not null,
       PRO_Rua              varchar(40) not null,
       PRO_Num              smallint,
       PRO_Comple           varchar(30),
       PRO_Bairro           varchar(40),
       PRO_CEP              char(8),
       CID_Codigo           smallint not null,
       PRO_EMail            varchar(40),
       PRO_Internet         varchar(45),
       PRO_Tel1             Fone,
       PRO_Fax              Fone,
       PRO_Celular          Fone,
       PRO_Bip              Fone,
       PRO_CodBip           varchar(10),
       PRO_RG               varchar(15),
       PRO_CPF              char(11),
       PRO_Foto             BLOB SUB_TYPE 0,
       PRO_Obs              BLOB SUB_TYPE 1,
       PRO_DataCad          date default current_date not null
);
alter table Profissional add constraint PK_Profissional primary key (PRO_Codigo);
ALTER TABLE Profissional ADD CONSTRAINT FK_CidadeProf FOREIGN KEY (CID_Codigo) REFERENCES Cidade
            on update cascade;
ALTER TABLE Profissional ADD CONSTRAINT FK_AtuacaoProf FOREIGN KEY (ATU_Codigo) REFERENCES Atuacao
            on update cascade;
CREATE INDEX iPRO_Nome ON Profissional (PRO_Nome);

/* Tabela Especializa��o - Dados sobre as especializa��es dos Profissionais */
CREATE TABLE Especializacao (
       ESP_Codigo           smallint NOT NULL,
       ESP_Nome             VARCHAR(30) NOT NULL
);
ALTER TABLE Especializacao ADD CONSTRAINT PK_Especializacao PRIMARY KEY (ESP_Codigo);

/* Tabela de LIGA��O - Profissional -> Especializacao */
CREATE TABLE Profi_Espec (
       PRO_Codigo           SMALLINT NOT NULL,
       ESP_Codigo           INTEGER NOT NULL
);
ALTER TABLE Profi_Espec ADD CONSTRAINT PK_ProfEsp PRIMARY KEY (PRO_Codigo, ESP_Codigo);
ALTER TABLE Profi_Espec ADD CONSTRAINT FK_Esp_ProfEsp FOREIGN KEY (ESP_Codigo) REFERENCES Especializacao
            on update cascade;
ALTER TABLE Profi_Espec ADD CONSTRAINT FK_Prof_ProfEsp FOREIGN KEY (PRO_Codigo) REFERENCES Profissional
            on update cascade on delete cascade;

/* Tabela Servicos - Dados dos servi�os (ex: Consulta) prestador pelo Profissional */
CREATE TABLE Servicos (
       SER_Codigo           smallint NOT NULL,
       SER_Descricao        VARCHAR(30) NOT NULL
);
ALTER TABLE Servicos ADD CONSTRAINT PK_Servicos PRIMARY KEY (SER_Codigo);

/* Tabela de LIGA��O - Profissional -> Servicos - Utilizada para Horarios */
CREATE TABLE Ser_Prof (
       SPF_Codigo           smallint NOT NULL,
       SER_Codigo           smallint NOT NULL,
       PRO_Codigo           SMALLINT NOT NULL
);
ALTER TABLE Ser_Prof ADD CONSTRAINT PK_SerProf PRIMARY KEY (SPF_Codigo);
ALTER TABLE Ser_Prof ADD CONSTRAINT FK_SerProf_Prof FOREIGN KEY (PRO_Codigo) REFERENCES Profissional
            on update cascade on delete cascade;
ALTER TABLE Ser_Prof ADD CONSTRAINT FK_SerProf_Ser FOREIGN KEY (SER_Codigo) REFERENCES Servicos
            on update cascade;
            
/* Tabela Horario - Dados de disponibilidade do Profissional para agendamentos */
CREATE TABLE Horario (
       SPF_Codigo           smallint NOT NULL,
       HOR_Codigo           INTEGER NOT NULL,
       HOR_DiaSemana        VARCHAR(7) NOT NULL CHECK (HOR_DiaSemana IN ('SEGUNDA', 'TER�A', 'QUARTA', 'QUINTA', 'SEXTA', 'SABADO', 'DOMINGO')),
       HOR_Periodo          VARCHAR(10) NOT NULL CHECK (HOR_Periodo IN ('MATUTINO', 'VERPERTINO', 'NOTURNO')),
       HOR_HoraInicio       TIME NOT NULL,
       HOR_HoraFinal        TIME NOT NULL,
       HOR_Intervalo        INTEGER NOT NULL,
       HOR_DtLimite         date not null
);
ALTER TABLE Horario ADD CONSTRAINT PK_Horario PRIMARY KEY (SPF_Codigo, HOR_Codigo);
ALTER TABLE Horario ADD CONSTRAINT FK_SerProf_Hora FOREIGN KEY (SPF_Codigo) REFERENCES Ser_Prof
            on update cascade on delete cascade;
            
/* Tabela Convenio - Dados dos Convenios utilizados e aceitos */
CREATE TABLE Convenio (
       CON_Codigo           INTEGER NOT NULL,
       CON_Descricao        VARCHAR(40) NOT NULL,
       CON_Retorno          CHAR(2) NOT NULL,
       CON_Rua              VARCHAR(40),
       CON_Num              SMALLINT,
       CON_Comple           VARCHAR(30),
       CON_Bairro           VARCHAR(40),
       CON_CEP              CHAR(8),
       CID_Codigo           SMALLINT DEFAULT 5255 NOT NULL,
       CON_EMail            VARCHAR(40),
       CON_Contato          VARCHAR(30),
       CON_Tel1             Fone,
       CON_Tel2             Fone,
       CON_Fax              Fone,
       CON_IndProced        Percentual,
       CON_TabProced        VARCHAR(15),
       CON_IndMate          Percentual,
       CON_TabMate          VARCHAR(15),
       CON_IndTaxa          Percentual,
       CON_TabTaxa          VARCHAR(15),
       CON_DataCad          DATE NOT NULL
);
ALTER TABLE Convenio ADD CONSTRAINT PK_Convenio PRIMARY KEY (CON_Codigo);
ALTER TABLE Convenio ADD CONSTRAINT FK_CidadeConv FOREIGN KEY (CID_Codigo) REFERENCES Cidade
            on update cascade;
            
/* Tabela Paciente - Dados dos Pacientes */
CREATE TABLE Paciente (
       PAC_Codigo           INTEGER NOT NULL,
       PAC_Nome             VARCHAR(40) NOT NULL,
       PAC_Nasc             DATE,
       PAC_Sexo             Sexo NOT NULL,
       PAC_Cor              Cor NOT NULL,
       PAC_EstCivil         EstadoCivil DEFAULT 'CASADO' NOT NULL,
       PAC_Indicado         VARCHAR(30),
       PAC_Profissao        VARCHAR(35),
       PAC_Rua              VARCHAR(40) NOT NULL,
       PAC_Num              SMALLINT,
       PAC_Comple           VARCHAR(30),
       PAC_Bairro           VARCHAR(40),
       PAC_CEP              CHAR(8),
       CID_Codigo           SMALLINT DEFAULT 5255 NOT NULL,
       PAC_EMail            VARCHAR(40),
       PAC_Internet         VARCHAR(45),
       PAC_Tel1             Fone,
       PAC_Tel2             Fone,
       PAC_Celular          Fone,
       PAC_RG               VARCHAR(15),
       PAC_CPF              CHAR(11),
       PAC_Pai              VARCHAR(35),
       PAC_Mae              VARCHAR(35),
       PAC_Foto             BLOB SUB_TYPE 0,
       PAC_Obs              BLOB SUB_TYPE 1,
       PAC_DataCad          DATE NOT NULL
);
CREATE INDEX iPAC_Nome ON Paciente (PAC_Nome);
ALTER TABLE Paciente ADD CONSTRAINT PK_Paciente PRIMARY KEY (PAC_Codigo);
ALTER TABLE Paciente ADD CONSTRAINT FK_CidadePac FOREIGN KEY (CID_Codigo) REFERENCES Cidade
            on update cascade;
            
/* Tabela ListaEspera - Dados de Pacientes aguardando hor�rio para atendimento */
CREATE TABLE ListaEspera (
       SPF_Codigo           smallint NOT NULL,
       PAC_Codigo           INTEGER NOT NULL,
       LIS_DataCad          DATE NOT NULL,
       LIS_Tipo             VARCHAR(13),
       CON_Codigo           smallint default 1 NOT NULL
);
ALTER TABLE ListaEspera ADD CONSTRAINT PK_ListaEspera PRIMARY KEY (SPF_Codigo,PAC_Codigo, LIS_DataCad);
ALTER TABLE ListaEspera ADD CONSTRAINT FK_ListaEsp_SerProf FOREIGN KEY (SPF_Codigo) REFERENCES Ser_Prof
            on update cascade on delete cascade;
ALTER TABLE ListaEspera ADD CONSTRAINT FK_PacListaEsp FOREIGN KEY (PAC_Codigo) REFERENCES Paciente
            on update cascade on delete cascade;
ALTER TABLE ListaEspera ADD CONSTRAINT FK_ConListaEsp FOREIGN KEY (CON_Codigo) REFERENCES Convenio
            on update cascade on delete set default;

/* Tabela Agenda - Dados de agendamento dos pacientes */
CREATE TABLE Agenda (
       SPF_Codigo           INTEGER NOT NULL,
       AGE_Data             DATE NOT NULL,
       AGE_Horario          TIME NOT NULL,
       HOR_Codigo           INTEGER NOT NULL,
       PAC_Codigo           INTEGER NOT NULL,
       AGE_Tipo             VARCHAR(13),
       CON_Codigo           INTEGER NOT NULL,
       AGE_Obs              BLOB SUB_TYPE 1
);
ALTER TABLE Agenda ADD CONSTRAINT PK_Agenda PRIMARY KEY (SPF_Codigo, AGE_Data,AGE_Horario, HOR_Codigo);
ALTER TABLE Agenda ADD CONSTRAINT FK_ConvAgenda FOREIGN KEY (CON_Codigo) REFERENCES Convenio
            on update cascade;
ALTER TABLE Agenda ADD CONSTRAINT FK_ProSerAge FOREIGN KEY (SPF_Codigo, HOR_Codigo) REFERENCES Horario
            on update cascade on delete cascade;
ALTER TABLE Agenda ADD CONSTRAINT FK_PacAgenda FOREIGN KEY (PAC_Codigo) REFERENCES Paciente
            on update cascade;
            
/* Tabela SalaEspera - Dados dos pacientes agendados que est�o aguardando atendimento */
CREATE TABLE SalaEspera (
       SAL_DataChega        DATE NOT NULL,
       SAL_HoraChega        TIME NOT NULL,
       SPF_Codigo           INTEGER,
       AGE_Data             DATE NOT NULL,
       AGE_Horario          TIME NOT NULL,
       HOR_Codigo           INTEGER
);
ALTER TABLE SalaEspera ADD CONSTRAINT PK_SalaEspera PRIMARY KEY (SAL_DataChega,SAL_HoraChega);
ALTER TABLE SalaEspera ADD CONSTRAINT FK_AgendaSala FOREIGN KEY (SPF_Codigo, AGE_Data, AGE_Horario,HOR_Codigo)
            REFERENCES Agenda on update cascade on delete cascade;








