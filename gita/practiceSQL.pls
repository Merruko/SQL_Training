-- [1] 학생 테이블에서 키가 170이상인 학생의 이름(name), 학년(grade), 키(height) 데이터 가져오되, 키가 큰 순서대로 
select name, grade, height 
from student 
where height >= 170 
order by height desc;

-- [2] 학과(deptno1)가 101번이고 3학년(grade) 이상의 학생의 이름(name), 아이디(id), 학년(grade) 데이터 가져오기
select name, id, grade 
from student 
where deptno1 = 101 and grade >= 3;

-- [3] 교수테이블에서 급여(pay)가 300에서 400사이인 교수의 이름(name), 아이디(id), 급여(pay) 데이터 가져오기
select name, id, pay 
from professor 
where pay between 300 and 400;

-- [4] 교수 테이블에서 직급(position)이 전임강사, 조교수인 이름(name), 아이디(id), 직급(position), 급여(pay) 데이터가져오기
select name, id, position, pay 
from professor 
where position = '전임강사' OR position = '조교수';

-- [5] 교수 테이블에서 bonus을 받지 않는 교수의 이름(name), 아이디(id), 직급(position)데이터 가져오기
select name, id, position 
from professor 
where bonus is null;

-- [6] 교수 테이블에서 입사일(hiredate) 이 '1999-12-01' ~ '2002-02-24' 일 사이의 데이터만 조회하기
-- to_date 함수 이용하기
select *
from professor 
where hiredate between to_date('19991201') and to_date('20020224');

-- [7] 교수테이블에서 교수의 이름(name), 직급(position),급여(pay), 보너스(bonus), 연봉(pay*12+bonus) 데이터 가져오기
-- bonus가 null이면 0으로 계산되도록 처리한다 (nvl 함수 사용하기)
select name, position, pay, bonus, pay*12+bonus as "연봉", nvl(bonus, 0) 
from professor;

-- [8] 학생 테이블에서 학생의 평균키와 가장큰키, 가장작은키, 전체 학생 수 구하기
select count(name), avg(height), min(height), max(height) 
from student;

-- [9] 학생테이블에서 학과(deptno1)별로 학생의 평균키 구하기
-- 평균키는 소수 이하 한자리만 나오도록 반올림한다(round 함수 이용)
select deptno1, round(avg(height), 1) 
from student 
group by deptno1;

-- [10] 교수테이블에서 학과(deptno)별, 직급(position)별로 급여(pay)의 합 구하기
select deptno, position, sum(pay) 
from professor 
group by deptno, position;

-- [11] 학생 이름에 '신'이 들어간 학생들의 이름(name), 학년(grade), 주민번호(jumin), 전화번호(tel), 담당교수명(name) 데이터 가져오기
-- student , professor 테이블 조인 (inner join 이용)
select student.name, student.grade, student.jumin, student.tel, professor.name 
from student inner join professor on student.deptno1 = professor.deptno 
where student.name like '%신%';

-- [12] 학생 이름이 '김'으로 시작하고 총 3글자인 레코드만 조회하시오.
-- student 테이블
select name 
from student 
where name like '김%' and length(name) = 3;

-- [13] 김재수와 학과(deptno1)가 같은 학생들의 학번(studno), 이름(name), 학년(grade), 학과번호(deptno1)를 조회하되 이름(name)의 내림차순으로 조회
-- 서브 쿼리 이용 
select studno, name, grade, deptno1 
from student 
where deptno1 = (select deptno1 from student where name = '김재수')
order by name asc;

-- [14] 급여(pay)가 교수 전체의 평균급여보다 큰 교수의 이름(name), 직급(position), 급여(pay), 입사일(hiredate)의 데이터 가져오기.
-- 서브 쿼리 이용
select name, position, pay, hiredate 
from professor 
where pay > (select avg(pay) from professor);

-- [15] 학생의 이름(name), 학년(grade), 담당교수명(name),학과명(dname) 데이터를 조회
-- student, professor ,department 테이블 조인 
-- 담당교수명은 별칭을 교수명으로 준다
-- 모든 학생이 출력되도록 한다(outer join)
SELECT S.NAME, S.GRADE, P.NAME AS "PROFESSOR NAME", D.DNAME 
FROM STUDENT S 
LEFT JOIN PROFESSOR P ON S.PROFNO=P.PROFNO 
LEFT JOIN DEPARTMENT D 
USING (DEPTNO);

-- [16] 학과(dname)가 공학과로 끝나는 과만 조회하기
-- department 테이블
select dname 
from department 
where dname like '%공학과';

-- [17] professor 테이블에서 이름의 오름차순으로 정렬한 상태에서 상위 5명의 교수만 조회하기
-- 교수번호(profno), 이름(name), 직급(position), 학과번호(deptno) 조회
SELECT *
FROM (SELECT profno, name, position, deptno, ROW_NUMBER() OVER (ORDER BY name) R FROM professor)
WHERE R BETWEEN 1 and 5;

-- [18] 조인의 종류에는 무엇이 있는지 나열하고, 각각에 대해 설명하시오.
left join : 왼쪽을 기준으로 조인한다
right join : 오른쪽을 기준으로 조인한다
full join : 전체를 조인 한다
self join : 자기 자신을 조인한다

-- [19] SQL을 DDL, DML, DCL로 분류할 경우, 해당하는 명령어 종류를 쓰시오.
DDL (데이터 정의어) : create, alter, drop, rename, truncate
DML (데이터 조작어) : insert, update, delete
DCL (데이터 제의어) : grant, revoke

-- [20] 데이터 무결성 제약조건 유형 P, R, U, C의 의미를 쓰시오.
P -> PRIMARY KEY : 해당 컬럼값은 반드시 존재해야 하고 유일해야 하는 조건
R -> FOREIGN KEY : 해당 컬럼의 값이 타컬럼의 값을 참조해야 함
U -> UNIQUE : 테이블 내에서 해당 컬럼 값은 항상 유일무이한 값을 가짐
C -> CHECK, NOT NULL : 해당 컬럼에 저장 가능한 데이터의 값의 범위나 사용자 조건을 지정

-- [21] CRUD와 대응되는 표준 SQL문을 쓰시오.
 1) Create(생성) : insert
 2) Read(읽기) : select
 3) Update(갱신) : update
 4) Delete(삭제) : delete
 