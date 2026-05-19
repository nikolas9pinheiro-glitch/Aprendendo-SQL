Lista SELECTS
/*1. Selecione todos os códigos, nomes e sobrenomes dos
funcionários, que tem salário nas faixas de 0 a
 2000 e maiores ou iguais a 5000.*/
 
 SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, SALARY
 FROM HR.EMPLOYEES
 WHERE SALARY >=0 OR SALARY >=5000; 
 
/*2. Selecione os o nome do funcionário (nome completo) e
os nomes dos departamentos dos funcionários que recebem
salários entre 1750,99 e 2000.*/
 
SELECT e.FIRST_NAME || ' ' || e.LAST_NAME AS Nome_Completo, d.DEPARTMENT_NAME AS Nome_Departamento
FROM EMPLOYEES.EMPLOYEES e
LEFT JOIN EMPLOYEES.DEPARTMENTS d 
ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
WHERE e.SALARY >= 1750.99 AND e.SALARY <= 2000;

/*3. Selecione o código, o nome do funcionário, a data de
admissão (hire date), a data de início e fim
de determinado cargo (jobs). Um funcionário pode
ter trabalhado em mais de um cargo em um período de tempo,
a tabela JOB_HISTORY tem a função de guardar
essas trocas.*/

SELECT 
    e.EMPLOYEE_ID AS Codigo_Funcionario, 
    e.FIRST_NAME || ' ' || e.LAST_NAME AS Nome_Completo, 
    e.HIRE_DATE AS Data_Admissao, 
    jh.START_DATE AS Data_Inicio_Cargo, 
    jh.END_DATE AS Data_Fim_Cargo
FROM EMPLOYEES.EMPLOYEES e
LEFT JOIN EMPLOYEES.JOB_HISTORY jh 
    ON e.EMPLOYEE_ID = jh.EMPLOYEE_ID;

/*4. Selecione o nome da região, o nome do país, onde os nomes de países
iniciem com as letras A e J.*/
 
 SELECT 
    REGIONS.REGION_NAME AS NOME_DA_REGIAO, 
    COUNTRIES.COUNTRY_NAME AS NOME_DO_PAIS
FROM COUNTRIES
INNER JOIN REGIONS 
    ON COUNTRIES.REGION_ID = REGIONS.REGION_ID
WHERE COUNTRIES.COUNTRY_NAME LIKE 'A%' 
   OR COUNTRIES.COUNTRY_NAME LIKE 'J%';
 
/*5.Fazer uma pesquisa que retorne os departamentos ordenados pela quantidade de funcionários (do que
tem mais funcionários para o que tem menos funcionários).*/

SELECT DEPARTMENTS.DEPARTMENT_NAME, COUNT(EMPLOYEES.EMPLOYEE_ID) AS QUANTIDADE_FUNCIONARIOS
FROM DEPARTMENTS
LEFT JOIN EMPLOYEES 
ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
GROUP BY DEPARTMENTS.DEPARTMENT_NAME
ORDER BY QUANTIDADE_FUNCIONARIOS DESC; 

/*6.Fazer uma pesquisa que retorne os departamentos ordenados pela quantidade de funcionários (do que
tem mais funcionários para o que tem menos funcionários). Eliminar deste resultado os departamentos
que apresentem 1 ou nenhum funcionário.*/
 
SELECT FIRST_NAME, DEPARTMENT_NAME, COUNT(*) AS QUANTIDADE, SUM(SALARY), AVG(SALARY),  MIN(SALARY), MAX(SALARY)
FROM DEPARTMENTS DEP
RIGHT JOIN EMPLOYEES EMP
ON EMP.DEPARTMENT_ID = DEP.DEPARTMENT_ID
GROUP BY DEPARTMENT_NAME, FIRST_NAME
HAVING COUNT (*) > 1 -- Equivalente ao Where, mas para agrupamentos
ORDER BY QUANTIDADE DESC;

/*7.Criar uma lista com todos os aniversariantes de empresa
 mês de novembro, nesta listagem deve ser
retornado o primeiro nome e o último nome do funcionário,
 departamento ao qual está alocado,
 a cidade, o estado e o país de sua sede,
 o dia do aniversário e quantos anos o
 funcionário está fazendo de empresa.*/
 
SELECT 
    EMPLOYEES.FIRST_NAME, 
    EMPLOYEES.LAST_NAME, 
    TO_CHAR(EMPLOYEES.HIRE_DATE, 'DD') AS DIA,
    TO_CHAR(SYSDATE, 'YYYY') - TO_CHAR(EMPLOYEES.HIRE_DATE, 'YYYY') AS ANOS, 
    LOCATIONS.CITY, 
    LOCATIONS.STATE_PROVINCE, 
    COUNTRIES.COUNTRY_NAME,
    DEPARTMENTS.DEPARTMENT_NAME
FROM EMPLOYEES
LEFT JOIN DEPARTMENTS
    ON DEPARTMENTS.DEPARTMENT_ID = EMPLOYEES.DEPARTMENT_ID
LEFT JOIN LOCATIONS 
    ON LOCATIONS.LOCATION_ID = DEPARTMENTS.LOCATION_ID
LEFT JOIN COUNTRIES 
    ON COUNTRIES.COUNTRY_ID = LOCATIONS.COUNTRY_ID
WHERE TO_CHAR(EMPLOYEES.HIRE_DATE, 'MM') = '11'
ORDER BY TO_CHAR(EMPLOYEES.HIRE_DATE, 'DD') ASC;

/*8. Criar uma listagem com os nomes dos departamentos
 que não tem funcionários alocados. Esta listagem
 deve conter apenas os nomes dos departamentos.*/
 
 
 
/*9. Mostre todos os funcionários que foram contratados após
o ano de 1995, nesta listagem deve aparecer o nome do
funcionário e o ano de contratação.*/
 
 
 
/*10. Listar o nome do funcionário e seu cargo, relacionar
apenas os funcionários que não tem definido valor de comissão.
Lembrando que 0 (zero) é valor.*/
 
 
 
/*11. Quantos funcionários tem nomes terminados
 na letra y.*/
 
 
/*12. Crie uma listagemm de cargos, que contenha a quantidade de
funcionários, o maior salário para o cargo, o
menor salário para o cargo e a média de salário.
Elimine desta listagem o departamento de código 90.
E só mostre os cargos com média salarial acima de 10000.*/
 
 
 