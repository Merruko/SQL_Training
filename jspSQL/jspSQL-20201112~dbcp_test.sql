CREATE TABLE dbcp_test(
    name VARCHAR2(20) PRIMARY KEY,
    email VARCHAR2(30) NOT NULL
);

INSERT INTO dbcp_test VALUES('김대호', 'mrkim9427@naver.com');

COMMIT;

SELECT * FROM dbcp_test;

DESC dbcp_test;