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
START WITH 0
INCREMENT BY 1
MINVALUE 0
MAXVALUE 10000
NOCYCLE
NOCACHE;

--데이터 삽입
INSERT INTO t_board VALUES (my_seql.NEXTVAL, 'おはようございます！', 'ありがとうございます！', SYSDATE, 'kdh9427');

--테이블 조회
SELECT * FROM t_board;

--휴지통 비우기
PURGE RECYCLEBIN;

--게시글 다 지우기
DELETE FROM t_board;

--테이블 삭제
DROP TABLE t_board;

--커밋
COMMIT;