-- [퀴즈06]

-- [1] (부서별)부서의 최대값과 최소값을 출력하시오.
select deptno, max(sal),min(sal)
from emp
group by deptno;

-- [2] (부서별)부서의 최대값과 최소값을 출력하되
-- 부서번호를 기준으로 오름차순하여 출력하시오.
select deptno , max(sal) , min(sal)
from emp
group by deptno order by deptno ASC;

-- [3] (부서별)부서의 최대값과 최소값을 구하되 
-- 최대 급여가 2900 이상인 부서만 출력하시오.
select deptno, max(sal), min(sal)
from emp
group by deptno;

-- [4] 급여가 1500 이상인 사원들의
-- (부서별)부서의 최대값과 최소값을 출력하시오.
select deptno, max(sal) , min(sal)
from emp
where sal >=1500
group by deptno;
