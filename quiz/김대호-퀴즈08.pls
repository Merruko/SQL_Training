-- [1] 점수 테이블을 번호, 국어, 수학 컬럼으로 생성하시오.
CREATE TABLE T(
B CHAR(4),
K number(3),
M number(3)
);

-- [2] 점수테이블의 테이블명을 SCORE로 변경하시오.
RENAME T TO SCORE;

-- [3] SCORE테이블의 번호컬럼명을 BUNHO, 국어컬럼명을 KOR, 수학컬럼명을 MATH로
-- 각각 변경하시오.
ALTER TABLE SCORE RENAME COLUMN B TO BUNHO;
ALTER TABLE SCORE RENAME COLUMN K TO KOR;
ALTER TABLE SCORE RENAME COLUMN M TO MATH;

SELECT * FROM SCORE;

-- [4] SCORE테이블의 각 컬럼의 설명을 다음과 같이 부여하시오.
-- bunho컬럼 설명 : 학번
-- kor컬럼 설명 : 국어점수
-- math컬럼 설명 : 수학점수
comment on column score.bunho is '학번';
comment on column score.kor is '국어점수';
comment on column score.math is '수학점수';

desc score;

-- [5] SCORE테이블에 eng컬럼을 숫자 3자리로 추가하시오.
ALTER TABLE SCORE ADD (ENG NUMBER(3));

-- [6] SCORE테이블에 div컬럼을 고정문자 1자리로 추가하시오.
-- (중간/기말 상태 구분 코드)
ALTER TABLE SCORE ADD(DIV CHAR(1));

-- [7] SCORE테이블에 다음과 같이 행을 추가하시오.
SELECT * FROM SCORE;

insert into SCORE values ('2001', 100, 70, 30, '1');
insert into SCORE values ('2002', 80, 75, 70, '1');
insert into SCORE values ('2003', 70, 70, 80, '1');
insert into SCORE values ('2004', 100, 70, 90, '1');
insert into SCORE values ('2005', 100, 80, 100, '1');
insert into SCORE values ('2001', 95, 80, 80, '2');
insert into SCORE values ('2002', 90, 75, 90, '2');
insert into SCORE values ('2003', 60, 70, 70, '2');
insert into SCORE values ('2004', 100, 80, 100, '2');
insert into SCORE values ('2005', 30, 70, 100, '2');

SELECT * FROM SCORE;

-- [8] SCORE테이블에 tot컬럼을 숫자 3자리로 추가하시오.
ALTER TABLE SCORE ADD (TOT NUMBER(3));

-- [9] SCORE테이블에 tot컬럼에 kor,math, eng의 합을 구하여 변경하시오.
UPDATE SCORE SET TOT = KOR+MATH+ENG;
SELECT * FROM SCORE;

-- [10] SCOREMID테이블을 SCORE테이블에서 DIV가 1인 행들로 추출하여 생성하시오.
CREATE TABLE SCOREMID AS 
SELECT * FROM SCORE WHERE DIV = 1; 

-- [11] SCOREFINAL테이블을 SCORE테이블에서 DIV가 2인 행들로 추출하여 생성하시오.
CREATE TABLE SCOREFINAL AS
SELECT * FROM SCORE WHERE DIV = 2;
