-- 부서번호(depno)로 ASCENDING SORT 한 후 급여(sal)가 많은 사람 순으로 출력하라.
desc emp;

select *
from emp
order by deptno asc, sal desc;

SELECT 
SUBSTR('Welcome to Oracle', 4)
FROM DUAL;

SELECT 
SUBSTR('Welcome to Oracle', 4, 3)
FROM DUAL;

SELECT 
SUBSTR('Welcome to Oracle', -4, 3), length('Welcome to Oracle')
FROM DUAL;

-- 사원들의 입사년도만 출력, 입사월(달) 출력
select 
    hiredate
    , substr(hiredate,1,2) as 년도
    , substr(hiredate,4,2) as 달
from emp;

-- 9월에 입사한 사원 출력
select *
from emp
where substr(hiredate,4,2) = '09';

-- 87년도에 입사한 직원을 알아내기 위해 
-- SUBSTR 함수를 이용하여 HIREDATE 컬럼에서
-- (좌측)첫 글자부터 2개를 추출하여 그 값이 87인지를 체크하는 방법으로도 구해 보도록 하세요.
select *
from emp
where substr(hiredate, 1, 2) = '87';
--where hiredate like '87%';

-- 이름이 E로 끝나는(우측) 사원을 검색해 보도록 합시다. 
-- SUBSTR 함수를 이용하여 ENAME 컬럼의 마지막 문자 한개만 추출해서 
-- 이름이 E로 끝나는 사원을 검색해 보도록 하시오.
-- <힌트> (우측)시작 위치를 -1로 주고 추출할 문자 개수를 1로 주면 됩니다. 
select * from emp where ename like '%E';
SELECT * FROM emp
-- where substr(ename, -1, 1) = 'E';
where substr(ename, length(ename), 1) = 'E';

-- 사원의 뒤에서 두 번째자리가 E로 끝나는 사원을 검색해보자. (SUBSTR 함수)
SELECT
    *
FROM emp
-- where ename like '%E_';
where substr(ename,-2,1) = 'E';

SELECT                   -- (글자)위치 갯수              --(바이트)위치, 용량
SUBSTR('We가나e#To Oracle', 3, 4), SUBSTRB('We가나e To Oracle', 3, 4)
FROM DUAL;

SELECT 
    SUBSTR('웰컴투오라클', 3, 4), 
    SUBSTRB('웰투오라클', 6, 4)
FROM DUAL;

-- 문자열 ‘Welcome to Oracle'에 'O'가 저장된 위치
select 
    instr('Welcome to OracleO', 'O'), 
    instr('WELCOME  TO  ORACLE', 'O', 6, 2)
from dual;

SELECT 
    INSTR('WELCOME TO ORACLE', 'O', 1, 2)
FROM DUAL;

SELECT 
    LPAD('Oracle', 20, '#'),
    RPAD('Oracle', 20, '#')
FROM DUAL;

SELECT 
    LTRIM('         Oracle       ') 
FROM DUAL;
SELECT 
    RTRIM('         Oracle       ') 
FROM DUAL;
SELECT 
    TRIM('         Oracle       ') 
FROM DUAL;

SELECT 
TRIM('a' FROM 'aaaaOracleaaaa') 
FROM DUAL;
SELECT 
TRIM(' ' FROM '    Oracle    ') 
FROM DUAL;
SELECT 
    TRIM('         Oracle       ') 
FROM DUAL;

SELECT SYSDATE AS 현재날짜
FROM DUAL;

-- 각 사원들의 현재까지의 근무 일수
SELECT SYSDATE-HIREDATE AS 근무일수
FROM EMP;

SELECT 
    SYSDATE-1 AS 어제,
    SYSDATE AS 오늘,
    SYSDATE+1 AS 내일    
FROM DUAL;

SELECT 
    SYSDATE-HIREDATE,
    TRUNC(SYSDATE-HIREDATE) AS "근무일수(버림)",
    ROUND(SYSDATE-HIREDATE) AS "근무일수(반올림)"
FROM EMP;

-- 입사일로부터 근무일수가 14000일 이상이 된 사원이름,입사일,90일 후의 날,급여를 출력하라.
SELECT 
    ENAME, HIREDATE, HIREDATE+14000 "입사후 14000일후", SAL
FROM EMP
WHERE SYSDATE-HIREDATE >= 14000;

-- 입사일을 달을 기준(16일)으로 반올림
SELECT HIREDATE, ROUND(HIREDATE, 'MONTH')
FROM EMP;
-- 입사일을 달을 기준으로 버림(절삭)
SELECT HIREDATE, TRUNC(HIREDATE, 'MONTH')
FROM EMP;

SELECT 
    ENAME, SYSDATE, HIREDATE, 
    MONTHS_BETWEEN(SYSDATE, HIREDATE) -- MONTHS_BETWEEN(HIREDATE, SYSDATE)
FROM EMP;

SELECT SYSDATE, NEXT_DAY(SYSDATE, '수요일') 
FROM DUAL;

SELECT 
    SYSDATE, 
    TO_CHAR(SYSDATE, 'YYYY-MM-DD'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD'),
    TO_CHAR(SYSDATE, 'YYYY"년"MM"월"DD"일"')
FROM DUAL;
-- 입사일 '1996년 5월14일'의 형태로 사원명, 입사일을 출력하여라.
SELECT ENAME, HIREDATE, TO_CHAR(HIREDATE, 'YYYY"년" MM"월"DD"일"')
FROM EMP;

SELECT HIREDATE, TO_CHAR (HIREDATE, 'YYYY/MM/DD DAY') 
FROM EMP;
SELECT HIREDATE, TO_CHAR (HIREDATE, 'YY/MON/DD DY') 
FROM EMP;
SELECT 
    TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24:MI:SS'),
    TO_CHAR(SYSDATE, 'YYYY/MM/DD, HH24"시"MI"분"SS"초"')
FROM DUAL;

SELECT TO_CHAR (1230000) 
FROM DUAL;

SELECT ENAME, SAL, TO_CHAR(SAL, 'L999,999') 
FROM EMP;
SELECT ENAME, SAL, TO_CHAR(SAL, 'L000,000') 
FROM EMP;

SELECT ENAME, HIREDATE FROM EMP
-- WHERE HIREDATE = '81/02/20';
WHERE HIREDATE = TO_DATE(19810220,'YYYYMMDD')
DESC EMP;
-- 현재날짜(2020-08-10)에서 2008년1월1일을 뺀 결과 (2008년1월1일부터 현재까지의 날수)
-- DATE-DATE
SELECT 
    TRUNC(SYSDATE - TO_DATE('2008/01/01', 'YYYY/MM/DD'))
FROM DUAL;

SELECT ENAME, SAL, COMM, 
        SAL*12+COMM, 
        NVL(COMM, 0), SAL*12+NVL(COMM, 0) AS 연봉
FROM EMP  ORDER BY JOB;

/*
* SQL에서 NULL(널)의 의미 : NULL값, 0아님, 공문자아님
* 값이 존재하지 않음 : 통장을 개설한 적 없는 은행 고객의 계좌번호
* 해당 사항 없음 : 미혼인 고객의 결혼기념일
* 노출할 수 없는 값 : 고객 비밀번호 찾기 같은 열람을 제한해야 하는 특정 개인 정보
* 확정되지 않은 값 : 미성년자의 출신 대학
*/

SELECT *
FROM EMP
WHERE MGR IS NULL;
-- 상관(MGR)이 없는 사원만 출력하되 MGR 칼럼 값 NULL 대신 CEO로 출력해 봅시다. 
SELECT EMPNO, NVL(TO_CHAR(MGR), 'C E O')
FROM EMP
WHERE MGR IS NULL;
