-- [퀴즈04]

-- [1] 사원의 100% 인상된 급여를 "새급여" 헤딩으로 출력하여라.
-- 단, 이름에 'A'가 포함되고 구급여가 2000이하인 사원으로 제한
select ENAME AS 사원명, SAL AS "구급여", SAL+(SAL*1) AS "새급여"
FROM EMP
WHERE ENAME LIKE '%A%' AND SAL <= 2000;

-- [2] 우리말로 번역하여 주석을 작성하여라.
-- 1 사원테이블에서 
-- 2 부서번호가 10 또는 20에 해당하고 커미션이 널인 사원들의 정보를
-- 3 부서명과 사원명을 오름차순 정렬하여
-- 4 사원명, 커미션을 "수당"으로 부서번호를 출력하여라.
select ENAME,COMM as "수당" ,DEPTNO                       -- 4
from emp                                                 -- 1
where DEPTNO in (10,20) and COMM is null                 -- 2
order by DEPTNO asc, ENAME;                              -- 3

-- [3] 사원이름이 5글자 이상인 사람들의 모든 정보를 출력해 보세요.
select *
from emp
where LENGTH(ENAME) >= 5;

-- [4] 사원명이 5글자 이상인 사원의 정보를 사원번호와 
-- MASKING_EMPNO열에 사원번호 앞 두자리 외 뒷자리를 *기호로 출력하시오.
select EMPNO,
       RPAD(SUBSTR(EMPNO,1,2),4,'*') AS "MASKING_EMPNO"
FROM EMP
WHERE LENGTH(ENAME) >=  5;

-- [5] 부서번호가 20인 부서의 시간당 임금을 계산하여 출력하라. 
-- 이름,급여,시간당임금(소수이하 1번째 자리에서 반올림)을 출력하라.
-- 단,1달의 근무일수는 12일이고, 1일 근무시간은 5시간이다. 
SELECT ENAME AS "이름",
       SAL AS "급여",
       ROUND(SAL/12/5) AS "시간당임금"
FROM EMP
WHERE DEPTNO = 20;

-- [6] 급여가 1,500 부터 3,000 사이의 사람은 급여의 15%를 회비로 지불하기로 하였다. 
-- 이를 이름, 급여, 회비(둘째자리에서 반올림)을 출력하라.
SELECT ENAME,SAL,SAL*0.15 AS 회비
FROM EMP
WHERE SAL >= 1500 AND SAL <= 3000;

--[7]급여가 2,000 이상인 모든 사람은 급여의 15%를 경조비로 내기로 하였다.
--이름,급여,경조비(소수점이하 절삭)을 출력하라
SELECT ENAME,SAL,FLOOR(SAL*0.15) AS 경조비
FROM EMP
WHERE SAL>=2000;

--[8] 이름의 글자수가 6자인 사람의 이름을 앞에서 3자만 구하여
--소문자로 이름만을 출력하라
SELECT SUBSTR(LOWER(ENAME),1,3) 
FROM EMP
WHERE LENGTH(ENAME) = 6;
