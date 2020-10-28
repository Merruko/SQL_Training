-- [퀴즈07]

-- [1] 급여가 1000 이상인 사원들의 부서명과 사원수를 "부서별"로 출력
SELECT D.DEPTNO, D.DNAME, COUNT(E.ENAME)
FROM EMP E, DEPT D
WHERE SAL >= 1000
    AND E.DEPTNO = D.DEPTNO  
GROUP BY D.DEPTNO, D.DNAME;
 
-- ※ 서브쿼리를 이용하여 풀이하시오. (2번부터~)
-- WARD가 소속된 부서번호를 출력 (부서번호 : 30)
SELECT DEPTNO FROM EMP WHERE ENAME='WARD';

-- [2] WARD가 소속된 부서 사원들의 평균 급여액을 출력 (1566.67)
SELECT round(AVG(SAL), 2) FROM EMP 
     WHERE DEPTNO = (
        SELECT DEPTNO 
        FROM EMP 
        WHERE ENAME = 'WARD'
        );   

-- [3] WARD가 소속된 부서 사원들의 평균 급여(1566.67)보다 급여가 높은
-- 사원의 이름, 급여를 출력
SELECT ENAME, SAL FROM EMP
WHERE SAL > (
    SELECT AVG(SAL) 
    FROM EMP 
    WHERE DEPTNO = (SELECT DEPTNO FROM EMP WHERE ENAME='WARD')  
);
 
-- [4] DALLAS에 위치한 부서에 속한(=) 사원의                -- DEPT
--    총사원수, 평균급여, 전체급여, 최고급여, 최저급여 출력    -- EMP
SELECT COUNT(*), AVG(SAL), SUM(SAL), MAX(SAL), MIN(SAL)
FROM (
   SELECT SAL FROM EMP E,DEPT D 
   WHERE E.DEPTNO=D.DEPTNO
   AND E.DEPTNO = (
       SELECT DEPTNO FROM DEPT WHERE LOC='DALLAS'
   )
);

select count(*), avg(sal), sum(sal), max(sal), min(sal)
from emp
where deptno = (select deptno 
                from dept
                where loc ='DALLAS'
);

-- [5] 회사내의 최소급여와 최대급여의 차이를 구하세요
-- from emp -> sal
-- 4200 (5000-800)
SELECT MAX(SAL) - MIN(SAL) FROM EMP;
 
-- [6] EMP 테이블의 모든 사원수를 출력하세요.
-- 14
SELECT COUNT(*) FROM EMP;

-- [7] 이름에 M가 들어간 사원들 개수와 부서명을 부서별로 구하세요. (join으로 풀이)
--    부서별, 사원명에 M이 있는 사원의 인원수를 출력하시오.
--    emp table                   dept table                
SELECT D.DNAME, COUNT(ENAME)
FROM EMP E, DEPT D
WHERE    ENAME LIKE '%M%'        -- 검색 조건
         AND E.DEPTNO=D.DEPTNO   -- 조인 조건
GROUP BY D.DNAME;

select *
from emp e, dept d 
where e.deptno = d.deptno and ename like '%M%';   -- 5

-- [8] SCOTT의 급여에서 1000 을 뺀 급여보다 적게 받는 사원의 이름, 급여를 출력하세요.
-- (서브쿼리)
SELECT ENAME, SAL 
FROM EMP
WHERE SAL < (  -- 2000
   SELECT (SAL-1000) FROM EMP WHERE ENAME = 'SCOTT'
);  

-- [9] KING 의 급여에서 SCOTT의 급여를 뺀 결과(5000-3000)보다
-- 적은 급여를 받는 사원의 부서명,이름,급여를 출력하세요
SELECT D.DNAME, E.ENAME, E.SAL FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND E.SAL < ( -- 2000 : 5000-3000
    SELECT  
        (SELECT SAL FROM EMP WHERE ENAME='KING') - (SELECT SAL FROM EMP WHERE ENAME='SCOTT') 
    FROM DUAL
);
-- SELECT SAL FROM EMP WHERE ENAME='KING'; -- 5000
-- SELECT SAL FROM EMP WHERE ENAME='SCOTT'; -- 3000
-- select 5000-3000 from dual;

-- [10] JOB이 MANAGER인 사원들 중 최소급여를 받는 사원보다  급여가 적은 
-- 사원의 이름, 급여를 출력하세요
SELECT ENAME,SAL FROM EMP
WHERE SAL < (
        SELECT MIN(SAL) FROM EMP 
        WHERE JOB='MANAGER'
);
select ename, sal
from emp
where sal < all(select sal
                    from emp
                    where job = 'MANAGER'
);

-- [11] 급여액 따른(따라서) 고액,평액,저액 출력 (CASE~END 사용)
--      급여가 3000이상이면, '고액'
--      급여가 1000이상이면, '평액'
--      급여가 1000미만이면, '저액'
select ename, sal, case when sal >= 3000 then '고액'
                        when sal >= 1000 then '평액'
                        when sal < 1000 then '저액'
                   end as 급여등급
from emp;

-- [11]번 추가. (ELSE: 상위조건이 아니면,)
--    급여가 3000이상이면, '고액'
--    급여가 1000이상이면, '평액'
--    나머지는 모두 '저액'
select ename, sal, case when sal >= 3000 then '고액'
                        when sal >= 1000 then '평액'
                        else '저액'
                   end as 급여등급
from emp;
