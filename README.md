📑 Documentação do Sistema de Gestão de Consultas
Este script automatiza a criação, populamento e manipulação de um banco de dados para gerenciamento de atendimentos médicos.

1. Estrutura de Dados (Modelo Entidade-Relacionamento)
O banco é composto por 4 tabelas principais:

ESPECIALIDADE: Armazena as áreas de atuação médica.

PACIENTE: Cadastro de usuários com regras de CPF único e validação de gênero.

MEDICO: Cadastro de profissionais, vinculados obrigatoriamente a uma especialidade.

CONSULTA: Tabela associativa que registra o encontro entre médico e paciente, com chave primária composta (CRM, COD_PAC, DTH_AGENDADO).

2. DDL: Definição de Objetos
O código utiliza restrições (Constraints) para garantir que dados inválidos não entrem no sistema:

PRIMARY KEY: Garante a unicidade de registros em todas as tabelas.

FOREIGN KEY: Impede que uma consulta seja marcada para um médico ou paciente inexistente.

CHECK: Restrinja os valores permitidos.

Gênero: Apenas 'M' ou 'F'.

Tipo de Consulta: 'C' (Consulta) ou 'R' (Retorno).

Situação: 'A' (Agendada), 'C' (Cancelada) ou 'R' (Realizada).

3. DML: Manipulação de Dados
O script demonstra as operações fundamentais do dia a dia de um DBA:

Inserções Específicas: Uso de TO_DATE para evitar erros de formato de data/hora no banco.

Consultas Formatadas: Uso de TO_CHAR nos SELECTs para exibir datas no padrão brasileiro (DD/MM/YYYY HH24:MI:SS).

Atualizações complexas:

Alteração de horários de agendamento.

Cálculo aritmético em massa (aumento de 12% no valor da consulta).

Concatenação de strings (||) para adicionar informações ao campo de descrição sem apagar o que já existia.

4. TCL: Controle de Transações
Este é um diferencial do seu código. Você implementou o controle de persistência de dados:

COMMIT: Torna permanentes todas as alterações feitas até o momento.

SAVEPOINT: Cria um "ponto de restauração" no meio da transação.

ROLLBACK TO [SAVEPOINT]: Desfaz apenas as alterações feitas após o ponto definido, permitindo corrigir erros sem perder todo o trabalho anterior.
