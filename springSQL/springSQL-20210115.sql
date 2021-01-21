CREATE TABLE s_member (
    mId VARCHAR(20) PRIMARY KEY,
    mPwd VARCHAR(20),
    mName VARCHAR(10),
    mGender VARCHAR(5),
    mBirth VARCHAR(10),
    mEmail VARCHAR(30), 
    mPhone VARCHAR(20)
);

CREATE TABLE s_board (
    seq NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
);

INSERT INTO s_member VALUES ('kdh9427','0319','김대호','남','19930329','mrkim9427@naver.com','01095059427');
INSERT INTO s_board (seq,title,writer,content) VALUES (1,'임시 공지사항','관리자','이래라저래라');

SELECT * FROM s_member;
SELECT * FROM s_board;

CREATE SEQUENCE mem_seq
START WITH 1
INCREMENT BY 1;

commit;