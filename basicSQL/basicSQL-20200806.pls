-- where절의 조건절 구성
-- 사원테이블에서 
-- 10번 부서 소속인 사원들 중에서(모두, 그리고,AND)
-- 직급이 MANAGER인 사람을 검색하여
-- 사원명, 부서번호, 직급을 출력
-- [조건1] 10번 부서 소속인 사원 : DEPTNO=10  
-- [조건2] 직급이 MANAGER인 사원 : JOB='MANAGER'
select * from emp; 
select ENAME, DEPTNO, JOB                   -- 3 (수직부분집합)
from emp                                    -- 1
where deptno = 10 AND job = 'MANAGER';      -- 2 (수평부분집합)

-- 10번 부서에 소속된 사원이거나(또는, OR)
-- 직급이 MANAGER인 사람을 검색하여
-- 사원명, 부서번호, 직급을 출력 
-- [조건1] 10번 부서 소속인 사원 : DEPTNO=10
-- [조건2] 직급이 MANAGER인 사원 : JOB='MANAGER'
select ENAME, DEPTNO, JOB                   -- 3 (수직부분집합)
from emp                                    -- 1
where deptno = 10 OR job = 'MANAGER';      -- 2 (수평부분집합)

-- 부서번호가 10번인 사원을 출력
select *
from emp
where deptno = 10;

-- 부서번호가 10번이 아닌 사원을 출력
select * from emp where deptno <> 10;
select * from emp where not deptno = 10;

-- 2000에서 3000사이의 급여(SAL)를 받는 사원을 조회
-- [조건1] 급여가 2000 이상 : sa1 >= 2000 
-- [조건2] 급여가 3000 이하 : sal <= 3000
select * from emp
--where sal >= 2000 and sal <= 3000;
where sal between 2000 and 3000;

-- 커미션(COMM)이 300 이거나 500 이거나 1400 인 사원을 검색
select *
from emp
--where comm=300 or comm=500  or comm=1400;
where comm in(300,500,1400);

-- EMPNO이 7521 이거나 EMPNO이 7654 이거나 EMPNO이 7844 인
-- 사원들의 사원 번호와 급여를 검색
select empno, sal
from emp
-- where empno=7521 or empno=7654 or empno=7844;
where empno in(7521,7654,7844);

-- 급여가 2000 미만이거나 급여가 3000 초과인 사원을 검색하기 
select *
from emp
-- where sal < 2000 or sal > 3000;
where sal not between 2000 and 3000;

-- 1981년(도)에 입사한 사원을 출력
select *
from emp
--where hiredate >= '1981/01/01' and hiredate <= '1981/12/31';
where hiredate between '1981/01/01' and '1981/12/31';
-- COMM에는 NULL값이 포함되어 있음!(NULL은 결과출력 제외)
-- COMM이 300, 500, 1400이 모두 아닌 사원을 검색

-- 1) <>와 and
SELECT *
FROM EMP
WHERE COMM<>300 AND COMM<>500 AND COMM<>1400;
-- 2) not in
SELECT *
FROM EMP
WHERE COMM NOT IN(300, 500, 1400);

-- 사원 번호가 7521도 아니고 7654도 아니고 7844도 아닌 사원들을 검색
-- 1) <>와 or
select empno, ename from emp 
		where empno  != 7521 and empno !=7654 and empno != 7844; 

-- 2) not in
select empno, ename from emp 
		where empno not in( 7521, 7654, 7844);

-- LIKE : 문자열 부분일치 검색
-- 이름이 'FORD'인 사원 검색
SELECT * FROM EMP WHERE ENAME = 'FORD';
-- 이름이 F로 시작(맨앞)하는 사원 검색
SELECT * FROM EMP WHERE ENAME LIKE 'F%';
-- 이름이 'SMITH'인사원 검색
SELECT * FROM EMP WHERE ENAME = 'SMITH';
-- 이름이 S로 시작(맨앞)하는 사원 검색
SELECT * FROM EMP WHERE ENAME LIKE 'S%';
-- 이름이 S로 끝(맨뒤)나는 사원 검색
SELECT * FROM EMP WHERE ENAME LIKE '%S';
-- 이름이 S가 포함되는 사원 검색
SELECT * FROM EMP WHERE ENAME LIKE '%S%';
-- 이름의 (시작의)두 번째 글자가 A인 사원
SELECT * FROM EMP WHERE ENAME LIKE '%A%';
SELECT * FROM EMP WHERE ENAME LIKE '_A';
SELECT * FROM EMP WHERE ENAME LIKE '_A%';
-- 이름의 (시작의)세 번째 글자가 A인 사원
SELECT * FROM EMP WHERE ENAME LIKE '__A%';
-- 이름에 A를 포함하지 않은 사람만을 검색
SELECT * FROM EMP WHERE ENAME NOT LIKE '%A%';

SELECT *
FROM EMP
WHERE COMM = NULL;
SELECT *
FROM EMP
WHERE COMM IS NULL;
