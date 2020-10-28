-- 한줄 주석

/*
여러줄 
주석
*/

select * from tab;
-- 테이블 구조 조회 명령어 : DESC(describe의 약자)

desc emp;
desc dept;

-- 테이블 검색(조회) 명령어 : SELECT
-- EMP 테이블에서 전체 사원 정보 검색 (모든 컬럼명)
select * from emp;
SELECT * FROM EMP;

-- EMP테이블에서 사원번호와 사원이름만 검색
SELECT EMPNO, ENAME FROM EMP;
SELECT ENAME, EMPNO FROM EMP;
SELECT * FROM EMP;
SELECT EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO 
FROM EMP;

-- 사원테이블의 사원의 사원명, 급여와 연봉(급여*12)을 검색하시오.
SELECT ENAME, SAL, SAL*12
FROM EMP;

/*
사원의 이름과 급여와 입사일자만을 출력하는 SQL 문을 작성해 보시오.
<힌트> 사원 정보가 저장된 테이블의 이름은 EMP이고, 
사원이름 칼럼은 ENAME, 급여 칼럼은 SAL, 
입사일자 칼럼은 HIREDATE입니다.
*/

DESC EMP;
SELECT
    ENAME AS 사원명,
    SAL AS 급여,
    HIREDATE 입사일
FROM EMP;

-- 컬럼명에 사칙연산
SELECT SAL, COMM, SAL + COMM FROM EMP;
SELECT SAL, SAL - 100 FROM EMP;
SELECT SAL, SAL * 12 FROM EMP;
SELECT SAL, SAL / 2 FROM EMP;

SELECT ename, sal, job, comm, sal*12, sal*12+comm
FROM emp;

-- NUL(컬럼명, 값) : NULL을 0 또는 다른 값으로 변환하기 위해서 사용하는 함수이다.
SELECT COMM, NVL(COMM,0)
FROM EMP;
select ename, comm, sal*12+comm, 
           nvl(comm, 0), sal*12+nvl(comm, 0)
from emp;

select ename, sal*12+nvl(comm, 0) as Annsal
from emp;
select ename, sal*12+nvl(comm, 0) Annsal
from emp;
select ename, sal*12+nvl(comm, 0) as "A n n s a l"
from emp;

SELECT ENAME, JOB
FROM EMP;

-- || 문자열 연결 처리
select ename || ' is a ' || job
from emp;

-- 사원테이블의 부서코드를 출력(검색)
select deptno from emp;

-- DISTINCT (동일 로우)중복 제거
select DISTINCT deptno from emp;
select job from emp;
select DISTINCT job from emp;

-- 부서코드가 10인 사원 검색
-- SELECT 컬럼리스트 FROM 테이블명 WHERE 조건식;
SELECT ENAME, DEPTNO   -- 실행3 (컬럼 추출)  
FROM EMP               -- 실행1
WHERE DEPTNO=10;       -- 실행2 (로우 추출)

-- 급여가 1500 이하인 사원의
-- 사원번호, 사원 이름, 급여를 출력하는 SQL 문을 작성해 보시오.
SELECT EMPNO,ENAME, SAL   -- 실행3 (컬럼 추출)  
FROM EMP                  -- 실행1
WHERE SAL <= 1500;        -- 실행2 (로우 추출)
DESC EMP;

-- 다음은 이름이 FORD인 사원의 
-- 사원번호(EMPNO)과 사원이름(ENAME)과 급여(SAL)을 출력
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'FORD';
SELECT EMPNO, ENAME, SAL
FROM EMP
WHERE ENAME = 'ford';

-- 1982년 1월 1일 "이후"에 입사한 사원을 출력 
-- 1982년 "이후"에 입사한 사원을 출력 
SELECT *
FROM EMP
WHERE HIREDATE >= '1982/01/01';

-- 1982년 1월 23일 "이후"에 입사한 사원을 출력 
SELECT *
FROM EMP
WHERE HIREDATE >= '1982/01/23';

-- 1982년 1월 23일 "이전"에 입사한 사원을 출력 
SELECT *
FROM EMP
WHERE HIREDATE < '1982/01/23';
