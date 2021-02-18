CREATE TABLE r_users (
    id VARCHAR2(8) PRIMARY KEY,
    password VARCHAR2(8),
    name VARCHAR2(20),
    role VARCHAR2(5)
);

INSERT INTO r_users VALUES ('test','test123','관리자','Admin');
INSERT INTO r_users VALUES ('user1','user1','홍길동','User');

CREATE TABLE r_board (
    seq NUMBER(5) PRIMARY KEY,
    title VARCHAR2(200),
    writer VARCHAR2(20),
    content VARCHAR2(2000),
    regdate DATE DEFAULT SYSDATE,
    cnt NUMBER(5) DEFAULT 0
);

INSERT INTO r_board (seq,title,writer,content) VALUES (1,'가입인사','관리자','잘 부탁드립니다...');

SELECT * FROM r_users;
SELECT * FROM r_board;

//휴지통 비우기
purge recyclebin;

commit;