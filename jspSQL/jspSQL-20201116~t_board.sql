--t_board 테이블 생성
CREATE TABLE t_board(
    bno             NUMBER(5) PRIMARY KEY,
    title           VARCHAR2(100) NOT NULL,
    content         VARCHAR2(2000),
    regDate         DATE DEFAULT SYSDATE,
    memberId        VARCHAR2(10)
);

--시퀀스 생성 (자동번호 생성)
CREATE SEQUENCE my_seql
START WITH 1
INCREMENT BY 1
MINVALUE 1
MAXVALUE 10000
NOCYCLE
NOCACHE;

--데이터 삽입
INSERT INTO t_board VALUES (my_seql.NEXTVAL, '안녕하세요', '게시판 만들기', SYSDATE, 'kdh9427');

--테이블 조회
SELECT * FROM t_board;

--휴지통 비우기
PURGE RECYCLEBIN;

--커밋
COMMIT;