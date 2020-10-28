-- 부서번호에 해당되는 부서명
SELECT ENAME, DEPTNO, 
              DECODE(DEPTNO,  10, 'ACCOUNTING', 
                              20, 'RESEARCH', 
                              30, 'SALES', 
                              40, 'OPERATIONS') 
               AS DNAME  
FROM EMP;

SELECT ENAME, DEPTNO,
              CASE WHEN DEPTNO=10 THEN 'ACCOUNTING' 
                        WHEN DEPTNO=20 THEN 'RESEARCH' 
                        WHEN DEPTNO=30 THEN 'SALES' 
                        WHEN DEPTNO=40 THEN 'OPERATIONS'
               END DNAME
FROM EMP;

SELECT * FROM EMP;

-- 급여 총액
SELECT SUM(SAL), SUM(SAL)/14, AVG(SAL)
FROM EMP;

-- 커미션 총합
SELECT SUM(COMM), SUM(COMM)/4, AVG(COMM) 
FROM EMP;

SELECT COMM+10
FROM EMP;

SELECT MAX(SAL), MIN(SAL), MAX(COMM), MIN(COMM), COUNT(COMM)
FROM EMP;

SELECT COUNT(*), COUNT(COMM) 
FROM EMP;

-- 10번 부서 소속 사원중에서 커미션을 받는 사원의 수를 구해보시오.
SELECT COUNT(*)      -- 3
FROM EMP             -- 1
WHERE DEPTNO = 10 AND COMM IS NOT NULL;   -- 2  (결과 0행)

SELECT COUNT(COMM)   -- 3 (결과 0행)
FROM EMP             -- 1
WHERE DEPTNO = 10;   -- 2 (결과 3행)

-- 사원 테이블에서 사원들의 직업의 개수 (5가지 직무)
SELECT COUNT(DISTINCT JOB)
FROM EMP;

SELECT DISTINCT JOB
FROM EMP;

-- 사원 테이블을 부서 번호로 그룹~~~~~
SELECT DEPTNO     -- 3
FROM EMP          -- 1
GROUP BY DEPTNO;  -- 2

-- 사원 테이블을 부서 번호로 그룹별 급여평균
SELECT DEPTNO, AVG(SAL)     -- 3
FROM EMP          -- 1
GROUP BY DEPTNO;  -- 2

SELECT DEPTNO, MAX(SAL), MIN(SAL), AVG(SAL)
FROM EMP 
GROUP BY DEPTNO;

-- 부서별로 그룹지은 후(GROUP BY), 
-- 그룹 지어진 "부서별" 평균 급여가 2000 이상인(HAVING)
-- 부서번호와 부서별 평균 급여를 출력하는 경우
SELECT DEPTNO, AVG(SAL)      -- 4
FROM EMP                     -- 1
GROUP BY DEPTNO              -- 2
    HAVING AVG(SAL) >= 2000  -- 3
ORDER BY DEPTNO;
    
SELECT DEPTNO, AVG(SAL)      -- 4
FROM EMP                     -- 1
WHERE SAL >= 2000            -- 2
GROUP BY DEPTNO ;            -- 3
