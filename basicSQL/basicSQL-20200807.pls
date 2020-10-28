/*
SQL문 > SELECT문 : DML(데이터조작어)중 검색하는 명령문
SELECT 컬럼명1, {컬럼명2 AS "별칭"}
FROM 테이블명
ORDER BY 기준컬럼명 [ASC|DESC];
*/

-- 급여 컬럼을 기준으로 오름차순으로 정렬
SELECT *                --- 3
FROM EMP                --- 1
ORDER BY SAL ASC;       --- 2
SELECT *
FROM EMP
ORDER BY SAL;

-- 급여 컬럼을 기준으로 내림차순으로 정렬
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- DESC EMP;  -- EMP 테이블 정보(컬럼별 데이터타입)

-- EMP 테이블의 자료를 입사일을 <내림차순으로 정렬>하여 
-- 최근 입사한 직원을 먼저 출력하되 
-- 사원번호, 사원명, 직급, 입사일 칼럼을 출력
SELECT EMPNO, ENAME, JOB, HIREDATE
FROM EMP
ORDER BY HIREDATE DESC;

-- 급여를 많이 받는 사람부터 적게 받는 사람 순으로 순차적으로 출력
SELECT *
FROM EMP
ORDER BY SAL DESC;

-- 급여가 같은 사람이 존재할 경우
-- 이름의 철자가 빠른 사람부터 출력되도록 하려면 
-- 정렬 방식을 여러 가지로 지정해야 합니다. 
SELECT *
FROM EMP
ORDER BY SAL DESC, ENAME ASC;

-- EMP테이블에서 / 급여가 1000이상인 사원을 /
-- 급여가 높은 순으로 정렬하여 / 
-- 사원번호, 사원명, 급여를 출력하시오.
SELECT EMPNO, ENAME, SAL    -- 4
FROM EMP                    -- 1
WHERE SAL >= 1000           -- 2
ORDER BY SAL DESC;          -- 3

DESC DUAL;
SELECT * FROM DUAL;

-- 숫자함수
SELECT -10, ABS(-10)
FROM DUAL;
SELECT 34.5678, FLOOR(34.5678), ROUND(34.5678), ROUND(34.5678,2)
FROM DUAL;
SELECT ROUND(34.5678), ROUND(34.5678,0), ROUND(34.5678, -1)
FROM DUAL;
SELECT TRUNC(34.5678), TRUNC(34.5678, 2), TRUNC(34.5678, -1)
FROM DUAL;
SELECT 27/2, MOD(27,2)
FROM DUAL;

-- 사번이 홀수인 사람들을 검색
-- 홀수 : 2로 나눈 나머지 값이 1인 숫자
SELECT *
FROM EMP
WHERE MOD(EMPNO,2) = 1;

SELECT 
    'Welcome to Oracle', 
    UPPER('Welcome to Oracle'), 
    LOWER('Welcome to Oracle'), 
    INITCAP('Welcome to Oracle')
FROM DUAL;

SELECT EMPNO, ENAME, JOB
FROM EMP
WHERE JOB = upper('manager');

select 
    length('Oracle'),  -- 6
    lengthb('Oracle'), -- 6
    length('오라클'),   -- 3
    lengthb('오라클')   -- 3
from dual;
