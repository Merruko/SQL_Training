-- [퀴즈02]

-- [1] 부서번호가 10인 사원의 이름, 부서번호, 월급을 출력하여라.

select ENAME, DEPTNO, SAL
from emp
where deptno=10;

-- [2] 입사일이 83/01/12인 사원의 이름, 부서번호, 월급을 출력하라.

select ENAME, DEPTNO, SAL
from emp
where hiredate='1983/01/12';

-- [3] 업무가 MANAGER인 사원의 모든 정보를 출력하라.

select *
from emp
where job='MANAGER';

-- [4] 업무가 SALESMAN인 사원의 모든 정보를 출력하라.

select *
from emp
where job='SALESMAN';

-- [5] 급여가 800 이상인 사원의 이름, 급여, 부서번호를 출력하라.

select ENAME, DEPTNO, SAL
from emp
where sal>=800;

-- [6] 사원이 존재하는 부서명을 중복제거하여 출력하여라. 

select distinct DEPTNO
from emp;
