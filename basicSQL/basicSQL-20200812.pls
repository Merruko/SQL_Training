-- SCOTT 사원의 부서명을 출력
SELECT * FROM EMP;  
SELECT * FROM DEPT;

SELECT DEPTNO FROM EMP WHERE ENAME = 'SCOTT';  -- (결과) 부서번호 20
SELECT DNAME FROM DEPT WHERE DEPTNO = 20;      -- (결과) 부서명 RESEARCH

-- CROSS JOIN
SELECT *
FROM EMP, DEPT;    -- (14*4)로우 (8+3)컬럼

SELECT *
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;  -- 14로우 11컬럼

-- 동일조인(EQUI JOIN) : CROSS JOIN + 조인조건(=)
-- SCOTT 사원의 부서명을 출력
SELECT EMP.ENAME, EMP.DEPTNO, DEPT.DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO    -- 조인조건
      AND EMP.ENAME = 'SCOTT';    -- 검색조건
      
SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO       -- 조인조건
      AND E.ENAME = 'SCOTT';    -- 검색조건      
      
-- 뉴욕('NEW YORK’)에서 근무하는 사원의 이름과 급여를 출력하시오.
select emp.ename, emp.sal   
from emp, dept 
where emp.deptno = dept.deptno and dept.loc = 'NEW YORK';

-- ACCOUNTING 부서 소속 사원의 이름과 입사일을 출력하시오.
select ename,  hiredate  from emp, dept 
		where emp.deptno = dept.deptno  and dept.dname = 'ACCOUNTING';

-- 직급이 MANAGER인 사원의 이름, 부서명을 출력하시오.
select e.ename, d.dname 
from emp e, dept d
where e.deptno = d.deptno and e.job= 'MANAGER'
order by d.dname ; 

- NON-EQUI JOIN : CROSS JOIN + 조인조건(=아님)
-- 사원의 급여가 몇 등급
DESC EMP;
DESC SALGRADE;
SELECT * FROM EMP;
SELECT * FROM SALGRADE;

SELECT EMP.ENAME, EMP.SAL, SALGRADE.GRADE
FROM EMP, SALGRADE
WHERE EMP.SAL >= SALGRADE.LOSAL AND EMP.SAL <= SALGRADE.HISAL;
-- WHERE EMP.SAL BETWEEN SALGRADE.LOSAL AND SALGRADE.HISAL;

-- Self Join (PPT 07장. 22page)
-- ‘SMITH’의 매니저 이름이 무엇인지 알아내려면 어떻게 구해야 할까요?  (정답 : ‘FORD’)
SELECT E1.ENAME AS "직원명", E2.ENAME AS "매니저명"
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO             -- 조인조건
        AND E1.ENAME = 'SMITH';     -- 검색조건
        
SELECT employee.ENAME || '의 매니저는' || manager.ENAME || '입니다.'
FROM EMP employee, EMP manager
WHERE employee.MGR =  manager.EMPNO             
        AND employee.ENAME = 'SMITH'; 

-- 매니저가 KING인 사원들의 이름과 직급을 출력하시오. 
SELECT employee.ENAME || '의 매니저는' || manager.ENAME || '입니다.'
FROM EMP employee, EMP manager
WHERE employee.MGR =  manager.EMPNO
        AND MANAGER.ENAME = 'KING';
        
-- SCOTT과 동일한 근무지(동일부서번호)에서 근무하는 사원의 이름을 출력하시오.
SELECT E1.ENAME, E2.ENAME
FROM EMP E1, EMP E2
WHERE E1.DEPTNO = E2.DEPTNO AND E1.ENAME = 'SCOTT'
    AND E2.ENAME <> 'SCOTT';
