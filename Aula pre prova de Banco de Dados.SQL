/*
1. Descreva o script de criacao da tabela MENSALIDADE (todas as regras envolvidas). 
P  indica Primary Key (Chave Primaria); asterisco [*]  indica campo obrigatorio; 
F  indica Foreign Key (Chave Estrangeira); e PF  indica a composicao de uma F com a P.
*/

CREATE TABLE MENSALIDADE (
    RA NUMBER NOT NULL,
    ANOMES CHAR(6) NOT NULL,
    DATA_VENCIMENTO DATE NOT NULL,
    VALOR NUMBER(8,2),
    DESCONTO NUMBER(8,2)  NOT NULL,
    DATA_PAGAMENTO DATE,
    
    CONSTRAINT MENSALIDADE_PK PRIMARY KEY (ANOMES, RA),
    
    CONSTRAINT MENSALIDADE_ALUNO_FK FOREIGN KEY (RA)
        REFERENCES ALUNO (RA)
);

CREATE TABLE ALUNO (
RA NUMBER NOT NULL,
NOME VARCHAR2 (120) NOT NULL,
SEXO CHAR (1) NOT NULL,
COD_CURSO NUMBER (3),

CONSTRAINT CK_GENERO CHECK('M', 'F')  
CONSTRAINT FK_ALUNO_CURSO FOREIGN KEY (COD_CURSO) REFERENCES CURSO (COD_CURSO)
);

/*
2. Insira o curso de codigo igual a 120, com o nome Redes de Computadores.
*/

INSERT INTO (COD_CURSO, NOME) VALUES (120, 'REDES DE COMPUTADORES')

/*
3.Insira o aluno Carlos Alberto da Silva, 
masculino (M), que tem o RA igual a 17450 e faz o curso Redes de Computadores. 
*/

INSERT INTO ALUNO (RA,NOME,SEXO,COD_CURSO)
            VALUES ('17450,Carlos Alberto da Silva','M',120);

COMMIT;

/*
4. Apague os alunos de que fazem o curso Psicologia, que tem o codigo de curso igual a 150.
*/

DELETE FROM ALUNO 
WHERE COD_CURSO = 150;

-- Verificando a alteracao

SELECT * FROM ALUNO WHERE COD_CURSO = 150;

COMMIT;

5 Altere o nome do aluno de RA 16540 para Paulo Silva.

UPDATE ALUNO 
SET NOME = 'Paulo Silva'
WHERE RA = 16540

-- Verificando a alteracao

SELECT * FROM ALUNO WHERE RA = 16540;

COMMIT;

/*
6. Registre o pagamento da mensalidade do aluno Carlos Alberto da Silva 
no ano/mes (coluna: ANOMES) 202508, na data 05/08/2025 14:01:00. 
*/

UPDATE MENSALIDADE
SET DATA_PAGAMENTO = TO_DATE('05/08/2025 14:01:00', 'DD/MM/YYYY HH24:MI:SS')
WHERE RA = 17450 AND ANOMES = '202508';

-- Verificando a alteracao

SELECT * FROM MENSALIDADE WHERE RA = 17450 AND ANOMES = '202508';

COMMIT;

/*7. Foi aprovado um desconto no valor de cinquenta reais em todas as 
mensalidades do mes 10 do ano de 2025, registre esse desconto.
Lembrando que todas as mensalidades desse ano/mes ja estao geradas na 
tabela mensalidade. Coluna DESCONTO.
*/

UPDATE MENSALIDADE
SET DESCONTO = DESCONTO + 50.00
WHERE ANOMES = '202510';

SELECT MENSALIDADE
WHERE ANOMES = '202510';

-- Verificando a alteracao

COMMIT;

/*
8. Apague todo os alunos (o resultado pode ser a composicao de 2, 3, ou
n scripts, nao necessariamente 1 unico script vai resolver sempre o caso).
*/

DELETE  FROM MENSALIDADE;
DELETE  FROM ALUNO;
SELECT * FROM ALUNO;

-- Nao e normal apagar todas as linhas de registro, mas pode ocorrer.

COMMIT;

/*
9. para o ano de 2026 mes 05, houve um aumento no valor das mensalidades 
de 5,5%, altere os valores das mensalidades respectivas.
*/

UPDATE MENSALIDADE
SET VALOR = NVL(VALOR,0) *1.055
WHERE ANOMES = '202605';

/* Funcao se o valor for null troca pelo valor do parametro do NVL, 
no caso aqui e zero. */

SELECT MENSALIDADE
WHERE ANOMES = '202605';

COMMIT;

/*
10. A mensalidade do aluno Paulo Silva do mes de maio de 2026 deve ser
 deletada do sistema, pois o aluno trancou o curso.
*/

DELETE FROM MENSALIDADE
WHERE ANOMES = '202605'
  AND RA = (SELECT RA FROM ALUNO WHERE NOME = 'Paulo Silva');

-- Verificando a alteracao

SELECT FROM MENSALIDADE
WHERE ANOMES = '202605'
  AND RA = (SELECT RA FROM ALUNO WHERE NOME = 'Paulo Silva');

COMMIT;