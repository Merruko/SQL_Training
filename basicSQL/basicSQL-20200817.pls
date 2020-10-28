create table dept02
as select * from dept;
commit;

--------------------------------

select * from dept02;

delete from dept02 where deptno=40;

create table dept03 as select * from dept;  -- 오토커밋(autocommit;)

rollback;

select * from dept03;
delete from dept03 where deptno = 10;
select * from dept03;
rollback;

select * from dept03;
delete from dept03 where deptno = 10;
commit;
rollback;

delete from dept03 where deptno = 30;
savepoint C1;       -- 복원지점
delete from dept03 where deptno = 40;
rollback TO C1;

-- Oracle SQL Developer 자동커밋
-- 도구 > 환경설정 > (좌)데이터베이스 > 고급 > (우)자동 커밋 선택

-- [DCL, DTL] 데이터 제어어
-- COMMIT;              : 트랜잭션 완료    
-- ROLLBACK;            : 트랜잭션 복원(취소)
-- SAVEPOINT 레이블명;    : 복원 지점 설정

-- 제약조건
select * from dept;
insert into dept values(10, 'test', 'test');
desc dept;
-- 제약조건 확인 
desc user_constraints;
select constraint_name, constraint_type
from user_constraints;

drop table emp02;
drop table emp03;

-- 테이블 레벨 제약조건
CREATE TABLE EMP02(
    EMPNO    NUMBER(4),
    ENAME    VARCHAR2(10) NOT NULL,
    JOB      VARCHAR2(9),
    DEPTNO   NUMBER(4),
    PRIMARY KEY(EMPNO),                          -- 기본키(개체무결성제약조건)
    UNIQUE(JOB),
    FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO)  -- 외래키(참조무결성제약조건)
);

-- 개체무결성제약조건 : 기본키는 널값을 갖을 수 없다.
-- 참조무결성제약조건 : 외래키는 참조테이블의 기본카값 또는 널값만 갖는다.

-- 컬럼 레벨 제약조건
CREATE TABLE EMP03(
    EMPNO   NUMBER(4)       PRIMARY KEY,
    ENAME   VARCHAR2(10)    NOT NULL,
    JOB     VARCHAR2(9)     UNIQUE,
    DEPTNO  NUMBER(4)       REFERENCES DEPT(DEPTNO)
);

CREATE TABLE EMP04( 
    EMPNO NUMBER(4) CONSTRAINT EMP04_ENAME_NN NOT NULL,
    ENAME VARCHAR2(10), 
    JOB VARCHAR2(9),
    DEPTNO NUMBER(4),
    CONSTRAINT EMP04_EMPNO_PK PRIMARY KEY(EMPNO),
    CONSTRAINT EMP04_JOB_UK UNIQUE(JOB),
    CONSTRAINT EMP04_DEPTNO_FK FOREIGN KEY(DEPTNO) REFERENCES DEPT(DEPTNO)
); 
