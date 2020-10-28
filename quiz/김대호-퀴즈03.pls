-- [퀴즈03]

-- [1] 입사일이 81/04/02보다 늦고(이후)
-- 82/12/09보다 빠른(이전)
-- 사원의 이름, 월급, 부서번호를 출력하라.

select 
    ENAME AS 이름,
    SAL AS 급여,
    DEPTNO AS 부서번호
from emp
where hiredate > '81/04/02' and hiredate < '82/12/09';

-- [2] 동일 컬럼에 대해서 다수개의 조건이 or(와) 연결
-- 업무가 MANAGER와 SALESMAN인 사원의 모든 정보를 출력하라.

select *
from emp
where job = 'MANAGER' or job = 'SALESMAN';

-- [3] 이름이 K로 시작하고 G로 끝나는 사원의 모든 정보를 출력하라.

select *
from emp
where ename like 'K%G';

-- [4] 커미션이 NULL인 사람의 정보를 출력하라.

select *
from emp
where COMM is null;

-- [5] 입사일이 81년도인 사람의 모든 정보를 출력하라.

select *
from emp
where SUBSTR(HIREDATE, 1, 2) = '81';

-- [6] 급여가 2,000 이상인 모든 사람은 급여가 15%를 경조비로 내기로 하였다.
-- (단, 이름, 급여, 경조비를 출력하라.)

select ename as 이름, sal as 급여, (sal * 0.15) as 경조비
from emp
where sal >= 2000;

-- [7] 사원의 뒤에서 두 번째자리가 E로 끝나는 사원을 검색해보자.

select * from emp where ename like '%E_';
select * from emp where substr(ename,-2,1)= 'E';
